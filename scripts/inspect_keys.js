const xlsx = require('xlsx');
const path = 'C:\\Users\\hk06r\\Downloads\\ORION 1.0 7th september, 2026.xlsx';

const wb = xlsx.readFile(path);
const ws = wb.Sheets[wb.SheetNames[0]];
const rows = xlsx.utils.sheet_to_json(ws);

const r30 = rows.find(r => r['Team ID'] === 'ORION-S0030');
const r205 = rows.find(r => r['Team ID'] === 'ORION-S0205');

console.log('r30:');
for (let [k, v] of Object.entries(r30)) {
  if (k.toLowerCase().includes('fee') || k.toLowerCase().includes('transaction') || k.toLowerCase().includes('drive') || String(v).includes('http')) {
    console.log(`  ${k}: ${v}`);
  }
}

console.log('r205:');
for (let [k, v] of Object.entries(r205)) {
  if (k.toLowerCase().includes('fee') || k.toLowerCase().includes('transaction') || k.toLowerCase().includes('drive') || String(v).includes('http')) {
    console.log(`  ${k}: ${v}`);
  }
}
