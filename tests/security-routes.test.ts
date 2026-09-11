import { beforeEach, describe, expect, it, vi } from 'vitest';

const mocks = vi.hoisted(() => ({
  getTeam: vi.fn(), getConfig: vi.fn(), submitPayment: vi.fn(), submitRound1File: vi.fn(),
  storePrivateFile: vi.fn(), deletePrivateFile: vi.fn(), storePaymentScreenshot: vi.fn()
}));
vi.mock('@/lib/serverStore', () => ({ serverStore: mocks, safeEqualCI: (a: string, b: string) => a.toLowerCase() === b.toLowerCase() }));
vi.mock('@/lib/rateLimit', () => ({ getClientIp: () => 'test', checkRateLimit: () => ({ allowed: true }) }));
vi.mock('@/lib/privateFiles', () => ({ storePrivateFile: mocks.storePrivateFile, deletePrivateFile: mocks.deletePrivateFile }));
vi.mock('@/lib/paymentProof', () => ({ storePaymentScreenshot: mocks.storePaymentScreenshot }));
vi.mock('@/lib/storage', () => ({ resolveFileUrl: async () => '/signed-file' }));
vi.mock('@/lib/features', () => ({ registrationApiGuard: () => null }));
import { POST as payment } from '../src/app/api/team/payment/route';
import { POST as submission } from '../src/app/api/team/submission/route';

const passcode = 'private-test-passcode';
const team = { id: 'team-test', registration_id: 'TEST-1', access_token: passcode, payment_status: 'VERIFIED', submissions: [], resubmission_requests: [] };
const config = { round1SubmissionDeadline: '2099-01-01', round1FeeInr: 100, maxFileSizeMb: 10, allowRound1Resubmission: true };
function paymentRequest(secret = passcode, upload = true) {
  const form = new FormData();
  for (const [key, value] of Object.entries({ teamId: team.id, accessToken: secret, utrNumber: 'ABC123456', payerName: 'Test', payerUpi: 'test@upi', teamNameInNote: 'true', screenshotUrl: 'javascript:alert(1)' })) form.set(key, value);
  if (upload) form.set('screenshot', new File(['image'], 'proof.png', { type: 'image/png' }));
  return new Request('http://localhost/api/team/payment', { method: 'POST', body: form });
}
function submissionRequest() {
  const form = new FormData();
  form.set('teamId', team.id); form.set('accessToken', passcode);
  form.set('file', new File(['%PDF-1.7\n%%EOF'], 'deck.pdf', { type: 'application/pdf' }));
  return new Request('http://localhost/api/team/submission', { method: 'POST', body: form });
}
beforeEach(() => {
  vi.clearAllMocks();
  mocks.getTeam.mockResolvedValue(team); mocks.getConfig.mockResolvedValue(config);
  mocks.storePrivateFile.mockResolvedValue('local://submissions/new.pdf');
  mocks.storePaymentScreenshot.mockResolvedValue({ url: 'local://payments/new.png' });
  mocks.deletePrivateFile.mockResolvedValue(undefined);
  mocks.submitRound1File.mockResolvedValue({ success: true });
  mocks.submitPayment.mockResolvedValue({ success: true });
});
describe('authenticated upload lifecycle', () => {
  it('does not store anonymous payment uploads', async () => {
    expect((await payment(paymentRequest(''))).status).toBe(401);
    expect(mocks.storePaymentScreenshot).not.toHaveBeenCalled();
  });
  it('does not store invalid-passcode payment uploads', async () => {
    expect((await payment(paymentRequest('incorrect-password'))).status).toBe(401);
    expect(mocks.storePaymentScreenshot).not.toHaveBeenCalled();
  });
  it('does not store uploads for nonexistent teams', async () => {
    mocks.getTeam.mockResolvedValue(null);
    expect((await payment(paymentRequest())).status).toBe(404);
    expect(mocks.storePaymentScreenshot).not.toHaveBeenCalled();
  });
  it('refuses caller-provided receipt URLs', async () => {
    expect((await payment(paymentRequest(passcode, false))).status).toBe(400);
    expect(mocks.submitPayment).not.toHaveBeenCalled();
  });
  it('removes receipts when persistence rejects', async () => {
    mocks.submitPayment.mockResolvedValue({ success: false });
    expect((await payment(paymentRequest())).status).toBe(400);
    expect(mocks.deletePrivateFile).toHaveBeenCalledWith('local://payments/new.png');
  });
  it('retains committed receipts', async () => {
    expect((await payment(paymentRequest())).status).toBe(200);
    expect(mocks.deletePrivateFile).not.toHaveBeenCalled();
  });
  it('retains evidence if an ancillary failure happens after the payment is saved', async () => {
    mocks.submitPayment.mockResolvedValue({ success: false, fileCommitted: true });
    expect((await payment(paymentRequest())).status).toBe(400);
    expect(mocks.deletePrivateFile).not.toHaveBeenCalled();
  });
  it('blocks unpaid teams before allocating a deck', async () => {
    mocks.getTeam.mockResolvedValue({ ...team, payment_status: 'NOT_SUBMITTED' });
    expect((await submission(submissionRequest())).status).toBe(403);
    expect(mocks.storePrivateFile).not.toHaveBeenCalled();
  });
  it('blocks unapproved replacements before allocating a deck', async () => {
    mocks.getTeam.mockResolvedValue({ ...team, submissions: [{ round_number: 1 }] });
    expect((await submission(submissionRequest())).status).toBe(403);
    expect(mocks.storePrivateFile).not.toHaveBeenCalled();
  });
  it('blocks expired or invalid deadlines before storage', async () => {
    mocks.getConfig.mockResolvedValue({ ...config, round1SubmissionDeadline: 'invalid' });
    expect((await submission(submissionRequest())).status).toBe(403);
    expect(mocks.storePrivateFile).not.toHaveBeenCalled();
  });
  it('cleans up when final authorization loses a race', async () => {
    mocks.submitRound1File.mockResolvedValue({ success: false, error: 'Approval already used' });
    expect((await submission(submissionRequest())).status).toBe(400);
    expect(mocks.deletePrivateFile).toHaveBeenCalledWith('local://submissions/new.pdf');
  });
  it('cleans up on a database exception', async () => {
    mocks.submitRound1File.mockRejectedValue(new Error('Database unavailable'));
    expect((await submission(submissionRequest())).status).toBe(500);
    expect(mocks.deletePrivateFile).toHaveBeenCalledOnce();
  });
  it('keeps a successfully recorded deck', async () => {
    expect((await submission(submissionRequest())).status).toBe(200);
    expect(mocks.deletePrivateFile).not.toHaveBeenCalled();
  });
  it('retains a saved deck after an ancillary update fails', async () => {
    mocks.submitRound1File.mockResolvedValue({ success: false, fileCommitted: true });
    expect((await submission(submissionRequest())).status).toBe(400);
    expect(mocks.deletePrivateFile).not.toHaveBeenCalled();
  });
});
