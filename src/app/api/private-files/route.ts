import { readLocalFile, verifyLocalToken } from '@/lib/privateFiles';
import { registrationApiGuard } from '@/lib/features';

export const runtime = 'nodejs';

export async function GET(request: Request) {
  const disabled = registrationApiGuard();
  if (disabled) return disabled;

  try {
    const ref = await verifyLocalToken(new URL(request.url).searchParams.get('token') || '');
    if (!ref) return new Response('Not found', { status: 404 });
    const { bytes, name } = await readLocalFile(ref);
    return new Response(new Uint8Array(bytes), { headers: {
      'Content-Type': 'application/octet-stream',
      'Content-Disposition': `attachment; filename="${name}"`,
      'Content-Security-Policy': "sandbox; default-src 'none'",
      'X-Content-Type-Options': 'nosniff',
      'Cache-Control': 'private, no-store',
      'Referrer-Policy': 'no-referrer'
    } });
  } catch { return new Response('Not found', { status: 404 }); }
}
