// The first Cloudflare migration deliberately uses vinext image passthrough.
// Keep sharp installed for the existing Next.js/Vercel build, but exclude its
// native binary from the Worker bundle where it is never called.
export default {};
