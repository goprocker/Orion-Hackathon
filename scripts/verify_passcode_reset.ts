// End-to-end checks for the self-service passcode reset flow.
//
//   npx tsx scripts/verify_passcode_reset.ts
//
// Runs against the local .data file store (no Supabase, no SMTP configured),
// which is the same code path production takes when Supabase is unreachable.
// The store file is backed up on entry and restored on exit, so running this
// does not disturb local dev data.
//
// Each assertion maps to one requirement of the flow:
//   - a Team ID alone must never be enough to reset access
//   - the raw token must never be persisted
//   - links are single use and time limited
//   - a completed reset kills every other outstanding link for that team

import fs from 'fs';
import path from 'path';
import crypto from 'crypto';
import { serverStore, safeEqualCI } from '../src/lib/serverStore';
import { validateNewPasscode, RESET_TOKEN_TTL_MINUTES } from '../src/lib/passcodePolicy';

const STORE_FILE = path.join(process.cwd(), '.data', 'orion_store.json');
const BACKUP_FILE = path.join(process.cwd(), '.data', 'orion_store.backup.verify.json');

let passed = 0;
let total = 0;
function assert(cond: boolean, name: string, extra = '') {
  total++;
  if (cond) {
    console.log(`[PASS ${total}] ${name}`);
    passed++;
  } else {
    console.error(`[FAIL ${total}] ${name} ${extra}`);
  }
}

function readStore(): {
  teams: { id: string; registration_id: string; access_token: string }[];
  passwordResets: { id: string; team_id: string; token_hash: string; expires_at: string; consumed_at?: string | null }[];
  auditLogs: { action: string; details?: string | null }[];
} {
  return JSON.parse(fs.readFileSync(STORE_FILE, 'utf-8'));
}

function writeStore(store: unknown): void {
  fs.writeFileSync(STORE_FILE, JSON.stringify(store, null, 2), 'utf-8');
}

