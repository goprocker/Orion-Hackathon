import { NextResponse, after } from 'next/server';
import { serverStore } from '@/lib/serverStore';
import { sendPasscodeChangedEmail } from '@/lib/email';
import { PASSCODE_MIN_LENGTH, PASSCODE_MAX_LENGTH } from '@/lib/passcodePolicy';
import { checkRateLimit, getClientIp } from '@/lib/rateLimit';

// ==============================================================================
// POST /api/auth/team/reset — spend a reset link and set the new passcode
// ==============================================================================
//
// The matching validity probe lives at ./verify, which explains why both are
// POSTs rather than a GET.
//
// Unlike /forgot, specific error messages are fine here: the caller already
// holds a 256-bit token, so "expired" or "already used" tells them nothing they
// could not learn by simply trying it. What is NOT fine is echoing the token or
// the passcode into a log line or a response body, and neither happens below.

export async function POST(request: Request) {
  try {
    const clientIp = getClientIp(request);
    const rate = checkRateLimit(`team-reset-commit-${clientIp}`, 10, 15 * 60 * 1000);
    if (!rate.allowed) {
      return NextResponse.json(
        { error: `Too many reset attempts. Please wait ${rate.resetInSec}s before trying again.` },
        { status: 429 }
      );
    }

    const body = await request.json().catch(() => ({}));
    const token = String(body?.token ?? '').trim();
    const passcode = String(body?.passcode ?? '');

    if (!token) {
      return NextResponse.json(
        { error: 'This reset link is not valid. Request a new one.' },
        { status: 400 }
      );
    }

    if (!passcode) {
      return NextResponse.json(
        {
          error: `Choose a new passcode of at least ${PASSCODE_MIN_LENGTH} characters ` +
                 `(up to ${PASSCODE_MAX_LENGTH}).`
        },
        { status: 400 }
      );
    }

    const result = await serverStore.redeemPasscodeReset(token, passcode);

    if (!result.success) {
      return NextResponse.json({ error: result.error || 'Could not reset the passcode.' }, { status: 400 });
    }

    // Tell the leader their credentials changed. If the reset was not theirs,
    // this mail is the only way they find out — so it is sent even though the
    // request has already succeeded, and its failure does not fail the reset.
    if (result.team) {
      // after() rather than a bare promise: an un-awaited send is frozen with
      // the serverless function once the response returns and never delivers.
      const team = result.team;
      after(async () => {
        try {
          const res = await sendPasscodeChangedEmail(team);
          if (!res.success) {
            console.error(
              `[Reset] Could not deliver change notice for ${team.registration_id}: ${res.error}`
            );
          }
        } catch (err) {
          console.error('[Reset] Change-notice dispatch threw:', err);
        }
      });
    }

    // The registration ID goes back so the sign-in form can be prefilled. The
    // passcode does not — the participant just chose it, and putting it in a
    // response body only creates another copy to leak.
    return NextResponse.json({
      success: true,
      registrationId: result.team?.registration_id || null,
      message: 'Passcode updated. Sign in with your Team ID and your new passcode.'
    });
  } catch (err: unknown) {
    console.error('[Reset] reset commit error:', err instanceof Error ? err.message : err);
    return NextResponse.json(
      { error: 'Could not complete the reset. Please try again.' },
      { status: 500 }
    );
  }
}
