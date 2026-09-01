import { NextResponse } from 'next/server';
import crypto from 'crypto';
import { serverStore } from '@/lib/serverStore';

export const dynamic = 'force-dynamic';

/**
 * Scheduled unpaid-payment reminder sweep.
 *
 * This must not be publicly callable. Each invocation loads every team plus all
 * related tables and then sends real email, so an open endpoint is an
 * unauthenticated way to exhaust the SMTP quota (and get the Gmail account
 * suspended), burn Supabase egress and run up function time.
 *
 * Authorise with either:
 *   - `Authorization: Bearer <CRON_SECRET>`  (Vercel Cron sends this
 *     automatically when CRON_SECRET is set in the project env), or
 *   - `x-cron-secret: <CRON_SECRET>`
 */
function authorized(request: Request): boolean {
  const secret = (process.env.CRON_SECRET || '').trim();

  // Fail closed. An unset secret must not mean "open to everyone".
  if (secret.length < 16) return false;

  const bearer = (request.headers.get('authorization') || '').replace(/^Bearer\s+/i, '').trim();
  const header = (request.headers.get('x-cron-secret') || '').trim();
  const provided = bearer || header;
  if (!provided) return false;

  const a = crypto.createHash('sha256').update(provided).digest();
  const b = crypto.createHash('sha256').update(secret).digest();
  return crypto.timingSafeEqual(a, b);
}

export async function GET(request: Request) {
  if (!authorized(request)) {
    if (!(process.env.CRON_SECRET || '').trim()) {
      console.error('[Cron] CRON_SECRET is not set — the reminder sweep is disabled until it is.');
    }
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  try {
    const result = await serverStore.checkAndSendUnpaidReminders();
    return NextResponse.json({
      success: true,
      timestamp: new Date().toISOString(),
      ...result
    });
  } catch (err: unknown) {
    console.error('[Cron] payment reminder sweep failed:', err);
    return NextResponse.json({ error: 'Cron job failed' }, { status: 500 });
  }
}
