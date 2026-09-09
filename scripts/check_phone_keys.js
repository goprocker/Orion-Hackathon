const xlsx = require('C:/Users/hk06r/Orion-Hackathon/node_modules/xlsx');
const excelPath = 'C:\\Users\\hk06r\\Downloads\\ORION 1.0 7th september, 2026.xlsx';
const wb = xlsx.readFile(excelPath);
const ws = wb.Sheets[wb.SheetNames[0]];
const rows = xlsx.utils.sheet_to_json(ws);

console.log(Object.keys(rows[0]));
console.log('r0 Phone:', rows[0]['Phone number']);
console.log('r100 Phone:', rows[100]['Phone number']);
