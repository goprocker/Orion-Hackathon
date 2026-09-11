import fs from 'node:fs';
import path from 'node:path';

// Prevent the historical data migrations from being regenerated into public source.
const retired = /^(012_|014_|017_|019_|020_|021_|022_|023_|025_)/;
const violations = [];
for (const name of fs.readdirSync('src/db/migrations')) {
  if (!retired.test(name)) continue;
  const text = fs.readFileSync(path.join('src/db/migrations', name), 'utf8');
  if (/\b(insert|update|delete|values)\b/i.test(text.replace(/^--.*$/gm, ''))) violations.push(name);
}
for (const name of ['import_latest_pdf_teams.mjs', 'import_pdf_roster.ts', 'update_problem_statements.ts', 'populate_local_store.js', 'generate_migration_017.js', 'test_migration_builder.js']) {
  if (!fs.readFileSync(path.join('scripts', name), 'utf8').includes('Unsafe legacy import disabled.')) violations.push(name);
}
if (violations.length) {
  console.error('Private source material may have been reintroduced:', violations.join(', '));
  process.exitCode = 1;
} else console.log('Private-data publication guard passed.');
