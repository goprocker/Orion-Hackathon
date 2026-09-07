-- ==============================================================================
-- ORION 1.0 — Migration 011: TEAM NAME ON EACH MEMBER ROW
-- ==============================================================================
--
-- Browsing team_members meant every row was an anonymous name against a uuid.
-- This carries teams.team_name down onto the roster so the table reads on its
-- own.
--
-- The column is denormalised ON PURPOSE, and two triggers keep it honest:
--   * before insert / re-parent on team_members  -> filled from teams
--   * after update of teams.team_name            -> rewritten across the roster
-- So it cannot drift. Never write team_members.team_name by hand; it is derived.
--
-- Note on column position: Postgres appends new columns, so this lands last in
-- the physical order rather than directly after member_name. Use the
-- public.team_directory view (migration 010) for a presentation-ordered read.
--
-- Safe to re-run.
-- ------------------------------------------------------------------------------

alter table public.team_members add column if not exists team_name text;

update public.team_members m
   set team_name = t.team_name
  from public.teams t
 where t.id = m.team_id
   and (m.team_name is distinct from t.team_name);

alter table public.team_members alter column team_name set not null;

comment on column public.team_members.team_name is
  'Derived from teams.team_name, kept in sync by trigger. Read-only: never set it by hand.';

create or replace function public.team_members_sync_team_name()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  select t.team_name into new.team_name from public.teams t where t.id = new.team_id;
  return new;
end;
$$;

drop trigger if exists trg_team_members_team_name on public.team_members;
create trigger trg_team_members_team_name
  before insert or update of team_id on public.team_members
  for each row execute function public.team_members_sync_team_name();

create or replace function public.teams_propagate_team_name()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  update public.team_members
     set team_name = new.team_name
   where team_id = new.id
     and team_name is distinct from new.team_name;
  return null;
end;
$$;

drop trigger if exists trg_teams_propagate_team_name on public.teams;
create trigger trg_teams_propagate_team_name
  after update of team_name on public.teams
  for each row execute function public.teams_propagate_team_name();
