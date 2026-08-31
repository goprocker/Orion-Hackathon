import type { NextConfig } from "next";

// Baseline security headers. There were none, and there is no middleware, so
// /admin was framable and the portal leaked its URL (which used to carry the
// team passcode) in the Referer of every cross-origin request.
const securityHeaders = [
  // Stop the admin console being framed into a clickjacking overlay.
  { key: "X-Frame-Options", value: "DENY" },
  // Never send our URLs (or their query strings) to third-party origins.
  { key: "Referrer-Policy", value: "strict-origin-when-cross-origin" },
  // No MIME sniffing on uploaded decks served from our own origin.
  { key: "X-Content-Type-Options", value: "nosniff" },
  { key: "X-DNS-Prefetch-Control", value: "on" },
  { key: "Permissions-Policy", value: "camera=(), microphone=(), geolocation=(), interest-cohort=()" },
  {
    key: "Strict-Transport-Security",
    value: "max-age=63072000; includeSubDomains; preload",
  },
];

const nextConfig: NextConfig = {
  poweredByHeader: false,
  async headers() {
    return [
      {
        source: "/:path*",
        headers: securityHeaders,
      },
      {
        // Uploaded participant decks are attacker-supplied bytes served from
        // our own origin. Force a download rather than inline rendering, and
        // sandbox them out of the origin's script context.
        source: "/uploads/:path*",
        headers: [
          ...securityHeaders,
          { key: "Content-Disposition", value: "attachment" },
          { key: "Content-Security-Policy", value: "sandbox; default-src 'none'" },
        ],
      },
    ];
  },
};

export default nextConfig;
