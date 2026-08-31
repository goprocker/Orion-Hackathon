// Regression checks for the medium-severity findings that were deferred out of
// fix/security-critical-and-high. Each assertion maps to one finding.
//
//   npx tsx scripts/verify_security_medium.ts

import crypto from 'crypto';
import fs from 'fs';
import path from 'path';
import { validateUploadSignature } from '../src/lib/fileValidation';
import { buildStorageRef, parseStorageRef } from '../src/lib/storage';

process.env.ADMIN_SECRET_KEY = process.env.ADMIN_SECRET_KEY || 'test-admin-secret-key';

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

function crc32(buf: Buffer): number {
  let c = ~0;
  for (let i = 0; i < buf.length; i++) {
    c ^= buf[i];
    for (let k = 0; k < 8; k++) c = (c >>> 1) ^ (0xedb88320 & -(c & 1));
  }
  return (~c) >>> 0;
}

/** Minimal ZIP writer, stored (uncompressed) entries. */
function zip(entries: { name: string; body: Buffer }[]): Buffer {
  const locals: Buffer[] = [];
  const centrals: Buffer[] = [];
  let offset = 0;

  for (const e of entries) {
    const name = Buffer.from(e.name, 'latin1');
    const crc = crc32(e.body);

    const local = Buffer.alloc(30);
    local.writeUInt32LE(0x04034b50, 0);
    local.writeUInt16LE(20, 4);
    local.writeUInt32LE(crc, 14);
    local.writeUInt32LE(e.body.length, 18);
    local.writeUInt32LE(e.body.length, 22);
    local.writeUInt16LE(name.length, 26);
    locals.push(local, name, e.body);

    const central = Buffer.alloc(46);
    central.writeUInt32LE(0x02014b50, 0);
    central.writeUInt16LE(20, 4);
    central.writeUInt16LE(20, 6);
    central.writeUInt32LE(crc, 16);
    central.writeUInt32LE(e.body.length, 20);
    central.writeUInt32LE(e.body.length, 24);
    central.writeUInt16LE(name.length, 28);
    central.writeUInt32LE(offset, 42);
    centrals.push(central, name);

    offset += 30 + name.length + e.body.length;
  }

  const localBuf = Buffer.concat(locals);
  const centralBuf = Buffer.concat(centrals);
  const eocd = Buffer.alloc(22);
  eocd.writeUInt32LE(0x06054b50, 0);
  eocd.writeUInt16LE(entries.length, 8);
  eocd.writeUInt16LE(entries.length, 10);
  eocd.writeUInt32LE(centralBuf.length, 12);
  eocd.writeUInt32LE(localBuf.length, 16);
  return Buffer.concat([localBuf, centralBuf, eocd]);
}

