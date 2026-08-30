import { MetadataRoute } from 'next';

export default function robots(): MetadataRoute.Robots {
  const baseUrl = 'https://orion.sathyabama.ac.in';

  return {
    rules: [
      {
        userAgent: '*',
        allow: ['/', '/portal'],
        disallow: ['/admin', '/api/'],
      },
      {
        userAgent: 'Googlebot',
        allow: ['/', '/portal'],
        disallow: ['/admin', '/api/'],
      },
    ],
    sitemap: `${baseUrl}/sitemap.xml`,
    host: baseUrl,
  };
}
