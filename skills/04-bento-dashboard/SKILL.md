---
name: frontend-bento-dashboard
description: Create modern Bento Grid dashboard interfaces with modular card layouts, data visualization, and clean information architecture. Inspired by Apple keynotes and modern SaaS products. Use when user asks for dashboard, bento, modular, data-driven, analytics, admin panel, or Apple-style grid UI. Ideal for SaaS products, analytics platforms, admin panels, project management tools, and data-heavy applications.
---

# Bento Grid Dashboard Design System

Create interfaces organized like a Japanese bento lunchbox — modular, balanced, scannable, and satisfying. Each "box" contains distinct content, yet everything harmonizes into a cohesive whole.

## Core Aesthetic Philosophy

**The Feel**: Opening your perfectly organized workspace. Every metric, chart, and action has its place. Information density is high but never overwhelming. The grid creates visual rhythm and calm clarity.

**Mood Keywords**: Organized, modular, scannable, modern, productive, clean, intelligent

## Typography

- **Display**: `'General Sans', 'Geist', 'Satoshi'` — modern geometric sans-serif (NOTE: if these are unavailable, use `'Inter var', 'Sora'` from Google Fonts)
- **Monospace for data**: `'Geist Mono', 'JetBrains Mono', 'IBM Plex Mono'` — numbers and code
- **Body**: `'Inter', 'Sora'` — optimized for UI readability
- **Sizes**: Compact — body at 14px, labels at 12px, metrics at 32-48px
- **Weight**: Medium (500) for UI, Bold (700) for metrics, Regular (400) for descriptions
- Import: `Sora`, `Inter`, `JetBrains Mono`, `IBM Plex Mono`

## Color System

Neutral foundation with semantic color accents:

```css
:root {
  /* Backgrounds */
  --bg-base: #09090b;
  --bg-card: #18181b;
  --bg-card-hover: #27272a;
  --bg-elevated: #1f1f23;
  --bg-surface: rgba(255, 255, 255, 0.03);

  /* Borders */
  --border-default: #27272a;
  --border-hover: #3f3f46;

  /* Text */
  --text-primary: #fafafa;
  --text-secondary: #a1a1aa;
  --text-tertiary: #71717a;

  /* Semantic colors */
  --color-success: #22c55e;
  --color-warning: #eab308;
  --color-danger: #ef4444;
  --color-info: #3b82f6;

  /* Chart palette */
  --chart-1: #6366f1;
  --chart-2: #8b5cf6;
  --chart-3: #06b6d4;
  --chart-4: #f59e0b;
  --chart-5: #ec4899;

  /* Accent */
  --accent: #6366f1;
  --accent-soft: rgba(99, 102, 241, 0.1);
  --accent-border: rgba(99, 102, 241, 0.3);
}
```

### Light Mode
```css
[data-theme="light"] {
  --bg-base: #f4f4f5;
  --bg-card: #ffffff;
  --bg-card-hover: #fafafa;
  --border-default: #e4e4e7;
  --text-primary: #09090b;
  --text-secondary: #71717a;
}
```

## The Bento Grid — Core Layout

```css
.bento-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-auto-rows: minmax(180px, auto);
  gap: 16px;
  padding: 16px;
  max-width: 1400px;
  margin: 0 auto;
}

/* Size variants */
.bento-sm { grid-column: span 1; grid-row: span 1; }
.bento-md { grid-column: span 2; grid-row: span 1; }
.bento-lg { grid-column: span 2; grid-row: span 2; }
.bento-wide { grid-column: span 3; grid-row: span 1; }
.bento-full { grid-column: span 4; grid-row: span 1; }
.bento-tall { grid-column: span 1; grid-row: span 2; }

@media (max-width: 1024px) {
  .bento-grid { grid-template-columns: repeat(2, 1fr); }
  .bento-wide, .bento-full { grid-column: span 2; }
}

@media (max-width: 640px) {
  .bento-grid { grid-template-columns: 1fr; }
  .bento-md, .bento-lg, .bento-wide, .bento-full { grid-column: span 1; }
}
```

