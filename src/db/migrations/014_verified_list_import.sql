-- ==============================================================================
-- ORION 1.0 - Migration 014: VERIFIED LIST IMPORT
-- ==============================================================================
--
-- Source: Verified_list.xlsx - 86 rows, 17 teams, carrying what the earlier
-- spreadsheet import lacked: a leader email, a phone for EVERY member, and a
-- problem statement code. These teams registered through the real form, so they
-- also carry ORION-2026-#### ids.
--
-- Seven of the seventeen were already in the database under an ORION-S id with
-- the same leader, so they are ENRICHED in place rather than inserted again and
-- no squad appears twice:
--
--   ORION-2026-0168 -> ORION-S0007 HEXAFLUX       6/6 names matched
--   ORION-2026-0164 -> ORION-S0004 TechXKuzhu     6/6, one via prefix match
--   ORION-2026-0222 -> ORION-S0048 BytePulse      6/6, one via prefix match
--   ORION-2026-0166 -> ORION-S0049 Binary Titans  2/2
--   ORION-2026-0155 -> ORION-S0082 Brain Byte     4/4
--   ORION-2026-0225 -> ORION-S0031 Hack Hawks     5/5. RAGHUL J is in the DB
--                                                 roster but not the verified
--                                                 list, so he is KEPT without a
--                                                 phone rather than dropped.
--   ORION-2026-0240 -> ORION-S0044 Wakandians     0/4 - see step 3
--
-- ORION-S0044 is the exception. Its spreadsheet roster was corrupt: one field
-- held two people ("S. SAKTHI SRI, Ashvin Prasad. k") and not one name matched
-- the verified record, so name-level phone backfill was impossible. Its roster
-- is replaced wholesale with the 4 verified members and the previous roster is
-- archived to audit_logs. The team is also renamed "Deadline Warriors" ->
-- "Wakandians" per the verified list; the migration 011 trigger propagates that
-- across team_members automatically.
--
-- The remaining ten are inserted as new teams. All seventeen are marked
-- payment_status = VERIFIED, which is what the admin panel TEAMS tab filters on.
-- No payments rows are created: the source file has neither a UTR nor an amount,
-- and inventing them would pollute the ledger.
--
-- Phones are stored as given, minus a stray leading apostrophe Excel had put on
-- some cells. Mixed +91 and bare 10-digit forms are preserved, not normalised.
--
-- Safe to re-run.
-- ------------------------------------------------------------------------------

-- 1. Enrich the seven teams already present -----------------------------------

update public.teams set team_name='HEXAFLUX', leader_name='Sakthi lakshmi G',
  leader_email='laksh.sakthi07@gmail.com', leader_phone='6383624675', problem_statement='ORION-PS-04',
  payment_status='VERIFIED', admin_notes='Verified list. Registration form ID ORION-2026-0168'
 where registration_id='ORION-S0007';

update public.teams set team_name='TechXKuzhu', leader_name='Thanishka Yogesh',
  leader_email='thanishka.ykb@gmail.com', leader_phone='9025658705', problem_statement='ORION-PS-04',
  payment_status='VERIFIED', admin_notes='Verified list. Registration form ID ORION-2026-0164'
 where registration_id='ORION-S0004';

update public.teams set team_name='BytePulse', leader_name='Sadhana V',
  leader_email='sadhanavengatachalam@gmail.com', leader_phone='7339065384', problem_statement='ORION-PS-01',
  payment_status='VERIFIED', admin_notes='Verified list. Registration form ID ORION-2026-0222'
 where registration_id='ORION-S0048';

update public.teams set team_name='Binary Titans', leader_name='M.MADHURI',
  leader_email='madhurimylu2007@gmai.com', leader_phone='7396720188', problem_statement='ORION-PS-04',
  payment_status='VERIFIED', admin_notes='Verified list. Registration form ID ORION-2026-0166'
 where registration_id='ORION-S0049';

