const xlsx = require('C:/Users/hk06r/Orion-Hackathon/node_modules/xlsx');
const path = 'C:\\Users\\hk06r\\Downloads\\ORION 1.0 7th september, 2026.xlsx';

const wb = xlsx.readFile(path);
const ws = wb.Sheets[wb.SheetNames[0]];
const rows = xlsx.utils.sheet_to_json(ws);

const emailMap = {};
const txMap = {};
const nameMap = {};

rows.forEach((r, idx) => {
  const email = String(r['Team Leader / Member 1: Email Address'] || '').trim().toLowerCase();
  const name = String(r['Team Name'] || '').trim().toLowerCase();
  const tx = String(r['Transaction ID'] || '').trim();
  const item = {
    row: idx + 2,
    teamId: r['Team ID'],
    teamName: r['Team Name'],
    leaderName: r['Team Leader / Member 1: Full Name'],
    leaderEmail: email,
    txId: tx,
    members: r['Number of Team Members'],
    problem: r['Problem statement:'],
    title: r['Project Idea Title']
  };

  if (email) {
    if (!emailMap[email]) emailMap[email] = [];
    emailMap[email].push(item);
  }
  if (name) {
    if (!nameMap[name]) nameMap[name] = [];
    nameMap[name].push(item);
  }
  if (tx && tx !== 'undefined' && tx !== 'null') {
    if (!txMap[tx]) txMap[tx] = [];
    txMap[tx].push(item);
  }
});

console.log('=== DUPLICATE TRANSACTION IDS (Same Payment UTR) ===');
Object.entries(txMap).filter(([k, v]) => v.length > 1).forEach(([tx, list]) => {
  console.log(`\nUTR: ${tx} (${list.length} occurrences):`);
  list.forEach(item => {
    console.log(`  Row ${item.row} | ${item.teamId} | "${item.teamName}" | Leader: ${item.leaderName} | Email: ${item.leaderEmail}`);
  });
});

console.log('\n=== DUPLICATE LEADER EMAILS ===');
Object.entries(emailMap).filter(([k, v]) => v.length > 1).forEach(([email, list]) => {
  console.log(`\nEmail: ${email} (${list.length} occurrences):`);
  list.forEach(item => {
    console.log(`  Row ${item.row} | ${item.teamId} | "${item.teamName}" | Leader: ${item.leaderName} | UTR: ${item.txId}`);
  });
});

console.log('\n=== DUPLICATE TEAM NAMES (Case-Insensitive) ===');
Object.entries(nameMap).filter(([k, v]) => v.length > 1).forEach(([name, list]) => {
  console.log(`\nTeam Name: "${name}" (${list.length} occurrences):`);
  list.forEach(item => {
    console.log(`  Row ${item.row} | ${item.teamId} | Leader: ${item.leaderName} | Email: ${item.leaderEmail} | UTR: ${item.txId}`);
  });
});
