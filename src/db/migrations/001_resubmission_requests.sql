-- ==============================================================================
-- ORION 1.0 — Migration 001: PPT re-upload request workflow
-- ==============================================================================
--
-- Run this once against the live Supabase project (SQL Editor). It is
-- idempotent, so re-running it is harmless.
--
-- What it does:
--   1. Adds the submission columns the app already writes but that were never
--      in schema.sql (project_url / repo_url / demo_url, teams.evaluation_scores).
--   2. Adds the resubmission_requests table backing the request -> admin
--      approval -> one re-upload flow.
--   3. Backfills submission_status so each team's live deck is ACCEPTED and
--      superseded ones are marked as such.
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. Columns the application writes but that were missing from the schema.
--    Without these, submission inserts silently fail on a fresh database.
-- ------------------------------------------------------------------------------
alter table public.submissions add column if not exists project_url text;
alter table public.submissions add column if not exists repo_url text;
alter table public.submissions add column if not exists demo_url text;

alter table public.teams add column if not exists evaluation_scores jsonb;

-- ------------------------------------------------------------------------------
-- 2. Re-upload request queue
--
--    A team's FIRST deck is auto-accepted once payment is VERIFIED. Replacing it
--    requires a request that an organiser approves, and each approval is worth
--    exactly one re-upload (status flips to USED when spent).
-- ------------------------------------------------------------------------------
create table if not exists public.resubmission_requests (
  id uuid default gen_random_uuid() primary key,
  team_id uuid references public.teams(id) on delete cascade not null,
  round_number integer not null default 1,
  reason text not null,
  status text not null default 'PENDING', -- 'PENDING', 'APPROVED', 'REJECTED', 'USED'
  review_notes text,
  reviewed_by text,
  reviewed_at timestamp with time zone,
  consumed_at timestamp with time zone,
  consumed_submission_id uuid references public.submissions(id) on delete set null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  constraint resubmission_requests_status_check
    check (status in ('PENDING', 'APPROVED', 'REJECTED', 'USED'))
);

-- A team may only have one request in flight at a time. Enforced in the
-- database so a double-submit from the portal cannot create two open requests.
create unique index if not exists idx_resub_one_open_per_team
  on public.resubmission_requests (team_id, round_number)
  where status in ('PENDING', 'APPROVED');

create index if not exists idx_resub_team_id on public.resubmission_requests (team_id);
create index if not exists idx_resub_status on public.resubmission_requests (status);

alter table public.resubmission_requests enable row level security;

drop policy if exists "Allow public resubmission request read/write" on public.resubmission_requests;
create policy "Allow public resubmission request read/write"
  on public.resubmission_requests for all using (true);

-- ------------------------------------------------------------------------------
-- 3. Submission status vocabulary
--
--    ACCEPTED   = the live deck the jury evaluates
--    SUPERSEDED = replaced by an approved re-upload, kept for the audit trail
-- ------------------------------------------------------------------------------
alter table public.submissions drop constraint if exists submissions_status_check;
alter table public.submissions add constraint submissions_status_check
  check (submission_status in ('SUBMITTED', 'ACCEPTED', 'SUPERSEDED', 'UNDER_REVIEW', 'EVALUATED'));

-- Backfill: for every team, the highest-version round 1 deck becomes ACCEPTED
-- and every earlier one becomes SUPERSEDED. Rows already moved on to
-- UNDER_REVIEW or EVALUATED are left alone.
with ranked as (
  select
    id,
    row_number() over (partition by team_id, round_number order by version desc, submitted_at desc) as rn
  from public.submissions
  where submission_status = 'SUBMITTED'
)
update public.submissions s
set submission_status = case when r.rn = 1 then 'ACCEPTED' else 'SUPERSEDED' end
from ranked r
where s.id = r.id;

create index if not exists idx_submissions_status on public.submissions (submission_status);
