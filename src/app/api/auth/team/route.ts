import { NextResponse } from 'next/server';
import { serverStore, toTeamFacingRecord } from '@/lib/serverStore';
import { checkRateLimit, getClientIp } from '@/lib/rateLimit';

export async function POST(request: Request) {
  try {
    const clientIp = getClientIp(request);
    const rate = checkRateLimit(`team-auth-${clientIp}`, 15, 60 * 1000);
    if (!rate.allowed) {
      return NextResponse.json({ 
        error: `Too many login attempts. Please wait ${rate.resetInSec}s before retrying.` 
      }, { status: 429 });
    }

    const body = await request.json();
    const identifier = (body.username || body.teamId || '').trim();
    const secret = (body.password || body.secret || '').trim();

    if (!identifier || !secret) {
      return NextResponse.json({ error: 'Username (or Team ID) and Password (or access passcode) are required.' }, { status: 400 });
    }

    const team = await serverStore.authenticateTeam(identifier, secret);

    if (!team) {
      return NextResponse.json({ 
        error: 'Invalid credentials. Enter your Team Name / Team ID and your Leader Name / access passcode.' 
      }, { status: 401 });
    }

    const config = await serverStore.getConfig();

    return NextResponse.json({
      success: true,
      team: toTeamFacingRecord(team),
      config
    });
  } catch (err: unknown) {
    const msg = err instanceof Error ? err.message : 'Authentication failed';
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
