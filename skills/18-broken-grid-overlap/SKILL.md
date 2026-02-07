---
name: broken-grid-overlap
description: Asymmetric, rule-breaking layouts with overlapping elements, off-grid placement, creative z-index stacking. Major 2022-2024 trend moving away from rigid 12-column grids. Uses CSS Grid with negative margins, overlapping images+text, rotated elements, irregular spacing. Perfect for creative agencies, art portfolios, fashion brands, editorial, museums, architecture firms. NOT for e-commerce, dashboards, or data-heavy sites. ALWAYS combine with 11-responsive-premium and 12-deployment-paths skills.
---

# Broken Grid & Overlapping Layout Design Style

**Era**: 2022-2024 (evolving trend) | **Vibe**: Creative, editorial, art-gallery, dynamic, unexpected
**Best for**: Creative agencies, artists, fashion, architecture, museums, editorial, portfolios, luxury brands
**Avoid for**: E-commerce product grids, admin dashboards, data tables, documentation

---

## CORE PRINCIPLE

Break the grid intentionally. Elements overlap, text sits on images, images bleed off-screen, spacing is irregular. But the **hierarchy remains clear** — chaos with purpose.

---

## CSS GRID OVERLAP TECHNIQUE

```css
/* Overlapping grid — items share grid cells */
.overlap-grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  grid-template-rows: auto;
  gap: 0; /* No gap — overlap is the point */
  max-width: 1400px;
  margin: 0 auto;
  padding: 100px clamp(20px, 4vw, 80px);
}

/* Image spans columns 1-7, rows 1-3 */
.overlap-grid .image-block {
  grid-column: 1 / 8;
  grid-row: 1 / 4;
  z-index: 1;
}

.overlap-grid .image-block img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

/* Text overlaps image — spans columns 5-12, row 2-4 */
.overlap-grid .text-block {
  grid-column: 5 / 13;
  grid-row: 2 / 5;
  z-index: 2;
  background: var(--bg);
  padding: 60px;
  align-self: center;
}
```

---

## COLOR PALETTE

```css
:root {
  --bg: #F8F5F0;               /* Warm off-white */
  --text-primary: #1A1A1A;
  --text-muted: #6B6B6B;
  --accent: #D03A2B;           /* Bold red */
  --accent-secondary: #2B5AD0; /* Deep blue */
  --surface: #FFFFFF;
  --border: #E0DCD6;
}
```

---

## TYPOGRAPHY

```css
@import url('https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Inter:wght@400;500&display=swap');

:root {
  --font-display: 'Instrument Serif', Georgia, serif;
  --font-body: 'Inter', sans-serif;
}

/* Oversized editorial headline */
.hero-headline {
  font-family: var(--font-display);
  font-size: clamp(3rem, 8vw, 8rem);
  font-weight: 400; /* Serif looks best at regular weight */
  line-height: 0.95;
  letter-spacing: -0.02em;
  color: var(--text-primary);
}

/* Italic accent */
.hero-headline em {
  font-style: italic;
  color: var(--accent);
}
```

---

## OVERLAP PATTERNS

### Pattern 1: Image + Text Card Overlap
```css
.overlap-section {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  min-height: 80vh;
  align-items: center;
}

.overlap-img {
  grid-column: 1 / 7;
  grid-row: 1;
  z-index: 1;
}

.overlap-content {
  grid-column: 5 / 12;
  grid-row: 1;
  z-index: 2;
  background: var(--surface);
  padding: 60px;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.08);
}
```

### Pattern 2: Stacked with Offset
```css
.stacked-cards {
  position: relative;
  padding: 100px 0;
}

.stacked-cards .card-back {
  width: 60%;
  aspect-ratio: 4/3;
  background: var(--accent);
  border-radius: 4px;
}

.stacked-cards .card-front {
  position: absolute;
  top: 60px;
  right: 10%;
  width: 50%;
  background: var(--surface);
  padding: 48px;
  box-shadow: 0 16px 48px rgba(0, 0, 0, 0.1);
}
```

