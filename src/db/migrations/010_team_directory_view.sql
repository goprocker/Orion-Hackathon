-- ==============================================================================
-- ORION 1.0 — Migration 010: READABLE TEAM DIRECTORY
-- ==============================================================================
--
-- Reading the roster meant joining teams to team_members by hand every time,
-- and the schema carried no documentation of what its status columns accept.
-- This migration adds both: one row per team in public.team_directory, and
-- COMMENTs so the tables explain themselves in the Supabase table editor.
--
-- Safe to re-run.
-- ------------------------------------------------------------------------------

-- security_invoker = on: the view inherits the caller's RLS, so it cannot be
-- used to read around the policy-free lockdown from migration 002.
-- access_token is deliberately absent — it is the portal login secret.
create or replace view public.team_directory
with (security_invoker = on) as
select
  t.registration_id,
  t.team_name,
  t.leader_name,
  nullif(t.leader_email, '') as leader_email,
  nullif(t.leader_phone, '') as leader_phone,
  nullif(t.institution, '')  as institution,
  t.department,
  t.year,
  nullif(t.problem_statement, '') as problem_statement,
  count(m.id)                                              as member_count,
  string_agg(m.member_name, ', ' order by m.member_number)  as members,
  array_agg(m.member_name order by m.member_number)         as member_names,
  t.registration_status,
  t.payment_status,
  t.amount,
  t.round_1_status,
  t.round_2_status,
  t.round_1_score,
  t.created_at,
  t.id as team_id
from public.teams t
left join public.team_members m on m.team_id = t.id
group by t.id
order by t.registration_id;

comment on view public.team_directory is
  'Human-readable roster: one row per team with leader, member count and full member list. Excludes access_token.';

-- ---- Self-documenting schema ------------------------------------------------
comment on table public.teams is
  'One row per registered squad. The leader lives here AND as team_members slot 1 — both are written by the registration flow, keep them in sync.';

comment on column public.teams.registration_id is 'Public team ID shown to participants, e.g. ORION-S0001. Unique.';
comment on column public.teams.leader_name  is 'Squad leader. Also stored as team_members.member_number = 1.';
comment on column public.teams.access_token is 'SECRET: team portal passcode. Never expose in a view, API response or export.';
comment on column public.teams.amount       is 'Registration fee owed, in INR. Flat 100.';
comment on column public.teams.registration_status is 'REGISTERED | PENDING | REJECTED';
comment on column public.teams.payment_status      is 'NOT_SUBMITTED | PENDING | VERIFIED | REJECTED | RESUBMISSION_REQUIRED';
comment on column public.teams.round_1_status      is 'NOT_STARTED | SUBMISSION_OPEN | SUBMITTED | UNDER_REVIEW | SELECTED | NOT_SELECTED';
comment on column public.teams.round_2_status      is 'LOCKED | ACCESS_GRANTED | CONFIRMED_FINALIST';
comment on column public.teams.round_1_score       is 'Jury score out of 50. NULL until evaluated.';
comment on column public.teams.evaluation_scores   is 'Per-criterion jury breakdown (EvaluationScores in src/types/orion.ts).';

comment on table public.team_members is
  'Squad roster, 1-6 people. Slot 1 is the leader and duplicates teams.leader_name. Unique per (team_id, member_number).';
comment on column public.team_members.member_number is 'Roster slot 1-6. Slot 1 is always the leader.';
comment on column public.team_members.member_email  is 'Optional. NULL when not collected.';
