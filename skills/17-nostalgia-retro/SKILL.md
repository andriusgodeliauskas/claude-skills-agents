---
name: nostalgia-retro
description: Vintage 70s/80s/90s nostalgic web design. Massive 2023-2024 trend fueled by post-COVID nostalgia. Warm muted color palettes, serif fonts, retro imagery, film grain textures, rounded shapes, vintage borders, minimal vintage aesthetic. Different from Y2K (skill-07 covers 2000s) — this focuses on 1970s-1990s. Perfect for cafes, boutiques, lifestyle brands, vintage shops, breweries, restaurants, photography, personal blogs. ALWAYS combine with 11-responsive-premium and 12-deployment-paths skills.
---

# Nostalgia Retro 70s-90s Design Style

**Era**: 2023-2024 dominant | **Vibe**: Warm, authentic, handcrafted, vintage, cozy
**Best for**: Cafes, restaurants, bakeries, boutiques, breweries, lifestyle brands, photographers, personal blogs, vinyl/record shops, artisan products
**Avoid for**: AI/tech products, fintech, enterprise SaaS

---

## DECADE SELECTOR

Choose your era, then apply the matching palette and typography:

### 70s: Earthy & Warm
```css
:root {
  --retro-bg: #F5EDE0;            /* Warm parchment */
  --retro-primary: #C44D2A;       /* Burnt orange */
  --retro-secondary: #5B7553;     /* Olive green */
  --retro-accent: #D4A84B;        /* Mustard gold */
  --retro-dark: #2C1E14;          /* Dark brown */
  --retro-text: #3D2B1F;
  --retro-text-muted: #8B7355;
}
```

### 80s: Bold & Neon-Pastel
```css
:root {
  --retro-bg: #1A1A2E;            /* Deep navy */
  --retro-primary: #E94560;       /* Hot pink */
  --retro-secondary: #0F3460;     /* Royal blue */
  --retro-accent: #FFD700;        /* Gold */
  --retro-dark: #0A0A1A;
  --retro-text: #E8E8E8;
  --retro-text-muted: #888888;
}
```

### 90s: Grunge & Subdued
```css
:root {
  --retro-bg: #EDE8D9;            /* Off-white */
  --retro-primary: #6B4E3D;       /* Mocha */
  --retro-secondary: #4A6741;     /* Forest green */
  --retro-accent: #B86F50;        /* Terracotta */
  --retro-dark: #2A2218;
  --retro-text: #2A2218;
  --retro-text-muted: #7A6F60;
}
```

---

## TYPOGRAPHY

```css
/* Serif headers + humanist sans body */
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400&family=DM+Sans:wght@400;500;700&display=swap');
/* 70s alternative: Fraunces (variable), Cooper Hewitt */
/* 90s alternative: Courier Prime (monospace accent), Libre Baskerville */

:root {
  --font-display: 'Playfair Display', Georgia, serif;
  --font-body: 'DM Sans', sans-serif;
}

h1 {
  font-family: var(--font-display);
  font-size: clamp(2.5rem, 6vw, 5rem);
  font-weight: 700;
  color: var(--retro-dark);
  line-height: 1.1;
}

h1 em {
  font-style: italic;
  color: var(--retro-primary);
}

p {
  font-family: var(--font-body);
  font-size: 1.0625rem;
  line-height: 1.8;
  color: var(--retro-text-muted);
}
```

---

## VINTAGE BORDERS & FRAMES

```css
/* Classic double border */
.retro-border {
  border: 3px double var(--retro-dark);
  padding: 40px;
}

/* Ornamental corner frame */
.retro-frame {
  position: relative;
  padding: 60px 40px;
  border: 1px solid var(--retro-primary);
}

.retro-frame::before,
.retro-frame::after {
  content: '✦';
  position: absolute;
  font-size: 1.2rem;
  color: var(--retro-primary);
}

.retro-frame::before { top: -10px; left: 20px; }
.retro-frame::after  { bottom: -10px; right: 20px; }

/* Rounded vintage tag */
.retro-tag {
  display: inline-block;
  padding: 8px 20px;
  border: 2px solid var(--retro-primary);
  border-radius: 999px;
  font-family: var(--font-body);
  font-size: 0.75rem;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.15em;
  color: var(--retro-primary);
}
```

