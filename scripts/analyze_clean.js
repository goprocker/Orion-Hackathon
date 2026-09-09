const xlsx = require('C:/Users/hk06r/Orion-Hackathon/node_modules/xlsx');
const path = 'C:\\Users\\hk06r\\Downloads\\ORION 1.0 7th september, 2026.xlsx';

const wb = xlsx.readFile(path);
const ws = wb.Sheets[wb.SheetNames[0]];
const rows = xlsx.utils.sheet_to_json(ws);

console.log(`Analyzing ${rows.length} total rows...\n`);

// 1. Identify exact duplicate submissions
// A duplicate is: same leader email AND (same UTR OR same team name)
const duplicatePairs = [
  { keep: 'ORION-S0005', drop: 'ORION-S0095', reason: 'Same leader Mohammed Emtheyas S, same UTR 7305238354@superyes. Renamed Kanuri Manobhi Abhilash -> SALTVISIONAI' },
  { keep: 'ORION-S0011', drop: 'ORION-S0112', reason: 'Same leader Vaishnavi devi G, same UTR 660901678672. Duplicate submission' },
  { keep: 'ORION-S0016', drop: 'ORION-S0121', reason: 'Same leader Sudharsan R, same UTR 128944878486. Duplicate submission' },
  { keep: 'ORION-S0023', drop: 'ORION-S0155', reason: 'Same leader Jaidev S, same UTR 624650806747. Duplicate submission' },
  { keep: 'ORION-S0026', drop: 'ORION-S0111', reason: 'Same leader Pranesh Mithun G S, same UTR T2609031753412573373968. Duplicate submission' },
  { keep: 'ORION-S0032', drop: 'ORION-S0158', reason: 'Same leader Frezha Angeline A, same UTR 661134361021. Duplicate submission' },
  { keep: 'ORION-S0041', drop: 'ORION-S0080', reason: 'Same leader VISHWA I, same UTR 624421408206. Duplicate submission' },
  { keep: 'ORION-S0043', drop: 'ORION-S0092', reason: 'Same leader V DIVYESH, same UTR 661397127802. Duplicate submission' },
  { keep: 'ORION-S0046', drop: 'ORION-S0091', reason: 'Same leader AGILESH M, same UTR 129028572477. Duplicate submission' },
  { keep: 'ORION-S0049', drop: 'ORION-S0106', reason: 'Same leader M.Madhuri, same UTR T2608301829228928647152. Duplicate submission' },
  { keep: 'ORION-S0052', drop: 'ORION-S0093', reason: 'Same leader Hari Vishva S, same UTR 313945714157. Duplicate submission' },
  { keep: 'ORION-S0054', drop: 'ORION-S0109', reason: 'Same leader TK DHARMESH KUMAR, same UTR 01a06d26... Duplicate submission' },
  { keep: 'ORION-S0057', drop: 'ORION-S0070', reason: 'Same leader Sai Krishna K J, same UTR 661406374179. Duplicate submission' },
  { keep: 'ORION-S0100', drop: 'ORION-S0194', reason: 'Same 6 students from Hindusthan College (Kishore B / Bhuvan K), same UTR 661207984366' }
];

console.log(`Identified ${duplicatePairs.length} duplicate submissions to merge.`);

// Check remaining teams
const droppedIds = new Set(duplicatePairs.map(p => p.drop));
const cleanRows = rows.filter(r => !droppedIds.has(r['Team ID']));
console.log(`Clean unique teams count: ${cleanRows.length}`);

// Check remaining UTR duplicates in clean rows
const cleanUtrMap = {};
cleanRows.forEach(r => {
  const tx = String(r['Transaction ID'] || '').trim();
  if (tx && tx !== 'undefined' && tx !== 'null') {
    if (!cleanUtrMap[tx]) cleanUtrMap[tx] = [];
    cleanUtrMap[tx].push(r['Team ID']);
  }
});

const remainingDupUtrs = Object.entries(cleanUtrMap).filter(([k, v]) => v.length > 1);
console.log(`Remaining UTR collisions in clean rows:`, remainingDupUtrs);

// Check remaining Email duplicates in clean rows
const cleanEmailMap = {};
cleanRows.forEach(r => {
  const em = String(r['Team Leader / Member 1: Email Address'] || '').trim().toLowerCase();
  if (em) {
    if (!cleanEmailMap[em]) cleanEmailMap[em] = [];
    cleanEmailMap[em].push({ id: r['Team ID'], name: r['Team Name'], leader: r['Team Leader / Member 1: Full Name'] });
  }
});
const remainingDupEmails = Object.entries(cleanEmailMap).filter(([k, v]) => v.length > 1);
console.log(`Remaining Email collisions in clean rows:`, remainingDupEmails);
