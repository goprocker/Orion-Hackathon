-- Chunk 3: populate non-leader members for ORION-S0293-ORION-S0300.
-- Safe to rerun.
begin;

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0293');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Bharath raj K','Rapid current crew','','','BE.Electronic engineering (VLSI & DT)','Third Year' from public.teams where registration_id='ORION-S0293';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'M Elanchezhiyan','Rapid current crew','','','BE.Electronic engineering (VLSI & DT)','Third Year' from public.teams where registration_id='ORION-S0293';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Sathish Kumar R','Rapid current crew','','','BE.Electronic engineering (VLSI & DT)','Third Year' from public.teams where registration_id='ORION-S0293';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'Kavinitha K','Rapid current crew','','','BE.Electronic engineering (VLSI & DT)','Third Year' from public.teams where registration_id='ORION-S0293';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,5,'Uma R','Rapid current crew','','','BE.Electronic engineering (VLSI & DT)','Third Year' from public.teams where registration_id='ORION-S0293';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0294');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Janiish R','Phoenix','','','Computer Science and Business System','Second Year' from public.teams where registration_id='ORION-S0294';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Dani Joshua','Phoenix','','','Computer Science and Business System','Second Year' from public.teams where registration_id='ORION-S0294';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Akshara B','Phoenix','','','Computer Science and Business System','Second Year' from public.teams where registration_id='ORION-S0294';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'Dharshana','Phoenix','','','Computer Science and Business System','Second Year' from public.teams where registration_id='ORION-S0294';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,5,'Edward','Phoenix','','','Computer Science and Business System','Second Year' from public.teams where registration_id='ORION-S0294';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0295');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Prisha S','Success chaser','','','Information Technology','Second Year' from public.teams where registration_id='ORION-S0295';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Manimozhi R','Success chaser','','','Information Technology','Second Year' from public.teams where registration_id='ORION-S0295';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Pradikshina R','Success chaser','','','Information Technology','Second Year' from public.teams where registration_id='ORION-S0295';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'Sakthi ganesh','Success chaser','','','Information Technology','Second Year' from public.teams where registration_id='ORION-S0295';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,5,'Balakrishnan','Success chaser','','','Information Technology','Second Year' from public.teams where registration_id='ORION-S0295';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0296');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Lekha Shree S','AURA','','','Electronics and communication engineering','Third Year' from public.teams where registration_id='ORION-S0296';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Maya B Menon','AURA','','','Electronics and communication engineering','Third Year' from public.teams where registration_id='ORION-S0296';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Indu S','AURA','','','Electronics and communication engineering','Third Year' from public.teams where registration_id='ORION-S0296';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0297');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Yuvarani','MIDX','','','B.tech it','Second Year' from public.teams where registration_id='ORION-S0297';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0298');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Balamurugen S N','DankDuoCore','','','B.E. - Electronics and Communication Engineering','Third Year' from public.teams where registration_id='ORION-S0298';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0299');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'MOHAMMED SALIK R','TECHVERSE','','','BE COMPUTER SCIENCE AND ENGINEERING','Third Year' from public.teams where registration_id='ORION-S0299';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'MOHAMMED SAYEED S','TECHVERSE','','','BE COMPUTER SCIENCE AND ENGINEERING','Third Year' from public.teams where registration_id='ORION-S0299';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'ZIA ANES M','TECHVERSE','','','BE COMPUTER SCIENCE AND ENGINEERING','Third Year' from public.teams where registration_id='ORION-S0299';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'RAKSHITHA B','TECHVERSE','','','BE COMPUTER SCIENCE AND ENGINEERING','Third Year' from public.teams where registration_id='ORION-S0299';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,5,'THULASI S','TECHVERSE','','','BE COMPUTER SCIENCE AND ENGINEERING','Third Year' from public.teams where registration_id='ORION-S0299';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0300');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Shakthivel H','Tech Rockstars','','','CSE','Third Year' from public.teams where registration_id='ORION-S0300';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Mohammed Ayub S','Tech Rockstars','','','CSE','Third Year' from public.teams where registration_id='ORION-S0300';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Radha Krishnan R','Tech Rockstars','','','CSE','Third Year' from public.teams where registration_id='ORION-S0300';

commit;
