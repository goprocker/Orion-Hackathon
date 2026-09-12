import { temporaryNotFoundPage } from "@/lib/temporary-not-found";

export function proxy() {
  return new Response(temporaryNotFoundPage, {
    status: 404,
    headers: {
      "Cache-Control": "no-store",
      "Content-Type": "text/html; charset=utf-8",
      "X-Robots-Tag": "noindex, nofollow",
    },
  });
}