## Bento Card — Core Component

```css
.bento-card {
  background: var(--bg-card);
  border: 1px solid var(--border-default);
  border-radius: 16px;
  padding: 24px;
  display: flex;
  flex-direction: column;
  gap: 16px;
  transition: all 0.2s ease;
  overflow: hidden;
}

.bento-card:hover {
  background: var(--bg-card-hover);
  border-color: var(--border-hover);
}

/* Card header */
.bento-card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.bento-card-title {
  font-size: 0.8rem;
  font-weight: 500;
  color: var(--text-secondary);
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

/* Big metric display */
.metric-value {
  font-family: 'JetBrains Mono', monospace;
  font-size: 2.5rem;
  font-weight: 700;
  color: var(--text-primary);
  line-height: 1;
}

.metric-change {
  font-size: 0.8rem;
  font-weight: 500;
  display: flex;
  align-items: center;
  gap: 4px;
}

.metric-change.positive { color: var(--color-success); }
.metric-change.negative { color: var(--color-danger); }
```

## Status Indicators

```css
.status-dot {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  display: inline-block;
}

.status-dot.active {
  background: var(--color-success);
  box-shadow: 0 0 8px rgba(34, 197, 94, 0.4);
  animation: pulse 2s ease infinite;
}

@keyframes pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.5; }
}

/* Badge / Tag */
.badge {
  font-size: 0.7rem;
  font-weight: 600;
  padding: 4px 10px;
  border-radius: 6px;
  background: var(--accent-soft);
  color: var(--accent);
  border: 1px solid var(--accent-border);
}
```

## Animations & Motion

- **Card entrance**: Staggered scale-up from 0.95 → 1.0 with fade
- **Hover**: Subtle border color change, background shift
- **Numbers**: Count-up animation for metrics
- **Charts**: Draw-in animation for lines, grow-up for bars
- **Transitions**: `0.2s ease` — snappy, productive feel

```css
@keyframes cardIn {
  from { opacity: 0; transform: scale(0.95); }
  to { opacity: 1; transform: scale(1); }
}

.bento-card {
  animation: cardIn 0.4s ease both;
}
.bento-card:nth-child(1) { animation-delay: 0.05s; }
.bento-card:nth-child(2) { animation-delay: 0.1s; }
.bento-card:nth-child(3) { animation-delay: 0.15s; }
/* ...stagger continues */
```

## Mini Charts (CSS-only sparklines)

```css
.sparkline {
  display: flex;
  align-items: flex-end;
  gap: 2px;
  height: 40px;
}

.sparkline-bar {
  flex: 1;
  background: var(--accent);
  border-radius: 2px;
  min-width: 4px;
  transition: height 0.3s ease;
  opacity: 0.6;
}

.sparkline-bar:last-child {
  opacity: 1;
}
```

## Key Rules

1. **Grid gaps are consistent** — 16px everywhere, no exceptions
2. **Cards have uniform border-radius** — 16px for cards, 8px for inner elements
3. **Metrics use monospace** — numbers always in monospace font
4. **Color = meaning** — green for positive, red for negative, blue for info, yellow for warning
5. **Dark theme first** — dashboards work best on dark backgrounds
6. **Density over whitespace** — maximize information per viewport (unlike editorial)
7. **Responsive bento** — cards stack gracefully on smaller screens
8. **Subtle motion** — cards breathe on hover, numbers count up on load
9. **No decorative elements** — every element serves a data purpose
10. **Consistent card anatomy**: icon/label → metric → change indicator → mini chart

## When to Use

✅ Analytics dashboards, admin panels, project management, monitoring tools, CRM interfaces, SaaS products, developer tools, financial platforms
❌ Marketing landing pages, blogs, portfolios, e-commerce storefronts
