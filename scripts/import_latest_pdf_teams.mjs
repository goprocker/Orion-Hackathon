import fs from 'node:fs';
import crypto from 'node:crypto';

// Rows S0284-S0307 from "ORION 1.0 - Form responses 1 (2).pdf".
// Shape: id, team, leader, email, department, year, institution, problem, members.
const rows = [
  ['ORION-S0284','Team Titans','JEFFRIN S','appuzx444@gmail.com','ECE','Second Year','DHANALAKSHMI SRINIVASAN COLLEGE OF ENGINEERING COIMBATORE','ORION-PS-04: Open Innovation Track',['ASHWIN C S','AJAY KUMAR S','KALEESWARAN M']],
  ['ORION-S0285','X','K.S.Lakshman Kumar','lakshmankumar2406@gmail.com','BSC(AI&DS)','Second Year','VELS university','ORION-PS-03: SYLVASENSE',['Ambati Teja Venkat','SaMi.JEEVA','Harishmen S','SRI BALAJI E','ARAVIND.P']],
  ['ORION-S0286','Quantum quorum','Nithesh R','nitheshpec@gmail.com','IT','Third Year','Panimalar engineering college','ORION-PS-04: Open Innovation Track',['Divya darshnee G','Navin Kumar V','Lalitha priyan CK','Thaarani S','Krithik shankar']],
  ['ORION-S0287','NEURO TRIX','Manoj M','manojmurugesan1980@gmail.com','AIML','Second Year','Sri Shakthi Institute of engineering and technology, Coimbatore','ORION-PS-01: FLOATCHAT',['MADHANKUMAR K','Nikilesh kumar S S','Mukesh K','Vishnu D','Prajeeth R']],
  ['ORION-S0288','ENJOY THE PRESSURE','SRIKUMARAN R S','srikumaranrs14@gmail.com','BE ECE','Second Year','MAHENDRA INSTITUTE OF TECHNOLOGY','ORION-PS-04: Open Innovation Track',['SIGIN A','SURENDHAR K A','SANDHIYA V','SARANI A','PRIYADHIRISHINI M']],
  ['ORION-S0289','Hacksprint','Rithanya Saravanan','rithanyasaravanan18@gmail.com','CSE','Second Year','Bannari Amman Institute of Technology','ORION-PS-04: Open Innovation Track',['DEVAMITHRA R G','HASHINI O S','ROHINI S']],
  ['ORION-S0290','Fsociety','Prasanna B','prasanna2009126@gmail.com','BE CSE','First Year','Sathyabama University','ORION-PS-01: FLOATCHAT',['Ajmath R K']],
  ['ORION-S0291','InnovateX','Kishor J J','kishorjj05@gmail.com','CSE','Fourth Year','Jerusalem College of Engineering','ORION-PS-04: Open Innovation Track',['Madhumitha C','Harini K','Aiswarya P','Ezhilarasi C']],
  ['ORION-S0292','DEEPVERSE','MONIKA D','monikadevanathan2007@gmail.com','BE- CSE','Third Year','Anand institution of higher technology','ORION-PS-01: FLOATCHAT',['RAMYA BHUVANESHWARI K','MONI J K','PREM S','NAVEEN KUMAR A','VISHAL S']],
  ['ORION-S0293','Rapid current crew','KiranKumar S','kirankumar8015421877@gmail.com','BE.Electronic engineering (VLSI & DT)','Third Year','SA Engineering college','ORION-PS-04: Open Innovation Track',['Bharath raj K','M Elanchezhiyan','Sathish Kumar R','Kavinitha K','Uma R']],
  ['ORION-S0294','Phoenix','Hariharan S','hariharan11726@gmail.com','Computer Science and Business System','Second Year','Dhaanish Chennai Engineering College','ORION-PS-01: FLOATCHAT',['Janiish R','Dani Joshua','Akshara B','Dharshana','Edward']],
  ['ORION-S0295','Success chaser','Surendhar .S','surendhar.2505150@srec.ac.in','Information Technology','Second Year','Sri Ramakrishna engineering college','ORION-PS-02: LEXVAULT',['Prisha S','Manimozhi R','Pradikshina R','Sakthi ganesh','Balakrishnan']],
  ['ORION-S0296','AURA','Mona','mona.14032006@gmail.com','Electronics and communication engineering','Third Year','Easwari engineering college','ORION-PS-04: Open Innovation Track',['Lekha Shree S','Maya B Menon','Indu S']],
  ['ORION-S0297','MIDX','S.ELAKKEYAA','elakkeyaasasikumar@gmail.com','B.tech it','Second Year','Hindusthan college of engineering','ORION-PS-04: Open Innovation Track',['Yuvarani']],
  ['ORION-S0298','DankDuoCore','Pradeepa S N','310624106149@eec.srmrmp.edu.in','B.E. - Electronics and Communication Engineering','Third Year','SRM Easwari Engineering College','ORION-PS-01: FLOATCHAT',['Balamurugen S N']],
  ['ORION-S0299','TECHVERSE','M MOHAMMED UMAR','mmohammedumar59@gmail.com','BE COMPUTER SCIENCE AND ENGINEERING','Third Year','C ABDUL HAKEEM COLLEGE OF ENGINEERING AND TECHNOLOGY','ORION-PS-04: Open Innovation Track',['MOHAMMED SALIK R','MOHAMMED SAYEED S','ZIA ANES M','RAKSHITHA B','THULASI S']],
  ['ORION-S0300','Tech Rockstars','S Varun Narayan','varuns.181890@gmail.com','CSE','Third Year','Meenakshi Sundararajan Engineering College Kodambakkam','ORION-PS-02: LEXVAULT',['Shakthivel H','Mohammed Ayub S','Radha Krishnan R']],
  ['ORION-S0301','core shift','Rupavathy M','rupavathymeikandamuthu@gmail.com','BE-ECE','Third Year','Easwari Engineering College','ORION-PS-04: Open Innovation Track',['Neha Neeta A','Pavithra K','Sai Keertana S','Sakthi SP']],
  ['ORION-S0302','Zynova','Samvridha D','samvridha0@gmail.com','BE - Electronics and Communication engineering','Third Year','SRM Easwari engineering college','ORION-PS-01: FLOATCHAT',['Sancia Stephie NP','Poornima Prabu','Nisrin A','Pragathi Prabu']],
  ['ORION-S0303','ByteForce','Sri Thean Mathy','sritheanmathy@gmail.com','CSE','Second Year','Thiagarajar College of engineering','ORION-PS-04: Open Innovation Track',['Sanjana C','KAVIN KUMAR AK']],
  ['ORION-S0304','INNOVATORS UNITED','Swetha Suresh','swethasuresh1905@gmail.com','B.tech Artificial Intelligence & Data Science','Fourth Year','Dhanalakshmi College Of Engineering','ORION-PS-04: Open Innovation Track',['Venu Raghavan V','Prekshitha V','Shamini V','Pushparani B','Rohith Venkatagiri']],
  ['ORION-S0305','Synergy squad','ShreeShopika S.N','shreeshopikasomasundaram22@gmail.com','CSE','Second Year','Bannari Amman Institute of Technology, Sathy, Erode','ORION-PS-04: Open Innovation Track',['E. Nika R.S','Dharunika R']],
  ['ORION-S0306','CAGU','Priya dharshini saravanan','priyadharshinisaravanan924@gmail.com','BSC Data science','Second Year','Sathyabama Institute of science and technology','ORION-PS-04: Open Innovation Track',['Subashri Selvam','Roshini nachiappan','Hemavarthini A']],
  ['ORION-S0307','CodeNova','Poorva M','poorvam24cs@psnacet.edu.in','Computer science and engineering','Third Year','PSNA COLLEGE OF ENGINEERING AND TECHNOLOGY','ORION-PS-04: Open Innovation Track',['Ragavi T','Priyadharshini PG','Rajeswari M','Sailan RS','Ranesh S']],
];

