import type { Metadata } from 'next';
import { PORTAL_ENABLED } from '@/data/orionData';

export const metadata: Metadata = {
  title: 'Team Mission Portal',
  description:
    'Official squad portal for ORION 1.0 Hackathon. Track payment verification status, submit Round 1 PPT pitch decks, and monitor Grand Finale shortlisting.',
  robots: {
    index: PORTAL_ENABLED,
    follow: PORTAL_ENABLED,
  },
};

export default function PortalLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  if (!PORTAL_ENABLED) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center text-center px-4 bg-[#040E24]">
        <span className="font-mono-hud text-xs tracking-widest text-[#22D3EE] mb-3">
          TEAM PORTAL
        </span>
        <h1 className="font-display font-black text-2xl sm:text-3xl text-white mb-2">
          Temporarily Unavailable
        </h1>
        <p className="text-sm text-[#94A3B8] max-w-md">
          The Team Portal is offline while the Round 1 &amp; Grand Finale schedule is being
          revised. It will be back once the new dates are announced.
        </p>
        <a
          href="/"
          className="mt-6 px-5 py-2.5 font-sans font-bold text-xs text-[#020617] bg-gradient-to-r from-[#FFFFFF] via-[#BAE6FD] to-[#00BCF2] rounded-none"
        >
          Back to Home
        </a>
      </div>
    );
  }

  return <>{children}</>;
}
