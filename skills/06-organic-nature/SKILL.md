---
name: frontend-organic-nature
description: Create warm, nature-inspired interfaces with organic shapes, earthy palettes, flowing curves, and biophilic design principles. Use when user asks for organic, natural, earthy, warm, eco, wellness, botanical, soft, cozy, or biophilic UI. Ideal for wellness brands, eco-friendly products, food/restaurant, yoga/meditation apps, sustainable businesses, organic skincare, and nature-related platforms.
---

# Organic / Nature-Inspired Design System

Create interfaces that feel alive and grounded — warm earth tones, flowing organic shapes, and the gentle rhythm of the natural world. This is digital design that breathes.

## Core Aesthetic Philosophy

**The Feel**: Morning sunlight through a greenhouse window. A handcraft market on a quiet street. Digital warmth that makes you slow down and appreciate. Nothing is perfectly geometric — everything has the gentle imperfection of nature.

**Mood Keywords**: Warm, grounded, flowing, alive, comforting, handcrafted, sustainable, gentle

## Typography

- **Display**: `'Fraunces', 'Newsreader', 'Libre Baskerville'` — warm, organic serifs with optical character
- **Body**: `'Nunito', 'Quicksand', 'Rubik'` — soft, rounded sans-serif for warmth
- **Accent**: `'Caveat', 'Kalam'` — handwritten for personal touches (labels, annotations)
- **Sizes**: Generous — hero at `clamp(2.5rem, 6vw, 5rem)`, body at 17-18px
- **Line-height**: Relaxed — 1.7 for body text, 1.2 for headings
- Import: `Fraunces`, `Nunito`, `Caveat`, `Quicksand`

## Color System

Earthy, warm, inspired by nature:

```css
:root {
  /* Backgrounds */
  --bg-linen: #faf6f0;
  --bg-sand: #f2ebe0;
  --bg-cream: #fff8f0;
  --bg-moss: #2d3a2d;

  /* Earth tones */
  --earth-terracotta: #c67a52;
  --earth-clay: #b8704a;
  --earth-sienna: #a0522d;
  --earth-sage: #7d8c6e;
  --earth-olive: #5c6b4c;
  --earth-forest: #2d4a2d;
  --earth-sand: #d4b896;
  --earth-warm-brown: #6b4c3b;

  /* Accent — botanical highlights */
  --botanical-green: #4a7c59;
  --botanical-light: #8fbc8f;
  --flower-blush: #e8b4b8;
  --flower-marigold: #daa520;
  --sky-soft: #87a5b8;

  /* Text */
  --text-dark: #2c2419;
  --text-warm: #5a4a3a;
  --text-light: #8a7a6a;
  --text-inverse: #faf6f0;

  /* Borders */
  --border-organic: rgba(107, 76, 59, 0.15);
}
```

### Dark Organic (Forest Mode)
```css
[data-theme="dark"] {
  --bg-linen: #1a2018;
  --bg-sand: #222a1f;
  --bg-cream: #1e261c;
  --text-dark: #e8ddd0;
  --text-warm: #b8a898;
  --border-organic: rgba(200, 180, 150, 0.1);
}
```

## Organic Shapes — The Signature Element

Forget rectangles. Nature doesn't do sharp corners:

```css
/* Blob-like border radius */
.organic-card {
  background: var(--bg-cream);
  border-radius: 30% 70% 70% 30% / 60% 40% 60% 40%;
  /* Alternative: more subtle organic */
  /* border-radius: 24px 24px 24px 4px; */
  padding: 40px;
  border: 1px solid var(--border-organic);
}

/* Wavy section divider */
.wave-divider {
  width: 100%;
  height: 80px;
  background: var(--bg-sand);
  clip-path: ellipse(60% 100% at 50% 100%);
}

/* SVG wave — use inline SVG for smooth wave separators */
.wave-svg {
  display: block;
  width: 100%;
}

/* Leaf / petal shapes for decorative elements */
.leaf-shape {
  border-radius: 0 50% 50% 50%;
  transform: rotate(-45deg);
}
```

