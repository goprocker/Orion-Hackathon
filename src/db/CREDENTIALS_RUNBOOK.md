# Runbook — importing a registration sheet and refreshing team logins

How to take a new export of the ORION registration form and bring `public.teams`
and `public.team_members` in line with it, including every team's portal login.

This file contains **no credentials**. It documents the *rule* that derives them,
which is not a secret — the login screen already tells participants what it is
(`src/app/api/auth/team/route.ts`). Nothing here needs encrypting, and it is
deliberately readable so it can be picked up cold at the start of a session.
The generated credential list is a different matter: see [Exporting](#8-exporting-the-credential-list).

Last exercised: 2026-09-08, against `ORION 1.0 7th september, 2026.xlsx`
(252 form rows → 245 teams). See `migrations/017_realign_roster_to_form_sheet.sql`.

Last audited: 2026-09-08, 291 teams, all checks in §7 clean.

> **The roster contract changed on 2026-09-08 and this file has been updated to
> match.** The leader is no longer stored in `team_members`. `teams.leader_name`
> is the single canonical record of Participant 1, and `team_members` holds only
> the *other* members, numbered from 1. Migrations `018_remove_duplicate_leader_members.sql`
> and `022_remove_new_team_leader_duplicates.sql` removed the leader rows that
> earlier imports had written, because the leader was rendering twice — once as
> LEADER and again as MEMBER 01 — in the portal roster and the admin CSV export.
>
> Anything you read elsewhere saying "slot 1 is always the leader" predates this
> and is wrong, **including the schema's own column comments** — see §9. A roster
> with no leader in it is now the correct state, not a defect to repair.

---

## 1. The convention

| Field | Rule | Example |
|---|---|---|
| `username` | team name, lowercased, everything but `a-z0-9` stripped | `Tech Titans` → `techtitans` |
| `access_token` (passcode) | leader name, UPPERCASED, everything but `A-Z0-9` stripped | `Deekshith. P` → `DEEKSHITHP` |

```sql
username     = lower(regexp_replace(team_name,   '[^a-zA-Z0-9]', '', 'g'))
access_token = upper(regexp_replace(leader_name, '[^a-zA-Z0-9]', '', 'g'))
```

**A username is NOT unique.** Four separate squads are called "Tech Titans". The
login key is the **pair** `(username, passcode)`, enforced by
`idx_teams_username_passcode`. `authenticateTeam()` fetches *every* row on a
username and lets the passcode pick the one that owns it — so never add a numeric
suffix to disambiguate; that breaks the credential the participant was handed.

Three places implement this and must agree:

- `src/lib/teamUsername.ts` — `toUsername()`, what the app normalises input with
- `public.orion_username_slug()` — the DB trigger, `migrations/015_team_username.sql`
- the SQL above, used for bulk refreshes

---

## 2. Before touching anything

```sql
drop table if exists _bak_teams_YYYYMMDD;
drop table if exists _bak_team_members_YYYYMMDD;
create table _bak_teams_YYYYMMDD        as select * from teams;
create table _bak_team_members_YYYYMMDD as select * from team_members;
alter table _bak_teams_YYYYMMDD        enable row level security;
alter table _bak_team_members_YYYYMMDD enable row level security;
```

The backup tables hold live passcodes. Enable RLS (no policy = service-role only,
matching every other table here) and drop them once the import is spot-checked.

---

## 3. Reading the sheet

Column layout of the Google Form export, 0-indexed, header on row 0:

| Col | Field |
|---|---|
| 1 | Team ID (`ORION-Snnnn`) — **authoritative** |
| 2 | Team name |
| 4 | Leader / member 1 name |
| 5 | Leader email |
| 6, 7, 8 | Leader department, year, institution |
| 9, 14, 19, 24, 29 | Member 2–6 name (then `+1` email, `+2` dept, `+3` year) |
| 34 | Problem statement |
| 46–51 | Phone for member 1–6 |
| 52 | Fallback email |

Member *i* (1-based): name at `4 + 5*(i-1)`, phone at `46 + (i-1)`.

Load into staging tables `_sheet_teams(rid, team_name, leader_name, leader_phone,
leader_email, institution, department, year, problem_statement)` and
`_sheet_members(rid, member_number, member_name, member_phone, member_email,
department, year)`. Skip the idea title/abstract columns — `teams` has no home for
them and they are most of the file's bulk.

Filter placeholder roster rows the form collects in unused member slots:
`_slug(member_name) not in ('null','na','nil','none','')` and `length(trim(name)) > 1`
(seen: `NULL`, `Null`, `-`).

If pushing the staged rows through an MCP `execute_sql`, keep chunks around
60 team rows / 120 member rows — larger statements have dropped the connection.

---

## 4. Matching sheet rows to existing DB rows

Match on **content, never on `registration_id`** — a drifted ID is the very thing
being repaired. Build `_map(team_id uuid primary key, rid text unique, how text)`
in four passes, each skipping rows already claimed by an earlier pass:

1. `team_name` slug **and** `leader_name` slug — resolves the large majority
2. `leader_email` — catches rows whose team name drifted
3. `leader_name` slug alone — the drift block: right leader, wrong team name
4. `team_name` slug alone — leader-name spelling variants

**Always print the passes 2–4 matches and eyeball them before applying anything.**
That review is what caught the 2026-09-08 off-by-one, where FNATIC was stored
under the name "NEXO" and NEXO under "Binary Titans".

Then check both directions:

```sql
-- sheet rows with no DB row, and DB rows with no sheet row
select count(*) from _sheet_teams s where not exists (select 1 from _map m where m.rid=s.rid);
select count(*) from teams t       where not exists (select 1 from _map m where m.team_id=t.id);
```

DB rows with no sheet row are usually teams that registered through the app after
the export — leave them alone, they just get the credential rule applied.

---

## 5. Duplicates — decide before writing

Two kinds, and they are not the same thing:

- **The same squad filled the form twice.** Identical team name *and* leader to a
  row already present. Do **not** insert the second one: it would produce an
  identical `(username, passcode)` pair and neither copy could log in. In the
  2026-09-08 sheet these were `S0070, S0080, S0091, S0092, S0093, S0106, S0109,
  S0111, S0121, S0155, S0158`.
- **Two DB rows for one squad.** Keep the row carrying real state — a verified
  payment, a submission, a fuller roster — and delete the other. Rosters are
  re-imported from the sheet afterwards, so members on the deleted row come back.

Before any delete, confirm what would go with it. `team_members`, `payments`,
`submissions`, `password_resets`, `resubmission_requests` and `suspicion_flags`
all **CASCADE** from `teams`; `audit_logs.team_id` is SET NULL.

```sql
select t.registration_id, t.team_name,
 (select count(*) from team_members  m where m.team_id=t.id) mem,
 (select count(*) from payments      p where p.team_id=t.id) pay,
 (select count(*) from submissions   s where s.team_id=t.id) sub,
 (select count(*) from password_resets r where r.team_id=t.id) rst
from teams t where t.registration_id in (...);
```

A squad that genuinely registered twice under **different team names** (so the
usernames differ) can keep both rows — e.g. `S0005` / `S0095`, SALT VISION AI.

---

## 6. Applying — the parking trick

`registration_id` and `(username, access_token)` both have unique indexes, and
Postgres checks them **per row**, not at statement end. Any bulk reassignment that
is a permutation (`S0156 → S0167`, `S0157 → S0168`, …) collides with a value still
held by a row the statement has not reached yet. Park first, then land:

```sql
-- IDs. 'ORION-TMPnnnn' satisfies the registration_id CHECK constraint.
with moving as (
  select m.team_id, row_number() over (order by m.rid) rn
  from _map m join teams t on t.id = m.team_id
  where t.registration_id <> m.rid
)
update teams t set registration_id = 'ORION-TMP' || lpad(moving.rn::text, 4, '0')
from moving where t.id = moving.team_id;

update teams t set registration_id = m.rid
from _map m where t.id = m.team_id and t.registration_id like 'ORION-TMP%';

-- Credentials.
update teams set username = 'tmp-' || id::text, access_token = 'TMP-' || id::text;
```

Two gotchas that cost a round trip each:

- A window function is not allowed directly in `UPDATE ... SET`; it has to come
  from a CTE or subquery, as above.
- `leader_phone` and `leader_email` are **NOT NULL**. The sheet leaves them blank
  for early registrations, so always
  `coalesce(nullif(s.field,''), nullif(t.field,''), 'NOT_PROVIDED')`.

Identity refresh, then credentials:

```sql
update teams t
set team_name        = s.team_name,
    leader_name      = s.leader_name,
    leader_phone     = coalesce(nullif(s.leader_phone,''), nullif(t.leader_phone,''), 'NOT_PROVIDED'),
    leader_email     = coalesce(nullif(s.leader_email,''), nullif(t.leader_email,''), 'NOT_PROVIDED'),
    institution      = coalesce(nullif(s.institution,''),      t.institution),
    department       = coalesce(nullif(s.department,''),       t.department),
    year             = coalesce(nullif(s.year,''),             t.year),
    problem_statement= coalesce(nullif(s.problem_statement,''), t.problem_statement),
    updated_at       = now()
from _map m join _sheet_teams s on s.rid = m.rid
where t.id = m.team_id;

update teams
set username     = lower(regexp_replace(team_name,   '[^a-zA-Z0-9]', '', 'g')),
    access_token = upper(regexp_replace(leader_name, '[^a-zA-Z0-9]', '', 'g')),
    updated_at   = now();
```

**Never touch** `payment_status`, `amount`, `round_1_status`, `round_2_status`,
`round_1_score`, `evaluation_scores`, `admin_notes` — or the `id` column, which is
what keeps every foreign key intact.

Check for genuine end-state collisions *before* assigning, so a real clash is not
mistaken for the transient kind:

```sql
with final as (
  select coalesce(s.team_name, t.team_name) tn, coalesce(s.leader_name, t.leader_name) ln
  from teams t left join _map m on m.team_id=t.id left join _sheet_teams s on s.rid=m.rid)
select tn, ln, count(*) from final
group by 1,2 having count(*) > 1;
```

Rosters: insert only where a team has none, and separately replace any roster that
still carries the leader. `team_members.team_name` is maintained by
`trg_team_members_team_name` — never set it by hand.

**Do not write the leader into `team_members`.** Sheet column 4 is the leader and
belongs only in `teams.leader_name`; `team_members` takes columns 9, 14, 19, 24, 29
(members 2-6), renumbered contiguously from 1. A five-person squad is one `teams`
row plus four `team_members` rows. Load `_sheet_members` with

```sql
member_number = row_number() over (partition by rid order by sheet_member_number)
```

over the non-leader columns only, rather than reusing the sheet's own 2-6.

If a roster already holds the leader — an older import, or a hand-written insert —
delete that row rather than renumbering around it, then close the gap:

```sql
delete from team_members m using teams t
where m.team_id = t.id
  and lower(regexp_replace(m.member_name,'[^a-zA-Z0-9]','','g'))
    = lower(regexp_replace(t.leader_name,'[^a-zA-Z0-9]','','g'));

with renum as (
  select id, row_number() over (partition by team_id order by member_number) rn
  from team_members)
update team_members m set member_number = renum.rn
from renum where m.id = renum.id and m.member_number <> renum.rn;
```

The second statement needs `unique_team_member` dropped and re-added inside the
transaction: `team_members_member_number_check` pins the value to 1-6, so there is
nowhere to park, and the unique index is checked per row rather than at statement
end. `022_remove_new_team_leader_duplicates.sql` sidesteps this by deleting a
team's whole roster and re-inserting it already numbered — simpler, and worth
copying for anything bigger than a few teams.

---

## 7. Verifying

Everything here must come back `0` except the first two:

```sql
select
 (select count(*) from teams)   teams,
 (select count(*) from team_members) members,
 (select count(*) from teams t where not exists (select 1 from team_members m where m.team_id=t.id)) zero_roster,
 (select count(*) from teams t where exists (select 1 from team_members m where m.team_id=t.id
    and lower(regexp_replace(m.member_name,'[^a-zA-Z0-9]','','g'))
      = lower(regexp_replace(t.leader_name,'[^a-zA-Z0-9]','','g')))) leader_duplicated_in_roster,
 (select count(*) from (select team_id from team_members group by team_id
    having min(member_number) <> 1 or max(member_number) <> count(*)) x) numbering_not_contiguous,
 (select count(*) from (select team_id, member_name from team_members
    group by 1,2 having count(*) > 1) y) dup_member_within_team,
 (select count(*) from (select lower(username) u, lower(access_token) p from teams group by 1,2 having count(*)>1) x) dup_logins,
 (select count(*) from teams where coalesce(username,'')='' or coalesce(access_token,'')='') blank_creds,
 (select count(*) from teams where registration_id !~ '^ORION-(S[0-9]{4}|2026-[0-9]{4})$') bad_reg_format,
 (select count(*) from teams where registration_id like 'ORION-TMP%') parked_left,
 (select count(*) from teams where username like 'tmp-%' or access_token like 'TMP-%') parked_creds_left;
```

`leader_duplicated_in_roster` is the one that matters and it reads the opposite
way round from what this section used to check. It must be `0` because the leader
belongs in `teams` alone; a non-zero value means an import wrote the leader into
`team_members` again and participants will see that person listed twice. Do not
"fix" it by adding the leader to teams that lack one — that is the correct state.

`zero_roster` is only a warning, not an error: a solo entrant legitimately has a
`teams` row and no `team_members` rows at all. Eyeball the list rather than
assuming a count of `0` is required.

Also confirm payments survived: `select count(*) from payments;` and
`select count(*) from teams where payment_status='VERIFIED';` should be unchanged
from before the import.

**Confirm nothing else is writing before you verify.** These counts only mean
something against a quiet database, and more than one session has held the
service-role key at once. `teams` and `team_members` both moved mid-audit on
2026-09-08 while no import was believed to be running — it turned out to be
migrations 021/022 being applied from another session.

```sql
select application_name, state, query_start, left(regexp_replace(query,'\s+',' ','g'), 120)
from pg_stat_activity where datname = current_database() and pid <> pg_backend_pid()
order by query_start desc nulls last;
```

MCP `execute_sql` connects as `mgmt-api`; anything writing as `PostgREST` is a
supabase-js client — the app, a script, or another session. Cheap fingerprint to
re-check before and after any change:

```sql
select (select count(*) from teams) teams, (select count(*) from team_members) members,
 (select max(created_at) from team_members) newest_member,
 (select md5(string_agg(registration_id||'|'||username||'|'||access_token, E'\n' order by registration_id)) from teams) cred_hash,
 (select md5(string_agg(m.team_id::text||'|'||m.member_number||'|'||m.member_name, E'\n'
                        order by m.team_id::text, m.member_number)) from team_members m) roster_hash;
```

Also check `git fetch && git log HEAD..origin/main` before concluding the database
is wrong. The 2026-09-08 audit read a roster with no leaders as corruption; the
explanation was nine unpulled commits deliberately removing them.

Finally drop the staging tables — `_sheet_teams`, `_sheet_members`, `_map` and any
`_slug()` helper — and run the Supabase security advisor. The `rls_enabled_no_policy`
INFOs are expected (service-role-only by design); anything else is new.

---

## 8. Exporting the credential list

`registration_id, team_name, leader_name, leader_email, leader_phone, username, passcode`,
written UTF-8 **with BOM** so Excel renders `—` and similar correctly. Quote every
field: team names contain commas and quotes (`git commit -m "Victory"`,
`Mission:I'm-Possible Oxygen`).

**Write it outside the repo** (`~/Downloads`). This repository auto-pushes to a
public GitHub remote, and the file is a plaintext list of every team's passcode.

Verify the export against the database instead of trusting the transcription:

```sql
select md5(string_agg(registration_id||'|'||username||'|'||access_token, E'\n'
                      order by registration_id)) from teams;
```

and hash the same three columns from the CSV. They must match.

That hash covers `teams` only, so roster work never invalidates a credential
export — on 2026-09-08 `cred_hash` held at `6b5ec21b…` across a roster reload that
rewrote more than 1,100 member rows. Re-run it before handing the file over
anyway; it is one query, and it is the only thing between a participant and a
passcode that does not work.

A username is deliberately not unique, so the CSV legitimately repeats: four
`techtitans`, three `codex`, two each of `binarybrains` and `byteforge`. Do not
"fix" them — see §1.

---

## 9. Known gaps

**The schema comments still describe the old roster contract.** Migration 010 set

- `comment on table teams` — "The leader lives here AND as team_members slot 1 —
  both are written by the registration flow, keep them in sync."
- `comment on column teams.leader_name` — "Also stored as team_members.member_number = 1."
- `comment on column team_members.member_number` — "Roster slot 1-6. Slot 1 is always the leader."

All three are now false: migrations 018 and 022 deleted exactly those rows. The
comments are what `list_tables` and every schema browser surface first, so they
are the most likely thing to mislead the next person — they are what sent the
2026-09-08 audit chasing a defect that did not exist. Worth a migration that
rewrites them to match 018/022.

`generateAccessToken()` (`src/lib/serverStore.ts:65`) still mints a random
`ORN-XXXX-XXXX` passcode for teams that register through the app, so a new signup
does not follow this convention even though the login error message describes it.
Left as-is deliberately: switching it to the leader's name makes the passcode
guessable from public information. Either align the code or re-run the credential
refresh after each intake — but decide, rather than letting it drift.
