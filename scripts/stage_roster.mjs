import fs from 'node:fs/promises';
import path from 'node:path';
import crypto from 'node:crypto';
import { pathToFileURL } from 'node:url';

/** Every record survives staging, including duplicate IDs and unreadable values. */
export function stageRoster(records, source) {
  if (!Array.isArray(records)) throw new Error('Source must be a JSON array of records');
  const rows = records.map((raw, sourceIndex) => {
    const field = key => typeof raw?.[key] === 'string' && raw[key].trim() ? raw[key].trim() : null;
    const normalized = {
      registration_id: field('registration_id'), team_name: field('team_name'),
      leader_name: field('leader_name'), leader_email: field('leader_email'),
      leader_phone: field('leader_phone'), institution: field('institution'),
      department: field('department'), year: field('year'),
      problem_statement: field('problem_statement')
    };
    const validObject = raw !== null && typeof raw === 'object' && !Array.isArray(raw);
    const status = !validObject ? 'failed' : Object.values(normalized).some(value => value === null) ? 'partial' : 'success';
    // Credentials are never normalized into an import update. Raw bytes remain
    // in the private archive so even unsafe legacy fields are accounted for.
    return { source, sourceIndex, sourceId: normalized.registration_id, raw, normalized, status };
  });
  const counts = { source: rows.length, processed: rows.length, success: 0, partial: 0, failed: 0, unaccounted: 0 };
  for (const row of rows) counts[row.status]++;
  return { source, counts, rows };
}

export async function stageFile(sourcePath, outputRoot = '.data/imports') {
  const rawBytes = await fs.readFile(sourcePath);
  const run = path.join(outputRoot, crypto.randomUUID());
  await fs.mkdir(run, { recursive: true });
  // Preserve exact source before parsing or normalization, including malformed JSON.
  await fs.writeFile(path.join(run, 'source.raw'), rawBytes, { flag: 'wx', mode: 0o600 });
  try {
    const result = stageRoster(JSON.parse(rawBytes.toString('utf8')), path.resolve(sourcePath));
    await fs.writeFile(path.join(run, 'staged.json'), JSON.stringify(result, null, 2), { mode: 0o600 });
    return { run, ...result.counts };
  } catch (error) {
    const report = { run, source: 1, processed: 1, success: 0, partial: 0, failed: 1, unaccounted: 0, unit: 'unreadable source document', error: error.message };
    await fs.writeFile(path.join(run, 'failure.json'), JSON.stringify(report, null, 2), { mode: 0o600 });
    return report;
  }
}

if (process.argv[1] && import.meta.url === pathToFileURL(path.resolve(process.argv[1])).href) {
  if (!process.argv[2]) throw new Error('Usage: node scripts/stage_roster.mjs <private-source.json>');
  const report = await stageFile(process.argv[2]);
  console.log(JSON.stringify(report));
  if (report.failed) process.exitCode = 1;
}
