import { MetadataRoute } from 'next';
import { PORTAL_ENABLED } from '@/data/orionData';

export default function sitemap(): MetadataRoute.Sitemap {
  const baseUrl = 'https://orion.sathyabama.ac.in';
  const currentDate = new Date().toISOString();

  const entries: MetadataRoute.Sitemap = [
    {
      url: `${baseUrl}/`,
      lastModified: currentDate,
      changeFrequency: 'daily',
      priority: 1.0,
    },
  ];

  if (PORTAL_ENABLED) {
    entries.push({
      url: `${baseUrl}/portal`,
      lastModified: currentDate,
      changeFrequency: 'hourly',
      priority: 0.8,
    });
  }

  return entries;
}
