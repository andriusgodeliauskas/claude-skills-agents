---
name: dark-mode-elegance
description: Premium dark-first UI design with subtle gradients, glowing accents, and refined depth. The #1 most requested web design trend 2022-2024. NOT just "invert colors" — this is purpose-built dark aesthetic with proper contrast ratios, luminance layers, and accent glow effects. Perfect for SaaS, tech products, developer tools, AI/ML platforms, fintech, crypto, streaming services. ALWAYS combine with 11-responsive-premium skill.
---

# Dark Mode Elegance Design Style

**Era**: 2022-2024 (permanent trend) | **Vibe**: Premium, professional, modern, immersive
**Best for**: SaaS, AI/tech products, developer tools, fintech, crypto, streaming, gaming, portfolios
**Avoid for**: Children's products, healthcare (unless specifically asked), wedding sites

---

## CORE: LAYERED DARK SURFACES (NOT just #000000)

```css
:root {
  /* Dark surface hierarchy — 5 levels of elevation */
  --dark-bg: #09090B;            /* Base — deepest */
  --dark-surface-1: #0F0F13;     /* Cards level 1 */
  --dark-surface-2: #18181B;     /* Cards level 2 (elevated) */
  --dark-surface-3: #1F1F23;     /* Modals, dropdowns */
  --dark-surface-4: #27272A;     /* Hover states */

  /* Text hierarchy */
  --dark-text-primary: #FAFAFA;       /* 95% white — headers */
  --dark-text-secondary: #A1A1AA;     /* 63% — body text */
  --dark-text-tertiary: #52525B;      /* 32% — labels, muted */

  /* Borders — subtle, NOT white */
  --dark-border: rgba(255, 255, 255, 0.06);
  --dark-border-hover: rgba(255, 255, 255, 0.12);

  /* Accent — choose ONE strong color */
  --accent: #6366F1;             /* Indigo */
  --accent-glow: rgba(99, 102, 241, 0.15);
  --accent-hover: #818CF8;

  /* Gradients */
  --gradient-subtle: linear-gradient(180deg, rgba(255,255,255,0.03) 0%, rgba(255,255,255,0) 100%);
  --gradient-accent: linear-gradient(135deg, var(--accent) 0%, #8B5CF6 100%);
}
```

**CRITICAL RULES:**
1. NEVER use pure #000000 as background — it's too harsh
2. NEVER use pure #FFFFFF for text — use #FAFAFA (softer)
3. Surface elevation = slightly lighter shade (NOT shadow-based)
4. Borders at 6-12% white opacity — barely visible

---

## TYPOGRAPHY

```css
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
/* Inter is THE dark UI font. Alternatives: Geist, SF Pro, Instrument Sans */

body {
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
  color: var(--dark-text-secondary);
  background: var(--dark-bg);
  -webkit-font-smoothing: antialiased; /* Smoother text on dark bg */
  -moz-osx-font-smoothing: grayscale;
}

h1, h2, h3 { color: var(--dark-text-primary); font-weight: 600; }
h1 { font-size: clamp(2.5rem, 5vw, 4rem); letter-spacing: -0.02em; }
h2 { font-size: clamp(1.75rem, 3vw, 2.5rem); letter-spacing: -0.01em; }
```

**IMPORTANT**: Add `-webkit-font-smoothing: antialiased` on dark backgrounds — prevents "bold" looking thin text.

---

## CARD COMPONENTS

```css
.card {
  background: var(--dark-surface-1);
  border: 1px solid var(--dark-border);
  border-radius: 16px;
  padding: 32px;
  transition: all 0.2s ease;
}

.card:hover {
  background: var(--dark-surface-2);
  border-color: var(--dark-border-hover);
}

/* Accent glow card — for featured items */
.card-glow {
  background: var(--dark-surface-1);
  border: 1px solid rgba(99, 102, 241, 0.2);
  border-radius: 16px;
  padding: 32px;
  box-shadow: 0 0 40px -10px var(--accent-glow);
  position: relative;
  overflow: hidden;
}

/* Subtle gradient overlay at top */
.card-glow::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 1px;
  background: var(--gradient-accent);
  opacity: 0.6;
}
```

---

## BUTTONS

```css
/* Primary — solid accent */
.btn-primary {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 12px 24px;
  background: var(--accent);
  color: #FFFFFF;
  border: none;
  border-radius: 10px;
  font-family: inherit;
  font-size: 0.9375rem;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.15s ease;
}

.btn-primary:hover {
  background: var(--accent-hover);
  box-shadow: 0 0 20px -4px var(--accent-glow);
}

/* Secondary — ghost button */
.btn-secondary {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 12px 24px;
  background: transparent;
  color: var(--dark-text-primary);
  border: 1px solid var(--dark-border);
  border-radius: 10px;
  font-family: inherit;
  font-size: 0.9375rem;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.15s ease;
}

.btn-secondary:hover {
  background: var(--dark-surface-2);
  border-color: var(--dark-border-hover);
}
```