### Pattern 3: Bleeding Edge (image goes off-screen)
```css
.bleed-section {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 60px;
  align-items: center;
  overflow: visible; /* Allow bleed */
}

.bleed-image {
  margin-left: -10vw;  /* Bleeds left */
  width: calc(100% + 10vw);
}

.bleed-image img {
  width: 100%;
  height: 600px;
  object-fit: cover;
}
```

### Pattern 4: Rotated Element
```css
.rotated-accent {
  transform: rotate(-3deg);
  background: var(--accent);
  color: white;
  padding: 20px 40px;
  display: inline-block;
  font-family: var(--font-display);
  font-size: clamp(1.5rem, 3vw, 2.5rem);
  margin: -20px 0; /* Pull into surrounding content */
}
```

### Pattern 5: Large Number / Text Behind Content
```css
.behind-text {
  position: relative;
}

.behind-text .bg-number {
  font-family: var(--font-display);
  font-size: clamp(10rem, 25vw, 20rem);
  font-weight: 400;
  color: rgba(0, 0, 0, 0.04);
  position: absolute;
  top: -20%;
  left: -5%;
  line-height: 1;
  z-index: 0;
  user-select: none;
}

.behind-text .content {
  position: relative;
  z-index: 1;
}
```

---

## IRREGULAR SPACING

```css
/* Instead of uniform padding, use varied spacing */
.section-tight  { padding: 40px 0; }
.section-normal { padding: 100px 0; }
.section-loose  { padding: 160px 0; }

/* Asymmetric padding (more on one side) */
.asymmetric-pad {
  padding-left: 15%;
  padding-right: 5%;
}

/* Negative margin to pull element up into previous section */
.pull-up {
  margin-top: -80px;
  position: relative;
  z-index: 2;
}
```

---

## RESPONSIVE STRATEGY

**CRITICAL**: Broken grids must simplify on mobile.

```css
@media (max-width: 768px) {
  /* Stack everything on mobile — NO overlaps */
  .overlap-grid {
    grid-template-columns: 1fr;
  }

  .overlap-grid .image-block,
  .overlap-grid .text-block {
    grid-column: 1;
    grid-row: auto;
  }

  .overlap-grid .text-block {
    padding: 30px 20px;
  }

  /* Remove bleeds */
  .bleed-image {
    margin-left: 0;
    width: 100%;
  }

  .bleed-section {
    grid-template-columns: 1fr;
  }

  /* Reduce oversized background text */
  .behind-text .bg-number {
    font-size: 8rem;
  }

  /* Remove rotations on mobile */
  .rotated-accent {
    transform: none;
  }
}
```

---

## PROJECT LIST (common in agency sites)

```css
.project-list {
  border-top: 1px solid var(--border);
}

.project-item {
  display: grid;
  grid-template-columns: auto 1fr auto;
  align-items: center;
  gap: 40px;
  padding: 32px 0;
  border-bottom: 1px solid var(--border);
  cursor: pointer;
  transition: all 0.3s ease;
}

.project-item:hover {
  padding-left: 20px;
}

.project-item .number {
  font-family: var(--font-body);
  font-size: 0.75rem;
  color: var(--text-muted);
}

.project-item .name {
  font-family: var(--font-display);
  font-size: clamp(1.5rem, 3vw, 3rem);
}

.project-item .category {
  font-size: 0.875rem;
  color: var(--text-muted);
  text-transform: uppercase;
  letter-spacing: 0.1em;
}
```

---

## COMMON MISTAKES

1. ❌ Overlapping on mobile — ALWAYS stack vertically on small screens
2. ❌ Random overlap without hierarchy — the most important element must have highest z-index
3. ❌ Overlapping text on busy images — text becomes unreadable; use solid background panel
4. ❌ Everything broken — you need some regular sections for contrast; rhythm matters
5. ❌ Forgetting `overflow: hidden` on containers — horizontal scrollbar appears
6. ❌ Using `position: absolute` for everything — prefer CSS Grid overlap (more maintainable)
