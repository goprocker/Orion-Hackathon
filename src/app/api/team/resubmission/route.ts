import { NextResponse } from 'next/server';
import { serverStore, safeEqualCI } from '@/lib/serverStore';
import { checkRateLimit, getClientIp } from '@/lib/rateLimit';

/**
 * Participant-side re-upload request.
 *
 * A team's first Round 1 deck is auto-accepted once payment is verified.
 * Replacing it requires an organiser to approve a request, and each approval
 * is worth exactly one re-upload.
 */
export async function POST(request: Request) {
  try {
    const clientIp = getClientIp(request);
    const rate = checkRateLimit(`team-resub-${clientIp}`, 6, 60 * 1000);
    if (!rate.allowed) {
      return NextResponse.json(
        { error: `Too many requests. Please wait ${rate.resetInSec}s before trying again.` },
        { status: 429 }
      );
    }

    const body = await request.json().catch(() => ({}));
    const teamId = String(body.teamId || '').trim();
    const reason = String(body.reason || '').trim();
    const accessToken = (
      String(body.accessToken || '') ||
      request.headers.get('x-team-token') ||
      ''
    ).trim();

    if (!teamId) {
      return NextResponse.json({ error: 'Team ID is required' }, { status: 400 });
    }
    if (!accessToken) {
      return NextResponse.json({ error: 'Team Access Passcode is required.' }, { status: 401 });
    }

    const team = await serverStore.getTeam(teamId);
    if (!team) {
      return NextResponse.json({ error: 'Team not found' }, { status: 404 });
    }

    // Passcode only. The leader's email used to be accepted here too, which
    // made a semi-public address a valid credential.
    if (!team.access_token || !safeEqualCI(team.access_token, accessToken)) {
      return NextResponse.json({ error: 'Unauthorized. Invalid Team Passcode.' }, { status: 401 });
    }

    const result = await serverStore.requestRoundOneReupload(team.id, reason);
    if (!result.success) {
      return NextResponse.json({ error: result.error || 'Could not raise the request' }, { status: 400 });
    }

    return NextResponse.json({
      success: true,
      message: 'Re-upload request submitted. Organisers will review it and you will be emailed with their decision.',
      request: result.request
    });
  } catch (err: unknown) {
    const msg = err instanceof Error ? err.message : 'Could not raise the re-upload request';
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
