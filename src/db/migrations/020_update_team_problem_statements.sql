-- ==============================================================================
-- 020 — Update Team Problem Statements from Official PDF Roster
-- ==============================================================================
-- 
-- Updates problem_statement for all 260 existing teams based on official choices.
-- Inserts the 7 new verified teams (S0277–S0283) with payment_status = VERIFIED.
-- Apply this script in Supabase SQL Editor.

begin;

update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track (Artificial Intelligence & Machine Learning)' where registration_id = 'ORION-S0001';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0002';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0003';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track (FinTech)' where registration_id = 'ORION-S0004';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track (Sustainability / ClimateTech)' where registration_id = 'ORION-S0006';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0007';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track (Web / Mobile Development)' where registration_id = 'ORION-S0008';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0009';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track (Sustainability / ClimateTech)' where registration_id = 'ORION-S0010';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0012';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0013';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0014';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0015';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0017';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0018';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0019';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0020';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0021';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0022';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0024';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0025';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0027';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0028';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0029';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0030';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0031';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0033';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0034';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0035';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0036';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0037';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0038';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0039';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0040';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0042';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0044';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0045';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0047';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0048';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0050';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0051';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0053';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0055';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0056';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0058';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0059';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0060';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0061';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0062';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0063';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0064';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0065';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0066';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0067';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0068';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0069';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0070';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0071';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0072';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0073';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0074';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0075';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0076';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0077';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0078';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0079';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0080';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0081';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0082';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0083';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0084';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0085';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0086';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0087';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0088';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0089';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0090';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0091';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0092';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0093';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0094';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0095';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0096';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0097';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0098';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0099';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0101';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0102';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0103';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0104';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0105';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0106';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0107';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0108';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0109';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0110';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0111';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0112';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0113';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0114';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0115';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0116';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0117';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0118';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0119';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0120';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0121';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0122';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0123';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0124';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0125';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0126';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0127';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0128';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0129';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0130';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0131';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0132';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0133';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0134';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0135';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0136';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0137';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0138';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0139';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0140';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0141';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0142';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0143';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0144';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0145';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0146';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0147';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0148';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0149';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0150';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0151';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0152';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0153';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0154';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0155';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0156';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0157';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0158';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0159';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0160';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0162';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0163';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0164';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0165';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0166';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0167';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0168';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0169';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0170';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0171';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0172';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0173';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0174';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0175';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0176';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0177';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0178';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0179';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0180';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0181';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0182';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0183';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0184';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0185';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0186';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0187';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0188';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0189';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0190';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0191';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0192';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0193';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0194';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0195';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0196';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0197';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0198';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0199';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0200';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0201';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0202';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0203';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0204';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0205';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0206';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0207';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0208';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0209';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0210';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0211';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0212';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0213';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0214';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0215';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0216';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0217';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0218';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0219';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0220';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0221';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0222';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0223';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0224';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0225';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0226';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0227';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0228';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0229';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0230';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0231';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0232';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0233';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0234';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0235';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0236';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0237';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0238';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0239';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0240';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0241';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0242';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0243';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0244';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0245';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0246';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0247';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0248';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0249';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0250';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0251';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0252';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0253';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0255';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0256';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0257';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0258';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0259';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0260';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0261';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0262';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0263';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0264';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0265';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0266';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0267';
update public.teams set problem_statement = 'ORION-PS-02: LEXVAULT' where registration_id = 'ORION-S0268';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0269';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0270';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0271';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0272';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0273';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0274';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0275';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0276';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0277';
update public.teams set problem_statement = 'ORION-PS-01: FLOATCHAT' where registration_id = 'ORION-S0278';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0279';
update public.teams set problem_statement = 'ORION-PS-03: SYLVASENSE' where registration_id = 'ORION-S0280';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0281';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0282';
update public.teams set problem_statement = 'ORION-PS-04: Open Innovation Track' where registration_id = 'ORION-S0283';

-- Ensure the 7 latest squads exist with verified status

insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ca6feff2-30fd-4ea2-be68-08aa067adfe1', 'ORION-S0277', 'Mindforge', 'mindforge', 'Riyasri.P', '', 'riyasweety16024@gmail.com',
  'Er. Perumal Manimekalai College of Engineering,Hosur', 'B.Tech/ Information Technology', 'Fourth Year', 'ORION-PS-04: Open Innovation Track', 'RIYASRIP',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z'
) on conflict (registration_id) do update set
  problem_statement = 'ORION-PS-04: Open Innovation Track',
  payment_status = 'VERIFIED',
  round_1_status = 'SUBMISSION_OPEN';


insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '5a0e60da-918d-408b-95a2-e34ceca046ff', 'ORION-S0278', 'CIPHER', 'cipher', 'YOGEESHWARAN C', '', 'yogeeshwaran.c.2025.ece@rajalakshmi.edu.in',
  'RAJALAKSHMI ENGINEERING COLLEGE', 'B.E ECE', 'Second Year', 'ORION-PS-01: FLOATCHAT', 'YOGEESHWARANC',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z'
) on conflict (registration_id) do update set
  problem_statement = 'ORION-PS-01: FLOATCHAT',
  payment_status = 'VERIFIED',
  round_1_status = 'SUBMISSION_OPEN';


insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '3e64b899-1c81-419b-b230-eb95ea80d98b', 'ORION-S0279', 'IGNITE', 'ignite', 'Janani', '', 'jananijai628@gmail.com',
  'Jeppiaar Institute Technology', 'Information Technology', 'Second Year', 'ORION-PS-04: Open Innovation Track', 'JANANI2026',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z'
) on conflict (registration_id) do update set
  problem_statement = 'ORION-PS-04: Open Innovation Track',
  payment_status = 'VERIFIED',
  round_1_status = 'SUBMISSION_OPEN';


insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  'ba50384b-529c-41f2-8d21-79f67e19d6d8', 'ORION-S0280', 'ZENTRIX', 'zentrix', 'AFRINA B', '', 'afrinabasheer1111@gmail.com',
  'DR.N.G.P INSTITUTE OF TECHNOLOGY', 'B.Tech Computer Science and Business Systems', 'Third Year', 'ORION-PS-03: SYLVASENSE', 'AFRINAB2026',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z'
) on conflict (registration_id) do update set
  problem_statement = 'ORION-PS-03: SYLVASENSE',
  payment_status = 'VERIFIED',
  round_1_status = 'SUBMISSION_OPEN';


insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '586a17ac-2ea8-4305-8d5e-58b86449619d', 'ORION-S0281', 'NEXOVA', 'nexova', 'Shyam Sundar S', '', 'shyamsundar.s.2025.mech@rajalakshmi.edu.in',
  'Rajalakshmi Engineering College', 'Mechanical Engineering', 'Second Year', 'ORION-PS-04: Open Innovation Track', 'SHYAMSUNDARS',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z'
) on conflict (registration_id) do update set
  problem_statement = 'ORION-PS-04: Open Innovation Track',
  payment_status = 'VERIFIED',
  round_1_status = 'SUBMISSION_OPEN';


insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '328fecf9-c85d-4085-bfd1-764d72287dd5', 'ORION-S0282', 'Phantom', 'phantom', 'Abishek Sunil Saraswathy', '', 'abishekss2007@gmail.com',
  'Dr. MGR EDUCATION AND RESEARCH INSTITUTE', 'B-Tech (CSE DS&AI)', 'Third Year', 'ORION-PS-04: Open Innovation Track', 'ABISHEKSUNILSARASWATHY',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z'
) on conflict (registration_id) do update set
  problem_statement = 'ORION-PS-04: Open Innovation Track',
  payment_status = 'VERIFIED',
  round_1_status = 'SUBMISSION_OPEN';


insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '0286f597-3947-450d-adc5-507964d69161', 'ORION-S0283', 'Spartanzz Apex', 'spartanzzapex', 'Suriya GR', '', 'suriyaravi1926@gmail.com',
  'ADHIPARASAKTHI COLLEGE OF ENGINEERING', 'B.E.Electronics and Communication Engineering (ECE)', 'Third Year', 'ORION-PS-04: Open Innovation Track', 'SURIYAGR',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '2026-09-08T05:33:14.809Z', '2026-09-08T05:33:14.809Z'
) on conflict (registration_id) do update set
  problem_statement = 'ORION-PS-04: Open Innovation Track',
  payment_status = 'VERIFIED',
  round_1_status = 'SUBMISSION_OPEN';

commit;