---

## GRADIENT MESH BACKGROUND

```css
/* Ambient background glow — adds depth */
.hero {
  position: relative;
  overflow: hidden;
}

.hero::before {
  content: '';
  position: absolute;
  top: -40%;
  left: 50%;
  transform: translateX(-50%);
  width: 800px;
  height: 600px;
  background: radial-gradient(
    ellipse at center,
    var(--accent-glow) 0%,
    transparent 70%
  );
  filter: blur(80px);
  pointer-events: none;
  z-index: 0;
}
```

---

## BADGES & TAGS

```css
.badge {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  padding: 6px 12px;
  background: var(--accent-glow);
  color: var(--accent-hover);
  border: 1px solid rgba(99, 102, 241, 0.2);
  border-radius: 999px;
  font-size: 0.8125rem;
  font-weight: 500;
}

.badge::before {
  content: '';
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: var(--accent);
}
```

---

## INPUT FIELDS

```css
.input {
  width: 100%;
  padding: 12px 16px;
  background: var(--dark-surface-1);
  border: 1px solid var(--dark-border);
  border-radius: 10px;
  color: var(--dark-text-primary);
  font-family: inherit;
  font-size: 0.9375rem;
  outline: none;
  transition: border-color 0.15s ease;
}

.input:focus {
  border-color: var(--accent);
  box-shadow: 0 0 0 3px var(--accent-glow);
}

.input::placeholder {
  color: var(--dark-text-tertiary);
}
```

---

## ACCENT COLOR PALETTES (choose ONE)

### Indigo (default — most versatile)
```css
--accent: #6366F1; --accent-glow: rgba(99,102,241,0.15); --accent-hover: #818CF8;
```

### Emerald (fintech, success)
```css
--accent: #10B981; --accent-glow: rgba(16,185,129,0.15); --accent-hover: #34D399;
```

### Rose (creative, bold)
```css
--accent: #F43F5E; --accent-glow: rgba(244,63,94,0.15); --accent-hover: #FB7185;
```

### Amber (warm, premium)
```css
--accent: #F59E0B; --accent-glow: rgba(245,158,11,0.15); --accent-hover: #FBBF24;
```

### Cyan (AI/tech)
```css
--accent: #06B6D4; --accent-glow: rgba(6,182,212,0.15); --accent-hover: #22D3EE;
```

---

## NAVIGATION

```css
.nav {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 16px clamp(20px, 4vw, 80px);
  border-bottom: 1px solid var(--dark-border);
  backdrop-filter: blur(12px);
  background: rgba(9, 9, 11, 0.8);
  position: sticky;
  top: 0;
  z-index: 100;
}

.nav a {
  color: var(--dark-text-secondary);
  text-decoration: none;
  font-size: 0.875rem;
  font-weight: 500;
  transition: color 0.15s ease;
}

.nav a:hover {
  color: var(--dark-text-primary);
}
```

---

## TABLE / DATA DISPLAY

```css
.table {
  width: 100%;
  border-collapse: collapse;
}

.table th {
  text-align: left;
  padding: 12px 16px;
  font-size: 0.75rem;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  color: var(--dark-text-tertiary);
  border-bottom: 1px solid var(--dark-border);
}

.table td {
  padding: 16px;
  color: var(--dark-text-secondary);
  border-bottom: 1px solid var(--dark-border);
}

.table tr:hover td {
  background: var(--dark-surface-1);
}
```

---

## DIVIDERS AND SEPARATORS

```css
hr {
  border: none;
  border-top: 1px solid var(--dark-border);
  margin: 60px 0;
}

/* Gradient divider */
.divider-gradient {
  height: 1px;
  background: linear-gradient(90deg,
    transparent 0%,
    var(--dark-border-hover) 50%,
    transparent 100%
  );
  border: none;
}
```

---

## CONTRAST REQUIREMENTS (WCAG AA)

| Element | Min Ratio | Actual |
|---------|-----------|--------|
| Primary text on bg | 4.5:1 | #FAFAFA on #09090B = 19.3:1 ✅ |
| Secondary text on bg | 4.5:1 | #A1A1AA on #09090B = 7.5:1 ✅ |
| Tertiary text on bg | 3:1 (decorative) | #52525B on #09090B = 3.2:1 ✅ |
| Accent on bg | 3:1 | #6366F1 on #09090B = 4.9:1 ✅ |

---

## COMMON MISTAKES

1. ❌ Pure black #000000 background — too harsh, use #09090B or #0A0A0C
2. ❌ Pure white #FFFFFF text — too bright, causes eye strain
3. ❌ Colored text for body copy — hard to read, only for accents/badges
4. ❌ White borders at high opacity — looks cheap, use 6-12% opacity
5. ❌ Missing `-webkit-font-smoothing: antialiased` — text looks chunky
6. ❌ Same surface color for all cards — need elevation hierarchy
7. ❌ Too many accent colors — ONE accent + white is plenty
