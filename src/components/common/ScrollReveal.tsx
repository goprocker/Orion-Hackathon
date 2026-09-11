'use client';

import React, { useEffect, useRef, useState } from 'react';

interface ScrollRevealProps {
  children: React.ReactNode;
  direction?: 'up' | 'down' | 'left' | 'right' | 'zoom' | 'fade';
  delay?: number;
  duration?: number;
  className?: string;
  threshold?: number;
  once?: boolean;
}

export const ScrollReveal: React.FC<ScrollRevealProps> = ({
  children,
  direction = 'up',
  delay = 0,
  duration = 600,
  className = '',
  threshold = 0.15,
  once = true,
}) => {
  const [isVisible, setIsVisible] = useState(() => {
    if (typeof window !== 'undefined') {
      return window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    }
    return false;
  });
  const domRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (isVisible && once) return;

    const currentTarget = domRef.current;
    if (!currentTarget) return;

    const checkVisibility = () => {
      if (document.visibilityState === 'hidden') return false;
      const viewportHeight = document.documentElement.clientHeight || window.innerHeight;
      if (viewportHeight <= 0) return false;
      const rect = currentTarget.getBoundingClientRect();
      const visibleHeight = Math.min(rect.bottom, viewportHeight) - Math.max(rect.top, 0);
      const visibleRatio = rect.height > 0 ? visibleHeight / rect.height : 0;
      return visibleRatio >= threshold;
    };

    // Elements already in the viewport on mount can miss the
    // IntersectionObserver's first callback — notably when the tab starts
    // out backgrounded/prerendered (its intersection root is then 0x0) — which
    // left above-the-fold content stuck at opacity 0. Check synchronously here,
    // and again once the tab actually becomes visible, as a fallback.
    if (checkVisibility()) {
      setIsVisible(true);
      if (once) return;
    }

    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setIsVisible(true);
          if (once && domRef.current) {
            observer.unobserve(domRef.current);
          }
        } else if (!once) {
          setIsVisible(false);
        }
      },
      { threshold }
    );

    observer.observe(currentTarget);

    const handleVisibilityChange = () => {
      if (document.visibilityState === 'visible' && checkVisibility()) {
        setIsVisible(true);
        if (once) observer.unobserve(currentTarget);
      }
    };
    document.addEventListener('visibilitychange', handleVisibilityChange);

    return () => {
      observer.unobserve(currentTarget);
      document.removeEventListener('visibilitychange', handleVisibilityChange);
    };
  }, [threshold, once, isVisible]);

  const getTransformStyle = () => {
    if (isVisible) return 'translate3d(0, 0, 0) scale(1)';

    switch (direction) {
      case 'up':
        return 'translate3d(0, 32px, 0) scale(0.99)';
      case 'down':
        return 'translate3d(0, -32px, 0) scale(0.99)';
      case 'left':
        return 'translate3d(32px, 0, 0) scale(0.99)';
      case 'right':
        return 'translate3d(-32px, 0, 0) scale(0.99)';
      case 'zoom':
        return 'translate3d(0, 0, 0) scale(0.94)';
      case 'fade':
      default:
        return 'translate3d(0, 0, 0) scale(1)';
    }
  };

  return (
    <div
      ref={domRef}
      className={`will-change-transform ${className}`}
      style={{
        opacity: isVisible ? 1 : 0,
        transform: getTransformStyle(),
        transitionProperty: 'opacity, transform',
        transitionDuration: `${duration}ms`,
        transitionTimingFunction: 'cubic-bezier(0.16, 1, 0.3, 1)',
        transitionDelay: `${delay}ms`,
      }}
    >
      {children}
    </div>
  );
};

export default ScrollReveal;
