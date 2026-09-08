<!-- BEGIN:nextjs-agent-rules -->

# This is NOT the Next.js you know

This version has breaking changes — APIs, conventions, and file structure may all differ from your training data. Read the relevant guide in `node_modules/next/dist/docs/` (resolved from this file's directory; in monorepos the `next` package may not be visible from the repo root) before writing any code. Heed deprecation notices.

This block is written and re-added by `next dev` — verify at `node_modules/next/dist/server/lib/generate-agent-files.js`. Removing it from a diff only re-creates the uncommitted change; committing it with your work keeps the tree clean.

<!-- END:nextjs-agent-rules -->

# Data Extraction Rules

When modifying any extraction, parser, or import pipeline:

1. Never silently discard source records.
2. Repeated field values are not duplicates.
3. Every input record must have a source index or source ID.
4. Preserve raw input before normalization.
5. Keep extraction and deduplication as separate stages.
6. Represent unknown or unreadable values as `null`; never invent values.
7. Every extraction run must report source, processed, success, partial, failed, and unaccounted counts.
8. The unaccounted count must always be zero.
9. Add regression tests whenever an extraction bug is found.
