-- ==============================================================================
-- ORION 1.0 - Migration 016: THE CREDENTIAL ROSTER (username.xlsx)
-- ==============================================================================
--
-- Source: username.xlsx - 171 rows under a "username"/"password" header. The
-- username is the TEAM NAME as one word; the password is the TEAM LEADER'S
-- NAME as one word. That is the whole login scheme the organisers handed out,
-- so it is the login scheme the portal now serves, verbatim.
--
-- WHY THE UNIQUE USERNAME INDEX GOES AWAY
-- ---------------------------------------
-- Migration 015 assumed one team per username and suffixed collisions
-- (techtitans, techtitans2, techtitans3). The handed-out sheet does not do
-- that: four separate squads are called TECHTITANS, two are NEUROFORGE, two
-- BYTEFORGE, two CODENOVA. Telling three of the four Tech Titans that their
-- username is secretly "techtitans3" would break the credential slip they are
-- holding.
--
-- So the login key stops being the username alone and becomes the PAIR
-- (username, passcode) - which is what authenticateTeam already compares: it
-- fetches every team on a username and accepts the one whose passcode matches.
-- All 160 distinct pairs in the sheet are unique, and the new unique index
-- enforces that going forward. The suffixing trigger is replaced by one that
-- only normalises.
--
-- HOW SHEET ROWS WERE MATCHED TO EXISTING TEAMS
-- ---------------------------------------------
-- Rows 1-104 are the same source, in the same order, as the earlier ORION-S
-- import: row N is ORION-S{N}. This was verified, not assumed - for all 99
-- ORION-S rows that exist, the sheet's password matches the stored leader_name
-- exactly or as a prefix (the sheet drops trailing initials: "Swathika S P" is
-- written SWATHIKAS). Zero mismatches. The five rows in 1-104 with no ORION-S
-- row (70, 80, 91, 92, 93) are verbatim duplicates of rows 57, 41, 46, 43 and
-- 52 - the same five the ORION-S import had already de-duplicated, which is
-- itself confirmation of the row alignment.
--
-- Order-based matching is what resolves the one case name matching cannot:
-- rows 5 and 95 both carry leader MOHAMMEDEMTHEYASS and the database holds two
-- SALT VISION AI teams (ORION-S0005, ORION-S0095). Row 5 goes to S0005, row 95
-- to S0095. Four rows also RENAME their team relative to the database. The
-- sheet is authoritative on the LOGIN; team_name is left as registered, so the
-- admin panel still shows the squad under the name it signed up with:
--
--   row  44 DEADLINEWARRIORS      -> ORION-S0044 "Wakandians"
--   row  90 FIGHTCLUB             -> ORION-S0090 "M. SHEIK SHAHIN"
--   row 100 MYSTORATECH           -> ORION-S0100 "kishore b"
--   row   5 KANURIMANOBHIABHILASH -> ORION-S0005 "SALT VISION AI"
--
-- Rows 105-171 are teams the ORION-S import never had. Six are verbatim
-- duplicates of earlier rows (106, 109, 111, 121, 155, 158) and are skipped.
-- Five match a team that registered through the real form and are linked to it
-- by registration ID rather than inserted again:
--
--   row 114 THEHEXAGEN      -> ORION-2026-0158  THE HEXA GEN
--   row 133 PHOENIXPROTOCOL -> ORION-2026-0219  Phoenix Protocol
--   row 141 RUNTIMEERROR    -> ORION-2026-0224  RunTime Error
--   row 154 MOTWAGUARD      -> ORION-2026-0223  MotwaGuard
--   row 166 CODECRACKERS    -> ORION-2026-0234  CODE CRACKERS
--
-- The remaining 56 are INSERTED as ORION-S0105 upward, in sheet order. Three
-- share a username with an existing team but carry a different leader, and are
-- new squads rather than edits: CODENOVA/PRAVEENAK, NEUROFORGE/HASHVANTS,
-- TECHTITANS/RRJAIWANTH. Two more look like near-misses and are also distinct
-- entries in the sheet: CYBERROOKIES/YUVARAJK (leader shares a prefix with
-- ORION-S0013 ARC) and VAISHNAVIDEVIG/VAISHNAVIDEVIG (leader shares a name
-- with ORION-S0011 MISS SQUAD). The sheet lists them as separate logins, so
-- they become separate logins.
--
-- The inserted rows carry only what the sheet has: team_name from the username
-- column, leader_name from the password column, and empty strings for the
-- contact and problem-statement fields the sheet does not contain - the same
-- shape the ORION-S rows already have. No payments rows are created.
--
-- FIVE TEAMS ARE NOT IN THE SHEET
-- -------------------------------
-- ORION-2026-0161 TensorTech, -0226 MADMAXX, -0230 Code Boosters,
-- -0233 Asgardians and -0235 Apex accelerator registered through the form and
-- have no row in username.xlsx. Leaving them without a username would lock
-- them out entirely, so they get credentials built by the SAME rule the sheet
-- uses - username from team_name, passcode from leader_name, both stripped to
-- letters and digits and upper-cased. Their old random ORN- passcode stops
-- working; that is deliberate, so every team in the portal follows one rule.
--
-- Total after this migration: 165 teams, 160 from the sheet + 5 backfilled.
-- This migration is idempotent: re-running it produces the same 165 rows.

