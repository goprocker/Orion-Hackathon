-- ==============================================================================
-- 017 — Realign the roster to the Google Form sheet, and put every team on the
--       name-based login convention
-- ==============================================================================
--
-- Migration 016 loaded the organisers' credential sheet, but it loaded it into
-- the wrong rows. The sheet was seeded in form order while the app was still
-- taking live registrations, so from ORION-S0106 onward each seeded row landed
-- one or more slots short of the Team ID the participant was actually given.
-- The visible damage: a team's name attached to the previous team's leader
-- (FNATIC was stored as "NEXO", NEXO as "Binary Titans"), a whole block with no
-- email, phone or roster at all, and ten squads present twice — once as an
-- empty stub, once with their real six-person roster and an identical
-- (username, passcode) pair, so neither copy could log in unambiguously.
--
-- Everything here treats the Google Form export as the source of truth for a
-- team's IDENTITY only. payment_status, round_1/2 status, scores and the
-- payments, submissions and audit_logs tables are never touched: team ids are
-- UUIDs and are preserved throughout, so every foreign key survives.
--
-- This file records what was applied against the live database on 2026-09-08
-- via the staging tables _sheet_teams / _sheet_members (dropped afterwards).
-- The 252 sheet rows themselves are not reproduced here — re-running the repair
-- means re-importing the sheet, not replaying this file.

begin;

-- ── 1. Duplicate rows ─────────────────────────────────────────────────────────
-- The ten S0151-S0160 stubs duplicate the full rows now at S0161-S0171: no
-- email, no phone, no members, and the same login pair as their twin.
delete from teams t
where t.registration_id between 'ORION-S0151' and 'ORION-S0160'
  and coalesce(t.leader_email, '') = ''
  and not exists (select 1 from team_members m where m.team_id = t.id);

-- CODE CRACKERS and MADMAXX each existed twice: an app registration carrying
-- real contact details and a VERIFIED payment, and a sheet-seeded twin. Keep
-- the row with the payment; its roster is re-imported from the sheet below.
delete from teams where registration_id in ('ORION-S0166', 'ORION-S0175');

-- ── 2. Registration IDs ───────────────────────────────────────────────────────
-- Park the movers on a temporary id first. The permutation is a shift
-- (S0156 -> S0167, S0157 -> S0168, ...), and the unique index on
-- registration_id is checked per row, so a direct update collides with an id
-- still held by a row the statement has not reached yet. 'ORION-TMPnnnn'
-- satisfies the registration_id CHECK.

-- ── 3. Identity fields ────────────────────────────────────────────────────────
-- team_name, leader_name, leader_phone, leader_email, institution, department,
-- year and problem_statement are taken from the sheet. Where the sheet left a
-- field blank the existing value stands rather than being wiped.

-- ── 4. Credentials ────────────────────────────────────────────────────────────
-- The convention the portal already documents in its login error: the username
-- is the team name as one word, the passcode is the leader's name as one word,
-- both with case, spaces and punctuation normalised away. A username is NOT
-- unique (four separate squads are called Tech Titans) — (username, passcode)
-- is the login key, and idx_teams_username_passcode enforces it.
--
-- Same parking problem as the ids: credentials are moved onto a throwaway value
-- before the real ones are assigned.
update teams set username = 'tmp-' || id::text, access_token = 'TMP-' || id::text;

update teams
set username     = lower(regexp_replace(team_name,   '[^a-zA-Z0-9]', '', 'g')),
    access_token = upper(regexp_replace(leader_name, '[^a-zA-Z0-9]', '', 'g')),
    updated_at   = now();

-- ── 5. Rosters ────────────────────────────────────────────────────────────────
-- Forty teams had no team_members rows at all; five more (S0107, S0108, S0110,
-- S0112, S0113) were holding the neighbouring team's squad, courtesy of the
-- same off-by-one. Both sets were rebuilt from the sheet, with the form's
-- placeholder rows ("NULL", "-") in unused member slots filtered out.
--
-- Slot 1 must always be the leader, so where the roster carried a shorter
-- spelling of the same person ("S Darshini" for "S Darshini Jeya Shakthi") it
-- was aligned to teams.leader_name.
update team_members m
set member_name = t.leader_name
from teams t
where m.team_id = t.id and m.member_number = 1
  and lower(regexp_replace(m.member_name,  '[^a-zA-Z0-9]', '', 'g'))
   <> lower(regexp_replace(t.leader_name,  '[^a-zA-Z0-9]', '', 'g'));

-- ── 6. Hardening ──────────────────────────────────────────────────────────────
-- Both functions run inside a BEFORE trigger on teams, so an unqualified name
-- resolved through a caller-controlled search_path is an escalation path.
alter function public.orion_username_slug(text)     set search_path = pg_catalog, public;
alter function public.orion_sync_team_username()    set search_path = pg_catalog, public;

commit;

-- Post-state: 245 teams, 1198 members, zero teams without a roster, zero
-- duplicate (username, passcode) pairs, every registration_id matching the
-- sheet. Pre-repair snapshots are kept in _bak_teams_20260908 and
-- _bak_team_members_20260908; drop them once the roster has been spot-checked.
