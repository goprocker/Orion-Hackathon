const fs = require('fs');
const path = require('path');

const storePath = path.join(process.cwd(), '.data', 'orion_store.json');
const data = JSON.parse(fs.readFileSync(storePath, 'utf8'));

console.log('--- Orion Store Verification ---');
console.log('Total Teams:', data.teams.length);
console.log('Total Payments:', data.payments.length);
console.log('Total Submissions:', data.submissions.length);
console.log('\nSample Team 1:');
console.log({
  id: data.teams[0].registrationId,
  teamName: data.teams[0].teamName,
  username: data.teams[0].username,
  passcode: data.teams[0].accessToken,
  leader: data.teams[0].leaderName,
  membersCount: data.teams[0].members.length,
  paymentStatus: data.teams[0].paymentStatus
});

console.log('\nSample Team 50:');
console.log({
  id: data.teams[50].registrationId,
  teamName: data.teams[50].teamName,
  username: data.teams[50].username,
  passcode: data.teams[50].accessToken,
  leader: data.teams[50].leaderName,
  membersCount: data.teams[50].members.length,
  paymentStatus: data.teams[50].paymentStatus
});
