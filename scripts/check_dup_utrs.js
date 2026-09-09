const xlsx = require('C:/Users/hk06r/Orion-Hackathon/node_modules/xlsx');
const path = 'C:\\Users\\hk06r\\Downloads\\ORION 1.0 7th september, 2026.xlsx';

const wb = xlsx.readFile(path);
const ws = wb.Sheets[wb.SheetNames[0]];
const rows = xlsx.utils.sheet_to_json(ws);

const txMap = {};
rows.forEach((r, idx) => {
  const tx = String(r['Transaction ID'] || '').trim();
  if (tx && tx !== 'undefined' && tx !== 'null') {
    if (!txMap[tx]) txMap[tx] = [];
    txMap[tx].push({
      row: idx + 2,
      teamId: r['Team ID'],
      teamName: r['Team Name'],
      leaderName: r['Team Leader / Member 1: Full Name'],
      leaderEmail: r['Team Leader / Member 1: Email Address'],
      institution: r['Team Leader / Member 1: Institution / College Name']
    });
  }
});

const dupTxs = Object.entries(txMap).filter(([k, v]) => v.length > 1);
console.log(`Found ${dupTxs.length} duplicate UTR numbers:\n`);

dupTxs.forEach(([tx, list], i) => {
  console.log(`${i+1}. UTR: ${tx}`);
  list.forEach(t => {
    console.log(`   - [${t.teamId}] Row ${t.row}: "${t.teamName}" | Leader: ${t.leaderName} (${t.leaderEmail}) | College: ${t.institution}`);
  });
});
