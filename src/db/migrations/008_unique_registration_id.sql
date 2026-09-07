-- ==============================================================================
-- ORION 1.0 — Migration 008: UNIQUE registration_id (duplicate teams were
--                            undeletable and unverifiable)
-- ==============================================================================
--
-- WHY
--
-- Registration IDs are generated sequentially by scanning existing teams for
-- the highest number and adding one. Two near-simultaneous registrations can
-- compute the same "next" number. The insert code retries on Postgres error
-- 23505 (unique violation) — but that error is only ever raised if the live
-- table actually HAS a unique constraint on registration_id. schema.sql
-- declares one, but a live table created before it will happily accept two
-- teams with the same ID.
--
-- Once a duplicate exists, everything keyed on that registration ID breaks:
-- getTeam() used maybeSingle(), which ERRORS when more than one row matches,
-- so admin delete/verify/resend and even the team's own portal login all
-- failed with "Team not found". (The code side is fixed alongside this
-- migration: getTeam now deterministically takes the oldest row and logs the
-- duplicate; the admin console deletes by UUID so each row can be purged.)
--
-- ------------------------------------------------------------------------------
-- 1. Rename existing duplicates rather than delete them. Deleting a row that
--    represents a real registration (someone may have paid on it) is not a
--    decision a migration should make. All but the OLDEST row per ID get a
--    "-DUP2"/"-DUP3" suffix so they become visible, actionable rows in the
--    admin console — review them there, refund/merge/purge as appropriate.
--    Idempotent: rerunning finds no rn > 1 rows.
-- ------------------------------------------------------------------------------
with ranked as (
  select id,
         registration_id,
         row_number() over (
           partition by registration_id
           order by created_at asc, id asc
         ) as rn
  from public.teams
)
update public.teams t
   set registration_id = ranked.registration_id || '-DUP' || ranked.rn
  from ranked
 where ranked.id = t.id
   and ranked.rn > 1;

-- ------------------------------------------------------------------------------
-- 2. Add the unique constraint the collision-retry loop has always assumed.
--    Idempotent: swallowed if a constraint of this name already exists.
-- ------------------------------------------------------------------------------
do $$
begin
  alter table public.teams
    add constraint teams_registration_id_key unique (registration_id);
exception
  when duplicate_object then null;
  when duplicate_table  then null; -- some PG versions raise this for constraints
end $$;

-- ------------------------------------------------------------------------------
-- 3. Verify: both should return zero rows / one constraint.
-- ------------------------------------------------------------------------------
-- select registration_id, count(*) from public.teams
--  group by 1 having count(*) > 1;
--
-- select conname from pg_constraint
--  where conrelid = 'public.teams'::regclass
--    and conname  = 'teams_registration_id_key';
--
-- Afterwards, search the admin console for "-DUP" to review the renamed rows.
-- ==============================================================================
