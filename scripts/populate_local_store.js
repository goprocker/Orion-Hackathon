const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const xlsx = require('C:/Users/hk06r/Orion-Hackathon/node_modules/xlsx');

const excelPath = 'C:\\Users\\hk06r\\Downloads\\ORION 1.0 7th september, 2026.xlsx';
const wb = xlsx.readFile(excelPath);
const ws = wb.Sheets[wb.SheetNames[0]];
const rows = xlsx.utils.sheet_to_json(ws);

const duplicateDrops = new Map([
  ['ORION-S0095', { keep: 'ORION-S0005' }],
  ['ORION-S0112', { keep: 'ORION-S0011' }],
  ['ORION-S0121', { keep: 'ORION-S0016' }],
  ['ORION-S0155', { keep: 'ORION-S0023' }],
  ['ORION-S0111', { keep: 'ORION-S0026' }],
  ['ORION-S0158', { keep: 'ORION-S0032' }],
  ['ORION-S0080', { keep: 'ORION-S0041' }],
  ['ORION-S0092', { keep: 'ORION-S0043' }],
  ['ORION-S0091', { keep: 'ORION-S0046' }],
  ['ORION-S0106', { keep: 'ORION-S0049' }],
  ['ORION-S0093', { keep: 'ORION-S0052' }],
  ['ORION-S0109', { keep: 'ORION-S0054' }],
  ['ORION-S0070', { keep: 'ORION-S0057' }],
  ['ORION-S0194', { keep: 'ORION-S0100' }]
]);

function toSlug(str) {
  return (str || '').toLowerCase().replace(/[^a-z0-9]/g, '');
}

function toPasscode(leaderName) {
  return (leaderName || '').toUpperCase().replace(/[^A-Z0-9]/g, '');
}

const teams = [];
const payments = [];
const submissions = [];
const auditLogs = [];

for (const r of rows) {
  const tid = r['Team ID'];
  if (duplicateDrops.has(tid)) continue;

  const teamId = crypto.randomUUID();
  const teamName = r['Team Name'] || tid;
  const username = toSlug(teamName) || toSlug(tid);
  const leaderName = r['Team Leader / Member 1: Full Name'] || 'Team Leader';
  const passcode = toPasscode(leaderName) || 'ORION2026';
  const leaderEmail = r['Team Leader / Member 1: Email Address'] || r['Email address'] || '';
  const leaderPhone = String(r['Phone number'] || '').replace(/'/g, '').trim();
  const college = r['Team Leader / Member 1: Institution / College Name'] || '';
  const dept = r['Team Leader / Member 1: Department / Programme'] || '';
  const year = r['Team Leader / Member 1: Year of Study'] || '';
  const problem = r['Problem statement:'] || 'ORION-PS-04';
  const ideaTitle = r['Project Idea Title'] || '';
  const ideaAbstract = r['Idea Abstract'] || '';
  const adminNotes = ideaTitle ? `Project: ${ideaTitle}. Abstract: ${ideaAbstract}` : undefined;

  let utr = String(r['Transaction ID'] || '').trim();
  if (!utr || utr === 'undefined' || utr === 'null') {
    utr = `PENDING-${tid}`;
  } else if (utr === '8870227906@upi') {
    utr = `8870227906@upi-${tid}`;
  }

  let feeLink = '';
  let pptLink = '';
  for (const [k, v] of Object.entries(r)) {
    if (k.toLowerCase().includes('fee') && String(v).includes('http')) {
      feeLink = String(v).trim();
    }
    if (k.toLowerCase().includes('pitch deck') && String(v).includes('http')) {
      pptLink = String(v).trim();
    }
  }

  const members = [];
  members.push({
    name: leaderName,
    email: leaderEmail,
    phone: leaderPhone,
    department: dept,
    year: year
  });

  for (let m = 2; m <= 6; m++) {
    const mName = r[`Member ${m}: Full Name`];
    if (mName && String(mName).trim() !== '') {
      members.push({
        name: String(mName).trim(),
        email: r[`Member ${m}: Email Address`] || '',
        phone: String(r[`Phone number ${m}`] || '').replace(/'/g, '').trim(),
        department: r[`Member ${m}: Department / Programme`] || '',
        year: r[`Member ${m}: Year of Study`] || ''
      });
    }
  }

  const now = new Date().toISOString();
  const teamRec = {
    id: teamId,
    registrationId: tid,
    teamName: teamName,
    username: username,
    leaderName: leaderName,
    leaderPhone: leaderPhone,
    leaderEmail: leaderEmail,
    institution: college,
    department: dept,
    year: year,
    members: members,
    problemStatement: problem,
    accessToken: passcode,
    paymentStatus: 'VERIFIED',
    amount: 100,
    registrationStatus: 'REGISTERED',
    round1Status: pptLink ? 'SUBMITTED' : 'NOT_STARTED',
    round2Status: 'LOCKED',
    adminNotes: adminNotes,
    createdAt: now,
    updatedAt: now
  };
  teams.push(teamRec);

  payments.push({
    id: crypto.randomUUID(),
    teamId: teamId,
    utrNumber: utr,
    payerName: leaderName,
    amount: 100,
    paymentStatus: 'VERIFIED',
    screenshotUrl: feeLink || undefined,
    submittedAt: now,
    verifiedAt: now,
    verifiedBy: 'Bulk Form Import'
  });

  if (pptLink) {
    submissions.push({
      id: crypto.randomUUID(),
      teamId: teamId,
      roundNumber: 1,
      fileUrl: pptLink,
      originalFilename: `${tid}_Round1_PitchDeck`,
      fileSize: 0,
      fileType: 'link/google-drive',
      submissionStatus: 'SUBMITTED',
      submittedAt: now
    });
  }
}

const dataDir = path.join(process.cwd(), '.data');
if (!fs.existsSync(dataDir)) fs.mkdirSync(dataDir, { recursive: true });

const storeData = {
  teams,
  payments,
  submissions,
  resubmissionRequests: [],
  suspicionFlags: [],
  auditLogs,
  passwordResets: [],
  config: {
    registrationOpen: true,
    round1SubmissionDeadline: '2026-09-11T23:59:59+05:30',
    allowRound1Resubmission: true,
    maxFileSizeMb: 10,
    upiId: '8870227906@upi',
    upiPayeeName: 'MSNIHITHAJULIETA',
    upiQrCodeUrl: '/orion_payment_qr.jpg',
    round1FeeInr: 100,
    finalistFeeInr: 250
  }
};

fs.writeFileSync(path.join(dataDir, 'orion_store.json'), JSON.stringify(storeData, null, 2), 'utf8');
console.log(`Populated .data/orion_store.json with ${teams.length} teams, ${payments.length} payments, ${submissions.length} submissions.`);
