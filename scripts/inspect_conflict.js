const xlsx = require('xlsx');
const path = 'C:\\Users\\hk06r\\Downloads\\ORION 1.0 7th september, 2026.xlsx';

const wb = xlsx.readFile(path);
const ws = wb.Sheets[wb.SheetNames[0]];
const rows = xlsx.utils.sheet_to_json(ws);

const r101 = rows.find(r => r['Team ID'] === 'ORION-S0100');
const r195 = rows.find(r => r['Team ID'] === 'ORION-S0194');

console.log('--- Row ORION-S0100 ---');
console.log(JSON.stringify(r101, null, 2));

console.log('\n--- Row ORION-S0194 ---');
console.log(JSON.stringify(r195, null, 2));