update public.teams set team_name='Brain Byte', leader_name='Aditi Phulre',
  leader_email='phulre.aditi@gmail.com', leader_phone='9088307569', problem_statement='ORION-PS-03',
  payment_status='VERIFIED', admin_notes='Verified list. Registration form ID ORION-2026-0155'
 where registration_id='ORION-S0082';

update public.teams set team_name='Hack Hawks', leader_name='Gopi Krishna S',
  leader_email='gopikaru0090@gmail.com', leader_phone='7904223010', problem_statement='ORION-PS-04',
  payment_status='VERIFIED', admin_notes='Verified list. Registration form ID ORION-2026-0225'
 where registration_id='ORION-S0031';

update public.teams set team_name='Wakandians', leader_name='AR.AKSHAYA KRUTHIK',
  leader_email='akshaykruthik7@gmail.com', leader_phone='9626141402', problem_statement='ORION-PS-04',
  payment_status='VERIFIED', admin_notes='Verified list. Registration form ID ORION-2026-0240 (was "Deadline Warriors")'
 where registration_id='ORION-S0044';


-- 2. Backfill member phones by normalised-name match (exact or prefix) --------

update public.team_members m set member_phone=v.ph
from (values
('ORION-S0007','sakthilakshmig','6383624675'),
('ORION-S0007','sarifaafrinm','+917010677492'),
('ORION-S0007','sahayaancyj','+919043858647'),
('ORION-S0007','roshiniinfentas','+919360698861'),
('ORION-S0007','sanjivandrew','+917845886803'),
('ORION-S0007','sanjaig','+916369643129'),
('ORION-S0004','thanishkayogesh','9025658705'),
('ORION-S0004','suryas','7338927172'),
('ORION-S0004','lokeshwarir','6383350485'),
('ORION-S0004','nithishkumars','7598251919'),
('ORION-S0004','mithunv','6379832513'),
('ORION-S0004','madhukarthikeyan','9361581267'),
('ORION-S0048','sadhanav','7339065384'),
('ORION-S0048','rithikar','8610705172'),
('ORION-S0048','ragavis','6381664839'),
('ORION-S0048','poornaav','7550313068'),
('ORION-S0048','prasanambikas','8056398387'),
('ORION-S0048','pranikashreec','6381542154'),
('ORION-S0049','mmadhuri','7396720188'),
('ORION-S0049','rshivaram','9346839784'),
('ORION-S0082','aditiphulre','9088307569'),
('ORION-S0082','adityaswaroop','9263242346'),
('ORION-S0082','bhavaymittal','9992935450'),
('ORION-S0082','kavyasingh','7372023185'),
('ORION-S0031','gopikrishnas','7904223010'),
('ORION-S0031','yogeshwark','9159338232'),
('ORION-S0031','salmans','8124849315'),
('ORION-S0031','kishorkumars','6385502305'),
('ORION-S0031','vishnub','7299223722')
) as v(rid,nrm,ph)
join public.teams t on t.registration_id=v.rid
where m.team_id=t.id and (
  lower(regexp_replace(m.member_name,'[^a-zA-Z0-9]','','g'))=v.nrm
  or lower(regexp_replace(m.member_name,'[^a-zA-Z0-9]','','g')) like v.nrm||'%'
  or v.nrm like lower(regexp_replace(m.member_name,'[^a-zA-Z0-9]','','g'))||'%');


