-- ==============================================================================
-- ORION 1.0 — Migration 002: CLOSE THE PUBLIC DATABASE
-- ==============================================================================
--
--  ####  READ THIS BEFORE RUNNING  ####
--
--  DO NOT RUN THIS UNTIL `SUPABASE_SERVICE_ROLE_KEY` IS SET IN YOUR DEPLOYMENT
--  ENVIRONMENT (Vercel → Settings → Environment Variables) AND THE APP HAS BEEN
--  REDEPLOYED. Running it first will take the live site down, because the app
--  would still be talking to the database as `anon`, which this migration
--  strips of all access.
--
--  Order of operations:
--    1. Add SUPABASE_SERVICE_ROLE_KEY to the deployment env (no NEXT_PUBLIC_).
--    2. Redeploy.
--    3. Confirm the site still loads and /admin lists teams.
--    4. Run this migration.
--    5. Rotate the anon key in the Supabase dashboard (the old one is public).
--
-- ------------------------------------------------------------------------------
-- WHY
--
-- Every table carried a `using (true)` policy, and the app shipped the anon key
-- to the browser via NEXT_PUBLIC_SUPABASE_ANON_KEY. Anyone who viewed source
-- could call PostgREST directly and:
--
--   GET    /rest/v1/teams?select=*        -> every access_token, email, phone
--   PATCH  /rest/v1/teams?id=eq.<uuid>    -> self-verify payment, edit any score
--   DELETE /rest/v1/submissions           -> destroy every uploaded deck
--   POST   /rest/v1/resubmission_requests -> forge an APPROVED re-upload
--
-- The application only ever reaches Supabase from server code (serverStore and
-- three API routes), so removing anon access costs no functionality. The service
-- role bypasses RLS entirely; authorisation stays in the API routes, which is
-- where it was actually being enforced all along.
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. Drop every permissive policy.
--
--    With RLS enabled and zero policies, `anon` and `authenticated` are denied
--    by default. The `service_role` key bypasses RLS and is unaffected.
-- ------------------------------------------------------------------------------
drop policy if exists "Allow public squad team inserts"            on public.teams;
drop policy if exists "Allow public team read"                     on public.teams;
drop policy if exists "Allow public team updates"                  on public.teams;
drop policy if exists "Allow public team member inserts"           on public.team_members;
drop policy if exists "Allow public team members read"             on public.team_members;
drop policy if exists "Allow public payment read/write"            on public.payments;
drop policy if exists "Allow public submission read/write"         on public.submissions;
drop policy if exists "Allow public resubmission request read/write" on public.resubmission_requests;
drop policy if exists "Allow public audit log read/write"          on public.audit_logs;
drop policy if exists "Allow public suspicion flags read/write"    on public.suspicion_flags;
drop policy if exists "Allow public system config read"            on public.system_config;

-- ------------------------------------------------------------------------------
-- 2. Make sure RLS is on everywhere. Without this, dropping the policies would
--    have the opposite of the intended effect on any table where it was off.
-- ------------------------------------------------------------------------------
alter table public.teams                  enable row level security;
alter table public.team_members           enable row level security;
alter table public.payments               enable row level security;
alter table public.submissions            enable row level security;
alter table public.resubmission_requests  enable row level security;
alter table public.suspicion_flags        enable row level security;
alter table public.audit_logs             enable row level security;
alter table public.system_config          enable row level security;

-- Belt and braces: force RLS so even the table owner is subject to it. The
-- service role still bypasses this.
alter table public.teams                  force row level security;
alter table public.team_members           force row level security;
alter table public.payments               force row level security;
alter table public.submissions            force row level security;
alter table public.resubmission_requests  force row level security;
alter table public.suspicion_flags        force row level security;
alter table public.audit_logs             force row level security;
alter table public.system_config          force row level security;

-- ------------------------------------------------------------------------------
-- 3. Revoke the table grants underneath RLS as well. RLS filters rows; these
--    grants control whether the role may touch the table at all. Defence in
--    depth in case a policy is ever added back carelessly.
-- ------------------------------------------------------------------------------
revoke all on all tables    in schema public from anon;
revoke all on all sequences in schema public from anon;
revoke all on all functions in schema public from anon;

-- ------------------------------------------------------------------------------
-- 4. Verify. Both queries should return ZERO rows once this has run.
--    Run them manually after applying.
-- ------------------------------------------------------------------------------
-- select tablename, policyname from pg_policies where schemaname = 'public';
--
-- select table_name, privilege_type
--   from information_schema.role_table_grants
--  where grantee = 'anon' and table_schema = 'public';
