import { createClient } from '@supabase/supabase-js';

// ==============================================================================
// Supabase client — SERVER ONLY
// ==============================================================================
//
// This module must never be imported from a client component. Every consumer is
// an API route or `serverStore`, which keeps the service-role key on the server.
//
// Why the service role and not the anon key: `NEXT_PUBLIC_*` variables are
// inlined into the browser bundle. Shipping the anon key meant anyone could read
// it out of the page source and talk to PostgREST directly, bypassing this app
// entirely. Combined with the old `using (true)` RLS policies that exposed every
// team's access_token, email and phone, and allowed writes to every table.
//
// The service role bypasses RLS, so policies can now deny the anon role
// outright (see src/db/migrations/002_lock_down_rls.sql). Authorisation is
// enforced in the API routes, which is where it already lived in practice.

const rawUrl = (process.env.NEXT_PUBLIC_SUPABASE_URL || '').trim();
// Tolerate a URL that includes /rest/v1 or trailing slashes.
const supabaseUrl = rawUrl.replace(/\/rest\/v1\/?$/, '').replace(/\/+$/, '');

const serviceRoleKey = (process.env.SUPABASE_SERVICE_ROLE_KEY || '').trim();
const anonKey = (process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '').trim();

// Prefer the service role. The anon key remains only as a fallback so an
// existing deployment does not go dark the moment this ships — but it will not
// work once RLS is locked down, so warn loudly.
const supabaseKey = serviceRoleKey || anonKey;
const usingAnonFallback = !serviceRoleKey && Boolean(anonKey);

if (usingAnonFallback) {
  console.warn(
    '[Supabase] SUPABASE_SERVICE_ROLE_KEY is not set — falling back to the public anon key. ' +
    'Set SUPABASE_SERVICE_ROLE_KEY (WITHOUT the NEXT_PUBLIC_ prefix) before applying ' +
    'migration 002, or every database call will start failing under the new RLS policies.'
  );
}

if (typeof window !== 'undefined') {
  // A hard signal during development if this module is ever pulled into a
  // client bundle, which would leak the service-role key to every visitor.
  throw new Error('src/lib/supabase.ts is server-only and must not be imported from a client component.');
}

export const isSupabaseConfigured = () => {
  return Boolean(
    supabaseUrl &&
    supabaseKey &&
    supabaseUrl.startsWith('https://') &&
    supabaseKey.length > 20
  );
};

/** True when running on the privileged key that bypasses RLS. */
export const isServiceRole = () => Boolean(serviceRoleKey);

export const supabase = isSupabaseConfigured()
  ? createClient(supabaseUrl, supabaseKey, {
      auth: {
        // No browser session handling is wanted for a server-side service client.
        persistSession: false,
        autoRefreshToken: false
      }
    })
  : null;
