# ORION 1.0 Vercel Bandwidth Audit

Audit date: 2026-09-11

Scope: the complete Next.js application, public assets, route handlers, client network activity, Supabase access, fonts, and production caching. Registration, payment, portal, admin, email, authentication, private-file, database, migration, and schema implementations are intentionally preserved.

The public **Register Team** CTAs intentionally remain active and link directly to the existing Google Form. `REGISTRATION_ENABLED` controls only the internal application routes, APIs, database-backed status lookup, and payment/administration experience.

## Findings and resolutions

### CRITICAL

No critical issue was found. Uploaded payment evidence and participant decks were already protected by private-file handlers rather than being preloaded by the public homepage.

### HIGH

| Path | Cause | Estimated impact | Exact fix |
| --- | --- | --- | --- |
| `src/app/admin/page.tsx` | The full joined admin overview was downloaded every 6 seconds, including teams, members, payment metadata, submissions, flags, logs, stats, and signed deck links. | 10 overview requests/minute; about 200 requests per 20-minute session. A 300–800 KiB compressed response would transfer roughly 60–160 MiB. | Poll only in a visible tab every 60 seconds, refresh immediately on focus/visibility return and after writes, retain manual refresh, and deduplicate in-flight refreshes. |
| `src/app/portal/page.tsx` | The full team dossier and config were downloaded every 8 seconds. | 7.5 requests/minute per signed-in team. | Use 30-second polling for pending/re-upload/review states and 120 seconds for stable states; suspend polling in hidden tabs; refresh on focus and after writes; deduplicate in-flight refreshes. |
| `public/logo.png`, `public/icon.png`, `public/favicon.png`, `public/favicon.ico`, `src/app/icon.png` | Five duplicate 1254×1254 PNG payloads were 1,665,462 bytes each. `favicon.ico` contained PNG bytes rather than an ICO container. | 8,327,310 bytes in duplicated deploy assets; the 1.59 MiB source was also used at 32–352 CSS pixels. | Resize compatible PNG copies to 512px, make the favicon 192px, create a valid 64px ICO, add a versioned 512px WebP, and render display logos through `next/image`. QR assets were not modified. |
| `src/app/api/**`, `src/app/{portal,admin}/layout.tsx` | Preserved private functionality remained directly reachable, so bots or old links could invoke database, storage, authentication, and email work. | Unbounded request/database traffic even when the public event site no longer needs these systems. | Add the opt-in `REGISTRATION_ENABLED` feature switch, route-tree 404 guards, and API guards that return before parsing requests or touching rate limiters, Supabase, storage, or email. |

### MEDIUM

| Path | Cause | Estimated impact | Exact fix |
| --- | --- | --- | --- |
| `src/app/api/admin/registrations/route.ts`, `src/lib/serverStore.ts` | Admin action responses returned full mutation objects the UI never read; the overview selected every column. | Extra server-to-client JSON and Supabase result bytes on every admin action/refresh. | Return only `success`, `message`, mail status, or requested URL; select the overview fields consumed by the dashboard. Major pagination was intentionally deferred. |
| `src/lib/storage.ts` | Every admin overview refresh generated fresh signed URLs for all submitted decks. | Repeated Supabase Storage signing traffic and computation. | Cache signed URLs in-process until five minutes before expiry while preserving authorization and expiration behavior. |
| `next.config.ts` | Safe public assets had no explicit caching policy. | Repeated origin/CDN transfers for stable assets. | Cache only the versioned logo as one-year immutable; use one-day browser/seven-day CDN revalidation for unversioned public icons/logo/template. Explicitly mark portal, admin, auth, payment/team, registration, status, private-file, and cron responses `private, no-store`. The QR receives no long public cache. |
| `src/app/layout.tsx` | Four Google font families and 17 weights/styles were requested globally; only Inter and Space Grotesk are used by the public typography. | Extra third-party font stylesheet/font transfers and connections. | Keep the existing typography but request only Inter 400–800 and Space Grotesk 500–700. |
| `src/components/common/Navbar.tsx`, `src/components/sections/{HeroSection,Footer}.tsx`, `src/components/modals/PaymentReceiptModal.tsx`, `src/app/{admin,portal}/page.tsx` | Static logos used raw `<img>` elements without responsive image metadata. | Oversized image delivery and missed Next.js image optimization. | Use `next/image` with intrinsic dimensions and accurate `sizes`; preload only the hero logo and lazy-load lower-page images by default. |
| `src/components/sections/PrizeSection.tsx`, `src/components/3d/Trophy3D.tsx` | The below-the-fold trophy mounted during initial hydration, immediately requesting the 532,000-byte raw Three.js chunk even when visitors never reached the prize section. | Up to 532,000 raw JavaScript bytes plus WebGL initialization per short visit. | Mount the existing dynamically imported trophy only when its reserved layout box comes within 400px of the viewport; preserve the visual and interaction once reached. |

