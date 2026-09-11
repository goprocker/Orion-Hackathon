import fs from 'node:fs';
import path from 'node:path';
import { describe, expect, it } from 'vitest';

const root = path.resolve(__dirname, '..');
const read = (relativePath: string) => fs.readFileSync(path.join(root, relativePath), 'utf8');

describe('bandwidth-conscious polling', () => {
  it('refreshes the admin overview at most once a minute and only while visible', () => {
    const source = read('src/app/admin/page.tsx');
    expect(source).toContain('60_000');
    expect(source).toContain("document.visibilityState === 'visible'");
    expect(source).toContain("window.addEventListener('focus'");
    expect(source).toContain("document.addEventListener('visibilitychange'");
    expect(source).toContain('fetchInFlightRef.current');
    expect(source).not.toContain('}, 6000)');
  });

  it('uses state-sensitive portal intervals and suspends hidden-tab polling', () => {
    const source = read('src/app/portal/page.tsx');
    expect(source).toContain('30_000');
    expect(source).toContain('120_000');
    expect(source).toContain("['PENDING', 'RESUBMISSION_REQUIRED']");
    expect(source).toContain("['SUBMITTED', 'UNDER_REVIEW']");
    expect(source).toContain("request.status === 'PENDING'");
    expect(source).toContain("document.visibilityState === 'visible'");
    expect(source).toContain("window.addEventListener('focus'");
    expect(source).toContain('refreshInFlightRef.current');
    expect(source).not.toContain('}, 8000)');
  });

  it('defers the below-the-fold Three.js trophy until it nears the viewport', () => {
    const source = read('src/components/sections/PrizeSection.tsx');
    expect(source).toContain('IntersectionObserver');
    expect(source).toContain("rootMargin: '400px 0px'");
    expect(source).toContain('shouldLoadTrophy && <Trophy3D');
  });
});
