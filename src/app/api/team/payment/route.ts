import { NextResponse } from 'next/server';
import { serverStore, safeEqualCI } from '@/lib/serverStore';
import { checkRateLimit, getClientIp } from '@/lib/rateLimit';

export async function POST(request: Request) {
  try {
    const clientIp = getClientIp(request);
    const rate = checkRateLimit(`team-pay-${clientIp}`, 15, 60 * 1000);
    if (!rate.allowed) {
      return NextResponse.json({ error: 'Too many requests. Please wait a minute.' }, { status: 429 });
    }

    const body = await request.json();
    const { teamId, accessToken, utrNumber, payerName } = body;

    if (!teamId?.trim()) {
      return NextResponse.json({ error: 'Team ID is required' }, { status: 400 });
    }
    if (!utrNumber?.trim()) {
      return NextResponse.json({ error: 'UTR / Transaction Reference Number is required' }, { status: 400 });
    }
    if (!payerName?.trim()) {
      return NextResponse.json({ error: 'Payer Name is required' }, { status: 400 });
    }

    const cleanUTR = utrNumber.trim().toUpperCase().replace(/[^A-Z0-9]/g, '');
    if (cleanUTR.length < 6 || cleanUTR.length > 30) {
      return NextResponse.json({ error: 'Invalid UTR / Transaction Reference format (6-30 alphanumeric characters)' }, { status: 400 });
    }

    const team = await serverStore.getTeam(teamId.trim());
    if (!team) {
      return NextResponse.json({ error: 'Team not found' }, { status: 404 });
    }

    // Authentication is mandatory. It used to be skipped entirely when the
    // caller simply omitted `accessToken`, and the leader's email was accepted
    // in place of the passcode — so anyone who knew an (enumerable) team ID
    // could overwrite that team's payment reference.
    const cleanToken = String(accessToken || '').trim();
    if (!cleanToken) {
      return NextResponse.json({ error: 'Team Access Passcode is required.' }, { status: 401 });
    }

    const storedToken = (team.access_token || '').trim();
    if (!storedToken || !safeEqualCI(storedToken, cleanToken)) {
      return NextResponse.json({ error: 'Unauthorized. Invalid Team Passcode.' }, { status: 401 });
    }

    // The fee is set by the organisers, never by the caller. An unvalidated
    // client `amount` was being persisted verbatim into the payments ledger.
    const config = await serverStore.getConfig();

    const result = await serverStore.submitPayment(team.id, {
      utrNumber: cleanUTR,
      payerName: payerName.trim(),
      amount: config.round1FeeInr || 100
    });

    if (!result.success) {
      return NextResponse.json({ error: result.error || 'Failed to submit payment' }, { status: 400 });
    }

    return NextResponse.json({
      success: true,
      message: 'Payment reference submitted successfully. Organizers will verify and unlock Round 1.',
      payment: result.payment
    });

  } catch (err: unknown) {
    const msg = err instanceof Error ? err.message : 'Payment submission error';
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
