-- ==============================================================================
-- 018 — Remove duplicate team leader entries from team_members
-- ==============================================================================
--
-- In ORION, teams.leader_name is the canonical identity of Participant 1.
-- Earlier imports and scripts stored the leader as member_number 1 in
-- team_members as well, causing the team leader to appear twice in rosters
-- (once as LEADER and once as MEMBER 01).
--
-- This migration removes any rows in team_members where member_name matches
-- the team's leader_name (or member_number = 1 when names match), and
-- ensures each person is only listed once.

begin;

delete from team_members m
using teams t
where m.team_id = t.id
  and (
    lower(regexp_replace(m.member_name, '[^a-zA-Z0-9]', '', 'g')) =
    lower(regexp_replace(t.leader_name, '[^a-zA-Z0-9]', '', 'g'))
    or (
      m.member_number = 1
      and lower(regexp_replace(m.member_name, '[^a-zA-Z0-9]', '', 'g')) =
          lower(regexp_replace(t.leader_name, '[^a-zA-Z0-9]', '', 'g'))
    )
  );

commit;
