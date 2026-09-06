import { supabase, isSupabaseConfigured } from './supabase';
import type { SubmissionRecord, TeamRecord } from '@/types/orion';

// ==============================================================================
// Submission storage — server only
// ==============================================================================
//
// Decks used to be written to a public Supabase Storage bucket and the
// permanent public URL stored in submissions.file_url. That URL needs no
// credential, never expires, and is guessable in structure
// (/storage/v1/object/public/submissions/round_1/<REG_ID>_Round1_<ms>.pptx) —
// the registration ID is printed on the participant's own confirmation page and
// the timestamp is a 13-digit millisecond value. Anyone who obtained or brute
// forced one URL could read a team's unpublished project, and a leaked link
// (mail forward, browser history, a screenshot of the admin console) stayed
// valid forever.
//
// The bucket is now private (migration 003). file_url holds an internal
// reference instead, and a short-lived signed URL is minted at read time for
// callers who have already passed authorisation in the API route.

export const SUBMISSIONS_BUCKET = 'submissions';
const REF_PREFIX = 'sb://';

/** Signed links live one hour: long enough to open and review a deck. */
export const SIGNED_URL_TTL_SECONDS = 60 * 60;

/** The value persisted in submissions.file_url for a cloud-stored deck. */
export function buildStorageRef(bucket: string, objectPath: string): string {
  return `${REF_PREFIX}${bucket}/${objectPath}`;
}

/**
 * Resolves a stored file_url to {bucket, path}, or null when it is not a
 * storage object (a local /uploads/... path, or an empty value).
 *
 * Legacy rows hold the full public URL, so those are recognised too — they
 * point at the same objects, which are no longer public.
 */
export function parseStorageRef(fileUrl: string): { bucket: string; path: string } | null {
  const value = (fileUrl || '').trim();
  if (!value) return null;

  if (value.startsWith(REF_PREFIX)) {
    const rest = value.slice(REF_PREFIX.length);
    const slash = rest.indexOf('/');
    if (slash <= 0 || slash === rest.length - 1) return null;
    return { bucket: rest.slice(0, slash), path: rest.slice(slash + 1) };
  }

  const publicMarker = '/storage/v1/object/public/';
  const idx = value.indexOf(publicMarker);
  if (idx >= 0) {
    const rest = value.slice(idx + publicMarker.length).split('?')[0];
    const slash = rest.indexOf('/');
    if (slash <= 0 || slash === rest.length - 1) return null;
    return { bucket: rest.slice(0, slash), path: decodeURIComponent(rest.slice(slash + 1)) };
  }

  return null;
}

/**
 * Mints signed URLs for a batch of stored file_url values.
 * Returns a map keyed by the original value; entries that are not storage
 * objects are passed through unchanged.
 */
export async function resolveFileUrls(fileUrls: string[]): Promise<Map<string, string>> {
  const resolved = new Map<string, string>();
  const pathToOriginals = new Map<string, string[]>();

  for (const original of fileUrls) {
    if (resolved.has(original) || pathToOriginals.has(original)) continue;
    const ref = parseStorageRef(original);
    if (!ref || ref.bucket !== SUBMISSIONS_BUCKET) {
      // Local upload path or an unrecognised value — leave it as-is.
      resolved.set(original, original);
      continue;
    }
    const list = pathToOriginals.get(ref.path) || [];
    list.push(original);
    pathToOriginals.set(ref.path, list);
  }

  const paths = [...pathToOriginals.keys()];
  if (!paths.length || !isSupabaseConfigured() || !supabase) {
    // Storage unreachable: hand back an empty link rather than a stale public
    // URL, so the UI shows "unavailable" instead of a silent 400 from the CDN.
    for (const originals of pathToOriginals.values()) {
      for (const original of originals) resolved.set(original, '');
    }
    return resolved;
  }

  try {
    const { data, error } = await supabase.storage
      .from(SUBMISSIONS_BUCKET)
      .createSignedUrls(paths, SIGNED_URL_TTL_SECONDS);

    if (error) throw error;

    const signedByPath = new Map<string, string>();
    for (const entry of data || []) {
      // The API echoes the path it was given; normalise the leading slash it
      // sometimes adds.
      const key = (entry.path || '').replace(/^\/+/, '');
      if (entry.signedUrl && !entry.error) signedByPath.set(key, entry.signedUrl);
    }

    for (const [path, originals] of pathToOriginals) {
      const signed = signedByPath.get(path) || '';
      for (const original of originals) resolved.set(original, signed);
    }
  } catch (err) {
    console.error('[Storage] Failed to sign submission URLs:', err);
    for (const originals of pathToOriginals.values()) {
      for (const original of originals) resolved.set(original, '');
    }
  }

  return resolved;
}

/** Convenience wrapper for a single value. */
export async function resolveFileUrl(fileUrl: string): Promise<string> {
  const map = await resolveFileUrls([fileUrl]);
  return map.get(fileUrl) ?? '';
}

export async function withSignedSubmissionUrls<T extends SubmissionRecord>(submissions: T[]): Promise<T[]> {
  if (!submissions?.length) return submissions || [];
  const map = await resolveFileUrls(submissions.map(s => s.file_url || ''));
  return submissions.map(s => ({ ...s, file_url: map.get(s.file_url || '') ?? '' }));
}

/**
 * Signs every submission across a set of teams in one round trip, so the admin
 * overview does not fan out one request per team.
 */
export async function withSignedTeamUrls<T extends TeamRecord>(teams: T[]): Promise<T[]> {
  if (!teams?.length) return teams || [];
  const all = teams.flatMap(t => (t.submissions || []).map(s => s.file_url || ''));
  if (!all.length) return teams;

  const map = await resolveFileUrls(all);
  return teams.map(t => ({
    ...t,
    submissions: (t.submissions || []).map(s => ({ ...s, file_url: map.get(s.file_url || '') ?? '' }))
  }));
}
