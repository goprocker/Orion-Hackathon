// Lightweight in-memory sliding-window rate limiter for Next.js API Routes

interface RateLimitRecord {
  count: number;
  resetTime: number;
}

// NOTE ON SCOPE: this is per-process, in-memory state. On Vercel each Lambda
// instance has its own Map and cold starts reset it, so these limits bound a
// single warm instance, not the deployment. They are a speed bump against
// casual abuse, NOT a defence against a determined distributed brute force.
// For that, move this to Upstash/@vercel/kv — the call sites need no change.
const ipMap = new Map<string, RateLimitRecord>();

// Hard cap so a flood of distinct keys cannot grow the heap without bound.
const MAX_TRACKED_KEYS = 10_000;

// Clean up stale IP records every 5 minutes.
//
// unref() so this timer never by itself keeps the Node event loop alive. It is
// a housekeeping sweep over an in-memory Map: there is nothing to finish and
// nothing to lose by exiting mid-cycle. Without it, any process that imports a
// route (a CLI check, a test script, a one-off migration) hangs forever after
// its work is done, with buffered stdout never flushed.
const cleanupTimer = typeof setInterval !== 'undefined'
  ? setInterval(() => {
      const now = Date.now();
      for (const [key, record] of ipMap.entries()) {
        if (record.resetTime <= now) {
          ipMap.delete(key);
        }
      }
    }, 5 * 60 * 1000)
  : null;

// Node exposes unref(); the browser/edge timer type does not.
if (cleanupTimer && typeof (cleanupTimer as { unref?: () => void }).unref === 'function') {
  (cleanupTimer as { unref: () => void }).unref();
}

export function checkRateLimit(
  identifier: string,
  limit: number = 10,
  windowMs: number = 60 * 1000
): { allowed: boolean; remaining: number; resetInSec: number } {
  const now = Date.now();
  const record = ipMap.get(identifier);

  if (!record || record.resetTime <= now) {
    // Evict expired entries before admitting a new key, and refuse to grow past
    // the cap rather than letting a spoofed-key flood exhaust memory.
    if (ipMap.size >= MAX_TRACKED_KEYS) {
      for (const [key, rec] of ipMap.entries()) {
        if (rec.resetTime <= now) ipMap.delete(key);
      }
      if (ipMap.size >= MAX_TRACKED_KEYS) {
        return { allowed: false, remaining: 0, resetInSec: Math.ceil(windowMs / 1000) };
      }
    }

    ipMap.set(identifier, {
      count: 1,
      resetTime: now + windowMs
    });
    return {
      allowed: true,
      remaining: limit - 1,
      resetInSec: Math.ceil(windowMs / 1000)
    };
  }

  if (record.count >= limit) {
    return {
      allowed: false,
      remaining: 0,
      resetInSec: Math.ceil((record.resetTime - now) / 1000)
    };
  }

  record.count += 1;
  return {
    allowed: true,
    remaining: limit - record.count,
    resetInSec: Math.ceil((record.resetTime - now) / 1000)
  };
}

/**
 * Best-effort client IP for rate limiting.
 *
 * `X-Forwarded-For` is a client-appendable list: the LEFTMOST entry is whatever
 * the caller chose to send. Reading it meant an attacker got a fresh rate-limit
 * budget per request just by varying a header, which made every limit here
 * decorative. Prefer headers the platform sets and cannot be spoofed past, and
 * fall back to the RIGHTMOST XFF entry (the hop appended by the closest proxy).
 */
export function getClientIp(request: Request): string {
  // Set by Vercel's edge and not overridable by the client.
  const vercelIp = request.headers.get('x-vercel-forwarded-for');
  if (vercelIp) return vercelIp.split(',').pop()!.trim();

  const realIp = request.headers.get('x-real-ip');
  if (realIp) return realIp.trim();

  const forwarded = request.headers.get('x-forwarded-for');
  if (forwarded) {
    const parts = forwarded.split(',').map(p => p.trim()).filter(Boolean);
    if (parts.length > 0) return parts[parts.length - 1];
  }

  return '127.0.0.1';
}
