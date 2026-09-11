const xlsx = require('xlsx');
const path = 'C:\\Users\\hk06r\\Downloads\\ORION 1.0 7th september, 2026.xlsx';

const wb = xlsx.readFile(path);
const ws = wb.Sheets[wb.SheetNames[0]];
const rows = xlsx.utils.sheet_to_json(ws);

const r30 = rows.find(r => r['Team ID'] === 'ORION-S0030');
const r205 = rows.find(r => r['Team ID'] === 'ORION-S0205');

console.log('ORION-S0030 Payment Link:', r30['Registration Fee: ?100 per team. The fee is non-refundable and non-transferable.  ']);
console.log('ORION-S0205 Payment Link:', r205['Registration Fee: ?100 per team. The fee is non-refundable and non-transferable.  ']);