-- ------------------------------------------------------------------------------
-- 0. Migration 015 must have run. Re-stated here so 016 is safe on a database
--    where 015 was skipped, which is the case in production.
-- ------------------------------------------------------------------------------
alter table public.teams add column if not exists username text;

create or replace function public.orion_username_slug(name text)
returns text
language sql
immutable
as $$
  select nullif(lower(regexp_replace(coalesce(name, ''), '[^a-zA-Z0-9]', '', 'g')), '')
$$;

-- ------------------------------------------------------------------------------
-- 1. The login key is the pair, not the username. Drop the unique index and the
--    trigger before touching data, or 015's renumbering fights every write below.
-- ------------------------------------------------------------------------------
drop trigger if exists trg_teams_username on public.teams;
drop index if exists public.idx_teams_username_lower;
drop index if exists public.idx_teams_username_passcode;

-- ------------------------------------------------------------------------------
-- 2. The sheet, verbatim, all 171 rows in sheet order. Row order is load-bearing
--    (see the header), so seq is the spreadsheet row number minus the header.
-- ------------------------------------------------------------------------------
drop table if exists orion_credential_sheet;
create temporary table orion_credential_sheet (
  seq      integer primary key,
  username text not null,
  passcode text not null
);

insert into orion_credential_sheet (seq, username, passcode) values
  (1, 'INNOVEX', 'YASASWINICHILUKURI'),
  (2, 'GIRLSGOTBYTE', 'SDARSHINIJEYASHAKTHI'),
  (3, 'SAFEGRID', 'MOSESSPARJENK'),
  (4, 'TECHXKUZHU', 'THANISHKAYOGESH'),
  (5, 'KANURIMANOBHIABHILASH', 'MOHAMMEDEMTHEYASS'),
  (6, 'NEUROFORGE', 'SARVESHWARVA'),
  (7, 'HEXAFLUX', 'SAKTHILAKSHMIG'),
  (8, 'DEADLINEDODGERS', 'EGOGULNATH'),
  (9, 'CODENOVA', 'ADITYAPS'),
  (10, 'LOGICLORDS', 'JERINN'),
  (11, 'MISSSQUAD', 'VAISHNAVIDEVIG'),
  (12, 'NEXYRA', 'BARVIND'),
  (13, 'ARC', 'YUVARAJKL'),
  (14, 'TECHLARPER', 'FARNASB'),
  (15, 'ADENGAPPANAALUPERU', 'NSHAMVENKAT'),
  (16, 'TEAMTRINITY', 'SUDHARSANR'),
  (17, 'SOLEX', 'SURYAPRAKASHS'),
  (18, 'TRAVIXA', 'LOVINSHA'),
  (19, 'TEAMVERSE', 'NAVEENKUMARP'),
  (20, 'TECHTITANS', 'DEEKSHITHP'),
  (21, 'QRYVEXA', 'SENTHAMIZHSELVANV'),
  (22, 'HACKADEMICS', 'AKSHAYKUMARN'),
  (23, 'STARBYTE', 'JAIDEVS'),
  (24, 'BYTEFORGE', 'CHANDINISUNDARAN'),
  (25, 'REPLICANTS', 'SHIRISHBABUN'),
  (26, 'ARVION', 'PRANESHMITHUNGS'),
  (27, 'CYPHERFORGE', 'ARUNADEVIS'),
  (28, 'HACKERMEN', 'BHARANIDHARANS'),
  (29, 'ADHIRADIBOYS', 'PUSHPARAJJ'),
  (30, 'ERROR404', 'SSAIDOLASA'),
  (31, 'HACKHAWKS', 'GOPIKRISHNAS'),
  (32, 'MINDSPRINT', 'FREZHAANGELINEA'),
  (33, 'CODEBLOODED', 'JAHNAVIMOGARALA'),
  (34, 'LITTLEGHOSTS', 'GOKULCHOWDRYS'),
  (35, 'APPRENTICE', 'NAVYAM'),
  (36, 'MINDMESH', 'MRITYUNJAYKRITHICKM'),
  (37, 'BUGSYNDICATE', 'MEGESHL'),
  (38, '405DECODERS', 'POTNURUPRASANTHKUMAR'),
  (39, 'BYTEFORGE', 'KESHIKAVALLIS'),
  (40, 'ALGORYX', 'AMIRTHAVARSINIR'),
  (41, 'JACKHACKROV', 'VISHWAI'),
  (42, 'THAMIZHARIGNARGAL', 'MUHAMMADURASHEEQJM'),
  (43, 'IMPACTWARRIORS', 'VDIVYESH'),
  (44, 'DEADLINEWARRIORS', 'ARAKSHAYAKRUTHIK'),
  (45, 'PROTECTECH', 'DEVESHWARS'),
  (46, 'NEXORA', 'AGILESHM'),
  (47, 'ALPHAMINDS', 'VASUNDRAS'),
  (48, 'BYTEPULSE', 'SADHANAV'),
  (49, 'BINARYTITANS', 'MMADHURI'),
  (50, 'BYTEME', 'SHIVANI'),
  (51, 'POINTBREAK', 'CHANDRUM'),
  (52, 'CODEMONKEYS', 'HARIVISHVAS'),
  (53, 'TEAMROGERS', 'VIJAYALAKSHMIV'),
  (54, 'TOUCHGRASS', 'TKDHARMESHKUMAR'),
  (55, 'CYBERWARRIER', 'JAYASURIYAK'),
  (56, 'INTERSTELLAR', 'FARHANURRAHMANM'),
  (57, 'TEAM_NAME_26', 'SAIKRISHNAKJ'),
  (58, 'CODEFLUX', 'PRAVEENAS'),
  (59, 'ELITE', 'MADHUMITHAMANIVANNAN'),
  (60, 'SCARLETFORCE', 'MADHUMITHAS'),
  (61, 'AQUASENSE', 'RATHEESHM'),
  (62, 'OPTIPARKSYSTEMS', 'GOMATAMTRISHNAHAASINI'),
  (63, 'TECHTITANS', 'RAMPRAKASHS'),
  (64, 'STACKS', 'PRAVEENR'),
  (65, 'LEAFLOGIC', 'SWATHIKAS'),
  (66, 'DEEBUG', 'RONAKN'),
  (67, 'NEXERA', 'AKSHAYKUMARPV'),
  (68, 'TECHTITANS', 'MHARSHINI'),
  (69, 'TECHNOBRATS', 'SRUTHIR'),
  (70, 'TEAM_NAME_26', 'SAIKRISHNAKJ'),
  (71, 'BAMABOYZ', 'ARJUN'),
  (72, 'FEMMORA', 'VAIBHAVASHAKTHIR'),
  (73, 'LOGICLEGIONS', 'SIVAMP'),
  (74, 'VISIONX', 'YAZHINIB'),
  (75, 'THEIMPOSTER', 'LIKITHKRISHNAJ'),
  (76, 'KALEPHOR', 'SHIVANISK'),
  (77, 'AGRIVANGUARD', 'THODUPUNURISAICHARAN'),
  (78, 'TEAMSYNERGY', 'NIRMALADEVINS'),
  (79, 'BIOBYTES', 'SASRIKANTH'),
  (80, 'JACKHACKROV', 'VISHWAI'),
  (81, 'IMPACTCODERS', 'MOHAMEDAASEEFM'),
  (82, 'BRAINBYTE', 'ADITIPHULRE'),
  (83, '404BRAINNOTFOUND', 'HARISHR'),
  (84, 'TOOTHPASTEEATERS', 'RAJDEEPMAHADEVKULKARNI'),
  (85, 'MISSIONIMPOSSIBLEOXYGEN', 'JAIGANAPATHISB'),
  (86, 'SHERLOCK', 'SAIADITIYAARS'),
  (87, 'PERCEPTRON', 'SANJAIR'),
  (88, 'CORESIGNAL', 'PRASANNAKUMAR'),
  (89, 'TECHNOVA', 'SLAKSHAYA'),
  (90, 'FIGHTCLUB', 'MSHEIKSHAHIN'),
  (91, 'NEXORA', 'AGILESHM'),
  (92, 'IMPACTWARRIORS', 'VDIVYESH'),
  (93, 'CODEMONKEYS', 'HARIVISHVAS'),
  (94, 'TECHMATES', 'SAMITHAK'),
  (95, 'SALTVISIONAI', 'MOHAMMEDEMTHEYASS'),
  (96, 'NEX6', 'DILIPANP'),
  (97, 'SPIDEYVERSE', 'HEMAMALINIK'),
  (98, 'QUANTUMFORCE', 'BGOPINATH'),
  (99, 'RIOT', 'PPRAGATHY'),
  (100, 'MYSTORATECH', 'KISHOREB'),
  (101, 'FLOWPILOT', 'PRANOSHM'),
  (102, 'SYNCSQUAD', 'MOHAMEDRIYASDEENI'),
  (103, 'TENSORTITANS', 'JESSICAJ'),
  (104, 'KERNELPANIC', 'AARURANK'),
  (105, 'OMEGA', 'RRITHWIK'),
  (106, 'BINARYTITANS', 'MMADHURI'),
  (107, 'NEXO', 'ASHWATHM'),
  (108, 'FNATIC', 'LEEMAS'),
  (109, 'TOUCHGRASS', 'TKDHARMESHKUMAR'),
  (110, 'CODEX', 'PRAVEENS'),
  (111, 'ARVION', 'PRANESHMITHUNGS'),
  (112, 'VAISHNAVIDEVIG', 'VAISHNAVIDEVIG'),
  (113, 'NOVARYN', 'BARATHISANKARM'),
  (114, 'THEHEXAGEN', 'HRITHISHVAR'),
  (115, 'KERNELZERO', 'PRIYAN'),
  (116, 'CODENOVA', 'PRAVEENAK'),
  (117, 'MASTERMINDS', 'GREESHMATARLANA'),
  (118, 'JARVIS6O', 'ROSHANG'),
  (119, 'VERIDIA', 'NADHIVKARUPPUSWAMY'),
  (120, 'FUTURECODE', 'KEVINHARRIS'),
  (121, 'TEAMTRINITY', 'SUDHARSANR'),
  (122, 'BYTEFORCE', 'KISHOREKUMARM'),
  (123, 'KNIGHTCODERS', 'HAREESHVN'),
  (124, 'HACKELITE', 'OMSAIVAMSIV'),
  (125, 'NEURALNINJAS', 'THESHNAR'),
  (126, 'ASTRIVEX', 'RHAGHAVCHANDRASEKARAN'),
  (127, 'HEXAVERSE', 'POOJAKUMAR'),
  (128, 'FORGEDINCODE', 'HAREENIPAVENDAN'),
  (129, 'ZORO', 'GAYATHRIK'),
  (130, 'CYBERROOKIES', 'YUVARAJK'),
  (131, 'NEUROFORGE', 'HASHVANTS'),
  (132, 'VARNS', 'AHARSHITH'),
  (133, 'PHOENIXPROTOCOL', 'SRILAKSHMIVJ'),
  (134, 'STRAWHATS', 'ROSHANANTOW'),
  (135, 'TECHSPACE', 'SARANS'),
  (136, 'BREAKINGCODE', 'ISAACJACKSONRAJJ'),
  (137, 'CLAXONAI', 'SARRVESHJR'),
  (138, 'PROJECTHAILMARY', 'DHARANIKARTHIKEYAN'),
  (139, 'HEXACORE', 'SACHINGS'),
  (140, 'PROTOTHON', 'BALIREDDIVVNSABHISHEK'),
  (141, 'RUNTIMEERROR', 'CHAREN'),
  (142, 'HITECH', 'IRINACHARISB'),
  (143, 'FINEWORKS', 'PRAVEENBALAJIG'),
  (144, 'REBELLIONS', 'LOKESHS'),
  (145, 'SYLVAAI', 'POOJAS'),
  (146, 'TECHHACKERS', 'DIVYAT'),
  (147, 'CODECHARMS', 'ELAKKIYAR'),
  (148, 'VORO', 'LALITHADITIYATA'),
  (149, 'MESHMINDS', 'TEJASVINIS'),
  (150, 'NEXQ', 'ANANYASRIDHAR'),
  (151, 'DOOMCODERS', 'CBALAJIMOHAN'),
  (152, 'TECHTITANS', 'RRJAIWANTH'),
  (153, 'TECHCODE', 'DEVIPRIYAB'),
  (154, 'MOTWAGUARD', 'MONICAV'),
  (155, 'STARBYTE', 'JAIDEVS'),
  (156, 'O1', 'MSHIRISH'),
  (157, 'ASTRALIS', 'YAATHESH'),
  (158, 'MINDSPRINT', 'FREZHAANGELINEA'),
  (159, 'TECHNOCRATS', 'GUNANITHIM'),
  (160, 'PROOFFORGE', 'JERLINGOLDIAJ'),
  (161, 'ORCA', 'MUKUNDANT'),
  (162, 'AVENGERSCODESDAY', 'MJDHURGESH'),
  (163, 'NOVERA', 'SUDHARSANB'),
  (164, 'CLARABELLA', 'KSHALINI'),
  (165, 'DRDOOM', 'KRITHIKAAB'),
  (166, 'CODECRACKERS', 'MONISHR'),
  (167, 'GAITHUB', 'SANTOSHRAGHAVENDRAYS'),
  (168, 'NOVATRIX', 'PRAVEENKUMARM'),
  (169, 'HACKASPIRANTS', 'KEERTHAESHKUMARM'),
  (170, 'BHAIRAV', 'VINISHVINOTH'),
  (171, 'CHANGEMAKINGENGINEERS', 'SUTHAKARP');

