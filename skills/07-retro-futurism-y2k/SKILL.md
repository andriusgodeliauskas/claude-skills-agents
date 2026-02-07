---
name: frontend-retro-futurism
description: Create nostalgic Retro-Futuristic and Y2K Revival interfaces with chrome effects, gradient meshes, bubbly shapes, and turn-of-millennium aesthetics remixed for 2026. Use when user asks for retro-futuristic, Y2K, 2000s, chrome, iridescent, bubbly, nostalgic, vapor, or maximal UI. Ideal for fashion, music, social media, entertainment, youth brands, creative tools, and pop culture platforms.
---

# Retro-Futurism / Y2K Revival Design System

Create interfaces that channel the optimistic tech dreams of 1999–2005, remixed with 2026 sophistication. Chrome effects, gradient meshes, bubbly 3D shapes, and the irresistible nostalgia of early internet culture.

## Core Aesthetic Philosophy

**The Feel**: Flipping through a Y2K Vogue issue while listening to Daft Punk on a transparent iMac. Tech was supposed to be fun, shiny, and a little ridiculous. This design celebrates that joyful maximalism.

**Mood Keywords**: Nostalgic, chrome, bubbly, iridescent, playful, maximalist, optimistic, shiny

## Typography

- **Display**: `'Archivo Black', 'Bungee', 'Rubik Mono One'` — thick, bold, statement fonts
- **Body**: `'Space Grotesk', 'Rubik', 'Nunito Sans'` — rounded, friendly
- **Decorative**: `'Press Start 2P', 'Silkscreen'` — pixel fonts for accents
- **Treatment**: Mixed sizes dramatically. Giant headlines next to tiny body. Bubble-letter feel
- **Sizes**: Hero at `clamp(4rem, 12vw, 10rem)` — OVERSIZED
- Import: `Archivo Black`, `Space Grotesk`, `Rubik`, `Press Start 2P`

## Color System

Iridescent, gradient-heavy, bold:

```css
:root {
  /* Backgrounds */
  --bg-lavender: #e8dff5;
  --bg-baby-blue: #d4e9ff;
  --bg-bubblegum: #ffd4e8;
  --bg-silver: #e8e8ec;
  --bg-chrome: linear-gradient(135deg, #c0c0c8, #e8e8f0, #c0c0c8);

  /* Y2K Gradient Mesh */
  --gradient-y2k: linear-gradient(135deg, #ff6bca, #c66bff, #6bb5ff, #6bffc6);
  --gradient-chrome: linear-gradient(135deg, #d4d4d8, #fafafa, #a1a1aa, #e4e4e7, #d4d4d8);
  --gradient-holographic: linear-gradient(135deg, #ff9cf5, #b8a9ff, #94d3ff, #b8ffcf, #ffd694);
  --gradient-sunset: linear-gradient(135deg, #ff6b9d, #ffa07a, #ffd700);

  /* Accent colors */
  --y2k-pink: #ff6bca;
  --y2k-purple: #c66bff;
  --y2k-blue: #6bb5ff;
  --y2k-lime: #b8ff6b;
  --y2k-orange: #ff9f43;
  --y2k-chrome: #c0c0d0;

  /* Text */
  --text-dark: #1a1a2e;
  --text-medium: #4a4a6a;
  --text-light: #8a8aaa;

  /* Shadows — soft, colorful, layered */
  --shadow-y2k: 0 8px 30px rgba(198, 107, 255, 0.2), 0 4px 10px rgba(255, 107, 202, 0.15);
  --shadow-chrome: 0 10px 40px rgba(0, 0, 0, 0.08), inset 0 1px 0 rgba(255, 255, 255, 0.5);
}
```

## Chrome / Metallic Effects

The signature Y2K element:

```css
/* Chrome text effect */
.chrome-text {
  background: var(--gradient-chrome);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  filter: contrast(1.2);
  font-weight: 900;
}

/* Holographic / iridescent card */
.holo-card {
  background: linear-gradient(135deg, rgba(255, 156, 245, 0.2), rgba(148, 211, 255, 0.2), rgba(184, 255, 207, 0.2));
  border: 2px solid rgba(255, 255, 255, 0.5);
  border-radius: 24px;
  backdrop-filter: blur(10px);
  box-shadow: var(--shadow-y2k);
  padding: 32px;
  position: relative;
  overflow: hidden;
}

/* Moving holographic shimmer */
.holo-card::before {
  content: '';
  position: absolute;
  inset: 0;
  background: var(--gradient-holographic);
  opacity: 0.1;
  animation: shimmer 5s ease-in-out infinite;
}

@keyframes shimmer {
  0%, 100% { transform: translateX(-100%) rotate(10deg); }
  50% { transform: translateX(100%) rotate(10deg); }
}
```

