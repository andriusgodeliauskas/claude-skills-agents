---
name: frontend-neobrutalist
description: Create bold Neo-Brutalist interfaces with thick borders, raw typography, high-contrast colors, and intentionally "ugly-beautiful" layouts. Use when user asks for brutalist, raw, bold, punk, anti-design, underground, or edgy UI. Ideal for creative agencies, portfolios, indie brands, art projects, cultural platforms, and startups wanting to stand out.
---

# Neo-Brutalist Design System

Create interfaces that punch through the screen — raw, honest, and unapologetically bold. Neo-Brutalism takes the architectural movement's honesty and applies it to digital design with a modern twist: it's ugly on purpose, and that's what makes it beautiful.

## Core Aesthetic Philosophy

**The Feel**: Raw energy meets intentional chaos. Like a punk zine designed by someone who went to art school. Every element declares its presence with thick borders and loud colors. Nothing hides behind gradients or glass.

**Mood Keywords**: Bold, raw, honest, loud, playful-aggressive, anti-corporate, expressive

## Typography

- **Display**: `'Space Mono', 'JetBrains Mono', 'IBM Plex Mono'` — monospace is king in brutalism
- **Headlines alternative**: `'Clash Display', 'Bebas Neue', 'Anton'` — massive, condensed, loud
- **Body**: `'Work Sans', 'IBM Plex Sans'` — readable but characterful
- **Treatment**: ALL CAPS for headlines. Mixed case for body. Oversized sizes (clamp 3rem–8rem for heroes)
- Import from Google Fonts: `Space Mono`, `Bebas Neue`, `Work Sans`, `Anton`

## Color System

High contrast, clashing, intentional:

```css
:root {
  /* Backgrounds — raw, flat, solid */
  --bg-primary: #fffce1;        /* Cream/off-white */
  --bg-secondary: #ff6b35;      /* Loud orange */
  --bg-black: #1a1a1a;
  --bg-highlight: #ffdd00;      /* Electric yellow */

  /* Borders — the star of the show */
  --border-color: #1a1a1a;
  --border-width: 3px;
  --border-heavy: 4px;

  /* Accent palette — clashing is intentional */
  --accent-red: #ff3333;
  --accent-blue: #3344ff;
  --accent-green: #00cc66;
  --accent-pink: #ff44cc;
  --accent-purple: #8833ff;
  --accent-yellow: #ffdd00;

  /* Text */
  --text-primary: #1a1a1a;
  --text-inverse: #fffce1;

  /* The Brutalist Shadow™ */
  --shadow-brutal: 4px 4px 0px #1a1a1a;
  --shadow-brutal-lg: 8px 8px 0px #1a1a1a;
  --shadow-brutal-hover: 6px 6px 0px #1a1a1a;
  --shadow-brutal-active: 2px 2px 0px #1a1a1a;
}
```

### Dark Brutalist Variant
```css
[data-theme="dark"] {
  --bg-primary: #1a1a1a;
  --border-color: #fffce1;
  --text-primary: #fffce1;
  --shadow-brutal: 4px 4px 0px #fffce1;
  --shadow-brutal-lg: 8px 8px 0px #fffce1;
}
```

## The Brutalist Box — Core Component

Everything is a box with hard borders and offset shadows:

```css
.brutal-box {
  background: var(--bg-primary);
  border: var(--border-heavy) solid var(--border-color);
  box-shadow: var(--shadow-brutal);
  padding: 24px;
  position: relative;
  transition: transform 0.15s ease, box-shadow 0.15s ease;
}

.brutal-box:hover {
  transform: translate(-2px, -2px);
  box-shadow: var(--shadow-brutal-hover);
}

.brutal-box:active {
  transform: translate(2px, 2px);
  box-shadow: var(--shadow-brutal-active);
}
```

**NO border-radius!** Everything is sharp corners. If you absolutely must soften, max `4px`.

## Backgrounds

