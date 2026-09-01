import { NextResponse } from 'next/server';
import { serverStore } from '@/lib/serverStore';
import { checkRateLimit, getClientIp } from '@/lib/rateLimit';

// ==============================================================================
// POST /api/auth/team/reset/verify — is this reset link still good?
// ==============================================================================
//
// A read-only probe, so GET would be the natural verb. It is a POST because the
// token would otherwise have to travel in the query string, and query strings
// end up in places application code does not control: the framework's own
// request log, the hosting platform's access logs, and any proxy in between.
// Next's dev server demonstrates this — it prints the full request URL for
// every route it serves.
//
// The token is unavoidably in the URL of the /portal/reset page the email links
// to, so this does not eliminate the exposure. It does stop us doubling it for
// no reason, and a request body is not logged. What actually contains the risk
// is the same three properties as ever: the token is single use, it expires in
// well under an hour, and only its hash is ever stored.

export async function POST(request: Request) {
  try {
    const clientIp = getClientIp(request);
    const rate = checkRateLimit(`team-reset-peek-${clientIp}`, 30, 60 * 1000);
    if (!rate.allowed) {
      return NextResponse.json(
        { error: `Too many requests. Please wait ${rate.resetInSec}s.` },
        { status: 429 }
      );
    }

    const body = await request.json().catch(() => ({}));
    const token = String(body?.token ?? '').trim();

    if (!token) {
      return NextResponse.json({ valid: false, reason: 'INVALID' });
    }

    const result = await serverStore.peekPasscodeReset(token);

    // 200 either way. The body carries the verdict; a 404 here would let anyone
    // watching the network read the outcome off the status line alone.
    return NextResponse.json(result);
  } catch (err: unknown) {
    console.error('[Reset] reset probe error:', err instanceof Error ? err.message : err);
    return NextResponse.json({ valid: false, reason: 'INVALID' });
  }
}