---

## FILM GRAIN TEXTURE

```css
/* Subtle grain overlay */
body::after {
  content: '';
  position: fixed;
  inset: 0;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='grain'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.85' numOctaves='3' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23grain)' opacity='0.06'/%3E%3C/svg%3E");
  pointer-events: none;
  z-index: 9999;
  opacity: 0.4;
}

/* Vignette edges (optional) */
body::before {
  content: '';
  position: fixed;
  inset: 0;
  background: radial-gradient(ellipse at center, transparent 50%, rgba(0,0,0,0.15) 100%);
  pointer-events: none;
  z-index: 9998;
}
```

---

## PHOTO TREATMENT

```css
/* Vintage faded photo */
.retro-photo {
  border-radius: 4px;
  filter: contrast(0.95) saturate(0.85) sepia(0.1);
  border: 6px solid white;
  box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.15);
}

/* Polaroid frame */
.polaroid {
  background: white;
  padding: 12px 12px 48px 12px;
  box-shadow: 2px 4px 16px rgba(0, 0, 0, 0.12);
  transform: rotate(-2deg);
  display: inline-block;
}

.polaroid img {
  width: 100%;
  display: block;
  filter: contrast(0.9) saturate(0.8);
}

.polaroid .caption {
  font-family: 'Courier New', monospace;
  font-size: 0.875rem;
  color: #555;
  text-align: center;
  margin-top: 12px;
}
```

---

## BUTTONS

```css
.retro-btn {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 14px 32px;
  background: var(--retro-primary);
  color: var(--retro-bg);
  border: none;
  border-radius: 4px;
  font-family: var(--font-body);
  font-weight: 700;
  font-size: 0.875rem;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  cursor: pointer;
  transition: all 0.2s ease;
}

.retro-btn:hover {
  background: var(--retro-dark);
  transform: translateY(-2px);
}

/* Rounded pill variant */
.retro-btn-pill {
  border-radius: 999px;
  background: transparent;
  color: var(--retro-primary);
  border: 2px solid var(--retro-primary);
}

.retro-btn-pill:hover {
  background: var(--retro-primary);
  color: var(--retro-bg);
}
```

---

## LAYOUT

```css
body {
  background: var(--retro-bg);
  color: var(--retro-text);
  font-family: var(--font-body);
  margin: 0;
}

.container {
  max-width: 1100px;
  margin: 0 auto;
  padding: 0 clamp(20px, 4vw, 60px);
}

/* Vintage section divider */
.divider {
  display: flex;
  align-items: center;
  gap: 16px;
  margin: 60px 0;
  color: var(--retro-text-muted);
  font-size: 0.75rem;
  text-transform: uppercase;
  letter-spacing: 0.2em;
}

.divider::before,
.divider::after {
  content: '';
  flex: 1;
  height: 1px;
  background: var(--retro-text-muted);
  opacity: 0.3;
}
```

---

## CARDS

```css
.retro-card {
  background: white;
  border: 1px solid rgba(0, 0, 0, 0.08);
  border-radius: 8px;
  overflow: hidden;
  transition: transform 0.3s ease;
}

.retro-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
}

.retro-card img {
  width: 100%;
  aspect-ratio: 4/3;
  object-fit: cover;
  filter: saturate(0.85);
}

.retro-card .content {
  padding: 24px;
}
```

---

## COMMON MISTAKES

1. ❌ Using modern neon colors — use muted, warm, desaturated tones
2. ❌ Perfect stock photos — should look slightly faded/vintage (use filter)
3. ❌ Ultra-clean sans-serif everything — mix serif headers + sans body
4. ❌ No texture — even subtle grain adds massive authenticity
5. ❌ Too many rounded corners — vintage uses sharp or slightly rounded (4-8px)
6. ❌ Confusing with Y2K (2000s) — this is 70s-90s pre-internet aesthetic
