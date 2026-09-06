import crypto from 'crypto';

/**
 * Generate a random 16-byte cryptographic salt in hex format.
 */
export function generateSalt(): string {
  return crypto.randomBytes(16).toString('hex');
}

/**
 * Compute SHA-256 salted hash of a password.
 */
export function hashPassword(password: string, salt: string): string {
  const normalized = password.trim().toUpperCase().replace(/\s+/g, '');
  return crypto
    .createHash('sha256')
    .update(`${salt}:${normalized}`)
    .digest('hex');
}

/**
 * Verify a candidate password against a stored salt and salted hash.
 */
export function verifyPassword(candidate: string, salt: string, expectedHash: string): boolean {
  if (!candidate || !salt || !expectedHash) return false;
  const candidateHash = hashPassword(candidate, salt);
  return crypto.timingSafeEqual(
    Buffer.from(candidateHash, 'hex'),
    Buffer.from(expectedHash, 'hex')
  );
}

/**
 * Simple AES-256-GCM string encryption for sensitive local data payloads.
 */
const SECRET_KEY = crypto.createHash('sha256').update(process.env.ADMIN_SECRET_KEY || 'orion_genesis_2026_default_salt').digest();

export function encryptText(text: string): string {
  const iv = crypto.randomBytes(12);
  const cipher = crypto.createCipheriv('aes-256-gcm', SECRET_KEY, iv);
  let encrypted = cipher.update(text, 'utf8', 'hex');
  encrypted += cipher.final('hex');
  const authTag = cipher.getAuthTag().toString('hex');
  return `${iv.toString('hex')}:${authTag}:${encrypted}`;
}

export function decryptText(encryptedPayload: string): string {
  try {
    const parts = encryptedPayload.split(':');
    if (parts.length !== 3) return encryptedPayload; // Return raw if not encrypted
    const iv = Buffer.from(parts[0], 'hex');
    const authTag = Buffer.from(parts[1], 'hex');
    const encryptedText = parts[2];
    const decipher = crypto.createDecipheriv('aes-256-gcm', SECRET_KEY, iv);
    decipher.setAuthTag(authTag);
    let decrypted = decipher.update(encryptedText, 'hex', 'utf8');
    decrypted += decipher.final('utf8');
    return decrypted;
  } catch {
    return encryptedPayload;
  }
}
