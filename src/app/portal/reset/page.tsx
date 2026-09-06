'use client';

import React, { useState, useEffect, useRef } from 'react';
import Link from 'next/link';
import {
  KeyRound,
  ShieldCheck,
  AlertTriangle,
  CheckCircle2,
  Eye,
  EyeOff,
  ArrowLeft,
  Loader2
} from 'lucide-react';
import { GlassCard } from '@/components/common/GlassCard';
import {
  validateNewPasscode,
  PASSCODE_MIN_LENGTH,
  PASSCODE_MAX_LENGTH,
  RESET_TOKEN_TTL_MINUTES
} from '@/lib/passcodePolicy';
import { sound } from '@/audio/soundEffects';

// ==============================================================================
// /portal/reset?token=... — set a new passcode from an emailed link
// ==============================================================================
//
// ON THE TOKEN STAYING IN THE URL
//
// The sign-in page strips `?token=` from the address bar the moment it is used,
// because that token was the team's PERMANENT passcode and a bookmark or a
// screenshot of the URL would leak it for the rest of the event. This one is
// different: it is single use and dies in RESET_TOKEN_TTL_MINUTES, and stripping
// it would break refresh and the back button on the one page where a
// participant is most likely to fumble and reload. Every mainstream reset flow
// makes the same trade.
//
// Be honest about what that costs: this page's URL, token and all, is written
// to the hosting platform's access log like any other request, and it sits in
// the participant's browser history. `Referrer-Policy:
// strict-origin-when-cross-origin` (next.config.ts) keeps it out of cross-origin
// referers, and the API calls below keep it out of a query string a second
// time — but the page load itself is unavoidable for an emailed link. The
// containment is that the token is single use, short lived, and stored only as
// a hash, so a log line recovered later is worth nothing.

type ProbeState = 'LOADING' | 'VALID' | 'INVALID' | 'EXPIRED' | 'USED' | 'MISSING';

const DEAD_LINK_COPY: Record<string, { title: string; detail: string }> = {
  MISSING: {
    title: 'No reset link found',
    detail: 'Open the reset link from your email, or request a fresh one from the sign-in page.'
  },
  INVALID: {
    title: 'This reset link is not valid',
    detail: 'It may have been copied incompletely. Request a fresh link from the sign-in page.'
  },
  EXPIRED: {
    title: 'This reset link has expired',
    detail: `Reset links last ${RESET_TOKEN_TTL_MINUTES} minutes. Request a fresh one from the sign-in page.`
  },
  USED: {
    title: 'This reset link has already been used',
    detail: 'Each link works once. If you still cannot sign in, request a fresh one from the sign-in page.'
  }
};

