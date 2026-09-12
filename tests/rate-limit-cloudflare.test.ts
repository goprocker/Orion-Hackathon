import { afterEach, beforeEach, describe, expect, it, vi } from 'vitest';

beforeEach(() => {
  vi.resetModules();
});

afterEach(() => {
  vi.useRealTimers();
  vi.unstubAllGlobals();
});

describe('getClientIp platform headers', () => {
  it('prefers Cloudflare connecting IP over proxy fallbacks', async () => {
    const { getClientIp } = await import('@/lib/rateLimit');
    const request = new Request('https://orion.test/api/chatbot', {
      headers: {
        'cf-connecting-ip': '203.0.113.10',
        'x-vercel-forwarded-for': '198.51.100.20',
        'x-forwarded-for': '192.0.2.30',
      },
    });

    expect(getClientIp(request)).toBe('203.0.113.10');
  });

  it('preserves the Vercel header fallback', async () => {
    const { getClientIp } = await import('@/lib/rateLimit');
    const request = new Request('https://orion.test/api/chatbot', {
      headers: { 'x-vercel-forwarded-for': '198.51.100.20' },
    });

    expect(getClientIp(request)).toBe('198.51.100.20');
  });
});

describe('checkRateLimit', () => {
  it('starts a fresh window after the previous record expires', async () => {
    vi.useFakeTimers();
    vi.setSystemTime(new Date('2026-09-12T00:00:00Z'));
    const { checkRateLimit } = await import('@/lib/rateLimit');

    expect(checkRateLimit('expiration-test', 1, 1_000).allowed).toBe(true);
    expect(checkRateLimit('expiration-test', 1, 1_000).allowed).toBe(false);

    vi.advanceTimersByTime(1_001);

    expect(checkRateLimit('expiration-test', 1, 1_000).allowed).toBe(true);
  });

  it('does not require a timer when the module is imported', async () => {
    const setIntervalSpy = vi.fn(() => {
      throw new Error('Cloudflare forbids timers in global scope');
    });
    vi.stubGlobal('setInterval', setIntervalSpy);

    await expect(import('@/lib/rateLimit')).resolves.toBeDefined();
    expect(setIntervalSpy).not.toHaveBeenCalled();
  });
});
