-- Chunk 4: populate non-leader members for ORION-S0301-ORION-S0307.
-- Safe to rerun.
begin;

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0301');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Neha Neeta A','core shift','','','BE-ECE','Third Year' from public.teams where registration_id='ORION-S0301';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Pavithra K','core shift','','','BE-ECE','Third Year' from public.teams where registration_id='ORION-S0301';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Sai Keertana S','core shift','','','BE-ECE','Third Year' from public.teams where registration_id='ORION-S0301';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'Sakthi SP','core shift','','','BE-ECE','Third Year' from public.teams where registration_id='ORION-S0301';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0302');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Sancia Stephie NP','Zynova','','','BE - Electronics and Communication engineering','Third Year' from public.teams where registration_id='ORION-S0302';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Poornima Prabu','Zynova','','','BE - Electronics and Communication engineering','Third Year' from public.teams where registration_id='ORION-S0302';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Nisrin A','Zynova','','','BE - Electronics and Communication engineering','Third Year' from public.teams where registration_id='ORION-S0302';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'Pragathi Prabu','Zynova','','','BE - Electronics and Communication engineering','Third Year' from public.teams where registration_id='ORION-S0302';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0303');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Sanjana C','ByteForce','','','CSE','Second Year' from public.teams where registration_id='ORION-S0303';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'KAVIN KUMAR AK','ByteForce','','','CSE','Second Year' from public.teams where registration_id='ORION-S0303';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0304');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Venu Raghavan V','INNOVATORS UNITED','','','B.tech Artificial Intelligence & Data Science','Fourth Year' from public.teams where registration_id='ORION-S0304';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Prekshitha V','INNOVATORS UNITED','','','B.tech Artificial Intelligence & Data Science','Fourth Year' from public.teams where registration_id='ORION-S0304';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Shamini V','INNOVATORS UNITED','','','B.tech Artificial Intelligence & Data Science','Fourth Year' from public.teams where registration_id='ORION-S0304';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'Pushparani B','INNOVATORS UNITED','','','B.tech Artificial Intelligence & Data Science','Fourth Year' from public.teams where registration_id='ORION-S0304';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,5,'Rohith Venkatagiri','INNOVATORS UNITED','','','B.tech Artificial Intelligence & Data Science','Fourth Year' from public.teams where registration_id='ORION-S0304';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0305');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'E. Nika R.S','Synergy squad','','','CSE','Second Year' from public.teams where registration_id='ORION-S0305';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Dharunika R','Synergy squad','','','CSE','Second Year' from public.teams where registration_id='ORION-S0305';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0306');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Subashri Selvam','CAGU','','','BSC Data science','Second Year' from public.teams where registration_id='ORION-S0306';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Roshini nachiappan','CAGU','','','BSC Data science','Second Year' from public.teams where registration_id='ORION-S0306';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Hemavarthini A','CAGU','','','BSC Data science','Second Year' from public.teams where registration_id='ORION-S0306';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0307');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Ragavi T','CodeNova','','','Computer science and engineering','Third Year' from public.teams where registration_id='ORION-S0307';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Priyadharshini PG','CodeNova','','','Computer science and engineering','Third Year' from public.teams where registration_id='ORION-S0307';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Rajeswari M','CodeNova','','','Computer science and engineering','Third Year' from public.teams where registration_id='ORION-S0307';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'Sailan RS','CodeNova','','','Computer science and engineering','Third Year' from public.teams where registration_id='ORION-S0307';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,5,'Ranesh S','CodeNova','','','Computer science and engineering','Third Year' from public.teams where registration_id='ORION-S0307';

commit;
