---
name: frontend-editorial-luxury
description: Create high-end Editorial and Magazine-style interfaces with refined serif typography, cinematic imagery, and luxury brand aesthetics. Use when user asks for editorial, magazine-style, luxury, high-end, fashion, elegant, sophisticated, or premium brand UI. Ideal for fashion brands, luxury products, editorial publications, architecture firms, wine/spirits, jewelry, and premium hospitality.
---

# Editorial / Luxury Magazine Design System

Create interfaces that feel like opening a beautifully designed print magazine — every element is curated, every whitespace is intentional, every font choice tells a story of refinement.

## Core Aesthetic Philosophy

**The Feel**: Walking into a Parisian gallery. The quiet confidence of a Vogue spread. Typography does the heavy lifting while imagery creates emotion. Nothing is accidental — every pixel serves the story.

**Mood Keywords**: Refined, curated, confident, timeless, quiet luxury, elevated, cinematic

## Typography — THE Star of This Design

Typography is 80% of this design. Choose wisely:

- **Display/Headlines**: `'Playfair Display', 'Cormorant Garamond', 'Libre Caslon Display', 'DM Serif Display'` — elegant serifs with personality
- **Subheadings**: `'Cormorant', 'Lora'` — lighter weight serifs
- **Body**: `'Source Serif 4', 'Lora', 'Crimson Text'` — readable serif body text
- **Accents/Labels**: `'Montserrat', 'Jost', 'Syne'` — clean sans-serif for captions, labels, navigation
- **Sizes**: Hero headlines at `clamp(4rem, 10vw, 10rem)`. Body at 18-20px for comfortable reading
- **Letter-spacing**: Expanded for uppercase sans labels (`0.15em`), tight for serif headlines (`-0.03em`)
- Import: `Playfair Display`, `Cormorant Garamond`, `Montserrat`, `Source Serif 4`

## Color System

Restrained, sophisticated palettes:

```css
:root {
  /* Backgrounds */
  --bg-cream: #f5f0e8;
  --bg-paper: #faf7f2;
  --bg-charcoal: #1c1c1c;
  --bg-noir: #0d0d0d;

  /* Text */
  --text-ink: #1a1a1a;
  --text-muted: #6b6355;
  --text-caption: #9a9088;
  --text-inverse: #f5f0e8;

  /* Accent — one singular accent, used sparingly */
  --accent-gold: #b8860b;
  --accent-burgundy: #722f37;
  --accent-sage: #7d8471;
  --accent-terracotta: #c67a52;

  /* Dividers */
  --line-color: #d4cfc7;
  --line-color-dark: #333;
}
```

### Dark Editorial Variant (Noir)
```css
[data-theme="dark"] {
  --bg-cream: #0d0d0d;
  --bg-paper: #1a1a1a;
  --text-ink: #f0ece4;
  --text-muted: #a09888;
  --line-color: #333;
}
```

## Layout — Magazine Grid

Think in columns like a real magazine:

```css
/* Classic editorial grid */
.editorial-grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: 0;  /* Gutters are controlled, not uniform */
  max-width: 1400px;
  margin: 0 auto;
  padding: 0 clamp(24px, 5vw, 80px);
}

/* Full-bleed sections */
.full-bleed {
  width: 100vw;
  margin-left: calc(-50vw + 50%);
}

/* Pull quotes that break the grid */
.pull-quote {
  font-family: 'Playfair Display', serif;
  font-size: clamp(2rem, 4vw, 4rem);
  font-style: italic;
  line-height: 1.2;
  color: var(--text-ink);
  border-left: 3px solid var(--accent-gold);
  padding-left: 32px;
  margin: 80px 0;
}
```

## The Divider Line — A Signature Element

Horizontal rules are prominent design elements:

```css
.editorial-line {
  border: none;
  height: 1px;
  background: var(--line-color);
  margin: 60px 0;
}

.editorial-line-thick {
  height: 3px;
  background: var(--text-ink);
}

/* Decorative section label */
.section-label {
  font-family: 'Montserrat', sans-serif;
  font-size: 0.7rem;
  font-weight: 600;
  letter-spacing: 0.2em;
  text-transform: uppercase;
  color: var(--text-caption);
  margin-bottom: 16px;
}
```

## Imagery

- **Full-bleed hero images** — edge to edge, cinematic
- **Aspect ratios**: 16:9 for heroes, 3:4 or 4:5 for portraits, 1:1 for grids
- **Treatment**: Desaturated slightly, warm tones, high contrast
- **Text over images**: Use a subtle scrim gradient, never a solid overlay
- **Captions**: Small, italic, positioned elegantly below images

```css
.hero-image {
  width: 100%;
  height: 85vh;
  object-fit: cover;
  filter: contrast(1.05) saturate(0.9);
}

.image-caption {
  font-family: 'Montserrat', sans-serif;
  font-size: 0.75rem;
  letter-spacing: 0.08em;
  color: var(--text-caption);
  margin-top: 12px;
  font-style: italic;
}
```

## Animations & Motion

Motion is subtle and dignified — never flashy:

- **Scroll reveal**: Gentle fade-up with no blur, `0.8s ease-out`
- **Text**: Characters or words revealing sequentially (split text)
- **Images**: Slight scale-down on load (1.05 → 1.0)
- **Hover on links**: Underline grows from left, color shifts gently
- **Page transitions**: Cross-fade, minimal

```css
@keyframes revealUp {
  from { opacity: 0; transform: translateY(30px); }
  to { opacity: 1; transform: translateY(0); }
}

/* Link hover — growing underline */
a.editorial-link {
  text-decoration: none;
  color: var(--text-ink);
  position: relative;
}

a.editorial-link::after {
  content: '';
  position: absolute;
  bottom: -2px;
  left: 0;
  width: 0;
  height: 1px;
  background: var(--text-ink);
  transition: width 0.4s cubic-bezier(0.25, 0.1, 0.25, 1);
}

a.editorial-link:hover::after {
  width: 100%;
}
```

## Navigation

- Minimal, elegant, fixed top
- Logo: Typography-based, not icon
- Links: Uppercase sans-serif, widely spaced, small font
- Hamburger on mobile: Thin lines, elegant animation

```css
.nav-editorial {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 24px clamp(24px, 5vw, 80px);
  border-bottom: 1px solid var(--line-color);
}

.nav-logo {
  font-family: 'Playfair Display', serif;
  font-size: 1.5rem;
  font-weight: 700;
  letter-spacing: 0.05em;
}

.nav-links {
  font-family: 'Montserrat', sans-serif;
  font-size: 0.7rem;
  font-weight: 600;
  letter-spacing: 0.2em;
  text-transform: uppercase;
  display: flex;
  gap: 40px;
}
```

## Key Rules

1. **Typography hierarchy is everything** — display serif for headlines, sans-serif for labels
2. **Whitespace is generous** — margins of 80-120px between sections
3. **One accent color max** — used only for emphasis moments
4. **Horizontal lines as design elements** — dividers, borders, rules
5. **No UI chrome** — minimal buttons, no cards with shadows, no rounded corners
6. **Images are cinematic** — full-bleed, slightly desaturated, high contrast
7. **Navigation is invisible** — it serves, not dominates
8. **Animations are dignified** — slow, subtle, never bouncy
9. **All-caps sans-serif labels** — for categories, dates, credits
10. **Reading experience** — body text at 18-20px, max-width ~680px for text blocks

## When to Use

✅ Fashion brands, luxury products, architecture firms, editorial publications, wine/spirits, premium hospitality, photography portfolios, cultural institutions
❌ SaaS dashboards, gaming, children's products, budget brands
