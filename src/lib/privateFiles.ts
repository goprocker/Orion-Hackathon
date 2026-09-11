import crypto from 'node:crypto';
import fs from 'node:fs/promises';
import path from 'node:path';
import { supabase, isSupabaseConfigured } from './supabase';

const ROOT = path.join(process.cwd(), '.data', 'private-uploads');
const BUCKETS = new Set(['submissions', 'payments']);
export const FILE_LINK_TTL_SECONDS = 300;

export function isServerlessRuntime(): boolean {
  return Boolean(process.env.VERCEL || process.env.AWS_LAMBDA_FUNCTION_NAME || process.env.NETLIFY || process.env.K_SERVICE);
}

export function parseLocalRef(ref: string): { bucket: string; name: string; legacy: boolean } | null {
  const match = /^(local:\/\/|\/uploads\/)(submissions|payments)\/([a-zA-Z0-9_.-]+)$/.exec(ref);
  if (!match || match[3] === '.' || match[3] === '..') return null;
  return { bucket: match[2], name: match[3], legacy: match[1] === '/uploads/' };
}

async function signingKey(): Promise<Buffer> {
  const configured = process.env.FILE_SIGNING_SECRET || process.env.ADMIN_SECRET_KEY;
  if (configured && configured.length >= 32) return Buffer.from(configured);
  if (isServerlessRuntime()) throw new Error('FILE_SIGNING_SECRET must contain at least 32 characters');
  await fs.mkdir(ROOT, { recursive: true });
  const keyPath = path.join(ROOT, '.signing-key');
  try { await fs.writeFile(keyPath, crypto.randomBytes(32), { flag: 'wx', mode: 0o600 }); }
  catch (error) { if ((error as NodeJS.ErrnoException).code !== 'EEXIST') throw error; }
  return fs.readFile(keyPath);
}

export async function signLocalRef(ref: string, now = Date.now()): Promise<string> {
  if (!parseLocalRef(ref)) return '';
  const payload = Buffer.from(JSON.stringify({ ref, exp: Math.floor(now / 1000) + FILE_LINK_TTL_SECONDS })).toString('base64url');
  const mac = crypto.createHmac('sha256', await signingKey()).update(`private-file-v1:${payload}`).digest('hex');
  return `/api/private-files?token=${payload}.${mac}`;
}

export async function verifyLocalToken(token: string, now = Date.now()): Promise<string | null> {
  if (token.length > 2048) return null;
  const [payload, mac, extra] = token.split('.');
  if (extra || !payload || !/^[a-f0-9]{64}$/.test(mac || '')) return null;
  const expected = crypto.createHmac('sha256', await signingKey()).update(`private-file-v1:${payload}`).digest();
  if (!crypto.timingSafeEqual(expected, Buffer.from(mac, 'hex'))) return null;
  try {
    const data = JSON.parse(Buffer.from(payload, 'base64url').toString());
    if (!Number.isInteger(data.exp) || data.exp <= Math.floor(now / 1000) || typeof data.ref !== 'string' || !parseLocalRef(data.ref)) return null;
    return data.ref;
  } catch { return null; }
}

export async function readLocalFile(ref: string): Promise<{ bytes: Buffer; name: string }> {
  const parsed = parseLocalRef(ref);
  if (!parsed) throw new Error('Invalid file reference');
  const root = parsed.legacy ? path.join(process.cwd(), 'public', 'uploads') : ROOT;
  const file = path.join(root, parsed.bucket, parsed.name);
  const [realRoot, realFile] = await Promise.all([fs.realpath(root), fs.realpath(file)]);
  if (!realFile.startsWith(realRoot + path.sep)) throw new Error('File outside private storage');
  return { bytes: await fs.readFile(realFile), name: parsed.name };
}

/** Unique names and no upserts make rollback safe under concurrent requests. */
export async function storePrivateFile(bucket: string, extension: string, bytes: Buffer, contentType: string): Promise<string> {
  if (!BUCKETS.has(bucket) || !/^\.[a-z0-9]+$/.test(extension)) throw new Error('Invalid storage target');
  const name = `${crypto.randomUUID()}${extension}`;
  if (isSupabaseConfigured() && supabase) {
    // Fail closed if an operator accidentally makes the bucket public.
    const { data: metadata, error: metadataError } = await supabase.storage.getBucket(bucket);
    if (metadataError || !metadata || metadata.public) throw new Error('Private upload storage is unavailable');
    const { error } = await supabase.storage.from(bucket).upload(name, bytes, { contentType, upsert: false });
    if (error) throw new Error('Could not save file to private storage');
    return `sb://${bucket}/${name}`;
  }
  if (isServerlessRuntime()) throw new Error('Private upload storage is not configured');
  const directory = path.join(ROOT, bucket);
  await fs.mkdir(directory, { recursive: true });
  await fs.writeFile(path.join(directory, name), bytes, { flag: 'wx', mode: 0o600 });
  return `local://${bucket}/${name}`;
}

/** Only call for a new object allocated by the current request. */
export async function deletePrivateFile(ref: string): Promise<void> {
  const local = parseLocalRef(ref);
  if (local && !local.legacy) {
    await fs.unlink(path.join(ROOT, local.bucket, local.name));
    return;
  }
  const cloud = /^sb:\/\/(payments|submissions)\/([a-f0-9-]+\.[a-z0-9]+)$/.exec(ref);
  if (!cloud || !supabase) throw new Error('Invalid cleanup reference');
  const { error } = await supabase.storage.from(cloud[1]).remove([cloud[2]]);
  if (error) throw new Error('Could not remove uncommitted upload');
}
