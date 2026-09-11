import { defineConfig } from 'vitest/config';
import { fileURLToPath } from 'node:url';

export default defineConfig({
  resolve: { alias: { '@': fileURLToPath(new URL('./src', import.meta.url)) } },
  test: { include: ['tests/**/*.test.ts'], environment: 'node', env: {
    SUPABASE_SERVICE_ROLE_KEY: '', NEXT_PUBLIC_SUPABASE_URL: '', SUPABASE_URL: '',
    NEXT_PUBLIC_SUPABASE_ANON_KEY: '', NODE_ENV: 'test'
  } }
});
