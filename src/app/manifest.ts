import { MetadataRoute } from 'next';

export default function manifest(): MetadataRoute.Manifest {
  return {
    name: 'ORION 1.0 — 24H National Level Hackathon',
    short_name: 'ORION 1.0',
    description: 'Premier 24-hour national hackathon organized by Microsoft Club SIST at Sathyabama Institute of Science and Technology, Chennai. ₹1,00,000 Prize Pool.',
    start_url: '/',
    display: 'standalone',
    background_color: '#05070D',
    theme_color: '#0078D4',
    orientation: 'portrait-primary',
    categories: ['education', 'technology', 'events'],
    icons: [
      {
        src: '/icon.png',
        sizes: '512x512',
        type: 'image/png',
        purpose: 'any',
      },
      {
        src: '/logo.png',
        sizes: '1024x1024',
        type: 'image/png',
        purpose: 'maskable',
      },
    ],
  };
}