-- ------------------------------------------------------------------------------
-- 3. Resolve every sheet row to a registration_id: existing team, or a new
--    ORION-S id handed out in sheet order. Duplicate rows resolve to NULL and
--    are dropped - the row they duplicate has already claimed the team.
-- ------------------------------------------------------------------------------
drop table if exists orion_credential_plan;
create temporary table orion_credential_plan as
with deduped as (
  -- First occurrence of each (username, passcode) pair wins; 171 -> 160 rows.
  select distinct on (public.orion_username_slug(username), lower(passcode))
    seq, username, passcode
  from orion_credential_sheet
  order by public.orion_username_slug(username), lower(passcode), seq
),
linked as (
  select
    d.seq,
    d.username,
    d.passcode,
    case
      -- Rows 1-104 are the ORION-S import, in order.
      when d.seq <= 104 then 'ORION-S' || lpad(d.seq::text, 4, '0')
      -- Five later rows are teams that came through the real form.
      when d.seq = 114 then 'ORION-2026-0158'
      when d.seq = 133 then 'ORION-2026-0219'
      when d.seq = 141 then 'ORION-2026-0224'
      when d.seq = 154 then 'ORION-2026-0223'
      when d.seq = 166 then 'ORION-2026-0234'
    end as existing_id
  from deduped d
)
select
  l.seq,
  l.username,
  l.passcode,
  coalesce(
    t.registration_id,
    -- Everything left is a new squad. ORION-S0105 upward, in sheet order.
    'ORION-S' || lpad((104 + row_number() over (
      partition by (t.registration_id is null) order by l.seq
    ))::text, 4, '0')
  ) as registration_id,
  (t.registration_id is null) as is_new
