-- ==============================================================================
-- ORION 1.0 - Migration 017: SHORTLIST TECH TITANS (DEEKSHITHP)
-- ==============================================================================
--
-- Marks squad TECHTITANS led by Deekshith P (ORION-S0020) as Phase 3
-- shortlisted / selected for the 24H Offline Grand Finale:
--   - payment_status = 'VERIFIED'
--   - round_1_status = 'SELECTED'
--   - round_2_status = 'ACCESS_GRANTED'
--   - round_1_score  = 48
--
-- Safe to re-run.
-- ------------------------------------------------------------------------------

update public.teams
set payment_status = 'VERIFIED',
    round_1_status = 'SELECTED',
    round_2_status = 'ACCESS_GRANTED',
    round_1_score  = 48,
    admin_notes    = 'Shortlisted for Round 2 24H Offline Finale.',
    updated_at     = now()
where lower(username) = 'techtitans'
  and lower(access_token) = 'deekshithp';

update public.teams
set payment_status = 'VERIFIED',
    round_1_status = 'SELECTED',
    round_2_status = 'ACCESS_GRANTED',
    round_1_score  = 48,
    admin_notes    = 'Shortlisted for Round 2 24H Offline Finale.',
    updated_at     = now()
where registration_id = 'ORION-S0020';
