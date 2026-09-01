import { NextResponse } from 'next/server';
import { serverStore } from '@/lib/serverStore';
import { checkRateLimit, getClientIp } from '@/lib/rateLimit';

/**
 * Public counters for the landing page.
 *
 * This is unauthenticated and hit by every visitor, so it must stay cheap. It
 * previously called getAdminOverview(), which loads every team, member,
 * payment, submission, flag and audit row in order to produce these five
 * numbers — the whole database, per page load, for anyone. It now reads two
 * columns from one table, and is rate limited so a scripted refresh cannot
 * turn the homepage into a load generator.
 */
export async function GET(request: Request) {
  try {
    const clientIp = getClientIp(request);
    const rate = checkRateLimit(`reg-count-${clientIp}`, 60, 60 * 1000);
    if (!rate.allowed) {
      return NextResponse.json(
        { error: `Too many requests. Please wait ${rate.resetInSec}s.` },
        { status: 429 }
      );
    }

    const counts = await serverStore.getPublicCounts();

    return NextResponse.json({
      success: true,
      registeredTeams: counts.totalRegistrations,
      paymentConfirmed: counts.paymentVerified,
      paymentPending: counts.paymentPending,
      round1Submissions: counts.round1Submissions,
      round1Selected: counts.round1Selected
    });
  } catch (err: unknown) {
    const msg = err instanceof Error ? err.message : 'Failed to fetch registration count';
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
