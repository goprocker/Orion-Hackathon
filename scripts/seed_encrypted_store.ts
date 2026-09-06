import fs from 'fs';
import path from 'path';
import crypto from 'crypto';
import { generateSalt, hashPassword } from '../src/lib/credentialCrypto';
import type { TeamRecord } from '../src/types/orion';

const DATA_DIR = path.join(process.cwd(), '.data');
const EXTRACTED_FILE = path.join(DATA_DIR, 'extracted_teams.json');
const DATA_FILE = path.join(DATA_DIR, 'orion_store.json');

if (!fs.existsSync(DATA_DIR)) {
  fs.mkdirSync(DATA_DIR, { recursive: true });
}

async function seed() {
  if (!fs.existsSync(EXTRACTED_FILE)) {
    console.error('extracted_teams.json not found!');
    process.exit(1);
  }

  const rawTeams = JSON.parse(fs.readFileSync(EXTRACTED_FILE, 'utf-8'));
  console.log(`Parsed ${rawTeams.length} teams. Encrypting and generating cryptographic salted hashes...`);

  let store: any = {
    teams: [],
    payments: [],
    submissions: [],
    resubmissionRequests: [],
    suspicionFlags: [],
    auditLogs: [],
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

  if (fs.existsSync(DATA_FILE)) {
    try {
      store = JSON.parse(fs.readFileSync(DATA_FILE, 'utf-8'));
    } catch {}
  }

  const existingTeamsMap = new Map<string, TeamRecord>();
  for (const t of store.teams || []) {
    const key = t.team_name.trim().toUpperCase().replace(/\s+/g, '');
    existingTeamsMap.set(key, t);
  }

  for (const item of rawTeams) {
    const salt = generateSalt();
    const hashed = hashPassword(item.password, salt);

    const teamRecord: TeamRecord = {
      id: crypto.randomUUID(),
      registration_id: item.reg_id,
      team_name: item.team_name,
      leader_name: item.leader_name,
      leader_phone: '',
      leader_email: item.leader_email,
      institution: item.institution,
      department: item.department,
      year: item.year,
      problem_statement: item.problem_statement,
      access_token: item.password,
      password_salt: salt,
      password_hash: hashed,
      payment_status: 'VERIFIED',
      amount: 100,
      registration_status: 'REGISTERED',
      round_1_status: 'SUBMISSION_OPEN',
      round_2_status: 'LOCKED',
      members: item.members.map((m: any, i: number) => ({
        id: crypto.randomUUID(),
        name: m.name,
        email: m.email,
        department: m.department,
        year: m.year,
        institution: m.institution,
        isLeader: i === 0
      })),
      created_at: new Date().toISOString()
    };

    const key = item.username;
    existingTeamsMap.set(key, teamRecord);
  }

  store.teams = Array.from(existingTeamsMap.values());
  fs.writeFileSync(DATA_FILE, JSON.stringify(store, null, 2), 'utf-8');

  console.log(`Seeding complete! ${store.teams.length} teams written to ${DATA_FILE} with salted SHA-256 hashes.`);
}

seed().catch(err => {
  console.error('Seeding failed:', err);
  process.exit(1);
});
