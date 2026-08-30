import { NextResponse } from 'next/server';
import { serverStore } from '@/lib/serverStore';

export const dynamic = 'force-dynamic';

export async function GET() {
  try {
    const result = await serverStore.checkAndSendUnpaidReminders();
    return NextResponse.json({
      success: true,
      timestamp: new Date().toISOString(),
      ...result
    });
  } catch (err: unknown) {
    const msg = err instanceof Error ? err.message : 'Cron job failed';
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