const slug = (value) => value.replace(/[^a-z0-9]/gi, '');
const esc = (value) => String(value).replaceAll("'", "''");
const storePath = '.data/orion_store.json';
const store = JSON.parse(fs.readFileSync(storePath, 'utf8'));
const now = new Date().toISOString();

for (const team of store.teams) {
  team.username = slug(team.team_name).toLowerCase();
  team.access_token = slug(team.leader_name).toUpperCase();
}

for (const [rid, name, leader, email, department, year, institution, problem, memberNames] of rows) {
  if (store.teams.some((team) => team.registration_id === rid)) continue;
  const teamId = crypto.randomUUID();
  const payment = { id: crypto.randomUUID(), team_id: teamId, utr_number: `VERIFIED-${rid}`, payer_name: leader, payer_upi: 'official@upi', amount: 100, payment_status: 'VERIFIED', notes: 'Official verified roster PDF import', submitted_at: now, verified_at: now, verified_by: 'system_pdf_importer' };
  const members = [leader, ...memberNames].map((member_name, index) => ({ id: crypto.randomUUID(), team_id: teamId, member_number: index + 1, member_name, member_phone: '', member_email: index === 0 ? email : '', department, year }));
  store.teams.push({ id: teamId, registration_id: rid, team_name: name, username: slug(name).toLowerCase(), leader_name: leader, leader_phone: '', leader_email: email, institution, department, year, problem_statement: problem, access_token: slug(leader).toUpperCase(), payment_status: 'VERIFIED', payment, amount: 100, registration_status: 'REGISTERED', round_1_status: 'SUBMISSION_OPEN', round_2_status: 'LOCKED', admin_notes: 'Official verified roster (2026-09-08)', members, submissions: [], resubmission_requests: [], audit_logs: [], created_at: now, updated_at: now });
  store.payments.push(payment);
}
fs.writeFileSync(storePath, JSON.stringify(store, null, 2));

