// Regression checks for the bugs found in the codebase review.
//
//   npx tsx scripts/verify_bugfixes.ts
//
// Each assertion maps to one finding. Runs against the local .data file store
// with SMTP unconfigured, which is exactly the condition several of these bugs
// only appear under. The store is backed up on entry and restored on exit.

import fs from 'fs';
import path from 'path';
import { serverStore } from '../src/lib/serverStore';
import { sendPaymentReminderEmail } from '../src/lib/email';
import { POST as registrationsPOST } from '../src/app/api/registrations/route';

const STORE_FILE = path.join(process.cwd(), '.data', 'orion_store.json');
const BACKUP_FILE = path.join(process.cwd(), '.data', 'orion_store.backup.bugfix.json');

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

interface StoreShape {
  teams: {
    id: string;
    registration_id: string;
    admin_notes?: string | null;
    created_at: string;
    payment_status: string;
    round_1_status: string;
  }[];
  auditLogs: { action: string; team_id?: string | null }[];
}

const readStore = (): StoreShape => JSON.parse(fs.readFileSync(STORE_FILE, 'utf-8'));
/** Loose reader for assertions that reach past StoreShape. */
const readStore2 = (): { payments: { team_id: string; utr_number: string }[] } =>
  JSON.parse(fs.readFileSync(STORE_FILE, 'utf-8'));
const writeStore = (s: unknown) => fs.writeFileSync(STORE_FILE, JSON.stringify(s, null, 2), 'utf-8');

function jsonRequest(body: unknown): Request {
  return new Request('http://localhost/api/registrations', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(body)
  });
}

function validRegistration(stamp: number, overrides: Record<string, unknown> = {}) {
  return {
    teamName: `Bugfix Verify ${stamp}`,
    leaderName: 'Verify Leader',
    leaderPhone: `9${String(stamp).slice(-9)}`,
    leaderEmail: `bugfix.verify.${stamp}@example.com`,
    institution: 'Verification Institute',
    problemStatement: 'ORION-PS-01',
    members: [{ name: 'Member One', phone: `8${String(stamp).slice(-9)}` }],
    declarations: {
      accurateInfo: true,
      membersBelong: true,
      rulesAgreed: true,
      feeUnderstood: true,
      qualifierUnderstood: true
    },
    ...overrides
  };
}

