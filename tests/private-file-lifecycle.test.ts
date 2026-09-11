import { afterEach, describe, expect, it, vi } from 'vitest';
import fs from 'node:fs/promises';
import path from 'node:path';

vi.mock('@/lib/supabase', () => ({ supabase: null, isSupabaseConfigured: () => false }));
vi.mock('@/lib/features', () => ({ registrationApiGuard: () => null }));
import { storePrivateFile, deletePrivateFile, signLocalRef } from '../src/lib/privateFiles';
import { GET } from '../src/app/api/private-files/route';

const allocated: string[] = [];
afterEach(async () => {
  for (const ref of allocated.splice(0)) await deletePrivateFile(ref).catch(() => {});
  vi.unstubAllEnvs();
});

describe('private local storage and download handler', () => {
  it('stores outside public, serves only a signed capability, and removes cleanly', async () => {
    vi.stubEnv('VERCEL', '');
    vi.stubEnv('FILE_SIGNING_SECRET', 'test-only-download-signing-secret-1234567890');
    const ref = await storePrivateFile('submissions', '.pdf', Buffer.from('%PDF-private-test'), 'application/pdf');
    allocated.push(ref);
    expect(ref).toMatch(/^local:\/\/submissions\/[a-f0-9-]+\.pdf$/);
    const name = ref.split('/').at(-1)!;
    await expect(fs.stat(path.join('public', 'uploads', 'submissions', name))).rejects.toThrow();
    const signed = await signLocalRef(ref);
    const response = await GET(new Request(`http://localhost${signed}`));
    expect(response.status).toBe(200);
    expect(response.headers.get('content-disposition')).toContain('attachment');
    expect(response.headers.get('cache-control')).toContain('no-store');
    expect(await response.text()).toBe('%PDF-private-test');
    expect((await GET(new Request('http://localhost/api/private-files'))).status).toBe(404);
    expect((await GET(new Request(`http://localhost${signed}tampered`))).status).toBe(404);
    await deletePrivateFile(ref);
    allocated.pop();
    expect((await GET(new Request(`http://localhost${signed}`))).status).toBe(404);
  });
  it('does not pretend serverless ephemeral files are durable', async () => {
    vi.stubEnv('VERCEL', '1');
    await expect(storePrivateFile('payments', '.png', Buffer.from('test'), 'image/png')).rejects.toThrow('not configured');
  });
});