from linked l
left join public.teams t on t.registration_id = l.existing_id;

-- Guard rails. Each fires only if the sheet or the database is not what the
-- header says, in which case a silent partial import is the worst outcome.
do $$
declare
  n integer;
begin
  select count(*) into n from orion_credential_plan;
  if n <> 160 then
    raise exception 'expected 160 distinct credentials, planned %', n;
  end if;

  select count(*) into n from orion_credential_plan where is_new;
  if n <> 56 then
    raise exception 'expected 56 new teams, planned %', n;
  end if;

  -- Every non-new row must land on a team whose stored leader_name agrees with
  -- the sheet's password, exactly or as a prefix. This is the check that makes
  -- the row-order mapping safe to rely on.
  select count(*) into n
  from orion_credential_plan p
  join public.teams t on t.registration_id = p.registration_id
  where not p.is_new
    and public.orion_username_slug(t.leader_name) is distinct from lower(p.passcode)
    and public.orion_username_slug(t.leader_name) not like lower(p.passcode) || '%'
    and lower(p.passcode) not like public.orion_username_slug(t.leader_name) || '%';
  if n <> 0 then
    raise exception '% planned rows land on a team with a different leader', n;
  end if;
end;
$$;

-- ------------------------------------------------------------------------------
-- 4. Existing teams: set the login, leave the registration data alone.
-- ------------------------------------------------------------------------------
update public.teams t
set username     = public.orion_username_slug(p.username),
    access_token = p.passcode,
    updated_at   = now()