## Bubbly / 3D Elements

```css
/* Inflated / bubble button */
.btn-bubble {
  font-family: 'Space Grotesk', sans-serif;
  font-weight: 700;
  font-size: 1rem;
  padding: 16px 36px;
  border-radius: 50px;
  border: none;
  background: linear-gradient(180deg, #ff8ad8 0%, #ff6bca 50%, #e050a0 100%);
  color: white;
  box-shadow:
    0 6px 0 #c04090,
    0 8px 20px rgba(255, 107, 202, 0.4),
    inset 0 2px 4px rgba(255, 255, 255, 0.4);
  cursor: pointer;
  transition: all 0.15s ease;
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
}

.btn-bubble:hover {
  transform: translateY(-2px);
  box-shadow:
    0 8px 0 #c04090,
    0 12px 30px rgba(255, 107, 202, 0.5),
    inset 0 2px 4px rgba(255, 255, 255, 0.4);
}

.btn-bubble:active {
  transform: translateY(4px);
  box-shadow:
    0 2px 0 #c04090,
    0 4px 10px rgba(255, 107, 202, 0.3),
    inset 0 2px 4px rgba(255, 255, 255, 0.4);
}

/* 3D pill shape */
.pill-3d {
  border-radius: 50px;
  background: linear-gradient(180deg, var(--bg-silver) 0%, #d4d4d8 100%);
  box-shadow: inset 0 2px 4px rgba(255, 255, 255, 0.5), 0 4px 8px rgba(0, 0, 0, 0.1);
  padding: 8px 20px;
}
```

## Backgrounds

```css
body {
  background: var(--bg-lavender);
  /* Gradient mesh background */
  background-image:
    radial-gradient(ellipse at 20% 50%, rgba(255, 107, 202, 0.15) 0%, transparent 50%),
    radial-gradient(ellipse at 80% 20%, rgba(107, 181, 255, 0.15) 0%, transparent 50%),
    radial-gradient(ellipse at 50% 80%, rgba(198, 107, 255, 0.15) 0%, transparent 50%);
}

/* Decorative floating shapes */
.floating-shape {
  position: absolute;
  border-radius: 50%;
  background: var(--gradient-holographic);
  opacity: 0.2;
  filter: blur(2px);
  animation: y2kFloat 8s ease-in-out infinite;
}

@keyframes y2kFloat {
  0%, 100% { transform: translateY(0) rotate(0deg) scale(1); }
  33% { transform: translateY(-20px) rotate(120deg) scale(1.05); }
  66% { transform: translateY(10px) rotate(240deg) scale(0.95); }
}

/* Star / sparkle decorations — CSS-only */
.sparkle {
  width: 8px;
  height: 8px;
  background: white;
  clip-path: polygon(50% 0%, 60% 40%, 100% 50%, 60% 60%, 50% 100%, 40% 60%, 0% 50%, 40% 40%);
  position: absolute;
  animation: sparkleAnim 2s ease-in-out infinite;
}

@keyframes sparkleAnim {
  0%, 100% { opacity: 0; transform: scale(0) rotate(0deg); }
  50% { opacity: 1; transform: scale(1) rotate(180deg); }
}
```

## Animations & Motion

Bouncy, playful, exaggerated:

- **Easing**: `cubic-bezier(0.34, 1.56, 0.64, 1)` — overshoot bounce
- **Hover**: Scale up 1.05 with shadow expansion
- **Entry**: Bounce-in from below with rotation
- **Floating elements**: Continuous gentle rotation and translation
- **Sparkles**: Random fade-in/out star shapes

```css
@keyframes bounceIn {
  0% { opacity: 0; transform: translateY(40px) scale(0.8); }
  60% { transform: translateY(-10px) scale(1.02); }
  100% { opacity: 1; transform: translateY(0) scale(1); }
}
```

## Key Rules

1. **Gradients everywhere** — mesh gradients, holographic, chrome, sunset
2. **Large border-radius** — `24px` cards, `50px` pill buttons
3. **Chrome/metallic text** — gradient backgrounds clipped to text
4. **Oversized typography** — giant, bold, fun headlines
5. **3D depth on buttons** — offset shadow trick for "inflated" look
6. **Iridescent/holographic accents** — shifting color overlays
7. **Floating decorative shapes** — blobs, stars, sparkles
8. **Light backgrounds** — lavender, baby blue, bubblegum pink, silver
9. **Bouncy animations** — spring easing with overshoot
10. **Mixed nostalgia** — pixel font accents, retro icons, bubbly shapes

## When to Use

✅ Fashion brands, music platforms, social media, youth-oriented products, creative tools, entertainment, pop culture, beauty brands, events
❌ Enterprise software, legal, healthcare, government, academic