-- 3. ORION-S0044: corrupt roster replaced wholesale, old roster archived ------
do $$
declare tid uuid; old_roster text;
begin
  select id into tid from public.teams where registration_id='ORION-S0044';
  if tid is null then return; end if;
  select string_agg(member_name, ' | ' order by member_number) into old_roster
    from public.team_members where team_id=tid;
  if old_roster is distinct from 'AR.AKSHAYA KRUTHIK | R.DHEERAJ ABHAY | R.AVINASH | K.ASHVIN PRASAD' then
    insert into public.audit_logs (team_id, team_name, actor, action, details)
    values (tid, 'Wakandians', 'Data cleanup', 'ROSTER_REPLACED_FROM_VERIFIED_LIST',
      format('Roster replaced from verified list (form ID ORION-2026-0240); the spreadsheet '
             'roster was corrupt and no name matched. Previous roster: %s', old_roster));
    delete from public.team_members where team_id=tid;
    insert into public.team_members (team_id, member_number, member_name, member_phone)
    select tid, v.n, v.nm, v.ph from (values
      (1,'AR.AKSHAYA KRUTHIK','9626141402'),
      (2,'R.DHEERAJ ABHAY','7904027680'),
      (3,'R.AVINASH','6369313391'),
      (4,'K.ASHVIN PRASAD','8807611824')
    ) as v(n,nm,ph);
  end if;
end $$;

-- 4. The ten teams not previously in the database -----------------------------

insert into public.teams
 (registration_id,team_name,leader_name,leader_phone,leader_email,institution,problem_statement,payment_status,registration_status,access_token,admin_notes)
values
('ORION-2026-0235','Apex accelerator','A Sudharshun','6374538533','dharshanarul2510@gmail.com','','ORION-PS-04','VERIFIED','REGISTERED','effb58a4f43d3b49bc8536df4e88676b','Verified list import'),
('ORION-2026-0234','CODE CRACKERS','Monish R','8248948880','monish.rajesh07@gmail.com','','ORION-PS-01','VERIFIED','REGISTERED','37297a1338c5369f07920fe9b8739d58','Verified list import'),
('ORION-2026-0233','Asgardians','Joel Devotta C','9944465812','310625104144@eec.srmrmp.edu.in','','ORION-PS-04','VERIFIED','REGISTERED','e5d8405ae8c6cbc481afee97406b7bbd','Verified list import'),
('ORION-2026-0230','Code Boosters','Samwilson Joshua','+918778308551','killergod419@gmail.com','','ORION-PS-04','VERIFIED','REGISTERED','c001c9566b8e9f8622049f8374464c41','Verified list import'),
('ORION-2026-0226','MADMAXX','Abinandhana A','9080941591','sit24it057@sairamtap.edu.in','','ORION-PS-04','VERIFIED','REGISTERED','9f3b9860a50d1874dad7ce2fb409c034','Verified list import'),
('ORION-2026-0224','RunTime Error','Charen','8072744487','s.charen1503@gmail.com','','ORION-PS-03','VERIFIED','REGISTERED','8ddf59146c06066e4d38ae47a694fca3','Verified list import'),
('ORION-2026-0223','MotwaGuard','Monica.V','9710675396','venkateshmonica253@gmail.com','','ORION-PS-04','VERIFIED','REGISTERED','6d24eabee2731ebdec2ededb1382ae4e','Verified list import'),
('ORION-2026-0219','Phoenix Protocol','SRI LAKSHMI V J','7904190454','25cs208@rmkcet.ac.in','','ORION-PS-03','VERIFIED','REGISTERED','c2e5327da3f871bdd307f0893c4b7de6','Verified list import'),
('ORION-2026-0161','TensorTech','SANJAI V','8270142320','shivasanjai6@gmail.com','','ORION-PS-03','VERIFIED','REGISTERED','8441a660cb1371cc741e6c7484a11e2e','Verified list import'),
('ORION-2026-0158','THE HEXA GEN','HRITHISHVAR R','7448564732','hrithish316@gmail.com','','ORION-PS-04','VERIFIED','REGISTERED','0a07b97c5ed34079d5724dcd16c6765e','Verified list import')
on conflict (registration_id) do nothing;