from orion_credential_plan p
where t.registration_id = p.registration_id
  and not p.is_new;

-- ------------------------------------------------------------------------------
-- 5. New teams. Only what the sheet actually contains; the rest is empty, which
--    is the same shape the ORION-S rows already carry.
-- ------------------------------------------------------------------------------
insert into public.teams (
  registration_id, team_name, leader_name, leader_phone, leader_email,
  institution, problem_statement, username, access_token
)
select
  p.registration_id, p.username, p.passcode, '', '',
  '', '', public.orion_username_slug(p.username), p.passcode
from orion_credential_plan p
where p.is_new
on conflict (registration_id) do update
set username     = excluded.username,
    access_token = excluded.access_token,
    updated_at   = now();

-- ------------------------------------------------------------------------------
-- 6. The five teams the sheet never listed, by the same rule.
-- ------------------------------------------------------------------------------
update public.teams
set username     = public.orion_username_slug(team_name),
    access_token = upper(public.orion_username_slug(leader_name)),
    updated_at   = now()
where username is null
  and public.orion_username_slug(team_name) is not null
  and public.orion_username_slug(leader_name) is not null;

-- A team whose name or leader is pure punctuation has nothing to build a login
-- from, so it falls back to its registration id rather than staying NULL.
update public.teams
set username     = lower(regexp_replace(registration_id, '[^a-zA-Z0-9]', '', 'g')),
    access_token = case when access_token = '' then upper(regexp_replace(registration_id, '[^a-zA-Z0-9]', '', 'g')) else access_token end,
    updated_at   = now()
where username is null;

alter table public.teams alter column username set not null;

-- ------------------------------------------------------------------------------
-- 7. The pair is the login, so the pair is what must be unique.
-- ------------------------------------------------------------------------------
create index if not exists idx_teams_username_lower
  on public.teams (lower(username));

create unique index if not exists idx_teams_username_passcode
  on public.teams (lower(username), lower(access_token));

-- ------------------------------------------------------------------------------
-- 8. Restore the sync trigger, minus the renumbering 015 did.
-- ------------------------------------------------------------------------------
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

drop table if exists orion_credential_plan;
drop table if exists orion_credential_sheet;
