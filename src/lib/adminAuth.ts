import crypto from 'crypto';

// ==============================================================================
// Admin authentication — server only
// ==============================================================================
//
// The admin console used to keep ADMIN_SECRET_KEY itself in sessionStorage and
// replay it in an `x-admin-key` header on every request. That put the raw
// server env secret inside a JS-readable store on a page that also renders
// participant-supplied text: one XSS anywhere on the origin, one malicious
// extension, or one shoulder-surfed devtools tab and the attacker holds the
// permanent master key — no expiry, no revocation short of redeploying.
//
// The passcode is now exchanged once for a signed, expiring session token that
// is delivered as an HttpOnly cookie, so script on the page cannot read it and
// it dies on its own. The token is an HMAC over its own expiry and a nonce,
// keyed by the admin secret, which means:
//   - it is verifiable with no server-side session store (this app is
//     stateless and runs on serverless instances that share no memory), and
//   - rotating ADMIN_SECRET_KEY invalidates every outstanding session.

export const ADMIN_SESSION_COOKIE = 'orion_admin_session';

/** 8 hours: long enough for an event day, short enough to expire overnight. */
export const ADMIN_SESSION_TTL_SECONDS = 8 * 60 * 60;

function adminSecret(): string {
  return (process.env.ADMIN_SECRET_KEY || '').trim();
}

/** A secret shorter than 8 chars is treated as unset — fail closed, never open. */
export function isAdminSecretUsable(): boolean {
  return adminSecret().length >= 8;
}

export function safeCompare(a: string, b: string): boolean {
  if (!a || !b) return false;
  const bufA = Buffer.from(a);
  const bufB = Buffer.from(b);
  if (bufA.length !== bufB.length) return false;
  return crypto.timingSafeEqual(bufA, bufB);
}

/** Verifies a passcode typed at the admin login screen. */
export function verifyAdminPasscode(passcode: string): boolean {
  if (!isAdminSecretUsable()) return false;
  return safeCompare((passcode || '').trim(), adminSecret());
}

function sign(payload: string): string {
  // Domain-separated so a session token can never be confused with any other
  // HMAC we might key off the same secret later.
  return crypto.createHmac('sha256', adminSecret()).update(`orion.admin.v1|${payload}`).digest('hex');
}

/** Token layout: v1.<expiry epoch seconds>.<nonce>.<hmac> */
export function issueAdminSessionToken(now = Date.now()): string {
  const expiresAt = Math.floor(now / 1000) + ADMIN_SESSION_TTL_SECONDS;
  const nonce = crypto.randomBytes(12).toString('hex');
  const payload = `${expiresAt}.${nonce}`;
  return `v1.${payload}.${sign(payload)}`;
}

export function verifyAdminSessionToken(token: string, now = Date.now()): boolean {
  if (!token || !isAdminSecretUsable()) return false;
  const parts = token.split('.');
  if (parts.length !== 4 || parts[0] !== 'v1') return false;

  const [, expRaw, nonce, mac] = parts;
  const expected = sign(`${expRaw}.${nonce}`);
  // Compare before trusting the expiry, so a forged token cannot be probed by
  // timing the expiry branch.
  if (!safeCompare(mac, expected)) return false;

  const expiresAt = Number(expRaw);
  if (!Number.isFinite(expiresAt)) return false;
  return Math.floor(now / 1000) < expiresAt;
}

function readCookie(request: Request, name: string): string {
  const header = request.headers.get('cookie') || '';
  for (const part of header.split(';')) {
    const eq = part.indexOf('=');
    if (eq < 0) continue;
    if (part.slice(0, eq).trim() === name) {
      return decodeURIComponent(part.slice(eq + 1).trim());
    }
  }
  return '';
}

/**
 * Authorises an admin request.
 *
 * The browser uses the HttpOnly session cookie. The `x-admin-key` header is
 * still accepted for out-of-band operator tooling (curl, a runbook script),
 * which is a deliberate choice: the finding was that the *browser* persisted
 * the master secret, not that the header exists. Nothing shipped to the client
 * sends that header any more.
 */
export function isAdminRequest(request: Request): boolean {
  if (!isAdminSecretUsable()) return false;

  const cookie = readCookie(request, ADMIN_SESSION_COOKIE);
  if (cookie && verifyAdminSessionToken(cookie)) return true;

  const headerKey = (request.headers.get('x-admin-key') || '').trim();
  return headerKey ? safeCompare(headerKey, adminSecret()) : false;
}

function cookieAttributes(maxAge: number): string {
  const attrs = [
    `Path=/`,
    `Max-Age=${maxAge}`,
    `HttpOnly`,
    // Strict: no admin request should ever ride along with a cross-site
    // navigation, which also removes the CSRF exposure the cookie would
    // otherwise add to the state-changing POSTs on /api/admin/*.
    `SameSite=Strict`
  ];
  if (process.env.NODE_ENV === 'production') attrs.push('Secure');
  return attrs.join('; ');
}

export function buildAdminSessionCookie(token: string): string {
  return `${ADMIN_SESSION_COOKIE}=${encodeURIComponent(token)}; ${cookieAttributes(ADMIN_SESSION_TTL_SECONDS)}`;
}

export function buildClearedAdminSessionCookie(): string {
  return `${ADMIN_SESSION_COOKIE}=; ${cookieAttributes(0)}`;
}
