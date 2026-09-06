-- ==============================================================================
-- ORION 1.0 — Migration 012: MERGE DUPLICATE TEAM REGISTRATIONS
-- ==============================================================================
--
-- The spreadsheet import carried five squads that had registered twice. Each
-- pair shares a leader and the same people; the second copy differs only in
-- spelling. The earlier registration_id survives, since that is the ID the
-- participants already hold.
--
--   ORION-S0080 -> ORION-S0041  JACK HACKROV     (all 5 identical)
--   ORION-S0092 -> ORION-S0043  Impact Warriors  (3 identical + YESHWANTH C / YESHWANT C)
--   ORION-S0091 -> ORION-S0046  NEXORA           (3 identical + 3 respellings)
--   ORION-S0093 -> ORION-S0052  CodeMonkeys      (3 identical + Hari Vishva S H / S, Yuvaraj / Yuvaraj H)
--   ORION-S0070 -> ORION-S0057  Team_Name_26     (all 4 identical)
--
-- The survivor's roster is kept AS-IS rather than unioned: the extra entries in
-- the dropped copy are alternative spellings of the same people, so a union
-- would inflate NEXORA to 9 members for a 6-person squad.
--
-- DELIBERATELY NOT MERGED — same team name, ZERO roster overlap, i.e. different
-- squads that happened to choose the same name:
--   ORION-S0020 / ORION-S0063 / ORION-S0068  "Tech Titans"
--   ORION-S0024 / ORION-S0039                "ByteForge"
-- Also left alone: ORION-S0005 / ORION-S0095 "SALT VISION AI" — same leader but
-- a genuinely different lineup, so which roster is authoritative is a call for
-- the organisers, not a data-cleanup script.
--
-- Verified before running: none of the dropped teams had payments, submissions,
-- suspicion flags, audit entries or password resets attached.
--
-- Safe to re-run (no-ops once the duplicates are gone).
-- ------------------------------------------------------------------------------

do $$
declare
  pair record;
  keep_id uuid; drop_id uuid; dropped_members text;
begin
  for pair in
    select * from (values
      ('ORION-S0041','ORION-S0080'),
      ('ORION-S0043','ORION-S0092'),
      ('ORION-S0046','ORION-S0091'),
      ('ORION-S0052','ORION-S0093'),
      ('ORION-S0057','ORION-S0070')
    ) as v(keep_rid, drop_rid)
  loop
    select id into keep_id from public.teams where registration_id = pair.keep_rid;
    select id into drop_id from public.teams where registration_id = pair.drop_rid;
    if keep_id is null or drop_id is null then continue; end if;

    select string_agg(member_name, ', ' order by member_number)
      into dropped_members from public.team_members where team_id = drop_id;

    insert into public.audit_logs (team_id, team_name, actor, action, details)
    select keep_id, t.team_name, 'Data cleanup', 'DUPLICATE_TEAM_MERGED',
           format('Merged duplicate registration %s into %s. Same leader (%s), same roster. '
                  'The dropped copy listed: %s. Roster of %s kept as authoritative.',
                  pair.drop_rid, pair.keep_rid, t.leader_name, dropped_members, pair.keep_rid)
    from public.teams t where t.id = keep_id;

    delete from public.teams where id = drop_id;  -- team_members cascade
  end loop;

  -- ORION-S0041 listed its leader VISHWA I twice (slot 1 and slot 6).
  delete from public.team_members
   where team_id = (select id from public.teams where registration_id='ORION-S0041')
     and member_number = 6
     and lower(regexp_replace(member_name,'[^a-zA-Z0-9]','','g')) = 'vishwai';
end $$;
