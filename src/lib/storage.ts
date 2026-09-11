import { supabase, isSupabaseConfigured } from './supabase';
import { parseLocalRef, signLocalRef, FILE_LINK_TTL_SECONDS } from './privateFiles';
import type { SubmissionRecord, TeamRecord } from '@/types/orion';

export const SUBMISSIONS_BUCKET = 'submissions';
export const SIGNED_URL_TTL_SECONDS = FILE_LINK_TTL_SECONDS;
const BUCKETS = new Set(['submissions', 'payments']);
const signedUrlCache = new Map<string, { url: string; expiresAt: number }>();
const SIGNED_URL_CACHE_TTL_MS = Math.max(60, SIGNED_URL_TTL_SECONDS - 300) * 1000;

export function buildStorageRef(bucket: string, objectPath: string): string {
  return `sb://${bucket}/${objectPath}`;
}

export function parseStorageRef(fileUrl: string): { bucket: string; path: string } | null {
  const value = (fileUrl || '').trim();
  let rest = '';
  if (value.startsWith('sb://')) rest = value.slice(5);
  else {
    try {
      const url = new URL(value);
      const configured = process.env.SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL;
      if (!configured || url.origin !== new URL(configured).origin) return null;
      const marker = '/storage/v1/object/public/';
      if (!url.pathname.startsWith(marker)) return null;
      rest = decodeURIComponent(url.pathname.slice(marker.length));
    } catch { return null; }
  }
  const slash = rest.indexOf('/');
  if (slash < 1) return null;
  const bucket = rest.slice(0, slash), objectPath = rest.slice(slash + 1);
  if (!BUCKETS.has(bucket) || !objectPath || objectPath.split('/').some(s => !s || s === '.' || s === '..') || /[\\\x00-\x1f]/.test(objectPath)) return null;
  return { bucket, path: objectPath };
}

/** Only invoke after authorization. Unknown/external references fail closed. */
export async function resolveFileUrls(fileUrls: string[]): Promise<Map<string, string>> {
  const resolved = new Map<string, string>();
  const groups = new Map<string, Map<string, string[]>>();
  const now = Date.now();
  for (const original of new Set(fileUrls)) {
    resolved.set(original, '');
    if (parseLocalRef(original)) {
      try { resolved.set(original, await signLocalRef(original)); } catch { /* unavailable */ }
      continue;
    }
    const ref = parseStorageRef(original);
    if (!ref) continue;
    const cached = signedUrlCache.get(original);
    if (cached && cached.expiresAt > now) {
      resolved.set(original, cached.url);
      continue;
    }
    if (cached) signedUrlCache.delete(original);
    const group = groups.get(ref.bucket) || new Map<string, string[]>();
    group.set(ref.path, [...(group.get(ref.path) || []), original]);
    groups.set(ref.bucket, group);
  }
  if (!isSupabaseConfigured() || !supabase) return resolved;
  for (const [bucket, paths] of groups) {
    try {
      const { data, error } = await supabase.storage.from(bucket).createSignedUrls([...paths.keys()], SIGNED_URL_TTL_SECONDS, { download: true });
      if (error) throw error;
      for (const entry of data || []) {
        const key = (entry.path || '').replace(/^\/+/, '');
        if (entry.signedUrl && !entry.error) {
          for (const original of paths.get(key) || []) {
            resolved.set(original, entry.signedUrl);
            signedUrlCache.set(original, {
              url: entry.signedUrl,
              expiresAt: now + SIGNED_URL_CACHE_TTL_MS,
            });
          }
        }
      }
    } catch (error) { console.error('[Storage] Could not sign private files', error); }
  }
  return resolved;
}

export async function resolveFileUrl(fileUrl: string): Promise<string> {
  return (await resolveFileUrls([fileUrl])).get(fileUrl) || '';
}

export async function withSignedSubmissionUrls<T extends SubmissionRecord>(submissions: T[]): Promise<T[]> {
  const map = await resolveFileUrls((submissions || []).map(s => s.file_url || ''));
  return (submissions || []).map(s => ({ ...s, file_url: map.get(s.file_url || '') || '' }));
}

export async function withSignedTeamUrls<T extends TeamRecord>(teams: T[]): Promise<T[]> {
  const map = await resolveFileUrls(teams.flatMap(t => (t.submissions || []).map(s => s.file_url || '')));
  return teams.map(t => ({
    ...t,
    payment: t.payment ? { ...t.payment, screenshot_url: t.payment.screenshot_url ? `/api/admin/payment-proof?teamId=${encodeURIComponent(t.id)}` : undefined } : t.payment,
    submissions: (t.submissions || []).map(s => ({ ...s, file_url: map.get(s.file_url || '') || '' }))
  }));
}
