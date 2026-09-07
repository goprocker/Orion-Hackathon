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

// ─── Gemini API call ──────────────────────────────────────────────────────────

async function callGemini(userMessage: string): Promise<string> {
  const apiKey = (process.env.GEMINI_API_KEY || '').trim();
  if (!apiKey) {
    throw new Error('GEMINI_API_KEY is not configured.');
  }

  const models = ['gemini-2.5-flash', 'gemini-2.0-flash', 'gemini-1.5-flash'];
  let lastError: any = null;

  for (const model of models) {
    try {
      const url = `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${apiKey}`;
      const response = await fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'x-goog-api-key': apiKey,
        },
        body: JSON.stringify({
          systemInstruction: {
            parts: [{ text: SYSTEM_PROMPT }],
          },
          contents: [
            {
              role: 'user',
              parts: [{ text: userMessage }],
            },
          ],
          generationConfig: {
            temperature: 0.3,
            maxOutputTokens: 800,
          },
        }),
      });

      if (!response.ok) {
        const err = await response.text();
        throw new Error(`Gemini API (${model}) error ${response.status}: ${err}`);
      }

      const data = await response.json();
      const reply = data?.candidates?.[0]?.content?.parts?.[0]?.text;
      if (reply) return reply.trim();
    } catch (err) {
      lastError = err;
    }
  }

  throw lastError || new Error('No reply from Gemini API.');
}

// ─── Mistral API call ─────────────────────────────────────────────────────────

