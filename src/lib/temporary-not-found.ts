export const temporaryNotFoundPage = String.raw`<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="robots" content="noindex, nofollow" />
    <meta name="theme-color" content="#020617" />
    <title>404 — Signal Lost | ORION 1.0</title>
    <style>
      :root {
        color-scheme: dark;
        --ink: #f8fafc;
        --muted: #94a3b8;
        --cyan: #22d3ee;
        --blue: #0078d4;
        --line: rgba(34, 211, 238, 0.24);
      }

      * { box-sizing: border-box; }

      html, body { min-height: 100%; }

      body {
        margin: 0;
        min-height: 100vh;
        display: grid;
        place-items: center;
        overflow: hidden;
        color: var(--ink);
        background:
          radial-gradient(circle at 50% 42%, rgba(0, 120, 212, 0.18), transparent 28rem),
          linear-gradient(145deg, #020617 0%, #05070d 55%, #000 100%);
        font-family: Bahnschrift, "Segoe UI Variable", "Segoe UI", sans-serif;
      }

      body::before {
        content: "";
        position: fixed;
        inset: 0;
        pointer-events: none;
        opacity: 0.35;
        background-image:
          linear-gradient(var(--line) 1px, transparent 1px),
          linear-gradient(90deg, var(--line) 1px, transparent 1px);
        background-size: 64px 64px;
        mask-image: radial-gradient(circle at center, black, transparent 72%);
      }

      main {
        position: relative;
        width: min(1100px, calc(100% - 32px));
        min-height: min(680px, calc(100vh - 32px));
        display: grid;
        grid-template-columns: 1.05fr 0.95fr;
        align-items: center;
        gap: clamp(2rem, 7vw, 6rem);
        padding: clamp(2rem, 6vw, 5rem);
        border: 1px solid rgba(148, 163, 184, 0.2);
        background: rgba(2, 6, 23, 0.72);
        box-shadow: 0 32px 100px rgba(0, 0, 0, 0.65), inset 0 1px rgba(255, 255, 255, 0.06);
        backdrop-filter: blur(20px);
      }

      main::before,
      main::after {
        content: "";
        position: absolute;
        width: 72px;
        height: 72px;
        border-color: var(--cyan);
        opacity: 0.8;
      }

      main::before { top: -1px; left: -1px; border-top: 2px solid; border-left: 2px solid; }
      main::after { right: -1px; bottom: -1px; border-right: 2px solid; border-bottom: 2px solid; }

      .eyebrow {
        display: flex;
        align-items: center;
        gap: 12px;
        margin: 0 0 28px;
        color: var(--cyan);
        font-size: 0.72rem;
        font-weight: 700;
        letter-spacing: 0.22em;
        text-transform: uppercase;
      }

      .eyebrow::before {
        content: "";
        width: 32px;
        height: 2px;
        background: var(--cyan);
        box-shadow: 0 0 16px var(--cyan);
      }

      h1 {
        margin: 0;
        font-size: clamp(4.8rem, 14vw, 10rem);
        line-height: 0.78;
        letter-spacing: -0.08em;
        background: linear-gradient(180deg, #fff 12%, #bae6fd 55%, #00bcf2 100%);
        background-clip: text;
        color: transparent;
        filter: drop-shadow(0 0 30px rgba(34, 211, 238, 0.15));
      }

      h2 {
        margin: 32px 0 12px;
        max-width: 560px;
        font-size: clamp(1.6rem, 4vw, 2.7rem);
        line-height: 1.05;
        letter-spacing: -0.04em;
      }

      .copy {
        max-width: 530px;
        margin: 0;
        color: var(--muted);
        font-size: clamp(0.95rem, 2vw, 1.08rem);
        line-height: 1.75;
      }

      .status {
        display: inline-flex;
        align-items: center;
        gap: 10px;
        margin-top: 32px;
        padding: 11px 14px;
        border: 1px solid rgba(34, 211, 238, 0.3);
        color: #bae6fd;
        background: rgba(8, 47, 73, 0.32);
        font-family: Consolas, monospace;
        font-size: 0.72rem;
        letter-spacing: 0.12em;
        text-transform: uppercase;
      }

      .pulse {
        width: 7px;
        height: 7px;
        background: var(--cyan);
        box-shadow: 0 0 16px var(--cyan);
        animation: pulse 1.8s ease-in-out infinite;
      }

      .orbit-stage {
        position: relative;
        aspect-ratio: 1;
        display: grid;
        place-items: center;
      }

      .orbit-stage::before {
        content: "ORION 1.0  /  MISSION CONTROL  /  SIST  /  ";
        position: absolute;
        top: 5%;
        right: 2%;
        color: rgba(148, 163, 184, 0.55);
        font-family: Consolas, monospace;
        font-size: 0.62rem;
        letter-spacing: 0.14em;
        writing-mode: vertical-rl;
      }

      .planet {
        position: relative;
        width: 42%;
        aspect-ratio: 1;
        border: 1px solid rgba(125, 211, 252, 0.45);
        border-radius: 50%;
        background:
          radial-gradient(circle at 35% 28%, #dff8ff 0 2%, #22d3ee 3%, #075985 23%, #020617 68%);
        box-shadow: inset -28px -18px 40px #000, 0 0 45px rgba(34, 211, 238, 0.22);
      }

      .orbit {
        position: absolute;
        width: 78%;
        height: 36%;
        border: 1px solid rgba(34, 211, 238, 0.65);
        border-radius: 50%;
        transform: rotate(-18deg);
        box-shadow: 0 0 14px rgba(34, 211, 238, 0.13);
        animation: drift 7s ease-in-out infinite;
      }

      .orbit::after {
        content: "";
        position: absolute;
        top: 48%;
        left: -4px;
        width: 8px;
        height: 8px;
        border-radius: 50%;
        background: #fff;
        box-shadow: 0 0 20px 5px var(--cyan);
      }

      .crosshair {
        position: absolute;
        inset: 8%;
        border: 1px dashed rgba(148, 163, 184, 0.22);
        border-radius: 50%;
      }

      .crosshair::before,
      .crosshair::after {
        content: "";
        position: absolute;
        inset: 50% auto auto 50%;
        background: rgba(148, 163, 184, 0.25);
        transform: translate(-50%, -50%);
      }

      .crosshair::before { width: 112%; height: 1px; }
      .crosshair::after { width: 1px; height: 112%; }

      .code {
        position: absolute;
        right: 7%;
        bottom: 12%;
        color: var(--cyan);
        font-family: Consolas, monospace;
        font-size: 0.7rem;
        letter-spacing: 0.18em;
      }

      @keyframes pulse { 50% { opacity: 0.25; transform: scale(0.72); } }
      @keyframes drift { 50% { transform: rotate(-14deg) scale(1.03); } }

      @media (max-width: 760px) {
        body { overflow: auto; }
        main {
          min-height: calc(100vh - 24px);
          width: calc(100% - 24px);
          grid-template-columns: 1fr;
          gap: 1rem;
          padding: clamp(2rem, 9vw, 3.5rem);
        }
        .content { order: 2; }
        .orbit-stage { width: min(72vw, 320px); margin: -1rem auto 0; }
        .eyebrow { margin-bottom: 20px; }
        h1 { font-size: clamp(4.6rem, 28vw, 7.5rem); }
        h2 { margin-top: 24px; }
        .orbit-stage::before { display: none; }
      }

      @media (prefers-reduced-motion: reduce) {
        .pulse, .orbit { animation: none; }
      }
    </style>
  </head>
  <body>
    <main>
      <section class="content" aria-labelledby="error-title">
        <p class="eyebrow">ORION 1.0 / Mission Control</p>
        <h1 aria-label="Error 404">404</h1>
        <h2 id="error-title">Signal temporarily lost.</h2>
        <p class="copy">
          This mission control is currently offline. Our systems will return to orbit soon—please check back later.
        </p>
        <div class="status"><span class="pulse"></span> Transmission unavailable</div>
      </section>

      <div class="orbit-stage" aria-hidden="true">
        <div class="crosshair"></div>
        <div class="orbit"></div>
        <div class="planet"></div>
        <span class="code">ERR // 404</span>
      </div>
    </main>
  </body>
</html>`;
