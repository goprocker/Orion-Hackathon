# Security remediation — 2026-09-09

Scope: dependency vulnerabilities, participant-data publication, private receipt/deck
storage, and upload authorization/cleanup. Portal UI, login, password reset, and
existing passcodes are unchanged at the owner's request. No live records were modified.

## Dependencies

- Next.js and its ESLint configuration: 16.3.1 → 16.3.4.
- Nodemailer: 9.0.6 → 10.0.1. Removed the obsolete external type package;
  Nodemailer 10 supplies its own types and requires Node 20 or newer.
- Sharp: pinned at 0.35.4 to address the affected image decoder dependency.
- js-yaml: updated through the lockfile to the patched version.
- SheetJS: npm 0.18.5 → the official 0.20.3 distribution. Workbook inspection
  scripts now import this project's package rather than another developer's checkout.
- Added Vitest and an `npm test` command. Added dotenv for the pre-existing local
  verification script; that script was not executed against the database.

The package lock records exact artifacts and integrity hashes. The final npm audit
reported zero known vulnerabilities. This is an advisory database check, not proof
that every dependency is free of defects.

## Upload authorization and cleanup

`/api/team/payment` authenticates the existing team passcode before calling storage.
Caller-supplied screenshot URLs are rejected; a new receipt must be a validated upload.
The organizer-configured fee remains authoritative.

`/api/team/submission` checks verified payment, deadline and replacement approval
before allocating storage. The same eligibility helper is checked in the final
store operation, where the existing atomic approval claim remains in place.

Every new object has a random UUID name and uses `upsert: false`. Rejected persistence
removes that request's object. If a later audit/status operation fails after the
record is already saved, a `fileCommitted` marker preserves the referenced evidence.
Cleanup errors are logged for operator reconciliation rather than hidden.

## Private files

- Supabase writes require a bucket that exists and is private. Misconfigured or
  unavailable cloud storage fails closed; no silent public or inline fallback.
- Durable local storage uses `.data/private-uploads/`, outside the public tree.
  Serverless deployments require cloud storage.
- Authenticated reads produce five-minute signed links. Local links use HMAC
  signatures, expiration checks and path validation. A local signing key is generated
  privately when no sufficiently long environment key is supplied.
- Legacy `/uploads/*` URLs are intercepted before static-file resolution and return
  404. Authorized signed downloads can still read legacy files without moving or
  deleting the originals. Deployments serving `public/` independently of Next must
  also block that webserver's `/uploads/` path.
- Downloads use attachment, no-store, sandbox and nosniff headers. Unknown external
  or active-content URLs are not forwarded.
- Receipt validation checks both extension and bytes. Supported formats are PNG,
  JPEG, WEBP and PDF. HEIC, SVG and AVIF are rejected. Original files already in the
  database are retained, including unsupported legacy evidence for manual recovery.
- Admin receipt retrieval uses an authenticated endpoint. Legacy inline PNG/JPEG/
  WEBP/PDF receipts are decoded there and downloaded as attachments.

Apply `src/db/migrations/026_private_upload_storage.sql` with the updated application.
It creates private `payments` and `submissions` buckets and restrictive policies for
anonymous/authenticated Supabase callers. It does not alter teams or credentials.

## Participant data and import tools

23 sensitive historical migration/script/document files were preserved byte-for-byte
under the ignored `.data/security-archive/`. `manifest.json` records original paths,
byte lengths and SHA-256 checksums: 23 source, 23 processed, 23 success, 0 partial,
0 failed, 0 unaccounted. This archive is local to this checkout; keep an access-controlled
backup. It must never be committed, uploaded as a build artifact or used as a public fixture.

The public versions of historical data migrations are retired placeholders; migration
016 retains its schema/username trigger separately from roster and credential data.
No existing production roster was deleted or reimported. Unsafe legacy mutators now
stop with an explicit error instead of resetting passwords or regenerating public SQL.

`node scripts/stage_roster.mjs <private-source.json>` produces a private staging report.
It preserves raw bytes before parsing, every input record and its source index, repeated
values/IDs, null unknown fields, and success/partial/failed/unaccounted counts. It never
emits credential updates or applies a database change. Deduplication and database
application require a separate reviewed mapping; staging is deliberately not an
automatic replacement for the retired destructive import scripts.

`npm run check:private-data` rejects regenerated data statements in retired migrations
and reactivated legacy mutators. `.vercelignore` excludes the private archive, database
sources, scripts and tests from direct deployment uploads. Fresh schema creation no
longer installs permissive anonymous table policies.

## Live inspection and remaining actions

Read-only inspection found 382 teams, all using legacy credentials, no storage buckets,
and RLS enabled on all public tables (including backups) with no public/storage policies.

1. Deploy the tested application and apply migration 026 together. These changes have
   not been published or applied to the live database by this task.
2. Published Git history still contains the old roster/credential files. Removing them
   from the working tree does not erase old commits, forks, clones, caches or releases.
   Coordinate a history rewrite and force push, then request removal of cached copies.
   The archive manifest provides the exact historical source paths to remove.
3. Portal credential rotation is deferred by the owner. Existing exposed/name-derived
   credentials remain a risk if those endpoints are reachable. Before using the portal
   again, replace that scheme and rotate credentials through a verified recovery flow.
4. No automatic participant emails were sent, and no live data or credentials changed.

## Validation

- `npm test`: 26 tests passed across four test files.
- `npm run build`: production build succeeded with Next.js 16.3.4.
- `npx tsc --noEmit`: passed.
- `npm run lint`: passed without errors (final verification recorded in task report).
- `npm run check:private-data`: passed.
- `npm audit`: zero known vulnerabilities.
- Production HTTP smoke check: homepage/admin reachable; unsigned private downloads,
  unauthenticated admin receipts and legacy static upload URLs denied.

Tests use synthetic records, isolated files and mocked cloud/database services. They
do not upload participant files, submit live payments, or send email. Live bucket
enforcement still requires migration 026 during rollout.
