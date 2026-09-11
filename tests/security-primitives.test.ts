import { describe, expect, it } from 'vitest';
import { receiptContentType } from '../src/lib/paymentProof';
import { parseLocalRef, signLocalRef, verifyLocalToken } from '../src/lib/privateFiles';
import { parseStorageRef, resolveFileUrl } from '../src/lib/storage';
import { stageRoster, stageFile } from '../scripts/stage_roster.mjs';
import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';

describe('private downloads', () => {
  it('rejects traversal and outside paths', () => {
    for (const ref of ['local://payments/../secret', 'local://payments/..', 'local://payments/a\\b', '/etc/passwd', 'local://other/test.png']) expect(parseLocalRef(ref)).toBeNull();
  });
  it('requires an unmodified expiring capability', async () => {
    process.env.FILE_SIGNING_SECRET = 'test-only-private-signing-secret-1234567890';
    const url = await signLocalRef('local://payments/test.png', 1000000);
    const token = new URL(url, 'http://localhost').searchParams.get('token')!;
    expect(await verifyLocalToken(token, 1000001)).toBe('local://payments/test.png');
    expect(await verifyLocalToken(token, 1300000)).toBeNull();
    expect(await verifyLocalToken(token.replace('ey', 'ez'), 1000001)).toBeNull();
    expect(await verifyLocalToken('', 1000001)).toBeNull();
  });
  it('does not resolve external, script, inline HTML or foreign-bucket URLs', async () => {
    for (const ref of ['https://evil.test/file.png', 'javascript:alert(1)', 'data:text/html,test', 'sb://other/secrets', 'sb://payments/../secrets']) expect(await resolveFileUrl(ref)).toBe('');
    expect(parseStorageRef('https://evil.test/storage/v1/object/public/payments/a.png')).toBeNull();
  });
});
describe('receipt validation', () => {
  it('rejects spoofed images and active content', () => {
    expect(receiptContentType(Buffer.from('<html>bad</html>'), '.png')).toBeNull();
    expect(receiptContentType(Buffer.from('<svg></svg>'), '.svg')).toBeNull();
    expect(receiptContentType(Buffer.from('AVIF'), '.avif')).toBeNull();
  });
  it('accepts genuine permitted signatures', () => {
    expect(receiptContentType(Buffer.from('89504e470d0a1a0a', 'hex'), '.png')).toBe('image/png');
    expect(receiptContentType(Buffer.from('%PDF-1.7'), '.pdf')).toBe('application/pdf');
  });
});
describe('accounted private roster staging', () => {
  it('preserves repeated records, indexes, raw data and unknowns without credential updates', () => {
    const source = [{ registration_id: 'R1', team_name: ' Team ', access_token: 'unsafe' }, { registration_id: 'R1', team_name: ' Team ' }, null];
    const result = stageRoster(source, 'synthetic');
    expect(result.counts).toEqual({ source: 3, processed: 3, success: 0, partial: 2, failed: 1, unaccounted: 0 });
    expect(result.rows.map(row => row.sourceIndex)).toEqual([0, 1, 2]);
    expect(result.rows[0].raw).toEqual(source[0]);
    expect(result.rows[0].normalized).not.toHaveProperty('access_token');
    expect(result.rows[0].normalized.leader_email).toBeNull();
  });
  it('preserves malformed raw input before reporting a failed document', async () => {
    const temp = await fs.mkdtemp(path.join(os.tmpdir(), 'orion-roster-test-'));
    const input = path.join(temp, 'bad.json');
    await fs.writeFile(input, '{broken');
    const result = await stageFile(input, path.join(temp, 'runs'));
    expect(result.failed).toBe(1);
    expect(result.unaccounted).toBe(0);
    expect(await fs.readFile(path.join(result.run, 'source.raw'), 'utf8')).toBe('{broken');
    await fs.rm(temp, { recursive: true });
  });
});
