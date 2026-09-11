import { NextResponse } from 'next/server';
import path from 'path';
import { serverStore, safeEqualCI } from '@/lib/serverStore';
import { checkRateLimit, getClientIp } from '@/lib/rateLimit';
import { validateUploadSignature } from '@/lib/fileValidation';
import { resolveFileUrl } from '@/lib/storage';
import { storePrivateFile, deletePrivateFile } from '@/lib/privateFiles';
import { submissionEligibilityError } from '@/lib/submissionPolicy';
import { registrationApiGuard } from '@/lib/features';

export async function POST(request: Request) {
  const disabled = registrationApiGuard();
  if (disabled) return disabled;

  let allocatedFile = '';
  let committed = false;
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
    const eligibilityError = submissionEligibilityError(team, config);
    if (eligibilityError) return NextResponse.json({ error: eligibilityError }, { status: 403 });

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

    const mimeType = fileExt === '.pdf' ? 'application/pdf' : fileExt === '.pptx'
      ? 'application/vnd.openxmlformats-officedocument.presentationml.presentation'
      : 'application/vnd.ms-powerpoint';
    allocatedFile = await storePrivateFile('submissions', fileExt, buffer, mimeType);

    // 6. Save Submission Record
    const result = await serverStore.submitRound1File(team.id, {
      originalFilename,
      fileSize: file.size,
      fileType: mimeType,
      fileUrl: allocatedFile,
      projectUrl: projectUrl || undefined,
      repoUrl: repoUrl || undefined,
      demoUrl: demoUrl || undefined
    });

    committed = result.success || Boolean(result.fileCommitted);
    if (!result.success) {
      return NextResponse.json({ error: result.error || 'Submission failed' }, { status: 400 });
    }

    committed = true;
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
    console.error('[Submission] Upload failed', err);
    const msg = 'Could not save your presentation. Please retry or contact the organisers.';
    return NextResponse.json({ error: msg }, { status: 500 });
  } finally {
    if (allocatedFile && !committed) {
      await deletePrivateFile(allocatedFile).catch(error => console.error('[Submission] Upload cleanup failed', error));
    }
  }
}