insert into public.team_members (team_id,member_number,member_name,member_phone)
select t.id, v.n, v.nm, v.ph from (values
('ORION-2026-0235',1,'A Sudharshun','6374538533'),
('ORION-2026-0235',2,'Thejasvin S','8682807565'),
('ORION-2026-0235',3,'Tharaneish MJ','8807131513'),
('ORION-2026-0235',4,'S Sathya selvan','9043739186'),
('ORION-2026-0235',5,'PT Kishore','7708385694'),
('ORION-2026-0235',6,'B karthik jeeva','7339669685'),
('ORION-2026-0234',1,'Monish R','8248948880'),
('ORION-2026-0234',2,'Vasantharaj M','6383613366'),
('ORION-2026-0234',3,'E Harishankar','7695974390'),
('ORION-2026-0234',4,'Kaavinesh K','8754950418'),
('ORION-2026-0234',5,'Roshan B','6385634305'),
('ORION-2026-0234',6,'Mohan K','7871651457'),
('ORION-2026-0233',1,'Joel Devotta C','9944465812'),
('ORION-2026-0233',2,'Joseph Dan Vassili A','8144034414'),
('ORION-2026-0233',3,'Kavin S','9962925670'),
('ORION-2026-0233',4,'John rishwin A','9597650608'),
('ORION-2026-0233',5,'Kamal S','7305588137'),
('ORION-2026-0233',6,'Kamlesh J','9342634461'),
('ORION-2026-0230',1,'Samwilson Joshua','+918778308551'),
('ORION-2026-0230',2,'FARHAAN','8754078146'),
('ORION-2026-0230',3,'ManiKandan','+917871038993'),
('ORION-2026-0230',4,'Ragul Ram','+919342390926'),
('ORION-2026-0230',5,'Nithish Ram','+917695848500'),
('ORION-2026-0230',6,'Sri Jayashanmugavel','+917010605983'),
('ORION-2026-0226',1,'Abinandhana A','9080941591'),
('ORION-2026-0226',2,'Anikasri B','7530061176'),
('ORION-2026-0226',3,'S.Priyadharshini','8754871634'),
('ORION-2026-0226',4,'Sunethra J','7338736284'),
('ORION-2026-0224',1,'Charen','8072744487'),
('ORION-2026-0224',2,'Sai sri vathsan','7010315994'),
('ORION-2026-0223',1,'Monica.V','9710675396'),
('ORION-2026-0223',2,'Karthikeyan B','9543522228'),
('ORION-2026-0223',3,'Velvizhi K','9092209949'),
('ORION-2026-0223',4,'Ram Prasath G','8220718893'),
('ORION-2026-0223',5,'Deepika M','9500172995'),
('ORION-2026-0223',6,'Dhinesh Kumar V','9363039364'),
('ORION-2026-0219',1,'SRI LAKSHMI V J','7904190454'),
('ORION-2026-0219',2,'DEVIPRIYA R','8270865049'),
('ORION-2026-0219',3,'THANVITHA DOMMARAJU CHANDRASEKHAR','7418698674'),
('ORION-2026-0219',4,'VALERIN BRUCE','7708479799'),
('ORION-2026-0219',5,'SATHYA K','9791206147'),
('ORION-2026-0219',6,'SHARMISTHA K','9342005789'),
('ORION-2026-0161',1,'SANJAI V','8270142320'),
('ORION-2026-0161',2,'Balaguru E','9677149536'),
('ORION-2026-0161',3,'Harini M','7339251248'),
('ORION-2026-0161',4,'Ranjitha M','9344710361'),
('ORION-2026-0161',5,'Kabitha P','7639700282'),
('ORION-2026-0161',6,'Mohammed Gani S','8248801808'),
('ORION-2026-0158',1,'HRITHISHVAR R','7448564732'),
('ORION-2026-0158',2,'LOKESHWARAN T','7358723982'),
('ORION-2026-0158',3,'KAVYASRI R','7708623690'),
('ORION-2026-0158',4,'HARINI JAISHANKAR','7200635042'),
('ORION-2026-0158',5,'RITHIKASRI','8825705822')
) as v(rid,n,nm,ph) join public.teams t on t.registration_id=v.rid
on conflict (team_id, member_number) do nothing;
