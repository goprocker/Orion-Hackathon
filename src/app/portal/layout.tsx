import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Team Mission Portal',
  description:
    'Official squad portal for ORION 1.0 Hackathon. Track payment verification status, submit Round 1 PPT pitch decks, and monitor Grand Finale shortlisting.',
  robots: {
    index: true,
    follow: true,
  },
};

export default function PortalLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return <>{children}</>;
}
