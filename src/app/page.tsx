'use client';

import React, { useState } from 'react';
import { Navbar } from '@/components/common/Navbar';
import { HeroSection } from '@/components/sections/HeroSection';
import { ChallengeArena } from '@/components/sections/ChallengeArena';
import { PrizeSection } from '@/components/sections/PrizeSection';
import { GuidelinesSection } from '@/components/sections/GuidelinesSection';
import { ImportantRulesSection } from '@/components/sections/ImportantRulesSection';
import { TimelineSection } from '@/components/sections/TimelineSection';
import { OrganizersSection } from '@/components/sections/OrganizersSection';
import { FAQSection } from '@/components/sections/FAQSection';
import { VenuePerksSection } from '@/components/sections/VenuePerksSection';
import { Footer } from '@/components/sections/Footer';
import { RegisterModal } from '@/components/modals/RegisterModal';
import { ChallengeModal } from '@/components/modals/ChallengeModal';
import { TeamStatusModal } from '@/components/modals/TeamStatusModal';
import type { ProblemStatement } from '@/types/orion';

export default function LandingPage() {
  const [isRegisterOpen, setIsRegisterOpen] = useState(false);
  const [isStatusOpen, setIsStatusOpen] = useState(false);
  const [activeProblem, setActiveProblem] = useState<ProblemStatement | null>(null);
  const [initialProblemStatement, setInitialProblemStatement] = useState<string | undefined>(undefined);

  const openRegister = () => {
    setIsRegisterOpen(true);
  };

  const closeRegister = () => {
    setIsRegisterOpen(false);
    setInitialProblemStatement(undefined);
  };

  const openProblem = (problem: ProblemStatement) => {
    setActiveProblem(problem);
  };

  const closeProblem = () => {
    setActiveProblem(null);
  };

  const handleSelectForRegister = () => {
    if (activeProblem) {
      setInitialProblemStatement(activeProblem.code);
    }
    setIsRegisterOpen(true);
  };

  const handleExplorePrizes = () => {
    const el = document.getElementById('prizes');
    if (el) {
      el.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
  };

  return (
    <div className="min-h-screen bg-[#040E24] text-slate-100 selection:bg-[#00BCF2]/30 selection:text-[#BAE6FD]">
      <Navbar
        onOpenRegister={openRegister}
        onOpenStatus={() => setIsStatusOpen(true)}
      />

      <main>
        <HeroSection
          onOpenRegister={openRegister}
          onOpenStatus={() => setIsStatusOpen(true)}
          onExplorePrizes={handleExplorePrizes}
        />

        <ChallengeArena onOpenProblemModal={openProblem} />

        <PrizeSection />

        <GuidelinesSection />

        <ImportantRulesSection />

        <TimelineSection />

        <VenuePerksSection />

        <OrganizersSection />

        <FAQSection />

        <Footer
          onOpenRegister={openRegister}
          onOpenStatus={() => setIsStatusOpen(true)}
        />
      </main>

      <RegisterModal
        isOpen={isRegisterOpen}
        onClose={closeRegister}
        initialProblemStatement={initialProblemStatement}
      />

      <ChallengeModal
        problem={activeProblem}
        isOpen={Boolean(activeProblem)}
        onClose={closeProblem}
        onSelectForRegister={handleSelectForRegister}
      />

      <TeamStatusModal
        isOpen={isStatusOpen}
        onClose={() => setIsStatusOpen(false)}
      />
    </div>
  );
}
