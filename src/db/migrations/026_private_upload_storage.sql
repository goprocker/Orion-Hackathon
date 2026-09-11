-- Provision private upload storage alongside the private download code.
-- No team, member, payment, or submission record is removed.
begin;

insert into storage.buckets (id, name, public) values
  ('payments', 'payments', false), ('submissions', 'submissions', false)
on conflict (id) do update set public = false;

-- Restrictive policies also close broad pre-existing permissive policies.
drop policy if exists orion_private_uploads on storage.objects;
create policy orion_private_uploads on storage.objects as restrictive for all to anon, authenticated
using (bucket_id not in ('payments', 'submissions'))
with check (bucket_id not in ('payments', 'submissions'));

commit;
