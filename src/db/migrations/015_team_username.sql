-- ==============================================================================
-- Migration 015: team username — the login identifier participants actually know
-- ==============================================================================
--
-- Teams signed in with a registration ID (ORION-2026-0147) or the leader email.
-- Both are things a team has to look up: the ID lives in one confirmation mail,
-- and only the leader knows which address they registered with. The team name is
-- the one identifier every member can recall without checking anything, so it
-- becomes the username — lowercased, with spaces and punctuation stripped, so
-- "Tech Titans", "TECH TITANS" and "techtitans" are all the same login.
--
-- Names are NOT unique. Three usernames collide in the live roster
-- (byteforge x2, saltvisionai x2, techtitans x3), so the base slug goes to the
-- oldest registration and later ones get a numeric suffix — techtitans,
-- techtitans2, techtitans3. Nobody's login silently becomes someone else's.

alter table public.teams add column if not exists username text;

-- The slug rule, shared by the backfill, the trigger and the app.
create or replace function public.orion_username_slug(name text)
returns text
language sql
immutable
as $$
  select nullif(lower(regexp_replace(coalesce(name, ''), '[^a-zA-Z0-9]', '', 'g')), '')
$$;

-- Lowest free suffix for a slug, ignoring one row (the one being written).
create or replace function public.orion_username_claim(base text, exclude_id uuid)
returns text
language plpgsql
as $$
declare
  candidate text := base;
  n integer := 1;
begin
  if base is null then
    return null;
  end if;
  while exists (
    select 1 from public.teams
    where lower(username) = candidate
      and (exclude_id is null or id <> exclude_id)
  ) loop
    n := n + 1;
    candidate := base || n::text;
  end loop;
  return candidate;
end;
$$;

-- Backfill: oldest registration keeps the bare slug.
with ranked as (
  select
    id,
    public.orion_username_slug(team_name) as base,
    row_number() over (
      partition by public.orion_username_slug(team_name)
      order by created_at, registration_id
    ) as seq
  from public.teams
  where username is null
)
update public.teams t
set username = case when r.seq = 1 then r.base else r.base || r.seq::text end
from ranked r
where t.id = r.id
  and r.base is not null;

-- A team with an unsluggable name (all punctuation) falls back to its
-- registration ID so the row still has a usable login.
update public.teams
set username = lower(regexp_replace(registration_id, '[^a-zA-Z0-9]', '', 'g'))
where username is null;

alter table public.teams alter column username set not null;

create unique index if not exists idx_teams_username_lower
  on public.teams (lower(username));

-- Keep it in step with the team name: a rename moves the login with it, and a
-- new registration gets one automatically.
create or replace function public.orion_sync_team_username()
returns trigger
language plpgsql
as $$
declare
  base text;
begin
  if tg_op = 'INSERT' then
    base := public.orion_username_slug(coalesce(new.username, new.team_name));
    base := coalesce(base, lower(regexp_replace(new.registration_id, '[^a-zA-Z0-9]', '', 'g')));
    new.username := public.orion_username_claim(base, new.id);
  elsif new.team_name is distinct from old.team_name
        and new.username is not distinct from old.username then
    -- Renamed without an explicit username: follow the new name.
    base := coalesce(
      public.orion_username_slug(new.team_name),
      lower(regexp_replace(new.registration_id, '[^a-zA-Z0-9]', '', 'g'))
    );
    new.username := public.orion_username_claim(base, new.id);
  elsif new.username is distinct from old.username then
    -- Explicit change: still normalise and de-duplicate it.
    base := coalesce(
      public.orion_username_slug(new.username),
      public.orion_username_slug(new.team_name)
    );
    new.username := public.orion_username_claim(base, new.id);
  end if;
  return new;
end;
$$;

drop trigger if exists trg_teams_username on public.teams;
create trigger trg_teams_username
  before insert or update on public.teams
  for each row execute function public.orion_sync_team_username();
