---
name: claymorphism
description: Puffy, inflated 3D clay-like UI design. Born in 2022 via Michal Malewicz (Hype4), massively popular on Dribbble/Behance. Friendly, playful, tactile feel. Uses double inner shadows + outer shadow + big rounded corners + pastel colors. Perfect for children's apps, creative portfolios, NFT/Web3, SaaS with friendly vibe. NOT for corporate/finance (use editorial-luxury or minimal-swiss instead).
---

# Claymorphism Design Style

**Era**: 2022-2024 | **Vibe**: Playful, friendly, tactile, 3D clay
**Best for**: Children's products, creative tools, SaaS onboarding, Web3/NFT, mobile-first apps, casual brands
**Avoid for**: Banks, law firms, government, medical — anything that needs to feel "serious"

---

## CORE CSS FORMULA

```css
:root {
  /* Pastel palette — MUST be light enough for shadows to work */
  --clay-bg: #E8D5F5;            /* Soft lavender background */
  --clay-surface: #FFFFFF;        /* Card surface */
  --clay-accent: #7C5CFC;        /* Purple accent */
  --clay-accent-hover: #6A48E0;
  --clay-text: #2D3557;          /* Dark navy text */
  --clay-text-muted: #6B7280;
  --clay-radius: 32px;           /* Minimum 24px, ideally 32-50px */
  --clay-radius-btn: 50px;       /* Pill buttons */
  --clay-radius-small: 16px;     /* Smaller elements */
}
```

## THE THREE-SHADOW FORMULA (core of Claymorphism)

Every claymorphic element MUST have exactly 3 shadows:

```css
.clay-card {
  background: var(--clay-surface);
  border-radius: var(--clay-radius);
  padding: 40px;

  /* THE THREE SHADOWS — this is what makes Claymorphism */
  box-shadow:
    /* 1. OUTER shadow — depth against background (darker, offset) */
    8px 8px 20px 0 rgba(0, 0, 0, 0.15),
    /* 2. INNER shadow top-left — light highlight (lighter/white) */
    inset -6px -6px 14px 0 rgba(255, 255, 255, 0.5),
    /* 3. INNER shadow bottom-right — dark depth (subtle dark) */
    inset 6px 6px 14px 0 rgba(0, 0, 0, 0.07);
}
```

**RULES for shadows:**
- Outer shadow: X and Y equal (8px 8px), blur = 2-3x offset, color = rgba black 10-20%
- Inner light shadow: NEGATIVE offset (-6px -6px), white at 40-60% opacity
- Inner dark shadow: POSITIVE offset (6px 6px), black at 5-10% opacity
- NEVER use sharp shadows (always blur > 0)

---

## COLOR PALETTES (5 options)

### Lavender Dream (default)
```css
--clay-bg: #E8D5F5;
--clay-surface: #FFFFFF;
--clay-accent: #7C5CFC;
```

### Mint Fresh
```css
--clay-bg: #D1F2EB;
--clay-surface: #FFFFFF;
--clay-accent: #2ECC71;
```

### Peach Glow
```css
--clay-bg: #FDDCB5;
--clay-surface: #FFFFFF;
--clay-accent: #FF6B35;
```

### Sky Blue
```css
--clay-bg: #C5DFFB;
--clay-surface: #FFFFFF;
--clay-accent: #3B82F6;
```

### Bubblegum Pink
```css
--clay-bg: #FBCFE8;
--clay-surface: #FFFFFF;
--clay-accent: #EC4899;
```

**CRITICAL**: Background MUST be pastel (light). Claymorphism does NOT work on very dark backgrounds — the inner shadows become invisible.

---

## TYPOGRAPHY

```css
/* Use rounded, friendly fonts — NEVER sharp/angular fonts */
@import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap');
/* Alternative: Poppins, Quicksand, Comfortaa, Baloo 2 */

body {
  font-family: 'Nunito', sans-serif;
  color: var(--clay-text);
}

h1 { font-size: clamp(2rem, 5vw, 3.5rem); font-weight: 800; }
h2 { font-size: clamp(1.5rem, 3vw, 2.5rem); font-weight: 700; }
p  { font-size: 1rem; line-height: 1.7; color: var(--clay-text-muted); }
```

---

## BUTTONS

```css
.clay-btn {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 14px 32px;
  border: none;
  border-radius: var(--clay-radius-btn);
  font-family: inherit;
  font-weight: 700;
  font-size: 1rem;
  cursor: pointer;
  transition: all 0.2s ease;

  /* Primary button */
  background: linear-gradient(135deg, var(--clay-accent), #9F7AFF);
  color: #FFFFFF;
  box-shadow:
    6px 6px 16px 0 rgba(124, 92, 252, 0.35),
    inset -4px -4px 10px 0 rgba(255, 255, 255, 0.25),
    inset 4px 4px 10px 0 rgba(0, 0, 0, 0.1);
}

.clay-btn:hover {
  transform: translateY(-2px);
  box-shadow:
    8px 10px 20px 0 rgba(124, 92, 252, 0.4),
    inset -4px -4px 10px 0 rgba(255, 255, 255, 0.3),
    inset 4px 4px 10px 0 rgba(0, 0, 0, 0.08);
}

.clay-btn:active {
  transform: translateY(1px);
  box-shadow:
    2px 2px 8px 0 rgba(124, 92, 252, 0.25),
    inset -4px -4px 10px 0 rgba(255, 255, 255, 0.2),
    inset 4px 4px 10px 0 rgba(0, 0, 0, 0.12);
}

/* Secondary — outline clay button */
.clay-btn-secondary {
  background: var(--clay-surface);
  color: var(--clay-accent);
  box-shadow:
    6px 6px 16px 0 rgba(0, 0, 0, 0.1),
    inset -4px -4px 10px 0 rgba(255, 255, 255, 0.5),
    inset 4px 4px 10px 0 rgba(0, 0, 0, 0.05);
}
```

