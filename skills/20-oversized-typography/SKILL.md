---
name: oversized-typography
description: Giant bold typography as the primary visual element replacing hero images. THE most widespread trend 2022-2024 across all industries. Viewport-sized text (8-20vw), mixed font weights, outline/filled text combos, text-image masking, horizontal scroll text. Clean and impactful. Perfect for ANY site that needs a strong first impression — agencies, startups, portfolios, brands, restaurants, events. Different from kinetic-typography (which focuses on animation) — this focuses on SCALE and visual weight. ALWAYS combine with 11-responsive-premium skill.
---

# Oversized Typography Hero Design

**Era**: 2022-2024 (dominant across all industries) | **Vibe**: Bold, confident, impactful, modern
**Best for**: Literally everything — agencies, restaurants, startups, portfolios, brands, events, retail
**This is THE trend** — replaces hero images with massive text

---

## CORE FORMULA

```css
@import url('https://fonts.googleapis.com/css2?family=Syne:wght@400;700;800&family=DM+Sans:wght@400;500;700&display=swap');

:root {
  --font-hero: 'Syne', sans-serif;
  --font-body: 'DM Sans', sans-serif;

  /* The scale — viewport-based */
  --fs-hero: clamp(4rem, 14vw, 14rem);
  --fs-sub-hero: clamp(2.5rem, 8vw, 7rem);
  --fs-section: clamp(2rem, 5vw, 4.5rem);
  --fs-body: clamp(1rem, 1.1vw, 1.125rem);

  --color-bg: #FAFAFA;
  --color-text: #111111;
  --color-accent: #FF3D00;
  --color-muted: #777777;
  --color-border: #E5E5E5;
}
```

---

## HERO PATTERN 1: Full-Width Stacked Text

```css
.hero {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 0 clamp(20px, 4vw, 80px);
  overflow: hidden;
}

.hero h1 {
  font-family: var(--font-hero);
  font-size: var(--fs-hero);
  font-weight: 800;
  line-height: 0.9;
  letter-spacing: -0.04em;
  text-transform: uppercase;
  color: var(--color-text);
  margin: 0;
}

.hero h1 .line {
  display: block;
}

/* Second line — different treatment */
.hero h1 .line-outline {
  color: transparent;
  -webkit-text-stroke: 2px var(--color-text);
}

.hero h1 .line-accent {
  color: var(--color-accent);
}
```

```html
<section class="hero">
  <h1>
    <span class="line">We Create</span>
    <span class="line line-outline">Digital</span>
    <span class="line line-accent">Experiences</span>
  </h1>
</section>
```

---

## HERO PATTERN 2: Mixed Weight & Style

```css
.hero-mixed h1 {
  font-family: var(--font-hero);
  font-size: var(--fs-hero);
  line-height: 0.95;
  margin: 0;
}

.hero-mixed .thin {
  font-weight: 400;
  font-style: italic;
}

.hero-mixed .bold {
  font-weight: 800;
  text-transform: uppercase;
}

.hero-mixed .small-inline {
  font-size: 0.3em;
  vertical-align: super;
  font-weight: 400;
  letter-spacing: 0.1em;
  text-transform: uppercase;
}
```

```html
<h1>
  <span class="thin">the art of</span><br>
  <span class="bold">Coffee</span>
  <span class="small-inline">since 2015</span>
</h1>
```

---

## HERO PATTERN 3: Text + Small Element Combo

```css
.hero-split {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 40px;
  align-items: end;
  min-height: 100vh;
  padding: 60px clamp(20px, 4vw, 80px);
}

.hero-split h1 {
  font-family: var(--font-hero);
  font-size: var(--fs-hero);
  font-weight: 800;
  line-height: 0.85;
  text-transform: uppercase;
  grid-column: 1 / -1; /* Full width */
}

.hero-split .intro-text {
  font-size: var(--fs-body);
  line-height: 1.7;
  color: var(--color-muted);
  max-width: 400px;
}

.hero-split .cta {
  text-align: right;
}

@media (max-width: 768px) {
  .hero-split {
    grid-template-columns: 1fr;
  }
}
```

---

## HERO PATTERN 4: Text with Inline Image

```css
.hero-inline-img h1 {
  font-family: var(--font-hero);
  font-size: clamp(3rem, 10vw, 10rem);
  font-weight: 800;
  line-height: 1;
  text-transform: uppercase;
}

/* Image embedded inside text flow */
.hero-inline-img .inline-img {
  display: inline-block;
  width: 0.8em;
  height: 0.5em;
  border-radius: 100px;
  overflow: hidden;
  vertical-align: middle;
  margin: 0 0.05em;
}

.hero-inline-img .inline-img img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
```