async function main() {
  const stamp = Date.now();
  const leaderEmail = `reset.verify.${stamp}@example.com`;

  const { team } = await serverStore.registerTeam({
    teamName: `Reset Verify ${stamp}`,
    leaderName: 'Verify Leader',
    leaderPhone: `9${String(stamp).slice(-9)}`,
    leaderEmail,
    institution: 'Verification Institute',
    problemStatement: 'AI',
    members: [{ name: 'Member One', phone: `8${String(stamp).slice(-9)}` }]
  });

  const regId = team.registration_id;
  const originalPasscode = team.access_token;
  console.log(`\n--- team ${regId} created for verification ---\n`);

  // 1. A Team ID on its own must not produce a reset.
  const noEmail = await serverStore.createPasscodeReset(regId, '', '127.0.0.1');
  assert(noEmail === null, 'Team ID with no email is refused');

  // 2. A Team ID with the WRONG email must not produce a reset.
  const wrongEmail = await serverStore.createPasscodeReset(regId, 'attacker@example.com', '127.0.0.1');
  assert(wrongEmail === null, 'Team ID with a non-registered email is refused');

  // 3. An unknown Team ID with a valid-looking email must not produce a reset.
  const unknownTeam = await serverStore.createPasscodeReset('ORION-2026-9999', leaderEmail, '127.0.0.1');
  assert(unknownTeam === null, 'Unknown Team ID is refused');

  // 4. The correct pair issues a token.
  const issued = await serverStore.createPasscodeReset(regId, leaderEmail, '127.0.0.1');
  assert(issued !== null && issued.rawToken.length >= 40, 'Correct Team ID + registered email issues a token');
  if (!issued) throw new Error('cannot continue without an issued token');

  // 5. Email match is case-insensitive, as stored.
  const upper = await serverStore.createPasscodeReset(regId, leaderEmail.toUpperCase(), '127.0.0.1');
  assert(upper !== null, 'Registered email matches case-insensitively');

  // 6. Issuing a new link retires the previous one — the first token is dead.
  const stale = await serverStore.peekPasscodeReset(issued.rawToken);
  assert(
    stale.valid === false && stale.reason === 'USED',
    'Requesting a second link invalidates the first',
    `got ${JSON.stringify(stale)}`
  );
  if (!upper) throw new Error('cannot continue without the live token');
  const liveToken = upper.rawToken;

  // 7. The raw token must not appear anywhere in the persisted store.
  const storeRaw = fs.readFileSync(STORE_FILE, 'utf-8');
  assert(!storeRaw.includes(liveToken), 'Raw token is never persisted');

  // 8. What IS persisted is its SHA-256.
  const expectedHash = crypto.createHash('sha256').update(liveToken).digest('hex');
  const stored = readStore().passwordResets.find(r => r.token_hash === expectedHash);
  assert(Boolean(stored), 'Token is stored as a SHA-256 hash');

  // 9. The audit trail records the request without the token.
  const reqLog = readStore().auditLogs.find(l => l.action === 'Passcode Reset Requested');
  assert(Boolean(reqLog), 'Reset request is written to the audit log');
  assert(
    !reqLog?.details?.includes(liveToken),
    'Audit log does not contain the token'
  );

  // 10. Peeking is non-destructive.
  const peek1 = await serverStore.peekPasscodeReset(liveToken);
  const peek2 = await serverStore.peekPasscodeReset(liveToken);
  assert(
    peek1.valid && peek2.valid && peek1.registrationId === regId,
    'Peek reports the link valid and does not consume it'
  );

  // 11. A weak passcode is refused, and the token survives the rejection.
  const weak = await serverStore.redeemPasscodeReset(liveToken, 'short');
  assert(!weak.success, 'Passcode below the minimum length is refused');
  assert(
    (await serverStore.peekPasscodeReset(liveToken)).valid,
    'A rejected passcode does not burn the link'
  );

  // 12. Non-ASCII is refused for the same reason the generator avoids it.
  const fancy = await serverStore.redeemPasscodeReset(liveToken, 'pass’word’s');
  assert(!fancy.success, 'Passcode with smart quotes is refused');

  // 13. A good passcode is accepted.
  const newPasscode = 'orion-verify-2026';
  const redeemed = await serverStore.redeemPasscodeReset(liveToken, newPasscode);
  assert(redeemed.success, 'Valid passcode is accepted', redeemed.error || '');

  // 14. The new passcode authenticates.
  const loginNew = await serverStore.authenticateTeam(regId, newPasscode);
  assert(loginNew !== null, 'New passcode signs in');

  // 15. The old passcode no longer does.
  const loginOld = await serverStore.authenticateTeam(regId, originalPasscode);
  assert(loginOld === null, 'Old passcode is rejected after the reset');

  // 16. The link is single use.
  const replay = await serverStore.redeemPasscodeReset(liveToken, 'another-passcode-1');
  assert(!replay.success, 'A spent link cannot be redeemed twice');
  assert(
    (await serverStore.authenticateTeam(regId, 'another-passcode-1')) === null,
    'The replayed attempt did not change the passcode'
  );

  // 17. Completion is audited, without the passcode.
  const doneLog = readStore().auditLogs.find(l => l.action === 'Passcode Reset Completed');
  assert(Boolean(doneLog), 'Completed reset is written to the audit log');
  assert(!doneLog?.details?.includes(newPasscode), 'Audit log does not contain the new passcode');

  // 18. The team row holds no leftover reset material.
  const teamRow = readStore().teams.find(t => t.registration_id === regId);
  assert(teamRow?.access_token === newPasscode, 'Team row carries the new passcode');

  // 19. An expired link is refused. Age the row directly, as only time can.
  const fresh = await serverStore.createPasscodeReset(regId, leaderEmail, '127.0.0.1');
  if (!fresh) throw new Error('could not issue a token for the expiry check');
  const freshHash = crypto.createHash('sha256').update(fresh.rawToken).digest('hex');

  const s = readStore();
  const row = s.passwordResets.find(r => r.token_hash === freshHash);
  if (!row) throw new Error('could not locate the token row to expire');
  row.expires_at = new Date(Date.now() - 60 * 1000).toISOString();
  writeStore(s);

  const expiredPeek = await serverStore.peekPasscodeReset(fresh.rawToken);
  assert(expiredPeek.reason === 'EXPIRED', 'An expired link reports EXPIRED');
  const expiredRedeem = await serverStore.redeemPasscodeReset(fresh.rawToken, 'valid-passcode-99');
  assert(!expiredRedeem.success, 'An expired link cannot be redeemed');

  // 20. A garbage token is refused without throwing.
  const garbage = await serverStore.peekPasscodeReset('not-a-real-token');
  assert(garbage.valid === false && garbage.reason === 'INVALID', 'A forged token is refused');

  // 21. Completing a reset kills every other outstanding link for the team.
  //     Two are issued back to back; the second one is redeemed; the first must
  //     already be dead (retired at issue) and stay dead.
  const linkA = await serverStore.createPasscodeReset(regId, leaderEmail, '127.0.0.1');
  const linkB = await serverStore.createPasscodeReset(regId, leaderEmail, '127.0.0.1');
  if (!linkA || !linkB) throw new Error('could not issue the pair of tokens');
  const finalPass = 'orion-final-passcode';
  const redeemB = await serverStore.redeemPasscodeReset(linkB.rawToken, finalPass);
  assert(redeemB.success, 'Second link redeems', redeemB.error || '');
  assert(
    !(await serverStore.peekPasscodeReset(linkA.rawToken)).valid,
    'The superseded link is dead after the reset completes'
  );

  // 22. Login comparison trims, so a stored passcode must never carry edge
  //     whitespace — otherwise it could never be typed correctly.
  const spaced = await serverStore.createPasscodeReset(regId, leaderEmail, '127.0.0.1');
  if (!spaced) throw new Error('could not issue a token for the whitespace check');
  await serverStore.redeemPasscodeReset(spaced.rawToken, '  padded-passcode  ');
  const paddedRow = readStore().teams.find(t => t.registration_id === regId);
  assert(paddedRow?.access_token === 'padded-passcode', 'Stored passcode is trimmed');
  assert(
    (await serverStore.authenticateTeam(regId, 'padded-passcode')) !== null,
    'Trimmed passcode signs in'
  );

  // 23. Sanity check on the shared policy module the UI also imports.
  assert(validateNewPasscode('1234567').ok === false, 'Policy rejects 7 characters');
  assert(validateNewPasscode('12345678').ok === true, 'Policy accepts 8 characters');
  assert(validateNewPasscode('a'.repeat(65)).ok === false, 'Policy rejects 65 characters');
  assert(RESET_TOKEN_TTL_MINUTES >= 15 && RESET_TOKEN_TTL_MINUTES <= 30, 'TTL is within 15-30 minutes');

  // 24. safeEqualCI is what login uses; confirm the case-insensitivity the
  //     reset page warns participants about is real.
  assert(safeEqualCI('Padded-Passcode', 'padded-passcode'), 'Passcode comparison is case-insensitive');
}

const hadBackup = fs.existsSync(STORE_FILE);
if (hadBackup) fs.copyFileSync(STORE_FILE, BACKUP_FILE);

main()
  .then(() => {
    console.log(`\n${passed}/${total} checks passed.`);
  })
  .catch(err => {
    console.error('\nVerification threw:', err);
    process.exitCode = 1;
  })
  .finally(() => {
    if (hadBackup) {
      fs.copyFileSync(BACKUP_FILE, STORE_FILE);
      fs.unlinkSync(BACKUP_FILE);
      console.log('Local store restored.');
    }
    if (passed !== total) process.exitCode = 1;
  });
