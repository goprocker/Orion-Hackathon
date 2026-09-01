import { NextResponse } from 'next/server';
import fs from 'fs';
import path from 'path';
import { serverStore, safeEqualCI } from '@/lib/serverStore';
import { checkRateLimit, getClientIp } from '@/lib/rateLimit';
import { supabase, isSupabaseConfigured } from '@/lib/supabase';

export async function POST(request: Request) {
  try {
    const clientIp = getClientIp(request);
    const rate = checkRateLimit(`team-pay-${clientIp}`, 15, 60 * 1000);
    if (!rate.allowed) {
      return NextResponse.json({ error: 'Too many requests. Please wait a minute.' }, { status: 429 });
    }

    const contentType = request.headers.get('content-type') || '';
    let teamId = '';
    let accessToken = '';
    let utrNumber = '';
    let payerName = '';
    let amount = 100;
    let screenshotFile: File | null = null;
    let screenshotUrl = '';

    if (contentType.includes('multipart/form-data')) {
      const formData = await request.formData();
      teamId = String(formData.get('teamId') || '');
      accessToken = String(formData.get('accessToken') || '');
      utrNumber = String(formData.get('utrNumber') || '');
      payerName = String(formData.get('payerName') || '');
      amount = Number(formData.get('amount')) || 100;
      
      const fileEntry = formData.get('screenshot');
      if (fileEntry && typeof fileEntry === 'object' && 'arrayBuffer' in fileEntry) {
        screenshotFile = fileEntry as File;
      }
      screenshotUrl = String(formData.get('screenshotUrl') || '');
    } else {
      const body = await request.json();
      teamId = body.teamId || '';
      accessToken = body.accessToken || '';
      utrNumber = body.utrNumber || '';
      payerName = body.payerName || '';
      amount = Number(body.amount) || 100;
      screenshotUrl = body.screenshotUrl || '';
    }

    if (!teamId?.trim()) {
      return NextResponse.json({ error: 'Team ID is required' }, { status: 400 });
    }
    if (!utrNumber?.trim()) {
      return NextResponse.json({ error: 'UTR / Transaction Reference Number is required' }, { status: 400 });
    }
    if (!payerName?.trim()) {
      return NextResponse.json({ error: 'Payer Name is required' }, { status: 400 });
    }

    const cleanUTR = utrNumber.trim().toUpperCase().replace(/[^A-Z0-9]/g, '');
    if (cleanUTR.length < 6 || cleanUTR.length > 30) {
      return NextResponse.json({ error: 'Invalid UTR / Transaction Reference format (6-30 alphanumeric characters)' }, { status: 400 });
    }

    // Process & Validate Mandatory Payment Screenshot Upload
    if (screenshotFile && screenshotFile.size > 0) {
      const MAX_SIZE = 10 * 1024 * 1024; // 10MB
      if (screenshotFile.size > MAX_SIZE) {
        return NextResponse.json({ error: 'Payment screenshot image file size must be less than 10 MB' }, { status: 400 });
      }

      const originalFilename = screenshotFile.name || 'receipt.png';
      const fileExt = path.extname(originalFilename).toLowerCase() || '.png';
      const validExts = ['.png', '.jpg', '.jpeg', '.webp', '.heic', '.pdf'];
      if (!validExts.includes(fileExt) && !screenshotFile.type.startsWith('image/')) {
        return NextResponse.json({ error: 'Invalid screenshot file format. Please upload an image (PNG, JPG, WEBP) or PDF receipt.' }, { status: 400 });
      }

      const buffer = Buffer.from(await screenshotFile.arrayBuffer());
      const cleanTeamSlug = teamId.replace(/[^a-zA-Z0-9_-]/g, '_');
      const timestamp = Date.now();
      const safeSavedName = `payment_${cleanTeamSlug}_${timestamp}${fileExt}`;

      let uploadedToCloud = false;
      if (isSupabaseConfigured() && supabase) {
        try {
          const mimeType = screenshotFile.type || 'image/png';
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
              screenshotUrl = pubData.publicUrl;
              uploadedToCloud = true;
            }
          } else {
            console.warn('Supabase storage upload fallback to local:', uploadErr.message);
          }
        } catch (sbErr) {
          console.warn('Supabase storage upload error, falling back to local:', sbErr);
        }
      }

      if (!uploadedToCloud) {
        const uploadDir = path.join(process.cwd(), 'public', 'uploads', 'payments');
        if (!fs.existsSync(uploadDir)) {
          fs.mkdirSync(uploadDir, { recursive: true });
        }
        const filePath = path.join(uploadDir, safeSavedName);
        fs.writeFileSync(filePath, buffer);
        screenshotUrl = `/uploads/payments/${safeSavedName}`;
      }
    }

    if (!screenshotUrl) {
      return NextResponse.json({ 
        error: 'Payment Screenshot Proof is COMPULSORY. Please select and upload your payment transaction screenshot before submitting.' 
      }, { status: 400 });
    }

    const team = await serverStore.getTeam(teamId.trim());
    if (!team) {
      return NextResponse.json({ error: 'Team not found' }, { status: 404 });
    }

    // Authentication is mandatory. It used to be skipped entirely when the
    // caller simply omitted `accessToken`, and the leader's email was accepted
    // in place of the passcode — so anyone who knew an (enumerable) team ID
    // could overwrite that team's payment reference.
    const cleanToken = String(accessToken || '').trim();
    if (!cleanToken) {
      return NextResponse.json({ error: 'Team Access Passcode is required.' }, { status: 401 });
    }

    const storedToken = (team.access_token || '').trim();
    if (!storedToken || !safeEqualCI(storedToken, cleanToken)) {
      return NextResponse.json({ error: 'Unauthorized. Invalid Team Passcode.' }, { status: 401 });
    }

    // The fee is set by the organisers, never by the caller. An unvalidated
    // client `amount` was being persisted verbatim into the payments ledger.
    const config = await serverStore.getConfig();

    const result = await serverStore.submitPayment(team.id, {
      utrNumber: cleanUTR,
      payerName: payerName.trim(),
      amount: config.round1FeeInr || amount || 100,
      screenshotUrl
    });

    if (!result.success) {
      return NextResponse.json({ error: result.error || 'Failed to submit payment' }, { status: 400 });
    }

    return NextResponse.json({
      success: true,
      message: 'Payment reference and screenshot proof submitted successfully. Organizers will verify and unlock Round 1.',
      payment: result.payment
    });

  } catch (err: unknown) {
    const msg = err instanceof Error ? err.message : 'Payment submission error';
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
