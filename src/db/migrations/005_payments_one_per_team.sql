-- ==============================================================================
-- ORION 1.0 — Migration 005: ONE PAYMENT ROW PER TEAM
-- ==============================================================================
--
--  ####  THIS FIXES A LIVE, USER-FACING FAILURE. APPLY IT.  ####
--
-- WHY
--
-- serverStore.submitPayment() writes the payment with:
--
--     .upsert({ ... }, { onConflict: 'team_id' })
--
-- ON CONFLICT requires a UNIQUE (or exclusion) constraint matching its target.
-- payments.team_id only ever had a plain, non-unique index:
--
--     create index if not exists idx_payments_team_id on public.payments(team_id);
--
-- So Postgres rejected every one of these with:
--
--     42P10: there is no unique or exclusion constraint matching the
--            ON CONFLICT specification
--
-- Which meant that on any Supabase-backed deployment, EVERY payment submission
-- failed. The old code logged that error and carried on regardless: it marked
-- the team PENDING, wrote an audit row claiming the UTR had been submitted, and
-- then fell through to the local JSON file store, which does not exist on
-- serverless. The participant — who had genuinely paid by UPI — got
-- "Team record not found locally.", and the organisers got a team stuck at
-- PENDING with no payment row to verify.
--
-- One payment row per team is what the rest of the code already assumes:
-- getTeam() reads payments with .maybeSingle(), and getAdminOverview() keys
-- them into a Map by team_id. This constraint makes that assumption true.
--
-- ------------------------------------------------------------------------------
-- BEFORE YOU RUN IT: look at what you have.
--
-- Because the upsert never succeeded, most deployments will have no duplicates
-- and step 1 below will delete nothing. Check first:
--
--   select team_id, count(*) as rows
--     from public.payments
--    group by team_id
--   having count(*) > 1
--    order by rows desc;
--
-- If that returns nothing, step 1 is a no-op and this migration is purely
-- additive. If it DOES return rows, step 1 keeps the most recently submitted
-- payment for each team and deletes the older ones — read it before running.
-- ------------------------------------------------------------------------------

-- ------------------------------------------------------------------------------
-- 1. Collapse any duplicates, keeping the newest submission per team.
--    submitted_at is the ordering key; id breaks ties deterministically.
-- ------------------------------------------------------------------------------
delete from public.payments p
 using public.payments q
 where p.team_id = q.team_id
   and (
     p.submitted_at < q.submitted_at
     or (p.submitted_at = q.submitted_at and p.id < q.id)
   );

-- ------------------------------------------------------------------------------
-- 2. Add the constraint the application has always assumed.
--    Postgres has no `add constraint if not exists`, so this is guarded.
-- ------------------------------------------------------------------------------
do $$
begin
  if not exists (
    select 1
      from pg_constraint
     where conrelid = 'public.payments'::regclass
       and conname  = 'payments_team_id_key'
  ) then
    alter table public.payments
      add constraint payments_team_id_key unique (team_id);
  end if;
end
$$;

-- ------------------------------------------------------------------------------
-- 3. Verify. The first query should return zero rows; the second should list
--    the new constraint.
-- ------------------------------------------------------------------------------
-- select team_id, count(*) from public.payments
--  group by team_id having count(*) > 1;
--
-- select conname, contype from pg_constraint
--  where conrelid = 'public.payments'::regclass and conname = 'payments_team_id_key';
