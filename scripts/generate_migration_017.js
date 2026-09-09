const fs = require('fs');
const path = require('path');
const xlsx = require('C:/Users/hk06r/Orion-Hackathon/node_modules/xlsx');

const excelPath = 'C:\\Users\\hk06r\\Downloads\\ORION 1.0 7th september, 2026.xlsx';
const wb = xlsx.readFile(excelPath);
const ws = wb.Sheets[wb.SheetNames[0]];
const rows = xlsx.utils.sheet_to_json(ws);

const duplicateDrops = new Map([
  ['ORION-S0095', { keep: 'ORION-S0005', note: 'Same leader Mohammed Emtheyas S, same UTR 7305238354@superyes. Renamed Kanuri Manobhi Abhilash -> SALTVISIONAI' }],
  ['ORION-S0112', { keep: 'ORION-S0011', note: 'Same leader Vaishnavi devi G, same UTR 660901678672' }],
  ['ORION-S0121', { keep: 'ORION-S0016', note: 'Same leader Sudharsan R, same UTR 128944878486' }],
  ['ORION-S0155', { keep: 'ORION-S0023', note: 'Same leader Jaidev S, same UTR 624650806747' }],
  ['ORION-S0111', { keep: 'ORION-S0026', note: 'Same leader Pranesh Mithun G S, same UTR T2609031753412573373968' }],
  ['ORION-S0158', { keep: 'ORION-S0032', note: 'Same leader Frezha Angeline A, same UTR 661134361021' }],
  ['ORION-S0080', { keep: 'ORION-S0041', note: 'Same leader VISHWA I, same UTR 624421408206' }],
  ['ORION-S0092', { keep: 'ORION-S0043', note: 'Same leader V DIVYESH, same UTR 661397127802' }],
  ['ORION-S0091', { keep: 'ORION-S0046', note: 'Same leader AGILESH M, same UTR 129028572477' }],
  ['ORION-S0106', { keep: 'ORION-S0049', note: 'Same leader M.Madhuri, same UTR T2608301829228928647152' }],
  ['ORION-S0093', { keep: 'ORION-S0052', note: 'Same leader Hari Vishva S, same UTR 313945714157' }],
  ['ORION-S0109', { keep: 'ORION-S0054', note: 'Same leader TK DHARMESH KUMAR, same UTR 01a06d26-709f-7dc1-9533-7edf47da23a0' }],
  ['ORION-S0070', { keep: 'ORION-S0057', note: 'Same leader Sai Krishna K J, same UTR 661406374179' }],
  ['ORION-S0194', { keep: 'ORION-S0100', note: 'Same 6 students from Hindusthan College (Kishore B / Bhuvan K), same UTR 661207984366' }]
]);

function toSlug(str) {
  return (str || '').toLowerCase().replace(/[^a-z0-9]/g, '');
}

function toPasscode(leaderName) {
  return (leaderName || '').toUpperCase().replace(/[^A-Z0-9]/g, '');
}

