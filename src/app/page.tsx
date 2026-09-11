import { PublicHome } from '@/components/home/PublicHome';
import { features } from '@/lib/features';

export default function Home() {
  return <PublicHome registrationEnabled={features.registration} />;
}
