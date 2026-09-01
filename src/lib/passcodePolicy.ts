// ==============================================================================
// Team portal passcode rules — shared by the server and the reset UI
// ==============================================================================
//
// This module is deliberately dependency-free (no fs, no supabase) so the
// browser can import it and apply exactly the same rules the API enforces.
// Duplicating these checks in the page by hand is how the two drift apart and
// a participant gets rejected by the server for something the form accepted.
//
// NOTE ON CASE: portal logins compare with `safeEqualCI`, which lowercases both
// sides. Passcodes are therefore CASE-INSENSITIVE — mixing case adds no
// entropy and no security. Length is what counts, which is why the minimum
// here is the one rule worth being strict about.

export const PASSCODE_MIN_LENGTH = 8;
export const PASSCODE_MAX_LENGTH = 64;

/** How long an emailed reset link stays usable. */
export const RESET_TOKEN_TTL_MINUTES = 30;

export interface PasscodeCheck {
  ok: boolean;
  error?: string;
}

/**
 * Validate a participant-chosen passcode.
 *
 * Printable ASCII only. A passcode gets dictated over a call, copied out of an
 * email and retyped on a phone at a venue with poor signal; a smart quote or a
 * non-breaking space pasted in from a chat app produces a login failure that
 * neither the participant nor the organiser can see on screen.
 */
export function validateNewPasscode(value: string): PasscodeCheck {
  const raw = typeof value === 'string' ? value : '';
  const trimmed = raw.trim();

  if (!trimmed) {
    return { ok: false, error: 'Choose a new passcode.' };
  }
  if (trimmed.length < PASSCODE_MIN_LENGTH) {
    return { ok: false, error: `Passcode must be at least ${PASSCODE_MIN_LENGTH} characters.` };
  }
  if (trimmed.length > PASSCODE_MAX_LENGTH) {
    return { ok: false, error: `Passcode must be ${PASSCODE_MAX_LENGTH} characters or fewer.` };
  }
  if (!/^[\x20-\x7E]+$/.test(trimmed)) {
    return {
      ok: false,
      error: 'Use only standard letters, numbers and punctuation — no emoji, accents or smart quotes.'
    };
  }
  return { ok: true };
}

/**
 * The value actually stored. Login trims before comparing, so a passcode with
 * edge whitespace would be unusable as typed — normalise it away at the source
 * rather than storing something that can never match.
 */
export function normalisePasscode(value: string): string {
  return (typeof value === 'string' ? value : '').trim();
}
