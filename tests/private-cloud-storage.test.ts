import { beforeEach, expect, it, vi } from 'vitest';
const mocks = vi.hoisted(() => ({ getBucket: vi.fn(), upload: vi.fn(), remove: vi.fn() }));
vi.mock('@/lib/supabase', () => ({ isSupabaseConfigured: () => true, supabase: { storage: { getBucket: mocks.getBucket, from: () => ({ upload: mocks.upload, remove: mocks.remove }) } } }));
import { storePrivateFile, deletePrivateFile } from '../src/lib/privateFiles';
beforeEach(() => {
  vi.clearAllMocks();
  mocks.getBucket.mockResolvedValue({ data: { public: false } });
  mocks.upload.mockResolvedValue({ error: null });
  mocks.remove.mockResolvedValue({ error: null });
});
it('rejects public buckets before writing any data', async () => {
  mocks.getBucket.mockResolvedValue({ data: { public: true } });
  await expect(storePrivateFile('payments', '.png', Buffer.from('test'), 'image/png')).rejects.toThrow('unavailable');
  expect(mocks.upload).not.toHaveBeenCalled();
});
it('uses unique non-upserted private objects and removes that exact object', async () => {
  const ref = await storePrivateFile('payments', '.png', Buffer.from('test'), 'image/png');
  expect(ref).toMatch(/^sb:\/\/payments\/[a-f0-9-]+\.png$/);
  expect(mocks.upload.mock.calls[0][2]).toEqual({ contentType: 'image/png', upsert: false });
  await deletePrivateFile(ref);
  expect(mocks.remove).toHaveBeenCalledWith([ref.split('/').at(-1)]);
});
it('does not silently fall back to public files if cloud storage fails', async () => {
  mocks.upload.mockResolvedValue({ error: { message: 'unavailable' } });
  await expect(storePrivateFile('payments', '.png', Buffer.from('test'), 'image/png')).rejects.toThrow('private storage');
});
