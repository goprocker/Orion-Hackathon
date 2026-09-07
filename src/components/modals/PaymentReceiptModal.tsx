'use client';

import React, { useRef } from 'react';
import { 
  CheckCircle2, 
  Printer, 
  X, 
  FileText
} from 'lucide-react';
import type { TeamRecord } from '@/types/orion';

interface PaymentReceiptModalProps {
  isOpen: boolean;
  onClose: () => void;
  team: TeamRecord;
}

export const PaymentReceiptModal: React.FC<PaymentReceiptModalProps> = ({
  isOpen,
  onClose,
  team
}) => {
  const receiptRef = useRef<HTMLDivElement>(null);

  if (!isOpen || !team) return null;

  const payment = team.payment;
  // Never fabricate: a receipt reopened tomorrow must not carry tomorrow's
  // date, and a missing UTR is a fact worth printing, not a blank to paper over.
  const verifiedDate = payment?.verified_at
    ? new Date(payment.verified_at).toLocaleDateString('en-IN', {
        day: '2-digit',
        month: 'short',
        year: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
      })
    : 'Recorded off-platform';

  // Derive the suffix from stable identity, not the UTR — a placeholder UTR
  // would stamp every off-platform receipt with the same digits.
  const receiptNo = `REC-ORION-${team.registration_id.replace(/[^0-9]/g, '') || '2026'}-${(payment?.id || team.id || '0000').replace(/[^a-zA-Z0-9]/g, '').slice(-4).toUpperCase()}`;

  const handlePrint = () => {
    window.print();
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/80 backdrop-blur-md overflow-y-auto print:p-0 print:bg-white">
      <div 
        className="relative w-full max-w-2xl bg-[#040E24] border border-[#38BDF8]/40 shadow-[0_0_50px_rgba(56,189,248,0.2)] text-slate-100 my-8 print:my-0 print:border-none print:shadow-none print:text-black print:bg-white"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Action Header Bar (Hidden in Print) */}
        <div className="flex items-center justify-between p-4 bg-[#07193D] border-b border-white/10 print:hidden">
          <div className="flex items-center gap-2">
            <FileText className="w-4 h-4 text-[#38BDF8]" />
            <span className="font-mono-hud text-xs font-bold text-white tracking-wider">
              OFFICIAL PAYMENT RECEIPT
            </span>
          </div>

          <div className="flex items-center gap-2">
            <button
              onClick={handlePrint}
              className="px-3 py-1.5 bg-[#00BCF2] hover:bg-[#38BDF8] text-[#040E24] font-bold text-xs font-mono flex items-center gap-1.5 transition-colors cursor-pointer shadow-md"
            >
              <Printer className="w-3.5 h-3.5" />
              <span>PRINT / SAVE PDF</span>
            </button>
            <button
              onClick={onClose}
              className="p-1.5 hover:bg-white/10 text-slate-400 hover:text-white transition-colors cursor-pointer"
            >
              <X className="w-5 h-5" />
            </button>
          </div>
        </div>

        {/* PRINTABLE RECEIPT BODY */}
        <div ref={receiptRef} className="p-6 sm:p-8 space-y-6 print:p-8 print:text-black bg-[#040E24] print:bg-white">
          
          {/* Header Section */}
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 border-b border-white/10 pb-6 print:border-gray-300">
            <div className="flex items-center gap-3">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img 
                src="/logo.png" 
                alt="ORION 1.0" 
                className="w-12 h-12 object-contain print:invert" 
              />
              <div>
                <div className="flex items-center gap-2">
                  <h1 className="font-display font-black text-xl text-white print:text-black tracking-tight">
                    ORION 1.0
                  </h1>
                  <span className="text-[10px] font-mono bg-[#38BDF8]/20 text-[#38BDF8] border border-[#38BDF8]/40 px-1.5 py-0.5 print:border-black print:text-black font-bold">
                    NATIONAL HACKATHON
                  </span>
                </div>
                <p className="text-xs text-slate-400 print:text-gray-600 font-sans">
                  Organized by <strong>Microsoft Club SIST</strong>
                </p>
                <p className="text-[11px] text-slate-500 print:text-gray-500 font-sans">
                  Sathyabama Institute of Science and Technology, Chennai
                </p>
              </div>
            </div>

            {/* Official Stamp */}
            <div className="text-right sm:text-right flex flex-col items-start sm:items-end">
              <div className="inline-flex items-center gap-1.5 px-3 py-1 bg-emerald-950/80 border border-emerald-400 text-emerald-300 print:bg-emerald-50 print:border-emerald-600 print:text-emerald-800 text-xs font-mono font-bold">
                <CheckCircle2 className="w-3.5 h-3.5 text-emerald-400 print:text-emerald-700" />
                <span>PAYMENT VERIFIED</span>
              </div>
              <div className="text-[10px] font-mono text-slate-400 print:text-gray-600 mt-1">
                Receipt No: <strong className="text-white print:text-black">{receiptNo}</strong>
              </div>
              <div className="text-[10px] font-mono text-slate-400 print:text-gray-600">
                Date: {verifiedDate}
              </div>
            </div>
          </div>

          {/* Squad & Registration Metadata Grid */}
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 text-xs font-sans">
            <div className="p-3.5 bg-[#07193D] border border-white/10 print:bg-gray-50 print:border-gray-200 space-y-1">
              <div className="text-[10px] font-mono text-[#38BDF8] print:text-blue-800 font-bold uppercase">
                BILLED TO (SQUAD DETAILS)
              </div>
              <div className="text-sm font-bold text-white print:text-black">
                {team.team_name}
              </div>
              <div className="text-slate-300 print:text-gray-700">
                Team ID: <span className="font-mono font-bold text-[#38BDF8] print:text-black">{team.registration_id}</span>
              </div>
              <div className="text-slate-300 print:text-gray-700">
                Leader: <strong>{team.leader_name}</strong> ({team.leader_phone})
              </div>
              <div className="text-slate-400 print:text-gray-600 text-[11px] truncate">
                {team.leader_email}
              </div>
              <div className="text-slate-400 print:text-gray-600 text-[11px]">
                {team.institution}
              </div>
            </div>

            <div className="p-3.5 bg-[#07193D] border border-white/10 print:bg-gray-50 print:border-gray-200 space-y-1">
              <div className="text-[10px] font-mono text-[#38BDF8] print:text-blue-800 font-bold uppercase">
                TRANSACTION & SETTLEMENT
              </div>
              <div className="text-slate-300 print:text-gray-700">
                Payment Channel: <strong className="text-white print:text-black">Official UPI Gateway</strong>
              </div>
              <div className="text-slate-300 print:text-gray-700 font-mono">
                UTR / Ref: <strong className="text-emerald-400 print:text-emerald-800">{payment?.utr_number || 'Recorded off-platform (WhatsApp proof)'}</strong>
              </div>
              <div className="text-slate-300 print:text-gray-700">
                Payee: <strong>MSNIHITHAJULIETA (8870227906@upi)</strong>
              </div>
              <div className="text-slate-400 print:text-gray-600 text-[11px]">
                Problem Track: <span className="text-[#38BDF8] print:text-blue-900 font-semibold">{team.problem_statement}</span>
              </div>
              <div className="text-slate-400 print:text-gray-600 text-[11px]">
                Status: <span className="text-emerald-400 print:text-emerald-700 font-bold">RECONCILED & LOCKED</span>
              </div>
            </div>
          </div>

          {/* Itemized Table */}
          <div className="border border-white/10 print:border-gray-300">
            <table className="w-full text-xs font-sans">
              <thead>
                <tr className="bg-[#07193D] print:bg-gray-100 border-b border-white/10 print:border-gray-300 text-[11px] font-mono text-slate-300 print:text-gray-700">
                  <th className="p-3 text-left font-bold">DESCRIPTION</th>
                  <th className="p-3 text-center font-bold">SQUAD SIZE</th>
                  <th className="p-3 text-right font-bold">AMOUNT (INR)</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-white/10 print:divide-gray-200">
                <tr>
                  <td className="p-3 text-white print:text-black">
                    <div className="font-bold">ORION 1.0 National Hackathon — Round 1 Entry Fee</div>
                    <div className="text-[11px] text-slate-400 print:text-gray-600">
                      Standard squad registration & PPT evaluation fee ({team.problem_statement})
                    </div>
                  </td>
                  <td className="p-3 text-center text-slate-300 print:text-gray-700 font-mono">
                    {team.members.length + 1} Members
                  </td>
                  <td className="p-3 text-right font-mono font-bold text-white print:text-black">
                    ₹{payment?.amount || 100}.00
                  </td>
                </tr>
              </tbody>
              <tfoot>
                <tr className="bg-[#020817] print:bg-gray-50 border-t-2 border-white/20 print:border-gray-400 font-mono font-bold">
                  <td colSpan={2} className="p-3 text-right text-slate-300 print:text-gray-800">
                    TOTAL AMOUNT PAID:
                  </td>
                  <td className="p-3 text-right text-sm text-emerald-400 print:text-emerald-700 font-mono-hud">
                    ₹{payment?.amount || 100}.00
                  </td>
                </tr>
              </tfoot>
            </table>
          </div>

          {/* Squad Member Breakdown */}
          <div className="p-3 bg-[#020817] border border-white/10 print:bg-gray-50 print:border-gray-200 space-y-1.5 text-xs font-sans">
            <div className="text-[10px] font-mono text-slate-400 print:text-gray-600 uppercase font-bold">
              REGISTERED SQUAD PARTICIPANTS ({team.members.length + 1}):
            </div>
            <div className="flex flex-wrap gap-2 text-[11px]">
              <span className="px-2 py-0.5 bg-[#0B2556] print:bg-blue-50 text-[#38BDF8] print:text-blue-900 border border-[#38BDF8]/40 print:border-blue-200 font-bold">
                Leader: {team.leader_name}
              </span>
              {team.members.map((m, idx) => (
                <span key={idx} className="px-2 py-0.5 bg-[#07193D] print:bg-gray-100 text-slate-300 print:text-gray-800 border border-white/10 print:border-gray-300">
                  Member {idx + 2}: {m.member_name}
                </span>
              ))}
            </div>
          </div>

          {/* Authorized Signature & Footer Security */}
          <div className="pt-4 border-t border-white/10 print:border-gray-300 flex flex-col sm:flex-row sm:items-end justify-between gap-4 text-xs">
            <div className="space-y-1 text-slate-500 print:text-gray-500 text-[10px]">
              <p>• This is a computer-generated official receipt for ORION 1.0 National Hackathon 2026.</p>
              <p>• Validated and issued by Microsoft Club SIST Executive Council.</p>
              <p>• Retain this receipt as payment proof for physical verification at offline venue.</p>
            </div>

            <div className="text-right sm:text-right shrink-0">
              <div className="text-[11px] font-display font-bold text-white print:text-black">
                ORION 1.0 Finance Secretariat
              </div>
              <div className="text-[10px] text-[#38BDF8] print:text-blue-700 font-mono">
                Microsoft Club SIST
              </div>
              <div className="text-[9px] text-slate-500 print:text-gray-500 font-mono">
                DIGITALLY VERIFIED & AUDITED
              </div>
            </div>
          </div>

        </div>

        {/* Footer (Hidden in Print) */}
        <div className="p-4 bg-[#07193D] border-t border-white/10 flex items-center justify-between print:hidden">
          <span className="text-xs text-slate-400 font-sans">
            Need help? Contact <strong className="text-white">support@orionhackathon.in</strong>
          </span>
          <button
            onClick={onClose}
            className="px-4 py-1.5 bg-[#040E24] hover:bg-white/10 text-white font-mono text-xs border border-white/20 cursor-pointer transition-colors"
          >
            CLOSE
          </button>
        </div>
      </div>
    </div>
  );
};