async function run() {
  console.log('=== MEDIUM-SEVERITY SECURITY REGRESSION CHECKS ===\n');

  // ------------------------------------------------------------------ #3 pptx
  console.log('--- The .pptx magic-byte check accepted any ZIP ---');

  const realPptx = zip([
    { name: '[Content_Types].xml', body: Buffer.from('<Types/>') },
    { name: 'ppt/presentation.xml', body: Buffer.from('<presentation/>') },
    { name: 'ppt/slides/slide1.xml', body: Buffer.from('<sld/>') }
  ]);
  assert(validateUploadSignature(realPptx, '.pptx').ok, 'A genuine .pptx package is accepted');

  const plainZip = zip([{ name: 'payload.sh', body: Buffer.from('echo hi\n') }]);
  assert(plainZip.readUInt32LE(0) === 0x04034b50, 'The fixture really does start with the ZIP header');
  assert(!validateUploadSignature(plainZip, '.pptx').ok, 'A plain ZIP renamed to .pptx is rejected');

  const docx = zip([
    { name: '[Content_Types].xml', body: Buffer.from('<Types/>') },
    { name: 'word/document.xml', body: Buffer.from('<doc/>') }
  ]);
  assert(!validateUploadSignature(docx, '.pptx').ok, 'A .docx renamed to .pptx is rejected');

  const jarLike = zip([
    { name: 'META-INF/MANIFEST.MF', body: Buffer.from('Manifest-Version: 1.0\n') },
    { name: 'Main.class', body: Buffer.from([0xca, 0xfe, 0xba, 0xbe]) }
  ]);
  assert(!validateUploadSignature(jarLike, '.pptx').ok, 'A .jar renamed to .pptx is rejected');

  assert(
    !validateUploadSignature(Buffer.from('PK not really an archive'), '.pptx').ok,
    'Four ZIP bytes with no directory behind them are rejected'
  );

  const pdf = Buffer.concat([Buffer.from('%PDF-1.7\n'), Buffer.alloc(64)]);
  assert(validateUploadSignature(pdf, '.pdf').ok, 'A genuine PDF is accepted');
  assert(!validateUploadSignature(realPptx, '.pdf').ok, 'A .pptx renamed to .pdf is rejected');

  const ole2 = Buffer.concat([
    Buffer.from([0xd0, 0xcf, 0x11, 0xe0, 0xa1, 0xb1, 0x1a, 0xe1]),
    Buffer.alloc(64)
  ]);
  assert(validateUploadSignature(ole2, '.ppt').ok, 'A genuine legacy .ppt is accepted');

  const partialOle2 = Buffer.concat([Buffer.from([0xd0, 0xcf, 0x11, 0xe0, 0, 0, 0, 0]), Buffer.alloc(64)]);
  assert(
    !validateUploadSignature(partialOle2, '.ppt').ok,
    'The first four OLE2 bytes alone are no longer enough for .ppt'
  );

  assert(!validateUploadSignature(Buffer.alloc(0), '.pdf').ok, 'An empty file is rejected');
  assert(!validateUploadSignature(pdf, '.exe').ok, 'An unknown extension is rejected');

  // --------------------------------------------------------------- #4 storage
  console.log('\n--- Public storage bucket with permanent URLs ---');

  const ref = buildStorageRef('submissions', 'round_1/ORION-001_Round1_123.pptx');
  assert(ref === 'sb://submissions/round_1/ORION-001_Round1_123.pptx', 'What is stored is an internal ref, not a URL');

  const parsed = parseStorageRef(ref);
  assert(
    parsed?.bucket === 'submissions' && parsed?.path === 'round_1/ORION-001_Round1_123.pptx',
    'A storage ref round-trips'
  );

  const legacy = parseStorageRef('https://x.supabase.co/storage/v1/object/public/submissions/round_1/old.pptx');
  assert(
    legacy?.bucket === 'submissions' && legacy?.path === 'round_1/old.pptx',
    'Legacy public URLs still resolve to an object path, so no backfill is needed'
  );

  assert(parseStorageRef('/uploads/submissions/local.pptx') === null, 'A local upload path is passed through untouched');
  assert(parseStorageRef('') === null, 'An empty file_url is not treated as an object');

  // ----------------------------------------------------------------- #1 admin
  console.log('\n--- The admin master key was held in sessionStorage ---');

  const adminAuth = await import('../src/lib/adminAuth');
  const secret = process.env.ADMIN_SECRET_KEY as string;

  const token = adminAuth.issueAdminSessionToken();
  assert(adminAuth.verifyAdminSessionToken(token), 'A freshly issued session token verifies');
  assert(!token.includes(secret), 'The session token does not contain the admin secret');
  assert(
    !adminAuth.verifyAdminSessionToken(token.slice(0, -1) + (token.endsWith('a') ? 'b' : 'a')),
    'A tampered signature is rejected'
  );

  const [, exp, nonce, mac] = token.split('.');
  assert(
    !adminAuth.verifyAdminSessionToken(`v1.${Number(exp) + 99999}.${nonce}.${mac}`),
    'Extending the expiry invalidates the signature'
  );
  assert(
    !adminAuth.verifyAdminSessionToken(token, Date.now() + 9 * 60 * 60 * 1000),
    'A token past its 8-hour TTL is rejected'
  );
  assert(!adminAuth.verifyAdminSessionToken(''), 'An empty token is rejected');
  assert(
    !adminAuth.verifyAdminSessionToken(`v1.9999999999.deadbeef.${crypto.randomBytes(32).toString('hex')}`),
    'A token forged with the wrong key is rejected'
  );

  const cookie = adminAuth.buildAdminSessionCookie(token);
  assert(cookie.includes('HttpOnly'), 'The session cookie is HttpOnly, so page script cannot read it');
  assert(cookie.includes('SameSite=Strict'), 'The session cookie is SameSite=Strict');
  assert(cookie.includes('Path=/'), 'The session cookie is scoped to the site root');
  assert(adminAuth.buildClearedAdminSessionCookie().includes('Max-Age=0'), 'Logout expires the cookie server-side');

  const req = (headers: Record<string, string>) =>
    new Request('https://orion.test/api/admin/registrations', { headers });

  assert(
    adminAuth.isAdminRequest(req({ cookie: `orion_admin_session=${encodeURIComponent(token)}` })),
    'A request carrying the session cookie is authorised'
  );
  assert(!adminAuth.isAdminRequest(req({ cookie: 'orion_admin_session=forged' })), 'A forged cookie is rejected');
  assert(!adminAuth.isAdminRequest(req({})), 'An unauthenticated request is rejected');
  assert(
    adminAuth.isAdminRequest(req({ 'x-admin-key': secret })),
    'Out-of-band operator tooling can still authenticate with x-admin-key'
  );

  process.env.ADMIN_SECRET_KEY = '';
  assert(!adminAuth.isAdminSecretUsable(), 'An unset ADMIN_SECRET_KEY is not usable');
  assert(!adminAuth.isAdminRequest(req({ 'x-admin-key': '' })), 'Auth fails closed when the secret is unset');
  assert(!adminAuth.verifyAdminPasscode(''), 'An empty passcode never authenticates');
  process.env.ADMIN_SECRET_KEY = 'short';
  assert(!adminAuth.isAdminSecretUsable(), 'A secret shorter than 8 characters counts as unset');
  process.env.ADMIN_SECRET_KEY = secret;
  assert(adminAuth.verifyAdminPasscode(secret), 'The correct passcode authenticates');
  assert(!adminAuth.verifyAdminPasscode(`${secret}x`), 'A wrong passcode does not authenticate');

  // ------------------------------------------------------------------- #2 CSP
  console.log('\n--- No Content-Security-Policy ---');

  const nextConfig = (await import('../next.config')).default;
  const rules = await nextConfig.headers!();
  const siteRule = rules.find(r => r.source === '/:path*');
  const cspHeader = siteRule?.headers.find(h => h.key === 'Content-Security-Policy');
  assert(Boolean(cspHeader), 'A CSP is sent on every route');

  const csp = cspHeader?.value || '';
  for (const directive of [
    "default-src 'self'",
    "object-src 'none'",
    "frame-ancestors 'none'",
    "base-uri 'self'",
    "form-action 'self'"
  ]) {
    assert(csp.includes(directive), `CSP contains ${directive}`);
  }
  assert(csp.includes('https://fonts.gstatic.com'), 'CSP still allows the Google Fonts the site loads');
  assert(csp.includes('https://docs.google.com'), 'CSP still allows the deck preview iframe');

  const uploadRule = rules.find(r => r.source === '/uploads/:path*');
  const uploadCsp = uploadRule?.headers.filter(h => h.key === 'Content-Security-Policy') || [];
  assert(uploadCsp.length === 1, 'Uploaded decks get exactly one CSP, the sandboxing one');
  assert(uploadCsp[0]?.value.includes('sandbox'), 'Uploaded decks are still sandboxed');

  // -------------------------------------------------------------- #5 fallback
  console.log('\n--- The local upload fallback failed silently on serverless ---');

  const routeSrc = fs.readFileSync(
    path.join(process.cwd(), 'src', 'app', 'api', 'team', 'submission', 'route.ts'),
    'utf8'
  );
  assert(routeSrc.includes('isServerlessRuntime'), 'The upload route detects an ephemeral filesystem');
  assert(
    /isServerlessRuntime\(\)\)\s*\{\s*return NextResponse\.json\(/.test(routeSrc),
    'A failed cloud upload on serverless returns an error instead of writing to a disk that vanishes'
  );
  assert(routeSrc.includes('status: 503'), 'That failure is reported as 503, not as a successful submission');
  assert(routeSrc.includes('fs.statSync(filePath).size'), 'A local write is verified before being reported as saved');
  assert(!routeSrc.includes('getPublicUrl'), 'The upload route no longer stores a permanent public URL');

  console.log(`\n=== ${passed}/${total} CHECKS PASSED ===`);
  if (passed !== total) process.exit(1);
}

run().catch(err => {
  console.error(err);
  process.exit(1);
});
