-- ==============================================================================
-- ORION 1.0 — Migration 004: SELF-SERVICE PASSCODE RESET
-- ==============================================================================
--
-- WHY
--
-- A team leader who lost their portal passcode had no way back in on their own.
-- Every recovery path went through an organiser reading the passcode out of the
-- admin console, which means the secret travels over WhatsApp/DM and is only as
-- trustworthy as the organiser's ability to verify who is asking. A Team ID is
-- printed on every confirmation email and is not secret, so "I am ORION-2026-
-- 0147, what is my passcode?" was an answerable question for anyone.
--
-- This table backs a reset flow that proves control of the REGISTERED LEADER
-- EMAIL before anything changes, so the Team ID alone is never enough.
--
-- WHAT IS STORED
--
-- Only the SHA-256 of the reset token. The raw token exists in exactly two
-- places: the URL in the email we send, and the request that redeems it. A
-- dump of this table therefore yields no usable reset link — the same reason
-- `access_token` being readable is a problem this table does not repeat.
-- ==============================================================================

create table if not exists public.password_resets (
  id uuid default gen_random_uuid() primary key,
  team_id uuid references public.teams(id) on delete cascade not null,

  -- SHA-256 hex of the raw token. Unique so a (vanishingly unlikely) collision
  -- surfaces as an insert error rather than an ambiguous lookup.
  token_hash text not null unique,

  expires_at timestamp with time zone not null,

  -- Set the moment the token is redeemed. The redeem path updates
  -- `where consumed_at is null`, so the database itself enforces single use
  -- even if two requests race.
  consumed_at timestamp with time zone,

  -- Coarse audit trail. Never holds the token or any passcode.
  requested_ip text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- The redeem path looks a token up by hash on every attempt.
create index if not exists idx_password_resets_token_hash on public.password_resets(token_hash);
create index if not exists idx_password_resets_team_id on public.password_resets(team_id);

-- Sweeping expired rows is a cheap range scan with this.
create index if not exists idx_password_resets_expires_at on public.password_resets(expires_at);

-- ------------------------------------------------------------------------------
-- RLS: same posture as migration 002 — enabled, forced, and deliberately
-- POLICY-FREE, so `anon` and `authenticated` are denied by default. Only the
-- service role (which bypasses RLS) touches this table, from server code.
--
-- This matters more here than elsewhere: read access to this table plus a known
-- Team ID would be a standing account takeover.
-- ------------------------------------------------------------------------------
alter table public.password_resets enable row level security;
alter table public.password_resets force  row level security;

revoke all on public.password_resets from anon;

-- ------------------------------------------------------------------------------
-- Verify (should return zero rows):
--   select policyname from pg_policies
--    where schemaname = 'public' and tablename = 'password_resets';
-- ------------------------------------------------------------------------------
