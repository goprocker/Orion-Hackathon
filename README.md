# ORION 1.0 — 24H National Hackathon Platform
### Microsoft Club SIST • Sathyabama Institute of Science and Technology, Chennai

[![Next.js 16](https://img.shields.io/badge/Next.js-16.3.1-black?style=for-the-badge&logo=next.js)](https://nextjs.org/)
[![React 19](https://img.shields.io/badge/React-19.2.8-blue?style=for-the-badge&logo=react)](https://react.dev/)
[![TypeScript 5](https://img.shields.io/badge/TypeScript-5.0-blue?style=for-the-badge&logo=typescript)](https://www.typescriptlang.org/)
[![Tailwind CSS v4](https://img.shields.io/badge/Tailwind_CSS-v4.0-38bdf8?style=for-the-badge&logo=tailwindcss)](https://tailwindcss.com/)
[![Supabase](https://img.shields.io/badge/Supabase-PostgreSQL-3ECF8E?style=for-the-badge&logo=supabase)](https://supabase.com/)
[![Razorpay](https://img.shields.io/badge/Razorpay-Payment_Gateway-0C2340?style=for-the-badge&logo=razorpay)](https://razorpay.com/)
[![Three.js](https://img.shields.io/badge/Three.js-0.185.1-black?style=for-the-badge&logo=threedotjs)](https://threejs.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-emerald.svg?style=for-the-badge)](LICENSE)

---

## 1. Executive Overview

**ORION 1.0** is a full-stack, aerospace-themed mission portal and registration platform for the nationwide 24-hour hackathon organized by **Microsoft Club SIST** at the **Sathyabama Institute of Science and Technology (SIST)** in Chennai, India.

The platform includes a **6-step registration flow**, **server-side Razorpay payment verification**, a **Supabase PostgreSQL database**, a **live registration telemetry count**, and an **organizer Admin Command Center** with real-time sync and CSV export.

* **Prize Pool**: **₹1,00,000** total cash rewards, merit bounties, and incubation grants.
* **Squad Structure**: Fixed **5 Participants** per squad (1 Team Leader + 4 Team Members).
* **Round 1 Entry Fee**: **₹100 FLAT PER TEAM** (single payment transaction for full team).
* **Offline Finale**: Top 70 Finalist squads invited to the 24-hour offline hackathon at SIST Chennai.
* **Venue**: School of Computing Complex, Sathyabama Institute of Science and Technology (OMR, Chennai).

---

## 2. Full-Stack Architecture

```
User Submits 6-Step Registration (RegisterModal)
                  │
                  ▼
   POST /api/payment/create-order
   (Validates Indian phones, emails, 4 members, & creates ₹100 Razorpay order)
                  │
                  ▼
   Razorpay Checkout Modal / Sandbox Simulator
                  │
                  ▼
   POST /api/payment/verify
   (Verifies HMAC-SHA256 signature server-side & updates status to SUCCESS)
                  │
                  ▼
   Supabase PostgreSQL Relational Database (`teams` + `team_members`)
                  │
        ┌─────────┴───────────────────────┐
        ▼                                 ▼
GET /api/registrations/count    GET /api/admin/registrations
(Live count in HeroSection)     (Protected Admin Dashboard + CSV Export)
```

---

## 3. Multi-Step Registration Wizard

The registration system ([RegisterModal.tsx](file:///c:/orion-1.0/src/components/modals/RegisterModal.tsx)) features a 6-step flow:

1. **Step 1 — Team Information**:
   - Team Name (`e.g. Aether Dynamics`)
   - Team Leader Name (`e.g. Kavya Ramesh`)
   - Leader WhatsApp Phone Number (`+91` 10-digit Indian phone validation)
   - Leader Email Address (Email regex validation)
   - Institution / College Name
   - Problem Statement dropdown (`ORION-PS-01` to `ORION-PS-04`)
2. **Step 2 — Team Members (4 Crew Members)**:
   - Collects Name and Phone Number for each of the 4 members.
   - Leader is not repeated. Exactly 5 participants total.
3. **Step 3 — Declaration & Consent**:
   - 5 mandatory checkboxes confirming accuracy, membership, rules agreement, fee structure, and qualifier terms.
4. **Step 4 — Review Before Payment**:
   - Comprehensive review dossier with quick `[ EDIT DETAILS ]` and `[ PROCEED TO CHECKOUT — ₹100 ]`.
5. **Step 5 — Payment Gateway**:
   - Razorpay payment modal with server-side order creation.
   - Includes Sandbox Simulation mode when testing locally before entering live API keys.
6. **Step 6 — Registration Confirmed**:
   - Unique `ORN-R1-XXXX` registration ID, confirmed team parameters, `[ JOIN WHATSAPP GROUP ]`, `[ VIEW RULES ]`, and `[ DOWNLOAD RECEIPT ]` (downloadable formatted receipt).

---

## 4. Database Schema (Supabase PostgreSQL)

The database schema ([schema.sql](file:///c:/orion-1.0/src/db/schema.sql)) uses two relational tables:

### `public.teams` Table
| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `id` | `uuid` | `PRIMARY KEY, DEFAULT gen_random_uuid()` | Unique team row ID |
| `registration_id` | `text` | `UNIQUE, NOT NULL` | Standardized ID (`ORN-R1-XXXX`) |
| `team_name` | `text` | `NOT NULL` | Squad / Team Name |
| `leader_name` | `text` | `NOT NULL` | Squad Leader Name |
| `leader_phone` | `text` | `NOT NULL` | 10-digit Leader Phone |
| `leader_email` | `text` | `NOT NULL` | Leader Email Address |
| `institution` | `text` | `NOT NULL` | College / University |
| `problem_statement`| `text` | `NOT NULL` | Selected Track (`ORION-PS-01` to `04`) |
| `payment_status` | `text` | `NOT NULL, DEFAULT 'PENDING'` | `PENDING`, `SUCCESS`, `FAILED` |
| `payment_id` | `text` | | Razorpay payment ID |
| `order_id` | `text` | | Razorpay order ID |
| `amount` | `integer` | `NOT NULL, DEFAULT 100` | ₹100 Flat |
| `registration_status`| `text` | `NOT NULL, DEFAULT 'PENDING'`| `REGISTERED`, `PENDING` |
| `created_at` | `timestamptz`| `DEFAULT now()` | Timestamp |

### `public.team_members` Table
| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `id` | `uuid` | `PRIMARY KEY, DEFAULT gen_random_uuid()` | Unique member row ID |
| `team_id` | `uuid` | `REFERENCES public.teams(id) ON DELETE CASCADE`| Foreign key |
| `member_number`| `integer` | `CHECK (member_number BETWEEN 1 AND 4)` | Member 1 to 4 |
| `member_name` | `text` | `NOT NULL` | Member Name |
| `member_phone` | `text` | `NOT NULL` | Member Phone |

---

## 4b. Round 1 Presentation Submission & Re-upload Approval

The Round 1 deck follows a **submit once, replace only with approval** rule.

```
Payment VERIFIED by organiser
          │
          ▼
  First PPT upload  ──────────►  status: ACCEPTED   (auto-accepted, no sign-off)
          │
          │  team wants to change it
          ▼
  POST /api/team/resubmission  ──►  request status: PENDING
          │
          ▼
  Organiser reviews in /admin  ──►  APPROVED  ──►  team uploads once
          │                              │              │
          │                              │              ▼
          └──► REJECTED                  │        new deck ACCEPTED
               existing deck stands      │        old deck SUPERSEDED
                                         │        request  USED
                                         ▼
                              a further change needs a NEW request
```

* **First upload is free** once payment is `VERIFIED` — it is auto-accepted and is
  the version the jury evaluates.
* **Each approval is worth exactly one re-upload.** Spending it flips the request
  to `USED`; another change needs a fresh request.
* **One request in flight per team**, enforced by a partial unique index so a
  double-submit cannot open two.
* Approve/reject decisions email the team leader, with the organiser's note.
* `allowRound1Resubmission: false` in Settings remains a global kill switch that
  blocks all replacements regardless of approvals.

### Applying the database migrations

Run these once each in the Supabase SQL Editor against an existing project, in
order (each is idempotent):

```
src/db/migrations/001_resubmission_requests.sql      re-upload workflow table + columns
src/db/migrations/002_lock_down_rls.sql              drop the public read/write RLS policies
src/db/migrations/003_private_submissions_bucket.sql make the submissions bucket private
```

Order matters for the two security migrations: deploy the application code
first, then apply them. 002 needs `SUPABASE_SERVICE_ROLE_KEY` set or every query
starts failing; 003 makes existing public deck URLs stop resolving, and only the
deployed code knows how to mint signed ones.

Fresh installs get everything from `src/db/schema.sql` and can skip 001.

> The migration also adds `submissions.project_url / repo_url / demo_url` and
> `teams.evaluation_scores` — columns the application already wrote but that were
> missing from `schema.sql`.

---

## 4c. Transactional Email Deliverability

All mail goes through one hardened dispatcher in `src/lib/email.ts`:

| Measure | Why |
| :--- | :--- |
| Plain-text alternative on every message | HTML-only mail is the largest controllable spam-score penalty |
| Single pooled, rate-limited transporter | A TCP+TLS+AUTH handshake per message gets the sender throttled |
| Envelope sender pinned to `SMTP_USER` | Keeps SPF/DKIM aligned under DMARC; a mismatched `EMAIL_FROM` is warned about and overridden |
| `List-Unsubscribe` + one-click POST | Required by Google and Yahoo bulk sender rules since Feb 2024 |
| Hidden preheader per template | Stops clients scraping boilerplate as the preview line |
| Distinct `Message-ID` / `X-Entity-Ref-ID` | Stops Gmail threading separate notices together |
| Certificate validation enforced | `rejectUnauthorized: false` never helped delivery and accepted MITM |
| Subject lines de-spammed | Dropped `[ORION 1.0]` prefixes and "Action Required" |

Verify SMTP credentials from the admin API without sending anything:

```bash
curl -X POST https://your-host/api/admin/registrations \
  -H "x-admin-key: $ADMIN_SECRET_KEY" \
  -H 'Content-Type: application/json' \
  -d '{"action":"CHECK_MAILER"}'
```

> Automatic dispatch on signup stays **off** by design. Organisers send the
> registration email explicitly with the `SEND_REGISTRATION_EMAIL` admin action.

---

## 5. Organizer Admin Command Center (`/admin`)

Access the organizer dashboard at `/admin`:
* **Passcode Protected**: Protected by `ADMIN_SECRET_KEY` configured in `.env.local`.
* **Telemetry Overview**: Total Squads, Payment Confirmed, Payment Pending, Payment Failed, and Revenue.
* **Track Breakdown**: Real-time distribution across all 4 problem statements.
* **Search & Filter**: Search by Registration ID (`ORN-R1-...`), team name, leader, or college; filter by track and payment status.
* **5-Member Squad Drawer**: Expand any team to view leader contacts and all 4 crew members.
* **Live Auto-Polling**: Automatically syncs incoming registrations in the background every 6 seconds.
* **Re-upload Request Queue**: A `RE-UPLOAD REQ` metric tile and per-squad roster badge surface teams waiting on a PPT replacement decision; approve or decline from the squad drawer with a note that is emailed to the team.
* **1-Click CSV Export**: Downloads complete `ORION_1.0_Registrations.csv` file.

---

## 6. Project Setup & Quickstart

### Prerequisites
* **Node.js**: v18.0 or higher
* **npm**: v9.0 or higher

### Installation
```bash
# 1. Clone repository
git clone https://github.com/praveeneyyy/orion-1.0.git
cd orion-1.0

# 2. Install dependencies
npm install

# 3. Create .env.local file
cp .env.example .env.local
```

### Environment Configuration (`.env.local`)
```env
# Supabase PostgreSQL
NEXT_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-public-key

# Razorpay Gateway (₹100 Flat per Team)
NEXT_PUBLIC_RAZORPAY_KEY_ID=rzp_test_YourKeyId
RAZORPAY_KEY_SECRET=YourRazorpaySecret

# Admin Passcode for /admin
ADMIN_SECRET_KEY=orion_genesis_2026

# Official WhatsApp Link
NEXT_PUBLIC_WHATSAPP_GROUP_URL=https://chat.whatsapp.com/orion1point0
```

### Run Locally
```bash
# Start development server
npm run dev

# Build production bundle
npm run build

# Start production server
npm start
```

---

## 7. Problem Statement Tracks

1. **ORION-PS-01: FloatChat** — Oceanic Autonomous Telemetry & Generative AI Float Analytics
2. **ORION-PS-02: LexVault** — Zero-Knowledge Verifiable Legal Discovery & Compliance LLM Mesh
3. **ORION-PS-03: SylvaSense** — Ecological Acoustic Edge Intelligence & Bioacoustic Monitoring
4. **ORION-PS-04: Open Innovation** — High-Impact Solutions across AI, Healthcare, Fintech, and Defense

---

## 8. License

This project is open-source and licensed under the [MIT License](LICENSE).
Organized by **Microsoft Club SIST**, Sathyabama Institute of Science and Technology, Chennai.
