-- ==============================================================================
-- 019 — Official Updated Verified Roster Import (267 Squads)
-- ==============================================================================
-- 
-- Purges old entries and imports the 267 official squads with assigned Problem Statements.
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

-- 2. Insert all 267 squads

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'a03c442c-f5c3-4774-a645-ca6592105437', 'ORION-S0001', 'Innovex', 'innovex', 'Yasaswini Chilukuri', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track (Artificial Intelligence & Machine Learning)', 'YASASWINICHILUKURI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'a03c442c-f5c3-4774-a645-ca6592105437', 'VERIFIED-ORION-S0001', 'Yasaswini Chilukuri', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a03c442c-f5c3-4774-a645-ca6592105437', 1, null, 'Innovex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a03c442c-f5c3-4774-a645-ca6592105437', 2, null, 'Innovex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '3ea7709a-fa2f-4eb2-9442-943de1a9a0d9', 'ORION-S0002', 'GirlsGotByte', 'girlsgotbyte', 'S Darshini Jeya Shakthi', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SDARSHINIJEYASHAKTHI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '3ea7709a-fa2f-4eb2-9442-943de1a9a0d9', 'VERIFIED-ORION-S0002', 'S Darshini Jeya Shakthi', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3ea7709a-fa2f-4eb2-9442-943de1a9a0d9', 1, null, 'GirlsGotByte', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3ea7709a-fa2f-4eb2-9442-943de1a9a0d9', 2, null, 'GirlsGotByte', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3ea7709a-fa2f-4eb2-9442-943de1a9a0d9', 3, null, 'GirlsGotByte', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'e12ce0fe-7049-40f9-afda-00ba7fab15c9', 'ORION-S0003', 'Safegrid', 'safegrid', 'Moses Sparjen K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'MOSESSPARJENK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'e12ce0fe-7049-40f9-afda-00ba7fab15c9', 'VERIFIED-ORION-S0003', 'Moses Sparjen K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e12ce0fe-7049-40f9-afda-00ba7fab15c9', 1, null, 'Safegrid', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e12ce0fe-7049-40f9-afda-00ba7fab15c9', 2, null, 'Safegrid', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e12ce0fe-7049-40f9-afda-00ba7fab15c9', 3, null, 'Safegrid', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e12ce0fe-7049-40f9-afda-00ba7fab15c9', 4, null, 'Safegrid', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e12ce0fe-7049-40f9-afda-00ba7fab15c9', 5, null, 'Safegrid', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0b4b0fe2-6fa2-4cc7-b65e-7cb5f0b336b9', 'ORION-S0004', 'TechXKuzhu', 'techxkuzhu', 'Thanishka Yogesh', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track (FinTech)', 'THANISHKAYOGESH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0b4b0fe2-6fa2-4cc7-b65e-7cb5f0b336b9', 'VERIFIED-ORION-S0004', 'Thanishka Yogesh', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0b4b0fe2-6fa2-4cc7-b65e-7cb5f0b336b9', 1, null, 'TechXKuzhu', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0b4b0fe2-6fa2-4cc7-b65e-7cb5f0b336b9', 2, null, 'TechXKuzhu', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0b4b0fe2-6fa2-4cc7-b65e-7cb5f0b336b9', 3, null, 'TechXKuzhu', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0b4b0fe2-6fa2-4cc7-b65e-7cb5f0b336b9', 4, null, 'TechXKuzhu', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0b4b0fe2-6fa2-4cc7-b65e-7cb5f0b336b9', 5, null, 'TechXKuzhu', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '1e503683-4dfe-4d9b-9f94-31416bb15bcb', 'ORION-S0006', 'Neuro Forge', 'neuroforge', 'Sarveshwar V A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track (Sustainability / ClimateTech)', 'SARVESHWARVA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '1e503683-4dfe-4d9b-9f94-31416bb15bcb', 'VERIFIED-ORION-S0006', 'Sarveshwar V A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1e503683-4dfe-4d9b-9f94-31416bb15bcb', 1, null, 'Neuro Forge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1e503683-4dfe-4d9b-9f94-31416bb15bcb', 2, null, 'Neuro Forge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1e503683-4dfe-4d9b-9f94-31416bb15bcb', 3, null, 'Neuro Forge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1e503683-4dfe-4d9b-9f94-31416bb15bcb', 4, null, 'Neuro Forge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1e503683-4dfe-4d9b-9f94-31416bb15bcb', 5, null, 'Neuro Forge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5785d577-f02c-4b8e-8b1b-52569c84656e', 'ORION-S0007', 'HEXAFLUX', 'hexaflux', 'Sakthi lakshmi G', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SAKTHILAKSHMIG',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5785d577-f02c-4b8e-8b1b-52569c84656e', 'VERIFIED-ORION-S0007', 'Sakthi lakshmi G', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5785d577-f02c-4b8e-8b1b-52569c84656e', 1, null, 'HEXAFLUX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5785d577-f02c-4b8e-8b1b-52569c84656e', 2, null, 'HEXAFLUX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5785d577-f02c-4b8e-8b1b-52569c84656e', 3, null, 'HEXAFLUX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5785d577-f02c-4b8e-8b1b-52569c84656e', 4, null, 'HEXAFLUX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5785d577-f02c-4b8e-8b1b-52569c84656e', 5, null, 'HEXAFLUX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'a2565a17-a232-4f4e-b290-eab2971ca42d', 'ORION-S0008', 'Deadline Dodgers', 'deadlinedodgers', 'E Gogulnath', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track (Web / Mobile Development)', 'EGOGULNATH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'a2565a17-a232-4f4e-b290-eab2971ca42d', 'VERIFIED-ORION-S0008', 'E Gogulnath', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a2565a17-a232-4f4e-b290-eab2971ca42d', 1, null, 'Deadline Dodgers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a2565a17-a232-4f4e-b290-eab2971ca42d', 2, null, 'Deadline Dodgers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a2565a17-a232-4f4e-b290-eab2971ca42d', 3, null, 'Deadline Dodgers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a2565a17-a232-4f4e-b290-eab2971ca42d', 4, null, 'Deadline Dodgers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '6a961d64-d214-49c9-bc89-c450f399c18c', 'ORION-S0009', 'CodeNova', 'codenova', 'Aditya P S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'ADITYAPS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '6a961d64-d214-49c9-bc89-c450f399c18c', 'VERIFIED-ORION-S0009', 'Aditya P S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6a961d64-d214-49c9-bc89-c450f399c18c', 1, null, 'CodeNova', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6a961d64-d214-49c9-bc89-c450f399c18c', 2, null, 'CodeNova', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6a961d64-d214-49c9-bc89-c450f399c18c', 3, null, 'CodeNova', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6a961d64-d214-49c9-bc89-c450f399c18c', 4, null, 'CodeNova', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6a961d64-d214-49c9-bc89-c450f399c18c', 5, null, 'CodeNova', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '2dbbcb4a-a4a3-48fc-8339-51c588eb5d77', 'ORION-S0010', 'LOGIC LORDS', 'logiclords', 'JERIN N', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track (Sustainability / ClimateTech)', 'JERINN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '2dbbcb4a-a4a3-48fc-8339-51c588eb5d77', 'VERIFIED-ORION-S0010', 'JERIN N', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2dbbcb4a-a4a3-48fc-8339-51c588eb5d77', 1, null, 'LOGIC LORDS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2dbbcb4a-a4a3-48fc-8339-51c588eb5d77', 2, null, 'LOGIC LORDS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2dbbcb4a-a4a3-48fc-8339-51c588eb5d77', 3, null, 'LOGIC LORDS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2dbbcb4a-a4a3-48fc-8339-51c588eb5d77', 4, null, 'LOGIC LORDS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '27d429b0-4eee-4f31-be3d-a5aa43e84d22', 'ORION-S0012', 'Nexyra', 'nexyra', 'B.ARVIND', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'BARVIND',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '27d429b0-4eee-4f31-be3d-a5aa43e84d22', 'VERIFIED-ORION-S0012', 'B.ARVIND', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '27d429b0-4eee-4f31-be3d-a5aa43e84d22', 1, null, 'Nexyra', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '27d429b0-4eee-4f31-be3d-a5aa43e84d22', 2, null, 'Nexyra', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '27d429b0-4eee-4f31-be3d-a5aa43e84d22', 3, null, 'Nexyra', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '297c95a2-5c02-4739-9011-9601331adca7', 'ORION-S0013', 'ARC', 'arc', 'Yuvaraj K L', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'YUVARAJKL',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '297c95a2-5c02-4739-9011-9601331adca7', 'VERIFIED-ORION-S0013', 'Yuvaraj K L', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '297c95a2-5c02-4739-9011-9601331adca7', 1, null, 'ARC', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '297c95a2-5c02-4739-9011-9601331adca7', 2, null, 'ARC', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '297c95a2-5c02-4739-9011-9601331adca7', 3, null, 'ARC', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '297c95a2-5c02-4739-9011-9601331adca7', 4, null, 'ARC', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '73354dcb-0e12-48bc-9496-319d220f8c62', 'ORION-S0014', 'Tech Larper', 'techlarper', 'Farnas.B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'FARNASB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '73354dcb-0e12-48bc-9496-319d220f8c62', 'VERIFIED-ORION-S0014', 'Farnas.B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '73354dcb-0e12-48bc-9496-319d220f8c62', 1, null, 'Tech Larper', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '73354dcb-0e12-48bc-9496-319d220f8c62', 2, null, 'Tech Larper', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'a1ee472e-f923-4401-b3ab-a00ae7a48eab', 'ORION-S0015', 'Adengappa naalu peru', 'adengappanaaluperu', 'N.Sham Venkat', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'NSHAMVENKAT',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'a1ee472e-f923-4401-b3ab-a00ae7a48eab', 'VERIFIED-ORION-S0015', 'N.Sham Venkat', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a1ee472e-f923-4401-b3ab-a00ae7a48eab', 1, null, 'Adengappa naalu peru', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a1ee472e-f923-4401-b3ab-a00ae7a48eab', 2, null, 'Adengappa naalu peru', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a1ee472e-f923-4401-b3ab-a00ae7a48eab', 3, null, 'Adengappa naalu peru', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f84ba74e-c813-4ace-b063-6dfa3e99a2d4', 'ORION-S0017', 'SOLEX', 'solex', 'Suryaprakash S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SURYAPRAKASHS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f84ba74e-c813-4ace-b063-6dfa3e99a2d4', 'VERIFIED-ORION-S0017', 'Suryaprakash S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f84ba74e-c813-4ace-b063-6dfa3e99a2d4', 1, null, 'SOLEX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f84ba74e-c813-4ace-b063-6dfa3e99a2d4', 2, null, 'SOLEX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f84ba74e-c813-4ace-b063-6dfa3e99a2d4', 3, null, 'SOLEX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f84ba74e-c813-4ace-b063-6dfa3e99a2d4', 4, null, 'SOLEX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '462f844c-864b-49b2-bdc8-e374c075f393', 'ORION-S0018', 'Travixa', 'travixa', 'Lovinsha', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'LOVINSHA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '462f844c-864b-49b2-bdc8-e374c075f393', 'VERIFIED-ORION-S0018', 'Lovinsha', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '462f844c-864b-49b2-bdc8-e374c075f393', 1, null, 'Travixa', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '462f844c-864b-49b2-bdc8-e374c075f393', 2, null, 'Travixa', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '462f844c-864b-49b2-bdc8-e374c075f393', 3, null, 'Travixa', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd39c8a59-f000-44f3-b6de-9cd3f13d8beb', 'ORION-S0019', 'Team Verse', 'teamverse', 'Naveenkumar P', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'NAVEENKUMARP',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd39c8a59-f000-44f3-b6de-9cd3f13d8beb', 'VERIFIED-ORION-S0019', 'Naveenkumar P', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd39c8a59-f000-44f3-b6de-9cd3f13d8beb', 1, null, 'Team Verse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd39c8a59-f000-44f3-b6de-9cd3f13d8beb', 2, null, 'Team Verse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd39c8a59-f000-44f3-b6de-9cd3f13d8beb', 3, null, 'Team Verse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd39c8a59-f000-44f3-b6de-9cd3f13d8beb', 4, null, 'Team Verse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '33b505a1-1793-4336-a30f-b32306be56ab', 'ORION-S0020', 'Tech titans', 'techtitans', 'Deekshith. P', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'DEEKSHITHP',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '33b505a1-1793-4336-a30f-b32306be56ab', 'VERIFIED-ORION-S0020', 'Deekshith. P', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '33b505a1-1793-4336-a30f-b32306be56ab', 1, null, 'Tech titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '33b505a1-1793-4336-a30f-b32306be56ab', 2, null, 'Tech titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '33b505a1-1793-4336-a30f-b32306be56ab', 3, null, 'Tech titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '33b505a1-1793-4336-a30f-b32306be56ab', 4, null, 'Tech titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '33b505a1-1793-4336-a30f-b32306be56ab', 5, null, 'Tech titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '502fb8c8-9488-4842-8cc1-b66ec749892f', 'ORION-S0021', 'QRYVEXA', 'qryvexa', 'SENTHAMIZH SELVAN.V', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'SENTHAMIZHSELVANV',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '502fb8c8-9488-4842-8cc1-b66ec749892f', 'VERIFIED-ORION-S0021', 'SENTHAMIZH SELVAN.V', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '502fb8c8-9488-4842-8cc1-b66ec749892f', 1, null, 'QRYVEXA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '502fb8c8-9488-4842-8cc1-b66ec749892f', 2, null, 'QRYVEXA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '052e70b7-df77-4e43-8d84-7313a52dbfb3', 'ORION-S0022', 'Hackademics', 'hackademics', 'Akshay Kumar N', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'AKSHAYKUMARN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '052e70b7-df77-4e43-8d84-7313a52dbfb3', 'VERIFIED-ORION-S0022', 'Akshay Kumar N', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '052e70b7-df77-4e43-8d84-7313a52dbfb3', 1, null, 'Hackademics', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '052e70b7-df77-4e43-8d84-7313a52dbfb3', 2, null, 'Hackademics', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '052e70b7-df77-4e43-8d84-7313a52dbfb3', 3, null, 'Hackademics', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '052e70b7-df77-4e43-8d84-7313a52dbfb3', 4, null, 'Hackademics', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '052e70b7-df77-4e43-8d84-7313a52dbfb3', 5, null, 'Hackademics', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd31260b0-50ac-4780-86c3-16f0d1d94952', 'ORION-S0024', 'ByteForge', 'byteforge', 'Chandini Sundaran', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'CHANDINISUNDARAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd31260b0-50ac-4780-86c3-16f0d1d94952', 'VERIFIED-ORION-S0024', 'Chandini Sundaran', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd31260b0-50ac-4780-86c3-16f0d1d94952', 1, null, 'ByteForge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'e47bb6d0-7a2a-4dec-87fb-049b694a47f1', 'ORION-S0025', 'REPLICANTS', 'replicants', 'Shirish Babu N', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SHIRISHBABUN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'e47bb6d0-7a2a-4dec-87fb-049b694a47f1', 'VERIFIED-ORION-S0025', 'Shirish Babu N', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e47bb6d0-7a2a-4dec-87fb-049b694a47f1', 1, null, 'REPLICANTS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e47bb6d0-7a2a-4dec-87fb-049b694a47f1', 2, null, 'REPLICANTS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e47bb6d0-7a2a-4dec-87fb-049b694a47f1', 3, null, 'REPLICANTS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e47bb6d0-7a2a-4dec-87fb-049b694a47f1', 4, null, 'REPLICANTS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '44b0e2d2-4e15-4af1-9774-ccd30ad3ef58', 'ORION-S0027', 'CYPHERFORGE', 'cypherforge', 'Arunadevi.S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'ARUNADEVIS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '44b0e2d2-4e15-4af1-9774-ccd30ad3ef58', 'VERIFIED-ORION-S0027', 'Arunadevi.S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '44b0e2d2-4e15-4af1-9774-ccd30ad3ef58', 1, null, 'CYPHERFORGE', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '44b0e2d2-4e15-4af1-9774-ccd30ad3ef58', 2, null, 'CYPHERFORGE', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '44b0e2d2-4e15-4af1-9774-ccd30ad3ef58', 3, null, 'CYPHERFORGE', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '44b0e2d2-4e15-4af1-9774-ccd30ad3ef58', 4, null, 'CYPHERFORGE', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '44b0e2d2-4e15-4af1-9774-ccd30ad3ef58', 5, null, 'CYPHERFORGE', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5b1ad803-bc53-4f78-a1c1-88061e29a616', 'ORION-S0028', 'Hacker Men', 'hackermen', 'BHARANIDHARAN S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'BHARANIDHARANS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5b1ad803-bc53-4f78-a1c1-88061e29a616', 'VERIFIED-ORION-S0028', 'BHARANIDHARAN S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5b1ad803-bc53-4f78-a1c1-88061e29a616', 1, null, 'Hacker Men', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5b1ad803-bc53-4f78-a1c1-88061e29a616', 2, null, 'Hacker Men', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5b1ad803-bc53-4f78-a1c1-88061e29a616', 3, null, 'Hacker Men', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5b1ad803-bc53-4f78-a1c1-88061e29a616', 4, null, 'Hacker Men', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5b1ad803-bc53-4f78-a1c1-88061e29a616', 5, null, 'Hacker Men', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '84f9b369-60d7-4113-a8d8-ae89524d009b', 'ORION-S0029', 'adhiradi boys', 'adhiradiboys', 'Pushparaj J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'PUSHPARAJJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '84f9b369-60d7-4113-a8d8-ae89524d009b', 'VERIFIED-ORION-S0029', 'Pushparaj J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '84f9b369-60d7-4113-a8d8-ae89524d009b', 1, null, 'adhiradi boys', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '84f9b369-60d7-4113-a8d8-ae89524d009b', 2, null, 'adhiradi boys', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '84f9b369-60d7-4113-a8d8-ae89524d009b', 3, null, 'adhiradi boys', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'db6bbab9-b789-418f-a6bd-f946dddc699c', 'ORION-S0030', 'Error 404', 'error404', 'S.Sai Dolasa', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SSAIDOLASA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'db6bbab9-b789-418f-a6bd-f946dddc699c', 'VERIFIED-ORION-S0030', 'S.Sai Dolasa', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'db6bbab9-b789-418f-a6bd-f946dddc699c', 1, null, 'Error 404', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'db6bbab9-b789-418f-a6bd-f946dddc699c', 2, null, 'Error 404', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'db6bbab9-b789-418f-a6bd-f946dddc699c', 3, null, 'Error 404', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '92d7bf9f-fc1e-4320-a7ef-f9f5744dd8c0', 'ORION-S0031', 'Hack hawks', 'hackhawks', 'GOPIKRISHNA S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'GOPIKRISHNAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '92d7bf9f-fc1e-4320-a7ef-f9f5744dd8c0', 'VERIFIED-ORION-S0031', 'GOPIKRISHNA S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '92d7bf9f-fc1e-4320-a7ef-f9f5744dd8c0', 1, null, 'Hack hawks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '92d7bf9f-fc1e-4320-a7ef-f9f5744dd8c0', 2, null, 'Hack hawks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '92d7bf9f-fc1e-4320-a7ef-f9f5744dd8c0', 3, null, 'Hack hawks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '92d7bf9f-fc1e-4320-a7ef-f9f5744dd8c0', 4, null, 'Hack hawks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '67a9418e-de9e-4193-aae2-c69401611638', 'ORION-S0033', 'Code Blooded', 'codeblooded', 'Jahnavi Mogarala', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'JAHNAVIMOGARALA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '67a9418e-de9e-4193-aae2-c69401611638', 'VERIFIED-ORION-S0033', 'Jahnavi Mogarala', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '67a9418e-de9e-4193-aae2-c69401611638', 1, null, 'Code Blooded', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4c77d3e0-16d3-46c1-b656-10641e1475ab', 'ORION-S0034', 'Little ghosts', 'littleghosts', 'Gokul chowdry S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'GOKULCHOWDRYS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4c77d3e0-16d3-46c1-b656-10641e1475ab', 'VERIFIED-ORION-S0034', 'Gokul chowdry S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4c77d3e0-16d3-46c1-b656-10641e1475ab', 1, null, 'Little ghosts', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4c77d3e0-16d3-46c1-b656-10641e1475ab', 2, null, 'Little ghosts', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4c77d3e0-16d3-46c1-b656-10641e1475ab', 3, null, 'Little ghosts', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd488a6f6-d015-49e5-bf5b-8ae840754cc3', 'ORION-S0035', 'Apprentice', 'apprentice', 'Navya M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'NAVYAM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd488a6f6-d015-49e5-bf5b-8ae840754cc3', 'VERIFIED-ORION-S0035', 'Navya M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd488a6f6-d015-49e5-bf5b-8ae840754cc3', 1, null, 'Apprentice', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd488a6f6-d015-49e5-bf5b-8ae840754cc3', 2, null, 'Apprentice', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd488a6f6-d015-49e5-bf5b-8ae840754cc3', 3, null, 'Apprentice', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd488a6f6-d015-49e5-bf5b-8ae840754cc3', 4, null, 'Apprentice', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd488a6f6-d015-49e5-bf5b-8ae840754cc3', 5, null, 'Apprentice', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8a7bf172-6147-40ab-b34c-5d9912c6999f', 'ORION-S0036', 'MindMesh', 'mindmesh', 'Mrityunjay Krithick M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'MRITYUNJAYKRITHICKM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8a7bf172-6147-40ab-b34c-5d9912c6999f', 'VERIFIED-ORION-S0036', 'Mrityunjay Krithick M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8a7bf172-6147-40ab-b34c-5d9912c6999f', 1, null, 'MindMesh', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8a7bf172-6147-40ab-b34c-5d9912c6999f', 2, null, 'MindMesh', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8a7bf172-6147-40ab-b34c-5d9912c6999f', 3, null, 'MindMesh', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8a7bf172-6147-40ab-b34c-5d9912c6999f', 4, null, 'MindMesh', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4af7726f-90c5-4c84-b321-3a3cd20665d1', 'ORION-S0037', 'Bug syndicate', 'bugsyndicate', 'Megesh L', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'MEGESHL',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4af7726f-90c5-4c84-b321-3a3cd20665d1', 'VERIFIED-ORION-S0037', 'Megesh L', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4af7726f-90c5-4c84-b321-3a3cd20665d1', 1, null, 'Bug syndicate', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4af7726f-90c5-4c84-b321-3a3cd20665d1', 2, null, 'Bug syndicate', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4af7726f-90c5-4c84-b321-3a3cd20665d1', 3, null, 'Bug syndicate', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4af7726f-90c5-4c84-b321-3a3cd20665d1', 4, null, 'Bug syndicate', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'bccb9d49-a902-4901-9f98-fc6d5782187b', 'ORION-S0038', '405 decoders', '405decoders', 'Potnuru Prasanth kumar', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'POTNURUPRASANTHKUMAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'bccb9d49-a902-4901-9f98-fc6d5782187b', 'VERIFIED-ORION-S0038', 'Potnuru Prasanth kumar', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bccb9d49-a902-4901-9f98-fc6d5782187b', 1, null, '405 decoders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bccb9d49-a902-4901-9f98-fc6d5782187b', 2, null, '405 decoders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bccb9d49-a902-4901-9f98-fc6d5782187b', 3, null, '405 decoders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bccb9d49-a902-4901-9f98-fc6d5782187b', 4, null, '405 decoders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '6d8ba4d4-993f-4f95-8b40-1fb53ac3f6d8', 'ORION-S0039', 'Byteforge', 'byteforge', 'Keshika Valli S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'KESHIKAVALLIS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '6d8ba4d4-993f-4f95-8b40-1fb53ac3f6d8', 'VERIFIED-ORION-S0039', 'Keshika Valli S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6d8ba4d4-993f-4f95-8b40-1fb53ac3f6d8', 1, null, 'Byteforge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6d8ba4d4-993f-4f95-8b40-1fb53ac3f6d8', 2, null, 'Byteforge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6d8ba4d4-993f-4f95-8b40-1fb53ac3f6d8', 3, null, 'Byteforge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'bbfc42a3-688c-4e34-acf2-d87779a28829', 'ORION-S0040', 'Algoryx', 'algoryx', 'Amirtha varsini R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'AMIRTHAVARSINIR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'bbfc42a3-688c-4e34-acf2-d87779a28829', 'VERIFIED-ORION-S0040', 'Amirtha varsini R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bbfc42a3-688c-4e34-acf2-d87779a28829', 1, null, 'Algoryx', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bbfc42a3-688c-4e34-acf2-d87779a28829', 2, null, 'Algoryx', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bbfc42a3-688c-4e34-acf2-d87779a28829', 3, null, 'Algoryx', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bbfc42a3-688c-4e34-acf2-d87779a28829', 4, null, 'Algoryx', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8af7241c-830c-48ee-a8e8-47ed26b1f64a', 'ORION-S0042', 'THAMIZH ARIGNARGAL', 'thamizharignargal', 'Muhammadu Rasheeq J M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'MUHAMMADURASHEEQJM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8af7241c-830c-48ee-a8e8-47ed26b1f64a', 'VERIFIED-ORION-S0042', 'Muhammadu Rasheeq J M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8af7241c-830c-48ee-a8e8-47ed26b1f64a', 1, null, 'THAMIZH ARIGNARGAL', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8af7241c-830c-48ee-a8e8-47ed26b1f64a', 2, null, 'THAMIZH ARIGNARGAL', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8af7241c-830c-48ee-a8e8-47ed26b1f64a', 3, null, 'THAMIZH ARIGNARGAL', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '69ef3f6c-86ca-4963-9bc3-098995b31ec1', 'ORION-S0044', 'Deadline Warriors', 'deadlinewarriors', 'A.R Akshaya Kruthik', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'ARAKSHAYAKRUTHIK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '69ef3f6c-86ca-4963-9bc3-098995b31ec1', 'VERIFIED-ORION-S0044', 'A.R Akshaya Kruthik', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69ef3f6c-86ca-4963-9bc3-098995b31ec1', 1, null, 'Deadline Warriors', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69ef3f6c-86ca-4963-9bc3-098995b31ec1', 2, null, 'Deadline Warriors', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69ef3f6c-86ca-4963-9bc3-098995b31ec1', 3, null, 'Deadline Warriors', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69ef3f6c-86ca-4963-9bc3-098995b31ec1', 4, null, 'Deadline Warriors', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69ef3f6c-86ca-4963-9bc3-098995b31ec1', 5, null, 'Deadline Warriors', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b733d557-d942-43b0-83b3-5bd9e2bd9f35', 'ORION-S0045', 'PROTECTECH', 'protectech', 'Deveshwar S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'DEVESHWARS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b733d557-d942-43b0-83b3-5bd9e2bd9f35', 'VERIFIED-ORION-S0045', 'Deveshwar S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b733d557-d942-43b0-83b3-5bd9e2bd9f35', 1, null, 'PROTECTECH', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b733d557-d942-43b0-83b3-5bd9e2bd9f35', 2, null, 'PROTECTECH', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b733d557-d942-43b0-83b3-5bd9e2bd9f35', 3, null, 'PROTECTECH', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4aac57f1-8d04-4a99-a175-258d93534b0e', 'ORION-S0047', 'Alpha Minds', 'alphaminds', 'Vasundra S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'VASUNDRAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4aac57f1-8d04-4a99-a175-258d93534b0e', 'VERIFIED-ORION-S0047', 'Vasundra S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4aac57f1-8d04-4a99-a175-258d93534b0e', 1, null, 'Alpha Minds', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4aac57f1-8d04-4a99-a175-258d93534b0e', 2, null, 'Alpha Minds', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4aac57f1-8d04-4a99-a175-258d93534b0e', 3, null, 'Alpha Minds', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4aac57f1-8d04-4a99-a175-258d93534b0e', 4, null, 'Alpha Minds', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4aac57f1-8d04-4a99-a175-258d93534b0e', 5, null, 'Alpha Minds', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '348b3ef5-e237-4f8a-bff2-19d3e3c22446', 'ORION-S0048', 'BytePulse', 'bytepulse', 'Sadhana V', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'SADHANAV',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '348b3ef5-e237-4f8a-bff2-19d3e3c22446', 'VERIFIED-ORION-S0048', 'Sadhana V', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '348b3ef5-e237-4f8a-bff2-19d3e3c22446', 1, null, 'BytePulse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '348b3ef5-e237-4f8a-bff2-19d3e3c22446', 2, null, 'BytePulse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '348b3ef5-e237-4f8a-bff2-19d3e3c22446', 3, null, 'BytePulse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '348b3ef5-e237-4f8a-bff2-19d3e3c22446', 4, null, 'BytePulse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '348b3ef5-e237-4f8a-bff2-19d3e3c22446', 5, null, 'BytePulse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'bda9950a-be9d-4b99-a442-e85f2acaa199', 'ORION-S0050', 'Byte me', 'byteme', 'Shivani', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'SHIVANI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'bda9950a-be9d-4b99-a442-e85f2acaa199', 'VERIFIED-ORION-S0050', 'Shivani', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bda9950a-be9d-4b99-a442-e85f2acaa199', 1, null, 'Byte me', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bda9950a-be9d-4b99-a442-e85f2acaa199', 2, null, 'Byte me', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bda9950a-be9d-4b99-a442-e85f2acaa199', 3, null, 'Byte me', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bda9950a-be9d-4b99-a442-e85f2acaa199', 4, null, 'Byte me', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bda9950a-be9d-4b99-a442-e85f2acaa199', 5, null, 'Byte me', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'e2b25fc4-7759-4b26-b70f-eb54ddfec807', 'ORION-S0051', 'Point Break', 'pointbreak', 'Chandru M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'CHANDRUM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'e2b25fc4-7759-4b26-b70f-eb54ddfec807', 'VERIFIED-ORION-S0051', 'Chandru M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e2b25fc4-7759-4b26-b70f-eb54ddfec807', 1, null, 'Point Break', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e2b25fc4-7759-4b26-b70f-eb54ddfec807', 2, null, 'Point Break', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e2b25fc4-7759-4b26-b70f-eb54ddfec807', 3, null, 'Point Break', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e2b25fc4-7759-4b26-b70f-eb54ddfec807', 4, null, 'Point Break', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e2b25fc4-7759-4b26-b70f-eb54ddfec807', 5, null, 'Point Break', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b7d7d7c7-115e-4069-8ed4-a8af2941b678', 'ORION-S0053', 'Team Rogers', 'teamrogers', 'Vijayalakshmi.V', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'VIJAYALAKSHMIV',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b7d7d7c7-115e-4069-8ed4-a8af2941b678', 'VERIFIED-ORION-S0053', 'Vijayalakshmi.V', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b7d7d7c7-115e-4069-8ed4-a8af2941b678', 1, null, 'Team Rogers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b7d7d7c7-115e-4069-8ed4-a8af2941b678', 2, null, 'Team Rogers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b7d7d7c7-115e-4069-8ed4-a8af2941b678', 3, null, 'Team Rogers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b7d7d7c7-115e-4069-8ed4-a8af2941b678', 4, null, 'Team Rogers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b7d7d7c7-115e-4069-8ed4-a8af2941b678', 5, null, 'Team Rogers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '710c024e-0052-498b-8fe3-d654f713920f', 'ORION-S0055', 'Cyber Warrier', 'cyberwarrier', 'Jaya Suriya k', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'JAYASURIYAK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '710c024e-0052-498b-8fe3-d654f713920f', 'VERIFIED-ORION-S0055', 'Jaya Suriya k', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '710c024e-0052-498b-8fe3-d654f713920f', 1, null, 'Cyber Warrier', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '710c024e-0052-498b-8fe3-d654f713920f', 2, null, 'Cyber Warrier', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '710c024e-0052-498b-8fe3-d654f713920f', 3, null, 'Cyber Warrier', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '710c024e-0052-498b-8fe3-d654f713920f', 4, null, 'Cyber Warrier', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '710c024e-0052-498b-8fe3-d654f713920f', 5, null, 'Cyber Warrier', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '68ef91ae-f9da-49b3-a9c0-df4635427bfe', 'ORION-S0056', 'Interstellar', 'interstellar', 'Farhan Ur Rahman M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'FARHANURRAHMANM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '68ef91ae-f9da-49b3-a9c0-df4635427bfe', 'VERIFIED-ORION-S0056', 'Farhan Ur Rahman M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '68ef91ae-f9da-49b3-a9c0-df4635427bfe', 1, null, 'Interstellar', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '68ef91ae-f9da-49b3-a9c0-df4635427bfe', 2, null, 'Interstellar', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '68ef91ae-f9da-49b3-a9c0-df4635427bfe', 3, null, 'Interstellar', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '68ef91ae-f9da-49b3-a9c0-df4635427bfe', 4, null, 'Interstellar', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '68ef91ae-f9da-49b3-a9c0-df4635427bfe', 5, null, 'Interstellar', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '88d5a2b0-bae9-4901-aa8e-bc2f46df200f', 'ORION-S0058', 'Codeflux', 'codeflux', 'Praveena S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'PRAVEENAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '88d5a2b0-bae9-4901-aa8e-bc2f46df200f', 'VERIFIED-ORION-S0058', 'Praveena S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '88d5a2b0-bae9-4901-aa8e-bc2f46df200f', 1, null, 'Codeflux', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '88d5a2b0-bae9-4901-aa8e-bc2f46df200f', 2, null, 'Codeflux', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '88d5a2b0-bae9-4901-aa8e-bc2f46df200f', 3, null, 'Codeflux', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '88d5a2b0-bae9-4901-aa8e-bc2f46df200f', 4, null, 'Codeflux', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '88d5a2b0-bae9-4901-aa8e-bc2f46df200f', 5, null, 'Codeflux', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ff5ea078-dc63-4fcd-8984-a07c6c68f017', 'ORION-S0059', 'Elite', 'elite', 'Madhumitha Manivannan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'MADHUMITHAMANIVANNAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ff5ea078-dc63-4fcd-8984-a07c6c68f017', 'VERIFIED-ORION-S0059', 'Madhumitha Manivannan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ff5ea078-dc63-4fcd-8984-a07c6c68f017', 1, null, 'Elite', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5b34d073-80ea-49e0-972a-b76946e78ef2', 'ORION-S0060', 'Scarlet force', 'scarletforce', 'Madhumitha S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'MADHUMITHAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5b34d073-80ea-49e0-972a-b76946e78ef2', 'VERIFIED-ORION-S0060', 'Madhumitha S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5b34d073-80ea-49e0-972a-b76946e78ef2', 1, null, 'Scarlet force', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5b34d073-80ea-49e0-972a-b76946e78ef2', 2, null, 'Scarlet force', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5b34d073-80ea-49e0-972a-b76946e78ef2', 3, null, 'Scarlet force', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5b34d073-80ea-49e0-972a-b76946e78ef2', 4, null, 'Scarlet force', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8087022d-cea7-4f65-8bc7-22ce597bfe38', 'ORION-S0061', 'Aquasense', 'aquasense', 'Ratheesh M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'RATHEESHM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8087022d-cea7-4f65-8bc7-22ce597bfe38', 'VERIFIED-ORION-S0061', 'Ratheesh M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8087022d-cea7-4f65-8bc7-22ce597bfe38', 1, null, 'Aquasense', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8087022d-cea7-4f65-8bc7-22ce597bfe38', 2, null, 'Aquasense', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8087022d-cea7-4f65-8bc7-22ce597bfe38', 3, null, 'Aquasense', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '37d00ffa-4bd2-425b-a585-faa945031a6a', 'ORION-S0062', 'OPTIPARK SYSTEMS', 'optiparksystems', 'GOMATAM TRISHNA HAASINI', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'GOMATAMTRISHNAHAASINI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '37d00ffa-4bd2-425b-a585-faa945031a6a', 'VERIFIED-ORION-S0062', 'GOMATAM TRISHNA HAASINI', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '37d00ffa-4bd2-425b-a585-faa945031a6a', 1, null, 'OPTIPARK SYSTEMS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '37d00ffa-4bd2-425b-a585-faa945031a6a', 2, null, 'OPTIPARK SYSTEMS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '28c4c942-c9ef-491d-8488-0ff8e743c470', 'ORION-S0063', 'TECH TITANS', 'techtitans', 'Ram Prakash S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'RAMPRAKASHS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '28c4c942-c9ef-491d-8488-0ff8e743c470', 'VERIFIED-ORION-S0063', 'Ram Prakash S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '28c4c942-c9ef-491d-8488-0ff8e743c470', 1, null, 'TECH TITANS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '28c4c942-c9ef-491d-8488-0ff8e743c470', 2, null, 'TECH TITANS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '28c4c942-c9ef-491d-8488-0ff8e743c470', 3, null, 'TECH TITANS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '28c4c942-c9ef-491d-8488-0ff8e743c470', 4, null, 'TECH TITANS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '28c4c942-c9ef-491d-8488-0ff8e743c470', 5, null, 'TECH TITANS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '3ea3d852-85c7-4a3e-8456-24a8e8082b89', 'ORION-S0064', 'STACKS', 'stacks', 'Praveen R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'PRAVEENR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '3ea3d852-85c7-4a3e-8456-24a8e8082b89', 'VERIFIED-ORION-S0064', 'Praveen R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3ea3d852-85c7-4a3e-8456-24a8e8082b89', 1, null, 'STACKS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3ea3d852-85c7-4a3e-8456-24a8e8082b89', 2, null, 'STACKS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3ea3d852-85c7-4a3e-8456-24a8e8082b89', 3, null, 'STACKS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3ea3d852-85c7-4a3e-8456-24a8e8082b89', 4, null, 'STACKS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b3cf2f2f-0491-420b-906d-55e8bd89c9dd', 'ORION-S0065', 'LeafLogic', 'leaflogic', 'Swathika S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'SWATHIKAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b3cf2f2f-0491-420b-906d-55e8bd89c9dd', 'VERIFIED-ORION-S0065', 'Swathika S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b3cf2f2f-0491-420b-906d-55e8bd89c9dd', 1, null, 'LeafLogic', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b3cf2f2f-0491-420b-906d-55e8bd89c9dd', 2, null, 'LeafLogic', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b3cf2f2f-0491-420b-906d-55e8bd89c9dd', 3, null, 'LeafLogic', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b3cf2f2f-0491-420b-906d-55e8bd89c9dd', 4, null, 'LeafLogic', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b3cf2f2f-0491-420b-906d-55e8bd89c9dd', 5, null, 'LeafLogic', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5bdfd4f6-67b1-4e3c-9bc1-be258169f02c', 'ORION-S0066', 'DeeBug', 'deebug', 'Ronak. N', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'RONAKN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5bdfd4f6-67b1-4e3c-9bc1-be258169f02c', 'VERIFIED-ORION-S0066', 'Ronak. N', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5bdfd4f6-67b1-4e3c-9bc1-be258169f02c', 1, null, 'DeeBug', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5bdfd4f6-67b1-4e3c-9bc1-be258169f02c', 2, null, 'DeeBug', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5bdfd4f6-67b1-4e3c-9bc1-be258169f02c', 3, null, 'DeeBug', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5bdfd4f6-67b1-4e3c-9bc1-be258169f02c', 4, null, 'DeeBug', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '84c50818-50b3-45fc-8f26-da171a3e5b7e', 'ORION-S0067', 'NEXERA', 'nexera', 'Akshay Kumar P.V.', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'AKSHAYKUMARPV',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '84c50818-50b3-45fc-8f26-da171a3e5b7e', 'VERIFIED-ORION-S0067', 'Akshay Kumar P.V.', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '84c50818-50b3-45fc-8f26-da171a3e5b7e', 1, null, 'NEXERA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '84c50818-50b3-45fc-8f26-da171a3e5b7e', 2, null, 'NEXERA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '84c50818-50b3-45fc-8f26-da171a3e5b7e', 3, null, 'NEXERA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'acf9cf06-f48b-4023-8cc8-d7dc7114cc98', 'ORION-S0068', 'Tech Titan', 'techtitan', 'M.HARSHINI', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'MHARSHINI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'acf9cf06-f48b-4023-8cc8-d7dc7114cc98', 'VERIFIED-ORION-S0068', 'M.HARSHINI', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'acf9cf06-f48b-4023-8cc8-d7dc7114cc98', 1, null, 'Tech Titan', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'acf9cf06-f48b-4023-8cc8-d7dc7114cc98', 2, null, 'Tech Titan', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'acf9cf06-f48b-4023-8cc8-d7dc7114cc98', 3, null, 'Tech Titan', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'acf9cf06-f48b-4023-8cc8-d7dc7114cc98', 4, null, 'Tech Titan', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'acf9cf06-f48b-4023-8cc8-d7dc7114cc98', 5, null, 'Tech Titan', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '6411aafa-443b-47d1-a03e-5343c7895613', 'ORION-S0069', 'TECHNO BRATS', 'technobrats', 'Sruthi R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SRUTHIR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '6411aafa-443b-47d1-a03e-5343c7895613', 'VERIFIED-ORION-S0069', 'Sruthi R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6411aafa-443b-47d1-a03e-5343c7895613', 1, null, 'TECHNO BRATS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6411aafa-443b-47d1-a03e-5343c7895613', 2, null, 'TECHNO BRATS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6411aafa-443b-47d1-a03e-5343c7895613', 3, null, 'TECHNO BRATS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6411aafa-443b-47d1-a03e-5343c7895613', 4, null, 'TECHNO BRATS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6411aafa-443b-47d1-a03e-5343c7895613', 5, null, 'TECHNO BRATS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '66084544-8961-409e-8132-51cdb972e863', 'ORION-S0070', 'Team_Name_26', 'teamname26', 'Sai Krishna K J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SAIKRISHNAKJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '66084544-8961-409e-8132-51cdb972e863', 'VERIFIED-ORION-S0070', 'Sai Krishna K J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '66084544-8961-409e-8132-51cdb972e863', 1, null, 'Team_Name_26', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '66084544-8961-409e-8132-51cdb972e863', 2, null, 'Team_Name_26', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '66084544-8961-409e-8132-51cdb972e863', 3, null, 'Team_Name_26', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '14fbb860-afe5-4ce0-9b59-61908007781c', 'ORION-S0071', 'Bama Boyz', 'bamaboyz', 'Arjun', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'ARJUN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '14fbb860-afe5-4ce0-9b59-61908007781c', 'VERIFIED-ORION-S0071', 'Arjun', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '14fbb860-afe5-4ce0-9b59-61908007781c', 1, null, 'Bama Boyz', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '14fbb860-afe5-4ce0-9b59-61908007781c', 2, null, 'Bama Boyz', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '14fbb860-afe5-4ce0-9b59-61908007781c', 3, null, 'Bama Boyz', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '14fbb860-afe5-4ce0-9b59-61908007781c', 4, null, 'Bama Boyz', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '14fbb860-afe5-4ce0-9b59-61908007781c', 5, null, 'Bama Boyz', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'de5cf4c8-3940-4691-8490-757e30150c18', 'ORION-S0072', 'Femmora', 'femmora', 'Vaibhavashakthi R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'VAIBHAVASHAKTHIR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'de5cf4c8-3940-4691-8490-757e30150c18', 'VERIFIED-ORION-S0072', 'Vaibhavashakthi R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'de5cf4c8-3940-4691-8490-757e30150c18', 1, null, 'Femmora', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'de5cf4c8-3940-4691-8490-757e30150c18', 2, null, 'Femmora', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'de5cf4c8-3940-4691-8490-757e30150c18', 3, null, 'Femmora', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'de5cf4c8-3940-4691-8490-757e30150c18', 4, null, 'Femmora', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'de5cf4c8-3940-4691-8490-757e30150c18', 5, null, 'Femmora', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '99acf916-b3a0-4f4a-8757-a152b5e7c2c6', 'ORION-S0073', 'LOGIC LEGIONS', 'logiclegions', 'SIVAM P', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SIVAMP',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '99acf916-b3a0-4f4a-8757-a152b5e7c2c6', 'VERIFIED-ORION-S0073', 'SIVAM P', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '99acf916-b3a0-4f4a-8757-a152b5e7c2c6', 1, null, 'LOGIC LEGIONS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '99acf916-b3a0-4f4a-8757-a152b5e7c2c6', 2, null, 'LOGIC LEGIONS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '99acf916-b3a0-4f4a-8757-a152b5e7c2c6', 3, null, 'LOGIC LEGIONS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '99acf916-b3a0-4f4a-8757-a152b5e7c2c6', 4, null, 'LOGIC LEGIONS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '99acf916-b3a0-4f4a-8757-a152b5e7c2c6', 5, null, 'LOGIC LEGIONS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '69e032cb-a732-4683-83ce-ea0e5fdd534d', 'ORION-S0074', 'VisionX', 'visionx', 'Yazhini B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'YAZHINIB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '69e032cb-a732-4683-83ce-ea0e5fdd534d', 'VERIFIED-ORION-S0074', 'Yazhini B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69e032cb-a732-4683-83ce-ea0e5fdd534d', 1, null, 'VisionX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69e032cb-a732-4683-83ce-ea0e5fdd534d', 2, null, 'VisionX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69e032cb-a732-4683-83ce-ea0e5fdd534d', 3, null, 'VisionX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69e032cb-a732-4683-83ce-ea0e5fdd534d', 4, null, 'VisionX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69e032cb-a732-4683-83ce-ea0e5fdd534d', 5, null, 'VisionX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'a26dc427-9448-41ad-9a8c-5c854b3ea774', 'ORION-S0075', 'The imposter', 'theimposter', 'Likith Krishna J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'LIKITHKRISHNAJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'a26dc427-9448-41ad-9a8c-5c854b3ea774', 'VERIFIED-ORION-S0075', 'Likith Krishna J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a26dc427-9448-41ad-9a8c-5c854b3ea774', 1, null, 'The imposter', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a26dc427-9448-41ad-9a8c-5c854b3ea774', 2, null, 'The imposter', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a26dc427-9448-41ad-9a8c-5c854b3ea774', 3, null, 'The imposter', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a26dc427-9448-41ad-9a8c-5c854b3ea774', 4, null, 'The imposter', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'eb09f953-a48d-4fea-b7db-4e2fc141b833', 'ORION-S0076', 'Kalephor', 'kalephor', 'Shivani SK', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'SHIVANISK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'eb09f953-a48d-4fea-b7db-4e2fc141b833', 'VERIFIED-ORION-S0076', 'Shivani SK', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eb09f953-a48d-4fea-b7db-4e2fc141b833', 1, null, 'Kalephor', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eb09f953-a48d-4fea-b7db-4e2fc141b833', 2, null, 'Kalephor', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eb09f953-a48d-4fea-b7db-4e2fc141b833', 3, null, 'Kalephor', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eb09f953-a48d-4fea-b7db-4e2fc141b833', 4, null, 'Kalephor', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eb09f953-a48d-4fea-b7db-4e2fc141b833', 5, null, 'Kalephor', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '19640852-9cb9-4e24-b411-bc6ee3b41ec2', 'ORION-S0077', 'AgriVanguard', 'agrivanguard', 'Thodupunuri Sai Charan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'THODUPUNURISAICHARAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '19640852-9cb9-4e24-b411-bc6ee3b41ec2', 'VERIFIED-ORION-S0077', 'Thodupunuri Sai Charan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '19640852-9cb9-4e24-b411-bc6ee3b41ec2', 1, null, 'AgriVanguard', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '19640852-9cb9-4e24-b411-bc6ee3b41ec2', 2, null, 'AgriVanguard', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '19640852-9cb9-4e24-b411-bc6ee3b41ec2', 3, null, 'AgriVanguard', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '19640852-9cb9-4e24-b411-bc6ee3b41ec2', 4, null, 'AgriVanguard', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'eaa62d58-d4f1-4f46-abe0-c56cb16df051', 'ORION-S0078', 'Team Synergy', 'teamsynergy', 'Nirmala Devi NS', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'NIRMALADEVINS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'eaa62d58-d4f1-4f46-abe0-c56cb16df051', 'VERIFIED-ORION-S0078', 'Nirmala Devi NS', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eaa62d58-d4f1-4f46-abe0-c56cb16df051', 1, null, 'Team Synergy', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eaa62d58-d4f1-4f46-abe0-c56cb16df051', 2, null, 'Team Synergy', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eaa62d58-d4f1-4f46-abe0-c56cb16df051', 3, null, 'Team Synergy', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eaa62d58-d4f1-4f46-abe0-c56cb16df051', 4, null, 'Team Synergy', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eaa62d58-d4f1-4f46-abe0-c56cb16df051', 5, null, 'Team Synergy', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '691b2189-3a4e-4e9f-bce5-ba21cd471f6e', 'ORION-S0079', 'Biobytes', 'biobytes', 'S A Srikanth', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SASRIKANTH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '691b2189-3a4e-4e9f-bce5-ba21cd471f6e', 'VERIFIED-ORION-S0079', 'S A Srikanth', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '691b2189-3a4e-4e9f-bce5-ba21cd471f6e', 1, null, 'Biobytes', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '691b2189-3a4e-4e9f-bce5-ba21cd471f6e', 2, null, 'Biobytes', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '691b2189-3a4e-4e9f-bce5-ba21cd471f6e', 3, null, 'Biobytes', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '691b2189-3a4e-4e9f-bce5-ba21cd471f6e', 4, null, 'Biobytes', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '691b2189-3a4e-4e9f-bce5-ba21cd471f6e', 5, null, 'Biobytes', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '3d09e17f-7911-4c83-a20c-321fd4b2056b', 'ORION-S0080', 'JACK HACKROV', 'jackhackrov', 'VISHWA I', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'VISHWAI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '3d09e17f-7911-4c83-a20c-321fd4b2056b', 'VERIFIED-ORION-S0080', 'VISHWA I', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3d09e17f-7911-4c83-a20c-321fd4b2056b', 1, null, 'JACK HACKROV', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3d09e17f-7911-4c83-a20c-321fd4b2056b', 2, null, 'JACK HACKROV', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3d09e17f-7911-4c83-a20c-321fd4b2056b', 3, null, 'JACK HACKROV', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3d09e17f-7911-4c83-a20c-321fd4b2056b', 4, null, 'JACK HACKROV', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0e41fcd9-a447-48bb-9159-cbd386b549c1', 'ORION-S0081', 'IMPACT CODERS', 'impactcoders', 'Mohamed Aaseef M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'MOHAMEDAASEEFM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0e41fcd9-a447-48bb-9159-cbd386b549c1', 'VERIFIED-ORION-S0081', 'Mohamed Aaseef M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0e41fcd9-a447-48bb-9159-cbd386b549c1', 1, null, 'IMPACT CODERS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0e41fcd9-a447-48bb-9159-cbd386b549c1', 2, null, 'IMPACT CODERS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0e41fcd9-a447-48bb-9159-cbd386b549c1', 3, null, 'IMPACT CODERS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0e41fcd9-a447-48bb-9159-cbd386b549c1', 4, null, 'IMPACT CODERS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0e41fcd9-a447-48bb-9159-cbd386b549c1', 5, null, 'IMPACT CODERS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '41eeea01-7911-4e3a-bdf9-68c1f8346e61', 'ORION-S0082', 'Brain Byte', 'brainbyte', 'Aditi Phulre', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'ADITIPHULRE',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '41eeea01-7911-4e3a-bdf9-68c1f8346e61', 'VERIFIED-ORION-S0082', 'Aditi Phulre', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '41eeea01-7911-4e3a-bdf9-68c1f8346e61', 1, null, 'Brain Byte', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '41eeea01-7911-4e3a-bdf9-68c1f8346e61', 2, null, 'Brain Byte', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '41eeea01-7911-4e3a-bdf9-68c1f8346e61', 3, null, 'Brain Byte', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '029b17a0-7de5-4581-9f49-7adadb20f806', 'ORION-S0083', '404 Brain Not Found', '404brainnotfound', 'HARISH R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'HARISHR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '029b17a0-7de5-4581-9f49-7adadb20f806', 'VERIFIED-ORION-S0083', 'HARISH R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '029b17a0-7de5-4581-9f49-7adadb20f806', 1, null, '404 Brain Not Found', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '029b17a0-7de5-4581-9f49-7adadb20f806', 2, null, '404 Brain Not Found', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '029b17a0-7de5-4581-9f49-7adadb20f806', 3, null, '404 Brain Not Found', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '85e58894-3334-4eee-8e01-f5c07df42632', 'ORION-S0084', 'TOOTHPASTE EATERS', 'toothpasteeaters', 'RAJDEEP MAHADEV KULKARNI', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'RAJDEEPMAHADEVKULKARNI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '85e58894-3334-4eee-8e01-f5c07df42632', 'VERIFIED-ORION-S0084', 'RAJDEEP MAHADEV KULKARNI', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '85e58894-3334-4eee-8e01-f5c07df42632', 1, null, 'TOOTHPASTE EATERS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '85e58894-3334-4eee-8e01-f5c07df42632', 2, null, 'TOOTHPASTE EATERS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ba1d712f-00bd-4e13-9998-562b2f66276b', 'ORION-S0085', 'Mission:I''m-Possible Oxygen', 'missionimpossibleoxygen', 'Jai ganapathi.S.B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'JAIGANAPATHISB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ba1d712f-00bd-4e13-9998-562b2f66276b', 'VERIFIED-ORION-S0085', 'Jai ganapathi.S.B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba1d712f-00bd-4e13-9998-562b2f66276b', 1, null, 'Mission:I''m-Possible Oxygen', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba1d712f-00bd-4e13-9998-562b2f66276b', 2, null, 'Mission:I''m-Possible Oxygen', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba1d712f-00bd-4e13-9998-562b2f66276b', 3, null, 'Mission:I''m-Possible Oxygen', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba1d712f-00bd-4e13-9998-562b2f66276b', 4, null, 'Mission:I''m-Possible Oxygen', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8a5060c1-7c77-4ad5-b69b-a84381bdcecc', 'ORION-S0086', 'SHERLOCK', 'sherlock', 'Sai Aditiyaa R S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'SAIADITIYAARS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8a5060c1-7c77-4ad5-b69b-a84381bdcecc', 'VERIFIED-ORION-S0086', 'Sai Aditiyaa R S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8a5060c1-7c77-4ad5-b69b-a84381bdcecc', 1, null, 'SHERLOCK', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8a5060c1-7c77-4ad5-b69b-a84381bdcecc', 2, null, 'SHERLOCK', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8a5060c1-7c77-4ad5-b69b-a84381bdcecc', 3, null, 'SHERLOCK', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8a5060c1-7c77-4ad5-b69b-a84381bdcecc', 4, null, 'SHERLOCK', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '2d9edf22-21db-415d-b1d7-914cea530a46', 'ORION-S0087', 'PERCEPTRON', 'perceptron', 'Sanjai R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SANJAIR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '2d9edf22-21db-415d-b1d7-914cea530a46', 'VERIFIED-ORION-S0087', 'Sanjai R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2d9edf22-21db-415d-b1d7-914cea530a46', 1, null, 'PERCEPTRON', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2d9edf22-21db-415d-b1d7-914cea530a46', 2, null, 'PERCEPTRON', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2d9edf22-21db-415d-b1d7-914cea530a46', 3, null, 'PERCEPTRON', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2d9edf22-21db-415d-b1d7-914cea530a46', 4, null, 'PERCEPTRON', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2d9edf22-21db-415d-b1d7-914cea530a46', 5, null, 'PERCEPTRON', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ccd64586-466d-49b5-bc31-f1694f8ad364', 'ORION-S0088', 'core signal', 'coresignal', 'prasanna kumar', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'PRASANNAKUMAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ccd64586-466d-49b5-bc31-f1694f8ad364', 'VERIFIED-ORION-S0088', 'prasanna kumar', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ccd64586-466d-49b5-bc31-f1694f8ad364', 1, null, 'core signal', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ccd64586-466d-49b5-bc31-f1694f8ad364', 2, null, 'core signal', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ccd64586-466d-49b5-bc31-f1694f8ad364', 3, null, 'core signal', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ccd64586-466d-49b5-bc31-f1694f8ad364', 4, null, 'core signal', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ccd64586-466d-49b5-bc31-f1694f8ad364', 5, null, 'core signal', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b855c875-7edd-4b77-86b8-857bcbfbf286', 'ORION-S0089', 'Technova', 'technova', 'S.Lakshaya', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SLAKSHAYA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b855c875-7edd-4b77-86b8-857bcbfbf286', 'VERIFIED-ORION-S0089', 'S.Lakshaya', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b855c875-7edd-4b77-86b8-857bcbfbf286', 1, null, 'Technova', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b855c875-7edd-4b77-86b8-857bcbfbf286', 2, null, 'Technova', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b855c875-7edd-4b77-86b8-857bcbfbf286', 3, null, 'Technova', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '55c806d8-d86c-4947-ac1b-b2d85379ebc4', 'ORION-S0090', 'Fight club', 'fightclub', 'M. SHEIK SHAHIN', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'MSHEIKSHAHIN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '55c806d8-d86c-4947-ac1b-b2d85379ebc4', 'VERIFIED-ORION-S0090', 'M. SHEIK SHAHIN', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '55c806d8-d86c-4947-ac1b-b2d85379ebc4', 1, null, 'Fight club', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '55c806d8-d86c-4947-ac1b-b2d85379ebc4', 2, null, 'Fight club', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '55c806d8-d86c-4947-ac1b-b2d85379ebc4', 3, null, 'Fight club', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '55c806d8-d86c-4947-ac1b-b2d85379ebc4', 4, null, 'Fight club', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '55c806d8-d86c-4947-ac1b-b2d85379ebc4', 5, null, 'Fight club', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0461f57d-4000-4bf7-a369-a07790d9be5a', 'ORION-S0091', 'NEXORA', 'nexora', 'AGILESH M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'AGILESHM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0461f57d-4000-4bf7-a369-a07790d9be5a', 'VERIFIED-ORION-S0091', 'AGILESH M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0461f57d-4000-4bf7-a369-a07790d9be5a', 1, null, 'NEXORA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0461f57d-4000-4bf7-a369-a07790d9be5a', 2, null, 'NEXORA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0461f57d-4000-4bf7-a369-a07790d9be5a', 3, null, 'NEXORA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0461f57d-4000-4bf7-a369-a07790d9be5a', 4, null, 'NEXORA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0461f57d-4000-4bf7-a369-a07790d9be5a', 5, null, 'NEXORA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '09a19b19-1f32-4b55-99e9-3108adc7139a', 'ORION-S0092', 'Impact warriors', 'impactwarriors', 'V DIVYESH', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'VDIVYESH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '09a19b19-1f32-4b55-99e9-3108adc7139a', 'VERIFIED-ORION-S0092', 'V DIVYESH', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '09a19b19-1f32-4b55-99e9-3108adc7139a', 1, null, 'Impact warriors', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '09a19b19-1f32-4b55-99e9-3108adc7139a', 2, null, 'Impact warriors', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '09a19b19-1f32-4b55-99e9-3108adc7139a', 3, null, 'Impact warriors', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8d716f08-5154-468f-b635-765fdbf2339b', 'ORION-S0093', 'CodeMonkeys', 'codemonkeys', 'Hari Vishva S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'HARIVISHVAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8d716f08-5154-468f-b635-765fdbf2339b', 'VERIFIED-ORION-S0093', 'Hari Vishva S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8d716f08-5154-468f-b635-765fdbf2339b', 1, null, 'CodeMonkeys', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8d716f08-5154-468f-b635-765fdbf2339b', 2, null, 'CodeMonkeys', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8d716f08-5154-468f-b635-765fdbf2339b', 3, null, 'CodeMonkeys', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8d716f08-5154-468f-b635-765fdbf2339b', 4, null, 'CodeMonkeys', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '76fb816a-f336-4a14-8cb3-81a29a67f384', 'ORION-S0094', 'Techmates', 'techmates', 'Samitha. K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SAMITHAK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '76fb816a-f336-4a14-8cb3-81a29a67f384', 'VERIFIED-ORION-S0094', 'Samitha. K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '76fb816a-f336-4a14-8cb3-81a29a67f384', 1, null, 'Techmates', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '76fb816a-f336-4a14-8cb3-81a29a67f384', 2, null, 'Techmates', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '496631a6-c422-4994-b9d5-5c4e00b99c7f', 'ORION-S0095', 'SALTVISIONAI', 'saltvisionai', 'Mohammed Emtheyas S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'MOHAMMEDEMTHEYASS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '496631a6-c422-4994-b9d5-5c4e00b99c7f', 'VERIFIED-ORION-S0095', 'Mohammed Emtheyas S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '496631a6-c422-4994-b9d5-5c4e00b99c7f', 1, null, 'SALTVISIONAI', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '496631a6-c422-4994-b9d5-5c4e00b99c7f', 2, null, 'SALTVISIONAI', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '496631a6-c422-4994-b9d5-5c4e00b99c7f', 3, null, 'SALTVISIONAI', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd711bcf6-c4b1-49d9-993b-a2e056bf9998', 'ORION-S0096', 'Nex 6', 'nex6', 'DILIPAN P', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'DILIPANP',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd711bcf6-c4b1-49d9-993b-a2e056bf9998', 'VERIFIED-ORION-S0096', 'DILIPAN P', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd711bcf6-c4b1-49d9-993b-a2e056bf9998', 1, null, 'Nex 6', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd711bcf6-c4b1-49d9-993b-a2e056bf9998', 2, null, 'Nex 6', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd711bcf6-c4b1-49d9-993b-a2e056bf9998', 3, null, 'Nex 6', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd711bcf6-c4b1-49d9-993b-a2e056bf9998', 4, null, 'Nex 6', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd711bcf6-c4b1-49d9-993b-a2e056bf9998', 5, null, 'Nex 6', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '986c856c-d60e-49d3-a9d2-3c3177282ed6', 'ORION-S0097', 'SPIDEYVERSE', 'spideyverse', 'Hemamalini K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'HEMAMALINIK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '986c856c-d60e-49d3-a9d2-3c3177282ed6', 'VERIFIED-ORION-S0097', 'Hemamalini K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '986c856c-d60e-49d3-a9d2-3c3177282ed6', 1, null, 'SPIDEYVERSE', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '986c856c-d60e-49d3-a9d2-3c3177282ed6', 2, null, 'SPIDEYVERSE', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '986c856c-d60e-49d3-a9d2-3c3177282ed6', 3, null, 'SPIDEYVERSE', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0d90ee6c-e917-4b23-bd9a-9671bab8a772', 'ORION-S0098', 'Quantum Force', 'quantumforce', 'B Gopinath', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'BGOPINATH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0d90ee6c-e917-4b23-bd9a-9671bab8a772', 'VERIFIED-ORION-S0098', 'B Gopinath', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0d90ee6c-e917-4b23-bd9a-9671bab8a772', 1, null, 'Quantum Force', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0d90ee6c-e917-4b23-bd9a-9671bab8a772', 2, null, 'Quantum Force', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0d90ee6c-e917-4b23-bd9a-9671bab8a772', 3, null, 'Quantum Force', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0d90ee6c-e917-4b23-bd9a-9671bab8a772', 4, null, 'Quantum Force', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0d90ee6c-e917-4b23-bd9a-9671bab8a772', 5, null, 'Quantum Force', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '77655324-35c3-4a5f-bf7b-9f5f695ef50f', 'ORION-S0099', 'Riot', 'riot', 'P. Pragathy', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'PPRAGATHY',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '77655324-35c3-4a5f-bf7b-9f5f695ef50f', 'VERIFIED-ORION-S0099', 'P. Pragathy', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '77655324-35c3-4a5f-bf7b-9f5f695ef50f', 1, null, 'Riot', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '77655324-35c3-4a5f-bf7b-9f5f695ef50f', 2, null, 'Riot', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '77655324-35c3-4a5f-bf7b-9f5f695ef50f', 3, null, 'Riot', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c10ee97e-b7ca-4419-8abd-5c568887d01b', 'ORION-S0101', 'FLOWPILOT', 'flowpilot', 'Pranosh M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'PRANOSHM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c10ee97e-b7ca-4419-8abd-5c568887d01b', 'VERIFIED-ORION-S0101', 'Pranosh M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c10ee97e-b7ca-4419-8abd-5c568887d01b', 1, null, 'FLOWPILOT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c10ee97e-b7ca-4419-8abd-5c568887d01b', 2, null, 'FLOWPILOT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c10ee97e-b7ca-4419-8abd-5c568887d01b', 3, null, 'FLOWPILOT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c10ee97e-b7ca-4419-8abd-5c568887d01b', 4, null, 'FLOWPILOT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '961cb284-3013-47c5-9564-67fbda8cdec6', 'ORION-S0102', 'SYNC SQUAD', 'syncsquad', 'MOHAMED RIYASDEEN I', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'MOHAMEDRIYASDEENI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '961cb284-3013-47c5-9564-67fbda8cdec6', 'VERIFIED-ORION-S0102', 'MOHAMED RIYASDEEN I', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '961cb284-3013-47c5-9564-67fbda8cdec6', 1, null, 'SYNC SQUAD', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '961cb284-3013-47c5-9564-67fbda8cdec6', 2, null, 'SYNC SQUAD', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '961cb284-3013-47c5-9564-67fbda8cdec6', 3, null, 'SYNC SQUAD', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '961cb284-3013-47c5-9564-67fbda8cdec6', 4, null, 'SYNC SQUAD', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '961cb284-3013-47c5-9564-67fbda8cdec6', 5, null, 'SYNC SQUAD', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd740f524-686d-47b9-a879-38cc4463e7cb', 'ORION-S0103', 'TENSOR TITANS', 'tensortitans', 'Jessica J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'JESSICAJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd740f524-686d-47b9-a879-38cc4463e7cb', 'VERIFIED-ORION-S0103', 'Jessica J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd740f524-686d-47b9-a879-38cc4463e7cb', 1, null, 'TENSOR TITANS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd740f524-686d-47b9-a879-38cc4463e7cb', 2, null, 'TENSOR TITANS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd740f524-686d-47b9-a879-38cc4463e7cb', 3, null, 'TENSOR TITANS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd740f524-686d-47b9-a879-38cc4463e7cb', 4, null, 'TENSOR TITANS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd5051e77-ec3b-4d30-aa47-dc566fbecb16', 'ORION-S0104', 'KernelPanic', 'kernelpanic', 'Aaruran. K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'AARURANK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd5051e77-ec3b-4d30-aa47-dc566fbecb16', 'VERIFIED-ORION-S0104', 'Aaruran. K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd5051e77-ec3b-4d30-aa47-dc566fbecb16', 1, null, 'KernelPanic', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd5051e77-ec3b-4d30-aa47-dc566fbecb16', 2, null, 'KernelPanic', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd5051e77-ec3b-4d30-aa47-dc566fbecb16', 3, null, 'KernelPanic', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd5051e77-ec3b-4d30-aa47-dc566fbecb16', 4, null, 'KernelPanic', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd5051e77-ec3b-4d30-aa47-dc566fbecb16', 5, null, 'KernelPanic', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '6b14a71b-1170-4d9f-802f-949253a94cae', 'ORION-S0105', 'OMEGA', 'omega', 'R RITHWIK', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'RRITHWIK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '6b14a71b-1170-4d9f-802f-949253a94cae', 'VERIFIED-ORION-S0105', 'R RITHWIK', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6b14a71b-1170-4d9f-802f-949253a94cae', 1, null, 'OMEGA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6b14a71b-1170-4d9f-802f-949253a94cae', 2, null, 'OMEGA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'dc0ed8fb-bf1f-441d-bb30-f62352021ca4', 'ORION-S0106', 'Binary Titans', 'binarytitans', 'M.Madhuri', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'MMADHURI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'dc0ed8fb-bf1f-441d-bb30-f62352021ca4', 'VERIFIED-ORION-S0106', 'M.Madhuri', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dc0ed8fb-bf1f-441d-bb30-f62352021ca4', 1, null, 'Binary Titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '998015aa-1edf-4ca9-99c3-196ec1e68c79', 'ORION-S0107', 'NEXO', 'nexo', 'Ashwath M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'ASHWATHM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '998015aa-1edf-4ca9-99c3-196ec1e68c79', 'VERIFIED-ORION-S0107', 'Ashwath M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '998015aa-1edf-4ca9-99c3-196ec1e68c79', 1, null, 'NEXO', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '9b2b593d-8aea-4af3-95ce-bbabe0cbfa22', 'ORION-S0108', 'FNATIC', 'fnatic', 'Leema S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'LEEMAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '9b2b593d-8aea-4af3-95ce-bbabe0cbfa22', 'VERIFIED-ORION-S0108', 'Leema S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9b2b593d-8aea-4af3-95ce-bbabe0cbfa22', 1, null, 'FNATIC', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9b2b593d-8aea-4af3-95ce-bbabe0cbfa22', 2, null, 'FNATIC', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9b2b593d-8aea-4af3-95ce-bbabe0cbfa22', 3, null, 'FNATIC', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9b2b593d-8aea-4af3-95ce-bbabe0cbfa22', 4, null, 'FNATIC', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9b2b593d-8aea-4af3-95ce-bbabe0cbfa22', 5, null, 'FNATIC', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '7f89b781-1bff-4177-b082-daf3cd9dd094', 'ORION-S0109', 'TOUCH GRASS', 'touchgrass', 'TK DHARMESH KUMAR', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'TKDHARMESHKUMAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '7f89b781-1bff-4177-b082-daf3cd9dd094', 'VERIFIED-ORION-S0109', 'TK DHARMESH KUMAR', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7f89b781-1bff-4177-b082-daf3cd9dd094', 1, null, 'TOUCH GRASS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7f89b781-1bff-4177-b082-daf3cd9dd094', 2, null, 'TOUCH GRASS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7f89b781-1bff-4177-b082-daf3cd9dd094', 3, null, 'TOUCH GRASS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7f89b781-1bff-4177-b082-daf3cd9dd094', 4, null, 'TOUCH GRASS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7f89b781-1bff-4177-b082-daf3cd9dd094', 5, null, 'TOUCH GRASS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'eace2565-a520-485c-89a5-871ae52c272f', 'ORION-S0110', 'Codex', 'codex', 'Praveen S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'PRAVEENS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'eace2565-a520-485c-89a5-871ae52c272f', 'VERIFIED-ORION-S0110', 'Praveen S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eace2565-a520-485c-89a5-871ae52c272f', 1, null, 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eace2565-a520-485c-89a5-871ae52c272f', 2, null, 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eace2565-a520-485c-89a5-871ae52c272f', 3, null, 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eace2565-a520-485c-89a5-871ae52c272f', 4, null, 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'eace2565-a520-485c-89a5-871ae52c272f', 5, null, 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '560a6f13-7034-4b35-8516-0a2d2c07a967', 'ORION-S0111', 'Arvion', 'arvion', 'Pranesh Mithun G S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'PRANESHMITHUNGS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '560a6f13-7034-4b35-8516-0a2d2c07a967', 'VERIFIED-ORION-S0111', 'Pranesh Mithun G S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '560a6f13-7034-4b35-8516-0a2d2c07a967', 1, null, 'Arvion', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '560a6f13-7034-4b35-8516-0a2d2c07a967', 2, null, 'Arvion', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '560a6f13-7034-4b35-8516-0a2d2c07a967', 3, null, 'Arvion', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '560a6f13-7034-4b35-8516-0a2d2c07a967', 4, null, 'Arvion', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '560a6f13-7034-4b35-8516-0a2d2c07a967', 5, null, 'Arvion', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'e27c3bef-f869-4be0-836d-71a3e403e460', 'ORION-S0112', 'Vaishnavi devi G', 'vaishnavidevig', 'Vaishnavi devi G', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'VAISHNAVIDEVIG',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'e27c3bef-f869-4be0-836d-71a3e403e460', 'VERIFIED-ORION-S0112', 'Vaishnavi devi G', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e27c3bef-f869-4be0-836d-71a3e403e460', 1, null, 'Vaishnavi devi G', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e27c3bef-f869-4be0-836d-71a3e403e460', 2, null, 'Vaishnavi devi G', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '95cec263-f53d-47de-8018-50dc4afbcc85', 'ORION-S0113', 'NOVARYN', 'novaryn', 'Barathi Sankar M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'BARATHISANKARM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '95cec263-f53d-47de-8018-50dc4afbcc85', 'VERIFIED-ORION-S0113', 'Barathi Sankar M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '95cec263-f53d-47de-8018-50dc4afbcc85', 1, null, 'NOVARYN', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '95cec263-f53d-47de-8018-50dc4afbcc85', 2, null, 'NOVARYN', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '95cec263-f53d-47de-8018-50dc4afbcc85', 3, null, 'NOVARYN', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '95cec263-f53d-47de-8018-50dc4afbcc85', 4, null, 'NOVARYN', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f26bf519-8cb7-46ab-adb4-311ffcacaf32', 'ORION-S0114', 'THE HEXA GEN', 'thehexagen', 'HRITHISHVAR', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'HRITHISHVAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f26bf519-8cb7-46ab-adb4-311ffcacaf32', 'VERIFIED-ORION-S0114', 'HRITHISHVAR', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f26bf519-8cb7-46ab-adb4-311ffcacaf32', 1, null, 'THE HEXA GEN', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f26bf519-8cb7-46ab-adb4-311ffcacaf32', 2, null, 'THE HEXA GEN', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f26bf519-8cb7-46ab-adb4-311ffcacaf32', 3, null, 'THE HEXA GEN', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f26bf519-8cb7-46ab-adb4-311ffcacaf32', 4, null, 'THE HEXA GEN', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'a8540c68-fac2-49d0-a40a-7447887a4091', 'ORION-S0115', 'KernelZero', 'kernelzero', 'Priyan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'PRIYAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'a8540c68-fac2-49d0-a40a-7447887a4091', 'VERIFIED-ORION-S0115', 'Priyan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a8540c68-fac2-49d0-a40a-7447887a4091', 1, null, 'KernelZero', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a8540c68-fac2-49d0-a40a-7447887a4091', 2, null, 'KernelZero', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a8540c68-fac2-49d0-a40a-7447887a4091', 3, null, 'KernelZero', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a8540c68-fac2-49d0-a40a-7447887a4091', 4, null, 'KernelZero', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a8540c68-fac2-49d0-a40a-7447887a4091', 5, null, 'KernelZero', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5afb0f7c-772e-4269-b317-1a8d97b52200', 'ORION-S0116', 'Codenova', 'codenova', 'Praveena k', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'PRAVEENAK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5afb0f7c-772e-4269-b317-1a8d97b52200', 'VERIFIED-ORION-S0116', 'Praveena k', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5afb0f7c-772e-4269-b317-1a8d97b52200', 1, null, 'Codenova', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5afb0f7c-772e-4269-b317-1a8d97b52200', 2, null, 'Codenova', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5afb0f7c-772e-4269-b317-1a8d97b52200', 3, null, 'Codenova', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5afb0f7c-772e-4269-b317-1a8d97b52200', 4, null, 'Codenova', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '36853465-889e-4b12-b12a-4804e974ffd4', 'ORION-S0117', 'Masterminds', 'masterminds', 'Greeshma tarlana', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'GREESHMATARLANA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '36853465-889e-4b12-b12a-4804e974ffd4', 'VERIFIED-ORION-S0117', 'Greeshma tarlana', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '36853465-889e-4b12-b12a-4804e974ffd4', 1, null, 'Masterminds', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '36853465-889e-4b12-b12a-4804e974ffd4', 2, null, 'Masterminds', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '36853465-889e-4b12-b12a-4804e974ffd4', 3, null, 'Masterminds', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '3f568b2f-76d3-4d7e-af58-bdcfe72f941e', 'ORION-S0118', 'Jarvis 6.O', 'jarvis6o', 'Roshan G', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'ROSHANG',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '3f568b2f-76d3-4d7e-af58-bdcfe72f941e', 'VERIFIED-ORION-S0118', 'Roshan G', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3f568b2f-76d3-4d7e-af58-bdcfe72f941e', 1, null, 'Jarvis 6.O', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3f568b2f-76d3-4d7e-af58-bdcfe72f941e', 2, null, 'Jarvis 6.O', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3f568b2f-76d3-4d7e-af58-bdcfe72f941e', 3, null, 'Jarvis 6.O', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3f568b2f-76d3-4d7e-af58-bdcfe72f941e', 4, null, 'Jarvis 6.O', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0581cb8a-1709-481f-8da0-2e8d9f586f2b', 'ORION-S0119', 'Veridia', 'veridia', 'Nadhiv Karuppuswamy', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'NADHIVKARUPPUSWAMY',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0581cb8a-1709-481f-8da0-2e8d9f586f2b', 'VERIFIED-ORION-S0119', 'Nadhiv Karuppuswamy', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0581cb8a-1709-481f-8da0-2e8d9f586f2b', 1, null, 'Veridia', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0581cb8a-1709-481f-8da0-2e8d9f586f2b', 2, null, 'Veridia', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0581cb8a-1709-481f-8da0-2e8d9f586f2b', 3, null, 'Veridia', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '3066208a-ce43-4271-b1fe-249ab87fd4bf', 'ORION-S0120', 'FutureCode', 'futurecode', 'Kevin Harris', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'KEVINHARRIS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '3066208a-ce43-4271-b1fe-249ab87fd4bf', 'VERIFIED-ORION-S0120', 'Kevin Harris', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3066208a-ce43-4271-b1fe-249ab87fd4bf', 1, null, 'FutureCode', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3066208a-ce43-4271-b1fe-249ab87fd4bf', 2, null, 'FutureCode', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '133f81dd-ce07-4f70-b2b6-c325833038a9', 'ORION-S0121', 'Team trinity', 'teamtrinity', 'Sudharsan R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SUDHARSANR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '133f81dd-ce07-4f70-b2b6-c325833038a9', 'VERIFIED-ORION-S0121', 'Sudharsan R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '133f81dd-ce07-4f70-b2b6-c325833038a9', 1, null, 'Team trinity', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '133f81dd-ce07-4f70-b2b6-c325833038a9', 2, null, 'Team trinity', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '133f81dd-ce07-4f70-b2b6-c325833038a9', 3, null, 'Team trinity', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '133f81dd-ce07-4f70-b2b6-c325833038a9', 4, null, 'Team trinity', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '29a5c720-cd01-4f56-a60e-52ac4b98a51a', 'ORION-S0122', 'Byteforce', 'byteforce', 'Kishorekumar', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'KISHOREKUMAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '29a5c720-cd01-4f56-a60e-52ac4b98a51a', 'VERIFIED-ORION-S0122', 'Kishorekumar', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '29a5c720-cd01-4f56-a60e-52ac4b98a51a', 1, null, 'Byteforce', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '29a5c720-cd01-4f56-a60e-52ac4b98a51a', 2, null, 'Byteforce', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '29a5c720-cd01-4f56-a60e-52ac4b98a51a', 3, null, 'Byteforce', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '29a5c720-cd01-4f56-a60e-52ac4b98a51a', 4, null, 'Byteforce', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ba5277a8-2888-4fdf-a401-98921733760f', 'ORION-S0123', 'KNIGHT CODERS', 'knightcoders', 'Hareesh VN', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'HAREESHVN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ba5277a8-2888-4fdf-a401-98921733760f', 'VERIFIED-ORION-S0123', 'Hareesh VN', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba5277a8-2888-4fdf-a401-98921733760f', 1, null, 'KNIGHT CODERS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '45e2ae76-285e-4fcb-ab17-dac1b5318a3e', 'ORION-S0124', 'Hack Elite', 'hackelite', 'OMSAIVAMSI V', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'OMSAIVAMSIV',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '45e2ae76-285e-4fcb-ab17-dac1b5318a3e', 'VERIFIED-ORION-S0124', 'OMSAIVAMSI V', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '45e2ae76-285e-4fcb-ab17-dac1b5318a3e', 1, null, 'Hack Elite', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '45e2ae76-285e-4fcb-ab17-dac1b5318a3e', 2, null, 'Hack Elite', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4ca3bd39-2332-44f2-9275-aa9e74762579', 'ORION-S0125', 'Neural Ninjas', 'neuralninjas', 'Theshna R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'THESHNAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4ca3bd39-2332-44f2-9275-aa9e74762579', 'VERIFIED-ORION-S0125', 'Theshna R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4ca3bd39-2332-44f2-9275-aa9e74762579', 1, null, 'Neural Ninjas', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4ca3bd39-2332-44f2-9275-aa9e74762579', 2, null, 'Neural Ninjas', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4ca3bd39-2332-44f2-9275-aa9e74762579', 3, null, 'Neural Ninjas', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4ca3bd39-2332-44f2-9275-aa9e74762579', 4, null, 'Neural Ninjas', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '6c9731ef-b168-4201-92a9-f6f61305cfab', 'ORION-S0126', 'Astrivex', 'astrivex', 'Sree Harsana K K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SREEHARSANAKK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '6c9731ef-b168-4201-92a9-f6f61305cfab', 'VERIFIED-ORION-S0126', 'Sree Harsana K K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6c9731ef-b168-4201-92a9-f6f61305cfab', 1, null, 'Astrivex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6c9731ef-b168-4201-92a9-f6f61305cfab', 2, null, 'Astrivex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5ca0d9b4-5891-4234-bbeb-d84d5ea85b52', 'ORION-S0127', 'HEXAverse', 'hexaverse', 'Pooja Kumar', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'POOJAKUMAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5ca0d9b4-5891-4234-bbeb-d84d5ea85b52', 'VERIFIED-ORION-S0127', 'Pooja Kumar', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5ca0d9b4-5891-4234-bbeb-d84d5ea85b52', 1, null, 'HEXAverse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5ca0d9b4-5891-4234-bbeb-d84d5ea85b52', 2, null, 'HEXAverse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5ca0d9b4-5891-4234-bbeb-d84d5ea85b52', 3, null, 'HEXAverse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5ca0d9b4-5891-4234-bbeb-d84d5ea85b52', 4, null, 'HEXAverse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5ca0d9b4-5891-4234-bbeb-d84d5ea85b52', 5, null, 'HEXAverse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '99054e78-7b6a-47b0-87de-5dde02d5222d', 'ORION-S0128', 'Forged In Code', 'forgedincode', 'Hareeni Pavendan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'HAREENIPAVENDAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '99054e78-7b6a-47b0-87de-5dde02d5222d', 'VERIFIED-ORION-S0128', 'Hareeni Pavendan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '99054e78-7b6a-47b0-87de-5dde02d5222d', 1, null, 'Forged In Code', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '99054e78-7b6a-47b0-87de-5dde02d5222d', 2, null, 'Forged In Code', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '99054e78-7b6a-47b0-87de-5dde02d5222d', 3, null, 'Forged In Code', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '99054e78-7b6a-47b0-87de-5dde02d5222d', 4, null, 'Forged In Code', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '99054e78-7b6a-47b0-87de-5dde02d5222d', 5, null, 'Forged In Code', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f8cc55b3-d44f-4213-a86a-587422051c5e', 'ORION-S0129', 'Zoro', 'zoro', 'Gayathri.K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'GAYATHRIK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f8cc55b3-d44f-4213-a86a-587422051c5e', 'VERIFIED-ORION-S0129', 'Gayathri.K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f8cc55b3-d44f-4213-a86a-587422051c5e', 1, null, 'Zoro', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f8cc55b3-d44f-4213-a86a-587422051c5e', 2, null, 'Zoro', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f8cc55b3-d44f-4213-a86a-587422051c5e', 3, null, 'Zoro', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f8cc55b3-d44f-4213-a86a-587422051c5e', 4, null, 'Zoro', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f8cc55b3-d44f-4213-a86a-587422051c5e', 5, null, 'Zoro', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ba8a996d-d558-41d0-ab12-373c5d2afccb', 'ORION-S0130', 'Cyber Rookies', 'cyberrookies', 'Yuvaraj K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'YUVARAJK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ba8a996d-d558-41d0-ab12-373c5d2afccb', 'VERIFIED-ORION-S0130', 'Yuvaraj K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba8a996d-d558-41d0-ab12-373c5d2afccb', 1, null, 'Cyber Rookies', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba8a996d-d558-41d0-ab12-373c5d2afccb', 2, null, 'Cyber Rookies', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'bbbeb71d-ef21-4389-ac4d-14a260d71afc', 'ORION-S0131', 'Neuroforge', 'neuroforge', 'Hashvant S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'HASHVANTS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'bbbeb71d-ef21-4389-ac4d-14a260d71afc', 'VERIFIED-ORION-S0131', 'Hashvant S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bbbeb71d-ef21-4389-ac4d-14a260d71afc', 1, null, 'Neuroforge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bbbeb71d-ef21-4389-ac4d-14a260d71afc', 2, null, 'Neuroforge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bbbeb71d-ef21-4389-ac4d-14a260d71afc', 3, null, 'Neuroforge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bbbeb71d-ef21-4389-ac4d-14a260d71afc', 4, null, 'Neuroforge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bbbeb71d-ef21-4389-ac4d-14a260d71afc', 5, null, 'Neuroforge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'e610026e-5d64-49aa-8a8f-0c07cd9ba895', 'ORION-S0132', 'Varns', 'varns', 'A.Harshith', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'AHARSHITH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'e610026e-5d64-49aa-8a8f-0c07cd9ba895', 'VERIFIED-ORION-S0132', 'A.Harshith', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e610026e-5d64-49aa-8a8f-0c07cd9ba895', 1, null, 'Varns', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e610026e-5d64-49aa-8a8f-0c07cd9ba895', 2, null, 'Varns', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e610026e-5d64-49aa-8a8f-0c07cd9ba895', 3, null, 'Varns', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e610026e-5d64-49aa-8a8f-0c07cd9ba895', 4, null, 'Varns', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e610026e-5d64-49aa-8a8f-0c07cd9ba895', 5, null, 'Varns', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8988b32a-217f-4d18-99c3-38cfb52f7cc2', 'ORION-S0133', 'PHOENIX PROTOCOL', 'phoenixprotocol', 'SRI LAKSHMI V J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'SRILAKSHMIVJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8988b32a-217f-4d18-99c3-38cfb52f7cc2', 'VERIFIED-ORION-S0133', 'SRI LAKSHMI V J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8988b32a-217f-4d18-99c3-38cfb52f7cc2', 1, null, 'PHOENIX PROTOCOL', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8988b32a-217f-4d18-99c3-38cfb52f7cc2', 2, null, 'PHOENIX PROTOCOL', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8988b32a-217f-4d18-99c3-38cfb52f7cc2', 3, null, 'PHOENIX PROTOCOL', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8988b32a-217f-4d18-99c3-38cfb52f7cc2', 4, null, 'PHOENIX PROTOCOL', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8988b32a-217f-4d18-99c3-38cfb52f7cc2', 5, null, 'PHOENIX PROTOCOL', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b54b2d76-eb18-4e7e-b1ce-7c6b071f8f57', 'ORION-S0134', 'STRAW HATS', 'strawhats', 'Roshan Anto W', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'ROSHANANTOW',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b54b2d76-eb18-4e7e-b1ce-7c6b071f8f57', 'VERIFIED-ORION-S0134', 'Roshan Anto W', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b54b2d76-eb18-4e7e-b1ce-7c6b071f8f57', 1, null, 'STRAW HATS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b4548168-961f-4ac7-a053-0fb4d94eacd5', 'ORION-S0135', 'Tech Space', 'techspace', 'Saran S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'SARANS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b4548168-961f-4ac7-a053-0fb4d94eacd5', 'VERIFIED-ORION-S0135', 'Saran S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b4548168-961f-4ac7-a053-0fb4d94eacd5', 1, null, 'Tech Space', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b4548168-961f-4ac7-a053-0fb4d94eacd5', 2, null, 'Tech Space', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b4548168-961f-4ac7-a053-0fb4d94eacd5', 3, null, 'Tech Space', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b4548168-961f-4ac7-a053-0fb4d94eacd5', 4, null, 'Tech Space', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8114fe4a-b462-4971-a8b2-5efd14d3c8ba', 'ORION-S0136', 'Breaking Code', 'breakingcode', 'Isaac Jacksonraj J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'ISAACJACKSONRAJJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8114fe4a-b462-4971-a8b2-5efd14d3c8ba', 'VERIFIED-ORION-S0136', 'Isaac Jacksonraj J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8114fe4a-b462-4971-a8b2-5efd14d3c8ba', 1, null, 'Breaking Code', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8114fe4a-b462-4971-a8b2-5efd14d3c8ba', 2, null, 'Breaking Code', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8114fe4a-b462-4971-a8b2-5efd14d3c8ba', 3, null, 'Breaking Code', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8114fe4a-b462-4971-a8b2-5efd14d3c8ba', 4, null, 'Breaking Code', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '08899986-cc98-431d-8eae-450da4374136', 'ORION-S0137', 'Claxon AI', 'claxonai', 'SARRVESH J R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'SARRVESHJR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '08899986-cc98-431d-8eae-450da4374136', 'VERIFIED-ORION-S0137', 'SARRVESH J R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '08899986-cc98-431d-8eae-450da4374136', 1, null, 'Claxon AI', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '08899986-cc98-431d-8eae-450da4374136', 2, null, 'Claxon AI', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'caf115de-6702-4866-b708-42ebecf0c302', 'ORION-S0138', 'Project Hail Mary', 'projecthailmary', 'Dharani Karthikeyan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'DHARANIKARTHIKEYAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'caf115de-6702-4866-b708-42ebecf0c302', 'VERIFIED-ORION-S0138', 'Dharani Karthikeyan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'caf115de-6702-4866-b708-42ebecf0c302', 1, null, 'Project Hail Mary', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'caf115de-6702-4866-b708-42ebecf0c302', 2, null, 'Project Hail Mary', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'caf115de-6702-4866-b708-42ebecf0c302', 3, null, 'Project Hail Mary', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4f02aae2-8176-431b-bd54-fcaf1f99ae3e', 'ORION-S0139', 'HexaCore', 'hexacore', 'SACHIN G S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'SACHINGS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4f02aae2-8176-431b-bd54-fcaf1f99ae3e', 'VERIFIED-ORION-S0139', 'SACHIN G S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4f02aae2-8176-431b-bd54-fcaf1f99ae3e', 1, null, 'HexaCore', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4f02aae2-8176-431b-bd54-fcaf1f99ae3e', 2, null, 'HexaCore', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4f02aae2-8176-431b-bd54-fcaf1f99ae3e', 3, null, 'HexaCore', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4f02aae2-8176-431b-bd54-fcaf1f99ae3e', 4, null, 'HexaCore', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4f02aae2-8176-431b-bd54-fcaf1f99ae3e', 5, null, 'HexaCore', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '11798887-5e06-4c8e-bea1-08fcd9a2027e', 'ORION-S0140', 'PROTOTHON', 'protothon', 'BALIREDDI V V N S ABHISHEK', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'BALIREDDIVVNSABHISHEK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '11798887-5e06-4c8e-bea1-08fcd9a2027e', 'VERIFIED-ORION-S0140', 'BALIREDDI V V N S ABHISHEK', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '11798887-5e06-4c8e-bea1-08fcd9a2027e', 1, null, 'PROTOTHON', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'e12dc57d-c9f1-4698-a055-3785ba4f24a6', 'ORION-S0141', 'RunTime Error', 'runtimeerror', 'Charen', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'CHAREN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'e12dc57d-c9f1-4698-a055-3785ba4f24a6', 'VERIFIED-ORION-S0141', 'Charen', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e12dc57d-c9f1-4698-a055-3785ba4f24a6', 1, null, 'RunTime Error', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '7473b9bf-c0fe-4150-a357-673442472965', 'ORION-S0142', 'Hi-Tech', 'hitech', 'Irina Charis B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'IRINACHARISB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '7473b9bf-c0fe-4150-a357-673442472965', 'VERIFIED-ORION-S0142', 'Irina Charis B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7473b9bf-c0fe-4150-a357-673442472965', 1, null, 'Hi-Tech', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7473b9bf-c0fe-4150-a357-673442472965', 2, null, 'Hi-Tech', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7473b9bf-c0fe-4150-a357-673442472965', 3, null, 'Hi-Tech', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7473b9bf-c0fe-4150-a357-673442472965', 4, null, 'Hi-Tech', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8ceba7d9-926c-4dfc-ac3f-8391ca43ff6c', 'ORION-S0143', 'FineWorks', 'fineworks', 'Praveen Balaji G', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'PRAVEENBALAJIG',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8ceba7d9-926c-4dfc-ac3f-8391ca43ff6c', 'VERIFIED-ORION-S0143', 'Praveen Balaji G', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8ceba7d9-926c-4dfc-ac3f-8391ca43ff6c', 1, null, 'FineWorks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8ceba7d9-926c-4dfc-ac3f-8391ca43ff6c', 2, null, 'FineWorks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8ceba7d9-926c-4dfc-ac3f-8391ca43ff6c', 3, null, 'FineWorks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8ceba7d9-926c-4dfc-ac3f-8391ca43ff6c', 4, null, 'FineWorks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8ceba7d9-926c-4dfc-ac3f-8391ca43ff6c', 5, null, 'FineWorks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'e9fc1438-bf05-490c-b4dc-8a9d33cbff45', 'ORION-S0144', 'Rebellions', 'rebellions', 'Lokesh S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'LOKESHS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'e9fc1438-bf05-490c-b4dc-8a9d33cbff45', 'VERIFIED-ORION-S0144', 'Lokesh S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e9fc1438-bf05-490c-b4dc-8a9d33cbff45', 1, null, 'Rebellions', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e9fc1438-bf05-490c-b4dc-8a9d33cbff45', 2, null, 'Rebellions', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e9fc1438-bf05-490c-b4dc-8a9d33cbff45', 3, null, 'Rebellions', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e9fc1438-bf05-490c-b4dc-8a9d33cbff45', 4, null, 'Rebellions', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e9fc1438-bf05-490c-b4dc-8a9d33cbff45', 5, null, 'Rebellions', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'bf94b5b9-0c53-4347-b42f-a0e9ea4b0f4c', 'ORION-S0145', 'SylvaAI', 'sylvaai', 'Pooja S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'POOJAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'bf94b5b9-0c53-4347-b42f-a0e9ea4b0f4c', 'VERIFIED-ORION-S0145', 'Pooja S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bf94b5b9-0c53-4347-b42f-a0e9ea4b0f4c', 1, null, 'SylvaAI', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bf94b5b9-0c53-4347-b42f-a0e9ea4b0f4c', 2, null, 'SylvaAI', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bf94b5b9-0c53-4347-b42f-a0e9ea4b0f4c', 3, null, 'SylvaAI', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '65439029-1fcc-46eb-ba10-f8204989f73b', 'ORION-S0146', 'Tech Hackers', 'techhackers', 'DIVYA T', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'DIVYAT',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '65439029-1fcc-46eb-ba10-f8204989f73b', 'VERIFIED-ORION-S0146', 'DIVYA T', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '65439029-1fcc-46eb-ba10-f8204989f73b', 1, null, 'Tech Hackers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '65439029-1fcc-46eb-ba10-f8204989f73b', 2, null, 'Tech Hackers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '65439029-1fcc-46eb-ba10-f8204989f73b', 3, null, 'Tech Hackers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '65439029-1fcc-46eb-ba10-f8204989f73b', 4, null, 'Tech Hackers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '65439029-1fcc-46eb-ba10-f8204989f73b', 5, null, 'Tech Hackers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '3b03da2b-5689-4016-88b4-1629e71cd781', 'ORION-S0147', 'Code Charms', 'codecharms', 'Elakkiya.R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'ELAKKIYAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '3b03da2b-5689-4016-88b4-1629e71cd781', 'VERIFIED-ORION-S0147', 'Elakkiya.R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3b03da2b-5689-4016-88b4-1629e71cd781', 1, null, 'Code Charms', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3b03da2b-5689-4016-88b4-1629e71cd781', 2, null, 'Code Charms', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3b03da2b-5689-4016-88b4-1629e71cd781', 3, null, 'Code Charms', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3b03da2b-5689-4016-88b4-1629e71cd781', 4, null, 'Code Charms', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3b03da2b-5689-4016-88b4-1629e71cd781', 5, null, 'Code Charms', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5e6f6e00-b63a-4288-aae5-3626bbdfa9e2', 'ORION-S0148', 'Voro', 'voro', 'Lalith Aditiya T A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'LALITHADITIYATA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5e6f6e00-b63a-4288-aae5-3626bbdfa9e2', 'VERIFIED-ORION-S0148', 'Lalith Aditiya T A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5e6f6e00-b63a-4288-aae5-3626bbdfa9e2', 1, null, 'Voro', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5e6f6e00-b63a-4288-aae5-3626bbdfa9e2', 2, null, 'Voro', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5e6f6e00-b63a-4288-aae5-3626bbdfa9e2', 3, null, 'Voro', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5e6f6e00-b63a-4288-aae5-3626bbdfa9e2', 4, null, 'Voro', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5e6f6e00-b63a-4288-aae5-3626bbdfa9e2', 5, null, 'Voro', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '6036d05e-c167-4f65-afe1-8f14d1f98209', 'ORION-S0149', 'Mesh Minds', 'meshminds', 'Tejasvini S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'TEJASVINIS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '6036d05e-c167-4f65-afe1-8f14d1f98209', 'VERIFIED-ORION-S0149', 'Tejasvini S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6036d05e-c167-4f65-afe1-8f14d1f98209', 1, null, 'Mesh Minds', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6036d05e-c167-4f65-afe1-8f14d1f98209', 2, null, 'Mesh Minds', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6036d05e-c167-4f65-afe1-8f14d1f98209', 3, null, 'Mesh Minds', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6036d05e-c167-4f65-afe1-8f14d1f98209', 4, null, 'Mesh Minds', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6036d05e-c167-4f65-afe1-8f14d1f98209', 5, null, 'Mesh Minds', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '59b7b29e-6fa2-45a6-a2d8-0dd66760b968', 'ORION-S0150', 'NexQ', 'nexq', 'Ananya Sridhar', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'ANANYASRIDHAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '59b7b29e-6fa2-45a6-a2d8-0dd66760b968', 'VERIFIED-ORION-S0150', 'Ananya Sridhar', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '59b7b29e-6fa2-45a6-a2d8-0dd66760b968', 1, null, 'NexQ', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '59b7b29e-6fa2-45a6-a2d8-0dd66760b968', 2, null, 'NexQ', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '59b7b29e-6fa2-45a6-a2d8-0dd66760b968', 3, null, 'NexQ', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8df83eb0-fb39-4e55-9500-9b8db9113752', 'ORION-S0151', 'DoomCoders', 'doomcoders', 'C Balaji Mohan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'CBALAJIMOHAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8df83eb0-fb39-4e55-9500-9b8db9113752', 'VERIFIED-ORION-S0151', 'C Balaji Mohan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8df83eb0-fb39-4e55-9500-9b8db9113752', 1, null, 'DoomCoders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8df83eb0-fb39-4e55-9500-9b8db9113752', 2, null, 'DoomCoders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8df83eb0-fb39-4e55-9500-9b8db9113752', 3, null, 'DoomCoders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8df83eb0-fb39-4e55-9500-9b8db9113752', 4, null, 'DoomCoders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'caca9c85-3e5e-423f-8be3-7f3e8a94e35f', 'ORION-S0152', 'Tech Titans', 'techtitans', 'R R Jaiwanth', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'RRJAIWANTH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'caca9c85-3e5e-423f-8be3-7f3e8a94e35f', 'VERIFIED-ORION-S0152', 'R R Jaiwanth', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'caca9c85-3e5e-423f-8be3-7f3e8a94e35f', 1, null, 'Tech Titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'caca9c85-3e5e-423f-8be3-7f3e8a94e35f', 2, null, 'Tech Titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'caca9c85-3e5e-423f-8be3-7f3e8a94e35f', 3, null, 'Tech Titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'caca9c85-3e5e-423f-8be3-7f3e8a94e35f', 4, null, 'Tech Titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'caca9c85-3e5e-423f-8be3-7f3e8a94e35f', 5, null, 'Tech Titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5eef80db-0ffc-4fdc-a5fe-4d54ded94571', 'ORION-S0153', 'TechCode', 'techcode', 'Devipriya B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'DEVIPRIYAB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5eef80db-0ffc-4fdc-a5fe-4d54ded94571', 'VERIFIED-ORION-S0153', 'Devipriya B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5eef80db-0ffc-4fdc-a5fe-4d54ded94571', 1, null, 'TechCode', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5eef80db-0ffc-4fdc-a5fe-4d54ded94571', 2, null, 'TechCode', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5eef80db-0ffc-4fdc-a5fe-4d54ded94571', 3, null, 'TechCode', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0c82ff93-66d5-4934-85e0-8977c8255ed9', 'ORION-S0154', 'MotwaGuard', 'motwaguard', 'Monica V', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'MONICAV',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0c82ff93-66d5-4934-85e0-8977c8255ed9', 'VERIFIED-ORION-S0154', 'Monica V', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c82ff93-66d5-4934-85e0-8977c8255ed9', 1, null, 'MotwaGuard', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c82ff93-66d5-4934-85e0-8977c8255ed9', 2, null, 'MotwaGuard', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c82ff93-66d5-4934-85e0-8977c8255ed9', 3, null, 'MotwaGuard', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c82ff93-66d5-4934-85e0-8977c8255ed9', 4, null, 'MotwaGuard', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c82ff93-66d5-4934-85e0-8977c8255ed9', 5, null, 'MotwaGuard', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd4abf8e4-6a89-444d-9e7f-b8d3532109c6', 'ORION-S0155', 'StarByte', 'starbyte', 'Jaidev S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'JAIDEVS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd4abf8e4-6a89-444d-9e7f-b8d3532109c6', 'VERIFIED-ORION-S0155', 'Jaidev S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd4abf8e4-6a89-444d-9e7f-b8d3532109c6', 1, null, 'StarByte', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd4abf8e4-6a89-444d-9e7f-b8d3532109c6', 2, null, 'StarByte', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '79c35f6a-8a55-44a4-9b9e-5cc4f0c560ed', 'ORION-S0156', 'O[1]', 'o1', 'M. Shirish', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'MSHIRISH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '79c35f6a-8a55-44a4-9b9e-5cc4f0c560ed', 'VERIFIED-ORION-S0156', 'M. Shirish', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '79c35f6a-8a55-44a4-9b9e-5cc4f0c560ed', 1, null, 'O[1]', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '79c35f6a-8a55-44a4-9b9e-5cc4f0c560ed', 2, null, 'O[1]', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '79c35f6a-8a55-44a4-9b9e-5cc4f0c560ed', 3, null, 'O[1]', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '79c35f6a-8a55-44a4-9b9e-5cc4f0c560ed', 4, null, 'O[1]', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c366edac-4b12-40b2-b608-f43679e23466', 'ORION-S0157', 'Astralis', 'astralis', 'yaathesh', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'YAATHESH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c366edac-4b12-40b2-b608-f43679e23466', 'VERIFIED-ORION-S0157', 'yaathesh', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c366edac-4b12-40b2-b608-f43679e23466', 1, null, 'Astralis', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c366edac-4b12-40b2-b608-f43679e23466', 2, null, 'Astralis', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c366edac-4b12-40b2-b608-f43679e23466', 3, null, 'Astralis', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '7162c41c-d6e9-4bfd-850a-4efe78d68f3e', 'ORION-S0158', 'Mindsprint', 'mindsprint', 'Frezha Angeline A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'FREZHAANGELINEA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '7162c41c-d6e9-4bfd-850a-4efe78d68f3e', 'VERIFIED-ORION-S0158', 'Frezha Angeline A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7162c41c-d6e9-4bfd-850a-4efe78d68f3e', 1, null, 'Mindsprint', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7162c41c-d6e9-4bfd-850a-4efe78d68f3e', 2, null, 'Mindsprint', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7162c41c-d6e9-4bfd-850a-4efe78d68f3e', 3, null, 'Mindsprint', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7162c41c-d6e9-4bfd-850a-4efe78d68f3e', 4, null, 'Mindsprint', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f76e84ed-2261-49a4-b657-2710e0eb351e', 'ORION-S0159', 'Technocrats', 'technocrats', 'Gunanithi M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'GUNANITHIM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f76e84ed-2261-49a4-b657-2710e0eb351e', 'VERIFIED-ORION-S0159', 'Gunanithi M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f76e84ed-2261-49a4-b657-2710e0eb351e', 1, null, 'Technocrats', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f76e84ed-2261-49a4-b657-2710e0eb351e', 2, null, 'Technocrats', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f76e84ed-2261-49a4-b657-2710e0eb351e', 3, null, 'Technocrats', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f76e84ed-2261-49a4-b657-2710e0eb351e', 4, null, 'Technocrats', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f52edf46-c4cf-452b-89fc-0d0f4f87e46a', 'ORION-S0160', 'ProofForge', 'proofforge', 'Jerlin Goldia.J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'JERLINGOLDIAJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f52edf46-c4cf-452b-89fc-0d0f4f87e46a', 'VERIFIED-ORION-S0160', 'Jerlin Goldia.J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f52edf46-c4cf-452b-89fc-0d0f4f87e46a', 1, null, 'ProofForge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f52edf46-c4cf-452b-89fc-0d0f4f87e46a', 2, null, 'ProofForge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '77ca493b-cf49-422d-8f1f-df505a2c0f4d', 'ORION-S0162', 'avengers codesday', 'avengerscodesday', 'M J Dhurgesh', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'MJDHURGESH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '77ca493b-cf49-422d-8f1f-df505a2c0f4d', 'VERIFIED-ORION-S0162', 'M J Dhurgesh', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '77ca493b-cf49-422d-8f1f-df505a2c0f4d', 1, null, 'avengers codesday', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '77ca493b-cf49-422d-8f1f-df505a2c0f4d', 2, null, 'avengers codesday', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '77ca493b-cf49-422d-8f1f-df505a2c0f4d', 3, null, 'avengers codesday', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '77ca493b-cf49-422d-8f1f-df505a2c0f4d', 4, null, 'avengers codesday', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '77ca493b-cf49-422d-8f1f-df505a2c0f4d', 5, null, 'avengers codesday', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '1918fae5-0224-4c05-96ff-589ccab68d8b', 'ORION-S0163', 'NOVERA', 'novera', 'SUDHARSAN B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'SUDHARSANB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '1918fae5-0224-4c05-96ff-589ccab68d8b', 'VERIFIED-ORION-S0163', 'SUDHARSAN B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1918fae5-0224-4c05-96ff-589ccab68d8b', 1, null, 'NOVERA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1918fae5-0224-4c05-96ff-589ccab68d8b', 2, null, 'NOVERA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1918fae5-0224-4c05-96ff-589ccab68d8b', 3, null, 'NOVERA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1918fae5-0224-4c05-96ff-589ccab68d8b', 4, null, 'NOVERA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1918fae5-0224-4c05-96ff-589ccab68d8b', 5, null, 'NOVERA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '472ce158-0d6e-4257-8ad8-6cf1797940ba', 'ORION-S0164', 'Clarabella', 'clarabella', 'K SHALINI', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'KSHALINI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '472ce158-0d6e-4257-8ad8-6cf1797940ba', 'VERIFIED-ORION-S0164', 'K SHALINI', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '472ce158-0d6e-4257-8ad8-6cf1797940ba', 1, null, 'Clarabella', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '472ce158-0d6e-4257-8ad8-6cf1797940ba', 2, null, 'Clarabella', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '472ce158-0d6e-4257-8ad8-6cf1797940ba', 3, null, 'Clarabella', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '472ce158-0d6e-4257-8ad8-6cf1797940ba', 4, null, 'Clarabella', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '472ce158-0d6e-4257-8ad8-6cf1797940ba', 5, null, 'Clarabella', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4267a93b-6049-44e7-ad2f-6570053f1592', 'ORION-S0165', 'DR DOOM', 'drdoom', 'KRITHIKAA B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'KRITHIKAAB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4267a93b-6049-44e7-ad2f-6570053f1592', 'VERIFIED-ORION-S0165', 'KRITHIKAA B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4267a93b-6049-44e7-ad2f-6570053f1592', 1, null, 'DR DOOM', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4267a93b-6049-44e7-ad2f-6570053f1592', 2, null, 'DR DOOM', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4267a93b-6049-44e7-ad2f-6570053f1592', 3, null, 'DR DOOM', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'bf01a147-be80-4666-9c2c-dc883d1ec8ca', 'ORION-S0166', 'CODE CRACKERS', 'codecrackers', 'Monish R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'MONISHR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'bf01a147-be80-4666-9c2c-dc883d1ec8ca', 'VERIFIED-ORION-S0166', 'Monish R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bf01a147-be80-4666-9c2c-dc883d1ec8ca', 1, null, 'CODE CRACKERS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bf01a147-be80-4666-9c2c-dc883d1ec8ca', 2, null, 'CODE CRACKERS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bf01a147-be80-4666-9c2c-dc883d1ec8ca', 3, null, 'CODE CRACKERS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bf01a147-be80-4666-9c2c-dc883d1ec8ca', 4, null, 'CODE CRACKERS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bf01a147-be80-4666-9c2c-dc883d1ec8ca', 5, null, 'CODE CRACKERS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'da47f9cd-d924-46c4-8fc3-4d9b238b7d06', 'ORION-S0167', 'GAITHUB', 'gaithub', 'Santosh Raghavendra Y S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SANTOSHRAGHAVENDRAYS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'da47f9cd-d924-46c4-8fc3-4d9b238b7d06', 'VERIFIED-ORION-S0167', 'Santosh Raghavendra Y S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'da47f9cd-d924-46c4-8fc3-4d9b238b7d06', 1, null, 'GAITHUB', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'da47f9cd-d924-46c4-8fc3-4d9b238b7d06', 2, null, 'GAITHUB', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'da47f9cd-d924-46c4-8fc3-4d9b238b7d06', 3, null, 'GAITHUB', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'da47f9cd-d924-46c4-8fc3-4d9b238b7d06', 4, null, 'GAITHUB', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'da47f9cd-d924-46c4-8fc3-4d9b238b7d06', 5, null, 'GAITHUB', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0d6982ac-2fef-4840-b2bf-ca6b9d632ac5', 'ORION-S0168', 'NOVATRIX', 'novatrix', 'PRAVEEN KUMAR M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'PRAVEENKUMARM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0d6982ac-2fef-4840-b2bf-ca6b9d632ac5', 'VERIFIED-ORION-S0168', 'PRAVEEN KUMAR M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0d6982ac-2fef-4840-b2bf-ca6b9d632ac5', 1, null, 'NOVATRIX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0d6982ac-2fef-4840-b2bf-ca6b9d632ac5', 2, null, 'NOVATRIX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0d6982ac-2fef-4840-b2bf-ca6b9d632ac5', 3, null, 'NOVATRIX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0d6982ac-2fef-4840-b2bf-ca6b9d632ac5', 4, null, 'NOVATRIX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0d6982ac-2fef-4840-b2bf-ca6b9d632ac5', 5, null, 'NOVATRIX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '017cf0e7-4c03-472a-89ae-e2599a21d6c4', 'ORION-S0169', 'Hack Aspirants', 'hackaspirants', 'keerthaesh kumar M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'KEERTHAESHKUMARM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '017cf0e7-4c03-472a-89ae-e2599a21d6c4', 'VERIFIED-ORION-S0169', 'keerthaesh kumar M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '017cf0e7-4c03-472a-89ae-e2599a21d6c4', 1, null, 'Hack Aspirants', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '017cf0e7-4c03-472a-89ae-e2599a21d6c4', 2, null, 'Hack Aspirants', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '017cf0e7-4c03-472a-89ae-e2599a21d6c4', 3, null, 'Hack Aspirants', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd8acaff6-9328-4ec5-b7f4-f4692e6c77fa', 'ORION-S0170', 'Bhairav', 'bhairav', 'Vinish Vinoth', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'VINISHVINOTH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd8acaff6-9328-4ec5-b7f4-f4692e6c77fa', 'VERIFIED-ORION-S0170', 'Vinish Vinoth', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd8acaff6-9328-4ec5-b7f4-f4692e6c77fa', 1, null, 'Bhairav', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd8acaff6-9328-4ec5-b7f4-f4692e6c77fa', 2, null, 'Bhairav', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd8acaff6-9328-4ec5-b7f4-f4692e6c77fa', 3, null, 'Bhairav', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd8acaff6-9328-4ec5-b7f4-f4692e6c77fa', 4, null, 'Bhairav', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd8acaff6-9328-4ec5-b7f4-f4692e6c77fa', 5, null, 'Bhairav', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'e908bdf9-5d61-45f3-bbdd-a08d46f702a0', 'ORION-S0171', 'Change Making engineers', 'changemakingengineers', 'Suthakar P', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SUTHAKARP',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'e908bdf9-5d61-45f3-bbdd-a08d46f702a0', 'VERIFIED-ORION-S0171', 'Suthakar P', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e908bdf9-5d61-45f3-bbdd-a08d46f702a0', 1, null, 'Change Making engineers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e908bdf9-5d61-45f3-bbdd-a08d46f702a0', 2, null, 'Change Making engineers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e908bdf9-5d61-45f3-bbdd-a08d46f702a0', 3, null, 'Change Making engineers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e908bdf9-5d61-45f3-bbdd-a08d46f702a0', 4, null, 'Change Making engineers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0c26364b-b59f-462d-b31d-6d13a75796ac', 'ORION-S0172', 'FastLane Devs', 'fastlanedevs', 'K.Harshith', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'KHARSHITH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0c26364b-b59f-462d-b31d-6d13a75796ac', 'VERIFIED-ORION-S0172', 'K.Harshith', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c26364b-b59f-462d-b31d-6d13a75796ac', 1, null, 'FastLane Devs', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c26364b-b59f-462d-b31d-6d13a75796ac', 2, null, 'FastLane Devs', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c26364b-b59f-462d-b31d-6d13a75796ac', 3, null, 'FastLane Devs', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c26364b-b59f-462d-b31d-6d13a75796ac', 4, null, 'FastLane Devs', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c26364b-b59f-462d-b31d-6d13a75796ac', 5, null, 'FastLane Devs', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '20133bce-4aea-481e-9b59-e81c24f84295', 'ORION-S0173', 'Crypto knights', 'cryptoknights', 'Udhaya Raghavi S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'UDHAYARAGHAVIS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '20133bce-4aea-481e-9b59-e81c24f84295', 'VERIFIED-ORION-S0173', 'Udhaya Raghavi S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '20133bce-4aea-481e-9b59-e81c24f84295', 1, null, 'Crypto knights', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '20133bce-4aea-481e-9b59-e81c24f84295', 2, null, 'Crypto knights', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '20133bce-4aea-481e-9b59-e81c24f84295', 3, null, 'Crypto knights', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '20133bce-4aea-481e-9b59-e81c24f84295', 4, null, 'Crypto knights', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '20133bce-4aea-481e-9b59-e81c24f84295', 5, null, 'Crypto knights', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '03afc782-6f24-474b-8938-646e9710aab1', 'ORION-S0174', 'Techno sist', 'technosist', 'Aathimaduran. S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'AATHIMADURANS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '03afc782-6f24-474b-8938-646e9710aab1', 'VERIFIED-ORION-S0174', 'Aathimaduran. S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '03afc782-6f24-474b-8938-646e9710aab1', 1, null, 'Techno sist', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '03afc782-6f24-474b-8938-646e9710aab1', 2, null, 'Techno sist', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '03afc782-6f24-474b-8938-646e9710aab1', 3, null, 'Techno sist', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'df72d3f6-8758-44f9-b89d-9779f9e64b30', 'ORION-S0175', 'MADMAXX', 'madmaxx', 'Abinandhana A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'ABINANDHANAA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'df72d3f6-8758-44f9-b89d-9779f9e64b30', 'VERIFIED-ORION-S0175', 'Abinandhana A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'df72d3f6-8758-44f9-b89d-9779f9e64b30', 1, null, 'MADMAXX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'df72d3f6-8758-44f9-b89d-9779f9e64b30', 2, null, 'MADMAXX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'df72d3f6-8758-44f9-b89d-9779f9e64b30', 3, null, 'MADMAXX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'df72d3f6-8758-44f9-b89d-9779f9e64b30', 4, null, 'MADMAXX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'df72d3f6-8758-44f9-b89d-9779f9e64b30', 5, null, 'MADMAXX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '7d0a7eb4-00af-451d-87fa-fde1ece4da8a', 'ORION-S0176', 'VIBRANT', 'vibrant', 'HARIHARAN D', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'HARIHARAND',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '7d0a7eb4-00af-451d-87fa-fde1ece4da8a', 'VERIFIED-ORION-S0176', 'HARIHARAN D', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7d0a7eb4-00af-451d-87fa-fde1ece4da8a', 1, null, 'VIBRANT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7d0a7eb4-00af-451d-87fa-fde1ece4da8a', 2, null, 'VIBRANT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7d0a7eb4-00af-451d-87fa-fde1ece4da8a', 3, null, 'VIBRANT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7d0a7eb4-00af-451d-87fa-fde1ece4da8a', 4, null, 'VIBRANT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7d0a7eb4-00af-451d-87fa-fde1ece4da8a', 5, null, 'VIBRANT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '81690aad-37aa-4467-aead-aab03835720f', 'ORION-S0177', 'Team swam', 'teamswam', 'Yamini. S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'YAMINIS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '81690aad-37aa-4467-aead-aab03835720f', 'VERIFIED-ORION-S0177', 'Yamini. S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '81690aad-37aa-4467-aead-aab03835720f', 1, null, 'Team swam', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '81690aad-37aa-4467-aead-aab03835720f', 2, null, 'Team swam', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '81690aad-37aa-4467-aead-aab03835720f', 3, null, 'Team swam', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '81690aad-37aa-4467-aead-aab03835720f', 4, null, 'Team swam', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '81690aad-37aa-4467-aead-aab03835720f', 5, null, 'Team swam', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c3961de9-b552-41ec-856b-dce8f0b85ee1', 'ORION-S0178', 'Null exceptions', 'nullexceptions', 'S MONIKA', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'SMONIKA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c3961de9-b552-41ec-856b-dce8f0b85ee1', 'VERIFIED-ORION-S0178', 'S MONIKA', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c3961de9-b552-41ec-856b-dce8f0b85ee1', 1, null, 'Null exceptions', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c3961de9-b552-41ec-856b-dce8f0b85ee1', 2, null, 'Null exceptions', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c3961de9-b552-41ec-856b-dce8f0b85ee1', 3, null, 'Null exceptions', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c3961de9-b552-41ec-856b-dce8f0b85ee1', 4, null, 'Null exceptions', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c3961de9-b552-41ec-856b-dce8f0b85ee1', 5, null, 'Null exceptions', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5fc786a6-0478-42e6-847c-8b83dc2febb0', 'ORION-S0179', 'CODECREW', 'codecrew', 'Nithiya Sri G', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'NITHIYASRIG',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5fc786a6-0478-42e6-847c-8b83dc2febb0', 'VERIFIED-ORION-S0179', 'Nithiya Sri G', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5fc786a6-0478-42e6-847c-8b83dc2febb0', 1, null, 'CODECREW', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5fc786a6-0478-42e6-847c-8b83dc2febb0', 2, null, 'CODECREW', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5fc786a6-0478-42e6-847c-8b83dc2febb0', 3, null, 'CODECREW', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5fc786a6-0478-42e6-847c-8b83dc2febb0', 4, null, 'CODECREW', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd0181de7-10fe-498f-b00f-4c08a7d67ce1', 'ORION-S0180', 'cyber crew', 'cybercrew', 'Lithesh B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'LITHESHB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd0181de7-10fe-498f-b00f-4c08a7d67ce1', 'VERIFIED-ORION-S0180', 'Lithesh B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd0181de7-10fe-498f-b00f-4c08a7d67ce1', 1, null, 'cyber crew', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd0181de7-10fe-498f-b00f-4c08a7d67ce1', 2, null, 'cyber crew', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd0181de7-10fe-498f-b00f-4c08a7d67ce1', 3, null, 'cyber crew', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd0181de7-10fe-498f-b00f-4c08a7d67ce1', 4, null, 'cyber crew', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '48f93678-d90a-4871-b5b9-069e7a9a885a', 'ORION-S0181', 'Techaura', 'techaura', 'Harini A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'HARINIA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '48f93678-d90a-4871-b5b9-069e7a9a885a', 'VERIFIED-ORION-S0181', 'Harini A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '48f93678-d90a-4871-b5b9-069e7a9a885a', 1, null, 'Techaura', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '48f93678-d90a-4871-b5b9-069e7a9a885a', 2, null, 'Techaura', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '48f93678-d90a-4871-b5b9-069e7a9a885a', 3, null, 'Techaura', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'cd79878f-1bd4-47c6-8e8e-22e1a7f32d6d', 'ORION-S0182', 'Phoenix coders', 'phoenixcoders', 'Sameer C', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SAMEERC',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'cd79878f-1bd4-47c6-8e8e-22e1a7f32d6d', 'VERIFIED-ORION-S0182', 'Sameer C', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cd79878f-1bd4-47c6-8e8e-22e1a7f32d6d', 1, null, 'Phoenix coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cd79878f-1bd4-47c6-8e8e-22e1a7f32d6d', 2, null, 'Phoenix coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cd79878f-1bd4-47c6-8e8e-22e1a7f32d6d', 3, null, 'Phoenix coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cd79878f-1bd4-47c6-8e8e-22e1a7f32d6d', 4, null, 'Phoenix coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'cd79878f-1bd4-47c6-8e8e-22e1a7f32d6d', 5, null, 'Phoenix coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ab33410a-e3c7-4f5f-bcf9-dd9edd90699d', 'ORION-S0183', '_ENDEAVOUR_', 'endeavour', 'RAGHUL T', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'RAGHULT',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ab33410a-e3c7-4f5f-bcf9-dd9edd90699d', 'VERIFIED-ORION-S0183', 'RAGHUL T', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ab33410a-e3c7-4f5f-bcf9-dd9edd90699d', 1, null, '_ENDEAVOUR_', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ab33410a-e3c7-4f5f-bcf9-dd9edd90699d', 2, null, '_ENDEAVOUR_', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ab33410a-e3c7-4f5f-bcf9-dd9edd90699d', 3, null, '_ENDEAVOUR_', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ab33410a-e3c7-4f5f-bcf9-dd9edd90699d', 4, null, '_ENDEAVOUR_', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ab33410a-e3c7-4f5f-bcf9-dd9edd90699d', 5, null, '_ENDEAVOUR_', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '15f8726e-80a9-49a8-afb8-f9f807a43825', 'ORION-S0184', 'Compilers', 'compilers', 'Sasikumar S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SASIKUMARS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '15f8726e-80a9-49a8-afb8-f9f807a43825', 'VERIFIED-ORION-S0184', 'Sasikumar S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '15f8726e-80a9-49a8-afb8-f9f807a43825', 1, null, 'Compilers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '15f8726e-80a9-49a8-afb8-f9f807a43825', 2, null, 'Compilers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '15f8726e-80a9-49a8-afb8-f9f807a43825', 3, null, 'Compilers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '15f8726e-80a9-49a8-afb8-f9f807a43825', 4, null, 'Compilers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '15f8726e-80a9-49a8-afb8-f9f807a43825', 5, null, 'Compilers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4ea41376-cac3-4884-b836-150ec44da92f', 'ORION-S0185', 'Codespark', 'codespark', 'Keerthana K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'KEERTHANAK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4ea41376-cac3-4884-b836-150ec44da92f', 'VERIFIED-ORION-S0185', 'Keerthana K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4ea41376-cac3-4884-b836-150ec44da92f', 1, null, 'Codespark', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4ea41376-cac3-4884-b836-150ec44da92f', 2, null, 'Codespark', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4ea41376-cac3-4884-b836-150ec44da92f', 3, null, 'Codespark', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f0811e6f-c98d-4ae8-9f8e-aca714a71df7', 'ORION-S0186', 'Espiron', 'espiron', 'Vishhwa vasudevan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'VISHHWAVASUDEVAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f0811e6f-c98d-4ae8-9f8e-aca714a71df7', 'VERIFIED-ORION-S0186', 'Vishhwa vasudevan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f0811e6f-c98d-4ae8-9f8e-aca714a71df7', 1, null, 'Espiron', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f0811e6f-c98d-4ae8-9f8e-aca714a71df7', 2, null, 'Espiron', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f0811e6f-c98d-4ae8-9f8e-aca714a71df7', 3, null, 'Espiron', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f0811e6f-c98d-4ae8-9f8e-aca714a71df7', 4, null, 'Espiron', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '64b0b11a-c616-48fb-831f-8269eb5515c8', 'ORION-S0187', 'Sleepless Knight', 'sleeplessknight', 'Lynton Oreb', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'LYNTONOREB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '64b0b11a-c616-48fb-831f-8269eb5515c8', 'VERIFIED-ORION-S0187', 'Lynton Oreb', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '64b0b11a-c616-48fb-831f-8269eb5515c8', 1, null, 'Sleepless Knight', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '64b0b11a-c616-48fb-831f-8269eb5515c8', 2, null, 'Sleepless Knight', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '64b0b11a-c616-48fb-831f-8269eb5515c8', 3, null, 'Sleepless Knight', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '64b0b11a-c616-48fb-831f-8269eb5515c8', 4, null, 'Sleepless Knight', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd85f6f25-1808-47f7-ac07-947519e72b1a', 'ORION-S0188', 'NexGen', 'nexgen', 'ERIN RAICHEAL JUVENAL', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'ERINRAICHEALJUVENAL',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd85f6f25-1808-47f7-ac07-947519e72b1a', 'VERIFIED-ORION-S0188', 'ERIN RAICHEAL JUVENAL', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd85f6f25-1808-47f7-ac07-947519e72b1a', 1, null, 'NexGen', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd85f6f25-1808-47f7-ac07-947519e72b1a', 2, null, 'NexGen', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd85f6f25-1808-47f7-ac07-947519e72b1a', 3, null, 'NexGen', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd85f6f25-1808-47f7-ac07-947519e72b1a', 4, null, 'NexGen', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '1f5df595-ba04-48e8-9e6b-438f056d1076', 'ORION-S0189', 'B NIRANJAN', 'bniranjan', 'NIRANJAN', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'NIRANJAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '1f5df595-ba04-48e8-9e6b-438f056d1076', 'VERIFIED-ORION-S0189', 'NIRANJAN', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1f5df595-ba04-48e8-9e6b-438f056d1076', 1, null, 'B NIRANJAN', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1f5df595-ba04-48e8-9e6b-438f056d1076', 2, null, 'B NIRANJAN', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1f5df595-ba04-48e8-9e6b-438f056d1076', 3, null, 'B NIRANJAN', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1f5df595-ba04-48e8-9e6b-438f056d1076', 4, null, 'B NIRANJAN', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '3b6f293f-40a5-4bd5-8a98-c92cbeadee2d', 'ORION-S0190', 'ARIV — AI & Research Innovators with Vision', 'arivairesearchinnovatorswithvision', 'SHAPTHAGIRI G', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SHAPTHAGIRIG',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '3b6f293f-40a5-4bd5-8a98-c92cbeadee2d', 'VERIFIED-ORION-S0190', 'SHAPTHAGIRI G', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3b6f293f-40a5-4bd5-8a98-c92cbeadee2d', 1, null, 'ARIV — AI & Research Innovators with Vision', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3b6f293f-40a5-4bd5-8a98-c92cbeadee2d', 2, null, 'ARIV — AI & Research Innovators with Vision', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3b6f293f-40a5-4bd5-8a98-c92cbeadee2d', 3, null, 'ARIV — AI & Research Innovators with Vision', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3b6f293f-40a5-4bd5-8a98-c92cbeadee2d', 4, null, 'ARIV — AI & Research Innovators with Vision', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3b6f293f-40a5-4bd5-8a98-c92cbeadee2d', 5, null, 'ARIV — AI & Research Innovators with Vision', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '9bc245ed-da75-454b-bd9c-e883cdac9704', 'ORION-S0191', 'Bytebros', 'bytebros', 'Santhosh S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SANTHOSHS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '9bc245ed-da75-454b-bd9c-e883cdac9704', 'VERIFIED-ORION-S0191', 'Santhosh S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9bc245ed-da75-454b-bd9c-e883cdac9704', 1, null, 'Bytebros', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9bc245ed-da75-454b-bd9c-e883cdac9704', 2, null, 'Bytebros', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9bc245ed-da75-454b-bd9c-e883cdac9704', 3, null, 'Bytebros', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9bc245ed-da75-454b-bd9c-e883cdac9704', 4, null, 'Bytebros', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4aa92871-621f-4dd9-9e46-b7610b78bf2e', 'ORION-S0192', 'NextGen Innovators', 'nextgeninnovators', 'Yazhini SP', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'YAZHINISP',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4aa92871-621f-4dd9-9e46-b7610b78bf2e', 'VERIFIED-ORION-S0192', 'Yazhini SP', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4aa92871-621f-4dd9-9e46-b7610b78bf2e', 1, null, 'NextGen Innovators', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4aa92871-621f-4dd9-9e46-b7610b78bf2e', 2, null, 'NextGen Innovators', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4aa92871-621f-4dd9-9e46-b7610b78bf2e', 3, null, 'NextGen Innovators', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4aa92871-621f-4dd9-9e46-b7610b78bf2e', 4, null, 'NextGen Innovators', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4aa92871-621f-4dd9-9e46-b7610b78bf2e', 5, null, 'NextGen Innovators', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '90bf0657-8e59-465e-8535-34724aa5fdad', 'ORION-S0193', 'TEAM VOID', 'teamvoid', 'Antony Xavier J M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'ANTONYXAVIERJM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '90bf0657-8e59-465e-8535-34724aa5fdad', 'VERIFIED-ORION-S0193', 'Antony Xavier J M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '90bf0657-8e59-465e-8535-34724aa5fdad', 1, null, 'TEAM VOID', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '90bf0657-8e59-465e-8535-34724aa5fdad', 2, null, 'TEAM VOID', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '90bf0657-8e59-465e-8535-34724aa5fdad', 3, null, 'TEAM VOID', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '90bf0657-8e59-465e-8535-34724aa5fdad', 4, null, 'TEAM VOID', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b240a54c-c2de-4823-8a7d-2e361340c145', 'ORION-S0194', 'alpha safety', 'alphasafety', 'Bhuvan K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'BHUVANK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b240a54c-c2de-4823-8a7d-2e361340c145', 'VERIFIED-ORION-S0194', 'Bhuvan K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b240a54c-c2de-4823-8a7d-2e361340c145', 1, null, 'alpha safety', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b240a54c-c2de-4823-8a7d-2e361340c145', 2, null, 'alpha safety', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b240a54c-c2de-4823-8a7d-2e361340c145', 3, null, 'alpha safety', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b240a54c-c2de-4823-8a7d-2e361340c145', 4, null, 'alpha safety', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b240a54c-c2de-4823-8a7d-2e361340c145', 5, null, 'alpha safety', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5c335148-da5a-4f39-abeb-a9d536d7386a', 'ORION-S0195', 'Ctrl freaks', 'ctrlfreaks', 'KAVIYA B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'KAVIYAB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5c335148-da5a-4f39-abeb-a9d536d7386a', 'VERIFIED-ORION-S0195', 'KAVIYA B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5c335148-da5a-4f39-abeb-a9d536d7386a', 1, null, 'Ctrl freaks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5c335148-da5a-4f39-abeb-a9d536d7386a', 2, null, 'Ctrl freaks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5c335148-da5a-4f39-abeb-a9d536d7386a', 3, null, 'Ctrl freaks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5c335148-da5a-4f39-abeb-a9d536d7386a', 4, null, 'Ctrl freaks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5c335148-da5a-4f39-abeb-a9d536d7386a', 5, null, 'Ctrl freaks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '7f95e3dc-9922-49db-a20e-043fe9b8cef4', 'ORION-S0196', 'TerraVision AI', 'terravisionai', 'Sudharshan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'SUDHARSHAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '7f95e3dc-9922-49db-a20e-043fe9b8cef4', 'VERIFIED-ORION-S0196', 'Sudharshan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7f95e3dc-9922-49db-a20e-043fe9b8cef4', 1, null, 'TerraVision AI', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7f95e3dc-9922-49db-a20e-043fe9b8cef4', 2, null, 'TerraVision AI', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7f95e3dc-9922-49db-a20e-043fe9b8cef4', 3, null, 'TerraVision AI', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7f95e3dc-9922-49db-a20e-043fe9b8cef4', 4, null, 'TerraVision AI', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7f95e3dc-9922-49db-a20e-043fe9b8cef4', 5, null, 'TerraVision AI', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '7e51906e-8214-4dbf-8de6-e440210aea64', 'ORION-S0197', 'Top gun', 'topgun', 'deepak', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'DEEPAK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '7e51906e-8214-4dbf-8de6-e440210aea64', 'VERIFIED-ORION-S0197', 'deepak', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7e51906e-8214-4dbf-8de6-e440210aea64', 1, null, 'Top gun', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7e51906e-8214-4dbf-8de6-e440210aea64', 2, null, 'Top gun', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7e51906e-8214-4dbf-8de6-e440210aea64', 3, null, 'Top gun', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7e51906e-8214-4dbf-8de6-e440210aea64', 4, null, 'Top gun', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7e51906e-8214-4dbf-8de6-e440210aea64', 5, null, 'Top gun', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '77705dd4-2bb4-4b3f-a10a-0fb4d4f14e42', 'ORION-S0198', 'Cyber Kiddies', 'cyberkiddies', 'Jesin Milesh M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'JESINMILESHM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '77705dd4-2bb4-4b3f-a10a-0fb4d4f14e42', 'VERIFIED-ORION-S0198', 'Jesin Milesh M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '77705dd4-2bb4-4b3f-a10a-0fb4d4f14e42', 1, null, 'Cyber Kiddies', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '77705dd4-2bb4-4b3f-a10a-0fb4d4f14e42', 2, null, 'Cyber Kiddies', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '77705dd4-2bb4-4b3f-a10a-0fb4d4f14e42', 3, null, 'Cyber Kiddies', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '77705dd4-2bb4-4b3f-a10a-0fb4d4f14e42', 4, null, 'Cyber Kiddies', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '77705dd4-2bb4-4b3f-a10a-0fb4d4f14e42', 5, null, 'Cyber Kiddies', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'bd16b969-458c-488d-be41-2c040b1bb699', 'ORION-S0199', 'PREETHI A', 'preethia', 'PREETHI A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'PREETHIA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'bd16b969-458c-488d-be41-2c040b1bb699', 'VERIFIED-ORION-S0199', 'PREETHI A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bd16b969-458c-488d-be41-2c040b1bb699', 1, null, 'PREETHI A', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'bd16b969-458c-488d-be41-2c040b1bb699', 2, null, 'PREETHI A', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f8d47e42-ec8d-45ca-adde-da906e096d32', 'ORION-S0200', 'Binary Brains', 'binarybrains', 'Naveena R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'NAVEENAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f8d47e42-ec8d-45ca-adde-da906e096d32', 'VERIFIED-ORION-S0200', 'Naveena R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f8d47e42-ec8d-45ca-adde-da906e096d32', 1, null, 'Binary Brains', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f8d47e42-ec8d-45ca-adde-da906e096d32', 2, null, 'Binary Brains', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f8d47e42-ec8d-45ca-adde-da906e096d32', 3, null, 'Binary Brains', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '3e4467dd-3975-4eff-a153-718ece2869ce', 'ORION-S0201', 'Hackhive', 'hackhive', 'JEYASHREE V', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'JEYASHREEV',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '3e4467dd-3975-4eff-a153-718ece2869ce', 'VERIFIED-ORION-S0201', 'JEYASHREE V', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3e4467dd-3975-4eff-a153-718ece2869ce', 1, null, 'Hackhive', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3e4467dd-3975-4eff-a153-718ece2869ce', 2, null, 'Hackhive', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3e4467dd-3975-4eff-a153-718ece2869ce', 3, null, 'Hackhive', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd0603862-9a44-44bf-b19e-8d2207f83b34', 'ORION-S0202', 'Yokeshwaran', 'yokeshwaran', 'Yokeshwaran', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'YOKESHWARAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd0603862-9a44-44bf-b19e-8d2207f83b34', 'VERIFIED-ORION-S0202', 'Yokeshwaran', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd0603862-9a44-44bf-b19e-8d2207f83b34', 1, null, 'Yokeshwaran', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd0603862-9a44-44bf-b19e-8d2207f83b34', 2, null, 'Yokeshwaran', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd0603862-9a44-44bf-b19e-8d2207f83b34', 3, null, 'Yokeshwaran', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '7d4afd6b-5201-4106-9299-0a4a7910143b', 'ORION-S0203', 'elytra tech', 'elytratech', 'samuel joel ponraj', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'SAMUELJOELPONRAJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '7d4afd6b-5201-4106-9299-0a4a7910143b', 'VERIFIED-ORION-S0203', 'samuel joel ponraj', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7d4afd6b-5201-4106-9299-0a4a7910143b', 1, null, 'elytra tech', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '7d4afd6b-5201-4106-9299-0a4a7910143b', 2, null, 'elytra tech', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0c481b90-6eec-4cf0-9166-2200f14b0814', 'ORION-S0204', 'Dronai', 'dronai', 'Rannadeer kumar seetha', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'RANNADEERKUMARSEETHA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0c481b90-6eec-4cf0-9166-2200f14b0814', 'VERIFIED-ORION-S0204', 'Rannadeer kumar seetha', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c481b90-6eec-4cf0-9166-2200f14b0814', 1, null, 'Dronai', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c481b90-6eec-4cf0-9166-2200f14b0814', 2, null, 'Dronai', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b1342394-d291-4341-a432-93bb9efc0c55', 'ORION-S0205', 'CrackAura', 'crackaura', 'SRIRAM M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SRIRAMM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b1342394-d291-4341-a432-93bb9efc0c55', 'VERIFIED-ORION-S0205', 'SRIRAM M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b1342394-d291-4341-a432-93bb9efc0c55', 1, null, 'CrackAura', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b1342394-d291-4341-a432-93bb9efc0c55', 2, null, 'CrackAura', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b1342394-d291-4341-a432-93bb9efc0c55', 3, null, 'CrackAura', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b1342394-d291-4341-a432-93bb9efc0c55', 4, null, 'CrackAura', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b1342394-d291-4341-a432-93bb9efc0c55', 5, null, 'CrackAura', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f3b4f30a-689a-4a12-9740-a3b651b0ab82', 'ORION-S0206', 'The Creators', 'thecreators', 'Sweety Vincent', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SWEETYVINCENT',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f3b4f30a-689a-4a12-9740-a3b651b0ab82', 'VERIFIED-ORION-S0206', 'Sweety Vincent', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f3b4f30a-689a-4a12-9740-a3b651b0ab82', 1, null, 'The Creators', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f3b4f30a-689a-4a12-9740-a3b651b0ab82', 2, null, 'The Creators', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f3b4f30a-689a-4a12-9740-a3b651b0ab82', 3, null, 'The Creators', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f3b4f30a-689a-4a12-9740-a3b651b0ab82', 4, null, 'The Creators', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f3b4f30a-689a-4a12-9740-a3b651b0ab82', 5, null, 'The Creators', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b07e9d5a-fe05-4dfe-943e-10d0d5f7d4dc', 'ORION-S0207', 'Quantum Minds', 'quantumminds', 'manasvi sachin jagtap', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'MANASVISACHINJAGTAP',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b07e9d5a-fe05-4dfe-943e-10d0d5f7d4dc', 'VERIFIED-ORION-S0207', 'manasvi sachin jagtap', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b07e9d5a-fe05-4dfe-943e-10d0d5f7d4dc', 1, null, 'Quantum Minds', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b07e9d5a-fe05-4dfe-943e-10d0d5f7d4dc', 2, null, 'Quantum Minds', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b07e9d5a-fe05-4dfe-943e-10d0d5f7d4dc', 3, null, 'Quantum Minds', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'efb9d528-3cc3-4701-b051-4422b4225d86', 'ORION-S0208', 'git commit -m "Victory"', 'gitcommitmvictory', 'Daniel Sebastin A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'DANIELSEBASTINA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'efb9d528-3cc3-4701-b051-4422b4225d86', 'VERIFIED-ORION-S0208', 'Daniel Sebastin A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'efb9d528-3cc3-4701-b051-4422b4225d86', 1, null, 'git commit -m "Victory"', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'efb9d528-3cc3-4701-b051-4422b4225d86', 2, null, 'git commit -m "Victory"', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'efb9d528-3cc3-4701-b051-4422b4225d86', 3, null, 'git commit -m "Victory"', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'c4251f3f-8ce4-4b95-be84-2557953d9b6b', 'ORION-S0209', 'Binary Brains', 'binarybrains', 'GONEDA Tushar Karthik', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'GONEDATUSHARKARTHIK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'c4251f3f-8ce4-4b95-be84-2557953d9b6b', 'VERIFIED-ORION-S0209', 'GONEDA Tushar Karthik', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c4251f3f-8ce4-4b95-be84-2557953d9b6b', 1, null, 'Binary Brains', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c4251f3f-8ce4-4b95-be84-2557953d9b6b', 2, null, 'Binary Brains', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c4251f3f-8ce4-4b95-be84-2557953d9b6b', 3, null, 'Binary Brains', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'c4251f3f-8ce4-4b95-be84-2557953d9b6b', 4, null, 'Binary Brains', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f2a1b4eb-7c90-469a-8338-4fe1c8dfc126', 'ORION-S0210', 'Hack Hype', 'hackhype', 'Nandhini', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'NANDHINI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f2a1b4eb-7c90-469a-8338-4fe1c8dfc126', 'VERIFIED-ORION-S0210', 'Nandhini', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f2a1b4eb-7c90-469a-8338-4fe1c8dfc126', 1, null, 'Hack Hype', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f2a1b4eb-7c90-469a-8338-4fe1c8dfc126', 2, null, 'Hack Hype', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f2a1b4eb-7c90-469a-8338-4fe1c8dfc126', 3, null, 'Hack Hype', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f2a1b4eb-7c90-469a-8338-4fe1c8dfc126', 4, null, 'Hack Hype', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f2a1b4eb-7c90-469a-8338-4fe1c8dfc126', 5, null, 'Hack Hype', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5086f39b-1206-431b-be05-aeb6901d285a', 'ORION-S0211', 'LinkupLaps', 'linkuplaps', 'Prakash R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'PRAKASHR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5086f39b-1206-431b-be05-aeb6901d285a', 'VERIFIED-ORION-S0211', 'Prakash R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5086f39b-1206-431b-be05-aeb6901d285a', 1, null, 'LinkupLaps', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5086f39b-1206-431b-be05-aeb6901d285a', 2, null, 'LinkupLaps', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5086f39b-1206-431b-be05-aeb6901d285a', 3, null, 'LinkupLaps', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5086f39b-1206-431b-be05-aeb6901d285a', 4, null, 'LinkupLaps', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5086f39b-1206-431b-be05-aeb6901d285a', 5, null, 'LinkupLaps', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '6ee1f76c-5738-4384-bee0-ffd821f21f58', 'ORION-S0212', 'Debug Divas', 'debugdivas', 'Atchaya M S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'ATCHAYAMS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '6ee1f76c-5738-4384-bee0-ffd821f21f58', 'VERIFIED-ORION-S0212', 'Atchaya M S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6ee1f76c-5738-4384-bee0-ffd821f21f58', 1, null, 'Debug Divas', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6ee1f76c-5738-4384-bee0-ffd821f21f58', 2, null, 'Debug Divas', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6ee1f76c-5738-4384-bee0-ffd821f21f58', 3, null, 'Debug Divas', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6ee1f76c-5738-4384-bee0-ffd821f21f58', 4, null, 'Debug Divas', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6ee1f76c-5738-4384-bee0-ffd821f21f58', 5, null, 'Debug Divas', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '406907b0-8a11-448d-8d51-b45edccb3bd4', 'ORION-S0213', 'AquaByte', 'aquabyte', 'MOHAMED RIYASKHAN S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'MOHAMEDRIYASKHANS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '406907b0-8a11-448d-8d51-b45edccb3bd4', 'VERIFIED-ORION-S0213', 'MOHAMED RIYASKHAN S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '406907b0-8a11-448d-8d51-b45edccb3bd4', 1, null, 'AquaByte', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '406907b0-8a11-448d-8d51-b45edccb3bd4', 2, null, 'AquaByte', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '406907b0-8a11-448d-8d51-b45edccb3bd4', 3, null, 'AquaByte', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '1f7e4bb8-aaed-48d3-b8e5-a07ffca3e8e2', 'ORION-S0214', 'Code Forge', 'codeforge', 'Vaarshini B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'VAARSHINIB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '1f7e4bb8-aaed-48d3-b8e5-a07ffca3e8e2', 'VERIFIED-ORION-S0214', 'Vaarshini B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1f7e4bb8-aaed-48d3-b8e5-a07ffca3e8e2', 1, null, 'Code Forge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1f7e4bb8-aaed-48d3-b8e5-a07ffca3e8e2', 2, null, 'Code Forge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1f7e4bb8-aaed-48d3-b8e5-a07ffca3e8e2', 3, null, 'Code Forge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1f7e4bb8-aaed-48d3-b8e5-a07ffca3e8e2', 4, null, 'Code Forge', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '930b21ac-18ef-45ad-b35c-1743d6c7ff67', 'ORION-S0215', 'ALGOS', 'algos', 'Vishnu D', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'VISHNUD',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '930b21ac-18ef-45ad-b35c-1743d6c7ff67', 'VERIFIED-ORION-S0215', 'Vishnu D', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '930b21ac-18ef-45ad-b35c-1743d6c7ff67', 1, null, 'ALGOS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '930b21ac-18ef-45ad-b35c-1743d6c7ff67', 2, null, 'ALGOS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '930b21ac-18ef-45ad-b35c-1743d6c7ff67', 3, null, 'ALGOS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '930b21ac-18ef-45ad-b35c-1743d6c7ff67', 4, null, 'ALGOS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5d46ceee-4112-4051-93e5-371ceda1a6ad', 'ORION-S0216', 'C0DE RED', 'c0dered', 'Sagaar suresh', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SAGAARSURESH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5d46ceee-4112-4051-93e5-371ceda1a6ad', 'VERIFIED-ORION-S0216', 'Sagaar suresh', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5d46ceee-4112-4051-93e5-371ceda1a6ad', 1, null, 'C0DE RED', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5d46ceee-4112-4051-93e5-371ceda1a6ad', 2, null, 'C0DE RED', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5d46ceee-4112-4051-93e5-371ceda1a6ad', 3, null, 'C0DE RED', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '69aa660d-edb4-48b6-be54-e6f8455e2335', 'ORION-S0217', 'TechAura', 'techaura', 'K.Shri vijaya harini', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'KSHRIVIJAYAHARINI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '69aa660d-edb4-48b6-be54-e6f8455e2335', 'VERIFIED-ORION-S0217', 'K.Shri vijaya harini', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69aa660d-edb4-48b6-be54-e6f8455e2335', 1, null, 'TechAura', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69aa660d-edb4-48b6-be54-e6f8455e2335', 2, null, 'TechAura', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '69aa660d-edb4-48b6-be54-e6f8455e2335', 3, null, 'TechAura', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ea2f3920-149a-4a81-b68e-efc1f74c6d1f', 'ORION-S0218', 'Sparks', 'sparks', 'Vilina K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'VILINAK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ea2f3920-149a-4a81-b68e-efc1f74c6d1f', 'VERIFIED-ORION-S0218', 'Vilina K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ea2f3920-149a-4a81-b68e-efc1f74c6d1f', 1, null, 'Sparks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ea2f3920-149a-4a81-b68e-efc1f74c6d1f', 2, null, 'Sparks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ea2f3920-149a-4a81-b68e-efc1f74c6d1f', 3, null, 'Sparks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ea2f3920-149a-4a81-b68e-efc1f74c6d1f', 4, null, 'Sparks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ea2f3920-149a-4a81-b68e-efc1f74c6d1f', 5, null, 'Sparks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5bb5ec9c-54ca-405d-94ba-9a2cef6e9e41', 'ORION-S0219', 'INQORA', 'inqora', 'X.KRECENCIA', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'XKRECENCIA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5bb5ec9c-54ca-405d-94ba-9a2cef6e9e41', 'VERIFIED-ORION-S0219', 'X.KRECENCIA', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5bb5ec9c-54ca-405d-94ba-9a2cef6e9e41', 1, null, 'INQORA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5bb5ec9c-54ca-405d-94ba-9a2cef6e9e41', 2, null, 'INQORA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5bb5ec9c-54ca-405d-94ba-9a2cef6e9e41', 3, null, 'INQORA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5bb5ec9c-54ca-405d-94ba-9a2cef6e9e41', 4, null, 'INQORA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5bb5ec9c-54ca-405d-94ba-9a2cef6e9e41', 5, null, 'INQORA', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '1fe48d18-edf6-404d-9bf9-c4251a7cd9ce', 'ORION-S0220', 'The Quantum Coders', 'thequantumcoders', 'Sivanandham G', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'SIVANANDHAMG',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '1fe48d18-edf6-404d-9bf9-c4251a7cd9ce', 'VERIFIED-ORION-S0220', 'Sivanandham G', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1fe48d18-edf6-404d-9bf9-c4251a7cd9ce', 1, null, 'The Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1fe48d18-edf6-404d-9bf9-c4251a7cd9ce', 2, null, 'The Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1fe48d18-edf6-404d-9bf9-c4251a7cd9ce', 3, null, 'The Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1fe48d18-edf6-404d-9bf9-c4251a7cd9ce', 4, null, 'The Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1fe48d18-edf6-404d-9bf9-c4251a7cd9ce', 5, null, 'The Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8189bce7-c391-4054-9a05-9cca8c614aea', 'ORION-S0221', 'Team titans', 'teamtitans', 'AKSHAYA K 111625201005', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'AKSHAYAK111625201005',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8189bce7-c391-4054-9a05-9cca8c614aea', 'VERIFIED-ORION-S0221', 'AKSHAYA K 111625201005', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8189bce7-c391-4054-9a05-9cca8c614aea', 1, null, 'Team titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8189bce7-c391-4054-9a05-9cca8c614aea', 2, null, 'Team titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8189bce7-c391-4054-9a05-9cca8c614aea', 3, null, 'Team titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8189bce7-c391-4054-9a05-9cca8c614aea', 4, null, 'Team titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8189bce7-c391-4054-9a05-9cca8c614aea', 5, null, 'Team titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '80f7e8c4-404f-4319-8a13-4c20b0307e0c', 'ORION-S0222', 'NeuroFlux', 'neuroflux', 'Madhumitha T K', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'MADHUMITHATK',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '80f7e8c4-404f-4319-8a13-4c20b0307e0c', 'VERIFIED-ORION-S0222', 'Madhumitha T K', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '80f7e8c4-404f-4319-8a13-4c20b0307e0c', 1, null, 'NeuroFlux', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '80f7e8c4-404f-4319-8a13-4c20b0307e0c', 2, null, 'NeuroFlux', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '80f7e8c4-404f-4319-8a13-4c20b0307e0c', 3, null, 'NeuroFlux', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b5d566f1-56f6-416e-9a1c-70d996214879', 'ORION-S0223', 'Deep Matrix', 'deepmatrix', 'V Hari Krishnan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'VHARIKRISHNAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b5d566f1-56f6-416e-9a1c-70d996214879', 'VERIFIED-ORION-S0223', 'V Hari Krishnan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b5d566f1-56f6-416e-9a1c-70d996214879', 1, null, 'Deep Matrix', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b5d566f1-56f6-416e-9a1c-70d996214879', 2, null, 'Deep Matrix', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b5d566f1-56f6-416e-9a1c-70d996214879', 3, null, 'Deep Matrix', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b5d566f1-56f6-416e-9a1c-70d996214879', 4, null, 'Deep Matrix', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b5d566f1-56f6-416e-9a1c-70d996214879', 5, null, 'Deep Matrix', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'dd29be6c-7645-4a2d-9551-bc6dac97e04b', 'ORION-S0224', 'Shadow_Monarch', 'shadowmonarch', 'Pavan Kumar', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'PAVANKUMAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'dd29be6c-7645-4a2d-9551-bc6dac97e04b', 'VERIFIED-ORION-S0224', 'Pavan Kumar', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dd29be6c-7645-4a2d-9551-bc6dac97e04b', 1, null, 'Shadow_Monarch', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '1617d9b1-5669-4cc2-9ddd-bacf64fc25db', 'ORION-S0225', 'Yeah squad', 'yeahsquad', 'Rubendran V', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'RUBENDRANV',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '1617d9b1-5669-4cc2-9ddd-bacf64fc25db', 'VERIFIED-ORION-S0225', 'Rubendran V', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1617d9b1-5669-4cc2-9ddd-bacf64fc25db', 1, null, 'Yeah squad', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1617d9b1-5669-4cc2-9ddd-bacf64fc25db', 2, null, 'Yeah squad', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1617d9b1-5669-4cc2-9ddd-bacf64fc25db', 3, null, 'Yeah squad', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1617d9b1-5669-4cc2-9ddd-bacf64fc25db', 4, null, 'Yeah squad', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1617d9b1-5669-4cc2-9ddd-bacf64fc25db', 5, null, 'Yeah squad', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd669a0af-5fe8-4e0c-955b-d5abf3dd007c', 'ORION-S0226', 'Doddlebug', 'doddlebug', 'Avinash Venkatraman', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'AVINASHVENKATRAMAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd669a0af-5fe8-4e0c-955b-d5abf3dd007c', 'VERIFIED-ORION-S0226', 'Avinash Venkatraman', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd669a0af-5fe8-4e0c-955b-d5abf3dd007c', 1, null, 'Doddlebug', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd669a0af-5fe8-4e0c-955b-d5abf3dd007c', 2, null, 'Doddlebug', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd669a0af-5fe8-4e0c-955b-d5abf3dd007c', 3, null, 'Doddlebug', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'a0f26f40-00ee-43ef-a889-aeb01b99d281', 'ORION-S0227', 'Tech innovator', 'techinnovator', 'Pragadeshwaran', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'PRAGADESHWARAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'a0f26f40-00ee-43ef-a889-aeb01b99d281', 'VERIFIED-ORION-S0227', 'Pragadeshwaran', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a0f26f40-00ee-43ef-a889-aeb01b99d281', 1, null, 'Tech innovator', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a0f26f40-00ee-43ef-a889-aeb01b99d281', 2, null, 'Tech innovator', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '415f79a7-e944-41a5-87eb-8d697dde0e2b', 'ORION-S0228', 'Eagerists', 'eagerists', 'Deepa Ganesh J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'DEEPAGANESHJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '415f79a7-e944-41a5-87eb-8d697dde0e2b', 'VERIFIED-ORION-S0228', 'Deepa Ganesh J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '415f79a7-e944-41a5-87eb-8d697dde0e2b', 1, null, 'Eagerists', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '415f79a7-e944-41a5-87eb-8d697dde0e2b', 2, null, 'Eagerists', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '415f79a7-e944-41a5-87eb-8d697dde0e2b', 3, null, 'Eagerists', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '415f79a7-e944-41a5-87eb-8d697dde0e2b', 4, null, 'Eagerists', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '415f79a7-e944-41a5-87eb-8d697dde0e2b', 5, null, 'Eagerists', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'a3eed822-f3bc-4bee-9220-450783203819', 'ORION-S0229', 'Coderzz', 'coderzz', 'Sneha J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'SNEHAJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'a3eed822-f3bc-4bee-9220-450783203819', 'VERIFIED-ORION-S0229', 'Sneha J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'a3eed822-f3bc-4bee-9220-450783203819', 1, null, 'Coderzz', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '08a0696f-4f48-4008-92d2-05f2dfd2949a', 'ORION-S0230', 'PARAGON', 'paragon', 'Sai Sowndiriyaa T', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'SAISOWNDIRIYAAT',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '08a0696f-4f48-4008-92d2-05f2dfd2949a', 'VERIFIED-ORION-S0230', 'Sai Sowndiriyaa T', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '08a0696f-4f48-4008-92d2-05f2dfd2949a', 1, null, 'PARAGON', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '08a0696f-4f48-4008-92d2-05f2dfd2949a', 2, null, 'PARAGON', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '926c4830-b9c3-4dcf-9889-3880a4342743', 'ORION-S0231', 'Corex', 'corex', 'Parthasarathi M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'PARTHASARATHIM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '926c4830-b9c3-4dcf-9889-3880a4342743', 'VERIFIED-ORION-S0231', 'Parthasarathi M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '926c4830-b9c3-4dcf-9889-3880a4342743', 1, null, 'Corex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '926c4830-b9c3-4dcf-9889-3880a4342743', 2, null, 'Corex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '926c4830-b9c3-4dcf-9889-3880a4342743', 3, null, 'Corex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '926c4830-b9c3-4dcf-9889-3880a4342743', 4, null, 'Corex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '926c4830-b9c3-4dcf-9889-3880a4342743', 5, null, 'Corex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '2bcaa230-c6fb-48e6-ac9e-1237488ebd96', 'ORION-S0232', 'Galactic Force', 'galacticforce', 'C.Tarunarayan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'CTARUNARAYAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '2bcaa230-c6fb-48e6-ac9e-1237488ebd96', 'VERIFIED-ORION-S0232', 'C.Tarunarayan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2bcaa230-c6fb-48e6-ac9e-1237488ebd96', 1, null, 'Galactic Force', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2bcaa230-c6fb-48e6-ac9e-1237488ebd96', 2, null, 'Galactic Force', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2bcaa230-c6fb-48e6-ac9e-1237488ebd96', 3, null, 'Galactic Force', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f10d1443-3af5-44bb-a766-3f759eaa8f9c', 'ORION-S0233', 'Code titans', 'codetitans', 'Sabareesh', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SABAREESH',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f10d1443-3af5-44bb-a766-3f759eaa8f9c', 'VERIFIED-ORION-S0233', 'Sabareesh', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f10d1443-3af5-44bb-a766-3f759eaa8f9c', 1, null, 'Code titans', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'e99b8157-fdfb-4b90-b467-98d116623601', 'ORION-S0234', 'Alpha', 'alpha', 'Sharvesh S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'SHARVESHS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'e99b8157-fdfb-4b90-b467-98d116623601', 'VERIFIED-ORION-S0234', 'Sharvesh S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e99b8157-fdfb-4b90-b467-98d116623601', 1, null, 'Alpha', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e99b8157-fdfb-4b90-b467-98d116623601', 2, null, 'Alpha', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'af8a6bd8-7cc7-4289-9e9e-acdccfa8fd2f', 'ORION-S0235', 'Bleach', 'bleach', 'Sriya Bheema', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SRIYABHEEMA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'af8a6bd8-7cc7-4289-9e9e-acdccfa8fd2f', 'VERIFIED-ORION-S0235', 'Sriya Bheema', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'af8a6bd8-7cc7-4289-9e9e-acdccfa8fd2f', 1, null, 'Bleach', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'af8a6bd8-7cc7-4289-9e9e-acdccfa8fd2f', 2, null, 'Bleach', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'af8a6bd8-7cc7-4289-9e9e-acdccfa8fd2f', 3, null, 'Bleach', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'af8a6bd8-7cc7-4289-9e9e-acdccfa8fd2f', 4, null, 'Bleach', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '3840df49-6fc0-4de0-998f-0a4afdf7b24f', 'ORION-S0236', 'Cupid.exe', 'cupidexe', 'Sachin R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SACHINR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '3840df49-6fc0-4de0-998f-0a4afdf7b24f', 'VERIFIED-ORION-S0236', 'Sachin R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3840df49-6fc0-4de0-998f-0a4afdf7b24f', 1, null, 'Cupid.exe', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'f759bd88-67a0-4b43-948a-aea6b5491265', 'ORION-S0237', 'Team Endeavours', 'teamendeavours', 'Srirangapprasath I', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SRIRANGAPPRASATHI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'f759bd88-67a0-4b43-948a-aea6b5491265', 'VERIFIED-ORION-S0237', 'Srirangapprasath I', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'f759bd88-67a0-4b43-948a-aea6b5491265', 1, null, 'Team Endeavours', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '53e8ba56-b82c-4732-ac6b-208221328fb0', 'ORION-S0238', 'AQUABOTS', 'aquabots', 'DHIVYASHRI S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'DHIVYASHRIS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '53e8ba56-b82c-4732-ac6b-208221328fb0', 'VERIFIED-ORION-S0238', 'DHIVYASHRI S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '53e8ba56-b82c-4732-ac6b-208221328fb0', 1, null, 'AQUABOTS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '53e8ba56-b82c-4732-ac6b-208221328fb0', 2, null, 'AQUABOTS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '53e8ba56-b82c-4732-ac6b-208221328fb0', 3, null, 'AQUABOTS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '53e8ba56-b82c-4732-ac6b-208221328fb0', 4, null, 'AQUABOTS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '53e8ba56-b82c-4732-ac6b-208221328fb0', 5, null, 'AQUABOTS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '64e88e6a-568a-4f27-a2fc-72f502aee332', 'ORION-S0239', 'Quinex', 'quinex', 'K.Sabana Banu', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'KSABANABANU',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '64e88e6a-568a-4f27-a2fc-72f502aee332', 'VERIFIED-ORION-S0239', 'K.Sabana Banu', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '64e88e6a-568a-4f27-a2fc-72f502aee332', 1, null, 'Quinex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '64e88e6a-568a-4f27-a2fc-72f502aee332', 2, null, 'Quinex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '64e88e6a-568a-4f27-a2fc-72f502aee332', 3, null, 'Quinex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '64e88e6a-568a-4f27-a2fc-72f502aee332', 4, null, 'Quinex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '64e88e6a-568a-4f27-a2fc-72f502aee332', 5, null, 'Quinex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'e676a7bb-e2d1-426a-a132-d87014c3d92c', 'ORION-S0240', 'DSCE', 'dsce', 'Nadin S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'NADINS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'e676a7bb-e2d1-426a-a132-d87014c3d92c', 'VERIFIED-ORION-S0240', 'Nadin S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e676a7bb-e2d1-426a-a132-d87014c3d92c', 1, null, 'DSCE', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e676a7bb-e2d1-426a-a132-d87014c3d92c', 2, null, 'DSCE', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'e676a7bb-e2d1-426a-a132-d87014c3d92c', 3, null, 'DSCE', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b80cf0f6-4ae0-4d6a-be21-2e19f068810f', 'ORION-S0241', 'Tech Tetra', 'techtetra', 'Kavisri A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'KAVISRIA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b80cf0f6-4ae0-4d6a-be21-2e19f068810f', 'VERIFIED-ORION-S0241', 'Kavisri A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b80cf0f6-4ae0-4d6a-be21-2e19f068810f', 1, null, 'Tech Tetra', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b80cf0f6-4ae0-4d6a-be21-2e19f068810f', 2, null, 'Tech Tetra', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b80cf0f6-4ae0-4d6a-be21-2e19f068810f', 3, null, 'Tech Tetra', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'dca9953e-c23c-461c-959c-24ad42dc9cf2', 'ORION-S0242', 'Epsilon', 'epsilon', 'Sanchita S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'SANCHITAS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'dca9953e-c23c-461c-959c-24ad42dc9cf2', 'VERIFIED-ORION-S0242', 'Sanchita S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dca9953e-c23c-461c-959c-24ad42dc9cf2', 1, null, 'Epsilon', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dca9953e-c23c-461c-959c-24ad42dc9cf2', 2, null, 'Epsilon', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dca9953e-c23c-461c-959c-24ad42dc9cf2', 3, null, 'Epsilon', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dca9953e-c23c-461c-959c-24ad42dc9cf2', 4, null, 'Epsilon', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dca9953e-c23c-461c-959c-24ad42dc9cf2', 5, null, 'Epsilon', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '036cd9d5-b0ed-44de-8d4b-07e15d4598ea', 'ORION-S0243', 'AI INFINITY', 'aiinfinity', 'Jibriya Begam A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'JIBRIYABEGAMA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '036cd9d5-b0ed-44de-8d4b-07e15d4598ea', 'VERIFIED-ORION-S0243', 'Jibriya Begam A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '036cd9d5-b0ed-44de-8d4b-07e15d4598ea', 1, null, 'AI INFINITY', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '036cd9d5-b0ed-44de-8d4b-07e15d4598ea', 2, null, 'AI INFINITY', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '036cd9d5-b0ed-44de-8d4b-07e15d4598ea', 3, null, 'AI INFINITY', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '036cd9d5-b0ed-44de-8d4b-07e15d4598ea', 4, null, 'AI INFINITY', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '036cd9d5-b0ed-44de-8d4b-07e15d4598ea', 5, null, 'AI INFINITY', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0c2fb3d7-79fa-4b40-a05b-cfd27b5d3435', 'ORION-S0244', 'AXION', 'axion', 'VASANTHAKUMAR S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'VASANTHAKUMARS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0c2fb3d7-79fa-4b40-a05b-cfd27b5d3435', 'VERIFIED-ORION-S0244', 'VASANTHAKUMAR S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c2fb3d7-79fa-4b40-a05b-cfd27b5d3435', 1, null, 'AXION', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c2fb3d7-79fa-4b40-a05b-cfd27b5d3435', 2, null, 'AXION', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c2fb3d7-79fa-4b40-a05b-cfd27b5d3435', 3, null, 'AXION', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c2fb3d7-79fa-4b40-a05b-cfd27b5d3435', 4, null, 'AXION', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0c2fb3d7-79fa-4b40-a05b-cfd27b5d3435', 5, null, 'AXION', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd4a3470b-0f31-4b97-8f20-35e915cf35ce', 'ORION-S0245', 'DayOne', 'dayone', 'R S M Sri Vishnu', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'RSMSRIVISHNU',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd4a3470b-0f31-4b97-8f20-35e915cf35ce', 'VERIFIED-ORION-S0245', 'R S M Sri Vishnu', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd4a3470b-0f31-4b97-8f20-35e915cf35ce', 1, null, 'DayOne', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd4a3470b-0f31-4b97-8f20-35e915cf35ce', 2, null, 'DayOne', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd4a3470b-0f31-4b97-8f20-35e915cf35ce', 3, null, 'DayOne', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd4a3470b-0f31-4b97-8f20-35e915cf35ce', 4, null, 'DayOne', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd4a3470b-0f31-4b97-8f20-35e915cf35ce', 5, null, 'DayOne', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'aa75ab94-8437-4ac4-93b0-61b4b58dba2a', 'ORION-S0246', 'Algorise', 'algorise', 'Krishna Karthi', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'KRISHNAKARTHI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'aa75ab94-8437-4ac4-93b0-61b4b58dba2a', 'VERIFIED-ORION-S0246', 'Krishna Karthi', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'aa75ab94-8437-4ac4-93b0-61b4b58dba2a', 1, null, 'Algorise', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'aa75ab94-8437-4ac4-93b0-61b4b58dba2a', 2, null, 'Algorise', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'aa75ab94-8437-4ac4-93b0-61b4b58dba2a', 3, null, 'Algorise', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'aa75ab94-8437-4ac4-93b0-61b4b58dba2a', 4, null, 'Algorise', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'deaba5fc-4eb5-4028-b576-851025a4a04d', 'ORION-S0247', 'Syntax Errorist', 'syntaxerrorist', 'Keerthika J', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'KEERTHIKAJ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'deaba5fc-4eb5-4028-b576-851025a4a04d', 'VERIFIED-ORION-S0247', 'Keerthika J', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'deaba5fc-4eb5-4028-b576-851025a4a04d', 1, null, 'Syntax Errorist', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'deaba5fc-4eb5-4028-b576-851025a4a04d', 2, null, 'Syntax Errorist', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'deaba5fc-4eb5-4028-b576-851025a4a04d', 3, null, 'Syntax Errorist', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'deaba5fc-4eb5-4028-b576-851025a4a04d', 4, null, 'Syntax Errorist', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4233e1d5-9608-42f0-82e3-73c18fc15b50', 'ORION-S0248', 'CodeMax', 'codemax', 'Ili. Srinidhi', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'ILISRINIDHI',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4233e1d5-9608-42f0-82e3-73c18fc15b50', 'VERIFIED-ORION-S0248', 'Ili. Srinidhi', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4233e1d5-9608-42f0-82e3-73c18fc15b50', 1, null, 'CodeMax', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4233e1d5-9608-42f0-82e3-73c18fc15b50', 2, null, 'CodeMax', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b8259473-b49c-4fbd-b60e-09258e7445da', 'ORION-S0249', 'Technoverse', 'technoverse', 'Lohith kumar R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'LOHITHKUMARR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b8259473-b49c-4fbd-b60e-09258e7445da', 'VERIFIED-ORION-S0249', 'Lohith kumar R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b8259473-b49c-4fbd-b60e-09258e7445da', 1, null, 'Technoverse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b8259473-b49c-4fbd-b60e-09258e7445da', 2, null, 'Technoverse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b8259473-b49c-4fbd-b60e-09258e7445da', 3, null, 'Technoverse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b8259473-b49c-4fbd-b60e-09258e7445da', 4, null, 'Technoverse', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '28f76bdc-8017-45fa-807b-96167a8a7834', 'ORION-S0250', 'ADAM', 'adam', 'Archana R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'ARCHANAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '28f76bdc-8017-45fa-807b-96167a8a7834', 'VERIFIED-ORION-S0250', 'Archana R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '28f76bdc-8017-45fa-807b-96167a8a7834', 1, null, 'ADAM', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '28f76bdc-8017-45fa-807b-96167a8a7834', 2, null, 'ADAM', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '28f76bdc-8017-45fa-807b-96167a8a7834', 3, null, 'ADAM', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '28f76bdc-8017-45fa-807b-96167a8a7834', 4, null, 'ADAM', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '28f76bdc-8017-45fa-807b-96167a8a7834', 5, null, 'ADAM', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'fc8e9c07-e646-46fc-aac8-a649b6a9bbe4', 'ORION-S0251', 'Tech Morphers', 'techmorphers', 'Naveen Kumar R', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'NAVEENKUMARR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'fc8e9c07-e646-46fc-aac8-a649b6a9bbe4', 'VERIFIED-ORION-S0251', 'Naveen Kumar R', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fc8e9c07-e646-46fc-aac8-a649b6a9bbe4', 1, null, 'Tech Morphers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fc8e9c07-e646-46fc-aac8-a649b6a9bbe4', 2, null, 'Tech Morphers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fc8e9c07-e646-46fc-aac8-a649b6a9bbe4', 3, null, 'Tech Morphers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fc8e9c07-e646-46fc-aac8-a649b6a9bbe4', 4, null, 'Tech Morphers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'fc8e9c07-e646-46fc-aac8-a649b6a9bbe4', 5, null, 'Tech Morphers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'd2e28cdd-230d-4cd1-b798-307d135afacc', 'ORION-S0252', 'Ecospectra', 'ecospectra', 'Sri Balaji S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'SRIBALAJIS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'd2e28cdd-230d-4cd1-b798-307d135afacc', 'VERIFIED-ORION-S0252', 'Sri Balaji S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd2e28cdd-230d-4cd1-b798-307d135afacc', 1, null, 'Ecospectra', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd2e28cdd-230d-4cd1-b798-307d135afacc', 2, null, 'Ecospectra', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'd2e28cdd-230d-4cd1-b798-307d135afacc', 3, null, 'Ecospectra', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '4977eff7-e37e-4091-a0c5-a576128a5f4a', 'ORION-S0253', 'Alpha coders', 'alphacoders', 'Mohammed abdul muqeet ahmed', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'MOHAMMEDABDULMUQEETAHMED',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '4977eff7-e37e-4091-a0c5-a576128a5f4a', 'VERIFIED-ORION-S0253', 'Mohammed abdul muqeet ahmed', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4977eff7-e37e-4091-a0c5-a576128a5f4a', 1, null, 'Alpha coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4977eff7-e37e-4091-a0c5-a576128a5f4a', 2, null, 'Alpha coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4977eff7-e37e-4091-a0c5-a576128a5f4a', 3, null, 'Alpha coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4977eff7-e37e-4091-a0c5-a576128a5f4a', 4, null, 'Alpha coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '4977eff7-e37e-4091-a0c5-a576128a5f4a', 5, null, 'Alpha coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '61bdd642-e5e8-4c02-8bf2-0e1fd4bf4d1c', 'ORION-S0255', 'WHITE DOTS', 'whitedots', 'Harrish T', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'HARRISHT',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '61bdd642-e5e8-4c02-8bf2-0e1fd4bf4d1c', 'VERIFIED-ORION-S0255', 'Harrish T', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '61bdd642-e5e8-4c02-8bf2-0e1fd4bf4d1c', 1, null, 'WHITE DOTS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '61bdd642-e5e8-4c02-8bf2-0e1fd4bf4d1c', 2, null, 'WHITE DOTS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '533f904f-a4c6-42d6-bcf3-b177a7d756a2', 'ORION-S0256', 'Dual Core', 'dualcore', 'Mohammed Ashiq', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'MOHAMMEDASHIQ',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '533f904f-a4c6-42d6-bcf3-b177a7d756a2', 'VERIFIED-ORION-S0256', 'Mohammed Ashiq', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '533f904f-a4c6-42d6-bcf3-b177a7d756a2', 1, null, 'Dual Core', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '24e0e529-34c6-4d17-8b79-b073a2a4af0e', 'ORION-S0257', 'Apex Heroes', 'apexheroes', 'Abinav Sreenivas M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'ABINAVSREENIVASM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '24e0e529-34c6-4d17-8b79-b073a2a4af0e', 'VERIFIED-ORION-S0257', 'Abinav Sreenivas M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '24e0e529-34c6-4d17-8b79-b073a2a4af0e', 1, null, 'Apex Heroes', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '24e0e529-34c6-4d17-8b79-b073a2a4af0e', 2, null, 'Apex Heroes', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '24e0e529-34c6-4d17-8b79-b073a2a4af0e', 3, null, 'Apex Heroes', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '24e0e529-34c6-4d17-8b79-b073a2a4af0e', 4, null, 'Apex Heroes', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '24e0e529-34c6-4d17-8b79-b073a2a4af0e', 5, null, 'Apex Heroes', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '9b0be484-dab7-4675-bae5-09c6a9754599', 'ORION-S0258', 'Crack Dots', 'crackdots', 'aswin kumaragurubaran', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'ASWINKUMARAGURUBARAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '9b0be484-dab7-4675-bae5-09c6a9754599', 'VERIFIED-ORION-S0258', 'aswin kumaragurubaran', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9b0be484-dab7-4675-bae5-09c6a9754599', 1, null, 'Crack Dots', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '9b0be484-dab7-4675-bae5-09c6a9754599', 2, null, 'Crack Dots', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '71c2f624-4480-4e1f-9285-37e181b8b5b2', 'ORION-S0259', 'Obscura', 'obscura', 'BHUVAN BHANDARI B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'BHUVANBHANDARIB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '71c2f624-4480-4e1f-9285-37e181b8b5b2', 'VERIFIED-ORION-S0259', 'BHUVAN BHANDARI B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '71c2f624-4480-4e1f-9285-37e181b8b5b2', 1, null, 'Obscura', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '71c2f624-4480-4e1f-9285-37e181b8b5b2', 2, null, 'Obscura', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '71c2f624-4480-4e1f-9285-37e181b8b5b2', 3, null, 'Obscura', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '71c2f624-4480-4e1f-9285-37e181b8b5b2', 4, null, 'Obscura', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '6ff91b69-d130-4e51-bcb3-6e3192f4890e', 'ORION-S0260', 'Infinix', 'infinix', 'S Neha', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SNEHA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '6ff91b69-d130-4e51-bcb3-6e3192f4890e', 'VERIFIED-ORION-S0260', 'S Neha', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6ff91b69-d130-4e51-bcb3-6e3192f4890e', 1, null, 'Infinix', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6ff91b69-d130-4e51-bcb3-6e3192f4890e', 2, null, 'Infinix', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6ff91b69-d130-4e51-bcb3-6e3192f4890e', 3, null, 'Infinix', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6ff91b69-d130-4e51-bcb3-6e3192f4890e', 4, null, 'Infinix', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '6ff91b69-d130-4e51-bcb3-6e3192f4890e', 5, null, 'Infinix', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '8f0f5f96-0e68-42a9-a4df-8734e4b5203b', 'ORION-S0261', 'Codex', 'codex', 'Sahana M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SAHANAM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '8f0f5f96-0e68-42a9-a4df-8734e4b5203b', 'VERIFIED-ORION-S0261', 'Sahana M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8f0f5f96-0e68-42a9-a4df-8734e4b5203b', 1, null, 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8f0f5f96-0e68-42a9-a4df-8734e4b5203b', 2, null, 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8f0f5f96-0e68-42a9-a4df-8734e4b5203b', 3, null, 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8f0f5f96-0e68-42a9-a4df-8734e4b5203b', 4, null, 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '8f0f5f96-0e68-42a9-a4df-8734e4b5203b', 5, null, 'Codex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '66f93474-0f21-47da-8de4-a0087e929fba', 'ORION-S0262', 'Quantum Coders', 'quantumcoders', 'Kishore B', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'KISHOREB',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '66f93474-0f21-47da-8de4-a0087e929fba', 'VERIFIED-ORION-S0262', 'Kishore B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '66f93474-0f21-47da-8de4-a0087e929fba', 1, null, 'Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '66f93474-0f21-47da-8de4-a0087e929fba', 2, null, 'Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '66f93474-0f21-47da-8de4-a0087e929fba', 3, null, 'Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '66f93474-0f21-47da-8de4-a0087e929fba', 4, null, 'Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '66f93474-0f21-47da-8de4-a0087e929fba', 5, null, 'Quantum Coders', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '05c3e6e6-bd87-4bc5-a7e1-cbba645043fc', 'ORION-S0263', 'QuadraX', 'quadrax', 'Aditya Krishnan A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'ADITYAKRISHNANA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '05c3e6e6-bd87-4bc5-a7e1-cbba645043fc', 'VERIFIED-ORION-S0263', 'Aditya Krishnan A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '05c3e6e6-bd87-4bc5-a7e1-cbba645043fc', 1, null, 'QuadraX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '05c3e6e6-bd87-4bc5-a7e1-cbba645043fc', 2, null, 'QuadraX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '05c3e6e6-bd87-4bc5-a7e1-cbba645043fc', 3, null, 'QuadraX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ba93b278-6714-4e74-b5a3-1adddbf8560a', 'ORION-S0264', 'ERROR404', 'error404', 'Sanjay.C', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'SANJAYC',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ba93b278-6714-4e74-b5a3-1adddbf8560a', 'VERIFIED-ORION-S0264', 'Sanjay.C', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba93b278-6714-4e74-b5a3-1adddbf8560a', 1, null, 'ERROR404', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba93b278-6714-4e74-b5a3-1adddbf8560a', 2, null, 'ERROR404', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba93b278-6714-4e74-b5a3-1adddbf8560a', 3, null, 'ERROR404', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '2bb24f20-9f91-4662-beff-87059333e963', 'ORION-S0265', 'THE DECODERS', 'thedecoders', 'SAI HARISH M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-01: FLOATCHAT', 'SAIHARISHM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '2bb24f20-9f91-4662-beff-87059333e963', 'VERIFIED-ORION-S0265', 'SAI HARISH M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2bb24f20-9f91-4662-beff-87059333e963', 1, null, 'THE DECODERS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2bb24f20-9f91-4662-beff-87059333e963', 2, null, 'THE DECODERS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2bb24f20-9f91-4662-beff-87059333e963', 3, null, 'THE DECODERS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '83cd4bbd-3649-4ad0-a3be-20e89892ec7f', 'ORION-S0266', 'WHITE DEVILS', 'whitedevils', 'S.KAILASHWAR', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SKAILASHWAR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '83cd4bbd-3649-4ad0-a3be-20e89892ec7f', 'VERIFIED-ORION-S0266', 'S.KAILASHWAR', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '83cd4bbd-3649-4ad0-a3be-20e89892ec7f', 1, null, 'WHITE DEVILS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '83cd4bbd-3649-4ad0-a3be-20e89892ec7f', 2, null, 'WHITE DEVILS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '83cd4bbd-3649-4ad0-a3be-20e89892ec7f', 3, null, 'WHITE DEVILS', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b16e9153-080a-4782-979f-6e590c5bda58', 'ORION-S0267', 'CODEX', 'codex', 'SAM GODWIN A', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'SAMGODWINA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b16e9153-080a-4782-979f-6e590c5bda58', 'VERIFIED-ORION-S0267', 'SAM GODWIN A', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b16e9153-080a-4782-979f-6e590c5bda58', 1, null, 'CODEX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b16e9153-080a-4782-979f-6e590c5bda58', 2, null, 'CODEX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b16e9153-080a-4782-979f-6e590c5bda58', 3, null, 'CODEX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b16e9153-080a-4782-979f-6e590c5bda58', 4, null, 'CODEX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b16e9153-080a-4782-979f-6e590c5bda58', 5, null, 'CODEX', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5e166840-91d7-4161-a571-bc7e18bee7d6', 'ORION-S0268', 'Inglourious Hackers', 'inglourioushackers', 'CHUKISIVAM VS', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-02: LEXVAULT', 'CHUKISIVAMVS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5e166840-91d7-4161-a571-bc7e18bee7d6', 'VERIFIED-ORION-S0268', 'CHUKISIVAM VS', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5e166840-91d7-4161-a571-bc7e18bee7d6', 1, null, 'Inglourious Hackers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5e166840-91d7-4161-a571-bc7e18bee7d6', 2, null, 'Inglourious Hackers', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '14720096-7d76-447b-9c0d-e68fe0f11c24', 'ORION-S0269', 'RENTRO', 'rentro', 'P.S.Abinaya', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'PSABINAYA',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '14720096-7d76-447b-9c0d-e68fe0f11c24', 'VERIFIED-ORION-S0269', 'P.S.Abinaya', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '14720096-7d76-447b-9c0d-e68fe0f11c24', 1, null, 'RENTRO', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '14720096-7d76-447b-9c0d-e68fe0f11c24', 2, null, 'RENTRO', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '14720096-7d76-447b-9c0d-e68fe0f11c24', 3, null, 'RENTRO', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '14720096-7d76-447b-9c0d-e68fe0f11c24', 4, null, 'RENTRO', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '14720096-7d76-447b-9c0d-e68fe0f11c24', 5, null, 'RENTRO', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '1fea5a6d-d975-4bea-883e-bc1654db7b97', 'ORION-S0270', 'BRAINROT', 'brainrot', 'Gokila kumara chandru S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'GOKILAKUMARACHANDRUS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '1fea5a6d-d975-4bea-883e-bc1654db7b97', 'VERIFIED-ORION-S0270', 'Gokila kumara chandru S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1fea5a6d-d975-4bea-883e-bc1654db7b97', 1, null, 'BRAINROT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1fea5a6d-d975-4bea-883e-bc1654db7b97', 2, null, 'BRAINROT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1fea5a6d-d975-4bea-883e-bc1654db7b97', 3, null, 'BRAINROT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1fea5a6d-d975-4bea-883e-bc1654db7b97', 4, null, 'BRAINROT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '1fea5a6d-d975-4bea-883e-bc1654db7b97', 5, null, 'BRAINROT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '2dd93021-935a-4c3f-be01-f040c75d2acc', 'ORION-S0271', 'Team apex', 'teamapex', 'Mani Govindan S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'MANIGOVINDANS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '2dd93021-935a-4c3f-be01-f040c75d2acc', 'VERIFIED-ORION-S0271', 'Mani Govindan S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2dd93021-935a-4c3f-be01-f040c75d2acc', 1, null, 'Team apex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2dd93021-935a-4c3f-be01-f040c75d2acc', 2, null, 'Team apex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2dd93021-935a-4c3f-be01-f040c75d2acc', 3, null, 'Team apex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2dd93021-935a-4c3f-be01-f040c75d2acc', 4, null, 'Team apex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '710c653b-4517-430b-8795-58a1f3dd084d', 'ORION-S0272', 'Syntax', 'syntax', 'Rakshitha Pearlin.F', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-03: SYLVASENSE', 'RAKSHITHAPEARLINF',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '710c653b-4517-430b-8795-58a1f3dd084d', 'VERIFIED-ORION-S0272', 'Rakshitha Pearlin.F', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '710c653b-4517-430b-8795-58a1f3dd084d', 1, null, 'Syntax', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '710c653b-4517-430b-8795-58a1f3dd084d', 2, null, 'Syntax', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '2316833e-e14a-459a-b725-22b0e0544321', 'ORION-S0273', 'Rocks', 'rocks', 'Athi Narayanan', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'ATHINARAYANAN',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '2316833e-e14a-459a-b725-22b0e0544321', 'VERIFIED-ORION-S0273', 'Athi Narayanan', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2316833e-e14a-459a-b725-22b0e0544321', 1, null, 'Rocks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2316833e-e14a-459a-b725-22b0e0544321', 2, null, 'Rocks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2316833e-e14a-459a-b725-22b0e0544321', 3, null, 'Rocks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2316833e-e14a-459a-b725-22b0e0544321', 4, null, 'Rocks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '2316833e-e14a-459a-b725-22b0e0544321', 5, null, 'Rocks', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0ae9fbd8-0756-418e-90c5-84ca73083517', 'ORION-S0274', 'Undefined Behaviour', 'undefinedbehaviour', '312425148034 MISHALI B S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', '312425148034MISHALIBS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0ae9fbd8-0756-418e-90c5-84ca73083517', 'VERIFIED-ORION-S0274', '312425148034 MISHALI B S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ae9fbd8-0756-418e-90c5-84ca73083517', 1, null, 'Undefined Behaviour', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ae9fbd8-0756-418e-90c5-84ca73083517', 2, null, 'Undefined Behaviour', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ae9fbd8-0756-418e-90c5-84ca73083517', 3, null, 'Undefined Behaviour', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0ae9fbd8-0756-418e-90c5-84ca73083517', 4, null, 'Undefined Behaviour', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'b0fe525e-a435-4ec2-8128-21bc7cf548e2', 'ORION-S0275', 'BOULT', 'boult', 'YUVARAJ S', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'YUVARAJS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'b0fe525e-a435-4ec2-8128-21bc7cf548e2', 'VERIFIED-ORION-S0275', 'YUVARAJ S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b0fe525e-a435-4ec2-8128-21bc7cf548e2', 1, null, 'BOULT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b0fe525e-a435-4ec2-8128-21bc7cf548e2', 2, null, 'BOULT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b0fe525e-a435-4ec2-8128-21bc7cf548e2', 3, null, 'BOULT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'b0fe525e-a435-4ec2-8128-21bc7cf548e2', 4, null, 'BOULT', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'dd542920-91e7-4031-b060-a1f9f69cb921', 'ORION-S0276', 'NeuroNex', 'neuronex', 'Teja Sri M', '', '',
  'Sathyabama Institute of Science and Technology', 'Engineering', 'Student', 'ORION-PS-04: Open Innovation Track', 'TEJASRIM',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Updated official verified roster (2026-09-08)', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'dd542920-91e7-4031-b060-a1f9f69cb921', 'VERIFIED-ORION-S0276', 'Teja Sri M', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:27:39.093Z', '2026-09-08T05:27:39.093Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dd542920-91e7-4031-b060-a1f9f69cb921', 1, null, 'NeuroNex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dd542920-91e7-4031-b060-a1f9f69cb921', 2, null, 'NeuroNex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dd542920-91e7-4031-b060-a1f9f69cb921', 3, null, 'NeuroNex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dd542920-91e7-4031-b060-a1f9f69cb921', 4, null, 'NeuroNex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'dd542920-91e7-4031-b060-a1f9f69cb921', 5, null, 'NeuroNex', '', '', 'Engineering', 'Student', '2026-09-08T05:27:39.093Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ca6feff2-30fd-4ea2-be68-08aa067adfe1', 'ORION-S0277', 'Mindforge', 'mindforge', 'Riyasri.P', '', 'riyasweety16024@gmail.com',
  'Er. Perumal Manimekalai College of Engineering,Hosur', 'B.Tech/ Information Technology', 'Fourth Year', 'ORION-PS-04: Open Innovation Track', 'RIYASRIP',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ca6feff2-30fd-4ea2-be68-08aa067adfe1', 'VERIFIED-ORION-S0277', 'Riyasri.P', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ca6feff2-30fd-4ea2-be68-08aa067adfe1', 1, null, 'Mindforge', '', '', 'B.Tech/ Information Technology', 'Fourth Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ca6feff2-30fd-4ea2-be68-08aa067adfe1', 2, null, 'Mindforge', '', '', 'B.Tech/ Information Technology', 'Fourth Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ca6feff2-30fd-4ea2-be68-08aa067adfe1', 3, null, 'Mindforge', '', '', 'B.Tech/ Information Technology', 'Fourth Year', '2026-09-08T05:33:14.809Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5a0e60da-918d-408b-95a2-e34ceca046ff', 'ORION-S0278', 'CIPHER', 'cipher', 'YOGEESHWARAN C', '', 'yogeeshwaran.c.2025.ece@rajalakshmi.edu.in',
  'RAJALAKSHMI ENGINEERING COLLEGE', 'B.E ECE', 'Second Year', 'ORION-PS-01: FLOATCHAT', 'YOGEESHWARANC',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '5a0e60da-918d-408b-95a2-e34ceca046ff', 'VERIFIED-ORION-S0278', 'YOGEESHWARAN C', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5a0e60da-918d-408b-95a2-e34ceca046ff', 1, null, 'CIPHER', '', '', 'B.E ECE', 'Second Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5a0e60da-918d-408b-95a2-e34ceca046ff', 2, null, 'CIPHER', '', '', 'B.E ECE', 'Second Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5a0e60da-918d-408b-95a2-e34ceca046ff', 3, null, 'CIPHER', '', '', 'B.E ECE', 'Second Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '5a0e60da-918d-408b-95a2-e34ceca046ff', 4, null, 'CIPHER', '', '', 'B.E ECE', 'Second Year', '2026-09-08T05:33:14.809Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '3e64b899-1c81-419b-b230-eb95ea80d98b', 'ORION-S0279', 'IGNITE', 'ignite', 'Janani', '', 'jananijai628@gmail.com',
  'Jeppiaar Institute Technology', 'Information Technology', 'Second Year', 'ORION-PS-04: Open Innovation Track', 'JANANI2026',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '3e64b899-1c81-419b-b230-eb95ea80d98b', 'VERIFIED-ORION-S0279', 'Janani', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3e64b899-1c81-419b-b230-eb95ea80d98b', 1, null, 'IGNITE', '', '', 'Information Technology', 'Second Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3e64b899-1c81-419b-b230-eb95ea80d98b', 2, null, 'IGNITE', '', '', 'Information Technology', 'Second Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3e64b899-1c81-419b-b230-eb95ea80d98b', 3, null, 'IGNITE', '', '', 'Information Technology', 'Second Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '3e64b899-1c81-419b-b230-eb95ea80d98b', 4, null, 'IGNITE', '', '', 'Information Technology', 'Second Year', '2026-09-08T05:33:14.809Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ba50384b-529c-41f2-8d21-79f67e19d6d8', 'ORION-S0280', 'ZENTRIX', 'zentrix', 'AFRINA B', '', 'afrinabasheer1111@gmail.com',
  'DR.N.G.P INSTITUTE OF TECHNOLOGY', 'B.Tech Computer Science and Business Systems', 'Third Year', 'ORION-PS-03: SYLVASENSE', 'AFRINAB2026',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  'ba50384b-529c-41f2-8d21-79f67e19d6d8', 'VERIFIED-ORION-S0280', 'AFRINA B', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba50384b-529c-41f2-8d21-79f67e19d6d8', 1, null, 'ZENTRIX', '', '', 'B.Tech Computer Science and Business Systems', 'Third Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba50384b-529c-41f2-8d21-79f67e19d6d8', 2, null, 'ZENTRIX', '', '', 'B.Tech Computer Science and Business Systems', 'Third Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba50384b-529c-41f2-8d21-79f67e19d6d8', 3, null, 'ZENTRIX', '', '', 'B.Tech Computer Science and Business Systems', 'Third Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba50384b-529c-41f2-8d21-79f67e19d6d8', 4, null, 'ZENTRIX', '', '', 'B.Tech Computer Science and Business Systems', 'Third Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  'ba50384b-529c-41f2-8d21-79f67e19d6d8', 5, null, 'ZENTRIX', '', '', 'B.Tech Computer Science and Business Systems', 'Third Year', '2026-09-08T05:33:14.809Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '586a17ac-2ea8-4305-8d5e-58b86449619d', 'ORION-S0281', 'NEXOVA', 'nexova', 'Shyam Sundar S', '', 'shyamsundar.s.2025.mech@rajalakshmi.edu.in',
  'Rajalakshmi Engineering College', 'Mechanical Engineering', 'Second Year', 'ORION-PS-04: Open Innovation Track', 'SHYAMSUNDARS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '586a17ac-2ea8-4305-8d5e-58b86449619d', 'VERIFIED-ORION-S0281', 'Shyam Sundar S', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '586a17ac-2ea8-4305-8d5e-58b86449619d', 1, null, 'NEXOVA', '', '', 'Mechanical Engineering', 'Second Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '586a17ac-2ea8-4305-8d5e-58b86449619d', 2, null, 'NEXOVA', '', '', 'Mechanical Engineering', 'Second Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '586a17ac-2ea8-4305-8d5e-58b86449619d', 3, null, 'NEXOVA', '', '', 'Mechanical Engineering', 'Second Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '586a17ac-2ea8-4305-8d5e-58b86449619d', 4, null, 'NEXOVA', '', '', 'Mechanical Engineering', 'Second Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '586a17ac-2ea8-4305-8d5e-58b86449619d', 5, null, 'NEXOVA', '', '', 'Mechanical Engineering', 'Second Year', '2026-09-08T05:33:14.809Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '328fecf9-c85d-4085-bfd1-764d72287dd5', 'ORION-S0282', 'Phantom', 'phantom', 'Abishek Sunil Saraswathy', '', 'abishekss2007@gmail.com',
  'Dr. MGR EDUCATION AND RESEARCH INSTITUTE', 'B-Tech (CSE DS&AI)', 'Third Year', 'ORION-PS-04: Open Innovation Track', 'ABISHEKSUNILSARASWATHY',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '328fecf9-c85d-4085-bfd1-764d72287dd5', 'VERIFIED-ORION-S0282', 'Abishek Sunil Saraswathy', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '328fecf9-c85d-4085-bfd1-764d72287dd5', 1, null, 'Phantom', '', '', 'B-Tech (CSE DS&AI)', 'Third Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '328fecf9-c85d-4085-bfd1-764d72287dd5', 2, null, 'Phantom', '', '', 'B-Tech (CSE DS&AI)', 'Third Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '328fecf9-c85d-4085-bfd1-764d72287dd5', 3, null, 'Phantom', '', '', 'B-Tech (CSE DS&AI)', 'Third Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '328fecf9-c85d-4085-bfd1-764d72287dd5', 4, null, 'Phantom', '', '', 'B-Tech (CSE DS&AI)', 'Third Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '328fecf9-c85d-4085-bfd1-764d72287dd5', 5, null, 'Phantom', '', '', 'B-Tech (CSE DS&AI)', 'Third Year', '2026-09-08T05:33:14.809Z'
);

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0286f597-3947-450d-adc5-507964d69161', 'ORION-S0283', 'Spartanzz Apex', 'spartanzzapex', 'Suriya GR', '', 'suriyaravi1926@gmail.com',
  'ADHIPARASAKTHI COLLEGE OF ENGINEERING', 'B.E.Electronics and Communication Engineering (ECE)', 'Third Year', 'ORION-PS-04: Open Innovation Track', 'SURIYAGR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '0286f597-3947-450d-adc5-507964d69161', 'VERIFIED-ORION-S0283', 'Suriya GR', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z', 'Admin Secretariat'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0286f597-3947-450d-adc5-507964d69161', 1, null, 'Spartanzz Apex', '', '', 'B.E.Electronics and Communication Engineering (ECE)', 'Third Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0286f597-3947-450d-adc5-507964d69161', 2, null, 'Spartanzz Apex', '', '', 'B.E.Electronics and Communication Engineering (ECE)', 'Third Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0286f597-3947-450d-adc5-507964d69161', 3, null, 'Spartanzz Apex', '', '', 'B.E.Electronics and Communication Engineering (ECE)', 'Third Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0286f597-3947-450d-adc5-507964d69161', 4, null, 'Spartanzz Apex', '', '', 'B.E.Electronics and Communication Engineering (ECE)', 'Third Year', '2026-09-08T05:33:14.809Z'
);
insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '0286f597-3947-450d-adc5-507964d69161', 5, null, 'Spartanzz Apex', '', '', 'B.E.Electronics and Communication Engineering (ECE)', 'Third Year', '2026-09-08T05:33:14.809Z'
);

commit;
