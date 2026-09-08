-- ==============================================================================
-- 019 — Official Updated Verified Roster Import (260 Squads)
-- ==============================================================================
-- 
-- Purges old entries and imports the 260 official squads.
-- All squads are set to payment_status = 'VERIFIED' and round_1_status = 'SUBMISSION_OPEN'.
-- Duplicate team leader names in member slots have been stripped.
--
-- Apply this script in Supabase SQL Editor.

begin;

-- 1. Clean previous registrations, payments and member associations
delete from public.team_members;
delete from public.payments;
delete from public.submissions;
delete from public.resubmission_requests;
delete from public.suspicion_flags;
delete from public.audit_logs;
delete from public.teams;

-- 2. Insert all 260 squads

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '486217e9-495e-44ca-8b14-de545503f8b9', 'ORION-S0001', 'Innovex', 'innovex', 'Yasaswini Chilukuri', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'YASASWINICHILUKURI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '486217e9-495e-44ca-8b14-de545503f8b9', 'VERIFIED-ORION-S0001', 'Yasaswini Chilukuri', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '486217e9-495e-44ca-8b14-de545503f8b9', 1, 'Hiranya Pallerla', 'Innovex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '486217e9-495e-44ca-8b14-de545503f8b9', 2, 'Loshitha B', 'Innovex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'a2cf80a5-f5ea-4674-aea6-87c31e259b25', 'ORION-S0002', 'GirlsGotByte', 'girlsgotbyte', 'S Darshini Jeya Shakthi', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SDARSHINIJEYASHAKTHI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'a2cf80a5-f5ea-4674-aea6-87c31e259b25', 'VERIFIED-ORION-S0002', 'S Darshini Jeya Shakthi', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a2cf80a5-f5ea-4674-aea6-87c31e259b25', 1, 'Athmaja A', 'GirlsGotByte', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a2cf80a5-f5ea-4674-aea6-87c31e259b25', 2, 'URVI DEORE', 'GirlsGotByte', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a2cf80a5-f5ea-4674-aea6-87c31e259b25', 3, 'PATEL DHARNI ARVINDBHAI', 'GirlsGotByte', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '91fde502-2414-4325-a1da-15156e68f807', 'ORION-S0003', 'Safegrid', 'safegrid', 'Moses Sparjen K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MOSESSPARJENK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '91fde502-2414-4325-a1da-15156e68f807', 'VERIFIED-ORION-S0003', 'Moses Sparjen K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '91fde502-2414-4325-a1da-15156e68f807', 1, 'Nandhini G', 'Safegrid', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '91fde502-2414-4325-a1da-15156e68f807', 2, 'Tamil selvi SV', 'Safegrid', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '91fde502-2414-4325-a1da-15156e68f807', 3, 'Sharveshwaran MS', 'Safegrid', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '91fde502-2414-4325-a1da-15156e68f807', 4, 'Rakshitha S', 'Safegrid', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '91fde502-2414-4325-a1da-15156e68f807', 5, 'Nithish abinav GK', 'Safegrid', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '488b82fc-b696-4c8d-95bf-ea509d98a76d', 'ORION-S0004', 'TechXKuzhu', 'techxkuzhu', 'Thanishka Yogesh', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'THANISHKAYOGESH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '488b82fc-b696-4c8d-95bf-ea509d98a76d', 'VERIFIED-ORION-S0004', 'Thanishka Yogesh', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '488b82fc-b696-4c8d-95bf-ea509d98a76d', 1, 'Lokeshwari R', 'TechXKuzhu', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '488b82fc-b696-4c8d-95bf-ea509d98a76d', 2, 'Surya S', 'TechXKuzhu', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '488b82fc-b696-4c8d-95bf-ea509d98a76d', 3, 'Nithish Kumar S', 'TechXKuzhu', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '488b82fc-b696-4c8d-95bf-ea509d98a76d', 4, 'Mithun V', 'TechXKuzhu', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '488b82fc-b696-4c8d-95bf-ea509d98a76d', 5, 'Madhu Karthikeyan S', 'TechXKuzhu', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4346bfc3-952b-4824-a087-70c8adcedb9f', 'ORION-S0006', 'Neuro Forge', 'neuroforge', 'Sarveshwar V A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SARVESHWARVA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4346bfc3-952b-4824-a087-70c8adcedb9f', 'VERIFIED-ORION-S0006', 'Sarveshwar V A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4346bfc3-952b-4824-a087-70c8adcedb9f', 1, 'Sathish D', 'Neuro Forge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4346bfc3-952b-4824-a087-70c8adcedb9f', 2, 'Sridharan R', 'Neuro Forge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4346bfc3-952b-4824-a087-70c8adcedb9f', 3, 'Yaswanth S', 'Neuro Forge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4346bfc3-952b-4824-a087-70c8adcedb9f', 4, 'Shrika M', 'Neuro Forge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4346bfc3-952b-4824-a087-70c8adcedb9f', 5, 'Sanlin Benzer E', 'Neuro Forge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'cb06133d-844e-4960-8527-f60dbbc76a18', 'ORION-S0007', 'HEXAFLUX', 'hexaflux', 'Sakthi lakshmi G', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SAKTHILAKSHMIG',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'cb06133d-844e-4960-8527-f60dbbc76a18', 'VERIFIED-ORION-S0007', 'Sakthi lakshmi G', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cb06133d-844e-4960-8527-f60dbbc76a18', 1, 'Sarifa Afrin M', 'HEXAFLUX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cb06133d-844e-4960-8527-f60dbbc76a18', 2, 'Sahaya Ancy J', 'HEXAFLUX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cb06133d-844e-4960-8527-f60dbbc76a18', 3, 'Roshini Infenta S', 'HEXAFLUX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cb06133d-844e-4960-8527-f60dbbc76a18', 4, 'Sanjiv Andrew', 'HEXAFLUX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cb06133d-844e-4960-8527-f60dbbc76a18', 5, 'Sanjai G', 'HEXAFLUX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '9ff6dc82-5e6d-422e-b925-3e2936f546fa', 'ORION-S0008', 'Deadline Dodgers', 'deadlinedodgers', 'E Gogulnath', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'EGOGULNATH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '9ff6dc82-5e6d-422e-b925-3e2936f546fa', 'VERIFIED-ORION-S0008', 'E Gogulnath', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9ff6dc82-5e6d-422e-b925-3e2936f546fa', 1, 'Dharshan Y', 'Deadline Dodgers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9ff6dc82-5e6d-422e-b925-3e2936f546fa', 2, 'Divyanth J', 'Deadline Dodgers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9ff6dc82-5e6d-422e-b925-3e2936f546fa', 3, 'Anish Joshua', 'Deadline Dodgers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9ff6dc82-5e6d-422e-b925-3e2936f546fa', 4, 'V Vishal', 'Deadline Dodgers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '40252de8-ec22-42be-9807-f7c1bdcbdb2a', 'ORION-S0009', 'CodeNova', 'codenova', 'Aditya P S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ADITYAPS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '40252de8-ec22-42be-9807-f7c1bdcbdb2a', 'VERIFIED-ORION-S0009', 'Aditya P S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '40252de8-ec22-42be-9807-f7c1bdcbdb2a', 1, 'Neha M', 'CodeNova', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '40252de8-ec22-42be-9807-f7c1bdcbdb2a', 2, 'Asmitha P', 'CodeNova', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '40252de8-ec22-42be-9807-f7c1bdcbdb2a', 3, 'Danisha K', 'CodeNova', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '40252de8-ec22-42be-9807-f7c1bdcbdb2a', 4, 'Devadharshini S', 'CodeNova', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '40252de8-ec22-42be-9807-f7c1bdcbdb2a', 5, 'Buvana V', 'CodeNova', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'eda42e06-4924-474b-9c52-42d96f55bbcf', 'ORION-S0010', 'LOGIC LORDS', 'logiclords', 'JERIN N', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'JERINN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'eda42e06-4924-474b-9c52-42d96f55bbcf', 'VERIFIED-ORION-S0010', 'JERIN N', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eda42e06-4924-474b-9c52-42d96f55bbcf', 1, 'INIYAVAN S', 'LOGIC LORDS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eda42e06-4924-474b-9c52-42d96f55bbcf', 2, 'JAIDEV SP', 'LOGIC LORDS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eda42e06-4924-474b-9c52-42d96f55bbcf', 3, 'JAI AADHITH', 'LOGIC LORDS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eda42e06-4924-474b-9c52-42d96f55bbcf', 4, 'KALAISELVA', 'LOGIC LORDS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'aaeae8f4-7be2-4e23-aeca-9753b6a84119', 'ORION-S0012', 'Nexyra', 'nexyra', 'B.ARVIND', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'BARVIND',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'aaeae8f4-7be2-4e23-aeca-9753b6a84119', 'VERIFIED-ORION-S0012', 'B.ARVIND', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'aaeae8f4-7be2-4e23-aeca-9753b6a84119', 1, 'K.BHARATHAN', 'Nexyra', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'aaeae8f4-7be2-4e23-aeca-9753b6a84119', 2, 'B.AKASH', 'Nexyra', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'aaeae8f4-7be2-4e23-aeca-9753b6a84119', 3, 'M.MARI SELVAM', 'Nexyra', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd53680c0-a8fc-4fa1-ac82-e08205b3576e', 'ORION-S0013', 'ARC', 'arc', 'Yuvaraj K L', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'YUVARAJKL',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd53680c0-a8fc-4fa1-ac82-e08205b3576e', 'VERIFIED-ORION-S0013', 'Yuvaraj K L', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd53680c0-a8fc-4fa1-ac82-e08205b3576e', 1, 'dharshan T R', 'ARC', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd53680c0-a8fc-4fa1-ac82-e08205b3576e', 2, 'charish P S', 'ARC', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd53680c0-a8fc-4fa1-ac82-e08205b3576e', 3, 'haris ahmed R', 'ARC', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd53680c0-a8fc-4fa1-ac82-e08205b3576e', 4, 'staffen G', 'ARC', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ab9e6f50-f16f-438f-a6ea-ec6936d41f72', 'ORION-S0014', 'Tech Larper', 'techlarper', 'Farnas.B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'FARNASB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ab9e6f50-f16f-438f-a6ea-ec6936d41f72', 'VERIFIED-ORION-S0014', 'Farnas.B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ab9e6f50-f16f-438f-a6ea-ec6936d41f72', 1, 'Jesran', 'Tech Larper', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ab9e6f50-f16f-438f-a6ea-ec6936d41f72', 2, 'Mohamed Noorul Haq M', 'Tech Larper', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'cf942e74-2902-49a4-b81b-fab9651c75ac', 'ORION-S0015', 'Adengappa naalu peru', 'adengappanaaluperu', 'N.Sham Venkat', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'NSHAMVENKAT',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'cf942e74-2902-49a4-b81b-fab9651c75ac', 'VERIFIED-ORION-S0015', 'N.Sham Venkat', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cf942e74-2902-49a4-b81b-fab9651c75ac', 1, 'A.Vinish', 'Adengappa naalu peru', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cf942e74-2902-49a4-b81b-fab9651c75ac', 2, 'S.Robin kishor', 'Adengappa naalu peru', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cf942e74-2902-49a4-b81b-fab9651c75ac', 3, 'M.Vinayagam', 'Adengappa naalu peru', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b1c0a937-5579-4a52-9461-e67e1cea926c', 'ORION-S0017', 'SOLEX', 'solex', 'Suryaprakash S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SURYAPRAKASHS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b1c0a937-5579-4a52-9461-e67e1cea926c', 'VERIFIED-ORION-S0017', 'Suryaprakash S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b1c0a937-5579-4a52-9461-e67e1cea926c', 1, 'Yuvega N', 'SOLEX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b1c0a937-5579-4a52-9461-e67e1cea926c', 2, 'Naveena A', 'SOLEX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b1c0a937-5579-4a52-9461-e67e1cea926c', 3, 'Tamilarasan S', 'SOLEX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b1c0a937-5579-4a52-9461-e67e1cea926c', 4, 'Hariharan I', 'SOLEX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5cf1d2a9-d1ad-4d8d-aebe-55f9e6283c44', 'ORION-S0018', 'Travixa', 'travixa', 'Lovinsha', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'LOVINSHA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5cf1d2a9-d1ad-4d8d-aebe-55f9e6283c44', 'VERIFIED-ORION-S0018', 'Lovinsha', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5cf1d2a9-d1ad-4d8d-aebe-55f9e6283c44', 1, 'Suriya kiran', 'Travixa', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5cf1d2a9-d1ad-4d8d-aebe-55f9e6283c44', 2, 'Hari balan', 'Travixa', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5cf1d2a9-d1ad-4d8d-aebe-55f9e6283c44', 3, 'Ragul', 'Travixa', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '17e523d4-b7ef-4c8d-b463-d1d652d7a5f9', 'ORION-S0019', 'Team Verse', 'teamverse', 'Naveenkumar P', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'NAVEENKUMARP',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '17e523d4-b7ef-4c8d-b463-d1d652d7a5f9', 'VERIFIED-ORION-S0019', 'Naveenkumar P', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '17e523d4-b7ef-4c8d-b463-d1d652d7a5f9', 1, 'Yazhini G A', 'Team Verse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '17e523d4-b7ef-4c8d-b463-d1d652d7a5f9', 2, 'Deepika D', 'Team Verse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '17e523d4-b7ef-4c8d-b463-d1d652d7a5f9', 3, 'Nivetha E', 'Team Verse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '17e523d4-b7ef-4c8d-b463-d1d652d7a5f9', 4, 'Akshaya R', 'Team Verse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f8e4f01e-e115-46ad-b072-ef428add2cd0', 'ORION-S0020', 'Tech titans', 'techtitans', 'Deekshith. P', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'DEEKSHITHP',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f8e4f01e-e115-46ad-b072-ef428add2cd0', 'VERIFIED-ORION-S0020', 'Deekshith. P', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f8e4f01e-e115-46ad-b072-ef428add2cd0', 1, 'Kamalesh P', 'Tech titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f8e4f01e-e115-46ad-b072-ef428add2cd0', 2, 'KAMALADHASAN. M', 'Tech titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f8e4f01e-e115-46ad-b072-ef428add2cd0', 3, 'Prakashraj.V', 'Tech titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f8e4f01e-e115-46ad-b072-ef428add2cd0', 4, 'Keerthivarman.G', 'Tech titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f8e4f01e-e115-46ad-b072-ef428add2cd0', 5, 'Ramanan.R', 'Tech titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c151ccab-5abb-4176-a9ec-814cac231bb1', 'ORION-S0021', 'QRYVEXA', 'qryvexa', 'SENTHAMIZH SELVAN.V', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SENTHAMIZHSELVANV',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c151ccab-5abb-4176-a9ec-814cac231bb1', 'VERIFIED-ORION-S0021', 'SENTHAMIZH SELVAN.V', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c151ccab-5abb-4176-a9ec-814cac231bb1', 1, 'RAHUL.M', 'QRYVEXA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c151ccab-5abb-4176-a9ec-814cac231bb1', 2, 'YUGA BHARATHI.P', 'QRYVEXA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0ab31a08-876b-475d-9237-3368eca3d333', 'ORION-S0022', 'Hackademics', 'hackademics', 'Akshay Kumar N', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'AKSHAYKUMARN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0ab31a08-876b-475d-9237-3368eca3d333', 'VERIFIED-ORION-S0022', 'Akshay Kumar N', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ab31a08-876b-475d-9237-3368eca3d333', 1, 'Devaraj M', 'Hackademics', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ab31a08-876b-475d-9237-3368eca3d333', 2, 'Pranav Narayan MS', 'Hackademics', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ab31a08-876b-475d-9237-3368eca3d333', 3, 'Aadith Geeth Mohan', 'Hackademics', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ab31a08-876b-475d-9237-3368eca3d333', 4, 'Srinivasan S', 'Hackademics', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ab31a08-876b-475d-9237-3368eca3d333', 5, 'E Harikrishna', 'Hackademics', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '61eab6bf-fc97-4c02-8d19-2690f7216a36', 'ORION-S0024', 'ByteForge', 'byteforge', 'Chandini Sundaran', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'CHANDINISUNDARAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '61eab6bf-fc97-4c02-8d19-2690f7216a36', 'VERIFIED-ORION-S0024', 'Chandini Sundaran', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '61eab6bf-fc97-4c02-8d19-2690f7216a36', 1, 'Kanishka K', 'ByteForge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'cb009344-8740-48c2-b378-f94b225554d3', 'ORION-S0025', 'REPLICANTS', 'replicants', 'Shirish Babu N', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SHIRISHBABUN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'cb009344-8740-48c2-b378-f94b225554d3', 'VERIFIED-ORION-S0025', 'Shirish Babu N', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cb009344-8740-48c2-b378-f94b225554d3', 1, 'Tanishq Kumar', 'REPLICANTS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cb009344-8740-48c2-b378-f94b225554d3', 2, 'Aashin Nibhu', 'REPLICANTS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cb009344-8740-48c2-b378-f94b225554d3', 3, 'Gladiwin A', 'REPLICANTS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cb009344-8740-48c2-b378-f94b225554d3', 4, 'Manish K', 'REPLICANTS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'fd82cb20-20e5-4314-b847-b46bfb9fc435', 'ORION-S0027', 'CYPHERFORGE', 'cypherforge', 'Arunadevi.S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ARUNADEVIS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'fd82cb20-20e5-4314-b847-b46bfb9fc435', 'VERIFIED-ORION-S0027', 'Arunadevi.S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fd82cb20-20e5-4314-b847-b46bfb9fc435', 1, 'Divyadharshini', 'CYPHERFORGE', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fd82cb20-20e5-4314-b847-b46bfb9fc435', 2, 'Bhoomika.P', 'CYPHERFORGE', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fd82cb20-20e5-4314-b847-b46bfb9fc435', 3, 'Anisha Lakshmi.G.S', 'CYPHERFORGE', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fd82cb20-20e5-4314-b847-b46bfb9fc435', 4, 'Monisha.S', 'CYPHERFORGE', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fd82cb20-20e5-4314-b847-b46bfb9fc435', 5, 'Pradhiksha.D', 'CYPHERFORGE', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '2ae284d1-5466-4782-8f49-08ad2462b3aa', 'ORION-S0028', 'Hacker Men', 'hackermen', 'BHARANIDHARAN S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'BHARANIDHARANS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '2ae284d1-5466-4782-8f49-08ad2462b3aa', 'VERIFIED-ORION-S0028', 'BHARANIDHARAN S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2ae284d1-5466-4782-8f49-08ad2462b3aa', 1, 'HARIKUMAR E', 'Hacker Men', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2ae284d1-5466-4782-8f49-08ad2462b3aa', 2, 'KAMALESH K', 'Hacker Men', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2ae284d1-5466-4782-8f49-08ad2462b3aa', 3, 'ASHWIN PERUMAL S', 'Hacker Men', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2ae284d1-5466-4782-8f49-08ad2462b3aa', 4, 'YUVAN SHANKAR B', 'Hacker Men', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2ae284d1-5466-4782-8f49-08ad2462b3aa', 5, 'ARVIND A', 'Hacker Men', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '255fceac-61ef-48d7-81de-babf5df26177', 'ORION-S0029', 'adhiradi boys', 'adhiradiboys', 'Pushparaj J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PUSHPARAJJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '255fceac-61ef-48d7-81de-babf5df26177', 'VERIFIED-ORION-S0029', 'Pushparaj J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '255fceac-61ef-48d7-81de-babf5df26177', 1, 'Kamal T', 'adhiradi boys', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '255fceac-61ef-48d7-81de-babf5df26177', 2, 'Monish M', 'adhiradi boys', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '255fceac-61ef-48d7-81de-babf5df26177', 3, 'Nimmanagoti Tharun', 'adhiradi boys', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '2030a9c8-8986-44ef-9d9e-ac917c01a000', 'ORION-S0030', 'Error 404', 'error404', 'S.Sai Dolasa', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SSAIDOLASA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '2030a9c8-8986-44ef-9d9e-ac917c01a000', 'VERIFIED-ORION-S0030', 'S.Sai Dolasa', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2030a9c8-8986-44ef-9d9e-ac917c01a000', 1, 'Chokkani.Vineela', 'Error 404', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2030a9c8-8986-44ef-9d9e-ac917c01a000', 2, 'R.Nandu Reddy', 'Error 404', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2030a9c8-8986-44ef-9d9e-ac917c01a000', 3, 'A.Joshika Reddy', 'Error 404', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4e176844-7536-48f9-a069-22193f032a9f', 'ORION-S0031', 'Hack hawks', 'hackhawks', 'GOPIKRISHNA S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'GOPIKRISHNAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4e176844-7536-48f9-a069-22193f032a9f', 'VERIFIED-ORION-S0031', 'GOPIKRISHNA S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4e176844-7536-48f9-a069-22193f032a9f', 1, 'KISHOR KUMAR s', 'Hack hawks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4e176844-7536-48f9-a069-22193f032a9f', 2, 'Salman S', 'Hack hawks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4e176844-7536-48f9-a069-22193f032a9f', 3, 'YOGESHWAR K', 'Hack hawks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4e176844-7536-48f9-a069-22193f032a9f', 4, 'VISHNU B', 'Hack hawks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b3467121-a4e6-4127-942f-504872c11242', 'ORION-S0033', 'Code Blooded', 'codeblooded', 'Jahnavi Mogarala', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'JAHNAVIMOGARALA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b3467121-a4e6-4127-942f-504872c11242', 'VERIFIED-ORION-S0033', 'Jahnavi Mogarala', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b3467121-a4e6-4127-942f-504872c11242', 1, 'Prathiksa G', 'Code Blooded', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '273094c4-7c18-44df-b20c-c5d0b9744eb2', 'ORION-S0034', 'Little ghosts', 'littleghosts', 'Gokul chowdry S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'GOKULCHOWDRYS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '273094c4-7c18-44df-b20c-c5d0b9744eb2', 'VERIFIED-ORION-S0034', 'Gokul chowdry S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '273094c4-7c18-44df-b20c-c5d0b9744eb2', 1, 'Vishal', 'Little ghosts', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '273094c4-7c18-44df-b20c-c5d0b9744eb2', 2, 'Anugraha PJ', 'Little ghosts', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '273094c4-7c18-44df-b20c-c5d0b9744eb2', 3, 'Sanjana Rajasekar', 'Little ghosts', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '76073696-d414-4e38-b149-6da96dad914f', 'ORION-S0035', 'Apprentice', 'apprentice', 'Navya M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'NAVYAM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '76073696-d414-4e38-b149-6da96dad914f', 'VERIFIED-ORION-S0035', 'Navya M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '76073696-d414-4e38-b149-6da96dad914f', 1, 'Deepadarsni S', 'Apprentice', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '76073696-d414-4e38-b149-6da96dad914f', 2, 'Hareesh Govind', 'Apprentice', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '76073696-d414-4e38-b149-6da96dad914f', 3, 'Hariharan D', 'Apprentice', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '76073696-d414-4e38-b149-6da96dad914f', 4, 'Guru Prasath', 'Apprentice', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '76073696-d414-4e38-b149-6da96dad914f', 5, 'Balaji M', 'Apprentice', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '25f1f294-17b3-40b1-bfe7-1c0afb9ddc9a', 'ORION-S0036', 'MindMesh', 'mindmesh', 'Mrityunjay Krithick M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MRITYUNJAYKRITHICKM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '25f1f294-17b3-40b1-bfe7-1c0afb9ddc9a', 'VERIFIED-ORION-S0036', 'Mrityunjay Krithick M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '25f1f294-17b3-40b1-bfe7-1c0afb9ddc9a', 1, 'Oviya S', 'MindMesh', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '25f1f294-17b3-40b1-bfe7-1c0afb9ddc9a', 2, 'Paari S', 'MindMesh', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '25f1f294-17b3-40b1-bfe7-1c0afb9ddc9a', 3, 'Sasmita S', 'MindMesh', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '25f1f294-17b3-40b1-bfe7-1c0afb9ddc9a', 4, 'Thanmaysree K', 'MindMesh', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c0380a75-2bf1-40e0-9546-f28aff9f1e18', 'ORION-S0037', 'Bug syndicate', 'bugsyndicate', 'Megesh L', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MEGESHL',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c0380a75-2bf1-40e0-9546-f28aff9f1e18', 'VERIFIED-ORION-S0037', 'Megesh L', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c0380a75-2bf1-40e0-9546-f28aff9f1e18', 1, 'Rajiv G', 'Bug syndicate', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c0380a75-2bf1-40e0-9546-f28aff9f1e18', 2, 'Soma Sundari N', 'Bug syndicate', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c0380a75-2bf1-40e0-9546-f28aff9f1e18', 3, 'Dhanalakshmi', 'Bug syndicate', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c0380a75-2bf1-40e0-9546-f28aff9f1e18', 4, 'Bhavatarikha Lakshmana', 'Bug syndicate', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'cc3119e5-10a2-4dc6-9b6c-b523b3ab2789', 'ORION-S0038', '405 decoders', '405decoders', 'Potnuru Prasanth kumar', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'POTNURUPRASANTHKUMAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'cc3119e5-10a2-4dc6-9b6c-b523b3ab2789', 'VERIFIED-ORION-S0038', 'Potnuru Prasanth kumar', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cc3119e5-10a2-4dc6-9b6c-b523b3ab2789', 1, 'Korada venkat sai', '405 decoders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cc3119e5-10a2-4dc6-9b6c-b523b3ab2789', 2, 'Dhanush kayala', '405 decoders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cc3119e5-10a2-4dc6-9b6c-b523b3ab2789', 3, 'Sai Gangadhar Adapa', '405 decoders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cc3119e5-10a2-4dc6-9b6c-b523b3ab2789', 4, 'Rajendra V', '405 decoders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c646404e-719d-4686-af6a-c09b75ae31d7', 'ORION-S0039', 'Byteforge', 'byteforge', 'Keshika Valli S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'KESHIKAVALLIS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c646404e-719d-4686-af6a-c09b75ae31d7', 'VERIFIED-ORION-S0039', 'Keshika Valli S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c646404e-719d-4686-af6a-c09b75ae31d7', 1, 'Kritya K', 'Byteforge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c646404e-719d-4686-af6a-c09b75ae31d7', 2, 'Keerthana E', 'Byteforge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c646404e-719d-4686-af6a-c09b75ae31d7', 3, 'Joshitha S', 'Byteforge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f5f0dfa6-f81d-4b28-9919-c403d0f9b40c', 'ORION-S0040', 'Algoryx', 'algoryx', 'Amirtha varsini R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'AMIRTHAVARSINIR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f5f0dfa6-f81d-4b28-9919-c403d0f9b40c', 'VERIFIED-ORION-S0040', 'Amirtha varsini R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f5f0dfa6-f81d-4b28-9919-c403d0f9b40c', 1, 'Ramkarthikeyan G', 'Algoryx', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f5f0dfa6-f81d-4b28-9919-c403d0f9b40c', 2, 'Tharshan M', 'Algoryx', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f5f0dfa6-f81d-4b28-9919-c403d0f9b40c', 3, 'Kowsik Raja S', 'Algoryx', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f5f0dfa6-f81d-4b28-9919-c403d0f9b40c', 4, 'Sastiga Sri H', 'Algoryx', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '6a793dbd-5a6c-4669-ae0a-574f350822b0', 'ORION-S0042', 'THAMIZH ARIGNARGAL', 'thamizharignargal', 'Muhammadu Rasheeq J M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MUHAMMADURASHEEQJM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '6a793dbd-5a6c-4669-ae0a-574f350822b0', 'VERIFIED-ORION-S0042', 'Muhammadu Rasheeq J M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6a793dbd-5a6c-4669-ae0a-574f350822b0', 1, 'Sai saran A', 'THAMIZH ARIGNARGAL', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6a793dbd-5a6c-4669-ae0a-574f350822b0', 2, 'V Mamata', 'THAMIZH ARIGNARGAL', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6a793dbd-5a6c-4669-ae0a-574f350822b0', 3, 'Niranjana D', 'THAMIZH ARIGNARGAL', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '6f274764-f5cf-4871-9b4f-4a8181cea49e', 'ORION-S0044', 'Deadline Warriors', 'deadlinewarriors', 'A.R Akshaya Kruthik', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ARAKSHAYAKRUTHIK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '6f274764-f5cf-4871-9b4f-4a8181cea49e', 'VERIFIED-ORION-S0044', 'A.R Akshaya Kruthik', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6f274764-f5cf-4871-9b4f-4a8181cea49e', 1, 'Dheeraj Abhay. R', 'Deadline Warriors', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6f274764-f5cf-4871-9b4f-4a8181cea49e', 2, 'Avinash. R', 'Deadline Warriors', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6f274764-f5cf-4871-9b4f-4a8181cea49e', 3, 'Dhanuja. J', 'Deadline Warriors', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6f274764-f5cf-4871-9b4f-4a8181cea49e', 4, 'S. SAKTHI SRI', 'Deadline Warriors', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6f274764-f5cf-4871-9b4f-4a8181cea49e', 5, 'Ashvin Prasad. k', 'Deadline Warriors', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '40ef6ca3-3b96-490a-a6c4-6869f9fa2d6c', 'ORION-S0045', 'PROTECTECH', 'protectech', 'Deveshwar S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'DEVESHWARS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '40ef6ca3-3b96-490a-a6c4-6869f9fa2d6c', 'VERIFIED-ORION-S0045', 'Deveshwar S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '40ef6ca3-3b96-490a-a6c4-6869f9fa2d6c', 1, 'Sri Hari S', 'PROTECTECH', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '40ef6ca3-3b96-490a-a6c4-6869f9fa2d6c', 2, 'Vijay Karthick S', 'PROTECTECH', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '40ef6ca3-3b96-490a-a6c4-6869f9fa2d6c', 3, 'Sree Vishal K S', 'PROTECTECH', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '575fc575-ff3f-4589-9143-24d7f6c27e73', 'ORION-S0047', 'Alpha Minds', 'alphaminds', 'Vasundra S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'VASUNDRAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '575fc575-ff3f-4589-9143-24d7f6c27e73', 'VERIFIED-ORION-S0047', 'Vasundra S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '575fc575-ff3f-4589-9143-24d7f6c27e73', 1, 'Vidhyaa Vardhani Ra', 'Alpha Minds', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '575fc575-ff3f-4589-9143-24d7f6c27e73', 2, 'Narmatha R', 'Alpha Minds', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '575fc575-ff3f-4589-9143-24d7f6c27e73', 3, 'Parvada Vardhni S', 'Alpha Minds', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '575fc575-ff3f-4589-9143-24d7f6c27e73', 4, 'Niranjana S', 'Alpha Minds', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '575fc575-ff3f-4589-9143-24d7f6c27e73', 5, 'Aishwarya', 'Alpha Minds', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '2f4b5542-073b-436c-b0d4-d1f3b0b1689f', 'ORION-S0048', 'BytePulse', 'bytepulse', 'Sadhana V', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SADHANAV',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '2f4b5542-073b-436c-b0d4-d1f3b0b1689f', 'VERIFIED-ORION-S0048', 'Sadhana V', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2f4b5542-073b-436c-b0d4-d1f3b0b1689f', 1, 'Rithika R', 'BytePulse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2f4b5542-073b-436c-b0d4-d1f3b0b1689f', 2, 'Ragavi S', 'BytePulse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2f4b5542-073b-436c-b0d4-d1f3b0b1689f', 3, 'pranika Shree C', 'BytePulse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2f4b5542-073b-436c-b0d4-d1f3b0b1689f', 4, 'Poornaa V', 'BytePulse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2f4b5542-073b-436c-b0d4-d1f3b0b1689f', 5, 'Prasanambika', 'BytePulse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'a7f3147f-a096-4609-acd1-837565ab504c', 'ORION-S0050', 'Byte me', 'byteme', 'Shivani', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SHIVANI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'a7f3147f-a096-4609-acd1-837565ab504c', 'VERIFIED-ORION-S0050', 'Shivani', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a7f3147f-a096-4609-acd1-837565ab504c', 1, 'Jane Marria Harriet', 'Byte me', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a7f3147f-a096-4609-acd1-837565ab504c', 2, 'Niveditha S', 'Byte me', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a7f3147f-a096-4609-acd1-837565ab504c', 3, 'Aimy Grace P Georg', 'Byte me', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a7f3147f-a096-4609-acd1-837565ab504c', 4, 'Jeshvina Emerald', 'Byte me', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a7f3147f-a096-4609-acd1-837565ab504c', 5, 'Jhanavarshan AM', 'Byte me', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4e28850c-a7fb-43c5-ab29-cc6786a582e9', 'ORION-S0051', 'Point Break', 'pointbreak', 'Chandru M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'CHANDRUM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4e28850c-a7fb-43c5-ab29-cc6786a582e9', 'VERIFIED-ORION-S0051', 'Chandru M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4e28850c-a7fb-43c5-ab29-cc6786a582e9', 1, 'Jaya Karthick R', 'Point Break', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4e28850c-a7fb-43c5-ab29-cc6786a582e9', 2, 'Harish S', 'Point Break', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4e28850c-a7fb-43c5-ab29-cc6786a582e9', 3, 'Darshan K', 'Point Break', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4e28850c-a7fb-43c5-ab29-cc6786a582e9', 4, 'Jovitha E', 'Point Break', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4e28850c-a7fb-43c5-ab29-cc6786a582e9', 5, 'Harini BB', 'Point Break', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '7bd6b254-1663-4ee6-811a-0b94e466f347', 'ORION-S0053', 'Team Rogers', 'teamrogers', 'Vijayalakshmi.V', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'VIJAYALAKSHMIV',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '7bd6b254-1663-4ee6-811a-0b94e466f347', 'VERIFIED-ORION-S0053', 'Vijayalakshmi.V', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7bd6b254-1663-4ee6-811a-0b94e466f347', 1, 'HendryPualDhinaka', 'Team Rogers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7bd6b254-1663-4ee6-811a-0b94e466f347', 2, 'Faazilah A.L.', 'Team Rogers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7bd6b254-1663-4ee6-811a-0b94e466f347', 3, 'Thirumalini.S', 'Team Rogers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7bd6b254-1663-4ee6-811a-0b94e466f347', 4, 'Hemachandran S', 'Team Rogers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7bd6b254-1663-4ee6-811a-0b94e466f347', 5, 'Nitesh kumaar V', 'Team Rogers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8066719a-0af9-475d-8d45-d9bafd7ea8aa', 'ORION-S0055', 'Cyber Warrier', 'cyberwarrier', 'Jaya Suriya k', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'JAYASURIYAK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8066719a-0af9-475d-8d45-d9bafd7ea8aa', 'VERIFIED-ORION-S0055', 'Jaya Suriya k', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8066719a-0af9-475d-8d45-d9bafd7ea8aa', 1, 'Soorya', 'Cyber Warrier', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8066719a-0af9-475d-8d45-d9bafd7ea8aa', 2, 'Subash', 'Cyber Warrier', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8066719a-0af9-475d-8d45-d9bafd7ea8aa', 3, 'KATHIJA.M', 'Cyber Warrier', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8066719a-0af9-475d-8d45-d9bafd7ea8aa', 4, 'R.Renuga Devi', 'Cyber Warrier', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8066719a-0af9-475d-8d45-d9bafd7ea8aa', 5, 'RIGASHINI.s', 'Cyber Warrier', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '7396927c-7f4c-4e2d-890d-be02bcb54c62', 'ORION-S0056', 'Interstellar', 'interstellar', 'Farhan Ur Rahman M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'FARHANURRAHMANM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '7396927c-7f4c-4e2d-890d-be02bcb54c62', 'VERIFIED-ORION-S0056', 'Farhan Ur Rahman M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7396927c-7f4c-4e2d-890d-be02bcb54c62', 1, 'Aiman Zulaiha M M', 'Interstellar', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7396927c-7f4c-4e2d-890d-be02bcb54c62', 2, 'Adithyan Benoy V', 'Interstellar', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7396927c-7f4c-4e2d-890d-be02bcb54c62', 3, 'Rathna Priya S', 'Interstellar', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7396927c-7f4c-4e2d-890d-be02bcb54c62', 4, 'Srikar B V', 'Interstellar', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7396927c-7f4c-4e2d-890d-be02bcb54c62', 5, 'Sushmitha E', 'Interstellar', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '136064f2-2192-405b-a7f0-3854c7786c5b', 'ORION-S0058', 'Codeflux', 'codeflux', 'Praveena S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PRAVEENAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '136064f2-2192-405b-a7f0-3854c7786c5b', 'VERIFIED-ORION-S0058', 'Praveena S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '136064f2-2192-405b-a7f0-3854c7786c5b', 1, 'T Vignesh', 'Codeflux', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '136064f2-2192-405b-a7f0-3854c7786c5b', 2, 'Tamizharasi K', 'Codeflux', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '136064f2-2192-405b-a7f0-3854c7786c5b', 3, 'Yuvathi P', 'Codeflux', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '136064f2-2192-405b-a7f0-3854c7786c5b', 4, 'Sathiya nishka', 'Codeflux', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '136064f2-2192-405b-a7f0-3854c7786c5b', 5, 'Srinivasan V', 'Codeflux', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '7481fad0-623c-4880-947c-20d61802f350', 'ORION-S0059', 'Elite', 'elite', 'Madhumitha Manivannan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MADHUMITHAMANIVANNAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '7481fad0-623c-4880-947c-20d61802f350', 'VERIFIED-ORION-S0059', 'Madhumitha Manivannan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7481fad0-623c-4880-947c-20d61802f350', 1, 'Devatharshini J', 'Elite', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'e062db9c-4ba0-4062-85cf-81b34f59a602', 'ORION-S0060', 'Scarlet force', 'scarletforce', 'Madhumitha S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MADHUMITHAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'e062db9c-4ba0-4062-85cf-81b34f59a602', 'VERIFIED-ORION-S0060', 'Madhumitha S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e062db9c-4ba0-4062-85cf-81b34f59a602', 1, 'Janani R', 'Scarlet force', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e062db9c-4ba0-4062-85cf-81b34f59a602', 2, 'Archaya U', 'Scarlet force', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e062db9c-4ba0-4062-85cf-81b34f59a602', 3, 'Harini S', 'Scarlet force', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e062db9c-4ba0-4062-85cf-81b34f59a602', 4, 'Brindhasri S', 'Scarlet force', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '60b5716c-aa86-456e-b669-6b59964ecbe0', 'ORION-S0061', 'Aquasense', 'aquasense', 'Ratheesh M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'RATHEESHM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '60b5716c-aa86-456e-b669-6b59964ecbe0', 'VERIFIED-ORION-S0061', 'Ratheesh M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '60b5716c-aa86-456e-b669-6b59964ecbe0', 1, 'Ravindran G', 'Aquasense', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '60b5716c-aa86-456e-b669-6b59964ecbe0', 2, 'RishiKumar', 'Aquasense', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '60b5716c-aa86-456e-b669-6b59964ecbe0', 3, 'Raajavarshan S.M', 'Aquasense', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b656dac6-3570-43b9-bef8-ca5a83abb626', 'ORION-S0062', 'OPTIPARK SYSTEMS', 'optiparksystems', 'GOMATAM TRISHNA HAASINI', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'GOMATAMTRISHNAHAASINI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b656dac6-3570-43b9-bef8-ca5a83abb626', 'VERIFIED-ORION-S0062', 'GOMATAM TRISHNA HAASINI', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b656dac6-3570-43b9-bef8-ca5a83abb626', 1, 'TULIKA JAISWAL', 'OPTIPARK SYSTEMS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b656dac6-3570-43b9-bef8-ca5a83abb626', 2, 'MOKSHITHA KAKARLA', 'OPTIPARK SYSTEMS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '838381d6-32de-4849-b8b4-e225be1e1f5c', 'ORION-S0063', 'TECH TITANS', 'techtitans', 'Ram Prakash S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'RAMPRAKASHS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '838381d6-32de-4849-b8b4-e225be1e1f5c', 'VERIFIED-ORION-S0063', 'Ram Prakash S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '838381d6-32de-4849-b8b4-e225be1e1f5c', 1, 'Indhar A', 'TECH TITANS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '838381d6-32de-4849-b8b4-e225be1e1f5c', 2, 'SANJAY S', 'TECH TITANS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '838381d6-32de-4849-b8b4-e225be1e1f5c', 3, 'SHRI SANTH SUBAS', 'TECH TITANS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '838381d6-32de-4849-b8b4-e225be1e1f5c', 4, 'Rajathiruvarasu v', 'TECH TITANS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '838381d6-32de-4849-b8b4-e225be1e1f5c', 5, 'Sriharan A', 'TECH TITANS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ba0b6604-35b7-4d1a-bfa5-2506c9cac2ab', 'ORION-S0064', 'STACKS', 'stacks', 'Praveen R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PRAVEENR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ba0b6604-35b7-4d1a-bfa5-2506c9cac2ab', 'VERIFIED-ORION-S0064', 'Praveen R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba0b6604-35b7-4d1a-bfa5-2506c9cac2ab', 1, 'Rithikka P', 'STACKS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba0b6604-35b7-4d1a-bfa5-2506c9cac2ab', 2, 'Ramya R', 'STACKS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba0b6604-35b7-4d1a-bfa5-2506c9cac2ab', 3, 'Ranjeet P.I', 'STACKS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba0b6604-35b7-4d1a-bfa5-2506c9cac2ab', 4, 'Akash S', 'STACKS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f5fcd38b-163e-4f11-a810-3df8c1cc7666', 'ORION-S0065', 'LeafLogic', 'leaflogic', 'Swathika S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SWATHIKAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f5fcd38b-163e-4f11-a810-3df8c1cc7666', 'VERIFIED-ORION-S0065', 'Swathika S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f5fcd38b-163e-4f11-a810-3df8c1cc7666', 1, 'P Dhivyasri', 'LeafLogic', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f5fcd38b-163e-4f11-a810-3df8c1cc7666', 2, 'Irfanaa Parveen M', 'LeafLogic', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f5fcd38b-163e-4f11-a810-3df8c1cc7666', 3, 'Yoga Varshini M', 'LeafLogic', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f5fcd38b-163e-4f11-a810-3df8c1cc7666', 4, 'Nandanaa devi A N', 'LeafLogic', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f5fcd38b-163e-4f11-a810-3df8c1cc7666', 5, 'Keerthana M', 'LeafLogic', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '7b1357b2-071f-4b96-be51-59d12027b68a', 'ORION-S0066', 'DeeBug', 'deebug', 'Ronak. N', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'RONAKN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '7b1357b2-071f-4b96-be51-59d12027b68a', 'VERIFIED-ORION-S0066', 'Ronak. N', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7b1357b2-071f-4b96-be51-59d12027b68a', 1, 'Faheem Udheen', 'DeeBug', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7b1357b2-071f-4b96-be51-59d12027b68a', 2, 'Lokesh Kumar', 'DeeBug', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7b1357b2-071f-4b96-be51-59d12027b68a', 3, 'Aravindakshan', 'DeeBug', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7b1357b2-071f-4b96-be51-59d12027b68a', 4, 'Thamilelelan', 'DeeBug', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '2bfd43a0-7671-4312-a68f-cb6ebdc80f8b', 'ORION-S0067', 'NEXERA', 'nexera', 'Akshay Kumar P.V.', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'AKSHAYKUMARPV',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '2bfd43a0-7671-4312-a68f-cb6ebdc80f8b', 'VERIFIED-ORION-S0067', 'Akshay Kumar P.V.', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2bfd43a0-7671-4312-a68f-cb6ebdc80f8b', 1, 'Trinab Shan', 'NEXERA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2bfd43a0-7671-4312-a68f-cb6ebdc80f8b', 2, 'Harish K.', 'NEXERA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2bfd43a0-7671-4312-a68f-cb6ebdc80f8b', 3, 'Seyon Ann Shibu', 'NEXERA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '78311358-fd2f-4dc0-b583-078c1e5f29df', 'ORION-S0068', 'Tech Titan', 'techtitan', 'M.HARSHINI', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MHARSHINI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '78311358-fd2f-4dc0-b583-078c1e5f29df', 'VERIFIED-ORION-S0068', 'M.HARSHINI', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '78311358-fd2f-4dc0-b583-078c1e5f29df', 1, 'Harini P', 'Tech Titan', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '78311358-fd2f-4dc0-b583-078c1e5f29df', 2, 'Iniya Alies Rasma M', 'Tech Titan', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '78311358-fd2f-4dc0-b583-078c1e5f29df', 3, 'Jeyashree S', 'Tech Titan', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '78311358-fd2f-4dc0-b583-078c1e5f29df', 4, 'Kanika A I', 'Tech Titan', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '78311358-fd2f-4dc0-b583-078c1e5f29df', 5, 'Jai Shree M', 'Tech Titan', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '3ed387b8-2339-4181-b153-62add76bd760', 'ORION-S0069', 'TECHNO BRATS', 'technobrats', 'Sruthi R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SRUTHIR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '3ed387b8-2339-4181-b153-62add76bd760', 'VERIFIED-ORION-S0069', 'Sruthi R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3ed387b8-2339-4181-b153-62add76bd760', 1, 'Thridev V M', 'TECHNO BRATS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3ed387b8-2339-4181-b153-62add76bd760', 2, 'Srinidhi kruthiha G', 'TECHNO BRATS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3ed387b8-2339-4181-b153-62add76bd760', 3, 'Vishnu Vedant Deva', 'TECHNO BRATS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3ed387b8-2339-4181-b153-62add76bd760', 4, 'Sriram V', 'TECHNO BRATS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3ed387b8-2339-4181-b153-62add76bd760', 5, 'Sudarshan A J', 'TECHNO BRATS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '279d0917-59a1-4d83-a027-2c28678a5bfb', 'ORION-S0070', 'Team_Name_26', 'teamname26', 'Sai Krishna K J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SAIKRISHNAKJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '279d0917-59a1-4d83-a027-2c28678a5bfb', 'VERIFIED-ORION-S0070', 'Sai Krishna K J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '279d0917-59a1-4d83-a027-2c28678a5bfb', 1, 'Shreya Sivakumar', 'Team_Name_26', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '279d0917-59a1-4d83-a027-2c28678a5bfb', 2, 'Ananthika S', 'Team_Name_26', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '279d0917-59a1-4d83-a027-2c28678a5bfb', 3, 'Nilavadhani GS', 'Team_Name_26', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c0f0fa8a-386d-4b76-8ad5-3a7fb18a6974', 'ORION-S0071', 'Bama Boyz', 'bamaboyz', 'Arjun', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ARJUN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c0f0fa8a-386d-4b76-8ad5-3a7fb18a6974', 'VERIFIED-ORION-S0071', 'Arjun', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c0f0fa8a-386d-4b76-8ad5-3a7fb18a6974', 1, 'Afnan Hussain k', 'Bama Boyz', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c0f0fa8a-386d-4b76-8ad5-3a7fb18a6974', 2, 'Pranay', 'Bama Boyz', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c0f0fa8a-386d-4b76-8ad5-3a7fb18a6974', 3, 'Sarvesh', 'Bama Boyz', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c0f0fa8a-386d-4b76-8ad5-3a7fb18a6974', 4, 'Hasim', 'Bama Boyz', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c0f0fa8a-386d-4b76-8ad5-3a7fb18a6974', 5, 'Guru prasath', 'Bama Boyz', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f9ed9e0f-32f2-4450-9360-1eafa50ec253', 'ORION-S0072', 'Femmora', 'femmora', 'Vaibhavashakthi R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'VAIBHAVASHAKTHIR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f9ed9e0f-32f2-4450-9360-1eafa50ec253', 'VERIFIED-ORION-S0072', 'Vaibhavashakthi R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f9ed9e0f-32f2-4450-9360-1eafa50ec253', 1, 'Varshitha R', 'Femmora', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f9ed9e0f-32f2-4450-9360-1eafa50ec253', 2, 'Sherlin Neha A J', 'Femmora', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f9ed9e0f-32f2-4450-9360-1eafa50ec253', 3, 'Suryapriya A G', 'Femmora', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f9ed9e0f-32f2-4450-9360-1eafa50ec253', 4, 'Harini S', 'Femmora', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f9ed9e0f-32f2-4450-9360-1eafa50ec253', 5, 'Sornambiga S', 'Femmora', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'eebf5779-537d-4318-8248-efc4f895eebd', 'ORION-S0073', 'LOGIC LEGIONS', 'logiclegions', 'SIVAM P', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SIVAMP',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'eebf5779-537d-4318-8248-efc4f895eebd', 'VERIFIED-ORION-S0073', 'SIVAM P', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eebf5779-537d-4318-8248-efc4f895eebd', 1, 'MOHITHRA', 'LOGIC LEGIONS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eebf5779-537d-4318-8248-efc4f895eebd', 2, 'Srivachan c s', 'LOGIC LEGIONS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eebf5779-537d-4318-8248-efc4f895eebd', 3, 'Siva Ranjan S', 'LOGIC LEGIONS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eebf5779-537d-4318-8248-efc4f895eebd', 4, 'Anika', 'LOGIC LEGIONS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eebf5779-537d-4318-8248-efc4f895eebd', 5, 'Ambika', 'LOGIC LEGIONS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f7e8d471-21da-4f37-8e4e-813b60788326', 'ORION-S0074', 'VisionX', 'visionx', 'Yazhini B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'YAZHINIB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f7e8d471-21da-4f37-8e4e-813b60788326', 'VERIFIED-ORION-S0074', 'Yazhini B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f7e8d471-21da-4f37-8e4e-813b60788326', 1, 'Dharshini P', 'VisionX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f7e8d471-21da-4f37-8e4e-813b60788326', 2, 'Bhavana Y', 'VisionX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f7e8d471-21da-4f37-8e4e-813b60788326', 3, 'Kanuri Manobhi Abh', 'VisionX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f7e8d471-21da-4f37-8e4e-813b60788326', 4, 'Poojitha G', 'VisionX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f7e8d471-21da-4f37-8e4e-813b60788326', 5, 'Nandhini Y', 'VisionX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '270a16c3-5a60-4c9f-a129-2b1b169e5694', 'ORION-S0075', 'The imposter', 'theimposter', 'Likith Krishna J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'LIKITHKRISHNAJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '270a16c3-5a60-4c9f-a129-2b1b169e5694', 'VERIFIED-ORION-S0075', 'Likith Krishna J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '270a16c3-5a60-4c9f-a129-2b1b169e5694', 1, 'B Lakshman', 'The imposter', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '270a16c3-5a60-4c9f-a129-2b1b169e5694', 2, 'Rishi S', 'The imposter', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '270a16c3-5a60-4c9f-a129-2b1b169e5694', 3, 'Charan Josh A', 'The imposter', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '270a16c3-5a60-4c9f-a129-2b1b169e5694', 4, 'Jagadhiswaran K', 'The imposter', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '09c1b111-9058-4579-8fa7-3d258a9c5b05', 'ORION-S0076', 'Kalephor', 'kalephor', 'Shivani SK', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SHIVANISK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '09c1b111-9058-4579-8fa7-3d258a9c5b05', 'VERIFIED-ORION-S0076', 'Shivani SK', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '09c1b111-9058-4579-8fa7-3d258a9c5b05', 1, 'Rakhesh Anand RA', 'Kalephor', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '09c1b111-9058-4579-8fa7-3d258a9c5b05', 2, 'paul bryton raj', 'Kalephor', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '09c1b111-9058-4579-8fa7-3d258a9c5b05', 3, 'Pon Vijayalakshmi', 'Kalephor', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '09c1b111-9058-4579-8fa7-3d258a9c5b05', 4, 'Ramya KN', 'Kalephor', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '09c1b111-9058-4579-8fa7-3d258a9c5b05', 5, 'Padmavathy', 'Kalephor', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '39b07835-6eca-4f53-9ea3-59f4a5d83c96', 'ORION-S0077', 'AgriVanguard', 'agrivanguard', 'Thodupunuri Sai Charan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'THODUPUNURISAICHARAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '39b07835-6eca-4f53-9ea3-59f4a5d83c96', 'VERIFIED-ORION-S0077', 'Thodupunuri Sai Charan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '39b07835-6eca-4f53-9ea3-59f4a5d83c96', 1, 'Akkala Rahul Reddy', 'AgriVanguard', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '39b07835-6eca-4f53-9ea3-59f4a5d83c96', 2, 'Nalla Shreekar', 'AgriVanguard', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '39b07835-6eca-4f53-9ea3-59f4a5d83c96', 3, 'Maramreddy Aakash', 'AgriVanguard', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '39b07835-6eca-4f53-9ea3-59f4a5d83c96', 4, 'Podugu Harish', 'AgriVanguard', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd53ba544-e928-4ae8-bbaa-86b8317bcad0', 'ORION-S0078', 'Team Synergy', 'teamsynergy', 'Nirmala Devi NS', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'NIRMALADEVINS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd53ba544-e928-4ae8-bbaa-86b8317bcad0', 'VERIFIED-ORION-S0078', 'Nirmala Devi NS', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd53ba544-e928-4ae8-bbaa-86b8317bcad0', 1, 'E Divya', 'Team Synergy', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd53ba544-e928-4ae8-bbaa-86b8317bcad0', 2, 'Mithra A', 'Team Synergy', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd53ba544-e928-4ae8-bbaa-86b8317bcad0', 3, 'Sanjay', 'Team Synergy', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd53ba544-e928-4ae8-bbaa-86b8317bcad0', 4, 'Jeswin Samuel P', 'Team Synergy', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd53ba544-e928-4ae8-bbaa-86b8317bcad0', 5, 'Nirmal Kumar N S', 'Team Synergy', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c474e07d-9925-49ef-8e60-039b05fb7064', 'ORION-S0079', 'Biobytes', 'biobytes', 'S A Srikanth', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SASRIKANTH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c474e07d-9925-49ef-8e60-039b05fb7064', 'VERIFIED-ORION-S0079', 'S A Srikanth', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c474e07d-9925-49ef-8e60-039b05fb7064', 1, 'Sherina K S', 'Biobytes', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c474e07d-9925-49ef-8e60-039b05fb7064', 2, 'Haniya.T', 'Biobytes', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c474e07d-9925-49ef-8e60-039b05fb7064', 3, 'Rakshana A', 'Biobytes', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c474e07d-9925-49ef-8e60-039b05fb7064', 4, 'Velu.E', 'Biobytes', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c474e07d-9925-49ef-8e60-039b05fb7064', 5, 'Taranesh S', 'Biobytes', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5410dedd-0150-497a-b632-400aff351816', 'ORION-S0080', 'JACK HACKROV', 'jackhackrov', 'VISHWA I', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'VISHWAI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5410dedd-0150-497a-b632-400aff351816', 'VERIFIED-ORION-S0080', 'VISHWA I', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5410dedd-0150-497a-b632-400aff351816', 1, 'SURYA BC', 'JACK HACKROV', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5410dedd-0150-497a-b632-400aff351816', 2, 'KILLIVALAVAN V', 'JACK HACKROV', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5410dedd-0150-497a-b632-400aff351816', 3, 'MOHAMMED ASIK T', 'JACK HACKROV', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5410dedd-0150-497a-b632-400aff351816', 4, 'SAKTHIVEL S', 'JACK HACKROV', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ed2b6828-21f4-4833-af9a-b34b17d686c7', 'ORION-S0081', 'IMPACT CODERS', 'impactcoders', 'Mohamed Aaseef M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MOHAMEDAASEEFM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ed2b6828-21f4-4833-af9a-b34b17d686c7', 'VERIFIED-ORION-S0081', 'Mohamed Aaseef M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ed2b6828-21f4-4833-af9a-b34b17d686c7', 1, 'Manoj R', 'IMPACT CODERS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ed2b6828-21f4-4833-af9a-b34b17d686c7', 2, 'Saravanakumar G', 'IMPACT CODERS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ed2b6828-21f4-4833-af9a-b34b17d686c7', 3, 'Sabarish J', 'IMPACT CODERS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ed2b6828-21f4-4833-af9a-b34b17d686c7', 4, 'Shafeeq S', 'IMPACT CODERS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ed2b6828-21f4-4833-af9a-b34b17d686c7', 5, 'Rohith V K', 'IMPACT CODERS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '35183132-1dc9-4282-bc98-44e1882bbb5c', 'ORION-S0082', 'Brain Byte', 'brainbyte', 'Aditi Phulre', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ADITIPHULRE',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '35183132-1dc9-4282-bc98-44e1882bbb5c', 'VERIFIED-ORION-S0082', 'Aditi Phulre', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '35183132-1dc9-4282-bc98-44e1882bbb5c', 1, 'Aditya Swaroop', 'Brain Byte', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '35183132-1dc9-4282-bc98-44e1882bbb5c', 2, 'Kavya Singh', 'Brain Byte', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '35183132-1dc9-4282-bc98-44e1882bbb5c', 3, 'Bhavay Mittal', 'Brain Byte', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '7c01c413-3fc3-4983-a9bf-23b3815ace9f', 'ORION-S0083', '404 Brain Not Found', '404brainnotfound', 'HARISH R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'HARISHR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '7c01c413-3fc3-4983-a9bf-23b3815ace9f', 'VERIFIED-ORION-S0083', 'HARISH R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7c01c413-3fc3-4983-a9bf-23b3815ace9f', 1, 'DINESH RAJ B', '404 Brain Not Found', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7c01c413-3fc3-4983-a9bf-23b3815ace9f', 2, 'RITHIN RS', '404 Brain Not Found', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7c01c413-3fc3-4983-a9bf-23b3815ace9f', 3, 'AJAY PRABU RK', '404 Brain Not Found', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '1c4caa8f-e6a3-4b8c-842c-6d7b3c205460', 'ORION-S0084', 'TOOTHPASTE EATERS', 'toothpasteeaters', 'RAJDEEP MAHADEV KULKARNI', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'RAJDEEPMAHADEVKULKARNI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '1c4caa8f-e6a3-4b8c-842c-6d7b3c205460', 'VERIFIED-ORION-S0084', 'RAJDEEP MAHADEV KULKARNI', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1c4caa8f-e6a3-4b8c-842c-6d7b3c205460', 1, 'Ayush Bidwai', 'TOOTHPASTE EATERS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1c4caa8f-e6a3-4b8c-842c-6d7b3c205460', 2, 'Madhur Grover', 'TOOTHPASTE EATERS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '63e7dfdc-da70-493a-b869-9bd60cfbc375', 'ORION-S0085', 'Mission:I''m-Possible Oxygen', 'missionimpossibleoxygen', 'Jai ganapathi.S.B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'JAIGANAPATHISB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '63e7dfdc-da70-493a-b869-9bd60cfbc375', 'VERIFIED-ORION-S0085', 'Jai ganapathi.S.B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '63e7dfdc-da70-493a-b869-9bd60cfbc375', 1, 'Harish.T', 'Mission:I''m-Possible Oxygen', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '63e7dfdc-da70-493a-b869-9bd60cfbc375', 2, 'Bolleboina Yashashwini Yada', 'Mission:I''m-Possible Oxygen', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '63e7dfdc-da70-493a-b869-9bd60cfbc375', 3, 'Anya Angel', 'Mission:I''m-Possible Oxygen', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '63e7dfdc-da70-493a-b869-9bd60cfbc375', 4, 'Abinaya S', 'Mission:I''m-Possible Oxygen', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'faec3575-aa3c-4b98-b7c1-9ab2abcb05f2', 'ORION-S0086', 'SHERLOCK', 'sherlock', 'Sai Aditiyaa R S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SAIADITIYAARS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'faec3575-aa3c-4b98-b7c1-9ab2abcb05f2', 'VERIFIED-ORION-S0086', 'Sai Aditiyaa R S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'faec3575-aa3c-4b98-b7c1-9ab2abcb05f2', 1, 'Saravana Prasath P', 'SHERLOCK', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'faec3575-aa3c-4b98-b7c1-9ab2abcb05f2', 2, 'Elakkiya K', 'SHERLOCK', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'faec3575-aa3c-4b98-b7c1-9ab2abcb05f2', 3, 'Vrithika Sri', 'SHERLOCK', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'faec3575-aa3c-4b98-b7c1-9ab2abcb05f2', 4, 'Sarath Chander M', 'SHERLOCK', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c1b40479-0397-4384-a0e9-eddf9bd12bb4', 'ORION-S0087', 'PERCEPTRON', 'perceptron', 'Sanjai R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SANJAIR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c1b40479-0397-4384-a0e9-eddf9bd12bb4', 'VERIFIED-ORION-S0087', 'Sanjai R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c1b40479-0397-4384-a0e9-eddf9bd12bb4', 1, 'Yogapradeep B', 'PERCEPTRON', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c1b40479-0397-4384-a0e9-eddf9bd12bb4', 2, 'Sabarish R', 'PERCEPTRON', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c1b40479-0397-4384-a0e9-eddf9bd12bb4', 3, 'Sengan s', 'PERCEPTRON', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c1b40479-0397-4384-a0e9-eddf9bd12bb4', 4, 'Vignesh R', 'PERCEPTRON', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c1b40479-0397-4384-a0e9-eddf9bd12bb4', 5, 'Suriya M', 'PERCEPTRON', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '490ad1f1-8ff7-4cb9-81c0-643c2fe3b537', 'ORION-S0088', 'core signal', 'coresignal', 'prasanna kumar', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PRASANNAKUMAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '490ad1f1-8ff7-4cb9-81c0-643c2fe3b537', 'VERIFIED-ORION-S0088', 'prasanna kumar', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '490ad1f1-8ff7-4cb9-81c0-643c2fe3b537', 1, 'praveen kumar', 'core signal', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '490ad1f1-8ff7-4cb9-81c0-643c2fe3b537', 2, 'Sanjeeth', 'core signal', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '490ad1f1-8ff7-4cb9-81c0-643c2fe3b537', 3, 'Nivetha', 'core signal', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '490ad1f1-8ff7-4cb9-81c0-643c2fe3b537', 4, 'Monika', 'core signal', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '490ad1f1-8ff7-4cb9-81c0-643c2fe3b537', 5, 'Sabharish', 'core signal', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'a2f53ce5-0953-44a5-82d3-a32f7ab02524', 'ORION-S0089', 'Technova', 'technova', 'S.Lakshaya', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SLAKSHAYA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'a2f53ce5-0953-44a5-82d3-a32f7ab02524', 'VERIFIED-ORION-S0089', 'S.Lakshaya', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a2f53ce5-0953-44a5-82d3-a32f7ab02524', 1, 'Maha Lakshmi. G', 'Technova', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a2f53ce5-0953-44a5-82d3-a32f7ab02524', 2, 'Raevan karthik', 'Technova', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a2f53ce5-0953-44a5-82d3-a32f7ab02524', 3, 'Padmashree E K', 'Technova', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f972a88a-f06b-4022-8f2f-7ea6800be298', 'ORION-S0090', 'Fight club', 'fightclub', 'M. SHEIK SHAHIN', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MSHEIKSHAHIN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f972a88a-f06b-4022-8f2f-7ea6800be298', 'VERIFIED-ORION-S0090', 'M. SHEIK SHAHIN', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f972a88a-f06b-4022-8f2f-7ea6800be298', 1, 'VINAYAK YUDHANU', 'Fight club', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f972a88a-f06b-4022-8f2f-7ea6800be298', 2, 'STEFIN SURYA R', 'Fight club', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f972a88a-f06b-4022-8f2f-7ea6800be298', 3, 'SANJAY MURUGAN', 'Fight club', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f972a88a-f06b-4022-8f2f-7ea6800be298', 4, 'TEJASWINI', 'Fight club', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f972a88a-f06b-4022-8f2f-7ea6800be298', 5, 'VINOTHINI', 'Fight club', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'e90bbeee-e2f3-4855-9338-8c93731971dc', 'ORION-S0091', 'NEXORA', 'nexora', 'AGILESH M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'AGILESHM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'e90bbeee-e2f3-4855-9338-8c93731971dc', 'VERIFIED-ORION-S0091', 'AGILESH M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e90bbeee-e2f3-4855-9338-8c93731971dc', 1, 'GOWTHAM A', 'NEXORA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e90bbeee-e2f3-4855-9338-8c93731971dc', 2, 'Mohammad tharif', 'NEXORA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e90bbeee-e2f3-4855-9338-8c93731971dc', 3, 'THOTA YUVASENA', 'NEXORA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e90bbeee-e2f3-4855-9338-8c93731971dc', 4, 'Sakthipriya B', 'NEXORA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e90bbeee-e2f3-4855-9338-8c93731971dc', 5, 'Indujaa k', 'NEXORA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd2723c32-cc88-4542-9b5c-162d0fde59cf', 'ORION-S0092', 'Impact warriors', 'impactwarriors', 'V DIVYESH', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'VDIVYESH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd2723c32-cc88-4542-9b5c-162d0fde59cf', 'VERIFIED-ORION-S0092', 'V DIVYESH', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd2723c32-cc88-4542-9b5c-162d0fde59cf', 1, 'R V SENA VARSHAN', 'Impact warriors', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd2723c32-cc88-4542-9b5c-162d0fde59cf', 2, 'GOWTHAM S', 'Impact warriors', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd2723c32-cc88-4542-9b5c-162d0fde59cf', 3, 'YESHWANT C', 'Impact warriors', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '1b0eb0c2-b3dc-421b-9ffb-3ea9c7042e03', 'ORION-S0093', 'CodeMonkeys', 'codemonkeys', 'Hari Vishva S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'HARIVISHVAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '1b0eb0c2-b3dc-421b-9ffb-3ea9c7042e03', 'VERIFIED-ORION-S0093', 'Hari Vishva S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1b0eb0c2-b3dc-421b-9ffb-3ea9c7042e03', 1, 'Yuvaraj H', 'CodeMonkeys', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1b0eb0c2-b3dc-421b-9ffb-3ea9c7042e03', 2, 'Ahilesh Guru S', 'CodeMonkeys', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1b0eb0c2-b3dc-421b-9ffb-3ea9c7042e03', 3, 'K Monasri', 'CodeMonkeys', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1b0eb0c2-b3dc-421b-9ffb-3ea9c7042e03', 4, 'Devisri K', 'CodeMonkeys', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c9a1c35e-563d-4976-b4ca-ccc47f08e73f', 'ORION-S0094', 'Techmates', 'techmates', 'Samitha. K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SAMITHAK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c9a1c35e-563d-4976-b4ca-ccc47f08e73f', 'VERIFIED-ORION-S0094', 'Samitha. K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c9a1c35e-563d-4976-b4ca-ccc47f08e73f', 1, 'Nandhini. V', 'Techmates', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c9a1c35e-563d-4976-b4ca-ccc47f08e73f', 2, 'Sreenidhi. S', 'Techmates', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '02e32e87-8ae3-42e7-9c5a-2e79ebe900de', 'ORION-S0095', 'SALTVISIONAI', 'saltvisionai', 'Mohammed Emtheyas S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MOHAMMEDEMTHEYASS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '02e32e87-8ae3-42e7-9c5a-2e79ebe900de', 'VERIFIED-ORION-S0095', 'Mohammed Emtheyas S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '02e32e87-8ae3-42e7-9c5a-2e79ebe900de', 1, 'DHANALAKSHMI K', 'SALTVISIONAI', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '02e32e87-8ae3-42e7-9c5a-2e79ebe900de', 2, 'Benadict thomas O.J', 'SALTVISIONAI', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '02e32e87-8ae3-42e7-9c5a-2e79ebe900de', 3, 'Lingesh M', 'SALTVISIONAI', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'cf9c0fce-aa8d-4eaf-bf85-f5efda5067ed', 'ORION-S0096', 'Nex 6', 'nex6', 'DILIPAN P', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'DILIPANP',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'cf9c0fce-aa8d-4eaf-bf85-f5efda5067ed', 'VERIFIED-ORION-S0096', 'DILIPAN P', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cf9c0fce-aa8d-4eaf-bf85-f5efda5067ed', 1, 'Sadhish R', 'Nex 6', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cf9c0fce-aa8d-4eaf-bf85-f5efda5067ed', 2, 'Rashena l', 'Nex 6', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cf9c0fce-aa8d-4eaf-bf85-f5efda5067ed', 3, 'Kalaimathi G', 'Nex 6', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cf9c0fce-aa8d-4eaf-bf85-f5efda5067ed', 4, 'Keerthisha R', 'Nex 6', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cf9c0fce-aa8d-4eaf-bf85-f5efda5067ed', 5, 'Joshitha S', 'Nex 6', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '7acfc750-6024-45f2-b178-b05c5fb3d6ad', 'ORION-S0097', 'SPIDEYVERSE', 'spideyverse', 'Hemamalini K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'HEMAMALINIK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '7acfc750-6024-45f2-b178-b05c5fb3d6ad', 'VERIFIED-ORION-S0097', 'Hemamalini K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7acfc750-6024-45f2-b178-b05c5fb3d6ad', 1, 'Venkat Yokash K', 'SPIDEYVERSE', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7acfc750-6024-45f2-b178-b05c5fb3d6ad', 2, 'PUGAZHARASI K', 'SPIDEYVERSE', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7acfc750-6024-45f2-b178-b05c5fb3d6ad', 3, 'Sandhya B', 'SPIDEYVERSE', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '424fedaf-98d8-4a6b-9f53-459e1284ec32', 'ORION-S0098', 'Quantum Force', 'quantumforce', 'B Gopinath', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'BGOPINATH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '424fedaf-98d8-4a6b-9f53-459e1284ec32', 'VERIFIED-ORION-S0098', 'B Gopinath', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '424fedaf-98d8-4a6b-9f53-459e1284ec32', 1, 'Kumaran S', 'Quantum Force', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '424fedaf-98d8-4a6b-9f53-459e1284ec32', 2, 'Kathikeyan A', 'Quantum Force', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '424fedaf-98d8-4a6b-9f53-459e1284ec32', 3, 'Kawsik M', 'Quantum Force', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '424fedaf-98d8-4a6b-9f53-459e1284ec32', 4, 'Jitenra Rajan V', 'Quantum Force', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '424fedaf-98d8-4a6b-9f53-459e1284ec32', 5, 'Jones Abhishek', 'Quantum Force', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'bba17eb2-8a9b-4ff2-a34b-b465d64c86b4', 'ORION-S0099', 'Riot', 'riot', 'P. Pragathy', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PPRAGATHY',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'bba17eb2-8a9b-4ff2-a34b-b465d64c86b4', 'VERIFIED-ORION-S0099', 'P. Pragathy', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bba17eb2-8a9b-4ff2-a34b-b465d64c86b4', 1, 'Lohit', 'Riot', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bba17eb2-8a9b-4ff2-a34b-b465d64c86b4', 2, 'Aadhil shajahan', 'Riot', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bba17eb2-8a9b-4ff2-a34b-b465d64c86b4', 3, 'Siddhi vinayak', 'Riot', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '07e45dca-29ec-41f3-bec7-dcdbd9c631ac', 'ORION-S0101', 'FLOWPILOT', 'flowpilot', 'Pranosh M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PRANOSHM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '07e45dca-29ec-41f3-bec7-dcdbd9c631ac', 'VERIFIED-ORION-S0101', 'Pranosh M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '07e45dca-29ec-41f3-bec7-dcdbd9c631ac', 1, 'Praveen S', 'FLOWPILOT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '07e45dca-29ec-41f3-bec7-dcdbd9c631ac', 2, 'Rahim Khan S', 'FLOWPILOT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '07e45dca-29ec-41f3-bec7-dcdbd9c631ac', 3, 'Prajan M', 'FLOWPILOT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '07e45dca-29ec-41f3-bec7-dcdbd9c631ac', 4, 'Rahul S', 'FLOWPILOT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '9fe27e8a-b303-4461-86c0-a0290fd866e9', 'ORION-S0102', 'SYNC SQUAD', 'syncsquad', 'MOHAMED RIYASDEEN I', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MOHAMEDRIYASDEENI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '9fe27e8a-b303-4461-86c0-a0290fd866e9', 'VERIFIED-ORION-S0102', 'MOHAMED RIYASDEEN I', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9fe27e8a-b303-4461-86c0-a0290fd866e9', 1, 'MOHAMMED ASIF N', 'SYNC SQUAD', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9fe27e8a-b303-4461-86c0-a0290fd866e9', 2, 'VARSHINI S', 'SYNC SQUAD', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9fe27e8a-b303-4461-86c0-a0290fd866e9', 3, 'ANSHIGA R', 'SYNC SQUAD', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9fe27e8a-b303-4461-86c0-a0290fd866e9', 4, 'PREMA LATHA E V', 'SYNC SQUAD', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9fe27e8a-b303-4461-86c0-a0290fd866e9', 5, 'JEEVAN S', 'SYNC SQUAD', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'e401b585-e6ef-449c-a5f1-83a6dc7204bd', 'ORION-S0103', 'TENSOR TITANS', 'tensortitans', 'Jessica J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'JESSICAJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'e401b585-e6ef-449c-a5f1-83a6dc7204bd', 'VERIFIED-ORION-S0103', 'Jessica J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e401b585-e6ef-449c-a5f1-83a6dc7204bd', 1, 'Kanisha Devi S', 'TENSOR TITANS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e401b585-e6ef-449c-a5f1-83a6dc7204bd', 2, 'Harsha S', 'TENSOR TITANS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e401b585-e6ef-449c-a5f1-83a6dc7204bd', 3, 'Meena Raj M.G', 'TENSOR TITANS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e401b585-e6ef-449c-a5f1-83a6dc7204bd', 4, 'Kavya A', 'TENSOR TITANS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '63b86f9d-3aac-4c72-b652-0e20690d9394', 'ORION-S0104', 'KernelPanic', 'kernelpanic', 'Aaruran. K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'AARURANK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '63b86f9d-3aac-4c72-b652-0e20690d9394', 'VERIFIED-ORION-S0104', 'Aaruran. K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '63b86f9d-3aac-4c72-b652-0e20690d9394', 1, 'Abiraj.K', 'KernelPanic', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '63b86f9d-3aac-4c72-b652-0e20690d9394', 2, 'Ajay.S', 'KernelPanic', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '63b86f9d-3aac-4c72-b652-0e20690d9394', 3, 'Balamurugan.S', 'KernelPanic', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '63b86f9d-3aac-4c72-b652-0e20690d9394', 4, 'Dhinesh.N', 'KernelPanic', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '63b86f9d-3aac-4c72-b652-0e20690d9394', 5, 'Devavarnine.M', 'KernelPanic', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '75b15063-6bd5-41fb-8418-843c6ba9fff2', 'ORION-S0105', 'OMEGA', 'omega', 'R RITHWIK', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'RRITHWIK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '75b15063-6bd5-41fb-8418-843c6ba9fff2', 'VERIFIED-ORION-S0105', 'R RITHWIK', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '75b15063-6bd5-41fb-8418-843c6ba9fff2', 1, 'C SHRAVAN KHANA', 'OMEGA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '75b15063-6bd5-41fb-8418-843c6ba9fff2', 2, 'T kirthik', 'OMEGA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c5c75657-6ff2-4a78-b93e-711419fa9b16', 'ORION-S0106', 'Binary Titans', 'binarytitans', 'M.Madhuri', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MMADHURI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c5c75657-6ff2-4a78-b93e-711419fa9b16', 'VERIFIED-ORION-S0106', 'M.Madhuri', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c5c75657-6ff2-4a78-b93e-711419fa9b16', 1, 'R. Shivaram', 'Binary Titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c54004e9-461c-4c40-b02d-456c4c3746db', 'ORION-S0107', 'NEXO', 'nexo', 'Ashwath M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ASHWATHM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c54004e9-461c-4c40-b02d-456c4c3746db', 'VERIFIED-ORION-S0107', 'Ashwath M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c54004e9-461c-4c40-b02d-456c4c3746db', 1, 'G Dhanalakshmi', 'NEXO', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5736ab44-0901-4b93-91b0-a8fe4de7125d', 'ORION-S0108', 'FNATIC', 'fnatic', 'Leema S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'LEEMAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5736ab44-0901-4b93-91b0-a8fe4de7125d', 'VERIFIED-ORION-S0108', 'Leema S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5736ab44-0901-4b93-91b0-a8fe4de7125d', 1, 'Divesh N', 'FNATIC', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5736ab44-0901-4b93-91b0-a8fe4de7125d', 2, 'Mrudhula B', 'FNATIC', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5736ab44-0901-4b93-91b0-a8fe4de7125d', 3, 'Abhinava Ashwin R', 'FNATIC', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5736ab44-0901-4b93-91b0-a8fe4de7125d', 4, 'Mohammad Ejaz M', 'FNATIC', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5736ab44-0901-4b93-91b0-a8fe4de7125d', 5, 'Mukeshkumar S', 'FNATIC', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '52153fb4-b5ed-46b0-9f90-7353865bb16e', 'ORION-S0109', 'TOUCH GRASS', 'touchgrass', 'TK DHARMESH KUMAR', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'TKDHARMESHKUMAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '52153fb4-b5ed-46b0-9f90-7353865bb16e', 'VERIFIED-ORION-S0109', 'TK DHARMESH KUMAR', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '52153fb4-b5ed-46b0-9f90-7353865bb16e', 1, 'SAMYUKTHA.V', 'TOUCH GRASS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '52153fb4-b5ed-46b0-9f90-7353865bb16e', 2, 'SRUTHI.S', 'TOUCH GRASS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '52153fb4-b5ed-46b0-9f90-7353865bb16e', 3, 'M.BHAVESH NATH', 'TOUCH GRASS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '52153fb4-b5ed-46b0-9f90-7353865bb16e', 4, 'PB PRANAV RAM', 'TOUCH GRASS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '52153fb4-b5ed-46b0-9f90-7353865bb16e', 5, 'P.SRI PRIYAN', 'TOUCH GRASS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '72675ed4-74eb-441f-84f2-474d595e615a', 'ORION-S0110', 'Codex', 'codex', 'Praveen S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PRAVEENS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '72675ed4-74eb-441f-84f2-474d595e615a', 'VERIFIED-ORION-S0110', 'Praveen S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '72675ed4-74eb-441f-84f2-474d595e615a', 1, 'Mohammed Thamz', 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '72675ed4-74eb-441f-84f2-474d595e615a', 2, 'Monish M', 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '72675ed4-74eb-441f-84f2-474d595e615a', 3, 'Nirubanraaj J', 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '72675ed4-74eb-441f-84f2-474d595e615a', 4, 'Muthu durai S', 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '72675ed4-74eb-441f-84f2-474d595e615a', 5, 'Mohamed Aathif Jailani S', 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd11b64f7-cf1a-4412-aeb1-0d8c1d344eb5', 'ORION-S0111', 'Arvion', 'arvion', 'Pranesh Mithun G S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PRANESHMITHUNGS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd11b64f7-cf1a-4412-aeb1-0d8c1d344eb5', 'VERIFIED-ORION-S0111', 'Pranesh Mithun G S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd11b64f7-cf1a-4412-aeb1-0d8c1d344eb5', 1, 'Nishmitha JS', 'Arvion', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd11b64f7-cf1a-4412-aeb1-0d8c1d344eb5', 2, 'NithyaShree T', 'Arvion', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd11b64f7-cf1a-4412-aeb1-0d8c1d344eb5', 3, 'Prithvi Kumaran R', 'Arvion', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd11b64f7-cf1a-4412-aeb1-0d8c1d344eb5', 4, 'Nivetha S', 'Arvion', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd11b64f7-cf1a-4412-aeb1-0d8c1d344eb5', 5, 'Prasanna Venkat G', 'Arvion', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4a4890d9-8df1-4852-9d7f-ada4f7eaad89', 'ORION-S0112', 'Vaishnavi devi G', 'vaishnavidevig', 'Vaishnavi devi G', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'VAISHNAVIDEVIG',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4a4890d9-8df1-4852-9d7f-ada4f7eaad89', 'VERIFIED-ORION-S0112', 'Vaishnavi devi G', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4a4890d9-8df1-4852-9d7f-ada4f7eaad89', 1, 'Thejesvani S', 'Vaishnavi devi G', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4a4890d9-8df1-4852-9d7f-ada4f7eaad89', 2, 'S G Yogitha', 'Vaishnavi devi G', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0ec30237-9ec6-44e7-b131-2f305c597582', 'ORION-S0113', 'NOVARYN', 'novaryn', 'Barathi Sankar M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'BARATHISANKARM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0ec30237-9ec6-44e7-b131-2f305c597582', 'VERIFIED-ORION-S0113', 'Barathi Sankar M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ec30237-9ec6-44e7-b131-2f305c597582', 1, 'Jeevadharani VG', 'NOVARYN', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ec30237-9ec6-44e7-b131-2f305c597582', 2, 'Janani C', 'NOVARYN', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ec30237-9ec6-44e7-b131-2f305c597582', 3, 'Jeevitha V', 'NOVARYN', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ec30237-9ec6-44e7-b131-2f305c597582', 4, 'Dhanalakshmi S', 'NOVARYN', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4f144dac-0acb-481a-b536-a789c95f98e0', 'ORION-S0114', 'THE HEXA GEN', 'thehexagen', 'HRITHISHVAR', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'HRITHISHVAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4f144dac-0acb-481a-b536-a789c95f98e0', 'VERIFIED-ORION-S0114', 'HRITHISHVAR', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4f144dac-0acb-481a-b536-a789c95f98e0', 1, 'LOKESHWARAN', 'THE HEXA GEN', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4f144dac-0acb-481a-b536-a789c95f98e0', 2, 'KAVYASRI', 'THE HEXA GEN', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4f144dac-0acb-481a-b536-a789c95f98e0', 3, 'RITHIKASRI', 'THE HEXA GEN', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4f144dac-0acb-481a-b536-a789c95f98e0', 4, 'HARINI JAISHANKAR', 'THE HEXA GEN', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '842f624c-8f7b-4ddc-b2f5-6f47692983f2', 'ORION-S0115', 'KernelZero', 'kernelzero', 'Priyan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PRIYAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '842f624c-8f7b-4ddc-b2f5-6f47692983f2', 'VERIFIED-ORION-S0115', 'Priyan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '842f624c-8f7b-4ddc-b2f5-6f47692983f2', 1, 'Arjjun S', 'KernelZero', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '842f624c-8f7b-4ddc-b2f5-6f47692983f2', 2, 'Sathappan PL', 'KernelZero', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '842f624c-8f7b-4ddc-b2f5-6f47692983f2', 3, 'Bala Tharun S', 'KernelZero', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '842f624c-8f7b-4ddc-b2f5-6f47692983f2', 4, 'Saarvin GP', 'KernelZero', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '842f624c-8f7b-4ddc-b2f5-6f47692983f2', 5, 'Raghul S', 'KernelZero', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ac61a482-cb4e-4bc2-b04a-2da9437a60b7', 'ORION-S0116', 'Codenova', 'codenova', 'Praveena k', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PRAVEENAK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ac61a482-cb4e-4bc2-b04a-2da9437a60b7', 'VERIFIED-ORION-S0116', 'Praveena k', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ac61a482-cb4e-4bc2-b04a-2da9437a60b7', 1, 'Prithika p', 'Codenova', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ac61a482-cb4e-4bc2-b04a-2da9437a60b7', 2, 'Ponmathi i', 'Codenova', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ac61a482-cb4e-4bc2-b04a-2da9437a60b7', 3, 'Ponmani M', 'Codenova', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ac61a482-cb4e-4bc2-b04a-2da9437a60b7', 4, 'Janani S', 'Codenova', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8a8e5436-b372-4dfd-9060-a9d3301f921a', 'ORION-S0117', 'Masterminds', 'masterminds', 'Greeshma tarlana', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'GREESHMATARLANA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8a8e5436-b372-4dfd-9060-a9d3301f921a', 'VERIFIED-ORION-S0117', 'Greeshma tarlana', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8a8e5436-b372-4dfd-9060-a9d3301f921a', 1, 'Pragna boddu', 'Masterminds', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8a8e5436-b372-4dfd-9060-a9d3301f921a', 2, 'Haripriya', 'Masterminds', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8a8e5436-b372-4dfd-9060-a9d3301f921a', 3, 'Manikanta.G', 'Masterminds', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd3355112-5d9e-4789-bce4-9127f278e22b', 'ORION-S0118', 'Jarvis 6.O', 'jarvis6o', 'Roshan G', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ROSHANG',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd3355112-5d9e-4789-bce4-9127f278e22b', 'VERIFIED-ORION-S0118', 'Roshan G', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd3355112-5d9e-4789-bce4-9127f278e22b', 1, 'Sriabirami V', 'Jarvis 6.O', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd3355112-5d9e-4789-bce4-9127f278e22b', 2, 'Saran E', 'Jarvis 6.O', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd3355112-5d9e-4789-bce4-9127f278e22b', 3, 'Praveen raj V', 'Jarvis 6.O', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd3355112-5d9e-4789-bce4-9127f278e22b', 4, 'Vidula C', 'Jarvis 6.O', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'e10592d3-ace9-46aa-b474-a766491b0dd0', 'ORION-S0119', 'Veridia', 'veridia', 'Nadhiv Karuppuswamy', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'NADHIVKARUPPUSWAMY',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'e10592d3-ace9-46aa-b474-a766491b0dd0', 'VERIFIED-ORION-S0119', 'Nadhiv Karuppuswamy', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e10592d3-ace9-46aa-b474-a766491b0dd0', 1, 'Mohammed Anas', 'Veridia', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e10592d3-ace9-46aa-b474-a766491b0dd0', 2, 'M.A ROSHAN', 'Veridia', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e10592d3-ace9-46aa-b474-a766491b0dd0', 3, 'SANTHOSH K', 'Veridia', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ece9c25a-d71c-4a76-8b16-9b96c18a60e3', 'ORION-S0120', 'FutureCode', 'futurecode', 'Kevin Harris', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'KEVINHARRIS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ece9c25a-d71c-4a76-8b16-9b96c18a60e3', 'VERIFIED-ORION-S0120', 'Kevin Harris', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ece9c25a-d71c-4a76-8b16-9b96c18a60e3', 1, 'Keerthi Shri', 'FutureCode', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ece9c25a-d71c-4a76-8b16-9b96c18a60e3', 2, 'Lakshikanth', 'FutureCode', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '9e5bb7a9-2a28-4426-af91-1d331c99fa6c', 'ORION-S0121', 'Team trinity', 'teamtrinity', 'Sudharsan R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SUDHARSANR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '9e5bb7a9-2a28-4426-af91-1d331c99fa6c', 'VERIFIED-ORION-S0121', 'Sudharsan R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9e5bb7a9-2a28-4426-af91-1d331c99fa6c', 1, 'Kavyasri P', 'Team trinity', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9e5bb7a9-2a28-4426-af91-1d331c99fa6c', 2, 'Bavasree R', 'Team trinity', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9e5bb7a9-2a28-4426-af91-1d331c99fa6c', 3, 'Pravin kumar D', 'Team trinity', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9e5bb7a9-2a28-4426-af91-1d331c99fa6c', 4, 'Jeganath Kumar S', 'Team trinity', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '6b3d9931-50a2-4a1a-a1d3-e55a57f18874', 'ORION-S0122', 'Byteforce', 'byteforce', 'Kishorekumar', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'KISHOREKUMAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '6b3d9931-50a2-4a1a-a1d3-e55a57f18874', 'VERIFIED-ORION-S0122', 'Kishorekumar', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6b3d9931-50a2-4a1a-a1d3-e55a57f18874', 1, 'Yogavin', 'Byteforce', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6b3d9931-50a2-4a1a-a1d3-e55a57f18874', 2, 'Rishiraj', 'Byteforce', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6b3d9931-50a2-4a1a-a1d3-e55a57f18874', 3, 'Rajeshwar', 'Byteforce', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6b3d9931-50a2-4a1a-a1d3-e55a57f18874', 4, 'Divagar', 'Byteforce', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '436f1041-5855-4873-9bb9-9856f253aaa7', 'ORION-S0123', 'KNIGHT CODERS', 'knightcoders', 'Hareesh VN', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'HAREESHVN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '436f1041-5855-4873-9bb9-9856f253aaa7', 'VERIFIED-ORION-S0123', 'Hareesh VN', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '436f1041-5855-4873-9bb9-9856f253aaa7', 1, 'Hevan Harish LM', 'KNIGHT CODERS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ee575dbb-c6bc-4af7-82c5-3473fa7cb59f', 'ORION-S0124', 'Hack Elite', 'hackelite', 'OMSAIVAMSI V', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'OMSAIVAMSIV',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ee575dbb-c6bc-4af7-82c5-3473fa7cb59f', 'VERIFIED-ORION-S0124', 'OMSAIVAMSI V', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ee575dbb-c6bc-4af7-82c5-3473fa7cb59f', 1, 'Bala Adithya S U', 'Hack Elite', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ee575dbb-c6bc-4af7-82c5-3473fa7cb59f', 2, 'Gnanaprakasam C', 'Hack Elite', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '19c1b2ac-34f4-42af-90b7-9e74caff6864', 'ORION-S0125', 'Neural Ninjas', 'neuralninjas', 'Theshna R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'THESHNAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '19c1b2ac-34f4-42af-90b7-9e74caff6864', 'VERIFIED-ORION-S0125', 'Theshna R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '19c1b2ac-34f4-42af-90b7-9e74caff6864', 1, 'Amala abisha J', 'Neural Ninjas', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '19c1b2ac-34f4-42af-90b7-9e74caff6864', 2, 'Rithika V', 'Neural Ninjas', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '19c1b2ac-34f4-42af-90b7-9e74caff6864', 3, 'Shahel Netha M', 'Neural Ninjas', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '19c1b2ac-34f4-42af-90b7-9e74caff6864', 4, 'Jennet Pauline D', 'Neural Ninjas', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '85f4accb-36db-45bb-b03b-6e6e756731d1', 'ORION-S0126', 'Astrivex', 'astrivex', 'Sree Harsana K K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SREEHARSANAKK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '85f4accb-36db-45bb-b03b-6e6e756731d1', 'VERIFIED-ORION-S0126', 'Sree Harsana K K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '85f4accb-36db-45bb-b03b-6e6e756731d1', 1, 'Rhaghav C', 'Astrivex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '85f4accb-36db-45bb-b03b-6e6e756731d1', 2, 'Pon Nivetha M', 'Astrivex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'bd91918c-6bce-44bb-a511-799036392c9a', 'ORION-S0127', 'HEXAverse', 'hexaverse', 'Pooja Kumar', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'POOJAKUMAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'bd91918c-6bce-44bb-a511-799036392c9a', 'VERIFIED-ORION-S0127', 'Pooja Kumar', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bd91918c-6bce-44bb-a511-799036392c9a', 1, 'Jeffrin M', 'HEXAverse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bd91918c-6bce-44bb-a511-799036392c9a', 2, 'Kaneska S M', 'HEXAverse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bd91918c-6bce-44bb-a511-799036392c9a', 3, 'Kaviya sri V', 'HEXAverse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bd91918c-6bce-44bb-a511-799036392c9a', 4, 'Kaniga P R', 'HEXAverse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bd91918c-6bce-44bb-a511-799036392c9a', 5, 'Kaviarasi D', 'HEXAverse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '83fe4881-f410-4148-8788-cc50af133496', 'ORION-S0128', 'Forged In Code', 'forgedincode', 'Hareeni Pavendan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'HAREENIPAVENDAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '83fe4881-f410-4148-8788-cc50af133496', 'VERIFIED-ORION-S0128', 'Hareeni Pavendan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '83fe4881-f410-4148-8788-cc50af133496', 1, 'Deepika Shivani V', 'Forged In Code', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '83fe4881-f410-4148-8788-cc50af133496', 2, 'M.JAYASHRI', 'Forged In Code', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '83fe4881-f410-4148-8788-cc50af133496', 3, 'BA GURUPRIYA', 'Forged In Code', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '83fe4881-f410-4148-8788-cc50af133496', 4, 'Arulmozhi S', 'Forged In Code', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '83fe4881-f410-4148-8788-cc50af133496', 5, 'Ranjith S', 'Forged In Code', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '429e9906-6895-4145-993e-ee917505f074', 'ORION-S0129', 'Zoro', 'zoro', 'Gayathri.K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'GAYATHRIK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '429e9906-6895-4145-993e-ee917505f074', 'VERIFIED-ORION-S0129', 'Gayathri.K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '429e9906-6895-4145-993e-ee917505f074', 1, 'Keerthiga.O', 'Zoro', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '429e9906-6895-4145-993e-ee917505f074', 2, 'Kotteeswari.R', 'Zoro', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '429e9906-6895-4145-993e-ee917505f074', 3, 'Balaji Aravind .R', 'Zoro', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '429e9906-6895-4145-993e-ee917505f074', 4, 'Nitheshkumaran.S', 'Zoro', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '429e9906-6895-4145-993e-ee917505f074', 5, 'Lalitha.M.J', 'Zoro', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'a85858aa-6af2-4c2d-b172-dc5f1ed52d2f', 'ORION-S0130', 'Cyber Rookies', 'cyberrookies', 'Yuvaraj K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'YUVARAJK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'a85858aa-6af2-4c2d-b172-dc5f1ed52d2f', 'VERIFIED-ORION-S0130', 'Yuvaraj K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a85858aa-6af2-4c2d-b172-dc5f1ed52d2f', 1, 'Subabalan S', 'Cyber Rookies', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a85858aa-6af2-4c2d-b172-dc5f1ed52d2f', 2, 'Sanjay D', 'Cyber Rookies', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0354e736-f505-4852-b584-2fcf75181e1f', 'ORION-S0131', 'Neuroforge', 'neuroforge', 'Hashvant S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'HASHVANTS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0354e736-f505-4852-b584-2fcf75181e1f', 'VERIFIED-ORION-S0131', 'Hashvant S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0354e736-f505-4852-b584-2fcf75181e1f', 1, 'S Bhavana Shree', 'Neuroforge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0354e736-f505-4852-b584-2fcf75181e1f', 2, 'Mahalakshmi V', 'Neuroforge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0354e736-f505-4852-b584-2fcf75181e1f', 3, 'Mithra K', 'Neuroforge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0354e736-f505-4852-b584-2fcf75181e1f', 4, 'Logitha L', 'Neuroforge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0354e736-f505-4852-b584-2fcf75181e1f', 5, 'T MADHESH KUMAR', 'Neuroforge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b8e3a8ac-ea30-4ad6-ac7e-998d65a85ea4', 'ORION-S0132', 'Varns', 'varns', 'A.Harshith', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'AHARSHITH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b8e3a8ac-ea30-4ad6-ac7e-998d65a85ea4', 'VERIFIED-ORION-S0132', 'A.Harshith', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b8e3a8ac-ea30-4ad6-ac7e-998d65a85ea4', 1, 'M Lokeswara', 'Varns', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b8e3a8ac-ea30-4ad6-ac7e-998d65a85ea4', 2, 'Mukesh Chowdary', 'Varns', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b8e3a8ac-ea30-4ad6-ac7e-998d65a85ea4', 3, 'Kamal', 'Varns', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b8e3a8ac-ea30-4ad6-ac7e-998d65a85ea4', 4, 'Vamsi', 'Varns', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b8e3a8ac-ea30-4ad6-ac7e-998d65a85ea4', 5, 'Thoufiq', 'Varns', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '019cf409-e5dd-4606-92c1-6abb596acb3d', 'ORION-S0133', 'PHOENIX PROTOCOL', 'phoenixprotocol', 'SRI LAKSHMI V J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SRILAKSHMIVJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '019cf409-e5dd-4606-92c1-6abb596acb3d', 'VERIFIED-ORION-S0133', 'SRI LAKSHMI V J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '019cf409-e5dd-4606-92c1-6abb596acb3d', 1, 'DEVIPRIYA R', 'PHOENIX PROTOCOL', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '019cf409-e5dd-4606-92c1-6abb596acb3d', 2, 'THANVITHA DOMMARAJU C', 'PHOENIX PROTOCOL', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '019cf409-e5dd-4606-92c1-6abb596acb3d', 3, 'VALERIN BRUCE', 'PHOENIX PROTOCOL', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '019cf409-e5dd-4606-92c1-6abb596acb3d', 4, 'SATHYA K', 'PHOENIX PROTOCOL', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '019cf409-e5dd-4606-92c1-6abb596acb3d', 5, 'SHARMISTHA K', 'PHOENIX PROTOCOL', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'e444602e-235d-4457-8407-39cc437b7627', 'ORION-S0134', 'STRAW HATS', 'strawhats', 'Roshan Anto W', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ROSHANANTOW',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'e444602e-235d-4457-8407-39cc437b7627', 'VERIFIED-ORION-S0134', 'Roshan Anto W', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e444602e-235d-4457-8407-39cc437b7627', 1, 'Prabakar M', 'STRAW HATS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '07a2fc10-0be6-4358-88ba-99ad8a87036c', 'ORION-S0135', 'Tech Space', 'techspace', 'Saran S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SARANS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '07a2fc10-0be6-4358-88ba-99ad8a87036c', 'VERIFIED-ORION-S0135', 'Saran S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '07a2fc10-0be6-4358-88ba-99ad8a87036c', 1, 'Shree Ram', 'Tech Space', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '07a2fc10-0be6-4358-88ba-99ad8a87036c', 2, 'VARUN J', 'Tech Space', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '07a2fc10-0be6-4358-88ba-99ad8a87036c', 3, 'VETRIVIGNESH', 'Tech Space', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '07a2fc10-0be6-4358-88ba-99ad8a87036c', 4, 'Manoj', 'Tech Space', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0df23838-f29c-452e-bcc5-4d8f9d8f7202', 'ORION-S0136', 'Breaking Code', 'breakingcode', 'Isaac Jacksonraj J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ISAACJACKSONRAJJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0df23838-f29c-452e-bcc5-4d8f9d8f7202', 'VERIFIED-ORION-S0136', 'Isaac Jacksonraj J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0df23838-f29c-452e-bcc5-4d8f9d8f7202', 1, 'Kavinaya Bhaskaran', 'Breaking Code', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0df23838-f29c-452e-bcc5-4d8f9d8f7202', 2, 'Jaya Joshna W', 'Breaking Code', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0df23838-f29c-452e-bcc5-4d8f9d8f7202', 3, 'Jayaraj Rijan S', 'Breaking Code', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0df23838-f29c-452e-bcc5-4d8f9d8f7202', 4, 'Indira M', 'Breaking Code', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '9c94a519-9ffa-46bc-af8e-f3cbf15f64b3', 'ORION-S0137', 'Claxon AI', 'claxonai', 'SARRVESH J R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SARRVESHJR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '9c94a519-9ffa-46bc-af8e-f3cbf15f64b3', 'VERIFIED-ORION-S0137', 'SARRVESH J R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9c94a519-9ffa-46bc-af8e-f3cbf15f64b3', 1, 'Sharulatha s', 'Claxon AI', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9c94a519-9ffa-46bc-af8e-f3cbf15f64b3', 2, 'J Stevin jones', 'Claxon AI', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8963bb34-145e-4490-b88e-6ec8e93ceb0c', 'ORION-S0138', 'Project Hail Mary', 'projecthailmary', 'Dharani Karthikeyan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'DHARANIKARTHIKEYAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8963bb34-145e-4490-b88e-6ec8e93ceb0c', 'VERIFIED-ORION-S0138', 'Dharani Karthikeyan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8963bb34-145e-4490-b88e-6ec8e93ceb0c', 1, 'Larshikha Krishnan', 'Project Hail Mary', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8963bb34-145e-4490-b88e-6ec8e93ceb0c', 2, 'Divya Dharshini K S', 'Project Hail Mary', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8963bb34-145e-4490-b88e-6ec8e93ceb0c', 3, 'Hemapreiya Vijayaka', 'Project Hail Mary', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b8747e8e-a6be-4007-9377-cbe6f523cb0b', 'ORION-S0139', 'HexaCore', 'hexacore', 'SACHIN G S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SACHINGS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b8747e8e-a6be-4007-9377-cbe6f523cb0b', 'VERIFIED-ORION-S0139', 'SACHIN G S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b8747e8e-a6be-4007-9377-cbe6f523cb0b', 1, 'Sanjeeve Rajan C R', 'HexaCore', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b8747e8e-a6be-4007-9377-cbe6f523cb0b', 2, 'Vuppalapati Vedesh', 'HexaCore', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b8747e8e-a6be-4007-9377-cbe6f523cb0b', 3, 'Hannish K', 'HexaCore', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b8747e8e-a6be-4007-9377-cbe6f523cb0b', 4, 'Aishwarya S', 'HexaCore', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b8747e8e-a6be-4007-9377-cbe6f523cb0b', 5, 'Roshini G', 'HexaCore', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '95b7a332-e464-412b-a5f8-7a992b3b4347', 'ORION-S0140', 'PROTOTHON', 'protothon', 'BALIREDDI V V N S ABHISHEK', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'BALIREDDIVVNSABHISHEK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '95b7a332-e464-412b-a5f8-7a992b3b4347', 'VERIFIED-ORION-S0140', 'BALIREDDI V V N S ABHISHEK', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '95b7a332-e464-412b-a5f8-7a992b3b4347', 1, 'VIMAL RAJ A', 'PROTOTHON', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '093a2d41-5f71-403b-bfb0-4c98ee93b6fb', 'ORION-S0141', 'RunTime Error', 'runtimeerror', 'Charen', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'CHAREN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '093a2d41-5f71-403b-bfb0-4c98ee93b6fb', 'VERIFIED-ORION-S0141', 'Charen', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '093a2d41-5f71-403b-bfb0-4c98ee93b6fb', 1, 'Sai Sri Vathsan', 'RunTime Error', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '99131fe1-7a23-455b-a277-a6d8957b49f0', 'ORION-S0142', 'Hi-Tech', 'hitech', 'Irina Charis B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'IRINACHARISB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '99131fe1-7a23-455b-a277-a6d8957b49f0', 'VERIFIED-ORION-S0142', 'Irina Charis B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '99131fe1-7a23-455b-a277-a6d8957b49f0', 1, 'Harish S', 'Hi-Tech', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '99131fe1-7a23-455b-a277-a6d8957b49f0', 2, 'Krithika A M', 'Hi-Tech', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '99131fe1-7a23-455b-a277-a6d8957b49f0', 3, 'Jaya Surya S G', 'Hi-Tech', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '99131fe1-7a23-455b-a277-a6d8957b49f0', 4, 'Hemanth Raju', 'Hi-Tech', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '97a60d87-0f10-4d90-ba5d-286c40420d2e', 'ORION-S0143', 'FineWorks', 'fineworks', 'Praveen Balaji G', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PRAVEENBALAJIG',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '97a60d87-0f10-4d90-ba5d-286c40420d2e', 'VERIFIED-ORION-S0143', 'Praveen Balaji G', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '97a60d87-0f10-4d90-ba5d-286c40420d2e', 1, 'Saranesh S', 'FineWorks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '97a60d87-0f10-4d90-ba5d-286c40420d2e', 2, 'Nitish M', 'FineWorks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '97a60d87-0f10-4d90-ba5d-286c40420d2e', 3, 'Sakthi Saran G', 'FineWorks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '97a60d87-0f10-4d90-ba5d-286c40420d2e', 4, 'Seerthi Adhavan', 'FineWorks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '97a60d87-0f10-4d90-ba5d-286c40420d2e', 5, 'Tazim Sheriff R', 'FineWorks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '737e6f21-2dfb-4fdc-ace2-f14d880df625', 'ORION-S0144', 'Rebellions', 'rebellions', 'Lokesh S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'LOKESHS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '737e6f21-2dfb-4fdc-ace2-f14d880df625', 'VERIFIED-ORION-S0144', 'Lokesh S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '737e6f21-2dfb-4fdc-ace2-f14d880df625', 1, 'M Mohamed Rasool', 'Rebellions', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '737e6f21-2dfb-4fdc-ace2-f14d880df625', 2, 'Darsan G R', 'Rebellions', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '737e6f21-2dfb-4fdc-ace2-f14d880df625', 3, 'Giridharan M', 'Rebellions', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '737e6f21-2dfb-4fdc-ace2-f14d880df625', 4, 'Abdul Majeed A', 'Rebellions', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '737e6f21-2dfb-4fdc-ace2-f14d880df625', 5, 'Dhinesh', 'Rebellions', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'bbc9277d-3007-410d-a940-060a5e1700b4', 'ORION-S0145', 'SylvaAI', 'sylvaai', 'Pooja S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'POOJAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'bbc9277d-3007-410d-a940-060a5e1700b4', 'VERIFIED-ORION-S0145', 'Pooja S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bbc9277d-3007-410d-a940-060a5e1700b4', 1, 'Vani S', 'SylvaAI', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bbc9277d-3007-410d-a940-060a5e1700b4', 2, 'Meiram R', 'SylvaAI', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bbc9277d-3007-410d-a940-060a5e1700b4', 3, 'Ramamoorthy K', 'SylvaAI', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '78b769a6-3dc9-4e13-9ff2-86e4db409de0', 'ORION-S0146', 'Tech Hackers', 'techhackers', 'DIVYA T', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'DIVYAT',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '78b769a6-3dc9-4e13-9ff2-86e4db409de0', 'VERIFIED-ORION-S0146', 'DIVYA T', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '78b769a6-3dc9-4e13-9ff2-86e4db409de0', 1, 'Geethalakshmi B', 'Tech Hackers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '78b769a6-3dc9-4e13-9ff2-86e4db409de0', 2, 'Jahnavi R', 'Tech Hackers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '78b769a6-3dc9-4e13-9ff2-86e4db409de0', 3, 'Giri P', 'Tech Hackers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '78b769a6-3dc9-4e13-9ff2-86e4db409de0', 4, 'Deepak N S', 'Tech Hackers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '78b769a6-3dc9-4e13-9ff2-86e4db409de0', 5, 'Hariharasuthan N', 'Tech Hackers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '1c8f7088-5242-4d27-ab9a-ebdb67cceb18', 'ORION-S0147', 'Code Charms', 'codecharms', 'Elakkiya.R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ELAKKIYAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '1c8f7088-5242-4d27-ab9a-ebdb67cceb18', 'VERIFIED-ORION-S0147', 'Elakkiya.R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1c8f7088-5242-4d27-ab9a-ebdb67cceb18', 1, 'Devadharshini.S', 'Code Charms', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1c8f7088-5242-4d27-ab9a-ebdb67cceb18', 2, 'ANANYA.R', 'Code Charms', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1c8f7088-5242-4d27-ab9a-ebdb67cceb18', 3, 'Keerthana.S', 'Code Charms', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1c8f7088-5242-4d27-ab9a-ebdb67cceb18', 4, 'GAAYATHRI DEVI R', 'Code Charms', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1c8f7088-5242-4d27-ab9a-ebdb67cceb18', 5, 'BILLU SHARIKA', 'Code Charms', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '3372df31-ec38-4788-9ab8-13d4cb99d0ab', 'ORION-S0148', 'Voro', 'voro', 'Lalith Aditiya T A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'LALITHADITIYATA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '3372df31-ec38-4788-9ab8-13d4cb99d0ab', 'VERIFIED-ORION-S0148', 'Lalith Aditiya T A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3372df31-ec38-4788-9ab8-13d4cb99d0ab', 1, 'Kumaran R', 'Voro', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3372df31-ec38-4788-9ab8-13d4cb99d0ab', 2, 'Likesh R', 'Voro', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3372df31-ec38-4788-9ab8-13d4cb99d0ab', 3, 'Kishor J', 'Voro', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3372df31-ec38-4788-9ab8-13d4cb99d0ab', 4, 'Krishna megha K S', 'Voro', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3372df31-ec38-4788-9ab8-13d4cb99d0ab', 5, 'Kavi priya A', 'Voro', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '272a0944-6d12-44f8-8e85-b1d3558a3375', 'ORION-S0149', 'Mesh Minds', 'meshminds', 'Tejasvini S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'TEJASVINIS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '272a0944-6d12-44f8-8e85-b1d3558a3375', 'VERIFIED-ORION-S0149', 'Tejasvini S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '272a0944-6d12-44f8-8e85-b1d3558a3375', 1, 'Syed Amrullah S A', 'Mesh Minds', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '272a0944-6d12-44f8-8e85-b1d3558a3375', 2, 'Chitra Devi R', 'Mesh Minds', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '272a0944-6d12-44f8-8e85-b1d3558a3375', 3, 'Praveen B', 'Mesh Minds', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '272a0944-6d12-44f8-8e85-b1d3558a3375', 4, 'Anoob S', 'Mesh Minds', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '272a0944-6d12-44f8-8e85-b1d3558a3375', 5, 'Jagadeesh R', 'Mesh Minds', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8ca58aa8-c3cb-43fd-bb20-4073fdc9a6ac', 'ORION-S0150', 'NexQ', 'nexq', 'Ananya Sridhar', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ANANYASRIDHAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8ca58aa8-c3cb-43fd-bb20-4073fdc9a6ac', 'VERIFIED-ORION-S0150', 'Ananya Sridhar', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8ca58aa8-c3cb-43fd-bb20-4073fdc9a6ac', 1, 'Anantha Kumar B', 'NexQ', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8ca58aa8-c3cb-43fd-bb20-4073fdc9a6ac', 2, 'Avinash S', 'NexQ', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8ca58aa8-c3cb-43fd-bb20-4073fdc9a6ac', 3, 'Devikala M', 'NexQ', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8d5e4acf-80f5-45c4-99c7-c9ad736a1e11', 'ORION-S0151', 'DoomCoders', 'doomcoders', 'C Balaji Mohan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'CBALAJIMOHAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8d5e4acf-80f5-45c4-99c7-c9ad736a1e11', 'VERIFIED-ORION-S0151', 'C Balaji Mohan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8d5e4acf-80f5-45c4-99c7-c9ad736a1e11', 1, 'Abhikash S', 'DoomCoders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8d5e4acf-80f5-45c4-99c7-c9ad736a1e11', 2, 'Adheep S', 'DoomCoders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8d5e4acf-80f5-45c4-99c7-c9ad736a1e11', 3, 'Avinash V', 'DoomCoders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8d5e4acf-80f5-45c4-99c7-c9ad736a1e11', 4, 'Siva Sitharthan N', 'DoomCoders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'de8ae1e7-c1ef-45d1-a966-b786c353dc8a', 'ORION-S0152', 'Tech Titans', 'techtitans', 'R R Jaiwanth', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'RRJAIWANTH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'de8ae1e7-c1ef-45d1-a966-b786c353dc8a', 'VERIFIED-ORION-S0152', 'R R Jaiwanth', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'de8ae1e7-c1ef-45d1-a966-b786c353dc8a', 1, 'A Sai Hariharan', 'Tech Titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'de8ae1e7-c1ef-45d1-a966-b786c353dc8a', 2, 'N.Mughilan', 'Tech Titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'de8ae1e7-c1ef-45d1-a966-b786c353dc8a', 3, 'P.Jane Merlin', 'Tech Titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'de8ae1e7-c1ef-45d1-a966-b786c353dc8a', 4, 'A.Jayavarshini', 'Tech Titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'de8ae1e7-c1ef-45d1-a966-b786c353dc8a', 5, 'M.Rakshana', 'Tech Titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'a429419b-09c6-4cf3-8176-b84f4e259c57', 'ORION-S0153', 'TechCode', 'techcode', 'Devipriya B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'DEVIPRIYAB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'a429419b-09c6-4cf3-8176-b84f4e259c57', 'VERIFIED-ORION-S0153', 'Devipriya B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a429419b-09c6-4cf3-8176-b84f4e259c57', 1, 'Sakthi Devi L', 'TechCode', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a429419b-09c6-4cf3-8176-b84f4e259c57', 2, 'Naveen K', 'TechCode', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a429419b-09c6-4cf3-8176-b84f4e259c57', 3, 'Thulasi raman M', 'TechCode', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '37210685-5dce-4ba6-8ea1-aade21f295d8', 'ORION-S0154', 'MotwaGuard', 'motwaguard', 'Monica V', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MONICAV',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '37210685-5dce-4ba6-8ea1-aade21f295d8', 'VERIFIED-ORION-S0154', 'Monica V', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '37210685-5dce-4ba6-8ea1-aade21f295d8', 1, 'Karthikeyan B', 'MotwaGuard', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '37210685-5dce-4ba6-8ea1-aade21f295d8', 2, 'Velvizhi K', 'MotwaGuard', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '37210685-5dce-4ba6-8ea1-aade21f295d8', 3, 'Deepika M', 'MotwaGuard', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '37210685-5dce-4ba6-8ea1-aade21f295d8', 4, 'Ram Prasath G', 'MotwaGuard', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '37210685-5dce-4ba6-8ea1-aade21f295d8', 5, 'Dhinesh Kumar V', 'MotwaGuard', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '14d1ea2d-b809-43b0-9d0c-1469d4784a0c', 'ORION-S0155', 'StarByte', 'starbyte', 'Jaidev S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'JAIDEVS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '14d1ea2d-b809-43b0-9d0c-1469d4784a0c', 'VERIFIED-ORION-S0155', 'Jaidev S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '14d1ea2d-b809-43b0-9d0c-1469d4784a0c', 1, 'Karthikeyan S', 'StarByte', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '14d1ea2d-b809-43b0-9d0c-1469d4784a0c', 2, 'Senthamizharan V', 'StarByte', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '85138543-7cd8-41c3-83c2-257c800fe39b', 'ORION-S0156', 'O[1]', 'o1', 'M. Shirish', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MSHIRISH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '85138543-7cd8-41c3-83c2-257c800fe39b', 'VERIFIED-ORION-S0156', 'M. Shirish', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '85138543-7cd8-41c3-83c2-257c800fe39b', 1, 'Shanjana s v', 'O[1]', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '85138543-7cd8-41c3-83c2-257c800fe39b', 2, 'Akilesh B', 'O[1]', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '85138543-7cd8-41c3-83c2-257c800fe39b', 3, 'Akshaya Beena', 'O[1]', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '85138543-7cd8-41c3-83c2-257c800fe39b', 4, 'Ben', 'O[1]', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '340c97f7-5932-4b90-8012-1a9fe36919a7', 'ORION-S0157', 'Astralis', 'astralis', 'yaathesh', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'YAATHESH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '340c97f7-5932-4b90-8012-1a9fe36919a7', 'VERIFIED-ORION-S0157', 'yaathesh', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '340c97f7-5932-4b90-8012-1a9fe36919a7', 1, 'Senthur pandian', 'Astralis', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '340c97f7-5932-4b90-8012-1a9fe36919a7', 2, 'Aruthran', 'Astralis', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '340c97f7-5932-4b90-8012-1a9fe36919a7', 3, 'Ponvel.G', 'Astralis', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '74b8c0e1-0924-489d-a68e-01b09b1ce6a0', 'ORION-S0158', 'Mindsprint', 'mindsprint', 'Frezha Angeline A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'FREZHAANGELINEA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '74b8c0e1-0924-489d-a68e-01b09b1ce6a0', 'VERIFIED-ORION-S0158', 'Frezha Angeline A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '74b8c0e1-0924-489d-a68e-01b09b1ce6a0', 1, 'Dhanalakshmi K', 'Mindsprint', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '74b8c0e1-0924-489d-a68e-01b09b1ce6a0', 2, 'Nidhya Shree U', 'Mindsprint', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '74b8c0e1-0924-489d-a68e-01b09b1ce6a0', 3, 'Reya S', 'Mindsprint', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '74b8c0e1-0924-489d-a68e-01b09b1ce6a0', 4, 'Janani S', 'Mindsprint', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '34300bba-9918-4688-b3d1-48451f6f61f6', 'ORION-S0159', 'Technocrats', 'technocrats', 'Gunanithi M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'GUNANITHIM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '34300bba-9918-4688-b3d1-48451f6f61f6', 'VERIFIED-ORION-S0159', 'Gunanithi M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '34300bba-9918-4688-b3d1-48451f6f61f6', 1, 'Balarishikesh B S', 'Technocrats', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '34300bba-9918-4688-b3d1-48451f6f61f6', 2, 'Hari Krishna V', 'Technocrats', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '34300bba-9918-4688-b3d1-48451f6f61f6', 3, 'Bala Murali S', 'Technocrats', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '34300bba-9918-4688-b3d1-48451f6f61f6', 4, 'Aswindh Kumar R', 'Technocrats', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '94ebbdaa-aa58-4754-982f-d2fea3ff5738', 'ORION-S0160', 'ProofForge', 'proofforge', 'Jerlin Goldia.J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'JERLINGOLDIAJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '94ebbdaa-aa58-4754-982f-d2fea3ff5738', 'VERIFIED-ORION-S0160', 'Jerlin Goldia.J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '94ebbdaa-aa58-4754-982f-d2fea3ff5738', 1, 'Nandhini R', 'ProofForge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '94ebbdaa-aa58-4754-982f-d2fea3ff5738', 2, 'Jessica T', 'ProofForge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '53fa6512-8e73-4b9e-8038-0d05b45d489b', 'ORION-S0162', 'avengers codesday', 'avengerscodesday', 'M J Dhurgesh', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MJDHURGESH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '53fa6512-8e73-4b9e-8038-0d05b45d489b', 'VERIFIED-ORION-S0162', 'M J Dhurgesh', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '53fa6512-8e73-4b9e-8038-0d05b45d489b', 1, 'Harisudhan', 'avengers codesday', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '53fa6512-8e73-4b9e-8038-0d05b45d489b', 2, 'Sanjaidharshan s', 'avengers codesday', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '53fa6512-8e73-4b9e-8038-0d05b45d489b', 3, 'Tharun S', 'avengers codesday', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '53fa6512-8e73-4b9e-8038-0d05b45d489b', 4, 'Kabilan', 'avengers codesday', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '53fa6512-8e73-4b9e-8038-0d05b45d489b', 5, 'Shakeel irfan A r', 'avengers codesday', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '6572ae27-97c9-4a4e-bcc9-c276680a4f37', 'ORION-S0163', 'NOVERA', 'novera', 'SUDHARSAN B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SUDHARSANB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '6572ae27-97c9-4a4e-bcc9-c276680a4f37', 'VERIFIED-ORION-S0163', 'SUDHARSAN B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6572ae27-97c9-4a4e-bcc9-c276680a4f37', 1, 'GANESH A S', 'NOVERA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6572ae27-97c9-4a4e-bcc9-c276680a4f37', 2, 'MOHAMED ROSHAN S', 'NOVERA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6572ae27-97c9-4a4e-bcc9-c276680a4f37', 3, 'SANJEEV J', 'NOVERA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6572ae27-97c9-4a4e-bcc9-c276680a4f37', 4, 'SAI NIKITHA', 'NOVERA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6572ae27-97c9-4a4e-bcc9-c276680a4f37', 5, 'SAI HARIKA NANU', 'NOVERA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ce7b7c52-ff17-4517-b2ca-efd0f5e0757a', 'ORION-S0164', 'Clarabella', 'clarabella', 'K SHALINI', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'KSHALINI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ce7b7c52-ff17-4517-b2ca-efd0f5e0757a', 'VERIFIED-ORION-S0164', 'K SHALINI', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ce7b7c52-ff17-4517-b2ca-efd0f5e0757a', 1, 'SRINITHA G P', 'Clarabella', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ce7b7c52-ff17-4517-b2ca-efd0f5e0757a', 2, 'ANBU SELVAN S', 'Clarabella', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ce7b7c52-ff17-4517-b2ca-efd0f5e0757a', 3, 'Aravind .R', 'Clarabella', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ce7b7c52-ff17-4517-b2ca-efd0f5e0757a', 4, 'Arjun.p', 'Clarabella', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ce7b7c52-ff17-4517-b2ca-efd0f5e0757a', 5, 'Venureddy', 'Clarabella', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '1f8eff35-0742-4a92-8acc-6f3696aad0db', 'ORION-S0165', 'DR DOOM', 'drdoom', 'KRITHIKAA B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'KRITHIKAAB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '1f8eff35-0742-4a92-8acc-6f3696aad0db', 'VERIFIED-ORION-S0165', 'KRITHIKAA B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1f8eff35-0742-4a92-8acc-6f3696aad0db', 1, 'ADITHYA S', 'DR DOOM', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1f8eff35-0742-4a92-8acc-6f3696aad0db', 2, 'S JISHNUMUGUNTH', 'DR DOOM', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1f8eff35-0742-4a92-8acc-6f3696aad0db', 3, 'MANIESWARI M V', 'DR DOOM', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5fc35123-bf94-4f0f-b879-d442e48255cd', 'ORION-S0166', 'CODE CRACKERS', 'codecrackers', 'Monish R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MONISHR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5fc35123-bf94-4f0f-b879-d442e48255cd', 'VERIFIED-ORION-S0166', 'Monish R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5fc35123-bf94-4f0f-b879-d442e48255cd', 1, 'Vasantharaj M', 'CODE CRACKERS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5fc35123-bf94-4f0f-b879-d442e48255cd', 2, 'Harishankar E', 'CODE CRACKERS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5fc35123-bf94-4f0f-b879-d442e48255cd', 3, 'Kaavinesh K', 'CODE CRACKERS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5fc35123-bf94-4f0f-b879-d442e48255cd', 4, 'Roshan B', 'CODE CRACKERS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5fc35123-bf94-4f0f-b879-d442e48255cd', 5, 'Mohan K', 'CODE CRACKERS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'bde34839-20f3-48da-b2f3-8878f147059a', 'ORION-S0167', 'GAITHUB', 'gaithub', 'Santosh Raghavendra Y S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SANTOSHRAGHAVENDRAYS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'bde34839-20f3-48da-b2f3-8878f147059a', 'VERIFIED-ORION-S0167', 'Santosh Raghavendra Y S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bde34839-20f3-48da-b2f3-8878f147059a', 1, 'RAKSHAN RS', 'GAITHUB', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bde34839-20f3-48da-b2f3-8878f147059a', 2, 'Yuvan krishnan', 'GAITHUB', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bde34839-20f3-48da-b2f3-8878f147059a', 3, 'Mario Ralph Baxter', 'GAITHUB', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bde34839-20f3-48da-b2f3-8878f147059a', 4, 'Udhaya', 'GAITHUB', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bde34839-20f3-48da-b2f3-8878f147059a', 5, 'Mithran', 'GAITHUB', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'bc9b643e-a7a9-4913-aad8-7931b20fe435', 'ORION-S0168', 'NOVATRIX', 'novatrix', 'PRAVEEN KUMAR M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PRAVEENKUMARM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'bc9b643e-a7a9-4913-aad8-7931b20fe435', 'VERIFIED-ORION-S0168', 'PRAVEEN KUMAR M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bc9b643e-a7a9-4913-aad8-7931b20fe435', 1, 'RAGURAM.A', 'NOVATRIX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bc9b643e-a7a9-4913-aad8-7931b20fe435', 2, 'SACHIN RAJA.R', 'NOVATRIX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bc9b643e-a7a9-4913-aad8-7931b20fe435', 3, 'Rithish Barath N', 'NOVATRIX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bc9b643e-a7a9-4913-aad8-7931b20fe435', 4, 'SACHIV.R', 'NOVATRIX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bc9b643e-a7a9-4913-aad8-7931b20fe435', 5, 'SAKTHI.T C', 'NOVATRIX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '41159f11-f20b-4508-959d-4b35d4f9566b', 'ORION-S0169', 'Hack Aspirants', 'hackaspirants', 'keerthaesh kumar M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'KEERTHAESHKUMARM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '41159f11-f20b-4508-959d-4b35d4f9566b', 'VERIFIED-ORION-S0169', 'keerthaesh kumar M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '41159f11-f20b-4508-959d-4b35d4f9566b', 1, 'kavya S', 'Hack Aspirants', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '41159f11-f20b-4508-959d-4b35d4f9566b', 2, 'karishma D', 'Hack Aspirants', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '41159f11-f20b-4508-959d-4b35d4f9566b', 3, 'bharath N', 'Hack Aspirants', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5cc9e6db-4796-455d-a6c2-71550f77614e', 'ORION-S0170', 'Bhairav', 'bhairav', 'Vinish Vinoth', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'VINISHVINOTH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5cc9e6db-4796-455d-a6c2-71550f77614e', 'VERIFIED-ORION-S0170', 'Vinish Vinoth', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5cc9e6db-4796-455d-a6c2-71550f77614e', 1, 'BARATH D', 'Bhairav', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5cc9e6db-4796-455d-a6c2-71550f77614e', 2, 'SANTHOSH KUMAR V', 'Bhairav', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5cc9e6db-4796-455d-a6c2-71550f77614e', 3, 'SAI SANTHOSH T', 'Bhairav', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5cc9e6db-4796-455d-a6c2-71550f77614e', 4, 'Janani sri', 'Bhairav', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5cc9e6db-4796-455d-a6c2-71550f77614e', 5, 'Pooja Laxmi', 'Bhairav', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'feecc836-a17e-4a2b-be1f-11e264132964', 'ORION-S0171', 'Change Making engineers', 'changemakingengineers', 'Suthakar P', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SUTHAKARP',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'feecc836-a17e-4a2b-be1f-11e264132964', 'VERIFIED-ORION-S0171', 'Suthakar P', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'feecc836-a17e-4a2b-be1f-11e264132964', 1, 'Devadharshini R', 'Change Making engineers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'feecc836-a17e-4a2b-be1f-11e264132964', 2, 'Deepa G', 'Change Making engineers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'feecc836-a17e-4a2b-be1f-11e264132964', 3, 'Aravind I', 'Change Making engineers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'feecc836-a17e-4a2b-be1f-11e264132964', 4, 'A.DHANUSRI', 'Change Making engineers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '534b6293-813c-424f-a79e-3c9cb79139f6', 'ORION-S0172', 'FastLane Devs', 'fastlanedevs', 'K.Harshith', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'KHARSHITH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '534b6293-813c-424f-a79e-3c9cb79139f6', 'VERIFIED-ORION-S0172', 'K.Harshith', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '534b6293-813c-424f-a79e-3c9cb79139f6', 1, 'M.Srikanth', 'FastLane Devs', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '534b6293-813c-424f-a79e-3c9cb79139f6', 2, 'U.Veerendra', 'FastLane Devs', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '534b6293-813c-424f-a79e-3c9cb79139f6', 3, 'J.Rasmitha sai', 'FastLane Devs', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '534b6293-813c-424f-a79e-3c9cb79139f6', 4, 'K.nikhil reddy', 'FastLane Devs', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '534b6293-813c-424f-a79e-3c9cb79139f6', 5, 'S.Bharath', 'FastLane Devs', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '47208be8-8c75-4318-95c0-81b53f55e684', 'ORION-S0173', 'Crypto knights', 'cryptoknights', 'Udhaya Raghavi S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'UDHAYARAGHAVIS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '47208be8-8c75-4318-95c0-81b53f55e684', 'VERIFIED-ORION-S0173', 'Udhaya Raghavi S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '47208be8-8c75-4318-95c0-81b53f55e684', 1, 'Shruthilaya RP', 'Crypto knights', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '47208be8-8c75-4318-95c0-81b53f55e684', 2, 'Sindhya sridharan', 'Crypto knights', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '47208be8-8c75-4318-95c0-81b53f55e684', 3, 'Varnikha sri', 'Crypto knights', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '47208be8-8c75-4318-95c0-81b53f55e684', 4, 'Shreya S', 'Crypto knights', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '47208be8-8c75-4318-95c0-81b53f55e684', 5, 'Shadhana', 'Crypto knights', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c8b48a32-a99c-437e-919a-4950f6ef1d44', 'ORION-S0174', 'Techno sist', 'technosist', 'Aathimaduran. S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'AATHIMADURANS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c8b48a32-a99c-437e-919a-4950f6ef1d44', 'VERIFIED-ORION-S0174', 'Aathimaduran. S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c8b48a32-a99c-437e-919a-4950f6ef1d44', 1, 'Ahmed Azeer. A', 'Techno sist', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c8b48a32-a99c-437e-919a-4950f6ef1d44', 2, 'Charan. G', 'Techno sist', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c8b48a32-a99c-437e-919a-4950f6ef1d44', 3, 'Vijayan. S. K', 'Techno sist', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f044adb9-15bc-4a90-8310-a39177cbd4f8', 'ORION-S0175', 'MADMAXX', 'madmaxx', 'Abinandhana A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ABINANDHANAA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f044adb9-15bc-4a90-8310-a39177cbd4f8', 'VERIFIED-ORION-S0175', 'Abinandhana A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f044adb9-15bc-4a90-8310-a39177cbd4f8', 1, 'ANIKASRI.B', 'MADMAXX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f044adb9-15bc-4a90-8310-a39177cbd4f8', 2, 'PRIYADHARSHINI S', 'MADMAXX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f044adb9-15bc-4a90-8310-a39177cbd4f8', 3, 'Aarthi S', 'MADMAXX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f044adb9-15bc-4a90-8310-a39177cbd4f8', 4, 'Sunethra J', 'MADMAXX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f044adb9-15bc-4a90-8310-a39177cbd4f8', 5, 'Jerusha W', 'MADMAXX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'fb9b86f1-2f72-41f8-9652-db7155822c74', 'ORION-S0176', 'VIBRANT', 'vibrant', 'HARIHARAN D', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'HARIHARAND',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'fb9b86f1-2f72-41f8-9652-db7155822c74', 'VERIFIED-ORION-S0176', 'HARIHARAN D', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fb9b86f1-2f72-41f8-9652-db7155822c74', 1, 'Dhanush S', 'VIBRANT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fb9b86f1-2f72-41f8-9652-db7155822c74', 2, 'Julian Steve Anban', 'VIBRANT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fb9b86f1-2f72-41f8-9652-db7155822c74', 3, 'R Sanjay', 'VIBRANT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fb9b86f1-2f72-41f8-9652-db7155822c74', 4, 'Aanish Nithin', 'VIBRANT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fb9b86f1-2f72-41f8-9652-db7155822c74', 5, 'T R Ajay Dharrsan', 'VIBRANT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd478e4e9-676e-4e1c-b80d-951d111060ff', 'ORION-S0177', 'Team swam', 'teamswam', 'Yamini. S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'YAMINIS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd478e4e9-676e-4e1c-b80d-951d111060ff', 'VERIFIED-ORION-S0177', 'Yamini. S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd478e4e9-676e-4e1c-b80d-951d111060ff', 1, 'Priyadharshini. H', 'Team swam', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd478e4e9-676e-4e1c-b80d-951d111060ff', 2, 'Padma Priya. R', 'Team swam', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd478e4e9-676e-4e1c-b80d-951d111060ff', 3, 'Sabishree. R', 'Team swam', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd478e4e9-676e-4e1c-b80d-951d111060ff', 4, 'Dharun. M', 'Team swam', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd478e4e9-676e-4e1c-b80d-951d111060ff', 5, 'Philips Gabriel B', 'Team swam', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c6be6faa-a8f8-491d-bdce-b83ed6fd3cfd', 'ORION-S0178', 'Null exceptions', 'nullexceptions', 'S MONIKA', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SMONIKA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c6be6faa-a8f8-491d-bdce-b83ed6fd3cfd', 'VERIFIED-ORION-S0178', 'S MONIKA', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c6be6faa-a8f8-491d-bdce-b83ed6fd3cfd', 1, 'Sheik abdhulla', 'Null exceptions', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c6be6faa-a8f8-491d-bdce-b83ed6fd3cfd', 2, 'Yuvanesh', 'Null exceptions', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c6be6faa-a8f8-491d-bdce-b83ed6fd3cfd', 3, 'Rahul', 'Null exceptions', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c6be6faa-a8f8-491d-bdce-b83ed6fd3cfd', 4, 'Harshini', 'Null exceptions', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c6be6faa-a8f8-491d-bdce-b83ed6fd3cfd', 5, 'Aswathy', 'Null exceptions', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0fb750c6-24b6-4a10-b905-a084dbd42c03', 'ORION-S0179', 'CODECREW', 'codecrew', 'Nithiya Sri G', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'NITHIYASRIG',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0fb750c6-24b6-4a10-b905-a084dbd42c03', 'VERIFIED-ORION-S0179', 'Nithiya Sri G', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0fb750c6-24b6-4a10-b905-a084dbd42c03', 1, 'Logeswari A', 'CODECREW', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0fb750c6-24b6-4a10-b905-a084dbd42c03', 2, 'Nivetha S', 'CODECREW', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0fb750c6-24b6-4a10-b905-a084dbd42c03', 3, 'Lekkala Pranathi', 'CODECREW', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0fb750c6-24b6-4a10-b905-a084dbd42c03', 4, 'Kanimozhi', 'CODECREW', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f95eaf1d-b58d-4be0-98e2-2699964b996e', 'ORION-S0180', 'cyber crew', 'cybercrew', 'Lithesh B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'LITHESHB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f95eaf1d-b58d-4be0-98e2-2699964b996e', 'VERIFIED-ORION-S0180', 'Lithesh B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f95eaf1d-b58d-4be0-98e2-2699964b996e', 1, 'lohendra C', 'cyber crew', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f95eaf1d-b58d-4be0-98e2-2699964b996e', 2, 'Kirankumar P', 'cyber crew', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f95eaf1d-b58d-4be0-98e2-2699964b996e', 3, 'Karthick S', 'cyber crew', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f95eaf1d-b58d-4be0-98e2-2699964b996e', 4, 'Sri abinandhan S', 'cyber crew', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c3fcdef8-11d7-4e73-bde6-81361c29d2a5', 'ORION-S0181', 'Techaura', 'techaura', 'Harini A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'HARINIA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c3fcdef8-11d7-4e73-bde6-81361c29d2a5', 'VERIFIED-ORION-S0181', 'Harini A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c3fcdef8-11d7-4e73-bde6-81361c29d2a5', 1, 'Nandhini V', 'Techaura', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c3fcdef8-11d7-4e73-bde6-81361c29d2a5', 2, 'Ramya D', 'Techaura', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c3fcdef8-11d7-4e73-bde6-81361c29d2a5', 3, 'Amirthavarshini P', 'Techaura', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'a3f7166f-6fdf-4861-a813-f471ef1e89ed', 'ORION-S0182', 'Phoenix coders', 'phoenixcoders', 'Sameer C', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SAMEERC',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'a3f7166f-6fdf-4861-a813-f471ef1e89ed', 'VERIFIED-ORION-S0182', 'Sameer C', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a3f7166f-6fdf-4861-a813-f471ef1e89ed', 1, 'M.R.Magdalene', 'Phoenix coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a3f7166f-6fdf-4861-a813-f471ef1e89ed', 2, 'Aakshy Sharon J R', 'Phoenix coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a3f7166f-6fdf-4861-a813-f471ef1e89ed', 3, 'Chinthaamani R M', 'Phoenix coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a3f7166f-6fdf-4861-a813-f471ef1e89ed', 4, 'SATHIYA NARAYANAN S', 'Phoenix coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a3f7166f-6fdf-4861-a813-f471ef1e89ed', 5, 'B.jayanth swamy', 'Phoenix coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '6c7ab220-7476-4cb6-a702-363c671e599e', 'ORION-S0183', '_ENDEAVOUR_', 'endeavour', 'RAGHUL T', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'RAGHULT',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '6c7ab220-7476-4cb6-a702-363c671e599e', 'VERIFIED-ORION-S0183', 'RAGHUL T', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6c7ab220-7476-4cb6-a702-363c671e599e', 1, 'AJAY P', '_ENDEAVOUR_', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6c7ab220-7476-4cb6-a702-363c671e599e', 2, 'RAGHAV S', '_ENDEAVOUR_', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6c7ab220-7476-4cb6-a702-363c671e599e', 3, 'RAGHUL K', '_ENDEAVOUR_', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6c7ab220-7476-4cb6-a702-363c671e599e', 4, 'MOVIN T', '_ENDEAVOUR_', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6c7ab220-7476-4cb6-a702-363c671e599e', 5, 'SHARVESH S', '_ENDEAVOUR_', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '860d45d1-b267-48ad-a3db-e736978e63e6', 'ORION-S0184', 'Compilers', 'compilers', 'Sasikumar S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SASIKUMARS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '860d45d1-b267-48ad-a3db-e736978e63e6', 'VERIFIED-ORION-S0184', 'Sasikumar S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '860d45d1-b267-48ad-a3db-e736978e63e6', 1, 'Gowtham Thirumuru', 'Compilers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '860d45d1-b267-48ad-a3db-e736978e63e6', 2, 'Sachin Rao', 'Compilers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '860d45d1-b267-48ad-a3db-e736978e63e6', 3, 'Sreeja R', 'Compilers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '860d45d1-b267-48ad-a3db-e736978e63e6', 4, 'Rakesh D', 'Compilers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '860d45d1-b267-48ad-a3db-e736978e63e6', 5, 'Ram P', 'Compilers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'dc3d2636-2945-42d4-92ac-5ab526f20f18', 'ORION-S0185', 'Codespark', 'codespark', 'Keerthana K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'KEERTHANAK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'dc3d2636-2945-42d4-92ac-5ab526f20f18', 'VERIFIED-ORION-S0185', 'Keerthana K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dc3d2636-2945-42d4-92ac-5ab526f20f18', 1, 'Muthu Prabha', 'Codespark', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dc3d2636-2945-42d4-92ac-5ab526f20f18', 2, 'Dharshana S', 'Codespark', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dc3d2636-2945-42d4-92ac-5ab526f20f18', 3, 'Gifta Alice', 'Codespark', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'aae66a9e-2c46-4905-8353-1ebf785405b8', 'ORION-S0186', 'Espiron', 'espiron', 'Vishhwa vasudevan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'VISHHWAVASUDEVAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'aae66a9e-2c46-4905-8353-1ebf785405b8', 'VERIFIED-ORION-S0186', 'Vishhwa vasudevan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'aae66a9e-2c46-4905-8353-1ebf785405b8', 1, 'Yogitha M', 'Espiron', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'aae66a9e-2c46-4905-8353-1ebf785405b8', 2, 'Gautham K', 'Espiron', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'aae66a9e-2c46-4905-8353-1ebf785405b8', 3, 'Jeyandhana Amirthi', 'Espiron', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'aae66a9e-2c46-4905-8353-1ebf785405b8', 4, 'Yogeshwaran M', 'Espiron', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '71080963-952a-4d4f-8bf9-6f321852410a', 'ORION-S0187', 'Sleepless Knight', 'sleeplessknight', 'Lynton Oreb', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'LYNTONOREB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '71080963-952a-4d4f-8bf9-6f321852410a', 'VERIFIED-ORION-S0187', 'Lynton Oreb', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '71080963-952a-4d4f-8bf9-6f321852410a', 1, 'Dharshini V', 'Sleepless Knight', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '71080963-952a-4d4f-8bf9-6f321852410a', 2, 'Hemamalini V', 'Sleepless Knight', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '71080963-952a-4d4f-8bf9-6f321852410a', 3, 'Mukilan S', 'Sleepless Knight', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '71080963-952a-4d4f-8bf9-6f321852410a', 4, 'Prithiviraj S', 'Sleepless Knight', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4682efbf-c4b7-4971-9ed0-2575327101ce', 'ORION-S0188', 'NexGen', 'nexgen', 'ERIN RAICHEAL JUVENAL', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ERINRAICHEALJUVENAL',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4682efbf-c4b7-4971-9ed0-2575327101ce', 'VERIFIED-ORION-S0188', 'ERIN RAICHEAL JUVENAL', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4682efbf-c4b7-4971-9ed0-2575327101ce', 1, 'Antony Jernaus J', 'NexGen', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4682efbf-c4b7-4971-9ed0-2575327101ce', 2, 'Haashini M', 'NexGen', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4682efbf-c4b7-4971-9ed0-2575327101ce', 3, 'Vishal V M', 'NexGen', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4682efbf-c4b7-4971-9ed0-2575327101ce', 4, 'Yokeshkumar S', 'NexGen', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '950f1c76-ba73-4285-be27-7a42f9269f97', 'ORION-S0189', 'B NIRANJAN', 'bniranjan', 'NIRANJAN', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'NIRANJAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '950f1c76-ba73-4285-be27-7a42f9269f97', 'VERIFIED-ORION-S0189', 'NIRANJAN', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '950f1c76-ba73-4285-be27-7a42f9269f97', 1, 'NITISH P', 'B NIRANJAN', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '950f1c76-ba73-4285-be27-7a42f9269f97', 2, 'Pranov P', 'B NIRANJAN', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '950f1c76-ba73-4285-be27-7a42f9269f97', 3, 'Nithivalavan D', 'B NIRANJAN', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '950f1c76-ba73-4285-be27-7a42f9269f97', 4, 'Navin SD', 'B NIRANJAN', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'fd75f4f4-3fa5-4c21-84d9-1f93438a6487', 'ORION-S0190', 'ARIV — AI & Research Innovators with Vision', 'arivairesearchinnovatorswithvision', 'SHAPTHAGIRI G', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SHAPTHAGIRIG',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'fd75f4f4-3fa5-4c21-84d9-1f93438a6487', 'VERIFIED-ORION-S0190', 'SHAPTHAGIRI G', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fd75f4f4-3fa5-4c21-84d9-1f93438a6487', 1, 'UMAIRA FATHIMA Z', 'ARIV — AI & Research Innovators with Vision', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fd75f4f4-3fa5-4c21-84d9-1f93438a6487', 2, 'SHAHIRA M', 'ARIV — AI & Research Innovators with Vision', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fd75f4f4-3fa5-4c21-84d9-1f93438a6487', 3, 'RENGESH M', 'ARIV — AI & Research Innovators with Vision', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fd75f4f4-3fa5-4c21-84d9-1f93438a6487', 4, 'SAI SARAN N', 'ARIV — AI & Research Innovators with Vision', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fd75f4f4-3fa5-4c21-84d9-1f93438a6487', 5, 'SAHANA E', 'ARIV — AI & Research Innovators with Vision', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'bb25b4a5-eff1-46df-9327-9871004a765a', 'ORION-S0191', 'Bytebros', 'bytebros', 'Santhosh S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SANTHOSHS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'bb25b4a5-eff1-46df-9327-9871004a765a', 'VERIFIED-ORION-S0191', 'Santhosh S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bb25b4a5-eff1-46df-9327-9871004a765a', 1, 'Sharpika M', 'Bytebros', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bb25b4a5-eff1-46df-9327-9871004a765a', 2, 'Sravani L A', 'Bytebros', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bb25b4a5-eff1-46df-9327-9871004a765a', 3, 'Riya Denio J', 'Bytebros', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bb25b4a5-eff1-46df-9327-9871004a765a', 4, 'Ragavendhra G', 'Bytebros', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f3086463-c65b-4283-a928-3d8fc0b6ec2f', 'ORION-S0192', 'NextGen Innovators', 'nextgeninnovators', 'Yazhini SP', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'YAZHINISP',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f3086463-c65b-4283-a928-3d8fc0b6ec2f', 'VERIFIED-ORION-S0192', 'Yazhini SP', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f3086463-c65b-4283-a928-3d8fc0b6ec2f', 1, 'Shakthi Priya B', 'NextGen Innovators', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f3086463-c65b-4283-a928-3d8fc0b6ec2f', 2, 'Dhanushree A', 'NextGen Innovators', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f3086463-c65b-4283-a928-3d8fc0b6ec2f', 3, 'Livasha M', 'NextGen Innovators', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f3086463-c65b-4283-a928-3d8fc0b6ec2f', 4, 'Kirubhanandham S G', 'NextGen Innovators', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f3086463-c65b-4283-a928-3d8fc0b6ec2f', 5, 'Santhosh Udaiyar', 'NextGen Innovators', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd9c1441c-b3b1-4f1d-9430-236f2e2d7752', 'ORION-S0193', 'TEAM VOID', 'teamvoid', 'Antony Xavier J M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ANTONYXAVIERJM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd9c1441c-b3b1-4f1d-9430-236f2e2d7752', 'VERIFIED-ORION-S0193', 'Antony Xavier J M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd9c1441c-b3b1-4f1d-9430-236f2e2d7752', 1, 'Rahul V', 'TEAM VOID', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd9c1441c-b3b1-4f1d-9430-236f2e2d7752', 2, 'Kavya P', 'TEAM VOID', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd9c1441c-b3b1-4f1d-9430-236f2e2d7752', 3, 'Harshini S', 'TEAM VOID', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd9c1441c-b3b1-4f1d-9430-236f2e2d7752', 4, 'Mathivadani A', 'TEAM VOID', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8f6eee36-447f-440f-b043-039862fe06e6', 'ORION-S0194', 'alpha safety', 'alphasafety', 'Bhuvan K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'BHUVANK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8f6eee36-447f-440f-b043-039862fe06e6', 'VERIFIED-ORION-S0194', 'Bhuvan K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8f6eee36-447f-440f-b043-039862fe06e6', 1, 'selva kumaran P', 'alpha safety', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8f6eee36-447f-440f-b043-039862fe06e6', 2, 'Bavya S', 'alpha safety', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8f6eee36-447f-440f-b043-039862fe06e6', 3, 'Rubika P', 'alpha safety', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8f6eee36-447f-440f-b043-039862fe06e6', 4, 'sathya priya P', 'alpha safety', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8f6eee36-447f-440f-b043-039862fe06e6', 5, 'kishore B', 'alpha safety', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '57255d06-1712-4552-8cc1-416e309b5151', 'ORION-S0195', 'Ctrl freaks', 'ctrlfreaks', 'KAVIYA B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'KAVIYAB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '57255d06-1712-4552-8cc1-416e309b5151', 'VERIFIED-ORION-S0195', 'KAVIYA B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '57255d06-1712-4552-8cc1-416e309b5151', 1, 'KANISHKA V S', 'Ctrl freaks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '57255d06-1712-4552-8cc1-416e309b5151', 2, 'KARTHIKEYAN M', 'Ctrl freaks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '57255d06-1712-4552-8cc1-416e309b5151', 3, 'KEERTHIKA J', 'Ctrl freaks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '57255d06-1712-4552-8cc1-416e309b5151', 4, 'KARTHIGAENI SINGARAV', 'Ctrl freaks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '57255d06-1712-4552-8cc1-416e309b5151', 5, 'KEERTHANAA G', 'Ctrl freaks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'eec00385-4a1d-4ade-9f82-f8fe3633f169', 'ORION-S0196', 'TerraVision AI', 'terravisionai', 'Sudharshan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SUDHARSHAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'eec00385-4a1d-4ade-9f82-f8fe3633f169', 'VERIFIED-ORION-S0196', 'Sudharshan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eec00385-4a1d-4ade-9f82-f8fe3633f169', 1, 'Wilson Christhu dos', 'TerraVision AI', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eec00385-4a1d-4ade-9f82-f8fe3633f169', 2, 'Rajesh', 'TerraVision AI', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eec00385-4a1d-4ade-9f82-f8fe3633f169', 3, 'Yogasree', 'TerraVision AI', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eec00385-4a1d-4ade-9f82-f8fe3633f169', 4, 'Santhosh', 'TerraVision AI', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eec00385-4a1d-4ade-9f82-f8fe3633f169', 5, 'Beulah', 'TerraVision AI', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0d78d1fc-13a7-4b3e-a5d1-7ff3ad1712ca', 'ORION-S0197', 'Top gun', 'topgun', 'deepak', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'DEEPAK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0d78d1fc-13a7-4b3e-a5d1-7ff3ad1712ca', 'VERIFIED-ORION-S0197', 'deepak', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0d78d1fc-13a7-4b3e-a5d1-7ff3ad1712ca', 1, 'GOWTAM ADITYA', 'Top gun', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0d78d1fc-13a7-4b3e-a5d1-7ff3ad1712ca', 2, 'KAMLESH ADITHYA', 'Top gun', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0d78d1fc-13a7-4b3e-a5d1-7ff3ad1712ca', 3, 'KRITHIK NITHIN S T', 'Top gun', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0d78d1fc-13a7-4b3e-a5d1-7ff3ad1712ca', 4, 'SHREESHANTH', 'Top gun', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0d78d1fc-13a7-4b3e-a5d1-7ff3ad1712ca', 5, 'PURJITH KRISHNA', 'Top gun', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ffcd8b61-a063-44d7-88b4-179670c23501', 'ORION-S0198', 'Cyber Kiddies', 'cyberkiddies', 'Jesin Milesh M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'JESINMILESHM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ffcd8b61-a063-44d7-88b4-179670c23501', 'VERIFIED-ORION-S0198', 'Jesin Milesh M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ffcd8b61-a063-44d7-88b4-179670c23501', 1, 'Libinesh R U', 'Cyber Kiddies', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ffcd8b61-a063-44d7-88b4-179670c23501', 2, 'Jeshwanth V', 'Cyber Kiddies', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ffcd8b61-a063-44d7-88b4-179670c23501', 3, 'Jeeva D', 'Cyber Kiddies', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ffcd8b61-a063-44d7-88b4-179670c23501', 4, 'Madeshwaran P', 'Cyber Kiddies', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ffcd8b61-a063-44d7-88b4-179670c23501', 5, 'Ashish N', 'Cyber Kiddies', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'bdec7382-f603-4ff2-b733-c29fe10419a6', 'ORION-S0199', 'PREETHI A', 'preethia', 'PREETHI A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PREETHIA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'bdec7382-f603-4ff2-b733-c29fe10419a6', 'VERIFIED-ORION-S0199', 'PREETHI A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bdec7382-f603-4ff2-b733-c29fe10419a6', 1, 'VINOTHINI T', 'PREETHI A', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bdec7382-f603-4ff2-b733-c29fe10419a6', 2, 'MOHANA P Y', 'PREETHI A', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '996713f3-bd7d-4bc0-b0af-427647d7a9eb', 'ORION-S0200', 'Binary Brains', 'binarybrains', 'Naveena R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'NAVEENAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '996713f3-bd7d-4bc0-b0af-427647d7a9eb', 'VERIFIED-ORION-S0200', 'Naveena R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '996713f3-bd7d-4bc0-b0af-427647d7a9eb', 1, 'Pranav A', 'Binary Brains', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '996713f3-bd7d-4bc0-b0af-427647d7a9eb', 2, 'Praveen L R', 'Binary Brains', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '996713f3-bd7d-4bc0-b0af-427647d7a9eb', 3, 'Pooja R', 'Binary Brains', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '19603089-8f12-44aa-b10d-e48ac4f54514', 'ORION-S0201', 'Hackhive', 'hackhive', 'JEYASHREE V', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'JEYASHREEV',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '19603089-8f12-44aa-b10d-e48ac4f54514', 'VERIFIED-ORION-S0201', 'JEYASHREE V', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '19603089-8f12-44aa-b10d-e48ac4f54514', 1, 'HARSITHA C', 'Hackhive', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '19603089-8f12-44aa-b10d-e48ac4f54514', 2, 'KAVIBHARATHI M', 'Hackhive', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '19603089-8f12-44aa-b10d-e48ac4f54514', 3, 'JENITHAASRI M', 'Hackhive', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '686230de-5801-4a6f-9321-6cecebe6e26c', 'ORION-S0202', 'Yokeshwaran', 'yokeshwaran', 'Yokeshwaran', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'YOKESHWARAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '686230de-5801-4a6f-9321-6cecebe6e26c', 'VERIFIED-ORION-S0202', 'Yokeshwaran', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '686230de-5801-4a6f-9321-6cecebe6e26c', 1, 'Sudharshan R', 'Yokeshwaran', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '686230de-5801-4a6f-9321-6cecebe6e26c', 2, 'Sudesh pranav E.S', 'Yokeshwaran', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '686230de-5801-4a6f-9321-6cecebe6e26c', 3, 'Sateendar H', 'Yokeshwaran', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd64f3d3b-8444-4910-8454-e2d2aa91466a', 'ORION-S0203', 'elytra tech', 'elytratech', 'samuel joel ponraj', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SAMUELJOELPONRAJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd64f3d3b-8444-4910-8454-e2d2aa91466a', 'VERIFIED-ORION-S0203', 'samuel joel ponraj', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd64f3d3b-8444-4910-8454-e2d2aa91466a', 1, 'samuel varghese', 'elytra tech', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd64f3d3b-8444-4910-8454-e2d2aa91466a', 2, 'paul jeromae', 'elytra tech', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '6d2e19a5-acc7-4c1a-a27e-058270d78b1f', 'ORION-S0204', 'Dronai', 'dronai', 'Rannadeer kumar seetha', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'RANNADEERKUMARSEETHA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '6d2e19a5-acc7-4c1a-a27e-058270d78b1f', 'VERIFIED-ORION-S0204', 'Rannadeer kumar seetha', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6d2e19a5-acc7-4c1a-a27e-058270d78b1f', 1, 'Nanda Kishore Chav', 'Dronai', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6d2e19a5-acc7-4c1a-a27e-058270d78b1f', 2, 'Arshad s', 'Dronai', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '80be1576-81ef-447e-84f0-eec929c0a617', 'ORION-S0205', 'CrackAura', 'crackaura', 'SRIRAM M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SRIRAMM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '80be1576-81ef-447e-84f0-eec929c0a617', 'VERIFIED-ORION-S0205', 'SRIRAM M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '80be1576-81ef-447e-84f0-eec929c0a617', 1, 'Vandhana Murugan', 'CrackAura', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '80be1576-81ef-447e-84f0-eec929c0a617', 2, 'Vimaladhithya C V', 'CrackAura', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '80be1576-81ef-447e-84f0-eec929c0a617', 3, 'Vedhika N', 'CrackAura', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '80be1576-81ef-447e-84f0-eec929c0a617', 4, 'Thuthiksha bhavana', 'CrackAura', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '80be1576-81ef-447e-84f0-eec929c0a617', 5, 'Janani S', 'CrackAura', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f3b80a41-4abb-4803-ba00-341b4321cfdf', 'ORION-S0206', 'The Creators', 'thecreators', 'Sweety Vincent', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SWEETYVINCENT',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f3b80a41-4abb-4803-ba00-341b4321cfdf', 'VERIFIED-ORION-S0206', 'Sweety Vincent', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f3b80a41-4abb-4803-ba00-341b4321cfdf', 1, 'Swapna R V', 'The Creators', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f3b80a41-4abb-4803-ba00-341b4321cfdf', 2, 'Ruba Darshni J', 'The Creators', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f3b80a41-4abb-4803-ba00-341b4321cfdf', 3, 'Srinitharaj', 'The Creators', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f3b80a41-4abb-4803-ba00-341b4321cfdf', 4, 'Sruthi Krishnan', 'The Creators', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f3b80a41-4abb-4803-ba00-341b4321cfdf', 5, 'Kavivarshni G', 'The Creators', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '57883e25-eba6-4654-afab-7586f68a1184', 'ORION-S0207', 'Quantum Minds', 'quantumminds', 'manasvi sachin jagtap', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MANASVISACHINJAGTAP',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '57883e25-eba6-4654-afab-7586f68a1184', 'VERIFIED-ORION-S0207', 'manasvi sachin jagtap', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '57883e25-eba6-4654-afab-7586f68a1184', 1, 'madhura sunil pawa', 'Quantum Minds', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '57883e25-eba6-4654-afab-7586f68a1184', 2, 'shivani appa vyavahare', 'Quantum Minds', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '57883e25-eba6-4654-afab-7586f68a1184', 3, 'Sandesh shivaji bong', 'Quantum Minds', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ead6a0fe-dd16-4ff5-87b7-24f6ed210b26', 'ORION-S0208', 'git commit -m "Victory"', 'gitcommitmvictory', 'Daniel Sebastin A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'DANIELSEBASTINA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ead6a0fe-dd16-4ff5-87b7-24f6ed210b26', 'VERIFIED-ORION-S0208', 'Daniel Sebastin A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ead6a0fe-dd16-4ff5-87b7-24f6ed210b26', 1, 'Ramya Clemenceau', 'git commit -m "Victory"', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ead6a0fe-dd16-4ff5-87b7-24f6ed210b26', 2, 'Javid Ali A', 'git commit -m "Victory"', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ead6a0fe-dd16-4ff5-87b7-24f6ed210b26', 3, 'Gokhul A', 'git commit -m "Victory"', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4b78ca0d-fb7d-49aa-9831-824f8c55d5cc', 'ORION-S0209', 'Binary Brains', 'binarybrains', 'GONEDA Tushar Karthik', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'GONEDATUSHARKARTHIK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4b78ca0d-fb7d-49aa-9831-824f8c55d5cc', 'VERIFIED-ORION-S0209', 'GONEDA Tushar Karthik', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4b78ca0d-fb7d-49aa-9831-824f8c55d5cc', 1, 'Mallipeddi omsaitej', 'Binary Brains', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4b78ca0d-fb7d-49aa-9831-824f8c55d5cc', 2, 'Challapareddy Ram Charan', 'Binary Brains', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4b78ca0d-fb7d-49aa-9831-824f8c55d5cc', 3, 'M S N V Chandra Mo', 'Binary Brains', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4b78ca0d-fb7d-49aa-9831-824f8c55d5cc', 4, 'Akkineni Sai Venkat', 'Binary Brains', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'a5b41bc0-b2d4-4297-a37d-1294ae1cc855', 'ORION-S0210', 'Hack Hype', 'hackhype', 'Nandhini', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'NANDHINI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'a5b41bc0-b2d4-4297-a37d-1294ae1cc855', 'VERIFIED-ORION-S0210', 'Nandhini', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a5b41bc0-b2d4-4297-a37d-1294ae1cc855', 1, 'Harshini D', 'Hack Hype', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a5b41bc0-b2d4-4297-a37d-1294ae1cc855', 2, 'Kirithika. A', 'Hack Hype', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a5b41bc0-b2d4-4297-a37d-1294ae1cc855', 3, 'Roshith O', 'Hack Hype', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a5b41bc0-b2d4-4297-a37d-1294ae1cc855', 4, 'Sastha S', 'Hack Hype', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a5b41bc0-b2d4-4297-a37d-1294ae1cc855', 5, 'Nirmalkumar M', 'Hack Hype', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4ccfcb7f-6b9e-4099-b038-16c13f5f8b83', 'ORION-S0211', 'LinkupLaps', 'linkuplaps', 'Prakash R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PRAKASHR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4ccfcb7f-6b9e-4099-b038-16c13f5f8b83', 'VERIFIED-ORION-S0211', 'Prakash R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4ccfcb7f-6b9e-4099-b038-16c13f5f8b83', 1, 'Prasanna K', 'LinkupLaps', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4ccfcb7f-6b9e-4099-b038-16c13f5f8b83', 2, 'Pranav GS', 'LinkupLaps', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4ccfcb7f-6b9e-4099-b038-16c13f5f8b83', 3, 'Piraisoodan R', 'LinkupLaps', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4ccfcb7f-6b9e-4099-b038-16c13f5f8b83', 4, 'Nithyanandh BS', 'LinkupLaps', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4ccfcb7f-6b9e-4099-b038-16c13f5f8b83', 5, 'Rajeshwar S', 'LinkupLaps', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ebd13a54-0279-401e-b770-fe85c155389d', 'ORION-S0212', 'Debug Divas', 'debugdivas', 'Atchaya M S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ATCHAYAMS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ebd13a54-0279-401e-b770-fe85c155389d', 'VERIFIED-ORION-S0212', 'Atchaya M S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ebd13a54-0279-401e-b770-fe85c155389d', 1, 'priyadharshini J', 'Debug Divas', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ebd13a54-0279-401e-b770-fe85c155389d', 2, 'Aarthi V', 'Debug Divas', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ebd13a54-0279-401e-b770-fe85c155389d', 3, 'Harini J', 'Debug Divas', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ebd13a54-0279-401e-b770-fe85c155389d', 4, 'Renuka R', 'Debug Divas', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ebd13a54-0279-401e-b770-fe85c155389d', 5, 'suriyakala S', 'Debug Divas', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '532eb6f1-8ae4-4936-a6b0-08f6cecec44c', 'ORION-S0213', 'AquaByte', 'aquabyte', 'MOHAMED RIYASKHAN S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MOHAMEDRIYASKHANS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '532eb6f1-8ae4-4936-a6b0-08f6cecec44c', 'VERIFIED-ORION-S0213', 'MOHAMED RIYASKHAN S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '532eb6f1-8ae4-4936-a6b0-08f6cecec44c', 1, 'Santhosh S', 'AquaByte', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '532eb6f1-8ae4-4936-a6b0-08f6cecec44c', 2, 'Ramkumar K', 'AquaByte', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '532eb6f1-8ae4-4936-a6b0-08f6cecec44c', 3, 'Rohit R S', 'AquaByte', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8e7d1e87-c8db-46e0-a572-e11d12c7bfdd', 'ORION-S0214', 'Code Forge', 'codeforge', 'Vaarshini B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'VAARSHINIB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8e7d1e87-c8db-46e0-a572-e11d12c7bfdd', 'VERIFIED-ORION-S0214', 'Vaarshini B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8e7d1e87-c8db-46e0-a572-e11d12c7bfdd', 1, 'Palaneappan M', 'Code Forge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8e7d1e87-c8db-46e0-a572-e11d12c7bfdd', 2, 'Harini B', 'Code Forge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8e7d1e87-c8db-46e0-a572-e11d12c7bfdd', 3, 'Sumurthaa V', 'Code Forge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8e7d1e87-c8db-46e0-a572-e11d12c7bfdd', 4, 'Mutthu M', 'Code Forge', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '3a1cfb2a-8421-4a61-b3a8-7fe411181bee', 'ORION-S0215', 'ALGOS', 'algos', 'Vishnu D', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'VISHNUD',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '3a1cfb2a-8421-4a61-b3a8-7fe411181bee', 'VERIFIED-ORION-S0215', 'Vishnu D', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3a1cfb2a-8421-4a61-b3a8-7fe411181bee', 1, 'Raja Thinakaran V', 'ALGOS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3a1cfb2a-8421-4a61-b3a8-7fe411181bee', 2, 'Riya R', 'ALGOS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3a1cfb2a-8421-4a61-b3a8-7fe411181bee', 3, 'Tharika Nayaki S', 'ALGOS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3a1cfb2a-8421-4a61-b3a8-7fe411181bee', 4, 'Yuvaraj C', 'ALGOS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '29e7dc9b-076e-4944-b240-66ebaae68cd6', 'ORION-S0216', 'C0DE RED', 'c0dered', 'Sagaar suresh', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SAGAARSURESH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '29e7dc9b-076e-4944-b240-66ebaae68cd6', 'VERIFIED-ORION-S0216', 'Sagaar suresh', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '29e7dc9b-076e-4944-b240-66ebaae68cd6', 1, 'Ritthiga B', 'C0DE RED', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '29e7dc9b-076e-4944-b240-66ebaae68cd6', 2, 'Venkatesan R', 'C0DE RED', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '29e7dc9b-076e-4944-b240-66ebaae68cd6', 3, 'Rithika V', 'C0DE RED', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd05b69d8-3a82-4121-8216-b2511e59a63d', 'ORION-S0217', 'TechAura', 'techaura', 'K.Shri vijaya harini', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'KSHRIVIJAYAHARINI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd05b69d8-3a82-4121-8216-b2511e59a63d', 'VERIFIED-ORION-S0217', 'K.Shri vijaya harini', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd05b69d8-3a82-4121-8216-b2511e59a63d', 1, 'Roshini A', 'TechAura', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd05b69d8-3a82-4121-8216-b2511e59a63d', 2, 'Nasiba', 'TechAura', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd05b69d8-3a82-4121-8216-b2511e59a63d', 3, 'Nusurath fathima', 'TechAura', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '32ccede4-aad8-46a0-ae20-a626f443d6dc', 'ORION-S0218', 'Sparks', 'sparks', 'Vilina K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'VILINAK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '32ccede4-aad8-46a0-ae20-a626f443d6dc', 'VERIFIED-ORION-S0218', 'Vilina K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '32ccede4-aad8-46a0-ae20-a626f443d6dc', 1, 'Varuna V', 'Sparks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '32ccede4-aad8-46a0-ae20-a626f443d6dc', 2, 'Varshini R', 'Sparks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '32ccede4-aad8-46a0-ae20-a626f443d6dc', 3, 'Sriharini K', 'Sparks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '32ccede4-aad8-46a0-ae20-a626f443d6dc', 4, 'Stephy Alice Christy D', 'Sparks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '32ccede4-aad8-46a0-ae20-a626f443d6dc', 5, 'Sri Varshini V', 'Sparks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'dc3ff2a1-8392-44a7-a4ba-a85cd879d182', 'ORION-S0219', 'INQORA', 'inqora', 'X.KRECENCIA', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'XKRECENCIA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'dc3ff2a1-8392-44a7-a4ba-a85cd879d182', 'VERIFIED-ORION-S0219', 'X.KRECENCIA', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dc3ff2a1-8392-44a7-a4ba-a85cd879d182', 1, 'HARISH BABU M', 'INQORA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dc3ff2a1-8392-44a7-a4ba-a85cd879d182', 2, 'SURYA G V', 'INQORA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dc3ff2a1-8392-44a7-a4ba-a85cd879d182', 3, 'THANUSHREE K S', 'INQORA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dc3ff2a1-8392-44a7-a4ba-a85cd879d182', 4, 'ANUGRAHA SAJI', 'INQORA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dc3ff2a1-8392-44a7-a4ba-a85cd879d182', 5, 'Shaai Ganesh P', 'INQORA', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c2963bfc-51a3-4b35-b8f4-77c0fe493f4b', 'ORION-S0220', 'The Quantum Coders', 'thequantumcoders', 'Sivanandham G', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SIVANANDHAMG',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c2963bfc-51a3-4b35-b8f4-77c0fe493f4b', 'VERIFIED-ORION-S0220', 'Sivanandham G', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c2963bfc-51a3-4b35-b8f4-77c0fe493f4b', 1, 'Srikanth Y', 'The Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c2963bfc-51a3-4b35-b8f4-77c0fe493f4b', 2, 'Richardson S', 'The Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c2963bfc-51a3-4b35-b8f4-77c0fe493f4b', 3, 'Ukesh Kumar R', 'The Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c2963bfc-51a3-4b35-b8f4-77c0fe493f4b', 4, 'Giridharan V', 'The Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c2963bfc-51a3-4b35-b8f4-77c0fe493f4b', 5, 'Ragav Rathinam V', 'The Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5a8917d6-464c-4842-a185-be3c35930893', 'ORION-S0221', 'Team titans', 'teamtitans', 'AKSHAYA K 111625201005', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'AKSHAYAK111625201005',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5a8917d6-464c-4842-a185-be3c35930893', 'VERIFIED-ORION-S0221', 'AKSHAYA K 111625201005', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5a8917d6-464c-4842-a185-be3c35930893', 1, 'Dhiya R', 'Team titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5a8917d6-464c-4842-a185-be3c35930893', 2, 'Dharshini PV', 'Team titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5a8917d6-464c-4842-a185-be3c35930893', 3, 'Harshitha V', 'Team titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5a8917d6-464c-4842-a185-be3c35930893', 4, 'Bhuvana Lakshmi B', 'Team titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5a8917d6-464c-4842-a185-be3c35930893', 5, 'Heena S.V', 'Team titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '7d82a033-f15b-4bb0-893c-a112a4756028', 'ORION-S0222', 'NeuroFlux', 'neuroflux', 'Madhumitha T K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MADHUMITHATK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '7d82a033-f15b-4bb0-893c-a112a4756028', 'VERIFIED-ORION-S0222', 'Madhumitha T K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7d82a033-f15b-4bb0-893c-a112a4756028', 1, 'Malathi S', 'NeuroFlux', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7d82a033-f15b-4bb0-893c-a112a4756028', 2, 'Nevetha D', 'NeuroFlux', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7d82a033-f15b-4bb0-893c-a112a4756028', 3, 'Mariammal M', 'NeuroFlux', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'a2e6d649-eba7-41f8-b260-4ad54884c559', 'ORION-S0223', 'Deep Matrix', 'deepmatrix', 'V Hari Krishnan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'VHARIKRISHNAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'a2e6d649-eba7-41f8-b260-4ad54884c559', 'VERIFIED-ORION-S0223', 'V Hari Krishnan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a2e6d649-eba7-41f8-b260-4ad54884c559', 1, 'A Lohit', 'Deep Matrix', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a2e6d649-eba7-41f8-b260-4ad54884c559', 2, 'Ruhan Prasad S', 'Deep Matrix', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a2e6d649-eba7-41f8-b260-4ad54884c559', 3, 'Aravintakshan A L', 'Deep Matrix', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a2e6d649-eba7-41f8-b260-4ad54884c559', 4, 'Nithin K', 'Deep Matrix', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a2e6d649-eba7-41f8-b260-4ad54884c559', 5, 'Sri Aarush Tej N', 'Deep Matrix', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '313e5753-a3c3-4eb1-afff-56024f4c0baf', 'ORION-S0224', 'Shadow_Monarch', 'shadowmonarch', 'Pavan Kumar', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PAVANKUMAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '313e5753-a3c3-4eb1-afff-56024f4c0baf', 'VERIFIED-ORION-S0224', 'Pavan Kumar', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '313e5753-a3c3-4eb1-afff-56024f4c0baf', 1, 'Karunya', 'Shadow_Monarch', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '096ec2d2-d0de-4f2b-b893-d227143fee89', 'ORION-S0225', 'Yeah squad', 'yeahsquad', 'Rubendran V', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'RUBENDRANV',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '096ec2d2-d0de-4f2b-b893-d227143fee89', 'VERIFIED-ORION-S0225', 'Rubendran V', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '096ec2d2-d0de-4f2b-b893-d227143fee89', 1, 'Sanjay K', 'Yeah squad', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '096ec2d2-d0de-4f2b-b893-d227143fee89', 2, 'Ravisankar J', 'Yeah squad', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '096ec2d2-d0de-4f2b-b893-d227143fee89', 3, 'Sundaresan K', 'Yeah squad', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '096ec2d2-d0de-4f2b-b893-d227143fee89', 4, 'Sivaganesh S', 'Yeah squad', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '096ec2d2-d0de-4f2b-b893-d227143fee89', 5, 'Sudharshan A', 'Yeah squad', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '6dc898b2-2cad-44ca-a4d5-ba92fa866155', 'ORION-S0226', 'Doddlebug', 'doddlebug', 'Avinash Venkatraman', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'AVINASHVENKATRAMAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '6dc898b2-2cad-44ca-a4d5-ba92fa866155', 'VERIFIED-ORION-S0226', 'Avinash Venkatraman', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6dc898b2-2cad-44ca-a4d5-ba92fa866155', 1, 'LAKSHMIPRIYA S', 'Doddlebug', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6dc898b2-2cad-44ca-a4d5-ba92fa866155', 2, 'Dharshini M', 'Doddlebug', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6dc898b2-2cad-44ca-a4d5-ba92fa866155', 3, 'Aravind Kumar P', 'Doddlebug', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0efc28a7-4729-4188-b32e-f56c3a731d81', 'ORION-S0227', 'Tech innovator', 'techinnovator', 'Pragadeshwaran', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PRAGADESHWARAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0efc28a7-4729-4188-b32e-f56c3a731d81', 'VERIFIED-ORION-S0227', 'Pragadeshwaran', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0efc28a7-4729-4188-b32e-f56c3a731d81', 1, 'Priya. S', 'Tech innovator', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0efc28a7-4729-4188-b32e-f56c3a731d81', 2, 'Varshini. S', 'Tech innovator', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '09386c10-7a56-46b0-92ce-bf7851b7fab1', 'ORION-S0228', 'Eagerists', 'eagerists', 'Deepa Ganesh J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'DEEPAGANESHJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '09386c10-7a56-46b0-92ce-bf7851b7fab1', 'VERIFIED-ORION-S0228', 'Deepa Ganesh J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '09386c10-7a56-46b0-92ce-bf7851b7fab1', 1, 'Elancholan P', 'Eagerists', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '09386c10-7a56-46b0-92ce-bf7851b7fab1', 2, 'Aravindhane VS', 'Eagerists', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '09386c10-7a56-46b0-92ce-bf7851b7fab1', 3, 'Jayakips Antony', 'Eagerists', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '09386c10-7a56-46b0-92ce-bf7851b7fab1', 4, 'Jeevesh M', 'Eagerists', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '09386c10-7a56-46b0-92ce-bf7851b7fab1', 5, 'Rajaneesh', 'Eagerists', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8da8ad71-24ab-4c3b-a4f2-c76d066112eb', 'ORION-S0229', 'Coderzz', 'coderzz', 'Sneha J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SNEHAJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8da8ad71-24ab-4c3b-a4f2-c76d066112eb', 'VERIFIED-ORION-S0229', 'Sneha J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8da8ad71-24ab-4c3b-a4f2-c76d066112eb', 1, 'Sasidharan K', 'Coderzz', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '13f50811-4047-43ee-a761-f1c2c6834448', 'ORION-S0230', 'PARAGON', 'paragon', 'Sai Sowndiriyaa T', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SAISOWNDIRIYAAT',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '13f50811-4047-43ee-a761-f1c2c6834448', 'VERIFIED-ORION-S0230', 'Sai Sowndiriyaa T', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '13f50811-4047-43ee-a761-f1c2c6834448', 1, 'Sai Sruthi S', 'PARAGON', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '13f50811-4047-43ee-a761-f1c2c6834448', 2, 'Sanjai B', 'PARAGON', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '69452a75-1afe-425b-b221-87415b1d1826', 'ORION-S0231', 'Corex', 'corex', 'Parthasarathi M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PARTHASARATHIM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '69452a75-1afe-425b-b221-87415b1d1826', 'VERIFIED-ORION-S0231', 'Parthasarathi M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69452a75-1afe-425b-b221-87415b1d1826', 1, 'Muniraja P.M', 'Corex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69452a75-1afe-425b-b221-87415b1d1826', 2, 'MUGESHKUMAR M', 'Corex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69452a75-1afe-425b-b221-87415b1d1826', 3, 'MUKUNDAN T', 'Corex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69452a75-1afe-425b-b221-87415b1d1826', 4, 'Mohan Raj N', 'Corex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69452a75-1afe-425b-b221-87415b1d1826', 5, 'PRASHANTH H', 'Corex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '778df2af-4f07-4d15-a595-33604bf38906', 'ORION-S0232', 'Galactic Force', 'galacticforce', 'C.Tarunarayan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'CTARUNARAYAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '778df2af-4f07-4d15-a595-33604bf38906', 'VERIFIED-ORION-S0232', 'C.Tarunarayan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '778df2af-4f07-4d15-a595-33604bf38906', 1, 'Guru Varshini', 'Galactic Force', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '778df2af-4f07-4d15-a595-33604bf38906', 2, 'Melvin Prince Rohan', 'Galactic Force', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '778df2af-4f07-4d15-a595-33604bf38906', 3, 'R Mithun Kumar', 'Galactic Force', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '65381727-7546-4fc9-bca3-22894f113c8a', 'ORION-S0233', 'Code titans', 'codetitans', 'Sabareesh', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SABAREESH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '65381727-7546-4fc9-bca3-22894f113c8a', 'VERIFIED-ORION-S0233', 'Sabareesh', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '65381727-7546-4fc9-bca3-22894f113c8a', 1, 'Madhumithaa Kathir', 'Code titans', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '3ceca3a0-fe21-4605-8f00-7ae6cfdca63b', 'ORION-S0234', 'Alpha', 'alpha', 'Sharvesh S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SHARVESHS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '3ceca3a0-fe21-4605-8f00-7ae6cfdca63b', 'VERIFIED-ORION-S0234', 'Sharvesh S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3ceca3a0-fe21-4605-8f00-7ae6cfdca63b', 1, 'Siddharth P', 'Alpha', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3ceca3a0-fe21-4605-8f00-7ae6cfdca63b', 2, 'Sarveshvijay K', 'Alpha', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '46d6eed2-2331-4722-9ef2-2b924bd2c8ea', 'ORION-S0235', 'Bleach', 'bleach', 'Sriya Bheema', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SRIYABHEEMA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '46d6eed2-2331-4722-9ef2-2b924bd2c8ea', 'VERIFIED-ORION-S0235', 'Sriya Bheema', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '46d6eed2-2331-4722-9ef2-2b924bd2c8ea', 1, 'Mohan Nikitha', 'Bleach', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '46d6eed2-2331-4722-9ef2-2b924bd2c8ea', 2, 'N . Sabareesh raam', 'Bleach', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '46d6eed2-2331-4722-9ef2-2b924bd2c8ea', 3, 'Sabarish. S', 'Bleach', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '46d6eed2-2331-4722-9ef2-2b924bd2c8ea', 4, 'Sainath P', 'Bleach', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '58051de8-e081-487e-848b-5241ddb969e2', 'ORION-S0236', 'Cupid.exe', 'cupidexe', 'Sachin R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SACHINR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '58051de8-e081-487e-848b-5241ddb969e2', 'VERIFIED-ORION-S0236', 'Sachin R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '58051de8-e081-487e-848b-5241ddb969e2', 1, 'Sangeetha P', 'Cupid.exe', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '945ae731-5028-4425-bc7a-d3594bc351e7', 'ORION-S0237', 'Team Endeavours', 'teamendeavours', 'Srirangapprasath I', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SRIRANGAPPRASATHI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '945ae731-5028-4425-bc7a-d3594bc351e7', 'VERIFIED-ORION-S0237', 'Srirangapprasath I', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '945ae731-5028-4425-bc7a-d3594bc351e7', 1, 'Sudharsan S', 'Team Endeavours', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ac1b98c9-e96f-4bf0-871b-a3029e7b232b', 'ORION-S0238', 'AQUABOTS', 'aquabots', 'DHIVYASHRI S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'DHIVYASHRIS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ac1b98c9-e96f-4bf0-871b-a3029e7b232b', 'VERIFIED-ORION-S0238', 'DHIVYASHRI S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ac1b98c9-e96f-4bf0-871b-a3029e7b232b', 1, 'DEVASHRI S', 'AQUABOTS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ac1b98c9-e96f-4bf0-871b-a3029e7b232b', 2, 'FARHANUDIN B', 'AQUABOTS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ac1b98c9-e96f-4bf0-871b-a3029e7b232b', 3, 'SULAKA B', 'AQUABOTS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ac1b98c9-e96f-4bf0-871b-a3029e7b232b', 4, 'NEERAJA S', 'AQUABOTS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ac1b98c9-e96f-4bf0-871b-a3029e7b232b', 5, 'THOLKAPPIYAN Y', 'AQUABOTS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '1bc56a3c-4d95-438f-9e3a-87c4b399b7f8', 'ORION-S0239', 'Quinex', 'quinex', 'K.Sabana Banu', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'KSABANABANU',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '1bc56a3c-4d95-438f-9e3a-87c4b399b7f8', 'VERIFIED-ORION-S0239', 'K.Sabana Banu', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1bc56a3c-4d95-438f-9e3a-87c4b399b7f8', 1, 'R.Pavithra', 'Quinex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1bc56a3c-4d95-438f-9e3a-87c4b399b7f8', 2, 'M.Muthu Vetha Varshini', 'Quinex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1bc56a3c-4d95-438f-9e3a-87c4b399b7f8', 3, 'R.Abirami', 'Quinex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1bc56a3c-4d95-438f-9e3a-87c4b399b7f8', 4, 'S.Aishwarya Lakshmi', 'Quinex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1bc56a3c-4d95-438f-9e3a-87c4b399b7f8', 5, 'S.Akshaya', 'Quinex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd8ed434b-a930-4cf7-baf4-db1cf38d4260', 'ORION-S0240', 'DSCE', 'dsce', 'Nadin S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'NADINS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd8ed434b-a930-4cf7-baf4-db1cf38d4260', 'VERIFIED-ORION-S0240', 'Nadin S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd8ed434b-a930-4cf7-baf4-db1cf38d4260', 1, 'Mokeshwaran G', 'DSCE', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd8ed434b-a930-4cf7-baf4-db1cf38d4260', 2, 'Mathuravel G', 'DSCE', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd8ed434b-a930-4cf7-baf4-db1cf38d4260', 3, 'Manojkumar J', 'DSCE', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '259d8c14-a91d-4861-879a-0cc3ee1c1762', 'ORION-S0241', 'Tech Tetra', 'techtetra', 'Kavisri A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'KAVISRIA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '259d8c14-a91d-4861-879a-0cc3ee1c1762', 'VERIFIED-ORION-S0241', 'Kavisri A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '259d8c14-a91d-4861-879a-0cc3ee1c1762', 1, 'Janani N', 'Tech Tetra', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '259d8c14-a91d-4861-879a-0cc3ee1c1762', 2, 'Ashni JV', 'Tech Tetra', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '259d8c14-a91d-4861-879a-0cc3ee1c1762', 3, 'Nivi R', 'Tech Tetra', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'a395d718-6f8c-498b-9564-14ea14481dc4', 'ORION-S0242', 'Epsilon', 'epsilon', 'Sanchita S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SANCHITAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'a395d718-6f8c-498b-9564-14ea14481dc4', 'VERIFIED-ORION-S0242', 'Sanchita S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a395d718-6f8c-498b-9564-14ea14481dc4', 1, 'Thilak Raj V', 'Epsilon', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a395d718-6f8c-498b-9564-14ea14481dc4', 2, 'Sheniga Sam Robert Jasmine', 'Epsilon', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a395d718-6f8c-498b-9564-14ea14481dc4', 3, 'R Miraculin Rose', 'Epsilon', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a395d718-6f8c-498b-9564-14ea14481dc4', 4, 'Ahmad Faiyaz', 'Epsilon', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a395d718-6f8c-498b-9564-14ea14481dc4', 5, 'M D Nafiz Ahmed', 'Epsilon', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '9333bc76-c1e1-4e26-8d4f-4d7fb5a0231d', 'ORION-S0243', 'AI INFINITY', 'aiinfinity', 'Jibriya Begam A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'JIBRIYABEGAMA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '9333bc76-c1e1-4e26-8d4f-4d7fb5a0231d', 'VERIFIED-ORION-S0243', 'Jibriya Begam A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9333bc76-c1e1-4e26-8d4f-4d7fb5a0231d', 1, 'Lakshayaa', 'AI INFINITY', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9333bc76-c1e1-4e26-8d4f-4d7fb5a0231d', 2, 'Nisha', 'AI INFINITY', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9333bc76-c1e1-4e26-8d4f-4d7fb5a0231d', 3, 'Logeshwar K', 'AI INFINITY', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9333bc76-c1e1-4e26-8d4f-4d7fb5a0231d', 4, 'Janarthanan D', 'AI INFINITY', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9333bc76-c1e1-4e26-8d4f-4d7fb5a0231d', 5, 'Nizamudeen S', 'AI INFINITY', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '3fc2d8ec-1236-4374-91f0-51d274f9368e', 'ORION-S0244', 'AXION', 'axion', 'VASANTHAKUMAR S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'VASANTHAKUMARS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '3fc2d8ec-1236-4374-91f0-51d274f9368e', 'VERIFIED-ORION-S0244', 'VASANTHAKUMAR S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3fc2d8ec-1236-4374-91f0-51d274f9368e', 1, 'AAKASH K', 'AXION', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3fc2d8ec-1236-4374-91f0-51d274f9368e', 2, 'NISMA FATHIMA N', 'AXION', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3fc2d8ec-1236-4374-91f0-51d274f9368e', 3, 'BHIBISHA JASMINE', 'AXION', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3fc2d8ec-1236-4374-91f0-51d274f9368e', 4, 'KAVIYASHREE T', 'AXION', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3fc2d8ec-1236-4374-91f0-51d274f9368e', 5, 'VIJAY SHARMA J', 'AXION', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f546c1af-f508-4929-8702-41c47b846ade', 'ORION-S0245', 'DayOne', 'dayone', 'R S M Sri Vishnu', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'RSMSRIVISHNU',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f546c1af-f508-4929-8702-41c47b846ade', 'VERIFIED-ORION-S0245', 'R S M Sri Vishnu', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f546c1af-f508-4929-8702-41c47b846ade', 1, 'Varshen S C', 'DayOne', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f546c1af-f508-4929-8702-41c47b846ade', 2, 'Vishnu M', 'DayOne', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f546c1af-f508-4929-8702-41c47b846ade', 3, 'Anbu Selvan T', 'DayOne', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f546c1af-f508-4929-8702-41c47b846ade', 4, 'Sanjith V', 'DayOne', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f546c1af-f508-4929-8702-41c47b846ade', 5, 'Harsshan S', 'DayOne', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '65fba473-c08d-4798-a909-b3b23a380bd7', 'ORION-S0246', 'Algorise', 'algorise', 'Krishna Karthi', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'KRISHNAKARTHI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '65fba473-c08d-4798-a909-b3b23a380bd7', 'VERIFIED-ORION-S0246', 'Krishna Karthi', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '65fba473-c08d-4798-a909-b3b23a380bd7', 1, 'Dhatshna S', 'Algorise', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '65fba473-c08d-4798-a909-b3b23a380bd7', 2, 'Kiruba', 'Algorise', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '65fba473-c08d-4798-a909-b3b23a380bd7', 3, 'Maha lakshmi', 'Algorise', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '65fba473-c08d-4798-a909-b3b23a380bd7', 4, 'Kiruthika', 'Algorise', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd1e96f0a-0cfe-4d97-82cf-db6c162c9eed', 'ORION-S0247', 'Syntax Errorist', 'syntaxerrorist', 'Keerthika J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'KEERTHIKAJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd1e96f0a-0cfe-4d97-82cf-db6c162c9eed', 'VERIFIED-ORION-S0247', 'Keerthika J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd1e96f0a-0cfe-4d97-82cf-db6c162c9eed', 1, 'Harshini Priya V', 'Syntax Errorist', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd1e96f0a-0cfe-4d97-82cf-db6c162c9eed', 2, 'Asvika N', 'Syntax Errorist', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd1e96f0a-0cfe-4d97-82cf-db6c162c9eed', 3, 'Dande Varshitha', 'Syntax Errorist', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd1e96f0a-0cfe-4d97-82cf-db6c162c9eed', 4, 'Janani J', 'Syntax Errorist', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ee0873fb-3fdf-43eb-afbc-b58acb3e50ae', 'ORION-S0248', 'CodeMax', 'codemax', 'Ili. Srinidhi', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ILISRINIDHI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ee0873fb-3fdf-43eb-afbc-b58acb3e50ae', 'VERIFIED-ORION-S0248', 'Ili. Srinidhi', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ee0873fb-3fdf-43eb-afbc-b58acb3e50ae', 1, 'Suram Varshini', 'CodeMax', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ee0873fb-3fdf-43eb-afbc-b58acb3e50ae', 2, 'Gajula Vedhasree', 'CodeMax', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '784e1563-f047-424d-bb7f-ce8b6b391b36', 'ORION-S0249', 'Technoverse', 'technoverse', 'Lohith kumar R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'LOHITHKUMARR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '784e1563-f047-424d-bb7f-ce8b6b391b36', 'VERIFIED-ORION-S0249', 'Lohith kumar R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '784e1563-f047-424d-bb7f-ce8b6b391b36', 1, 'GokulJayandan R S', 'Technoverse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '784e1563-f047-424d-bb7f-ce8b6b391b36', 2, 'Kiranraj M', 'Technoverse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '784e1563-f047-424d-bb7f-ce8b6b391b36', 3, 'P S kishore', 'Technoverse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '784e1563-f047-424d-bb7f-ce8b6b391b36', 4, 'Ganapathy B', 'Technoverse', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '78362985-33ae-4755-bea2-da398a90b2c5', 'ORION-S0250', 'ADAM', 'adam', 'Archana R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ARCHANAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '78362985-33ae-4755-bea2-da398a90b2c5', 'VERIFIED-ORION-S0250', 'Archana R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '78362985-33ae-4755-bea2-da398a90b2c5', 1, 'Dhanush Krishna sp', 'ADAM', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '78362985-33ae-4755-bea2-da398a90b2c5', 2, 'mega varsan VE', 'ADAM', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '78362985-33ae-4755-bea2-da398a90b2c5', 3, 'Nandhana H B', 'ADAM', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '78362985-33ae-4755-bea2-da398a90b2c5', 4, 'Atchaya B', 'ADAM', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '78362985-33ae-4755-bea2-da398a90b2c5', 5, 'Jonish Antony A', 'ADAM', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ca286de0-f11c-4792-bc8c-b2f9f573ef50', 'ORION-S0251', 'Tech Morphers', 'techmorphers', 'Naveen Kumar R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'NAVEENKUMARR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ca286de0-f11c-4792-bc8c-b2f9f573ef50', 'VERIFIED-ORION-S0251', 'Naveen Kumar R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ca286de0-f11c-4792-bc8c-b2f9f573ef50', 1, 'Sruthi V', 'Tech Morphers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ca286de0-f11c-4792-bc8c-b2f9f573ef50', 2, 'Thakshinya B', 'Tech Morphers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ca286de0-f11c-4792-bc8c-b2f9f573ef50', 3, 'Dharaniga K', 'Tech Morphers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ca286de0-f11c-4792-bc8c-b2f9f573ef50', 4, 'Moses Shaam M J', 'Tech Morphers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ca286de0-f11c-4792-bc8c-b2f9f573ef50', 5, 'Shrivatsan M', 'Tech Morphers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'e74e71c0-8494-4979-b898-e5fd940e57d0', 'ORION-S0252', 'Ecospectra', 'ecospectra', 'Sri Balaji S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SRIBALAJIS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'e74e71c0-8494-4979-b898-e5fd940e57d0', 'VERIFIED-ORION-S0252', 'Sri Balaji S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e74e71c0-8494-4979-b898-e5fd940e57d0', 1, 'Alfin Isaac', 'Ecospectra', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e74e71c0-8494-4979-b898-e5fd940e57d0', 2, 'Guru Priyan', 'Ecospectra', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e74e71c0-8494-4979-b898-e5fd940e57d0', 3, 'Shri Veeran', 'Ecospectra', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c96201b8-0106-4624-957b-eb0b71514ff7', 'ORION-S0253', 'Alpha coders', 'alphacoders', 'Mohammed abdul muqeet ahmed', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MOHAMMEDABDULMUQEETAHMED',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c96201b8-0106-4624-957b-eb0b71514ff7', 'VERIFIED-ORION-S0253', 'Mohammed abdul muqeet ahmed', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c96201b8-0106-4624-957b-eb0b71514ff7', 1, 'Sanjay S', 'Alpha coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c96201b8-0106-4624-957b-eb0b71514ff7', 2, 'SHEIK ABDULLAH.N', 'Alpha coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c96201b8-0106-4624-957b-eb0b71514ff7', 3, 'Andrey fredrick', 'Alpha coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c96201b8-0106-4624-957b-eb0b71514ff7', 4, 'rohit srirajan', 'Alpha coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c96201b8-0106-4624-957b-eb0b71514ff7', 5, 'Joseph snowin S', 'Alpha coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b4c382fe-deaf-4ed7-a12b-4aeecd0a60e8', 'ORION-S0255', 'WHITE DOTS', 'whitedots', 'Harrish T', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'HARRISHT',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b4c382fe-deaf-4ed7-a12b-4aeecd0a60e8', 'VERIFIED-ORION-S0255', 'Harrish T', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b4c382fe-deaf-4ed7-a12b-4aeecd0a60e8', 1, 'K N ASWIN', 'WHITE DOTS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b4c382fe-deaf-4ed7-a12b-4aeecd0a60e8', 2, 'Barathraj P H', 'WHITE DOTS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '7e198b65-f4c6-4c27-893a-ffd86af3721b', 'ORION-S0256', 'Dual Core', 'dualcore', 'Mohammed Ashiq', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MOHAMMEDASHIQ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '7e198b65-f4c6-4c27-893a-ffd86af3721b', 'VERIFIED-ORION-S0256', 'Mohammed Ashiq', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7e198b65-f4c6-4c27-893a-ffd86af3721b', 1, 'Subashini', 'Dual Core', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'fc24b27d-a1fd-4c46-83ae-6f2fc1279939', 'ORION-S0257', 'Apex Heroes', 'apexheroes', 'Abinav Sreenivas M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ABINAVSREENIVASM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'fc24b27d-a1fd-4c46-83ae-6f2fc1279939', 'VERIFIED-ORION-S0257', 'Abinav Sreenivas M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fc24b27d-a1fd-4c46-83ae-6f2fc1279939', 1, 'Ashwin Joe R', 'Apex Heroes', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fc24b27d-a1fd-4c46-83ae-6f2fc1279939', 2, 'Siranjeevikaruppaiyan P', 'Apex Heroes', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fc24b27d-a1fd-4c46-83ae-6f2fc1279939', 3, 'Divagar S', 'Apex Heroes', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fc24b27d-a1fd-4c46-83ae-6f2fc1279939', 4, 'Balaji V', 'Apex Heroes', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fc24b27d-a1fd-4c46-83ae-6f2fc1279939', 5, 'Vishnu P', 'Apex Heroes', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c71fb1a1-a46a-4789-8642-58bd0b2b14d9', 'ORION-S0258', 'Crack Dots', 'crackdots', 'aswin kumaragurubaran', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ASWINKUMARAGURUBARAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c71fb1a1-a46a-4789-8642-58bd0b2b14d9', 'VERIFIED-ORION-S0258', 'aswin kumaragurubaran', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c71fb1a1-a46a-4789-8642-58bd0b2b14d9', 1, 'Elamaran A', 'Crack Dots', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c71fb1a1-a46a-4789-8642-58bd0b2b14d9', 2, 'Jagadeeshwaran S', 'Crack Dots', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f002a32b-91bc-4f41-b981-f1d116cdf947', 'ORION-S0259', 'Obscura', 'obscura', 'BHUVAN BHANDARI B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'BHUVANBHANDARIB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f002a32b-91bc-4f41-b981-f1d116cdf947', 'VERIFIED-ORION-S0259', 'BHUVAN BHANDARI B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f002a32b-91bc-4f41-b981-f1d116cdf947', 1, 'DHANUSHRI A', 'Obscura', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f002a32b-91bc-4f41-b981-f1d116cdf947', 2, 'ASHIF HUSSAIN M', 'Obscura', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f002a32b-91bc-4f41-b981-f1d116cdf947', 3, 'JEEVA KUMAAR S', 'Obscura', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f002a32b-91bc-4f41-b981-f1d116cdf947', 4, 'ANUSH R', 'Obscura', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0e3b93b6-c3b6-4d04-8245-eb82ce84db04', 'ORION-S0260', 'Infinix', 'infinix', 'S Neha', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SNEHA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0e3b93b6-c3b6-4d04-8245-eb82ce84db04', 'VERIFIED-ORION-S0260', 'S Neha', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0e3b93b6-c3b6-4d04-8245-eb82ce84db04', 1, 'Ritika S', 'Infinix', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0e3b93b6-c3b6-4d04-8245-eb82ce84db04', 2, 'Sugantha G', 'Infinix', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0e3b93b6-c3b6-4d04-8245-eb82ce84db04', 3, 'Syed Israr Ahmed G', 'Infinix', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0e3b93b6-c3b6-4d04-8245-eb82ce84db04', 4, 'Kishore P', 'Infinix', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0e3b93b6-c3b6-4d04-8245-eb82ce84db04', 5, 'C M Sharvesh', 'Infinix', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '2eb3720e-164a-4719-9f1e-54c1b94ebb47', 'ORION-S0261', 'Codex', 'codex', 'Sahana M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SAHANAM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '2eb3720e-164a-4719-9f1e-54c1b94ebb47', 'VERIFIED-ORION-S0261', 'Sahana M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2eb3720e-164a-4719-9f1e-54c1b94ebb47', 1, 'Tarifa Fathima', 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2eb3720e-164a-4719-9f1e-54c1b94ebb47', 2, 'Swetha M', 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2eb3720e-164a-4719-9f1e-54c1b94ebb47', 3, 'Tanushree R', 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2eb3720e-164a-4719-9f1e-54c1b94ebb47', 4, 'Lakshmi K V', 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2eb3720e-164a-4719-9f1e-54c1b94ebb47', 5, 'Yadhana A', 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5c001794-c75f-4dcf-a872-0b3a02904a25', 'ORION-S0262', 'Quantum Coders', 'quantumcoders', 'Kishore B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'KISHOREB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5c001794-c75f-4dcf-a872-0b3a02904a25', 'VERIFIED-ORION-S0262', 'Kishore B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5c001794-c75f-4dcf-a872-0b3a02904a25', 1, 'Tarunika V', 'Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5c001794-c75f-4dcf-a872-0b3a02904a25', 2, 'Vasanth R', 'Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5c001794-c75f-4dcf-a872-0b3a02904a25', 3, 'Gokul Raj K', 'Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5c001794-c75f-4dcf-a872-0b3a02904a25', 4, 'Kameesvar N', 'Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5c001794-c75f-4dcf-a872-0b3a02904a25', 5, 'Saravanan S', 'Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f1279031-eb89-4e82-a6a9-806ee87be988', 'ORION-S0263', 'QuadraX', 'quadrax', 'Aditya Krishnan A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ADITYAKRISHNANA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f1279031-eb89-4e82-a6a9-806ee87be988', 'VERIFIED-ORION-S0263', 'Aditya Krishnan A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f1279031-eb89-4e82-a6a9-806ee87be988', 1, 'VENKATESH R.P', 'QuadraX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f1279031-eb89-4e82-a6a9-806ee87be988', 2, 'JASIM FAREES J', 'QuadraX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f1279031-eb89-4e82-a6a9-806ee87be988', 3, 'DHIVESH A', 'QuadraX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '859e9505-18e1-4481-8617-9205365ac27d', 'ORION-S0264', 'ERROR404', 'error404', 'Sanjay.C', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SANJAYC',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '859e9505-18e1-4481-8617-9205365ac27d', 'VERIFIED-ORION-S0264', 'Sanjay.C', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '859e9505-18e1-4481-8617-9205365ac27d', 1, 'Satyajith.M', 'ERROR404', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '859e9505-18e1-4481-8617-9205365ac27d', 2, 'Sanjay Udayashankar', 'ERROR404', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '859e9505-18e1-4481-8617-9205365ac27d', 3, 'Sarika.R', 'ERROR404', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'cd7ffe16-b6fc-4eb0-ac2d-07f2391410ba', 'ORION-S0265', 'THE DECODERS', 'thedecoders', 'SAI HARISH M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SAIHARISHM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'cd7ffe16-b6fc-4eb0-ac2d-07f2391410ba', 'VERIFIED-ORION-S0265', 'SAI HARISH M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cd7ffe16-b6fc-4eb0-ac2d-07f2391410ba', 1, 'SAI NIRMAL N', 'THE DECODERS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cd7ffe16-b6fc-4eb0-ac2d-07f2391410ba', 2, 'SHAILESH P S', 'THE DECODERS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cd7ffe16-b6fc-4eb0-ac2d-07f2391410ba', 3, 'PRASANTTH SAI G', 'THE DECODERS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '85bcef23-ca9e-4633-a95d-60dcfb90b6d1', 'ORION-S0266', 'WHITE DEVILS', 'whitedevils', 'S.KAILASHWAR', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SKAILASHWAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '85bcef23-ca9e-4633-a95d-60dcfb90b6d1', 'VERIFIED-ORION-S0266', 'S.KAILASHWAR', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '85bcef23-ca9e-4633-a95d-60dcfb90b6d1', 1, 'PRABIN PS', 'WHITE DEVILS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '85bcef23-ca9e-4633-a95d-60dcfb90b6d1', 2, 'DEEPIKA K', 'WHITE DEVILS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '85bcef23-ca9e-4633-a95d-60dcfb90b6d1', 3, 'DEWANSH SINGH', 'WHITE DEVILS', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'eefb7ade-9e24-439b-b88d-71f0462a125c', 'ORION-S0267', 'CODEX', 'codex', 'SAM GODWIN A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'SAMGODWINA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'eefb7ade-9e24-439b-b88d-71f0462a125c', 'VERIFIED-ORION-S0267', 'SAM GODWIN A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eefb7ade-9e24-439b-b88d-71f0462a125c', 1, 'Jeffrin Lino Shalom', 'CODEX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eefb7ade-9e24-439b-b88d-71f0462a125c', 2, 'PARVESH R', 'CODEX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eefb7ade-9e24-439b-b88d-71f0462a125c', 3, 'CHINTANASRI R', 'CODEX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eefb7ade-9e24-439b-b88d-71f0462a125c', 4, 'GOKULPATHY L', 'CODEX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eefb7ade-9e24-439b-b88d-71f0462a125c', 5, 'MATHIYAZHAGI S', 'CODEX', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '93b6145e-d7a1-42fb-a216-f36f31cdd5cb', 'ORION-S0268', 'Inglourious Hackers', 'inglourioushackers', 'CHUKISIVAM VS', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'CHUKISIVAMVS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '93b6145e-d7a1-42fb-a216-f36f31cdd5cb', 'VERIFIED-ORION-S0268', 'CHUKISIVAM VS', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '93b6145e-d7a1-42fb-a216-f36f31cdd5cb', 1, 'Sivasanjay M', 'Inglourious Hackers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '93b6145e-d7a1-42fb-a216-f36f31cdd5cb', 2, 'Krithika S', 'Inglourious Hackers', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c35b9d6c-2ec2-45dd-ad54-8084938cc2f9', 'ORION-S0269', 'RENTRO', 'rentro', 'P.S.Abinaya', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'PSABINAYA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c35b9d6c-2ec2-45dd-ad54-8084938cc2f9', 'VERIFIED-ORION-S0269', 'P.S.Abinaya', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c35b9d6c-2ec2-45dd-ad54-8084938cc2f9', 1, 'VARSHA P J', 'RENTRO', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c35b9d6c-2ec2-45dd-ad54-8084938cc2f9', 2, 'MADHUMITHA S', 'RENTRO', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c35b9d6c-2ec2-45dd-ad54-8084938cc2f9', 3, 'LAKSHITHA S', 'RENTRO', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c35b9d6c-2ec2-45dd-ad54-8084938cc2f9', 4, 'R.HARINE', 'RENTRO', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c35b9d6c-2ec2-45dd-ad54-8084938cc2f9', 5, 'B.Divya', 'RENTRO', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '25c3ce42-3e3d-4bf8-a8e4-ef58ef55e2be', 'ORION-S0270', 'BRAINROT', 'brainrot', 'Gokila kumara chandru S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'GOKILAKUMARACHANDRUS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '25c3ce42-3e3d-4bf8-a8e4-ef58ef55e2be', 'VERIFIED-ORION-S0270', 'Gokila kumara chandru S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '25c3ce42-3e3d-4bf8-a8e4-ef58ef55e2be', 1, 'Aswin Sharma .S', 'BRAINROT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '25c3ce42-3e3d-4bf8-a8e4-ef58ef55e2be', 2, 'Amruth S', 'BRAINROT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '25c3ce42-3e3d-4bf8-a8e4-ef58ef55e2be', 3, 'BEO SJ PRAKASH', 'BRAINROT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '25c3ce42-3e3d-4bf8-a8e4-ef58ef55e2be', 4, 'Sri Prithviraj RB', 'BRAINROT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '25c3ce42-3e3d-4bf8-a8e4-ef58ef55e2be', 5, 'Sharathi A', 'BRAINROT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ffda21ef-f7b5-4a00-94c0-8a05601d3887', 'ORION-S0271', 'Team apex', 'teamapex', 'Mani Govindan S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'MANIGOVINDANS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ffda21ef-f7b5-4a00-94c0-8a05601d3887', 'VERIFIED-ORION-S0271', 'Mani Govindan S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ffda21ef-f7b5-4a00-94c0-8a05601d3887', 1, 'Sirajan. A', 'Team apex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ffda21ef-f7b5-4a00-94c0-8a05601d3887', 2, 'M. Sakthibalan', 'Team apex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ffda21ef-f7b5-4a00-94c0-8a05601d3887', 3, 'RAJAGUGAN C', 'Team apex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ffda21ef-f7b5-4a00-94c0-8a05601d3887', 4, 'Karthigeyan. R', 'Team apex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '26cf0e70-ed02-419e-910a-f262a3f9c4c6', 'ORION-S0272', 'Syntax', 'syntax', 'Rakshitha Pearlin.F', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'RAKSHITHAPEARLINF',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '26cf0e70-ed02-419e-910a-f262a3f9c4c6', 'VERIFIED-ORION-S0272', 'Rakshitha Pearlin.F', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '26cf0e70-ed02-419e-910a-f262a3f9c4c6', 1, 'Narendra Naidu', 'Syntax', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '26cf0e70-ed02-419e-910a-f262a3f9c4c6', 2, 'Laranya', 'Syntax', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8782f44d-9f78-449b-8e43-256b72f80e5e', 'ORION-S0273', 'Rocks', 'rocks', 'Athi Narayanan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'ATHINARAYANAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8782f44d-9f78-449b-8e43-256b72f80e5e', 'VERIFIED-ORION-S0273', 'Athi Narayanan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8782f44d-9f78-449b-8e43-256b72f80e5e', 1, 'Vimal Varshit V', 'Rocks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8782f44d-9f78-449b-8e43-256b72f80e5e', 2, 'Sanjay B', 'Rocks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8782f44d-9f78-449b-8e43-256b72f80e5e', 3, 'Mukkeshnarayan JR', 'Rocks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8782f44d-9f78-449b-8e43-256b72f80e5e', 4, 'Arulraj sekhar d', 'Rocks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8782f44d-9f78-449b-8e43-256b72f80e5e', 5, 'Ameer K', 'Rocks', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0ff7f0eb-2d09-4420-b93a-ae97f09d4388', 'ORION-S0274', 'Undefined Behaviour', 'undefinedbehaviour', '312425148034 MISHALI B S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', '312425148034MISHALIBS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0ff7f0eb-2d09-4420-b93a-ae97f09d4388', 'VERIFIED-ORION-S0274', '312425148034 MISHALI B S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ff7f0eb-2d09-4420-b93a-ae97f09d4388', 1, 'Sharvesh S', 'Undefined Behaviour', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ff7f0eb-2d09-4420-b93a-ae97f09d4388', 2, 'Nilofar Banu S', 'Undefined Behaviour', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ff7f0eb-2d09-4420-b93a-ae97f09d4388', 3, 'Arikarthikessan S', 'Undefined Behaviour', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ff7f0eb-2d09-4420-b93a-ae97f09d4388', 4, 'Kishorr Manickam B', 'Undefined Behaviour', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '87164892-2f20-4665-b8fc-f7eaf0777470', 'ORION-S0275', 'BOULT', 'boult', 'YUVARAJ S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'YUVARAJS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '87164892-2f20-4665-b8fc-f7eaf0777470', 'VERIFIED-ORION-S0275', 'YUVARAJ S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '87164892-2f20-4665-b8fc-f7eaf0777470', 1, 'VIJAYABALAJI D', 'BOULT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '87164892-2f20-4665-b8fc-f7eaf0777470', 2, 'GNANDEEP P', 'BOULT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '87164892-2f20-4665-b8fc-f7eaf0777470', 3, 'THIRUKUMARAN V', 'BOULT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '87164892-2f20-4665-b8fc-f7eaf0777470', 4, 'VISHAL R', 'BOULT', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5bde2871-f2f5-4db9-b26e-2bb57506e7bb', 'ORION-S0276', 'NeuroNex', 'neuronex', 'Teja Sri M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01', 'TEJASRIM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5bde2871-f2f5-4db9-b26e-2bb57506e7bb', 'VERIFIED-ORION-S0276', 'Teja Sri M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T04:58:26.136Z', '2026-09-08T04:58:26.136Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5bde2871-f2f5-4db9-b26e-2bb57506e7bb', 1, 'Sakthivel A', 'NeuroNex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5bde2871-f2f5-4db9-b26e-2bb57506e7bb', 2, 'Saraboji S', 'NeuroNex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5bde2871-f2f5-4db9-b26e-2bb57506e7bb', 3, 'Sowmiya M', 'NeuroNex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5bde2871-f2f5-4db9-b26e-2bb57506e7bb', 4, 'Supriya D', 'NeuroNex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5bde2871-f2f5-4db9-b26e-2bb57506e7bb', 5, 'Sanjay S', 'NeuroNex', '', '', 'Engineering', 'Student', '2026-09-08T04:58:26.136Z'
);

commit;
