-- Populate non-leader members for every newly added team, S0277-S0307.
-- Leaders remain exclusively in teams.leader_name. Safe to rerun.
begin;

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0277');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'F.Thasmiya','Mindforge','','','B.Tech/ Information Technology','Fourth Year' from public.teams where registration_id='ORION-S0277';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Pooja.B.R','Mindforge','','','B.Tech/ Information Technology','Fourth Year' from public.teams where registration_id='ORION-S0277';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'L.Srividhya','Mindforge','','','B.Tech/ Information Technology','Fourth Year' from public.teams where registration_id='ORION-S0277';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0278');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'YESWANT SAKTHI SK','CIPHER','','','B.E ECE','Second Year' from public.teams where registration_id='ORION-S0278';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'YUVARAJ D','CIPHER','','','B.E ECE','Second Year' from public.teams where registration_id='ORION-S0278';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'VIJAY KANNAN S','CIPHER','','','B.E ECE','Second Year' from public.teams where registration_id='ORION-S0278';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'THEJESHVAR KUMURAN','CIPHER','','','B.E ECE','Second Year' from public.teams where registration_id='ORION-S0278';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0279');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Keerthi Vasan . R','IGNITE','','','Information Technology','Second Year' from public.teams where registration_id='ORION-S0279';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Sumaiya.N','IGNITE','','','Information Technology','Second Year' from public.teams where registration_id='ORION-S0279';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Kavipriya.A','IGNITE','','','Information Technology','Second Year' from public.teams where registration_id='ORION-S0279';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'Raga Shri .VS','IGNITE','','','Information Technology','Second Year' from public.teams where registration_id='ORION-S0279';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0280');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'ABETHA SENTHALIR S V','ZENTRIX','','','B.Tech Computer Science and Business Systems','Third Year' from public.teams where registration_id='ORION-S0280';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'PREETHI S','ZENTRIX','','','B.Tech Computer Science and Business Systems','Third Year' from public.teams where registration_id='ORION-S0280';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'SHRI VIDYA S','ZENTRIX','','','B.Tech Computer Science and Business Systems','Third Year' from public.teams where registration_id='ORION-S0280';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'PAVITHRA R','ZENTRIX','','','B.Tech Computer Science and Business Systems','Third Year' from public.teams where registration_id='ORION-S0280';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,5,'DHASARATHI O P','ZENTRIX','','','B.Tech Computer Science and Business Systems','Third Year' from public.teams where registration_id='ORION-S0280';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0281');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Kalai Selvi sk','NEXOVA','','','Mechanical Engineering','Second Year' from public.teams where registration_id='ORION-S0281';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Sridhar Bhat','NEXOVA','','','Mechanical Engineering','Second Year' from public.teams where registration_id='ORION-S0281';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Sujith KR','NEXOVA','','','Mechanical Engineering','Second Year' from public.teams where registration_id='ORION-S0281';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'Shivaani NT','NEXOVA','','','Mechanical Engineering','Second Year' from public.teams where registration_id='ORION-S0281';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,5,'Tharan S','NEXOVA','','','Mechanical Engineering','Second Year' from public.teams where registration_id='ORION-S0281';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0282');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Balamurugan v','Phantom','','','B-Tech (CSE DS&AI)','Third Year' from public.teams where registration_id='ORION-S0282';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Easwara Ramana','Phantom','','','B-Tech (CSE DS&AI)','Third Year' from public.teams where registration_id='ORION-S0282';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Lalith Adithya S','Phantom','','','B-Tech (CSE DS&AI)','Third Year' from public.teams where registration_id='ORION-S0282';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'Ajesh R K','Phantom','','','B-Tech (CSE DS&AI)','Third Year' from public.teams where registration_id='ORION-S0282';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,5,'Chaturya ekshitha','Phantom','','','B-Tech (CSE DS&AI)','Third Year' from public.teams where registration_id='ORION-S0282';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0283');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'Srikanth M','Spartanzz Apex','','','B.E.Electronics and Communication Engineering (ECE)','Third Year' from public.teams where registration_id='ORION-S0283';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'Sumanraj K','Spartanzz Apex','','','B.E.Electronics and Communication Engineering (ECE)','Third Year' from public.teams where registration_id='ORION-S0283';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'Yokesh E','Spartanzz Apex','','','B.E.Electronics and Communication Engineering (ECE)','Third Year' from public.teams where registration_id='ORION-S0283';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,4,'Monishkumar P','Spartanzz Apex','','','B.E.Electronics and Communication Engineering (ECE)','Third Year' from public.teams where registration_id='ORION-S0283';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,5,'Bharathkumar V','Spartanzz Apex','','','B.E.Electronics and Communication Engineering (ECE)','Third Year' from public.teams where registration_id='ORION-S0283';

delete from public.team_members where team_id=(select id from public.teams where registration_id='ORION-S0284');
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,1,'ASHWIN C S','Team Titans','','','ECE','Second Year' from public.teams where registration_id='ORION-S0284';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,2,'AJAY KUMAR S','Team Titans','','','ECE','Second Year' from public.teams where registration_id='ORION-S0284';
insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,3,'KALEESWARAN M','Team Titans','','','ECE','Second Year' from public.teams where registration_id='ORION-S0284';

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