## Standard Card (More Practical Organic)

```css
.nature-card {
  background: var(--bg-cream);
  border-radius: 20px;
  padding: 32px;
  border: 1px solid var(--border-organic);
  box-shadow: 0 4px 20px rgba(44, 36, 25, 0.06);
  transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
}

.nature-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 40px rgba(44, 36, 25, 0.1);
}
```

## Backgrounds & Textures

```css
body {
  background: var(--bg-linen);
  color: var(--text-dark);
}

/* Paper/linen texture overlay */
body::before {
  content: '';
  position: fixed;
  inset: 0;
  background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence baseFrequency='0.65' numOctaves='3' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='0.03'/%3E%3C/svg%3E");
  pointer-events: none;
  z-index: 0;
}

/* Soft gradient sections */
.section-warm {
  background: linear-gradient(180deg, var(--bg-linen) 0%, var(--bg-sand) 100%);
}

/* Botanical illustration decorations — use CSS shapes */
.botanical-circle {
  width: 300px;
  height: 300px;
  border-radius: 50%;
  border: 1px dashed var(--earth-sage);
  opacity: 0.3;
  position: absolute;
}
```

## Animations & Motion

Slow, breathing, natural:

```css
/* Gentle breathing animation */
@keyframes breathe {
  0%, 100% { transform: scale(1); }
  50% { transform: scale(1.02); }
}

/* Slow float — like a leaf in water */
@keyframes leafFloat {
  0%, 100% { transform: translateY(0) rotate(0deg); }
  25% { transform: translateY(-10px) rotate(2deg); }
  75% { transform: translateY(5px) rotate(-1deg); }
}

/* Scroll reveal — gentle rise */
@keyframes growIn {
  from { opacity: 0; transform: translateY(30px) scale(0.98); }
  to { opacity: 1; transform: translateY(0) scale(1); }
}
```

- **Timing**: Slow — `0.6s–1.2s` durations
- **Easing**: `cubic-bezier(0.25, 0.8, 0.25, 1)` — gentle, organic ease
- **Scroll effects**: Parallax on botanical illustrations, slow fade-ups
- **Hover**: Gentle lift + shadow expansion

## Buttons

```css
.btn-organic {
  font-family: 'Nunito', sans-serif;
  font-weight: 700;
  padding: 14px 32px;
  border-radius: 50px;  /* Pill shape — soft */
  border: 2px solid var(--earth-terracotta);
  background: transparent;
  color: var(--earth-terracotta);
  cursor: pointer;
  transition: all 0.4s ease;
}

.btn-organic:hover {
  background: var(--earth-terracotta);
  color: var(--text-inverse);
}

.btn-organic-fill {
  background: var(--botanical-green);
  border-color: var(--botanical-green);
  color: var(--text-inverse);
}

.btn-organic-fill:hover {
  background: var(--earth-forest);
  border-color: var(--earth-forest);
}
```

## Key Rules

1. **Warm color palette** — earthy browns, greens, terracotta, sage. NO pure black or blue
2. **Rounded everything** — `20px+` border-radius, pill buttons, blob shapes
3. **Organic shapes** — asymmetric border-radius, wavy dividers, blob backgrounds
4. **Paper textures** — subtle noise/grain overlay for tactile warmth
5. **Serif + rounded sans combo** — warm serif headlines, soft body font
6. **Handwritten accents** — use Caveat/Kalam for labels and personal touches
7. **Illustrations over photos** — botanical line drawings, hand-drawn icons
8. **Slow animations** — everything moves gently, like nature
9. **Large line-height** — body text breathes (1.7+)
10. **Sustainable feel** — design should feel low-energy, calming, intentional

## When to Use

✅ Wellness brands, organic food, yoga/meditation, eco products, botanical gardens, spas, artisanal crafts, sustainable fashion, farm-to-table restaurants, herbalists
❌ Tech startups, gaming, finance, enterprise B2B, cybersecurity
