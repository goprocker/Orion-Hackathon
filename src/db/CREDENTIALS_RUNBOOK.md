# Roster data handling

Participant rosters and credentials must not be embedded in migrations or source files.
Historical raw files are preserved in the ignored operator archive, with SHA-256 checksums.
Do not rerun archived mutators: some reset credentials or discard source rows.

Run `node scripts/stage_roster.mjs <private-source.json>` to preserve raw input and
produce an indexed, fully accounted staging report under `.data/imports/`.
Repeated fields and IDs remain separate records. Unknown values remain null.
Deduplication and database application require a separately reviewed mapping.
Never update existing access tokens as part of a roster import.

Portal authentication changes and credential rotation are deferred by the owner.
See `SECURITY_REMEDIATION.md` for scope, validation, and rollout requirements.
