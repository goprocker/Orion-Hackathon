import { NextRequest, NextResponse } from 'next/server';
import {
  FAQ_DATA,
  EVENT_METRICS,
  PRIZE_TIERS,
  SPECIAL_TRACK_BOUNTIES,
  PROBLEM_STATEMENTS,
  TIMELINE_PHASES,
  HOSPITALITY_SYSTEMS,
  IMPORTANT_RULES,
} from '../../../data/orionData';

// ─── Build FAQ document from orionData ────────────────────────────────────────

function buildFAQDocument(): string {
  const sections: string[] = [];

  // Event overview
  sections.push(`=== ORION 1.0 HACKATHON — OFFICIAL FAQ DOCUMENT ===

Organizer: ${EVENT_METRICS.organizer}
Venue: ${EVENT_METRICS.venue}
Prize Pool: ${EVENT_METRICS.prizePool}
Duration: ${EVENT_METRICS.duration}
Registration Fee: ${EVENT_METRICS.round1Fee} flat per team
Finalist Fee: ${EVENT_METRICS.finalistFee} per head (Top ${EVENT_METRICS.finalistCount} teams)
Team Size: ${EVENT_METRICS.teamSize} members
Registration Deadline: ${EVENT_METRICS.deadlineDate} at 11:59 PM IST
PPT Submission Deadline: ${EVENT_METRICS.onlineDeadlineDate}
Grand Finale: ${EVENT_METRICS.offlineFinaleDate}
Registration Form: ${EVENT_METRICS.registrationFormUrl}
Google Maps: ${EVENT_METRICS.googleMapsUrl}`);

  // Prizes
  sections.push(`=== PRIZES ===
${PRIZE_TIERS.map((t) =>
  `${t.rank} (${t.label}): ${t.amount}
  Perks: ${t.perks.join(', ')}`
).join('\n\n')}

Special Track Bounties:
${SPECIAL_TRACK_BOUNTIES.map((b) => `- ${b.title}: ${b.description}`).join('\n')}`);

  // Timeline
  sections.push(`=== TIMELINE / PHASES ===
${TIMELINE_PHASES.map((p) =>
  `Phase ${p.number}: ${p.title} — ${p.date}
  ${p.highlights.map((h) => `• ${h}`).join('\n  ')}`
).join('\n\n')}`);

  // Problem Statements
  sections.push(`=== PROBLEM STATEMENTS ===
${PROBLEM_STATEMENTS.map((ps) =>
  `${ps.code} — ${ps.title}
  Tagline: ${ps.tagline}
  Domain: ${ps.domain}
  Classification: ${ps.classificationLevel}
  Overview: ${ps.overview}
  Key Features: ${ps.keyFeatures.join(', ')}
  Tech Stack: ${ps.techStack.join(', ')}
  Deliverables: ${ps.deliverables.join(', ')}
  Dataset Sources: ${ps.datasetSources.join(', ')}
  Evaluation Focus: ${ps.evaluationFocus.join(', ')}`
).join('\n\n')}`);

  // Hospitality
  sections.push(`=== HOSPITALITY & AMENITIES ===
${HOSPITALITY_SYSTEMS.map((h) => `${h.title}: ${h.subtitle} — ${h.detail}`).join('\n')}
Note: Outside food deliveries (Swiggy, Blinkit, etc.) are NOT allowed on campus.`);

  // Rules
  sections.push(`=== IMPORTANT RULES ===
${IMPORTANT_RULES.map((r) =>
  `Rule ${r.number}: ${r.title} (Applies to: ${r.appliesTo})
  Summary: ${r.summary}
  Allowed: ${r.allowed}
  Not Allowed: ${r.notAllowed}`
).join('\n\n')}`);

  // FAQ Q&A pairs
  sections.push(`=== FAQ Q&A ===
${FAQ_DATA.map((f) => `Q: ${f.question}\nA: ${f.answer}`).join('\n\n')}`);

  return sections.join('\n\n');
}

const FAQ_DOCUMENT = buildFAQDocument();

const SYSTEM_PROMPT = `You are ORION AI, the official FAQ assistant for ORION 1.0 — a 24-hour national-level hackathon organized by Microsoft Club SIST at Sathyabama Institute of Science and Technology, Chennai.

Your job is to answer participant questions accurately using ONLY the information in the FAQ document below. 

Rules:
- Be helpful, concise, and friendly.
- Use bullet points and bold text (**text**) for clarity.
- If the answer is clearly in the document, answer it directly and confidently.
- If the question is outside the scope of the FAQ document, politely say you don't have that information and suggest they join the official WhatsApp group or visit the website.
- Never make up information. Stick strictly to the document.
- Keep responses under 300 words unless the question genuinely requires more detail.

--- FAQ DOCUMENT START ---
${FAQ_DOCUMENT}
--- FAQ DOCUMENT END ---`;

// ─── Mistral API call ─────────────────────────────────────────────────────────

async function callMistral(userMessage: string): Promise<string> {
  const apiKey = process.env.MISTRAL_API_KEY;
  if (!apiKey) {
    throw new Error('MISTRAL_API_KEY is not configured.');
  }

  const response = await fetch('https://api.mistral.ai/v1/chat/completions', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${apiKey}`,
    },
    body: JSON.stringify({
      model: 'mistral-small-latest',
      messages: [
        { role: 'system', content: SYSTEM_PROMPT },
        { role: 'user', content: userMessage },
      ],
      temperature: 0.3,
      max_tokens: 600,
    }),
  });

  if (!response.ok) {
    const err = await response.text();
    throw new Error(`Mistral API error ${response.status}: ${err}`);
  }

  const data = await response.json();
  const reply = data?.choices?.[0]?.message?.content;
  if (!reply) throw new Error('No reply from Mistral API.');
  return reply.trim();
}

// ─── API Route ─────────────────────────────────────────────────────────────────

export async function POST(req: NextRequest) {
  try {
    const body = await req.json();
    const { message } = body as { message?: string };

    if (!message || typeof message !== 'string' || message.trim().length === 0) {
      return NextResponse.json(
        { error: 'Message is required.' },
        { status: 400 }
      );
    }

    const query = message.trim().slice(0, 500);
    const reply = await callMistral(query);

    return NextResponse.json({ reply });
  } catch (err) {
    console.error('[chatbot] error:', err);
    return NextResponse.json(
      { error: 'Internal server error. Please try again later.' },
      { status: 500 }
    );
  }
}
