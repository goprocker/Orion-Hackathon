import type { TeamRecord, SystemConfig } from '@/types/orion';

/** Checked before allocating storage and again before committing the record. */
export function submissionEligibilityError(team: TeamRecord, config: SystemConfig, now = Date.now()): string | null {
  if (team.payment_status !== 'VERIFIED') return 'Payment must be verified by organizers before Round 1 submission.';
  const deadline = new Date(config.round1SubmissionDeadline).getTime();
  if (!Number.isFinite(deadline) || now > deadline) return 'Round 1 submission deadline has passed or is unavailable. Submissions are locked.';
  if (!(team.submissions || []).some(s => s.round_number === 1)) return null;
  if (!config.allowRound1Resubmission) return 'Organizers have closed Round 1 re-uploads entirely.';
  if (!(team.resubmission_requests || []).some(r => r.round_number === 1 && r.status === 'APPROVED')) {
    return 'Your presentation is already submitted. Request organiser approval before uploading a replacement.';
  }
  return null;
}