async function main() {
  const stamp = Date.now();

  // ---------------------------------------------------------------------------
  // BUG 1 — the mailer reported success when it never sent anything.
  // ---------------------------------------------------------------------------
  console.log('\n--- BUG 1: mailer honesty ---');

  const { team: mailTeam } = await serverStore.registerTeam({
    teamName: `Mailer Verify ${stamp}`,
    leaderName: 'Mail Leader',
    leaderPhone: `97${String(stamp).slice(-8)}`,
    leaderEmail: `mailer.verify.${stamp}@example.com`,
    institution: 'Verification Institute',
    problemStatement: 'ORION-PS-01',
    members: [{ name: 'M1', phone: `87${String(stamp).slice(-8)}` }]
  });

  const mailRes = await sendPaymentReminderEmail(mailTeam);
  assert(mailRes.simulated === true, 'Unconfigured SMTP is reported as simulated, not delivered');
  assert(mailRes.success === true, 'Simulated send still reports success (local dev keeps working)');

  // ---------------------------------------------------------------------------
  // BUG 2 — the reminder sweep marked teams as reminded on a simulated send,
  //         and recorded that by overwriting the organisers' admin_notes.
  // ---------------------------------------------------------------------------
  console.log('\n--- BUG 2: reminder sweep ---');

  // Age the team past the 5-minute threshold and give it an organiser note.
  const ORGANISER_NOTE = 'IMPORTANT: organiser note that must survive the sweep.';
  {
    const s = readStore();
    const row = s.teams.find(t => t.registration_id === mailTeam.registration_id);
    if (!row) throw new Error('could not find the team to age');
    row.created_at = new Date(Date.now() - 60 * 60 * 1000).toISOString();
    row.admin_notes = ORGANISER_NOTE;
    writeStore(s);
  }

  const sweep = await serverStore.checkAndSendUnpaidReminders();

  assert(
    sweep.skippedNotConfigured >= 1,
    'Sweep reports reminders skipped because SMTP is unconfigured',
    JSON.stringify(sweep)
  );
  assert(
    !sweep.notifiedTeams.includes(mailTeam.registration_id),
    'A simulated send is NOT counted as a delivered reminder'
  );

  const afterSweep = readStore();
  const sweptTeam = afterSweep.teams.find(t => t.registration_id === mailTeam.registration_id);
  assert(
    sweptTeam?.admin_notes === ORGANISER_NOTE,
    'The organiser note is left byte-identical by the sweep',
    `got ${JSON.stringify(sweptTeam?.admin_notes)}`
  );
  assert(
    !(sweptTeam?.admin_notes || '').includes('AUTO_PAYMENT_REMINDER_SENT'),
    'No automation marker is written into the human notes field'
  );
  assert(
    !afterSweep.auditLogs.some(l => l.action === 'Payment Reminder Sent' && l.team_id === sweptTeam?.id),
    'No "reminder sent" audit row is written when nothing was sent'
  );

  // The reminder is still owed: a second sweep must try again, not skip it as
  // already-reminded. This is the regression that mattered most.
  const sweep2 = await serverStore.checkAndSendUnpaidReminders();
  assert(
    sweep2.skippedNotConfigured >= 1,
    'The undelivered reminder is retried on the next sweep, not suppressed',
    JSON.stringify(sweep2)
  );

  // ---------------------------------------------------------------------------
  // BUG 3 — the declaration consent gate could be skipped by omitting the field.
  // ---------------------------------------------------------------------------
  console.log('\n--- BUG 3: declaration consent gate ---');

  const noDecl = validRegistration(stamp + 1);
  delete (noDecl as Record<string, unknown>).declarations;
  const resNoDecl = await registrationsPOST(jsonRequest(noDecl));
  assert(resNoDecl.status === 400, 'Registration with NO declarations field is rejected', `got ${resNoDecl.status}`);

  const nullDecl = validRegistration(stamp + 2, { declarations: null });
  const resNull = await registrationsPOST(jsonRequest(nullDecl));
  assert(resNull.status === 400, 'Registration with null declarations is rejected', `got ${resNull.status}`);

  const partialDecl = validRegistration(stamp + 3, {
    declarations: {
      accurateInfo: true,
      membersBelong: true,
      rulesAgreed: false,
      feeUnderstood: true,
      qualifierUnderstood: true
    }
  });
  const resPartial = await registrationsPOST(jsonRequest(partialDecl));
  assert(resPartial.status === 400, 'Registration with one unchecked declaration is rejected', `got ${resPartial.status}`);

  const goodDecl = validRegistration(stamp + 4);
  const resGood = await registrationsPOST(jsonRequest(goodDecl));
  assert(resGood.status === 201, 'A fully-consented registration still succeeds', `got ${resGood.status}`);

  // ---------------------------------------------------------------------------
  // BUG 4 — the public counter loaded the entire database.
  // ---------------------------------------------------------------------------
  console.log('\n--- BUG 4: public counters ---');

  const cheap = await serverStore.getPublicCounts();
  const full = await serverStore.getAdminOverview();

  assert(
    cheap.totalRegistrations === full.stats.totalRegistrations,
    'Cheap count matches the admin total',
    `${cheap.totalRegistrations} vs ${full.stats.totalRegistrations}`
  );
  assert(
    cheap.paymentVerified === full.stats.paymentVerified,
    'Cheap count matches admin paymentVerified'
  );
  assert(
    cheap.paymentPending === full.stats.paymentPending,
    'Cheap count matches admin paymentPending'
  );
  assert(
    cheap.round1Submissions === full.stats.round1Submissions,
    'Cheap count matches admin round1Submissions'
  );
  assert(
    cheap.round1Selected === full.stats.round1Selected,
    'Cheap count matches admin round1Selected'
  );

  // The public shape must not carry anything beyond the five numbers.
  const leaked = Object.keys(cheap).filter(
    k => !['totalRegistrations', 'paymentVerified', 'paymentPending', 'round1Submissions', 'round1Selected'].includes(k)
  );
  assert(leaked.length === 0, 'Public counts expose only the five counters', leaked.join(', '));

  // ---------------------------------------------------------------------------
  // BUG 6 — every payment submission failed on Supabase, and the failure was
  //         reported to the participant as "Team record not found locally."
  // ---------------------------------------------------------------------------
  console.log('\n--- BUG 6: payment submission ---');

  // 6a. The structural check that would have caught this before it shipped.
  //     An upsert with onConflict:'X' is a hard Postgres error (42P10) unless
  //     column X carries a unique constraint. This asserts the code and the
  //     schema agree, for every upsert in the store.
  const storeRaw = fs.readFileSync(path.join(process.cwd(), 'src/lib/serverStore.ts'), 'utf-8');

  // Scan CODE only. The doc comment on submitPayment quotes both the
  // onConflict target and the old error string while explaining the bug, and
  // a scanner that cannot tell prose from code would flag its own explanation.
  function stripComments(src: string): string {
    const withoutBlocks = src.replace(/\/\*[\s\S]*?\*\//g, '');
    return withoutBlocks
      .split('\n')
      .filter(line => {
        const t = line.trim();
        return !t.startsWith('//') && !t.startsWith('*');
      })
      .join('\n');
  }

  const storeSrc = stripComments(storeRaw);
  const schemaSrc = fs.readFileSync(path.join(process.cwd(), 'src/db/schema.sql'), 'utf-8');

  function tableBlock(table: string): string {
    const marker = `create table if not exists public.${table} (`;
    const start = schemaSrc.indexOf(marker);
    if (start < 0) return '';
    const end = schemaSrc.indexOf('\n);', start);
    return schemaSrc.slice(start, end < 0 ? undefined : end);
  }

  function columnIsUnique(table: string, column: string): boolean {
    const block = tableBlock(table);
    if (!block) return false;
    for (const raw of block.split('\n')) {
      const line = raw.trim();
      if (!line.startsWith(column + ' ')) continue;
      return /\bunique\b/i.test(line) || /\bprimary key\b/i.test(line);
    }
    // A table-level constraint counts too.
    return new RegExp(`unique\\s*\\(\\s*${column}\\s*\\)`, 'i').test(block);
  }

  const upsertTargets: { table: string; column: string }[] = [];
  const onConflictRe = /onConflict:\s*'([a-z_]+)'/g;
  let m: RegExpExecArray | null;
  while ((m = onConflictRe.exec(storeSrc)) !== null) {
    // Walk back to the nearest .from('<table>') that precedes this upsert.
    const before = storeSrc.slice(0, m.index);
    const fromMatches = [...before.matchAll(/\.from\('([a-z_]+)'\)/g)];
    const table = fromMatches.length ? fromMatches[fromMatches.length - 1][1] : '';
    upsertTargets.push({ table, column: m[1] });
  }

  assert(upsertTargets.length > 0, 'Found at least one upsert with an onConflict target to check');

  for (const t of upsertTargets) {
    assert(
      columnIsUnique(t.table, t.column),
      `upsert onConflict '${t.column}' on ${t.table} has a matching UNIQUE constraint`,
      'without it Postgres raises 42P10 and the write always fails'
    );
  }

  // 6b. The Supabase branch must never fall through to the local file store.
  //     That fallthrough is what surfaced a database error to the participant
  //     as "Team record not found locally".
  assert(
    !storeSrc.includes('Team record not found locally.'),
    'The "not found locally" error string is gone from submitPayment'
  );

  // 6c. The local path still works end to end for a registered team.
  const payStamp = Date.now();
  const { team: payTeam } = await serverStore.registerTeam({
    teamName: `Payment Verify ${payStamp}`,
    leaderName: 'Pay Leader',
    leaderPhone: `96${String(payStamp).slice(-8)}`,
    leaderEmail: `pay.verify.${payStamp}@example.com`,
    institution: 'Verification Institute',
    problemStatement: 'ORION-PS-01',
    members: [{ name: 'M1', phone: `86${String(payStamp).slice(-8)}` }]
  });

  const utr = `UTR${String(payStamp).slice(-9)}`;
  const payRes = await serverStore.submitPayment(payTeam.id, {
    utrNumber: utr,
    payerName: 'Pay Leader',
    payerUpi: 'payleader@okaxis',
    amount: 100
  });
  assert(payRes.success === true, 'A registered team can submit its payment reference', payRes.error || '');
  assert(payRes.payment?.utr_number === utr, 'The stored UTR matches what was submitted');

  // 6d. Resubmitting updates in place rather than creating a second row — the
  //     one-payment-per-team invariant the new unique constraint enforces.
  const utr2 = `UTR${String(payStamp + 1).slice(-9)}`;
  const payRes2 = await serverStore.submitPayment(payTeam.id, {
    utrNumber: utr2,
    payerName: 'Pay Leader',
    payerUpi: 'payleader@okaxis',
    amount: 100
  });
  assert(payRes2.success === true, 'A team can correct its UTR', payRes2.error || '');

  const payRows = readStore2().payments.filter(p => p.team_id === payTeam.id);
  assert(payRows.length === 1, 'Resubmitting leaves exactly one payment row for the team', `got ${payRows.length}`);
  assert(payRows[0]?.utr_number === utr2, 'That row holds the corrected UTR');

  // 6e. A UTR already claimed by another team is still rejected.
  const otherStamp = payStamp + 500;
  const { team: otherTeam } = await serverStore.registerTeam({
    teamName: `Payment Other ${otherStamp}`,
    leaderName: 'Other Leader',
    leaderPhone: `95${String(otherStamp).slice(-8)}`,
    leaderEmail: `pay.other.${otherStamp}@example.com`,
    institution: 'Verification Institute',
    problemStatement: 'ORION-PS-01',
    members: [{ name: 'M1', phone: `85${String(otherStamp).slice(-8)}` }]
  });
  const stolen = await serverStore.submitPayment(otherTeam.id, {
    utrNumber: utr2,
    payerName: 'Other Leader',
    payerUpi: 'otherleader@ybl',
    amount: 100
  });
  assert(stolen.success === false, 'A UTR already used by another team is rejected');

}

const hadBackup = fs.existsSync(STORE_FILE);
if (hadBackup) fs.copyFileSync(STORE_FILE, BACKUP_FILE);

main()
  .then(() => console.log(`\n${passed}/${total} checks passed.`))
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
