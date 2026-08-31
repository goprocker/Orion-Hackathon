-- ==============================================================================
-- ORION 1.0 - PostgreSQL Relational Database Schema (Supabase)
-- 24-Hour National Hackathon • Microsoft Club SIST
-- ==============================================================================

-- 1. Create Teams Table
create table if not exists public.teams (
  id uuid default gen_random_uuid() primary key,
  registration_id text unique not null, -- Format: ORION-2026-XXXX
  team_name text not null,
  leader_name text not null,
  leader_phone text not null,
  leader_email text not null,
  institution text not null,
  department text,
  year text,
  problem_statement text not null,
  access_token text not null, -- Team Portal Access Secret
  payment_status text not null default 'NOT_SUBMITTED', -- 'NOT_SUBMITTED', 'PENDING', 'VERIFIED', 'REJECTED', 'RESUBMISSION_REQUIRED'
  amount integer not null default 100,
  registration_status text not null default 'REGISTERED', -- 'REGISTERED', 'PENDING', 'REJECTED'
  round_1_status text not null default 'NOT_STARTED', -- 'NOT_STARTED', 'SUBMISSION_OPEN', 'SUBMITTED', 'UNDER_REVIEW', 'SELECTED', 'NOT_SELECTED'
  round_2_status text not null default 'LOCKED', -- 'LOCKED', 'ACCESS_GRANTED', 'CONFIRMED_FINALIST'
  round_1_score numeric(5,2),
  evaluation_scores jsonb,
  admin_notes text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 2. Create Team Members Table (Flexible Squads: 1-5 Members + Leader)
create table if not exists public.team_members (
  id uuid default gen_random_uuid() primary key,
  team_id uuid references public.teams(id) on delete cascade not null,
  member_number integer not null check (member_number between 1 and 6),
  member_name text not null,
  member_email text,
  member_phone text not null,
  department text,
  year text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  constraint unique_team_member unique (team_id, member_number)
);

-- 3. Create Payments Table (Strict Database Unique Constraint on UTR)
create table if not exists public.payments (
  id uuid default gen_random_uuid() primary key,
  team_id uuid references public.teams(id) on delete cascade not null,
  utr_number text unique not null, -- Enforced Database Level Uniqueness
  payer_name text not null,
  amount integer not null default 100,
  payment_status text not null default 'PENDING', -- 'PENDING', 'VERIFIED', 'REJECTED', 'RESUBMISSION_REQUIRED'
  notes text,
  rejection_reason text,
  submitted_at timestamp with time zone default timezone('utc'::text, now()) not null,
  verified_at timestamp with time zone,
  verified_by text
);

-- 4. Create Round Submissions Table (Native PPT / PDF File Reference Store)
--    ACCEPTED   = the live deck the jury evaluates (first upload is auto-accepted
--                 once payment is VERIFIED)
--    SUPERSEDED = replaced by an approved re-upload; kept for the audit trail
create table if not exists public.submissions (
  id uuid default gen_random_uuid() primary key,
  team_id uuid references public.teams(id) on delete cascade not null,
  round_number integer not null default 1,
  file_url text not null,
  original_filename text not null,
  file_size bigint not null,
  file_type text not null,
  project_url text,
  repo_url text,
  demo_url text,
  version integer not null default 1,
  submission_status text not null default 'SUBMITTED',
  submitted_at timestamp with time zone default timezone('utc'::text, now()) not null,
  review_notes text,
  constraint submissions_status_check
    check (submission_status in ('SUBMITTED', 'ACCEPTED', 'SUPERSEDED', 'UNDER_REVIEW', 'EVALUATED'))
);

-- 4b. Create Round 1 Re-upload Request Queue
--     A team's first deck is auto-accepted on payment verification. Replacing it
--     needs an organiser-approved request, and each approval is worth exactly
--     one re-upload (status flips to USED when spent).
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

-- Only one request may be in flight per team, enforced in the database so a
-- double-submit from the portal cannot open two.
create unique index if not exists idx_resub_one_open_per_team
  on public.resubmission_requests (team_id, round_number)
  where status in ('PENDING', 'APPROVED');

-- 5. Create Suspicion / Duplicate Flags Table
create table if not exists public.suspicion_flags (
  id uuid default gen_random_uuid() primary key,
  team_id uuid references public.teams(id) on delete cascade not null,
  flag_type text not null, -- 'DUPLICATE_EMAIL', 'DUPLICATE_PHONE', 'DUPLICATE_UTR', 'CROSS_TEAM_PARTICIPANT'
  description text not null,
  severity text not null default 'MEDIUM', -- 'LOW', 'MEDIUM', 'HIGH'
  matched_value text not null,
  matched_team_id text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 6. Create Audit Logs Table
create table if not exists public.audit_logs (
  id uuid default gen_random_uuid() primary key,
  team_id uuid references public.teams(id) on delete set null,
  team_name text,
  action text not null,
  actor text not null default 'Admin',
  details text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 7. Create System Configuration Table
create table if not exists public.system_config (
  key text primary key,
  value jsonb not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 8. Performance & Search Indexes
create index if not exists idx_teams_registration_id on public.teams(registration_id);
create index if not exists idx_teams_leader_email on public.teams(leader_email);
create index if not exists idx_teams_leader_phone on public.teams(leader_phone);
create index if not exists idx_teams_payment_status on public.teams(payment_status);
create index if not exists idx_teams_round_1_status on public.teams(round_1_status);
create index if not exists idx_teams_round_2_status on public.teams(round_2_status);
create index if not exists idx_team_members_team_id on public.team_members(team_id);
create index if not exists idx_team_members_email on public.team_members(member_email);
create index if not exists idx_team_members_phone on public.team_members(member_phone);
create index if not exists idx_payments_team_id on public.payments(team_id);
create index if not exists idx_payments_utr on public.payments(utr_number);
create index if not exists idx_submissions_team_id on public.submissions(team_id);
create index if not exists idx_submissions_status on public.submissions(submission_status);
create index if not exists idx_resub_team_id on public.resubmission_requests(team_id);
create index if not exists idx_resub_status on public.resubmission_requests(status);
create index if not exists idx_audit_logs_team_id on public.audit_logs(team_id);
create index if not exists idx_suspicion_flags_team_id on public.suspicion_flags(team_id);

-- 9. Row Level Security (RLS)
alter table public.teams enable row level security;
alter table public.team_members enable row level security;
alter table public.payments enable row level security;
alter table public.submissions enable row level security;
alter table public.resubmission_requests enable row level security;
alter table public.suspicion_flags enable row level security;
alter table public.audit_logs enable row level security;
alter table public.system_config enable row level security;

-- Public read / write policies
create policy "Allow public squad team inserts" on public.teams for insert with check (true);
create policy "Allow public team member inserts" on public.team_members for insert with check (true);
create policy "Allow public team read" on public.teams for select using (true);
create policy "Allow public team members read" on public.team_members for select using (true);
create policy "Allow public team updates" on public.teams for update using (true);
create policy "Allow public payment read/write" on public.payments for all using (true);
create policy "Allow public submission read/write" on public.submissions for all using (true);
create policy "Allow public resubmission request read/write" on public.resubmission_requests for all using (true);
create policy "Allow public audit log read/write" on public.audit_logs for all using (true);
create policy "Allow public suspicion flags read/write" on public.suspicion_flags for all using (true);
create policy "Allow public system config read" on public.system_config for select using (true);
