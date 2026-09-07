// ==============================================================================
// Team username — the identifier teams sign in with
// ==============================================================================
//
// A team's name is the one credential-adjacent thing every member can recall
// without digging through an inbox, so it is the login. Normalising away case,
// spaces and punctuation means "Tech Titans", "TECH TITANS" and "techtitans"
// are the same account, and there is nothing to get subtly wrong when typing it
// on a phone at 2am.
//
// This MUST stay identical to public.orion_username_slug in
// migrations/015_team_username.sql — the database generates the stored value
// and the app normalises what the user typed before comparing.

/** Lowercase, strip everything that is not a letter or digit. */
export function toUsername(value: string): string {
  return (value || '').toLowerCase().replace(/[^a-z0-9]/g, '');
}

/**
 * Pick the lowest free numeric suffix for a base slug.
 *
 * Team names are not unique — the live roster has three "Tech Titans" — so the
 * first registration keeps the bare slug and the rest become techtitans2,
 * techtitans3. Mirrors public.orion_username_claim; used by the local file
 * store, which has no triggers.
 */
export function claimUsername(base: string, taken: Iterable<string>): string {
  const used = new Set<string>();
  for (const t of taken) used.add(toUsername(t));

  if (!base) return base;
  if (!used.has(base)) return base;

  for (let n = 2; ; n += 1) {
    const candidate = `${base}${n}`;
    if (!used.has(candidate)) return candidate;
  }
}
