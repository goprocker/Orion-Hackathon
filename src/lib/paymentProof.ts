import fs from 'fs';
import path from 'path';
import { supabase, isSupabaseConfigured } from './supabase';

/**
 * Validate and store a payment receipt screenshot, returning the URL to put in
 * payments.screenshot_url. Shared by the participant payment route and the
 * admin RECORD_PAYMENT action (the WhatsApp-proof workflow).
 *
 * Storage preference: Supabase 'payments' bucket if it exists, then local
 * filesystem (dev), then an inline data: URL — which keeps receipts inside the
 * database, readable only through the admin console (see migration 006 on why
 * a public bucket is deliberately NOT created).
 */
export async function storePaymentScreenshot(
  file: File,
  teamId: string
): Promise<{ url?: string; error?: string }> {
  const MAX_SIZE = 10 * 1024 * 1024; // 10MB
  if (file.size > MAX_SIZE) {
    return { error: 'Payment screenshot image file size must be less than 10 MB' };
  }

  const originalFilename = file.name || 'receipt.png';
  const fileExt = path.extname(originalFilename).toLowerCase() || '.png';
  const validExts = ['.png', '.jpg', '.jpeg', '.webp', '.heic', '.pdf'];
  if (!validExts.includes(fileExt) && !file.type.startsWith('image/')) {
    return { error: 'Invalid screenshot file format. Please upload an image (PNG, JPG, WEBP) or PDF receipt.' };
  }

  const buffer = Buffer.from(await file.arrayBuffer());
  const cleanTeamSlug = teamId.replace(/[^a-zA-Z0-9_-]/g, '_');
  const safeSavedName = `payment_${cleanTeamSlug}_${Date.now()}${fileExt}`;

  if (isSupabaseConfigured() && supabase) {
    try {
      const mimeType = file.type || 'image/png';
      const { error: uploadErr } = await supabase.storage
        .from('payments')
        .upload(`receipts/${safeSavedName}`, buffer, {
          contentType: mimeType,
          upsert: true
        });

      if (!uploadErr) {
        const { data: pubData } = supabase.storage
          .from('payments')
          .getPublicUrl(`receipts/${safeSavedName}`);
        if (pubData?.publicUrl) {
          return { url: pubData.publicUrl };
        }
      } else {
        console.warn('Supabase storage upload fallback to local:', uploadErr.message);
      }
    } catch (sbErr) {
      console.warn('Supabase storage upload error, falling back to local:', sbErr);
    }
  }

  try {
    const uploadDir = path.join(process.cwd(), 'public', 'uploads', 'payments');
    if (!fs.existsSync(uploadDir)) {
      fs.mkdirSync(uploadDir, { recursive: true });
    }
    fs.writeFileSync(path.join(uploadDir, safeSavedName), buffer);
    return { url: `/uploads/payments/${safeSavedName}` };
  } catch (fsErr) {
    console.warn('Serverless filesystem write failed, encoding screenshot as Data URL:', fsErr);
    const mime = file.type || (fileExt === '.pdf' ? 'application/pdf' : 'image/png');
    return { url: `data:${mime};base64,${buffer.toString('base64')}` };
  }
}
