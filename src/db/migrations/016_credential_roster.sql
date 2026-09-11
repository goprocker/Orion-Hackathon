-- Historical participant-data operation retired from public source.
-- Original bytes are preserved in the operator-only security archive.
-- Existing production rows are not changed. Do not replay legacy imports.
-- Use scripts/stage_roster.mjs for new source data; see SECURITY_REMEDIATION.md.
alter table public.teams add column if not exists username text;
drop index if exists public.idx_teams_username_lower;
drop index if exists public.idx_teams_username_passcode;
create index if not exists idx_teams_username_lower on public.teams (lower(username));
create unique index if not exists idx_teams_username_passcode on public.teams (lower(username), lower(access_token));
drop trigger if exists trg_teams_username on public.teams;
create or replace function public.orion_sync_team_username()
returns trigger
language plpgsql
as $$
begin
  if tg_op = 'INSERT' then
    new.username := coalesce(
      public.orion_username_slug(coalesce(new.username, new.team_name)),
      lower(regexp_replace(new.registration_id, '[^a-zA-Z0-9]', '', 'g'))
    );
  elsif new.username is distinct from old.username then
    -- An explicit username change is normalised but never renumbered.
    new.username := coalesce(
      public.orion_username_slug(new.username),
      public.orion_username_slug(new.team_name),
      old.username
    );
  elsif new.team_name is distinct from old.team_name then
    -- A rename moves the login with it, but only for a team whose login still
    -- tracks its name. The four renamed rows above keep the login on the slip.
    if old.username is not distinct from public.orion_username_slug(old.team_name) then
      new.username := coalesce(
        public.orion_username_slug(new.team_name),
        old.username
      );
    end if;
  end if;
  return new;
end;
$$;

create trigger trg_teams_username
  before insert or update on public.teams
  for each row execute function public.orion_sync_team_username();
