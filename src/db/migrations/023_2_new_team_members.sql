-- Chunk 2: populate non-leader members for ORION-S0285-ORION-S0292.
-- Safe to rerun.
begin;

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0285');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Ambati Teja Venkat','X','','','BSC(AI&DS)','Second Year' from public.teams where registration_id='ORION-S0285';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'SaMi.JEEVA','X','','','BSC(AI&DS)','Second Year' from public.teams where registration_id='ORION-S0285';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Harishmen S','X','','','BSC(AI&DS)','Second Year' from public.teams where registration_id='ORION-S0285';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'SRI BALAJI E','X','','','BSC(AI&DS)','Second Year' from public.teams where registration_id='ORION-S0285';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,5,'ARAVIND.P','X','','','BSC(AI&DS)','Second Year' from public.teams where registration_id='ORION-S0285';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0286');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Divya darshnee G','Quantum quorum','','','IT','Third Year' from public.teams where registration_id='ORION-S0286';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Navin Kumar V','Quantum quorum','','','IT','Third Year' from public.teams where registration_id='ORION-S0286';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Lalitha priyan CK','Quantum quorum','','','IT','Third Year' from public.teams where registration_id='ORION-S0286';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'Thaarani S','Quantum quorum','','','IT','Third Year' from public.teams where registration_id='ORION-S0286';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,5,'Krithik shankar','Quantum quorum','','','IT','Third Year' from public.teams where registration_id='ORION-S0286';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0287');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'MADHANKUMAR K','NEURO TRIX','','','AIML','Second Year' from public.teams where registration_id='ORION-S0287';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Nikilesh kumar S S','NEURO TRIX','','','AIML','Second Year' from public.teams where registration_id='ORION-S0287';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Mukesh K','NEURO TRIX','','','AIML','Second Year' from public.teams where registration_id='ORION-S0287';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'Vishnu D','NEURO TRIX','','','AIML','Second Year' from public.teams where registration_id='ORION-S0287';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,5,'Prajeeth R','NEURO TRIX','','','AIML','Second Year' from public.teams where registration_id='ORION-S0287';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0288');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'SIGIN A','ENJOY THE PRESSURE','','','BE ECE','Second Year' from public.teams where registration_id='ORION-S0288';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'SURENDHAR K A','ENJOY THE PRESSURE','','','BE ECE','Second Year' from public.teams where registration_id='ORION-S0288';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'SANDHIYA V','ENJOY THE PRESSURE','','','BE ECE','Second Year' from public.teams where registration_id='ORION-S0288';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'SARANI A','ENJOY THE PRESSURE','','','BE ECE','Second Year' from public.teams where registration_id='ORION-S0288';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,5,'PRIYADHIRISHINI M','ENJOY THE PRESSURE','','','BE ECE','Second Year' from public.teams where registration_id='ORION-S0288';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0289');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'DEVAMITHRA R G','Hacksprint','','','CSE','Second Year' from public.teams where registration_id='ORION-S0289';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'HASHINI O S','Hacksprint','','','CSE','Second Year' from public.teams where registration_id='ORION-S0289';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'ROHINI S','Hacksprint','','','CSE','Second Year' from public.teams where registration_id='ORION-S0289';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0290');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Ajmath R K','Fsociety','','','BE CSE','First Year' from public.teams where registration_id='ORION-S0290';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0291');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Madhumitha C','InnovateX','','','CSE','Fourth Year' from public.teams where registration_id='ORION-S0291';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Harini K','InnovateX','','','CSE','Fourth Year' from public.teams where registration_id='ORION-S0291';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Aiswarya P','InnovateX','','','CSE','Fourth Year' from public.teams where registration_id='ORION-S0291';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'Ezhilarasi C','InnovateX','','','CSE','Fourth Year' from public.teams where registration_id='ORION-S0291';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0292');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'RAMYA BHUVANESHWARI K','DEEPVERSE','','','BE- CSE','Third Year' from public.teams where registration_id='ORION-S0292';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'MONI J K','DEEPVERSE','','','BE- CSE','Third Year' from public.teams where registration_id='ORION-S0292';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'PREM S','DEEPVERSE','','','BE- CSE','Third Year' from public.teams where registration_id='ORION-S0292';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'NAVEEN KUMAR A','DEEPVERSE','','','BE- CSE','Third Year' from public.teams where registration_id='ORION-S0292';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,5,'VISHAL S','DEEPVERSE','','','BE- CSE','Third Year' from public.teams where registration_id='ORION-S0292';

commit;
