-- ==============================================================================
-- 024 — Backfill leader_email from the form-responses PDF, and prune the
--       schema: duplicate indexes, a missing FK index, stale table comments
-- ==============================================================================
--
-- Source: "ORION 1.0  - Form responses 1 (2).pdf" (6 pages, 291 rows), the
-- Google Form export rendered as a table. Parsed by column x-position rather
-- than whitespace, because names and institutions contain spaces and the export
-- quotes nothing.
--
-- The Team IDs reconciled exactly: 291 PDF rows, 291 teams, none orphaned in
-- either direction. Of the 31 teams that already had a leader_email, all 31
-- matched the PDF character for character and none conflicted — which is what
-- justified trusting the extraction for the remaining 257.
--
-- The addresses themselves are not reproduced here: this file is committed to a
-- public repository and they are participants' personal email. The UPDATE ran
-- against a staging table (_pdf_rows) loaded from the parsed PDF and dropped
-- afterwards; re-running the backfill means re-parsing the PDF, not replaying
-- this file. Recorded here for the audit trail.
--
--   before: 31 of 291 teams had a leader_email
--   after : 289 of 291
--
-- Two remain blank, both participant typos in the form itself rather than
-- extraction failures, left as-is rather than guessed at:
--
--   ORION-S0009  CodeNova         psaditya62@gmail.co     -- ".co", no "m"
--   ORION-S0227  Tech innovator   pragadeshwaran231@@...  -- doubled "@"
--
-- One was repaired by hand: ORION-S0042 THAMIZH ARIGNARGAL extracted as
-- "...@citchennai.neEtlectronics" because the department text ("Electronics and
-- communication engineering") overlaps the email cell in the render and
-- interleaves with it. The address is "...@citchennai.net", corroborated by the
-- two other citchennai.net addresses in the same file.
--
-- teams.username and teams.access_token are untouched; the credential hash is
-- identical before and after.

begin;

-- ── 1. Duplicate indexes ──────────────────────────────────────────────────────
-- Each of these covers exactly the column already covered by a UNIQUE
-- constraint's index, so it can serve no query the unique index cannot. They
-- only cost write amplification and space.
drop index if exists public.idx_teams_registration_id;      -- = teams_registration_id_key
drop index if exists public.idx_payments_team_id;           -- = payments_team_id_key
drop index if exists public.idx_payments_utr;               -- = payments_utr_number_key
drop index if exists public.idx_password_resets_token_hash; -- = password_resets_token_hash_key

-- Deliberately KEPT, though the linter reports them as never used:
--   idx_teams_round_1_status, idx_submissions_status, idx_resub_status,
--   idx_password_resets_expires_at
-- submissions and resubmission_requests are empty and round 1 has not opened,
-- so a zero scan count is a statement about the event calendar, not the index.
--
-- Also kept: idx_teams_username_passcode. It reports zero scans because it
-- exists to ENFORCE that (username, access_token) is unique, not to be read.

-- ── 2. Missing foreign-key index ──────────────────────────────────────────────
-- resubmission_requests.consumed_submission_id had no covering index, so every
-- delete or update of a submission had to scan the whole child table.
create index if not exists idx_resub_consumed_submission
  on public.resubmission_requests (consumed_submission_id);

-- ── 3. Stale comments ─────────────────────────────────────────────────────────
-- Migration 010 documented the leader as living in team_members slot 1. That
-- stopped being true in 018 and 022, which deleted exactly those rows so the
-- leader would not render twice in the portal roster and the admin CSV.
-- The comments outlived the contract, and they are what schema browsers and
-- list_tables show first, so they are the most expensive kind of thing to leave
-- wrong: a 2026-09-08 audit read them, concluded 291 rosters were corrupt, and
-- came close to re-inserting every leader row that 018 and 022 had removed.
comment on table public.teams is
  'One row per registered squad. teams.leader_name is the ONLY record of Participant 1 — the leader is deliberately NOT in team_members (018, 022), so a roster without its leader is correct.';

comment on column public.teams.leader_name is
  'Squad leader / Participant 1. Canonical here and nowhere else; never mirror into team_members.';

comment on table public.team_members is
  'The squad MINUS its leader, 0-5 people, numbered contiguously from 1. A solo entrant has no rows here at all. The leader lives in teams.leader_name.';

comment on column public.team_members.member_number is
  'Roster slot, contiguous from 1. Slot 1 is the first NON-leader member, not the leader.';

comment on column public.teams.leader_email is
  'Backfilled from the Google Form export in 024. Empty string, not null, where the participant mistyped it.';

commit;

-- ── 4. Planner statistics ─────────────────────────────────────────────────────
-- No table had ever been ANALYZEd explicitly; the roster churn on 2026-09-08
-- rewrote most of team_members. Cannot run inside the transaction above.
analyze public.teams;
analyze public.team_members;
analyze public.payments;
