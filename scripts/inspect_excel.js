const xlsx = require('xlsx');
const path = 'C:\\Users\\hk06r\\Downloads\\ORION 1.0 7th september, 2026.xlsx';

const wb = xlsx.readFile(path);
console.log('Sheet Names:', wb.SheetNames);

for (const sheetName of wb.SheetNames) {
  const ws = wb.Sheets[sheetName];
  const data = xlsx.utils.sheet_to_json(ws, { header: 1 });
  console.log(`\n--- Sheet: ${sheetName} ---`);
  console.log('Total Rows:', data.length);
  if (data.length > 0) {
    console.log('Header Row (columns):', JSON.stringify(data[0]));
    console.log('First 2 data rows:');
    console.log(JSON.stringify(data.slice(1, 3), null, 2));
  }
}
