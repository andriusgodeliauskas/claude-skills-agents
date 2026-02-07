---
name: monochromatic-bold
description: Single-color design system using tones, tints, and shades of ONE base color. Major 2022-2024 trend for brand consistency and visual impact. Uses one hue across all elements — backgrounds, text, buttons, borders — varying only lightness and saturation. Clean, sophisticated, instantly recognizable. Perfect for personal brands, startups, product pages, corporate sites, portfolios. Extremely versatile — works for any industry. ALWAYS combine with 11-responsive-premium and 12-deployment-paths skills.
---

# Monochromatic Bold Design Style

**Era**: 2022-2024 | **Vibe**: Cohesive, bold, sophisticated, branded
**Best for**: ANY industry — personal brands, startups, product pages, corporate, portfolios
**The easiest trend to implement well** — one color, many tones.

---

## COLOR SYSTEM GENERATOR

Pick ONE base hue, then generate the full scale:

### Blue Mono (corporate/tech)
```css
:root {
  --mono-50:  #EFF6FF;    /* Lightest — backgrounds */
  --mono-100: #DBEAFE;    /* Light surface */
  --mono-200: #BFDBFE;    /* Borders, dividers */
  --mono-300: #93C5FD;    /* Muted text, icons */
  --mono-400: #60A5FA;    /* Secondary actions */
  --mono-500: #3B82F6;    /* PRIMARY — buttons, links */
  --mono-600: #2563EB;    /* Hover state */
  --mono-700: #1D4ED8;    /* Active state */
  --mono-800: #1E40AF;    /* Dark text on light bg */
  --mono-900: #1E3A5F;    /* Headings */
  --mono-950: #0C1929;    /* Darkest — dark mode bg */

  --white: #FFFFFF;
  --black: #0A0A0A;
}
```

### Green Mono (eco/finance)
```css
:root {
  --mono-50:  #F0FDF4;
  --mono-100: #DCFCE7;
  --mono-200: #BBF7D0;
  --mono-300: #86EFAC;
  --mono-400: #4ADE80;
  --mono-500: #22C55E;
  --mono-600: #16A34A;
  --mono-700: #15803D;
  --mono-800: #166534;
  --mono-900: #14532D;
  --mono-950: #052E16;
}
```

### Red Mono (bold/food/energy)
```css
:root {
  --mono-50:  #FEF2F2;
  --mono-100: #FEE2E2;
  --mono-200: #FECACA;
  --mono-300: #FCA5A5;
  --mono-400: #F87171;
  --mono-500: #EF4444;
  --mono-600: #DC2626;
  --mono-700: #B91C1C;
  --mono-800: #991B1B;
  --mono-900: #7F1D1D;
  --mono-950: #450A0A;
}
```

### Purple Mono (creative/luxury)
```css
:root {
  --mono-50:  #FAF5FF;
  --mono-100: #F3E8FF;
  --mono-200: #E9D5FF;
  --mono-300: #D8B4FE;
  --mono-400: #C084FC;
  --mono-500: #A855F7;
  --mono-600: #9333EA;
  --mono-700: #7E22CE;
  --mono-800: #6B21A8;
  --mono-900: #581C87;
  --mono-950: #2E1065;
}
```

---

## LIGHT MODE APPLICATION

```css
body {
  background: var(--mono-50);
  color: var(--mono-900);
  font-family: 'Inter', sans-serif;
}

h1, h2, h3 { color: var(--mono-950); }
p { color: var(--mono-700); }
a { color: var(--mono-500); }
a:hover { color: var(--mono-600); }

.card {
  background: var(--white);
  border: 1px solid var(--mono-200);
  border-radius: 12px;
  padding: 32px;
}

.card:hover { border-color: var(--mono-300); box-shadow: 0 4px 20px var(--mono-100); }

.btn-primary {
  background: var(--mono-500);
  color: var(--white);
  border: none;
  padding: 12px 24px;
  border-radius: 8px;
  font-weight: 600;
  cursor: pointer;
}

.btn-primary:hover { background: var(--mono-600); }

.btn-outline {
  background: transparent;
  color: var(--mono-500);
  border: 2px solid var(--mono-200);
  padding: 12px 24px;
  border-radius: 8px;
  font-weight: 600;
}

.btn-outline:hover { border-color: var(--mono-500); background: var(--mono-50); }

.badge {
  display: inline-flex;
  padding: 4px 12px;
  background: var(--mono-100);
  color: var(--mono-700);
  border-radius: 999px;
  font-size: 0.8125rem;
  font-weight: 500;
}

.nav {
  border-bottom: 1px solid var(--mono-100);
}

.nav a {
  color: var(--mono-500);
}

.nav a.active {
  color: var(--mono-900);
  font-weight: 600;
}

hr { border: none; border-top: 1px solid var(--mono-200); }

input, textarea {
  border: 1px solid var(--mono-200);
  border-radius: 8px;
  padding: 12px 16px;
  font-family: inherit;
}

input:focus, textarea:focus {
  border-color: var(--mono-500);
  box-shadow: 0 0 0 3px var(--mono-100);
  outline: none;
}
```

---

## DARK MODE APPLICATION

```css
@media (prefers-color-scheme: dark) {
  body {
    background: var(--mono-950);
    color: var(--mono-200);
  }

  h1, h2, h3 { color: var(--mono-50); }
  p { color: var(--mono-300); }

  .card {
    background: var(--mono-900);
    border-color: var(--mono-800);
  }

  .badge {
    background: var(--mono-900);
    color: var(--mono-300);
  }

  input, textarea {
    background: var(--mono-900);
    border-color: var(--mono-800);
    color: var(--mono-100);
  }
}
```

---

## HERO SECTION

```css
/* Full-color hero block */
.hero-mono {
  background: var(--mono-500);
  color: var(--white);
  padding: clamp(80px, 15vw, 160px) clamp(20px, 4vw, 80px);
  text-align: center;
}

.hero-mono h1 {
  color: var(--white);
  font-size: clamp(2.5rem, 6vw, 5rem);
  font-weight: 800;
}

.hero-mono p {
  color: var(--mono-200);
  max-width: 600px;
  margin: 20px auto 0;
}

.hero-mono .btn {
  background: var(--white);
  color: var(--mono-700);
}
```

---

## THE RULE: Black + White + ONE Color

Everything on the page should be:
- White/near-white backgrounds
- Black/dark text
- YOUR mono color for accents, buttons, links, borders, badges

**NEVER add a second hue.** If something needs emphasis, go darker or lighter in your chosen hue.

---

## COMMON MISTAKES
1. ❌ Adding a second color "just for contrast" — defeats the purpose
2. ❌ Using same shade for everything — need 5+ tonal steps (50-950)
3. ❌ Primary color for body text — too hard to read; use dark shades (800-950)
4. ❌ No white space — monochromatic needs breathing room
5. ❌ Neon saturation — slightly desaturated tones feel more premium
