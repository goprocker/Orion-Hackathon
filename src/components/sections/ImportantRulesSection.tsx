'use client';

import React from 'react';
import Link from 'next/link';
import {
  AlertTriangle,
  Ban,
  CalendarClock,
  CheckCircle2,
  FileCheck2,
  Hash,
  Megaphone,
  ShieldAlert,
  XCircle,
  ChevronRight,
  type LucideIcon,
} from 'lucide-react';
import { GlassCard } from '../common/GlassCard';
import { ScrollReveal } from '../common/ScrollReveal';
import { IMPORTANT_RULES, IMPORTANT_RULES_NOTICE } from '../../data/orionData';

const RULE_ICONS: Record<string, LucideIcon> = {
  FileCheck2,
  Hash,
  Ban,
  CalendarClock,
};

export const ImportantRulesSection: React.FC = () => {
  return (
    <section id="rules" className="py-20 px-4 relative z-10">
      <div className="max-w-7xl mx-auto">

        {/* Section Header */}
        <ScrollReveal direction="up" delay={50} duration={600} className="text-center max-w-3xl mx-auto mb-10 select-none">
          <div className="inline-flex items-center gap-2.5 px-4 py-1 bg-gradient-to-r from-transparent via-amber-400/10 to-transparent border-y border-amber-400/30 text-xs font-mono font-bold tracking-[0.18em] text-amber-200 uppercase mb-4 shadow-sm">
            <Megaphone className="w-3.5 h-3.5 text-amber-400" />
            <span>OFFICIAL NOTICE • READ BEFORE YOU SUBMIT</span>
          </div>
          <h2 className="text-3xl sm:text-4xl md:text-5xl font-display font-black text-white tracking-tight mb-4 uppercase">
            IMPORTANT <span className="text-transparent bg-clip-text bg-gradient-to-r from-amber-300 via-[#FFB900] to-orange-400">RULES</span>
          </h2>
          <p className="text-sm sm:text-base text-slate-300 font-sans leading-relaxed">
            <span className="text-white font-semibold">{IMPORTANT_RULES_NOTICE.greeting}</span>{' '}
            {IMPORTANT_RULES_NOTICE.intro}
          </p>
        </ScrollReveal>

        {/* Rule Cards */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-5 max-w-6xl mx-auto text-left">
          {IMPORTANT_RULES.map((rule, idx) => {
            const Icon = RULE_ICONS[rule.icon] ?? ShieldAlert;
            return (
              <ScrollReveal key={rule.number} direction="up" delay={100 + idx * 80} duration={600}>
                <GlassCard
                  glowColor="amber"
                  className="h-full p-6 sm:p-7 border border-white/10 hover:border-amber-400/60 hover:shadow-[0_20px_48px_rgba(255,185,0,0.18)] rounded-2xl"
                >
                  {/* Card top row */}
                  <div className="flex items-start justify-between gap-4 pb-4 mb-4 border-b border-white/10">
                    <div className="flex items-center gap-3">
                      <span className="text-4xl sm:text-5xl font-display font-black leading-none text-transparent bg-clip-text bg-gradient-to-b from-amber-200 to-amber-500/60 select-none">
                        {rule.number}
                      </span>
                      <div className="p-2.5 bg-amber-400/10 border border-amber-400/30 text-amber-300 rounded-lg">
                        <Icon className="w-5 h-5" />
                      </div>
                    </div>
                    <span className="shrink-0 px-2.5 py-1 text-[10px] sm:text-[11px] font-mono font-bold uppercase tracking-wider bg-[#040E24] text-slate-300 border border-white/10 rounded-full">
                      {rule.appliesTo}
                    </span>
                  </div>

                  {/* Title & text */}
                  <h3 className="text-lg sm:text-xl font-display font-black text-white tracking-tight mb-2">
                    {rule.title}
                  </h3>
                  <p className="text-sm text-slate-100 font-sans font-semibold leading-relaxed mb-2">
                    {rule.summary}
                  </p>
                  <p className="text-xs sm:text-sm text-slate-400 font-sans leading-relaxed mb-5">
                    {rule.detail}
                  </p>

                  {/* Allowed / Not allowed */}
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-2.5 text-xs font-sans">
                    <div className="flex items-start gap-2 p-3 bg-emerald-500/5 border border-emerald-500/25 rounded-lg">
                      <CheckCircle2 className="w-4 h-4 text-emerald-400 shrink-0 mt-0.5" />
                      <div>
                        <span className="block text-[10px] font-mono font-bold uppercase tracking-wider text-emerald-400 mb-0.5">Allowed</span>
                        <span className="text-slate-200">{rule.allowed}</span>
                      </div>
                    </div>
                    <div className="flex items-start gap-2 p-3 bg-rose-500/5 border border-rose-500/25 rounded-lg">
                      <XCircle className="w-4 h-4 text-rose-400 shrink-0 mt-0.5" />
                      <div>
                        <span className="block text-[10px] font-mono font-bold uppercase tracking-wider text-rose-400 mb-0.5">Not allowed</span>
                        <span className="text-slate-200">{rule.notAllowed}</span>
                      </div>
                    </div>
                  </div>
                </GlassCard>
              </ScrollReveal>
            );
          })}
        </div>

        {/* Warning banner + sign-off */}
        <ScrollReveal direction="up" delay={150} duration={600} className="max-w-6xl mx-auto mt-6">
          <div className="p-5 sm:p-6 bg-rose-950/30 border border-rose-500/40 rounded-2xl shadow-[0_0_30px_rgba(244,63,94,0.12)] flex flex-col md:flex-row md:items-center gap-4 md:gap-6">
            <div className="flex items-start gap-3 flex-1">
              <div className="p-2.5 bg-rose-500/15 border border-rose-500/40 text-rose-300 rounded-lg shrink-0">
                <AlertTriangle className="w-5 h-5" />
              </div>
              <div>
                <span className="block text-[11px] font-mono font-bold uppercase tracking-widest text-rose-400 mb-1">
                  Non-compliance warning
                </span>
                <p className="text-sm sm:text-base text-rose-100 font-sans font-semibold leading-relaxed">
                  {IMPORTANT_RULES_NOTICE.warning}
                </p>
              </div>
            </div>
            <div className="md:border-l md:border-rose-500/30 md:pl-6 shrink-0 text-left md:text-right">
              <span className="block text-[10px] font-mono uppercase tracking-widest text-slate-400 mb-1">Regards,</span>
              <span className="block text-sm font-display font-black text-white">{IMPORTANT_RULES_NOTICE.signOff}</span>
              <span className="block text-xs font-sans text-[#BAE6FD]">{IMPORTANT_RULES_NOTICE.signOffOrg}</span>
            </div>
          </div>

          <div className="mt-5 flex flex-col sm:flex-row items-center justify-center gap-3 text-xs font-sans text-slate-400">
            <span>Need the complete policy, fees, and code of conduct?</span>
            <Link
              href="/terms"
              className="inline-flex items-center gap-1.5 px-4 py-2 border border-[#00BCF2]/40 bg-[#00BCF2]/10 hover:bg-[#00BCF2]/20 text-[#BAE6FD] hover:text-white font-mono font-bold uppercase tracking-wider text-[11px] rounded-lg transition-colors"
            >
              <span>Read the Official Rulebook</span>
              <ChevronRight className="w-3.5 h-3.5" />
            </Link>
          </div>
        </ScrollReveal>

      </div>
    </section>
  );
};
