---
name: scrapbook-collage
description: Handmade scrapbook/zine aesthetic with sticker visuals, handwriting fonts, cut-and-paste collage, tape effects, doodle illustrations, paper textures. Major 2023-2024 trend driven by authenticity over AI polish. Perfect for personal blogs, creative portfolios, independent brands, zines, youth brands, craft businesses, event pages. Uses mix of rotation, irregular placement, decorative elements. ALWAYS combine with 11-responsive-premium and 12-deployment-paths skills.
---

# Scrapbook Collage / DIY Aesthetic

**Era**: 2023-2024 (rising) | **Vibe**: Handmade, authentic, playful, personal, anti-corporate
**Best for**: Personal blogs, creative portfolios, indie brands, craft businesses, zines, youth marketing, event sites, musicians, artists
**Avoid for**: Corporate, enterprise, fintech, medical, legal

---

## CORE PRINCIPLE

Everything looks like it was **physically assembled** by hand. Images are taped, text is handwritten, backgrounds are paper-textured, elements are slightly crooked. The imperfection IS the design.

---

## COLOR PALETTE

```css
:root {
  /* Paper and craft colors */
  --paper-bg: #FDF6E9;          /* Warm cream paper */
  --paper-white: #FFFFFF;
  --tape-color: rgba(255, 228, 150, 0.6);  /* Semi-transparent yellow tape */
  --ink-black: #2C2C2C;
  --ink-blue: #3D5A99;
  --ink-red: #CC3333;
  --marker-pink: #FF6B9D;
  --marker-green: #4CAF50;
  --marker-yellow: #FFE066;
  --pencil-grey: #999999;
  --shadow-paper: rgba(0, 0, 0, 0.08);
}
```

---

## TYPOGRAPHY

```css
/* Mix of handwriting + typewriter + playful sans */
@import url('https://fonts.googleapis.com/css2?family=Caveat:wght@400;700&family=Special+Elite&family=Quicksand:wght@400;600;700&display=swap');

:root {
  --font-handwriting: 'Caveat', cursive;       /* Headers, labels */
  --font-typewriter: 'Special Elite', monospace; /* Captions, dates */
  --font-body: 'Quicksand', sans-serif;         /* Body text */
}

h1 {
  font-family: var(--font-handwriting);
  font-size: clamp(2.5rem, 6vw, 5rem);
  font-weight: 700;
  color: var(--ink-black);
  transform: rotate(-2deg);
  line-height: 1.2;
}

h2 {
  font-family: var(--font-handwriting);
  font-size: clamp(1.8rem, 4vw, 3rem);
  color: var(--ink-blue);
}

.typewriter {
  font-family: var(--font-typewriter);
  font-size: 0.9rem;
  color: var(--pencil-grey);
  letter-spacing: 0.02em;
}

p {
  font-family: var(--font-body);
  font-size: 1rem;
  line-height: 1.8;
  color: var(--ink-black);
}
```

---

## PAPER BACKGROUND

```css
body {
  background-color: var(--paper-bg);
  /* Lined paper pattern */
  background-image:
    repeating-linear-gradient(
      transparent,
      transparent 31px,
      rgba(0, 0, 0, 0.03) 31px,
      rgba(0, 0, 0, 0.03) 32px
    );
  background-size: 100% 32px;
}

/* Grid paper variant */
.grid-paper {
  background-color: var(--paper-white);
  background-image:
    linear-gradient(rgba(0,0,0,0.04) 1px, transparent 1px),
    linear-gradient(90deg, rgba(0,0,0,0.04) 1px, transparent 1px);
  background-size: 24px 24px;
}

/* Kraft paper variant */
.kraft-paper {
  background-color: #C4A97D;
  background-image: url("data:image/svg+xml,%3Csvg width='200' height='200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='paper'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.04' numOctaves='5'/%3E%3CfeColorMatrix type='saturate' values='0'/%3E%3C/filter%3E%3Crect width='200' height='200' filter='url(%23paper)' opacity='0.08'/%3E%3C/svg%3E");
}
```

---

## TAPE EFFECT

```css
/* Scotch tape strip */
.tape {
  position: relative;
}

.tape::before {
  content: '';
  position: absolute;
  top: -12px;
  left: 50%;
  transform: translateX(-50%) rotate(2deg);
  width: 80px;
  height: 28px;
  background: var(--tape-color);
  border-left: 1px solid rgba(0, 0, 0, 0.05);
  border-right: 1px solid rgba(0, 0, 0, 0.05);
  z-index: 2;
}

/* Washi tape (colored/patterned) */
.washi-tape {
  position: absolute;
  width: 120px;
  height: 30px;
  background: repeating-linear-gradient(
    45deg,
    var(--marker-pink),
    var(--marker-pink) 4px,
    #FF8FB8 4px,
    #FF8FB8 8px
  );
  opacity: 0.7;
  transform: rotate(-5deg);
}
```

