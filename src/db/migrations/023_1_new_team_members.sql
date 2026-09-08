-- Chunk 1: populate non-leader members for ORION-S0277-ORION-S0284.
-- Safe to rerun.
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

commit;
