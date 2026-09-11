const xlsx = require('xlsx');
const excelPath = 'C:\\Users\\hk06r\\Downloads\\ORION 1.0 7th september, 2026.xlsx';
const wb = xlsx.readFile(excelPath);
const ws = wb.Sheets[wb.SheetNames[0]];
const rows = xlsx.utils.sheet_to_json(ws);

let phoneCount = 0;
rows.forEach(r => {
  if (r['Phone number']) phoneCount++;
});
console.log(`Rows with 'Phone number': ${phoneCount} / ${rows.length}`);