---

## PHOTO / IMAGE STYLING

```css
/* Taped photo */
.scrap-photo {
  background: white;
  padding: 8px;
  box-shadow: 2px 3px 8px var(--shadow-paper);
  transform: rotate(-3deg);
  display: inline-block;
  position: relative;
}

.scrap-photo img {
  display: block;
  width: 100%;
}

/* Random rotations */
.scrap-photo:nth-child(2n) { transform: rotate(2deg); }
.scrap-photo:nth-child(3n) { transform: rotate(-4deg); }
.scrap-photo:nth-child(4n) { transform: rotate(1.5deg); }

/* Polaroid with caption */
.polaroid {
  background: white;
  padding: 10px 10px 40px 10px;
  box-shadow: 0 3px 10px rgba(0,0,0,0.12);
  display: inline-block;
}

.polaroid .caption {
  font-family: var(--font-handwriting);
  font-size: 1rem;
  color: var(--ink-black);
  text-align: center;
  margin-top: 8px;
}

/* Torn edge effect (top) */
.torn-edge {
  position: relative;
  overflow: visible;
}

.torn-edge::before {
  content: '';
  position: absolute;
  top: -8px;
  left: 0;
  right: 0;
  height: 16px;
  background: var(--paper-bg);
  clip-path: polygon(
    0% 100%, 3% 60%, 7% 90%, 12% 50%, 18% 80%,
    24% 40%, 30% 70%, 36% 30%, 42% 65%, 48% 45%,
    54% 75%, 60% 35%, 66% 60%, 72% 25%, 78% 55%,
    84% 40%, 90% 70%, 95% 50%, 100% 100%
  );
}
```

---

## STICKER ELEMENTS

```css
.sticker {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  padding: 8px 16px;
  background: var(--marker-yellow);
  border-radius: 4px;
  font-family: var(--font-handwriting);
  font-size: 1.1rem;
  font-weight: 700;
  color: var(--ink-black);
  transform: rotate(-2deg);
  box-shadow: 1px 2px 4px rgba(0,0,0,0.1);
}

/* Circle sticker */
.sticker-circle {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  background: var(--marker-pink);
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: var(--font-handwriting);
  font-size: 0.9rem;
  font-weight: 700;
  transform: rotate(8deg);
  box-shadow: 2px 2px 6px rgba(0,0,0,0.15);
}
```

---

## DOODLE UNDERLINES & HIGHLIGHTS

```css
/* Wavy underline */
.doodle-underline {
  text-decoration: none;
  background-image: url("data:image/svg+xml,%3Csvg width='100' height='8' viewBox='0 0 100 8' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0 4 Q25 0 50 4 T100 4' stroke='%23CC3333' fill='none' stroke-width='2'/%3E%3C/svg%3E");
  background-repeat: repeat-x;
  background-position: bottom;
  background-size: 100px 8px;
  padding-bottom: 6px;
}

/* Marker highlight */
.highlight-marker {
  background: linear-gradient(to bottom, transparent 55%, var(--marker-yellow) 55%, var(--marker-yellow) 90%, transparent 90%);
  padding: 0 4px;
}

/* Circle around text */
.circle-highlight {
  position: relative;
}

.circle-highlight::after {
  content: '';
  position: absolute;
  inset: -8px -12px;
  border: 2px solid var(--ink-red);
  border-radius: 50%;
  transform: rotate(-3deg);
}
```

---

## LAYOUT

```css
.container {
  max-width: 1000px;
  margin: 0 auto;
  padding: 40px clamp(20px, 4vw, 60px);
}

/* Scattered layout — using CSS Grid with random placement */
.collage-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
  padding: 40px;
}

.collage-grid > * {
  transition: transform 0.3s ease;
}

.collage-grid > *:hover {
  transform: scale(1.05) rotate(0deg) !important;
  z-index: 10;
}
```

---

## RESPONSIVE

```css
@media (max-width: 768px) {
  .collage-grid {
    grid-template-columns: 1fr;
    gap: 24px;
  }

  /* Reduce rotations on mobile for readability */
  .scrap-photo,
  .sticker,
  h1 {
    transform: rotate(0deg) !important;
  }

  /* Simplify tape effects */
  .tape::before {
    display: none;
  }
}
```

---

## COMMON MISTAKES

1. ❌ Too much rotation — everything rotated looks chaotic; limit to 2-4 degrees
2. ❌ Using stock photos without vintage filter — needs to look "printed and cut out"
3. ❌ Perfect alignment — the whole point is slight imperfection
4. ❌ Missing paper texture — without texture it's just "messy" not "scrapbook"
5. ❌ Using this for professional/corporate — will look unprofessional
6. ❌ Heavy elements on mobile — tape effects and stickers need simplification