export default function PasscodeResetPage() {
  // Read from window rather than useSearchParams: it matches how /portal reads
  // its query string, and it keeps this page out of a Suspense boundary.
  //
  // The token lives in a ref, not state. Nothing renders it, so making it state
  // would only add a render pass — and reading it during the effect would then
  // be a synchronous setState in an effect body, which is the cascading-render
  // pattern the lint rule exists to catch.
  const tokenRef = useRef('');
  const [probe, setProbe] = useState<ProbeState>('LOADING');
  const [teamName, setTeamName] = useState('');
  const [registrationId, setRegistrationId] = useState('');

  const [passcode, setPasscode] = useState('');
  const [confirmPasscode, setConfirmPasscode] = useState('');
  const [showPasscode, setShowPasscode] = useState(false);

  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState('');
  const [isDone, setIsDone] = useState(false);

  useEffect(() => {
    if (typeof window === 'undefined') return;

    let cancelled = false;
    const raw = (new URLSearchParams(window.location.search).get('token') || '').trim();
    tokenRef.current = raw;

    (async () => {
      if (!raw) {
        if (!cancelled) setProbe('MISSING');
        return;
      }
      try {
        // POST, not GET: keeps the token out of a URL the framework and the
        // hosting platform both log. See the route's own comment.
        const res = await fetch('/api/auth/team/reset/verify', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ token: raw })
        });
        const data = await res.json();
        if (cancelled) return;
        if (data?.valid) {
          setTeamName(data.teamName || '');
          setRegistrationId(data.registrationId || '');
          setProbe('VALID');
        } else {
          setProbe((data?.reason as ProbeState) || 'INVALID');
        }
      } catch {
        if (!cancelled) setProbe('INVALID');
      }
    })();

    return () => { cancelled = true; };
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    sound.playClick();
    setError('');

    // Same rules the API enforces, from the same module — so the form cannot
    // accept something the server is about to reject.
    const check = validateNewPasscode(passcode);
    if (!check.ok) {
      setError(check.error || 'That passcode cannot be used.');
      return;
    }
    if (passcode.trim() !== confirmPasscode.trim()) {
      setError('The two passcodes do not match.');
      return;
    }

    setIsSubmitting(true);
    try {
      const res = await fetch('/api/auth/team/reset', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ token: tokenRef.current, passcode })
      });
      const data = await res.json();

      if (res.ok && data.success) {
        setRegistrationId(data.registrationId || registrationId);
        setIsDone(true);
      } else {
        setError(data.error || 'Could not reset the passcode. Request a fresh link.');
      }
    } catch {
      setError('Connection error while resetting the passcode.');
    } finally {
      setIsSubmitting(false);
    }
  };

  const signInHref = registrationId
    ? `/portal?teamId=${encodeURIComponent(registrationId)}`
    : '/portal';

  return (
    <div className="min-h-screen bg-[#020617] text-white">
      <header className="relative z-10 border-b border-white/10 bg-[#040E24]/80">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 py-4 flex items-center justify-between">
          <div className="flex items-center gap-2">
            <ShieldCheck className="w-5 h-5 text-[#38BDF8]" />
            <span className="font-display font-black tracking-wider text-sm">
              ORION <span className="text-[#22D3EE]">1.0</span>
            </span>
          </div>
          <Link
            href="/portal"
            className="px-3.5 py-1.5 border border-white/15 text-slate-300 hover:text-white font-mono-hud text-xs flex items-center gap-1.5 transition-colors"
          >
            <ArrowLeft className="w-3.5 h-3.5" />
            <span>BACK TO SIGN IN</span>
          </Link>
        </div>
      </header>

      <main className="relative z-10 max-w-md mx-auto px-4 sm:px-6 pt-12 pb-20">
        <GlassCard
          glowColor="cyan"
          className="p-6 sm:p-8 border border-[#38BDF8]/40 bg-[#07193D] shadow-[0_20px_60px_rgba(2,8,24,0.9)] rounded-none text-left"
          withHudCorners={true}
        >
          <div className="flex items-center gap-3 pb-4 mb-6 border-b border-white/10">
            <div className="p-2.5 bg-[#0B2556] border border-[#38BDF8]/40 text-[#38BDF8]">
              <KeyRound className="w-5 h-5" />
            </div>
            <div>
              <div className="text-[10px] font-mono-hud text-[#38BDF8] font-bold uppercase tracking-wider">
                ONE-TIME RESET LINK
              </div>
              <h1 className="text-xl font-display font-black text-white">SET A NEW PASSCODE</h1>
            </div>
          </div>

          {probe === 'LOADING' && (
            <div className="flex items-center gap-2 text-xs font-mono text-slate-300 py-6">
              <Loader2 className="w-4 h-4 animate-spin text-[#38BDF8]" />
              <span>Checking your reset link...</span>
            </div>
          )}

          {probe !== 'LOADING' && probe !== 'VALID' && (
            <div className="space-y-4">
              <div className="p-3 bg-rose-950/60 border border-rose-500/50 text-rose-200 text-xs font-mono flex items-start gap-2">
                <AlertTriangle className="w-4 h-4 text-rose-400 shrink-0 mt-0.5" />
                <div>
                  <div className="font-bold">{DEAD_LINK_COPY[probe]?.title}</div>
                  <div className="mt-1 text-rose-200/80">{DEAD_LINK_COPY[probe]?.detail}</div>
                </div>
              </div>
              <Link
                href="/portal"
                className="btn-glow-cyan w-full py-3 font-display font-black text-xs text-[#040E24] bg-gradient-to-r from-[#FFFFFF] via-[#BAE6FD] to-[#38BDF8] flex items-center justify-center gap-2 cursor-pointer active:scale-95"
              >
                REQUEST A NEW LINK
              </Link>
            </div>
          )}

          {probe === 'VALID' && isDone && (
            <div className="space-y-4">
              <div className="p-3 bg-emerald-950/50 border border-emerald-500/50 text-emerald-200 text-xs font-mono flex items-start gap-2">
                <CheckCircle2 className="w-4 h-4 text-emerald-400 shrink-0 mt-0.5" />
                <div>
                  <div className="font-bold">Passcode updated</div>
                  <div className="mt-1 text-emerald-200/80">
                    Sign in with your Team ID and the passcode you just chose. Your old
                    passcode and this reset link no longer work.
                  </div>
                </div>
              </div>
              <Link
                href={signInHref}
                className="btn-glow-cyan w-full py-3 font-display font-black text-xs text-[#040E24] bg-gradient-to-r from-[#FFFFFF] via-[#BAE6FD] to-[#38BDF8] flex items-center justify-center gap-2 cursor-pointer active:scale-95"
              >
                GO TO SIGN IN
              </Link>
            </div>
          )}

          {probe === 'VALID' && !isDone && (
            <>
              <div className="mb-5 p-3 bg-[#040E24] border border-[#38BDF8]/25">
                <div className="text-[10px] font-mono-hud text-[#BAE6FD] uppercase tracking-wider">
                  Resetting the passcode for
                </div>
                <div className="mt-1 font-display font-black text-white text-sm">{teamName}</div>
                <div className="text-[11px] font-mono text-[#38BDF8]">{registrationId}</div>
              </div>

              {error && (
                <div className="mb-5 p-3 bg-rose-950/60 border border-rose-500/50 text-rose-200 text-xs font-mono flex items-start gap-2">
                  <AlertTriangle className="w-4 h-4 text-rose-400 shrink-0 mt-0.5" />
                  <span>{error}</span>
                </div>
              )}

              <form onSubmit={handleSubmit} className="space-y-4">
                <div>
                  <label className="block text-[11px] font-mono-hud text-[#BAE6FD] mb-1">
                    NEW PASSCODE <span className="text-[#38BDF8]">*</span>
                  </label>
                  <div className="relative">
                    <input
                      type={showPasscode ? 'text' : 'password'}
                      required
                      value={passcode}
                      onChange={(e) => setPasscode(e.target.value)}
                      minLength={PASSCODE_MIN_LENGTH}
                      maxLength={PASSCODE_MAX_LENGTH}
                      autoComplete="new-password"
                      placeholder={`At least ${PASSCODE_MIN_LENGTH} characters`}
                      className="w-full px-3.5 py-2.5 pr-10 bg-[#040E24] border border-[rgba(212,233,255,0.15)] text-white text-xs font-mono-hud focus:border-[#38BDF8] focus:outline-none"
                    />
                    <button
                      type="button"
                      onClick={() => setShowPasscode(v => !v)}
                      aria-label={showPasscode ? 'Hide passcode' : 'Show passcode'}
                      className="absolute right-2 top-1/2 -translate-y-1/2 p-1 text-slate-400 hover:text-[#38BDF8] cursor-pointer"
                    >
                      {showPasscode ? <EyeOff className="w-4 h-4" /> : <Eye className="w-4 h-4" />}
                    </button>
                  </div>
                </div>

                <div>
                  <label className="block text-[11px] font-mono-hud text-[#BAE6FD] mb-1">
                    CONFIRM NEW PASSCODE <span className="text-[#38BDF8]">*</span>
                  </label>
                  <input
                    type={showPasscode ? 'text' : 'password'}
                    required
                    value={confirmPasscode}
                    onChange={(e) => setConfirmPasscode(e.target.value)}
                    minLength={PASSCODE_MIN_LENGTH}
                    maxLength={PASSCODE_MAX_LENGTH}
                    autoComplete="new-password"
                    placeholder="Type it again"
                    className="w-full px-3.5 py-2.5 bg-[#040E24] border border-[rgba(212,233,255,0.15)] text-white text-xs font-mono-hud focus:border-[#38BDF8] focus:outline-none"
                  />
                </div>

                <p className="text-[11px] text-slate-400 font-sans leading-relaxed">
                  Everyone on your squad who signs in shares this passcode, so pick something
                  you can pass on — and not a password you use elsewhere. Capitals are ignored
                  when you sign in, so length is what makes it hard to guess.
                </p>

                <button
                  type="submit"
                  disabled={isSubmitting}
                  className="btn-glow-cyan w-full py-3 font-display font-black text-xs sm:text-sm text-[#040E24] bg-gradient-to-r from-[#FFFFFF] via-[#BAE6FD] to-[#38BDF8] flex items-center justify-center gap-2 cursor-pointer active:scale-95 shadow-xl disabled:opacity-50"
                >
                  {isSubmitting ? (
                    <span>UPDATING PASSCODE...</span>
                  ) : (
                    <>
                      <ShieldCheck className="w-4 h-4 text-[#040E24]" />
                      <span>SET NEW PASSCODE</span>
                    </>
                  )}
                </button>
              </form>
            </>
          )}
        </GlassCard>
      </main>
    </div>
  );
}
