const fs = require('fs');
const path = require('path');
const xlsx = require('C:/Users/hk06r/Orion-Hackathon/node_modules/xlsx');

const excelPath = 'C:\\Users\\hk06r\\Downloads\\ORION 1.0 7th september, 2026.xlsx';
const wb = xlsx.readFile(excelPath);
const ws = wb.Sheets[wb.SheetNames[0]];
const rows = xlsx.utils.sheet_to_json(ws);

const duplicateDrops = new Map([
  ['ORION-S0095', { keep: 'ORION-S0005', note: 'Duplicate: Mohammed Emtheyas S (SALTVISIONAI)' }],
  ['ORION-S0112', { keep: 'ORION-S0011', note: 'Duplicate: Vaishnavi devi G (MISS SQUAD)' }],
  ['ORION-S0121', { keep: 'ORION-S0016', note: 'Duplicate: Sudharsan R (Team trinity)' }],
  ['ORION-S0155', { keep: 'ORION-S0023', note: 'Duplicate: Jaidev S (StarByte)' }],
  ['ORION-S0111', { keep: 'ORION-S0026', note: 'Duplicate: Pranesh Mithun G S (Arvion)' }],
  ['ORION-S0158', { keep: 'ORION-S0032', note: 'Duplicate: Frezha Angeline A (Mindsprint)' }],
  ['ORION-S0080', { keep: 'ORION-S0041', note: 'Duplicate: VISHWA I (JACK HACKROV)' }],
  ['ORION-S0092', { keep: 'ORION-S0043', note: 'Duplicate: V DIVYESH (Impact Warriors)' }],
  ['ORION-S0091', { keep: 'ORION-S0046', note: 'Duplicate: AGILESH M (NEXORA)' }],
  ['ORION-S0106', { keep: 'ORION-S0049', note: 'Duplicate: M.Madhuri (Binary Titans)' }],
  ['ORION-S0093', { keep: 'ORION-S0052', note: 'Duplicate: Hari Vishva S (CodeMonkeys)' }],
  ['ORION-S0109', { keep: 'ORION-S0054', note: 'Duplicate: TK DHARMESH KUMAR (TOUCH GRASS)' }],
  ['ORION-S0070', { keep: 'ORION-S0057', note: 'Duplicate: Sai Krishna K J (Team_Name_26)' }],
  ['ORION-S0194', { keep: 'ORION-S0100', note: 'Duplicate: Kishore B / Bhuvan K (MYSTORA TECH / alpha safety)' }]
]);

function toSlug(str) {
  return (str || '').toLowerCase().replace(/[^a-z0-9]/g, '');
}

function toPasscode(leaderName) {
  return (leaderName || '').toUpperCase().replace(/[^A-Z0-9]/g, '');
}

function escapeSql(str) {
  if (str === null || str === undefined) return 'null';
  return `'${String(str).replace(/'/g, "''").trim()}'`;
}

const cleanTeams = [];
const skipped = [];

for (const r of rows) {
  const tid = r['Team ID'];
  if (duplicateDrops.has(tid)) {
    skipped.push({ tid, ...duplicateDrops.get(tid) });
    continue;
  }
  cleanTeams.push(r);
}

console.log(`Clean teams to import: ${cleanTeams.length}`);
console.log(`Skipped duplicate teams: ${skipped.length}`);

// Inspect sample team structure
const sample = cleanTeams[0];
console.log('\nSample team ID:', sample['Team ID']);
console.log('Team Name:', sample['Team Name']);
console.log('Leader Name:', sample['Team Leader / Member 1: Full Name']);
console.log('Leader Email:', sample['Team Leader / Member 1: Email Address']);
console.log('Leader Phone:', sample['Phone number']);
console.log('Members count:', sample['Number of Team Members']);
