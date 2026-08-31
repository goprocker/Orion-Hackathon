// ==============================================================================
// Upload signature validation
// ==============================================================================
//
// The old check read four bytes. For .pptx those four bytes were `PK\x03\x04`,
// which is the ZIP local file header — shared by every ZIP on earth. A .jar, a
// .docx, a zip of shell scripts or a zip bomb renamed to .pptx all passed, and
// the file then went to Supabase Storage under an Office MIME type and was
// handed to jury members (and to the Google Docs viewer) as a genuine deck.
//
// A .pptx is an OOXML package, so it must contain `[Content_Types].xml` at the
// root and a `ppt/presentation.xml` part. Reading the ZIP directory is enough
// to assert that; no inflate and no dependency needed.

const ZIP_LOCAL_HEADER = 0x04034b50;
const ZIP_CENTRAL_HEADER = 0x02014b50;
const ZIP_EOCD = 0x06054b50;

/** Reads entry names from the ZIP central directory. Null if unreadable. */
function centralDirectoryNames(buf: Buffer): string[] | null {
  // The EOCD sits at the end, after a comment of at most 65535 bytes.
  const scanFloor = Math.max(0, buf.length - (22 + 0xffff));
  let eocd = -1;
  for (let i = buf.length - 22; i >= scanFloor; i--) {
    if (buf.readUInt32LE(i) === ZIP_EOCD) { eocd = i; break; }
  }
  if (eocd < 0) return null;

  const count = buf.readUInt16LE(eocd + 10);
  const cdOffset = buf.readUInt32LE(eocd + 16);
  // 0xffffffff means ZIP64; the real offset lives elsewhere. Fall through to
  // the local-header scan rather than misreading it.
  if (cdOffset === 0xffffffff || cdOffset + 46 > buf.length) return null;

  const names: string[] = [];
  let p = cdOffset;
  for (let n = 0; n < count && p + 46 <= buf.length; n++) {
    if (buf.readUInt32LE(p) !== ZIP_CENTRAL_HEADER) break;
    const nameLen = buf.readUInt16LE(p + 28);
    const extraLen = buf.readUInt16LE(p + 30);
    const commentLen = buf.readUInt16LE(p + 32);
    if (p + 46 + nameLen > buf.length) break;
    names.push(buf.toString('latin1', p + 46, p + 46 + nameLen));
    p += 46 + nameLen + extraLen + commentLen;
  }
  return names.length ? names : null;
}

/**
 * Fallback for ZIP64 and for archives whose central directory we could not
 * parse: walk the local file headers from the front. Names appear in the clear
 * even when the entry bodies are compressed.
 */
function localHeaderNames(buf: Buffer): string[] {
  const names: string[] = [];
  const limit = buf.length - 30;
  for (let p = 0; p <= limit && names.length < 2000; p++) {
    if (buf.readUInt32LE(p) !== ZIP_LOCAL_HEADER) continue;
    const nameLen = buf.readUInt16LE(p + 26);
    if (nameLen === 0 || p + 30 + nameLen > buf.length) continue;
    names.push(buf.toString('latin1', p + 30, p + 30 + nameLen));
  }
  return names;
}

function zipEntryNames(buf: Buffer): string[] {
  return centralDirectoryNames(buf) ?? localHeaderNames(buf);
}

export interface SignatureCheck {
  ok: boolean;
  reason?: string;
}

/**
 * Confirms the bytes actually are the format the extension claims.
 * `ext` is expected lowercase and already whitelisted by the caller.
 */
export function validateUploadSignature(buffer: Buffer, ext: string): SignatureCheck {
  if (buffer.length < 8) return { ok: false, reason: 'File is empty or truncated.' };

  // PDF: %PDF
  if (ext === '.pdf') {
    const isPdf = buffer[0] === 0x25 && buffer[1] === 0x50 && buffer[2] === 0x44 && buffer[3] === 0x46;
    return isPdf ? { ok: true } : { ok: false, reason: 'File is not a valid PDF document.' };
  }

  // Legacy PPT: the full 8-byte OLE2 compound-document signature, not just the
  // first four — the leading D0 CF 11 E0 alone is shared with other OLE files.
  if (ext === '.ppt') {
    const ole2 = [0xd0, 0xcf, 0x11, 0xe0, 0xa1, 0xb1, 0x1a, 0xe1];
    const isOle2 = ole2.every((b, i) => buffer[i] === b);
    return isOle2 ? { ok: true } : { ok: false, reason: 'File is not a valid PowerPoint 97-2003 (.ppt) document.' };
  }

  if (ext === '.pptx') {
    const isZip = buffer[0] === 0x50 && buffer[1] === 0x4b && buffer[2] === 0x03 && buffer[3] === 0x04;
    if (!isZip) return { ok: false, reason: 'File is not a valid PowerPoint (.pptx) document.' };

    const names = zipEntryNames(buffer);
    if (!names.length) {
      return { ok: false, reason: 'Presentation archive is unreadable or corrupt. Please re-export and try again.' };
    }

    const hasContentTypes = names.some(n => n === '[Content_Types].xml');
    const hasPresentation = names.some(n => n === 'ppt/presentation.xml');
    if (!hasContentTypes || !hasPresentation) {
      return {
        ok: false,
        // Say what is actually wrong: this fires on a .docx or a plain ZIP
        // renamed to .pptx, which is an easy honest mistake to make.
        reason: 'This is a ZIP archive but not a PowerPoint presentation. Export your deck as .pptx (or .pdf) and upload that file.'
      };
    }
    return { ok: true };
  }

  return { ok: false, reason: 'Unsupported file type.' };
}
