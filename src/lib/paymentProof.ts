import path from 'node:path';
import { storePrivateFile } from './privateFiles';

export function receiptContentType(bytes: Buffer, extension: string): string | null {
  if (extension === '.pdf' && bytes.subarray(0, 5).toString() === '%PDF-') return 'application/pdf';
  if (extension === '.png' && bytes.subarray(0, 8).equals(Buffer.from('89504e470d0a1a0a', 'hex'))) return 'image/png';
  if (['.jpg', '.jpeg'].includes(extension) && bytes[0] === 0xff && bytes[1] === 0xd8 && bytes[2] === 0xff) return 'image/jpeg';
  if (extension === '.webp' && bytes.subarray(0, 4).toString() === 'RIFF' && bytes.subarray(8, 12).toString() === 'WEBP') return 'image/webp';
  return null;
}

/** Call only after authentication. Client-provided MIME types are not trusted. */
export async function storePaymentScreenshot(file: File, teamId: string): Promise<{ url?: string; error?: string }> {
  if (!teamId.trim()) return { error: 'Team ID is required.' };
  if (!file.size || file.size > 10 * 1024 * 1024) return { error: 'Receipt must be between 1 byte and 10 MB.' };
  const buffer = Buffer.from(await file.arrayBuffer());
  const extension = path.extname(file.name).toLowerCase();
  const contentType = receiptContentType(buffer, extension);
  if (!contentType) return { error: 'Upload a genuine PNG, JPG, WEBP image or PDF receipt.' };
  try { return { url: await storePrivateFile('payments', extension, buffer, contentType) }; }
  catch { return { error: 'Private receipt storage is unavailable. Please retry or contact the organisers.' }; }
}