### LOW

| Path | Cause | Estimated impact | Exact fix |
| --- | --- | --- | --- |
| `src/app/api/registrations/count/route.ts` | The public count was dynamic per homepage visit. | One API/database request per visit when the internal platform is enabled. | Make the disabled homepage issue no request. When enabled later, cache successful counts for 60 seconds at the CDN with stale-while-revalidate; disabled/error responses stay private/no-store. |
| `public/ORION_1.0_Template.pptx`, `public/orion_payment_qr.jpg` | The PPTX is 2.80 MiB and the QR JPEG is 50.3 KiB. | Only explicit user downloads; neither was preloaded. | Keep both click-to-download/on-demand. Leave the QR bytes untouched. Give the static template a revalidating public cache, not an immutable payment cache. |
| Public 3D/animation libraries | `ogl`, GSAP, Motion, and animation components contribute to the client bundle. | Material JavaScript, but removing them would change the existing UI. | Preserve the public visual experience. Registration/status implementations remain dynamically split and are not rendered while the internal feature is disabled; the Three.js trophy is now viewport-lazy. The unused constellation implementation remains out of the public route. |

## Implemented transfer reductions

| Asset | Original | Optimized | Saved |
| --- | ---: | ---: | ---: |
| `public/logo.png` | 1,665,462 B | 100,266 B | 1,565,196 B |
| `public/icon.png` | 1,665,462 B | 100,266 B | 1,565,196 B |
| `public/favicon.png` | 1,665,462 B | 19,165 B | 1,646,297 B |
| `public/favicon.ico` | 1,665,462 B | 3,781 B | 1,661,681 B |
| `src/app/icon.png` | 1,665,462 B | 100,266 B | 1,565,196 B |
| New `public/orion-logo-v1.webp` | — | 81,216 B | — |

The five replaced assets are 8,003,566 bytes smaller (96.1%). After adding the versioned WebP, the deployment is still 7,922,350 bytes (7.56 MiB) smaller. A display-logo request is reduced from 1,665,462 bytes to at most 81,216 bytes before Next.js produces viewport-specific variants, a 95.1% source reduction. Local production checks measured the generated AVIF variants at 1,797 bytes (64px), 18,038 bytes (384px), and 26,985 bytes (640px).

Polling request reductions while the feature is enabled:

- Admin: 10 requests/minute to 1 request/minute while visible (90%); zero interval requests while hidden.
- Portal pending/review: 7.5 requests/minute to 2 (73.3%); stable: 7.5 to 0.5 (93.3%); zero interval requests while hidden.
- Disabled public homepage: registration-count calls fall from one per visit to zero.
- Disabled public homepage: four registration/status-only JavaScript chunks totaling 176,055 raw bytes are code-split and absent from the initial HTML's script/preload references.
- Short visits that never approach the prize section avoid the 532,000-byte Three.js implementation chunk (107,927 bytes under local Brotli measurement).

## Intentionally deferred or unchanged

- No registration-system file, dependency, migration, schema, database helper, credential shape, Supabase integration, payment logic, email logic, auth logic, admin implementation, or portal implementation was deleted.
- No major admin pagination redesign was introduced because it could change filtering/export semantics. The 60-second visible-only refresh removes the immediate bandwidth problem safely.
- The payment QR was not recompressed, transformed, or given long immutable caching.
- The PPTX was not recompressed because Office archive recompression can damage or alter a participant template; it remains an explicit download.
- Public animation/3D features were not removed because they are part of the existing UI.
- Google Fonts were not moved into the Vercel deployment because that would shift their bytes onto Vercel Fast Data Transfer; unused families/weights were removed instead.

## Reactivation

Set `REGISTRATION_ENABLED=true` in the deployment environment and redeploy. The existing internal registration, portal, admin, payment, email, authentication, Supabase, database, and private-file code paths remain intact.
