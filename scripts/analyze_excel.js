const xlsx = require('xlsx');
const path = 'C:\\Users\\hk06r\\Downloads\\ORION 1.0 7th september, 2026.xlsx';

const wb = xlsx.readFile(path);
const ws = wb.Sheets[wb.SheetNames[0]];
const rows = xlsx.utils.sheet_to_json(ws);

console.log(`Total rows parsed: ${rows.length}`);

// Inspect first row keys
if (rows.length > 0) {
  console.log('Keys:', Object.keys(rows[0]));
}

// Check team IDs format
const teamIds = rows.map(r => r['Team ID']).filter(Boolean);
const uniqueTeamIds = new Set(teamIds);
console.log(`Team IDs present: ${teamIds.length}, Unique Team IDs: ${uniqueTeamIds.size}`);

// Check Team Names
const teamNames = rows.map(r => String(r['Team Name'] || '').trim()).filter(Boolean);
const uniqueTeamNames = new Set(teamNames.map(t => t.toLowerCase()));
console.log(`Team Names present: ${teamNames.length}, Unique (case-insensitive): ${uniqueTeamNames.size}`);

// Check Leader Emails
const emails = rows.map(r => String(r['Team Leader / Member 1: Email Address'] || r['Email address'] || '').trim().toLowerCase()).filter(Boolean);
const uniqueEmails = new Set(emails);
console.log(`Leader Emails present: ${emails.length}, Unique: ${uniqueEmails.size}`);

// Check Transaction IDs
const txIds = rows.map(r => String(r['Transaction ID'] || '').trim()).filter(Boolean);
const uniqueTxIds = new Set(txIds);
console.log(`Transaction IDs present: ${txIds.length}, Unique: ${uniqueTxIds.size}`);

// Analyze duplicates
const emailCounts = {};
const nameCounts = {};
const txCounts = {};

rows.forEach((r, idx) => {
  const email = String(r['Team Leader / Member 1: Email Address'] || r['Email address'] || '').trim().toLowerCase();
  const name = String(r['Team Name'] || '').trim().toLowerCase();
  const tx = String(r['Transaction ID'] || '').trim();
  const tid = r['Team ID'] || `Row_${idx+2}`;

  if (email) {
    if (!emailCounts[email]) emailCounts[email] = [];
    emailCounts[email].push({ row: idx + 2, tid, name: r['Team Name'], leader: r['Team Leader / Member 1: Full Name'] });
  }
  if (name) {
    if (!nameCounts[name]) nameCounts[name] = [];
    nameCounts[name].push({ row: idx + 2, tid, email, leader: r['Team Leader / Member 1: Full Name'] });
  }
  if (tx && tx !== 'undefined' && tx !== 'null') {
    if (!txCounts[tx]) txCounts[tx] = [];
    txCounts[tx].push({ row: idx + 2, tid, name: r['Team Name'], leader: r['Team Leader / Member 1: Full Name'] });
  }
});

const duplicateEmails = Object.entries(emailCounts).filter(([k, v]) => v.length > 1);
const duplicateNames = Object.entries(nameCounts).filter(([k, v]) => v.length > 1);
const duplicateTxs = Object.entries(txCounts).filter(([k, v]) => v.length > 1);

console.log(`\nDuplicate Emails count: ${duplicateEmails.length}`);
console.log(`Duplicate Team Names count: ${duplicateNames.length}`);
console.log(`Duplicate Transaction IDs count: ${duplicateTxs.length}`);
