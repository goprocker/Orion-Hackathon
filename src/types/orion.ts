export interface ProblemStatement {
  id: string;
  code: string;
  title: string;
  tagline: string;
  domain: string;
  accentColor: 'cyan' | 'violet' | 'emerald';
  visualTheme: string;
  overview: string;
  keyFeatures: string[];
  techStack: string[];
  deliverables: string[];
  datasetSources: string[];
  evaluationFocus: string[];
  classificationLevel: string;
}

export interface FAQItem {
  question: string;
  answer: string;
  category: 
    | 'General' 
    | 'Fees & Teams' 
    | 'Submissions' 
    | 'Finale & Logistics'
    | 'Eligibility & Squads'
    | 'Round 1 & Submissions'
    | 'Finale & Fees'
    | 'Hospitality & Venue';
}

export interface PatronProfile {
  name: string;
  title: string;
  organization: string;
  roleType: 'Chief Patron' | 'Academic Patron' | 'Convenor' | 'Club Lead' | 'Event Organizer';
  initials: string;
  avatarColor: string;
  bio?: string;
}

export interface OfficeBearer {
  name: string;
  title: string;
  department: string;
  phone: string;
  initials: string;
  organization: string;
}

export type EventOrganizer = OfficeBearer;

export interface TimelinePhase {
  number: string;
  title: string;
  subtitle: string;
  date: string;
  status: 'active' | 'upcoming' | 'completed';
  highlights: string[];
}

export type PaymentStatus = 
  | 'NOT_SUBMITTED'
  | 'PENDING'
  | 'VERIFIED'
  | 'REJECTED'
  | 'RESUBMISSION_REQUIRED';

export type Round1Status = 
  | 'NOT_STARTED'
  | 'SUBMISSION_OPEN'
  | 'SUBMITTED'
  | 'UNDER_REVIEW'
  | 'SELECTED'
  | 'NOT_SELECTED';

export type Round2Status = 
  | 'LOCKED'
  | 'ACCESS_GRANTED'
  | 'CONFIRMED_FINALIST';

export interface TeamMember {
  id?: string;
  team_id?: string;
  member_number: number;
  member_name: string;
  member_email?: string;
  member_phone: string;
  department?: string;
  year?: string;
}

export interface SuspicionFlag {
  id: string;
  team_id: string;
  flag_type: 'DUPLICATE_EMAIL' | 'DUPLICATE_PHONE' | 'DUPLICATE_UTR' | 'CROSS_TEAM_PARTICIPANT' | 'SUSPICIOUS_DATA';
  description: string;
  severity: 'LOW' | 'MEDIUM' | 'HIGH';
  matched_value: string;
  matched_team_id?: string;
  created_at: string;
}

export interface PaymentRecord {
  id: string;
  team_id: string;
  utr_number: string;
  payer_name: string;
  /** UPI ID the fee was paid from. Mandatory on new submissions; null on rows predating migration 007. */
  payer_upi?: string | null;
  amount: number;
  payment_status: PaymentStatus;
  screenshot_url?: string | null;
  notes?: string;
  rejection_reason?: string;
  submitted_at: string;
  verified_at?: string | null;
  verified_by?: string | null;
}

/**
 * ACCEPTED    — the live deck the jury will evaluate. A team's first upload is
 *               auto-accepted once payment is VERIFIED; an approved re-upload
 *               replaces it.
 * SUPERSEDED  — an earlier deck replaced by an approved re-upload. Kept for the
 *               audit trail, never evaluated.
 */
export type SubmissionStatus =
  | 'SUBMITTED'
  | 'ACCEPTED'
  | 'SUPERSEDED'
  | 'UNDER_REVIEW'
  | 'EVALUATED';

export interface SubmissionRecord {
  id: string;
  team_id: string;
  round_number: 1 | 2;
  file_url: string;
  original_filename: string;
  file_size: number;
  file_type: string;
  version: number;
  submission_status: SubmissionStatus;
  submitted_at: string;
  review_notes?: string;
  project_url?: string | null;
  repo_url?: string | null;
  demo_url?: string | null;
}

/**
 * PENDING  — team has asked to replace their deck; awaiting an organiser.
 * APPROVED — organiser said yes; unlocks exactly ONE re-upload.
 * REJECTED — organiser said no; the existing deck stands.
 * USED     — the approved re-upload has been spent.
 */
export type ResubmissionRequestStatus = 'PENDING' | 'APPROVED' | 'REJECTED' | 'USED';

