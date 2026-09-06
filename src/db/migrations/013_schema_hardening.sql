-- ==============================================================================
-- ORION 1.0 — Migration 013: SCHEMA HARDENING
-- ==============================================================================
--
-- Rules that existed only in TypeScript, now enforced by the database, plus
-- documentation on the tables that had none.
--
-- The headline fix is updated_at. Every write path set it by hand, which means
-- any row touched by raw SQL, by the Supabase table editor, or by a code path
-- that forgot, silently kept a stale timestamp. A trigger now guarantees it.
--
-- Deliberately NOT added: format checks on leader_email / leader_phone /
-- institution / problem_statement. Those columns are NOT NULL but hold '' for
-- the teams imported from the registration spreadsheet, which carried no such
-- data. A regex check would reject every one of those rows.
--
-- Safe to re-run.
-- ------------------------------------------------------------------------------

-- 1. updated_at, enforced -----------------------------------------------------
create or replace function public.touch_updated_at()
returns trigger
language plpgsql
security invoker
set search_path = public, pg_temp
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists trg_teams_touch_updated_at on public.teams;
create trigger trg_teams_touch_updated_at
  before update on public.teams
  for each row execute function public.touch_updated_at();

drop trigger if exists trg_system_config_touch_updated_at on public.system_config;
create trigger trg_system_config_touch_updated_at
  before update on public.system_config
  for each row execute function public.touch_updated_at();

-- 2. Trigger functions run with invoker rights and are not RPC-callable -------
--    Migration 011 created these SECURITY DEFINER, which also published them at
--    /rest/v1/rpc/<name> for anon and authenticated. Triggers need neither.
create or replace function public.team_members_sync_team_name()
returns trigger
language plpgsql
security invoker
set search_path = public, pg_temp
as $$
begin
  select t.team_name into new.team_name from public.teams t where t.id = new.team_id;
  return new;
end;
$$;

create or replace function public.teams_propagate_team_name()
returns trigger
language plpgsql
security invoker
set search_path = public, pg_temp
as $$
begin
  update public.team_members
     set team_name = new.team_name
   where team_id = new.id
     and team_name is distinct from new.team_name;
  return null;
end;
$$;

revoke all on function public.team_members_sync_team_name() from public, anon, authenticated;
revoke all on function public.teams_propagate_team_name()   from public, anon, authenticated;
revoke all on function public.touch_updated_at()            from public, anon, authenticated;

-- 3. Value ranges -------------------------------------------------------------
alter table public.teams
  add constraint teams_registration_id_format
    check (registration_id ~ '^ORION-[A-Z0-9]+(-[0-9]+)?$'),
  add constraint teams_amount_non_negative
    check (amount >= 0),
  add constraint teams_round_1_score_range
    check (round_1_score is null or round_1_score between 0 and 50);

alter table public.payments
  add constraint payments_amount_positive check (amount > 0);

alter table public.submissions
  add constraint submissions_round_number_check  check (round_number in (1, 2)),
  add constraint submissions_file_size_positive  check (file_size > 0),
  add constraint submissions_version_positive    check (version >= 1);

alter table public.resubmission_requests
  add constraint resubmission_round_number_check check (round_number in (1, 2));

alter table public.password_resets
  add constraint password_resets_expiry_after_creation check (expires_at > created_at);

-- 4. Documentation ------------------------------------------------------------
comment on table public.payments is
  'One row per team (unique team_id) — submitPayment() upserts on conflict. utr_number is globally unique: the same bank reference cannot be claimed twice.';
comment on column public.payments.utr_number is 'Bank UTR. Globally unique — this is the anti-duplicate-payment control.';
comment on column public.payments.payer_upi  is 'UPI ID the fee was paid FROM. App-mandatory since migration 007; NULL on older rows.';

comment on table public.submissions is
  'Round deck uploads. ACCEPTED is the live deck the jury evaluates; SUPERSEDED is an earlier one kept for the audit trail. Never delete, supersede.';

comment on table public.resubmission_requests is
  'Round 1 re-upload queue. One approval is worth exactly one re-upload (status flips to USED). At most one PENDING/APPROVED request per team, enforced by idx_resub_one_open_per_team.';

comment on table public.suspicion_flags is
  'Automated duplicate / cross-team detection results.';
comment on column public.suspicion_flags.matched_team_id is
  'The OTHER team involved, stored as its registration_id (e.g. ORION-S0007) — NOT a uuid, despite the name. See serverStore.ts.';

comment on table public.audit_logs is
  'Append-only trail. team_name is a point-in-time snapshot, deliberately NOT synced, so the log still reads correctly after a rename or deletion (team_id goes NULL on delete).';

comment on table public.password_resets is
  'Only the SHA-256 of a reset token is stored, so a dump of this table yields no usable link. token_hash is unique and single-use via consumed_at. Deliberately policy-free: service role only.';

comment on table public.system_config is 'Singleton key/value runtime settings.';
