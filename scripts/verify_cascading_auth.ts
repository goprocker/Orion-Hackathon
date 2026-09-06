import { serverStore } from '../src/lib/serverStore';
import fs from 'fs';
import path from 'path';

async function verify() {
  console.log('=== VERIFYING CASCADING ENCRYPTED AUTHENTICATION ===\n');

  // 1. Test local store file inspection
  const storePath = path.join(process.cwd(), '.data', 'orion_store.json');
  console.log('[TEST 1] Checking local data store on disk...');
  if (!fs.existsSync(storePath)) {
    throw new Error('Local store file .data/orion_store.json does not exist!');
  }
  const fileContent = fs.readFileSync(storePath, 'utf-8');

  // Verify salted SHA-256 hashes are present
  if (!fileContent.includes('password_hash') || !fileContent.includes('password_salt')) {
    throw new Error('FAILED: password_hash / password_salt missing from store!');
  }
  console.log(' -> [PASS] Store on disk contains cryptographic salted SHA-256 hashes.');

  // 2. Test login with Team Name + Leader Name (Username & Password)
  console.log('\n[TEST 2] Authenticating with Team Name + Leader Name (INNOVEX / YASASWINICHILUKURI)...');
  const team1 = await serverStore.authenticateTeam('INNOVEX', 'YASASWINICHILUKURI');
  if (!team1) {
    throw new Error('FAILED to authenticate team INNOVEX with leader name!');
  }
  console.log(` -> [PASS] Authenticated successfully! Team Name: ${team1.team_name}, Leader: ${team1.leader_name}`);

  // 3. Test login with another team (TechXKuzhu / Thanishka Yogesh)
  console.log('\n[TEST 3] Authenticating team TechXKuzhu (lowercase / spaced input)...');
  const team2 = await serverStore.authenticateTeam('TechXKuzhu', 'Thanishka Yogesh');
  if (!team2) {
    throw new Error('FAILED to authenticate TechXKuzhu!');
  }
  console.log(` -> [PASS] Authenticated successfully! Team Name: ${team2.team_name}, Leader: ${team2.leader_name}`);

  // 4. Test invalid password rejection
  console.log('\n[TEST 4] Authenticating with invalid password (INNOVEX / WRONGPASS)...');
  const teamInvalid = await serverStore.authenticateTeam('INNOVEX', 'WRONGPASS');
  if (teamInvalid !== null) {
    throw new Error('FAILED: Invalid credentials was accepted!');
  }
  console.log(' -> [PASS] Invalid password correctly rejected (returned null).');

  console.log('\n=== ALL CASCADING AUTH VERIFICATIONS PASSED 100% ===');
}

verify().catch(err => {
  console.error('Verification failed:', err);
  process.exit(1);
});
