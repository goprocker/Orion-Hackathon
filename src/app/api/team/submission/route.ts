import { NextResponse } from 'next/server';
import fs from 'fs';
import path from 'path';
import { serverStore, safeEqualCI } from '@/lib/serverStore';
import { supabase, isSupabaseConfigured } from '@/lib/supabase';
import { checkRateLimit, getClientIp } from '@/lib/rateLimit';
import { validateUploadSignature } from '@/lib/fileValidation';
import { buildStorageRef, resolveFileUrl, SUBMISSIONS_BUCKET } from '@/lib/storage';

/**
 * True on a platform with an ephemeral, per-invocation filesystem. Writing a
 * participant's deck there "succeeds" and then vanishes with the container,
 * leaving a submission row pointing at a 404 that nobody notices until judging.
 */
function isServerlessRuntime(): boolean {
  return Boolean(
    process.env.VERCEL ||
    process.env.AWS_LAMBDA_FUNCTION_NAME ||
    process.env.NETLIFY ||
    process.env.K_SERVICE
  );
}

export async function POST(request: Request) {
  try {
    const clientIp = getClientIp(request);
    const rate = checkRateLimit(`team-sub-${clientIp}`, 10, 60 * 1000);
    if (!rate.allowed) {
      return NextResponse.json({ error: 'Too many upload attempts. Please wait a minute.' }, { status: 429 });
    }

    const formData = await request.formData();
    const teamId = (formData.get('teamId') as string || '').trim();
    const accessToken = (
      (formData.get('accessToken') as string) || 
      request.headers.get('x-team-token') || 
      ''
    ).trim();
    const file = formData.get('file') as File | null;
    const projectUrl = (formData.get('projectUrl') as string || '').trim();
    const repoUrl = (formData.get('repoUrl') as string || '').trim();
    const demoUrl = (formData.get('demoUrl') as string || '').trim();

    if (!teamId) {
      return NextResponse.json({ error: 'Team ID is required' }, { status: 400 });
    }

    if (!accessToken) {
      return NextResponse.json({ error: 'Team Access Passcode is required to upload submissions.' }, { status: 401 });
    }

    // 1. Verify Team Authorization
    const team = await serverStore.getTeam(teamId);
    if (!team) {
      return NextResponse.json({ error: 'Team not found' }, { status: 404 });
    }

    // Passcode only. Accepting the leader's email here let anyone who read it
    // from /api/status replace another team's Round 1 deck.
    if (!team.access_token || !safeEqualCI(team.access_token, accessToken)) {
      return NextResponse.json({ error: 'Unauthorized. Invalid Team Passcode.' }, { status: 401 });
    }

    if (!file) {
      return NextResponse.json({ error: 'Please select a PDF, PPT, or PPTX presentation file to upload' }, { status: 400 });
    }

    const config = await serverStore.getConfig();

    // 2. File Type & Extension Validation
    const originalFilename = path.basename(file.name).replace(/[^a-zA-Z0-9._-]/g, '_');
    const fileExt = path.extname(originalFilename).toLowerCase();
    const allowedExtensions = ['.pdf', '.ppt', '.pptx'];

    if (!allowedExtensions.includes(fileExt)) {
      return NextResponse.json({ 
        error: `Invalid file format "${fileExt}". Only official presentation files (.pdf, .ppt, .pptx) are accepted.` 
      }, { status: 400 });
    }

    // 3. File Size Validation
    const maxBytes = (config.maxFileSizeMb || 10) * 1024 * 1024;
    if (file.size > maxBytes) {
      return NextResponse.json({ 
        error: `File size (${(file.size / (1024 * 1024)).toFixed(1)} MB) exceeds the maximum allowed limit of ${config.maxFileSizeMb || 10} MB.` 
      }, { status: 400 });
    }

    const arrayBuf = await file.arrayBuffer();
    const buffer = Buffer.from(arrayBuf);

    // 4. File Signature Verification.
    // For .pptx this reads the ZIP directory, not just the `PK` header — the
    // header alone is true of every ZIP, so any archive passed as a deck.
    const signature = validateUploadSignature(buffer, fileExt);
    if (!signature.ok) {
      return NextResponse.json({
        error: `Security Error: ${signature.reason || 'File content does not match a genuine PDF/PowerPoint presentation.'}`
      }, { status: 400 });
    }

    // Deadline check BEFORE the storage upload: a late attempt used to upload
    // the full deck to the bucket first and only then get refused, leaving an
    // orphaned object with no submission record. (submitRound1File re-checks —
    // that stays the authority.)
    if (Date.now() > new Date(config.round1SubmissionDeadline).getTime()) {
      return NextResponse.json({
        error: `Round 1 Submission Deadline has passed (${config.round1SubmissionDeadline}). Submissions are locked.`
      }, { status: 400 });
    }

    const cleanTeamSlug = team.registration_id.replace(/[^a-zA-Z0-9_-]/g, '_');
    const timestamp = Date.now();
    const safeSavedName = `${cleanTeamSlug}_Round1_${timestamp}${fileExt}`;
    // What gets persisted is an internal reference, not a public URL — the
    // bucket is private and links are signed per request (see lib/storage.ts).
    let storedFileRef = '';

    // 5. Upload to Supabase Storage (Production Storage)
    let uploadedToCloud = false;
    let cloudError = '';
    if (isSupabaseConfigured() && supabase) {
      const objectPath = `round_1/${safeSavedName}`;
      try {
        const mimeType = fileExt === '.pdf' 
          ? 'application/pdf' 
          : fileExt === '.pptx' 
            ? 'application/vnd.openxmlformats-officedocument.presentationml.presentation' 
            : 'application/vnd.ms-powerpoint';

        const { error: uploadErr } = await supabase.storage
          .from(SUBMISSIONS_BUCKET)
          .upload(objectPath, buffer, {
            contentType: mimeType,
            upsert: true
          });

        if (!uploadErr) {
          storedFileRef = buildStorageRef(SUBMISSIONS_BUCKET, objectPath);
          uploadedToCloud = true;
        } else {
          cloudError = uploadErr.message;
          console.error('[Submission] Supabase storage upload failed:', uploadErr.message);
        }
      } catch (sbErr) {
        cloudError = sbErr instanceof Error ? sbErr.message : 'storage error';
        console.error('[Submission] Supabase storage upload error:', sbErr);
      }
    }

    // Local disk fallback. Only legitimate on a host with a durable
    // filesystem: this used to run unconditionally, so on serverless a failed
    // cloud upload silently "succeeded" into a directory that disappears.
    if (!uploadedToCloud) {
      if (isServerlessRuntime()) {
        return NextResponse.json({
          error: 'Upload storage is temporarily unavailable. Your file was NOT saved — please retry in a few minutes, and contact the organisers if it keeps failing.'
        }, { status: 503 });
      }
      if (isSupabaseConfigured() && cloudError) {
        console.warn('[Submission] Falling back to local disk after cloud failure:', cloudError);
      }

      const uploadDir = path.join(process.cwd(), 'public', 'uploads', 'submissions');
      const filePath = path.join(uploadDir, safeSavedName);
      try {
        fs.mkdirSync(uploadDir, { recursive: true });
        fs.writeFileSync(filePath, buffer);
        // Confirm the bytes really landed rather than trusting the call.
        const written = fs.statSync(filePath).size;
        if (written !== buffer.length) {
          throw new Error(`wrote ${written} of ${buffer.length} bytes`);
        }
      } catch (fsErr) {
        console.error('[Submission] Local upload write failed:', fsErr);
        return NextResponse.json({
          error: 'Could not save your presentation to storage. Your file was NOT saved — please retry, and contact the organisers if it keeps failing.'
        }, { status: 503 });
      }
      storedFileRef = `/uploads/submissions/${safeSavedName}`;
    }

    // 6. Save Submission Record
    const mimeType = file.type || (fileExt === '.pdf' ? 'application/pdf' : 'application/vnd.ms-powerpoint');
    const result = await serverStore.submitRound1File(team.id, {
      originalFilename,
      fileSize: file.size,
      fileType: mimeType,
      fileUrl: storedFileRef,
      projectUrl: projectUrl || undefined,
      repoUrl: repoUrl || undefined,
      demoUrl: demoUrl || undefined
    });

    if (!result.success) {
      return NextResponse.json({ error: result.error || 'Submission failed' }, { status: 400 });
    }

    // Hand back a signed link, never the internal reference.
    const submission = result.submission
      ? { ...result.submission, file_url: await resolveFileUrl(result.submission.file_url || '') }
      : result.submission;

    return NextResponse.json({
      success: true,
      message: 'Round 1 presentation successfully uploaded and registered for jury evaluation.',
      submission
    });

  } catch (err: unknown) {
    const msg = err instanceof Error ? err.message : 'Upload processing error';
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
