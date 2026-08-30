import { NextResponse } from 'next/server';
import crypto from 'crypto';
import { serverStore } from '@/lib/serverStore';
import { checkRateLimit, getClientIp } from '@/lib/rateLimit';

import { sendPaymentVerifiedEmail, sendResubmissionRequiredEmail } from '@/lib/email';

function safeCompare(a: string, b: string): boolean {
  if (!a || !b) return false;
  const bufA = Buffer.from(a);
  const bufB = Buffer.from(b);
  if (bufA.length !== bufB.length) return false;
  return crypto.timingSafeEqual(bufA, bufB);
}

function validateAdminKey(request: Request): boolean {
  const authKey = (request.headers.get('x-admin-key') || '').trim();
  const adminSecret = (process.env.ADMIN_SECRET_KEY || '').trim();
  if (!adminSecret || adminSecret.length < 8) return false;
  return safeCompare(authKey, adminSecret);
}

export async function GET(request: Request) {
  try {
    const clientIp = getClientIp(request);
    const rate = checkRateLimit(`admin-get-${clientIp}`, 60, 60 * 1000);
    if (!rate.allowed) {
      return NextResponse.json({ error: 'Too many requests. Please slow down.' }, { status: 429 });
    }

    if (!validateAdminKey(request)) {
      return NextResponse.json({ error: 'Unauthorized. Invalid admin security key.' }, { status: 401 });
    }

    const { searchParams } = new URL(request.url);
    const search = searchParams.get('search') || undefined;
    const paymentStatus = searchParams.get('paymentStatus') || undefined;
    const round1Status = searchParams.get('round1Status') || undefined;
    const track = searchParams.get('track') || undefined;
    const onlySuspicious = searchParams.get('onlySuspicious') === 'true';

    const result = await serverStore.getAdminOverview({
      search,
      paymentStatus,
      round1Status,
      track,
      onlySuspicious
    });

    const config = await serverStore.getConfig();

    // Trigger automated 5-minute unpaid payment reminders in background
    serverStore.checkAndSendUnpaidReminders().catch((remErr) => {
      console.error('[Background] Unpaid reminders check error:', remErr);
    });

    return NextResponse.json({
      success: true,
      stats: result.stats,
      teams: result.teams,
      auditLogs: result.auditLogs,
      config
    });

  } catch (err: unknown) {
    const msg = err instanceof Error ? err.message : 'Admin fetch failed';
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}

export async function POST(request: Request) {
  try {
    const clientIp = getClientIp(request);
    const body = await request.json();
    const { action, passcode, teamId, decision, score, reason, note, actor = 'Admin Secretariat' } = body;

    // 1. Passcode Authentication Check
    if (passcode !== undefined) {
      const rate = checkRateLimit(`admin-auth-${clientIp}`, 10, 60 * 1000);
      if (!rate.allowed) {
        return NextResponse.json({ success: false, error: 'Too many login attempts. Please wait a minute.' }, { status: 429 });
      }

      const cleanPasscode = String(passcode).trim();
      const adminSecret = (process.env.ADMIN_SECRET_KEY || '').trim();

      if (adminSecret && adminSecret.length >= 8 && safeCompare(cleanPasscode, adminSecret)) {
        return NextResponse.json({ success: true, authorized: true });
      }
      return NextResponse.json({ success: false, error: 'Incorrect Admin Passcode' }, { status: 401 });
    }

    // Ensure Admin Key is present for operational actions
    if (!validateAdminKey(request)) {
      return NextResponse.json({ error: 'Unauthorized admin operation' }, { status: 401 });
    }

    // 2. Payment Action: VERIFY, REJECT, REQUEST_RESUBMISSION, RESEND_EMAIL
    if (action === 'VERIFY_PAYMENT') {
      if (!teamId) return NextResponse.json({ error: 'teamId is required' }, { status: 400 });
      const res = await serverStore.updatePaymentVerification(teamId, 'VERIFY', actor, note);

      // Trigger verification confirmation email asynchronously
      if (res.team) {
        sendPaymentVerifiedEmail(res.team).catch((mailErr) => {
          console.error('[Admin API] Verification email trigger error:', mailErr);
        });
      }

      return NextResponse.json({ success: true, message: 'Payment verified, Round 1 unlocked, and confirmation email dispatched', data: res });
    }

    if (action === 'RESEND_VERIFICATION_EMAIL') {
      if (!teamId) return NextResponse.json({ error: 'teamId is required' }, { status: 400 });
      const team = await serverStore.getTeam(teamId);
      if (!team) return NextResponse.json({ error: 'Team not found' }, { status: 404 });
      
      const mailRes = await sendPaymentVerifiedEmail(team);
      if (!mailRes.success) {
        return NextResponse.json({ error: mailRes.error || 'Failed to dispatch email' }, { status: 500 });
      }
      return NextResponse.json({ success: true, message: `Verification email sent to ${team.leader_email}` });
    }

    if (action === 'REJECT_PAYMENT') {
      if (!teamId) return NextResponse.json({ error: 'teamId is required' }, { status: 400 });
      const res = await serverStore.updatePaymentVerification(teamId, 'REJECT', actor, reason);
      return NextResponse.json({ success: true, message: 'Payment marked as rejected', data: res });
    }

    if (action === 'REQUEST_PAYMENT_RESUBMISSION') {
      if (!teamId) return NextResponse.json({ error: 'teamId is required' }, { status: 400 });
      const res = await serverStore.updatePaymentVerification(teamId, 'REQUEST_RESUBMISSION', actor, reason);

      // Trigger resubmission notification email with admin comments
      if (res.team) {
        sendResubmissionRequiredEmail(res.team, reason || 'Please resubmit your verification details / 12-digit payment reference.').catch((mailErr) => {
          console.error('[Admin API] Resubmission email trigger error:', mailErr);
        });
      }

      return NextResponse.json({ success: true, message: 'Payment resubmission requested and notice email dispatched', data: res });
    }

    // 3. Round 1 Evaluation Action: SELECT, NOT_SELECTED, UNDER_REVIEW, SAVE_SCORES
    if (action === 'EVALUATE_ROUND_1') {
      if (!teamId || !decision) return NextResponse.json({ error: 'teamId and decision are required' }, { status: 400 });
      const { evaluationScores } = body;
      const res = await serverStore.evaluateRound1(teamId, decision, actor, score, note, evaluationScores);
      return NextResponse.json({ success: true, message: `Round 1 evaluation saved: ${decision}`, data: res });
    }

    // 4. Admin Note
    if (action === 'ADD_NOTE') {
      if (!teamId || note === undefined) return NextResponse.json({ error: 'teamId and note are required' }, { status: 400 });
      const team = await serverStore.addAdminNote(teamId, note, actor);
      return NextResponse.json({ success: true, message: 'Admin note recorded', team });
    }

    // 5. Permanent Delete Team Entry
    if (action === 'DELETE_TEAM') {
      if (!teamId) return NextResponse.json({ error: 'teamId is required' }, { status: 400 });
      const res = await serverStore.deleteTeam(teamId, actor);
      return NextResponse.json({ 
        success: true, 
        message: `Team ${res.deletedRegistrationId} permanently deleted from registry`, 
        data: res 
      });
    }

    // 6. Manual / Immediate Unpaid Payment Reminders Dispatch
    if (action === 'DISPATCH_PAYMENT_REMINDERS') {
      const result = await serverStore.checkAndSendUnpaidReminders();
      return NextResponse.json({
        success: true,
        message: `Scanned ${result.checked} squads: Dispatched ${result.sent} payment reminder emails (${result.notifiedTeams.join(', ') || 'no squads pending >5m'})`,
        data: result
      });
    }

    return NextResponse.json({ error: 'Unknown admin action' }, { status: 400 });

  } catch (err: unknown) {
    const msg = err instanceof Error ? err.message : 'Admin operation failed';
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