let sql = `-- Add the final 24 teams from the 2026-09-08 PDF and normalize credentials.\nbegin;\n\nupdate public.teams set username=lower(regexp_replace(team_name,'[^a-zA-Z0-9]','','g')), access_token=upper(regexp_replace(leader_name,'[^a-zA-Z0-9]','','g')), updated_at=now();\n`;
for (const [rid,name,leader,email,department,year,institution,problem,members] of rows) {
  sql += `\ninsert into public.teams (registration_id,team_name,username,leader_name,leader_phone,leader_email,institution,department,year,problem_statement,access_token,payment_status,amount,registration_status,round_1_status,round_2_status,admin_notes) values ('${esc(rid)}','${esc(name)}','${esc(slug(name).toLowerCase())}','${esc(leader)}','','${esc(email)}','${esc(institution)}','${esc(department)}','${esc(year)}','${esc(problem)}','${esc(slug(leader).toUpperCase())}','VERIFIED',100,'REGISTERED','SUBMISSION_OPEN','LOCKED','Official verified roster (2026-09-08)') on conflict (registration_id) do update set team_name=excluded.team_name,username=excluded.username,leader_name=excluded.leader_name,leader_email=excluded.leader_email,institution=excluded.institution,department=excluded.department,year=excluded.year,problem_statement=excluded.problem_statement,access_token=excluded.access_token,updated_at=now();\n`;
  [leader,...members].forEach((member,index) => { sql += `insert into public.team_members (team_id,member_number,member_name,team_name,member_phone,member_email,department,year) select id,${index+1},'${esc(member)}','${esc(name)}','','${index===0?esc(email):''}','${esc(department)}','${esc(year)}' from public.teams where registration_id='${esc(rid)}' on conflict (team_id,member_number) do update set member_name=excluded.member_name,team_name=excluded.team_name,member_email=excluded.member_email,department=excluded.department,year=excluded.year;\n`; });
  sql += `insert into public.payments (team_id,utr_number,payer_name,payer_upi,amount,payment_status,notes,verified_at,verified_by) select id,'VERIFIED-${esc(rid)}','${esc(leader)}','official@upi',100,'VERIFIED','Official verified roster PDF import',now(),'system_pdf_importer' from public.teams where registration_id='${esc(rid)}' on conflict (team_id) do nothing;\n`;
}
sql += `\ncommit;\n`;
fs.writeFileSync('src/db/migrations/021_import_final_pdf_teams.sql', sql);
console.log(JSON.stringify({ imported: rows.length, totalTeams: store.teams.length, migration: 'src/db/migrations/021_import_final_pdf_teams.sql' }));