---

## CARDS

```css
.clay-card {
  background: var(--clay-surface);
  border-radius: var(--clay-radius);
  padding: 40px;
  box-shadow:
    8px 8px 20px 0 rgba(0, 0, 0, 0.15),
    inset -6px -6px 14px 0 rgba(255, 255, 255, 0.5),
    inset 6px 6px 14px 0 rgba(0, 0, 0, 0.07);
  transition: transform 0.3s ease;
}

.clay-card:hover {
  transform: translateY(-4px);
}

/* Icon circle inside card */
.clay-icon-circle {
  width: 64px;
  height: 64px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5rem;
  background: linear-gradient(135deg, var(--clay-accent), #A78BFA);
  color: white;
  box-shadow:
    4px 4px 10px 0 rgba(124, 92, 252, 0.3),
    inset -3px -3px 8px 0 rgba(255, 255, 255, 0.25),
    inset 3px 3px 8px 0 rgba(0, 0, 0, 0.1);
}
```

---

## INPUT FIELDS

```css
.clay-input {
  width: 100%;
  padding: 16px 24px;
  border: none;
  border-radius: var(--clay-radius-btn);
  font-family: inherit;
  font-size: 1rem;
  color: var(--clay-text);
  background: rgba(255, 255, 255, 0.6);
  box-shadow:
    inset 4px 4px 10px 0 rgba(0, 0, 0, 0.08),
    inset -4px -4px 10px 0 rgba(255, 255, 255, 0.6);
  outline: none;
  transition: box-shadow 0.2s ease;
}

.clay-input:focus {
  box-shadow:
    inset 4px 4px 10px 0 rgba(124, 92, 252, 0.15),
    inset -4px -4px 10px 0 rgba(255, 255, 255, 0.7),
    0 0 0 3px rgba(124, 92, 252, 0.2);
}

.clay-input::placeholder {
  color: #A0AEC0;
}
```

---

## LAYOUT

```css
/* Pastel gradient background — essential for clay to pop */
body {
  min-height: 100vh;
  background: linear-gradient(160deg, var(--clay-bg) 0%, #F0E6FF 100%);
}

/* Card grid */
.clay-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 32px;
  padding: 40px;
  max-width: 1200px;
  margin: 0 auto;
}
```

---

## DARK MODE (modified — NOT pure black)

```css
@media (prefers-color-scheme: dark) {
  :root {
    --clay-bg: #2A1F3D;
    --clay-surface: #3D2E56;        /* Dusky purple, NOT black */
    --clay-text: #F0E6FF;
    --clay-text-muted: #B8A9D4;
  }

  .clay-card {
    box-shadow:
      8px 8px 20px 0 rgba(0, 0, 0, 0.4),
      inset -6px -6px 14px 0 rgba(255, 255, 255, 0.08),
      inset 6px 6px 14px 0 rgba(0, 0, 0, 0.2);
  }
}
```

**IMPORTANT**: Dark mode clay surfaces must be mid-tone (NOT black). Inner shadows need visible contrast.

---

## COMMON MISTAKES

1. ❌ Using flat black background — inner shadows invisible
2. ❌ Using sharp corners (border-radius < 16px) — kills the "clay" feel
3. ❌ Using only one shadow — need ALL THREE for the effect
4. ❌ Using serif or monospace fonts — feels wrong, use rounded sans-serif
5. ❌ Too many colors — stick to 1-2 accent colors max on pastel base
6. ❌ Forgetting hover states — clay buttons MUST feel "pressable"

---

## FULL PAGE TEMPLATE STRUCTURE

```html
<body>
  <nav class="clay-nav">
    <a href="index.html" class="logo">Brand ✨</a>
    <ul>
      <li><a href="index.html">Home</a></li>
      <li><a href="features.html">Features</a></li>
      <li><a href="pricing.html">Pricing</a></li>
    </ul>
  </nav>

  <section class="hero">
    <h1>Friendly. Playful. <span class="accent">Beautiful.</span></h1>
    <p>Build delightful interfaces that users love to touch.</p>
    <div class="hero-buttons">
      <a href="#" class="clay-btn">Get Started</a>
      <a href="#" class="clay-btn-secondary clay-btn">Learn More</a>
    </div>
  </section>

  <section class="clay-grid">
    <div class="clay-card">
      <div class="clay-icon-circle">🎨</div>
      <h3>Design</h3>
      <p>Beautiful interfaces that feel real.</p>
    </div>
    <!-- More cards... -->
  </section>

  <footer class="clay-card" style="text-align:center; margin: 40px;">
    <p>&copy; 2024 Brand. Made with ❤️</p>
  </footer>
</body>
```
