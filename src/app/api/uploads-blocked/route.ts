/** Old static paths must never bypass the signed download endpoint. */
export function GET() {
  return new Response('Not found', { status: 404, headers: { 'Cache-Control': 'no-store' } });
}
