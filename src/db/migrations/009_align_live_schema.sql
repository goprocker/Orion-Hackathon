-- ==============================================================================
-- ORION 1.0 — Migration 009: REALIGN THE LIVE DATABASE WITH schema.sql
-- ==============================================================================
--
-- The production database had drifted badly from src/db/schema.sql: it was
-- created from an earlier draft, and migrations 001-008 were never applied to
-- it. Concretely, before this migration ran:
--
--   * teams used a lowercase status vocabulary ('pending', 'unpaid') that no
--     code path in the app ever reads or writes. Every status column was
--     therefore meaningless to TeamRecord in src/types/orion.ts.
--   * teams.amount defaulted to 0 instead of the flat 100 fee.
--   * There was not a single CHECK constraint anywhere in the schema, so any
--     mistyped status was accepted silently.
--   * team_members had neither the 1-6 slot check nor unique (team_id,
--     member_number), so a team could hold two "member 3" rows.
--   * public.resubmission_requests did not exist at all, though
--     TeamRecord.resubmission_requests reads it.
--   * payments had no unique on team_id, which makes submitPayment()'s upsert
--     onConflict:'team_id' fail with 42P10.
--   * password_resets.token_hash was not unique, so a reset token was not
--     guaranteed to be single-use.
--   * None of the section 8 indexes existed.
--
-- Safe to re-run.
-- ------------------------------------------------------------------------------

-- 1. Remap existing rows onto the app's status vocabulary --------------------
update public.teams set registration_status = case lower(registration_status)
  when 'pending'  then 'REGISTERED'
  when 'rejected' then 'REJECTED'
  else upper(registration_status) end;

update public.teams set payment_status = case lower(payment_status)
  when 'unpaid'   then 'NOT_SUBMITTED'
  when 'paid'     then 'VERIFIED'
  when 'pending'  then 'PENDING'
  when 'rejected' then 'REJECTED'
  else upper(payment_status) end;

update public.teams set round_1_status = case lower(round_1_status)
  when 'pending' then 'NOT_STARTED'
  else upper(round_1_status) end;

update public.teams set round_2_status = case lower(round_2_status)
  when 'pending' then 'LOCKED'
  when 'locked'  then 'LOCKED'
  else upper(round_2_status) end;

update public.teams set amount = 100 where amount = 0;

-- 2. Defaults and constraints -----------------------------------------------
alter table public.teams
  alter column registration_status set default 'REGISTERED',
  alter column payment_status      set default 'NOT_SUBMITTED',
  alter column round_1_status      set default 'NOT_STARTED',
  alter column round_2_status      set default 'LOCKED',
  alter column amount              set default 100;

alter table public.teams
  add constraint teams_registration_status_check
    check (registration_status in ('REGISTERED','PENDING','REJECTED')),
  add constraint teams_payment_status_check
    check (payment_status in ('NOT_SUBMITTED','PENDING','VERIFIED','REJECTED','RESUBMISSION_REQUIRED')),
  add constraint teams_round_1_status_check
    check (round_1_status in ('NOT_STARTED','SUBMISSION_OPEN','SUBMITTED','UNDER_REVIEW','SELECTED','NOT_SELECTED')),
  add constraint teams_round_2_status_check
    check (round_2_status in ('LOCKED','ACCESS_GRANTED','CONFIRMED_FINALIST'));

alter table public.team_members
  add constraint team_members_member_number_check
    check (member_number between 1 and 6),
  add constraint unique_team_member unique (team_id, member_number);

-- 3. Optional columns hold NULL ("unknown"), never '' ("known to be empty") --
update public.teams
   set department  = nullif(department, ''),
       year        = nullif(year, ''),
       admin_notes = nullif(admin_notes, '');

update public.team_members
   set member_email = nullif(member_email, ''),
       department   = nullif(department, ''),
       year         = nullif(year, '');

-- 4. Tables and uniqueness rules from migrations 001 / 004 / 005 -------------
create table if not exists public.resubmission_requests (
  id uuid default gen_random_uuid() primary key,
  team_id uuid references public.teams(id) on delete cascade not null,
  round_number integer not null default 1,
  reason text not null,
  status text not null default 'PENDING',
  review_notes text,
  reviewed_by text,
  reviewed_at timestamp with time zone,
  consumed_at timestamp with time zone,
  consumed_submission_id uuid references public.submissions(id) on delete set null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  constraint resubmission_requests_status_check
    check (status in ('PENDING','APPROVED','REJECTED','USED'))
);

create unique index if not exists idx_resub_one_open_per_team
  on public.resubmission_requests (team_id, round_number)
  where status in ('PENDING','APPROVED');

alter table public.resubmission_requests enable row level security;

alter table public.payments
  add constraint payments_team_id_key unique (team_id),
  add constraint payments_utr_number_key unique (utr_number),
  add constraint payments_status_check
    check (payment_status in ('PENDING','VERIFIED','REJECTED','RESUBMISSION_REQUIRED'));

alter table public.submissions
  add constraint submissions_status_check
    check (submission_status in ('SUBMITTED','ACCEPTED','SUPERSEDED','UNDER_REVIEW','EVALUATED'));

alter table public.password_resets
  add constraint password_resets_token_hash_key unique (token_hash);

-- 5. Section 8 indexes -------------------------------------------------------
create index if not exists idx_teams_registration_id  on public.teams(registration_id);
create index if not exists idx_teams_leader_email     on public.teams(leader_email);
create index if not exists idx_teams_leader_phone     on public.teams(leader_phone);
create index if not exists idx_teams_payment_status   on public.teams(payment_status);
create index if not exists idx_teams_round_1_status   on public.teams(round_1_status);
create index if not exists idx_teams_round_2_status   on public.teams(round_2_status);
create index if not exists idx_team_members_team_id   on public.team_members(team_id);
create index if not exists idx_team_members_email     on public.team_members(member_email);
create index if not exists idx_team_members_phone     on public.team_members(member_phone);
create index if not exists idx_payments_team_id       on public.payments(team_id);
create index if not exists idx_payments_utr           on public.payments(utr_number);
create index if not exists idx_submissions_team_id    on public.submissions(team_id);
create index if not exists idx_submissions_status     on public.submissions(submission_status);
create index if not exists idx_resub_team_id          on public.resubmission_requests(team_id);
create index if not exists idx_resub_status           on public.resubmission_requests(status);
create index if not exists idx_audit_logs_team_id     on public.audit_logs(team_id);
create index if not exists idx_suspicion_flags_team_id    on public.suspicion_flags(team_id);
create index if not exists idx_password_resets_token_hash on public.password_resets(token_hash);
create index if not exists idx_password_resets_team_id    on public.password_resets(team_id);
create index if not exists idx_password_resets_expires_at on public.password_resets(expires_at);