async function callMistral(userMessage: string): Promise<string> {
  const apiKey = (process.env.MISTRAL_API_KEY || '').trim();
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

// ─── Local FAQ Knowledge Base Fallback ────────────────────────────────────────

function localAnswerFallback(query: string): string {
  const q = query.toLowerCase();

  // Problem statements
  for (const ps of PROBLEM_STATEMENTS) {
    if (
      q.includes(ps.code.toLowerCase()) ||
      q.includes(ps.title.toLowerCase()) ||
      (ps.tagline && q.includes(ps.tagline.toLowerCase()))
    ) {
      return `### **${ps.code} — ${ps.title}**\n\n` +
        `**Domain:** ${ps.domain} | **Classification:** ${ps.classificationLevel}\n\n` +
        `**Overview:** ${ps.overview}\n\n` +
        `**Key Features:**\n${ps.keyFeatures.map((f) => `• ${f}`).join('\n')}\n\n` +
        `**Tech Stack:** ${ps.techStack.join(', ')}\n\n` +
        `**Deliverables:**\n${ps.deliverables.map((d) => `• ${d}`).join('\n')}`;
    }
  }

  // Prizes & Bounties
  if (q.includes('prize') || q.includes('reward') || q.includes('cash') || q.includes('bounty') || q.includes('pool')) {
    return `🏆 **ORION 1.0 Total Prize Pool: ${EVENT_METRICS.prizePool}**\n\n` +
      PRIZE_TIERS.map((t) => `• **${t.rank} (${t.label}):** ${t.amount}\n  Perks: ${t.perks.join(', ')}`).join('\n\n') +
      `\n\n**Special Track Bounties:**\n` +
      SPECIAL_TRACK_BOUNTIES.map((b) => `• **${b.title}:** ${b.description}`).join('\n');
  }

  // Registration Fee / Cost
  if (q.includes('fee') || q.includes('cost') || q.includes('pay') || q.includes('price') || q.includes('amount') || q.includes('charge')) {
    return `💰 **Registration Fee Details:**\n\n` +
      `• **Round 1 (Online PPT Submission):** **${EVENT_METRICS.round1Fee}** flat per team (${EVENT_METRICS.teamSize} members).\n` +
      `• **Round 2 (Grand Finale):** **${EVENT_METRICS.finalistFee}** per head for only the **${EVENT_METRICS.finalistCount} finalist teams** advancing to the offline sprint.\n\n` +
      `📝 **Register:** [Google Form Registration](${EVENT_METRICS.registrationFormUrl})`;
  }

  // Deadlines & Dates
  if (q.includes('deadline') || q.includes('date') || q.includes('when') || q.includes('schedule') || q.includes('timeline')) {
    return `📅 **Key Dates & Schedule:**\n\n` +
      `• **Registration & PPT Submission Deadline:** **${EVENT_METRICS.deadlineDate} at 11:59 PM IST**\n` +
      `• **Round 1 Results Announced:** September 13, 2026\n` +
      `• **Grand Finale (24-Hour Offline):** **${EVENT_METRICS.offlineFinaleDate}**\n` +
      `• **Venue:** ${EVENT_METRICS.venue}`;
  }

  // Team Size & Eligibility
  if (q.includes('eligible') || q.includes('eligibility') || q.includes('team size') || q.includes('members') || q.includes('who can') || q.includes('college')) {
    return `👥 **Eligibility & Team Rules:**\n\n` +
      `• **Team Size:** **${EVENT_METRICS.teamSize} members** per team.\n` +
      `• **Eligibility:** Open to all college students (UG/PG across any branch or year) and working professionals.\n` +
      `• **Cross-college teams:** Allowed and encouraged!`;
  }

  // Venue & Amenities
  if (q.includes('venue') || q.includes('location') || q.includes('food') || q.includes('stay') || q.includes('accommodation') || q.includes('chennai')) {
    return `📍 **Venue & Amenities:**\n\n` +
      `• **Venue:** **${EVENT_METRICS.venue}**\n` +
      `• **Food & Refreshments:** Provided during the 24-hour offline finale for all participants.\n` +
      `• **Outside Food:** Deliveries (Swiggy, Zomato, Blinkit) are not permitted on campus.\n` +
      `• [View on Google Maps](${EVENT_METRICS.googleMapsUrl})`;
  }

  // Keyword match in FAQ_DATA
  const words = q.replace(/[^a-z0-9\s]/g, ' ').split(/\s+/).filter((w) => w.length > 2);
  let bestMatch: { item: typeof FAQ_DATA[0]; score: number } | null = null;

  for (const item of FAQ_DATA) {
    const itemText = (item.question + ' ' + item.answer).toLowerCase();
    let score = 0;
    for (const word of words) {
      if (item.question.toLowerCase().includes(word)) score += 3;
      else if (itemText.includes(word)) score += 1;
    }
    if (score > (bestMatch?.score || 0)) {
      bestMatch = { item, score };
    }
  }

  if (bestMatch && bestMatch.score >= 2) {
    return `**${bestMatch.item.question}**\n\n${bestMatch.item.answer}`;
  }

  return `👋 I am **ORION AI**, the official assistant for **ORION 1.0 Hackathon**.\n\n` +
    `• **Prize Pool:** ${EVENT_METRICS.prizePool}\n` +
    `• **Deadline:** **${EVENT_METRICS.deadlineDate}**\n` +
    `• **Team Size:** ${EVENT_METRICS.teamSize} members (${EVENT_METRICS.round1Fee} flat fee)\n` +
    `• **Venue:** ${EVENT_METRICS.venue}\n\n` +
    `For more questions, feel free to ask or join our official WhatsApp group: [Join WhatsApp Group](${process.env.NEXT_PUBLIC_WHATSAPP_GROUP_URL || 'https://chat.whatsapp.com/C76LZLzWkOh3FPC99iXw8f'})`;
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
    let reply = '';

    // 1. Try Gemini first (Gemini 2.5/2.0/1.5 Flash)
    if (process.env.GEMINI_API_KEY) {
      try {
        reply = await callGemini(query);
      } catch (geminiErr) {
        console.warn('[chatbot] Gemini call failed, falling back to Mistral/local:', geminiErr);
      }
    }

    // 2. Try Mistral if Gemini didn't provide a response
    if (!reply && process.env.MISTRAL_API_KEY) {
      try {
        reply = await callMistral(query);
      } catch (mistralErr) {
        console.warn('[chatbot] Mistral call failed, using local fallback:', mistralErr);
      }
    }

    // 3. Fallback to smart verified local FAQ knowledge base
    if (!reply) {
      reply = localAnswerFallback(query);
    }

    return NextResponse.json({ reply });
  } catch (err) {
    console.error('[chatbot] unexpected error:', err);
    // Always return a helpful answer rather than a 500
    return NextResponse.json({
      reply: `I'm having a brief connection hitch, but here is what you need to know:\n\n• **Deadline:** September 11, 2026\n• **Prize Pool:** ₹1,00,000\n• **Registration Form:** https://forms.gle/txiRwn9EELUgZvrJ6\n• **Support:** https://chat.whatsapp.com/C76LZLzWkOh3FPC99iXw8f`
    });
  }
}