export interface ResubmissionRequest {
  id: string;
  team_id: string;
  round_number: number;
  /** Why the team wants to replace their deck. */
  reason: string;
  status: ResubmissionRequestStatus;
  /** Organiser's note attached on approve or reject. */
  review_notes?: string | null;
  reviewed_by?: string | null;
  reviewed_at?: string | null;
  /** Set when the team spends the approval on an actual upload. */
  consumed_at?: string | null;
  consumed_submission_id?: string | null;
  created_at: string;
}

export interface AuditLogRecord {
  id: string;
  team_id?: string | null;
  team_name?: string | null;
  action: string;
  actor: string;
  details?: string | null;
  created_at: string;
}

/**
 * A pending self-service passcode reset.
 *
 * `token_hash` is the SHA-256 of the emailed token — the raw value is never
 * persisted, so this record cannot be replayed into a portal login by anyone
 * reading the database. Single use is enforced by setting `consumed_at` under
 * a `consumed_at is null` guard.
 */
export interface PasswordResetRecord {
  id: string;
  team_id: string;
  token_hash: string;
  expires_at: string;
  consumed_at?: string | null;
  requested_ip?: string | null;
  created_at: string;
}

export interface EvaluationScores {
  innovation: number;    // 0-10 Technical Innovation & Novelty
  architecture: number;  // 0-10 System Architecture & Tech Depth
  impact: number;        // 0-10 Problem Relevance & Real-World Impact
  execution: number;     // 0-10 Implementation & PPT / Demo Quality
  feasibility: number;   // 0-10 Feasibility & 24H Sprint Roadmap
  total: number;         // 0-50 Total Score
  evaluatedAt?: string;
  evaluatedBy?: string;
}

export interface TeamRecord {
  id: string;
  registration_id: string; // e.g. ORION-2026-0147
  team_name: string;
  leader_name: string;
  leader_phone: string;
  leader_email: string;
  institution: string;
  department?: string;
  year?: string;
  problem_statement: string;
  access_token: string; // Secure passcode for team portal
  payment_status: PaymentStatus;
  payment?: PaymentRecord | null;
  amount: number;
  registration_status: 'REGISTERED' | 'PENDING' | 'REJECTED';
  round_1_status: Round1Status;
  round_2_status: Round2Status;
  round_1_score?: number | null;
  evaluation_scores?: EvaluationScores | null;
  admin_notes?: string | null;
  suspicion_flags?: SuspicionFlag[];
  members: TeamMember[];
  submissions?: SubmissionRecord[];
  resubmission_requests?: ResubmissionRequest[];
  audit_logs?: AuditLogRecord[];
  created_at: string;
  updated_at?: string;
}

export interface RegisteredTeam {
  teamId: string;
  teamName: string;
  leaderName: string;
  leaderEmail: string;
  institution: string;
  track: string;
  membersCount: number;
  status: string;
  registrationDate: string;
  members?: TeamMember[];
  paymentStatus?: PaymentStatus | 'SUCCESS' | 'FAILED' | 'REFUNDED';
  paymentId?: string;
  orderId?: string;
  round1Status?: Round1Status;
  round2Status?: Round2Status;
}

export interface TeamRegistrationPayload {
  teamName: string;
  leaderName: string;
  leaderPhone: string;
  leaderEmail: string;
  institution: string;
  department?: string;
  year?: string;
  problemStatement: string;
  members: { 
    name: string; 
    email?: string; 
    phone: string; 
    department?: string; 
    year?: string; 
  }[];
  declarations?: {
    accurateInfo: boolean;
    membersBelong: boolean;
    rulesAgreed: boolean;
    feeUnderstood: boolean;
    qualifierUnderstood: boolean;
  };
}

export interface SystemConfig {
  registrationOpen: boolean;
  round1SubmissionDeadline: string; // ISO string
  allowRound1Resubmission: boolean;
  maxFileSizeMb: number;
  upiId: string;
  upiPayeeName: string;
  upiQrCodeUrl: string;
  round1FeeInr: number;
  finalistFeeInr: number;
}

export interface StarNodeData {
  name: string;
  coords: [number, number, number];
  role: string;
  designation: string;
  distance: string;
  apparentMagnitude: string;
  size: number;
  color: string;
}

export interface MicrosoftTech {
  id: string;
  name: string;
  category: string;
  description: string;
  capabilities: string[];
  icon: string;
  badge: string;
  accent: string;
}

export interface JudgingCriterion {
  number: string;
  name: string;
  weight: number;
  weightLabel: string;
  description: string;
  keyFactors: string[];
  color: string;
}