```html
<h1>
  WE
  <span class="inline-img"><img src="images/photo.jpg" alt=""></span>
  BUILD
</h1>
```

---

## SECTION HEADERS (throughout the page)

```css
.section-header {
  font-family: var(--font-hero);
  font-size: var(--fs-section);
  font-weight: 800;
  line-height: 1;
  text-transform: uppercase;
  letter-spacing: -0.02em;
  margin-bottom: 40px;
}

/* Numbered section */
.section-numbered {
  display: flex;
  align-items: baseline;
  gap: 24px;
}

.section-numbered .number {
  font-family: var(--font-hero);
  font-size: clamp(5rem, 10vw, 8rem);
  font-weight: 800;
  color: var(--color-border);
  line-height: 1;
}

.section-numbered h2 {
  font-family: var(--font-hero);
  font-size: var(--fs-section);
  font-weight: 800;
  text-transform: uppercase;
}
```

---

## NAVIGATION (minimal, stays out of text's way)

```css
.nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 24px clamp(20px, 4vw, 80px);
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  z-index: 10;
}

.nav .logo {
  font-family: var(--font-hero);
  font-size: 1.25rem;
  font-weight: 800;
  text-transform: uppercase;
  color: var(--color-text);
  text-decoration: none;
}

.nav a {
  font-family: var(--font-body);
  font-size: 0.875rem;
  color: var(--color-muted);
  text-decoration: none;
  transition: color 0.2s;
}

.nav a:hover { color: var(--color-text); }
```

---

## BUTTONS

```css
/* Simple, doesn't compete with typography */
.btn {
  display: inline-flex;
  align-items: center;
  gap: 12px;
  padding: 16px 36px;
  background: var(--color-text);
  color: var(--color-bg);
  border: none;
  border-radius: 999px;
  font-family: var(--font-body);
  font-size: 0.9375rem;
  font-weight: 500;
  cursor: pointer;
  text-decoration: none;
  transition: all 0.2s;
}

.btn:hover {
  background: var(--color-accent);
}

/* Arrow icon */
.btn .arrow {
  transition: transform 0.2s;
}

.btn:hover .arrow {
  transform: translateX(4px);
}
```

---

## DARK MODE

```css
:root {
  --color-bg: #0A0A0A;
  --color-text: #FAFAFA;
  --color-accent: #FF5722;
  --color-muted: #888888;
  --color-border: #2A2A2A;
}

.hero h1 .line-outline {
  -webkit-text-stroke-color: var(--color-text);
}
```

---

## ALTERNATIVE FONT PAIRINGS

### Geometric Bold
```css
--font-hero: 'Bebas Neue', sans-serif;  /* Condensed uppercase */
--font-body: 'Inter', sans-serif;
```

### Elegant Power
```css
--font-hero: 'Instrument Serif', serif;
--font-body: 'DM Sans', sans-serif;
/* Use at normal weight, larger size, no uppercase */
```

### Industrial
```css
--font-hero: 'Oswald', sans-serif;
--font-body: 'Source Sans 3', sans-serif;
/* Condensed + uppercase = maximum impact per line */
```

---

## RESPONSIVE CRITICAL RULES

```css
@media (max-width: 768px) {
  /* Text naturally scales via clamp() — no manual overrides needed */

  .hero h1 .line-outline {
    /* Thinner stroke on mobile */
    -webkit-text-stroke-width: 1px;
  }

  /* Simplify grids */
  .hero-split {
    grid-template-columns: 1fr;
    min-height: auto;
    padding-top: 120px;
  }

  /* Inline images smaller */
  .hero-inline-img .inline-img {
    width: 0.6em;
    height: 0.35em;
  }
}
```

---

## COMMON MISTAKES

1. ❌ Fixed `font-size: 120px` — MUST use `clamp()` with `vw` unit
2. ❌ Normal line-height (1.5) on hero text — use 0.85-0.95 for tight display
3. ❌ Normal letter-spacing — negative tracking (-0.02 to -0.04em) is essential
4. ❌ Too many words in hero — max 3-5 words per line, fewer = better
5. ❌ Competing elements (images, icons) around hero text — text IS the visual
6. ❌ Using lightweight font for hero — must be 700-900 weight (or very intentional 300 italic)
7. ❌ Same size for all headings — vary dramatically between sections for rhythm
