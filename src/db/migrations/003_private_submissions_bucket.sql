-- ============================================================================
-- 003 — Make the submissions storage bucket private
-- ============================================================================
--
-- Round 1 decks were served from a PUBLIC bucket, so every object URL was a
-- permanent, credential-free link to an unpublished student project. Anyone
-- who obtained one (a forwarded mail, browser history, a screenshot of the
-- admin console) kept access forever, and the object path is largely
-- predictable: round_1/<REGISTRATION_ID>_Round1_<epoch_ms>.<ext>.
--
-- The app now stores an internal reference (sb://submissions/<path>) and mints
-- a one-hour signed URL per authorised read (src/lib/storage.ts), so the
-- bucket no longer needs to be public.
--
-- Run this AFTER deploying the application code that signs URLs — otherwise
-- existing links stop resolving. Legacy rows that still hold a public URL are
-- recognised and signed too, so no data backfill is required.
--
-- Apply in the Supabase SQL editor as the project owner.

-- 1. Flip the bucket to private. Existing public URLs stop working immediately.
update storage.buckets
set public = false
where id = 'submissions';

-- 2. Drop any storage policy that grants access to this bucket. The server
--    uses the service-role key, which bypasses RLS entirely, so nothing the
--    application does depends on these.
do $$
declare
  pol record;
begin
  for pol in
    select policyname
    from pg_policies
    where schemaname = 'storage'
      and tablename = 'objects'
      and (coalesce(qual, '') like '%submissions%' or coalesce(with_check, '') like '%submissions%')
  loop
    execute format('drop policy if exists %I on storage.objects', pol.policyname);
  end loop;
end $$;

-- 3. RLS must be on for the remaining policies (if any) to be enforced.
alter table storage.objects enable row level security;

-- 4. Verify: expect public = false and zero submissions policies.
--   select id, public from storage.buckets where id = 'submissions';
--   select policyname, qual from pg_policies
--     where schemaname = 'storage' and tablename = 'objects';
