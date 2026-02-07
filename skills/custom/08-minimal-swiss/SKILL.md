---
name: frontend-minimal-swiss
description: Create precise Minimal Swiss / Scandinavian interfaces with strict grid systems, functional typography, and restrained color. Inspired by International Typographic Style and Nordic design. Use when user asks for minimal, Swiss, Scandinavian, clean, functional, grid-based, precise, or typographic UI. Ideal for design tools, developer products, architecture firms, furniture brands, professional services, and productivity apps.
---

# Minimal Swiss / Scandinavian Design System

Create interfaces with mathematical precision and quiet confidence. Every element earns its place through function. Typography is information, grids are architecture, whitespace is luxury.

## Core Aesthetic Philosophy

**The Feel**: A perfectly organized Zurich apartment. Dieter Rams' "less, but better." Every pixel is intentional. The design is invisible — users see only content. Beauty emerges from proportion, not decoration.

**Mood Keywords**: Precise, functional, quiet, proportional, mathematical, dignified, systematic

## Typography

Typography IS the design:

- **Display**: `'Suisse Intl'` → realistic fallback: `'Archivo', 'Albert Sans', 'General Sans'` — geometric, precise, neutral-warm
- **Body**: `'Archivo', 'Albert Sans', 'Figtree'` — clean, readable, characterful without being decorative
- **Monospace**: `'IBM Plex Mono'` — for data, code, tabular info
- **NO serifs** in this system. Pure sans-serif. Exception: mono for data
- **Weight range**: Thin (100) to Bold (700). Use weight as a design tool
- **Sizes**: Modular scale based on 1.25 ratio: 12, 15, 18.75, 23.4, 29.3, 36.6, 45.8px
- Import: `Archivo`, `Albert Sans`, `IBM Plex Mono`, `Figtree`

## Color System

Extreme restraint:

```css
:root {
  /* Backgrounds — near-white to true white */
  --bg-white: #ffffff;
  --bg-snow: #fafafa;
  --bg-gray-50: #f5f5f5;
  --bg-gray-100: #eeeeee;

  /* Text — near-black */
  --text-900: #111111;
  --text-700: #333333;
  --text-500: #666666;
  --text-400: #888888;
  --text-300: #aaaaaa;

  /* ONE accent color — choose one, commit */
  --accent: #0055ff;         /* Classic Swiss blue */
  /* alternatives: */
  /* --accent: #ff3300; */   /* Swiss red */
  /* --accent: #111111; */   /* Monochrome */
  /* --accent: #00aa55; */   /* Swiss green */

  /* Borders */
  --border-light: #e5e5e5;
  --border-dark: #111111;

  /* Grid guide color (development helper) */
  --grid-guide: rgba(0, 85, 255, 0.05);
}
```

### Dark Swiss
```css
[data-theme="dark"] {
  --bg-white: #111111;
  --bg-snow: #1a1a1a;
  --bg-gray-50: #222222;
  --text-900: #f5f5f5;
  --text-700: #cccccc;
  --text-500: #999999;
  --border-light: #333333;
  --border-dark: #f5f5f5;
}
```

## The Grid — Foundation of Everything

Strict 12-column grid with visible rhythm:

```css
.swiss-grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: 24px;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 48px;
}

/* Baseline grid — 8px rhythm */
* {
  /* All spacing in multiples of 8 */
  /* 8, 16, 24, 32, 40, 48, 56, 64, 80, 96, 120 */
}

/* Visible column guides (debug) */
.show-grid {
  background-image: repeating-linear-gradient(
    90deg,
    var(--grid-guide),
    var(--grid-guide) calc((100% - 264px) / 12),
    transparent calc((100% - 264px) / 12),
    transparent calc((100% - 264px) / 12 + 24px)
  );
}
```

## Cards — Borderless, Content-Defined

```css
.swiss-card {
  padding: 32px;
  border-bottom: 1px solid var(--border-light);
  /* NO border-radius. NO box-shadow. NO background color. */
  /* Content defines the card, not decoration */
}

/* When a card IS needed */
.swiss-card-bordered {
  border: 1px solid var(--border-light);
  padding: 32px;
  /* Still no border-radius, no shadow */
}

/* Hover: minimal */
.swiss-card-bordered:hover {
  border-color: var(--text-900);
}
```

## Layout Patterns

```css
/* Asymmetric two-column — classic Swiss poster layout */
.layout-asymmetric {
  display: grid;
  grid-template-columns: 1fr 2fr;
  gap: 48px;
  align-items: start;
}

/* The label-content pattern */
.label-content {
  display: grid;
  grid-template-columns: 200px 1fr;
  gap: 24px;
  padding: 24px 0;
  border-bottom: 1px solid var(--border-light);
}

.label-content .label {
  font-size: 12px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  color: var(--text-400);
}
```

## Animations & Motion

Almost none. When used, barely perceptible:

```css
/* Only transition: opacity and transform */
.swiss-transition {
  transition: opacity 0.2s ease, transform 0.2s ease;
}

/* Page content fade-in — no movement, just opacity */
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

/* The only acceptable hover effect */
a:hover { opacity: 0.6; }
```

- **No bouncing, no scaling, no sliding**
- **Transitions**: 0.15–0.2s max
- **The best animation is no animation**

## Buttons

```css
.btn-swiss {
  font-family: 'Archivo', sans-serif;
  font-weight: 600;
  font-size: 13px;
  letter-spacing: 0.05em;
  text-transform: uppercase;
  padding: 14px 32px;
  border: 2px solid var(--text-900);
  background: transparent;
  color: var(--text-900);
  cursor: pointer;
  transition: all 0.15s ease;
  /* NO border-radius */
}

.btn-swiss:hover {
  background: var(--text-900);
  color: var(--bg-white);
}

.btn-swiss-fill {
  background: var(--text-900);
  color: var(--bg-white);
}

.btn-swiss-fill:hover {
  background: transparent;
  color: var(--text-900);
}
```

## Key Rules

1. **NO border-radius** — square corners, always
2. **NO shadows** — depth through layering and borders only
3. **NO gradients** — flat, solid colors
4. **ONE accent color** — if any. Monochrome preferred
5. **8px baseline grid** — all spacing in multiples of 8
6. **12-column grid** — strict, visible, mathematical
7. **Typography as hierarchy** — weight and size define structure, not color
8. **Uppercase labels** — small, tracked-out, functional
9. **Lines as separators** — thin `1px` borders, bottom-aligned
10. **Minimal to zero animation** — function over flash
11. **Asymmetric layouts** — 1/3 + 2/3 splits, not centered
12. **Max content width** — 65ch for reading, 1200px for layouts

## When to Use

✅ Design tools, developer products, architecture firms, furniture brands, professional services, productivity apps, portfolio sites, corporate identity, documentation
❌ Children's products, entertainment, gaming, restaurants, emotional brands
