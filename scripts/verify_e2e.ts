import { serverStore } from '../src/lib/serverStore';

async function runE2ETests() {
  console.log('=== STARTING ORION 14-POINT END-TO-END VERIFICATION ===\n');
  let passedCount = 0;
  let totalCount = 0;

  function assert(condition: boolean, testName: string, extra = '') {
    totalCount++;
    if (condition) {
      console.log(`[PASS ${totalCount}] ${testName}`);
      passedCount++;
    } else {
      console.error(`[FAIL ${totalCount}] ${testName} -> ${extra}`);
    }
  }

  try {
    // Unique identities per run: leader re-registration is now hard-blocked,
    // so fixed emails/phones would collide with leftovers from earlier runs.
    const stamp = Date.now().toString().slice(-8);

    // 1. Register Team Alpha
    console.log('\n--- TEST STEP 1: Register Team Alpha ---');
    const alphaPayload = {
      teamName: 'CyberNovas Alpha',
      problemStatement: 'CYBER-01',
      institution: 'Sathyabama Institute of Science and Technology',
      department: 'Computer Science',
      year: '3rd Year',
      leaderName: 'Arjun Sharma',
      leaderEmail: `arjun.sharma+${stamp}@testgenesis.org`,
      leaderPhone: `96${stamp}`,
      members: [
        {
          name: 'Priya Sundar',
          email: `priya.sundar+${stamp}@testgenesis.org`,
          phone: `97${stamp}`,
          department: 'Information Technology',
          year: '3rd Year'
        }
      ]
    };

    const regAlpha = await serverStore.registerTeam(alphaPayload);
    const teamAlpha = regAlpha.team;
    assert(!!teamAlpha.registration_id && teamAlpha.registration_id.startsWith('ORION-2026-'), 'Generated valid Team ID format: ' + teamAlpha.registration_id);
    assert(!!teamAlpha.access_token && /^ORN-[0-9A-Z]{4}-[0-9A-Z]{4}$/.test(teamAlpha.access_token), 'Generated secure access passcode: ' + teamAlpha.access_token);
    assert(teamAlpha.payment_status === 'NOT_SUBMITTED', 'Payment status is NOT_SUBMITTED before UTR');
    assert(teamAlpha.round_1_status === 'NOT_STARTED', 'Round 1 status initialized as NOT_STARTED');
    assert(teamAlpha.round_2_status === 'LOCKED', 'Round 2 status initialized as LOCKED');

    // Submit Payment UTR for Team Alpha
    console.log('\n--- TEST STEP 1b: Submit Payment UTR ---');
    const uniqueUtr = 'UTR_' + Date.now();
    const paymentResult = await serverStore.submitPayment(teamAlpha.id, {
      utrNumber: uniqueUtr,
      payerName: 'Arjun Sharma',
      payerUpi: 'arjunsharma@oksbi',
      amount: 400
    });
    assert(paymentResult.success === true, 'Payment submission succeeded');
    const teamAlphaAfterPayment = await serverStore.getTeam(teamAlpha.id);
    assert(teamAlphaAfterPayment?.payment_status === 'PENDING', 'Payment status updated to PENDING after submitting UTR');

    // 2. Duplicate UTR Rejection Test
    console.log('\n--- TEST STEP 2: Duplicate UTR Detection ---');
    const betaPayload = {
      teamName: 'Duplicate Test Squad',
      problemStatement: 'AI-01',
      institution: 'Anna University',
      leaderName: 'Vikram Patel',
      leaderEmail: `vikram.patel+${stamp}@other.org`,
      leaderPhone: `91${stamp}`,
      members: [
        {
          name: 'Rohan Verma',
          phone: `92${stamp}`
        }
      ]
    };
    const regBeta = await serverStore.registerTeam(betaPayload);
    // Attempt to submit identical UTR
    const duplicateRes = await serverStore.submitPayment(regBeta.team.id, {
      utrNumber: uniqueUtr,
      payerName: 'Vikram Patel',
      payerUpi: 'vikrampatel@okicici',
      amount: 400
    });
    assert(duplicateRes.success === false, 'Duplicate UTR was rejected: ' + duplicateRes.error);

    // 3a. A leader who already owns a team must be BLOCKED from re-registering
    //     (double-submits were filling the roster and CSV with twin teams).
    console.log('\n--- TEST STEP 3a: Duplicate Leader Registration Blocked ---');
    let dupBlocked = false;
    let dupMsg = '';
    try {
      await serverStore.registerTeam({
        teamName: 'Shadow Syndicate',
        problemStatement: 'AI-02',
        institution: 'Sathyabama University',
        leaderName: 'Arjun Clone',
        leaderEmail: alphaPayload.leaderEmail, // REUSED LEADER EMAIL
        leaderPhone: alphaPayload.leaderPhone, // REUSED LEADER PHONE
        members: [{ name: 'Clone Member', phone: `93${stamp}` }]
      });
    } catch (err) {
      dupBlocked = true;
      dupMsg = err instanceof Error ? err.message : String(err);
    }
    assert(dupBlocked, 'Re-registration by an already-registered leader is blocked');
    assert(dupMsg.includes(teamAlpha.registration_id), 'Block message names the existing squad: ' + dupMsg);

    // 3b. Member-level overlap stays a SOFT suspicion flag, not a block.
    console.log('\n--- TEST STEP 3b: Cross-Team Member Soft-Flagged ---');
    const regGamma = await serverStore.registerTeam({
      teamName: 'Shadow Syndicate II',
      problemStatement: 'AI-02',
      institution: 'Sathyabama University',
      leaderName: 'Gamma Leader',
      leaderEmail: `gamma.leader+${stamp}@other.org`,
      leaderPhone: `94${stamp}`,
      members: [
        {
          name: 'Priya Clone',
          phone: alphaPayload.members[0].phone // REUSED MEMBER PHONE
        }
      ]
    });
    const teamGamma = regGamma.team;
    assert((teamGamma.suspicion_flags?.length || 0) > 0, 'Cross-team member overlap registered WITH suspicion flags');
    assert(!!teamGamma.suspicion_flags && teamGamma.suspicion_flags.length > 0, 'Suspicion details tagged: ' + teamGamma.suspicion_flags?.[0]?.description);

    // 4. Authenticate Team via Portal Credentials
    console.log('\n--- TEST STEP 4: Team Authentication & Lookup ---');
    const authResult = await serverStore.authenticateTeam(teamAlpha.registration_id, teamAlpha.access_token);
    assert(authResult !== null && authResult?.id === teamAlpha.id, 'Authenticated successfully with Team ID + Passcode');

    // 5. Admin Payment Verification
    console.log('\n--- TEST STEP 5: Admin Payment Verification ---');
    const verifyResult = await serverStore.updatePaymentVerification(
      teamAlpha.id,
      'VERIFY',
      'Finance Jury',
      'Bank statement confirmed by accounts team'
    );
    assert(verifyResult.success && verifyResult.team !== null, 'Payment verification reported success with a team record');
    assert(verifyResult.team?.payment_status === 'VERIFIED', 'Payment status updated to VERIFIED');
    assert(verifyResult.team?.round_1_status === 'SUBMISSION_OPEN', 'Round 1 status automatically unlocked to SUBMISSION_OPEN');

    // 6. Round 1 Native Submission Upload
    console.log('\n--- TEST STEP 6: PPT / PDF Submission Upload ---');
    const submissionResult = await serverStore.submitRound1File(teamAlpha.id, {
      originalFilename: 'orion_cybernovas_alpha_presentation.pptx',
      fileUrl: '/uploads/submissions/sample_alpha.pptx',
      fileSize: 2450000,
      fileType: 'application/vnd.openxmlformats-officedocument.presentationml.presentation'
    });
    assert(submissionResult.success === true, 'Submission succeeded');
    assert(submissionResult.submission?.version === 1, 'Submission recorded as version 1');
    const teamAfterSub = await serverStore.getTeam(teamAlpha.id);
    assert(teamAfterSub?.round_1_status === 'SUBMITTED', 'Team status transitioned to SUBMITTED');

    // 7. Admin Evaluation & Round 2 Unlock
    console.log('\n--- TEST STEP 7: Admin Jury Evaluation & Round 2 Unlock ---');
    const evalResult = await serverStore.evaluateRound1(
      teamAlpha.id,
      'SELECT',
      'Chief Jury Member',
      94,
      'Outstanding architecture, high impact, ready for Grand Finale.'
    );
    assert(evalResult.team.round_1_status === 'SELECTED', 'Round 1 status updated to SELECTED');
    assert(evalResult.team.round_2_status === 'ACCESS_GRANTED', 'Round 2 status automatically unlocked to ACCESS_GRANTED');
    assert(evalResult.team.round_1_score === 94, 'Evaluation score recorded accurately: 94/100');

    // 8. Final Team Portal State Verification
    console.log('\n--- TEST STEP 8: Final Team Portal View Verification ---');
    const finalTeam = await serverStore.getTeam(teamAlpha.id);
    assert(finalTeam?.round_2_status === 'ACCESS_GRANTED', 'Portal confirms Round 2 Finale briefing accessible');
    assert(finalTeam?.submissions?.length === 1, 'Portal displays submitted artifact');

    // 9. Telemetry & Metrics Verification
    console.log('\n--- TEST STEP 9: Telemetry & Audit Trail Verification ---');
    const overview = await serverStore.getAdminOverview();
    assert(overview.stats.totalRegistrations >= 2, 'Telemetry tracks total registrations: ' + overview.stats.totalRegistrations);
    assert(overview.stats.round1Selected >= 1, 'Telemetry tracks selected finalists: ' + overview.stats.round1Selected);
    assert(overview.stats.paymentVerified >= 1, 'Telemetry tracks verified payments: ' + overview.stats.paymentVerified);

    console.log(`\n=== VERIFICATION COMPLETE: ${passedCount} / ${totalCount} TESTS PASSED ===\n`);
  } catch (err) {
    console.error('CRITICAL UNEXPECTED ERROR IN VERIFICATION:', err);
  }
}

runE2ETests();