Flat, solid colors. NO gradients. Add texture with patterns:

```css
body {
  background-color: var(--bg-primary);
  /* Optional: subtle dot grid pattern */
  background-image: radial-gradient(circle, #1a1a1a 1px, transparent 1px);
  background-size: 24px 24px;
}

/* Marquee banner — classic brutalist element */
.marquee {
  overflow: hidden;
  border-top: var(--border-heavy) solid var(--border-color);
  border-bottom: var(--border-heavy) solid var(--border-color);
  background: var(--accent-yellow);
  padding: 12px 0;
}

.marquee-content {
  display: flex;
  animation: marquee 20s linear infinite;
  white-space: nowrap;
  gap: 48px;
  font-family: 'Space Mono', monospace;
  font-size: 1.2rem;
  text-transform: uppercase;
  font-weight: 700;
}

@keyframes marquee {
  from { transform: translateX(0); }
  to { transform: translateX(-50%); }
}
```

## Animations & Motion

Motion is abrupt and mechanical — NOT smooth:

- **Hover**: Translate + shadow shift (feels like pressing a physical button)
- **Page entry**: Hard cut-ins, no fading. Elements snap into place
- **Marquee**: Continuous scrolling text banners
- **Transitions**: Short duration `0.1s–0.2s`, `ease` or `linear` — no luxury easing

```css
/* Elements appear by sliding in hard */
@keyframes slideInHard {
  from { transform: translateX(-100%); }
  to { transform: translateX(0); }
}

/* Glitch effect for emphasis */
@keyframes glitch {
  0%, 100% { transform: translate(0); }
  20% { transform: translate(-2px, 2px); }
  40% { transform: translate(2px, -2px); }
  60% { transform: translate(-1px, -1px); }
  80% { transform: translate(1px, 1px); }
}
```

## Layout Principles

- **Grid**: Visible grid lines! Borders between sections, not invisible spacing
- **Asymmetry**: Intentionally unbalanced layouts. One column wider than others
- **Overlap**: Elements can overlap borders, break out of containers
- **Stacking**: Rotated elements, skewed cards, overlapping boxes
- **Spacing**: Can be tight or generous — but never "safe" middle-ground
- **No border-radius**: ZERO. Sharp corners everywhere.

## Buttons

```css
.btn-brutal {
  font-family: 'Space Mono', monospace;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  padding: 14px 28px;
  border: var(--border-heavy) solid var(--border-color);
  box-shadow: var(--shadow-brutal);
  background: var(--bg-primary);
  color: var(--text-primary);
  cursor: pointer;
  transition: transform 0.1s, box-shadow 0.1s;
}

.btn-brutal:hover {
  transform: translate(-2px, -2px);
  box-shadow: var(--shadow-brutal-hover);
}

.btn-brutal:active {
  transform: translate(2px, 2px);
  box-shadow: var(--shadow-brutal-active);
}

.btn-brutal-fill {
  background: var(--accent-yellow);
}

.btn-brutal-danger {
  background: var(--accent-red);
  color: var(--text-inverse);
}
```

## Key Rules

1. **NO border-radius** — everything is sharp, square, angular
2. **NO gradients** — flat, solid colors only
3. **NO soft shadows** — only hard offset shadows (`4px 4px 0px`)
4. **Borders are visible and thick** — minimum 3px
5. **Typography is loud** — oversized headings, monospace where possible
6. **Colors clash intentionally** — yellow + black, red + cream, blue + orange
7. **Hover = physical button press** — translate + shadow shift
8. **Marquee banners** for emphasis — scrolling text strips
9. **Raw HTML feel** — stickers, stamps, handwritten elements welcome
10. **Content-first** — the design serves the message, not the other way around

## When to Use

✅ Creative agencies, portfolios, indie brands, music/art platforms, zines, experimental projects, startups wanting to break convention
❌ Corporate B2B, healthcare, finance (unless intentionally subversive), elderly-focused products