function esc(val) {
  if (val === null || val === undefined) return "''";
  const s = String(val).trim();
  return "'" + s.replace(/'/g, "''") + "'";
}

function escNullable(val) {
  if (val === null || val === undefined || String(val).trim() === '') return "null";
  const s = String(val).trim();
  return "'" + s.replace(/'/g, "''") + "'";
}

let sql = `-- ==============================================================================
-- ORION 1.0 - Migration 017: IMPORT 7TH SEPTEMBER 2026 ROSTER
-- ==============================================================================
-- Source: "ORION 1.0 7th september, 2026.xlsx" (252 submissions)
-- Duplicate Analysis:
--   - 14 duplicate squads merged into their earlier registration ID.
--   - 1 UPI handle collision (8870227906@upi) disambiguated with team suffix.
-- Net unique squads: 238 squads with full member roster and payment proof links.
--
-- Safe and idempotent: Uses ON CONFLICT upsert.
-- ==============================================================================

do $$
declare
  v_team_id uuid;
begin

`;

let teamCount = 0;
let memberCount = 0;
let paymentCount = 0;

for (const r of rows) {
  const tid = r['Team ID'];
  if (duplicateDrops.has(tid)) continue;

  teamCount++;
  const teamName = r['Team Name'] || tid;
  const username = toSlug(teamName) || toSlug(tid);
  const leaderName = r['Team Leader / Member 1: Full Name'] || 'Team Leader';
  const passcode = toPasscode(leaderName) || 'ORION2026';
  const leaderEmail = r['Team Leader / Member 1: Email Address'] || r['Email address'] || '';
  const leaderPhone = String(r['Phone number'] || '').replace(/'/g, '').trim();
  const college = r['Team Leader / Member 1: Institution / College Name'] || '';
  const dept = r['Team Leader / Member 1: Department / Programme'] || '';
  const year = r['Team Leader / Member 1: Year of Study'] || '';
  const problem = r['Problem statement:'] || 'ORION-PS-04';
  const ideaTitle = r['Project Idea Title'] || '';
  const ideaAbstract = r['Idea Abstract'] || '';
  const adminNotes = ideaTitle ? `Project: ${ideaTitle}. Abstract: ${ideaAbstract}`.substring(0, 500) : null;

  // Payments
  let utr = String(r['Transaction ID'] || '').trim();
  if (!utr || utr === 'undefined' || utr === 'null') {
    utr = `PENDING-${tid}`;
  } else if (utr === '8870227906@upi') {
    utr = `8870227906@upi-${tid}`;
  }

  // Find fee screenshot link
  let feeLink = '';
  for (const [k, v] of Object.entries(r)) {
    if (k.toLowerCase().includes('fee') && String(v).includes('http')) {
      feeLink = String(v).trim();
      break;
    }
  }

  sql += `  -- Team ${tid}: ${teamName.replace(/[\r\n]/g, ' ')}\n`;
  sql += `  insert into public.teams (
    registration_id, team_name, username, leader_name, leader_phone, leader_email,
    institution, department, year, problem_statement, access_token, payment_status,
    amount, registration_status, round_1_status, admin_notes
  ) values (
    ${esc(tid)}, ${esc(teamName)}, ${esc(username)}, ${esc(leaderName)}, ${esc(leaderPhone)}, ${esc(leaderEmail)},
    ${esc(college)}, ${esc(dept)}, ${esc(year)}, ${esc(problem)}, ${esc(passcode)}, 'VERIFIED',
    100, 'REGISTERED', 'NOT_STARTED', ${escNullable(adminNotes)}
  )
  on conflict (registration_id) do update set
    team_name = excluded.team_name,
    username = excluded.username,
    leader_name = excluded.leader_name,
    leader_phone = coalesce(nullif(excluded.leader_phone, ''), public.teams.leader_phone),
    leader_email = coalesce(nullif(excluded.leader_email, ''), public.teams.leader_email),
    institution = excluded.institution,
    department = excluded.department,
    year = excluded.year,
    problem_statement = excluded.problem_statement,
    access_token = excluded.access_token,
    payment_status = 'VERIFIED'
  returning id into v_team_id;\n\n`;

  // Members (Member 1 = Leader, Member 2..6)
  // Member 1
  sql += `  insert into public.team_members (team_id, member_number, member_name, team_name, member_email, member_phone, department, year)
  values (v_team_id, 1, ${esc(leaderName)}, ${esc(teamName)}, ${escNullable(leaderEmail)}, ${esc(leaderPhone)}, ${escNullable(dept)}, ${escNullable(year)})
  on conflict (team_id, member_number) do update set
    member_name = excluded.member_name,
    team_name = excluded.team_name,
    member_email = excluded.member_email,
    member_phone = coalesce(nullif(excluded.member_phone, ''), public.team_members.member_phone),
    department = excluded.department,
    year = excluded.year;\n`;
  memberCount++;

  for (let m = 2; m <= 6; m++) {
    const mName = r[`Member ${m}: Full Name`];
    if (mName && String(mName).trim() !== '') {
      const mEmail = r[`Member ${m}: Email Address`];
      const mPhone = String(r[`Phone number ${m}`] || '').replace(/'/g, '').trim();
      const mDept = r[`Member ${m}: Department / Programme`];
      const mYear = r[`Member ${m}: Year of Study`];

      sql += `  insert into public.team_members (team_id, member_number, member_name, team_name, member_email, member_phone, department, year)
  values (v_team_id, ${m}, ${esc(mName)}, ${esc(teamName)}, ${escNullable(mEmail)}, ${esc(mPhone)}, ${escNullable(mDept)}, ${escNullable(mYear)})
  on conflict (team_id, member_number) do update set
    member_name = excluded.member_name,
    team_name = excluded.team_name,
    member_email = excluded.member_email,
    member_phone = coalesce(nullif(excluded.member_phone, ''), public.team_members.member_phone),
    department = excluded.department,
    year = excluded.year;\n`;
      memberCount++;
    }
  }

  // Payment row
  sql += `  insert into public.payments (team_id, utr_number, payer_name, payer_upi, amount, payment_status, screenshot_url, verified_at, verified_by)
  values (v_team_id, ${esc(utr)}, ${esc(leaderName)}, null, 100, 'VERIFIED', ${escNullable(feeLink)}, now(), 'Bulk Form Import')
  on conflict (team_id) do update set
    utr_number = excluded.utr_number,
    screenshot_url = coalesce(nullif(excluded.screenshot_url, ''), public.payments.screenshot_url),
    payment_status = 'VERIFIED';\n\n`;
  paymentCount++;
}

// Log duplicate mergers to audit_logs
sql += `  -- Record duplicate mergers in audit_logs\n`;
for (const [dropId, info] of duplicateDrops.entries()) {
  sql += `  insert into public.audit_logs (team_name, actor, action, details)
  values ('${dropId}', 'Form Import', 'DUPLICATE_TEAM_MERGED', ${esc('Merged ' + dropId + ' into ' + info.keep + '. ' + info.note)});\n`;
}

sql += `end $$;\n`;

const outPath = 'C:\\Users\\hk06r\\Orion-Hackathon\\src\\db\\migrations\\017_import_september_roster.sql';
fs.writeFileSync(outPath, sql, 'utf8');

console.log(`Successfully generated Migration 017:`);
console.log(`  File: ${outPath}`);
console.log(`  Total Teams: ${teamCount}`);
console.log(`  Total Members: ${memberCount}`);
console.log(`  Total Payments: ${paymentCount}`);
console.log(`  File Size: ${(sql.length / 1024).toFixed(1)} KB`);
