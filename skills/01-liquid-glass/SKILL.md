---
name: frontend-liquid-glass
description: Create premium Liquid Glass / Glassmorphism interfaces with frosted translucent panels, refraction effects, and layered depth. Inspired by Apple's Liquid Glass design language (iOS 26, macOS Tahoe). Use when user asks for glass-like, frosted, translucent, Apple-style, premium tech, or futuristic UI. Ideal for dashboards, SaaS products, fintech apps, weather apps, and modern landing pages.
---

# Liquid Glass / Glassmorphism Design System

Create interfaces that feel like responsive digital glass — translucent, luminous, and alive with depth. This style draws from Apple's Liquid Glass system where UI elements refract, reflect, and respond to their surroundings.

## Core Aesthetic Philosophy

**The Feel**: Premium, futuristic, calm sophistication. Like looking through a window into a beautifully organized digital world. Elements float on layers of frosted glass, creating hierarchy through transparency rather than solid boundaries.

**Mood Keywords**: Ethereal, premium, luminous, layered, serene, high-tech, polished

## Typography

- **Display**: `'SF Pro Display', 'Outfit', 'Plus Jakarta Sans'` — clean, geometric, modern
- **Body**: `'SF Pro Text', 'DM Sans', 'Manrope'` — highly readable at small sizes
- **Weights**: Light (300) for large headings, Regular (400) for body, Medium (500) for emphasis
- **Letter-spacing**: Slightly expanded for headings (-0.02em), normal for body
- Import from Google Fonts: `Outfit`, `Plus Jakarta Sans`, `DM Sans`, or `Manrope`

## Color System

Use CSS custom properties for theming:

```css
:root {
  /* Background: deep gradient mesh */
  --bg-primary: #0a0a1a;
  --bg-secondary: #12122a;
  --bg-gradient: linear-gradient(135deg, #0a0a2e 0%, #1a0a3e 25%, #0a1a3e 50%, #1a2a4e 75%, #0a0a2e 100%);

  /* Glass surfaces */
  --glass-bg: rgba(255, 255, 255, 0.05);
  --glass-bg-hover: rgba(255, 255, 255, 0.08);
  --glass-bg-active: rgba(255, 255, 255, 0.12);
  --glass-border: rgba(255, 255, 255, 0.1);
  --glass-border-strong: rgba(255, 255, 255, 0.18);

  /* Accent colors — iridescent spectrum */
  --accent-blue: #60a5fa;
  --accent-purple: #a78bfa;
  --accent-cyan: #22d3ee;
  --accent-pink: #f472b6;
  --accent-gradient: linear-gradient(135deg, #60a5fa, #a78bfa, #f472b6);

  /* Text */
  --text-primary: rgba(255, 255, 255, 0.95);
  --text-secondary: rgba(255, 255, 255, 0.6);
  --text-tertiary: rgba(255, 255, 255, 0.4);

  /* Shadows & glow */
  --shadow-glass: 0 8px 32px rgba(0, 0, 0, 0.3);
  --shadow-glow: 0 0 40px rgba(96, 165, 250, 0.15);
  --shadow-elevated: 0 20px 60px rgba(0, 0, 0, 0.4);
}
```

### Light Mode Variant
```css
[data-theme="light"] {
  --bg-primary: #e8ecf4;
  --bg-gradient: linear-gradient(135deg, #e0e7ff 0%, #f0e6ff 50%, #e0f0ff 100%);
  --glass-bg: rgba(255, 255, 255, 0.5);
  --glass-bg-hover: rgba(255, 255, 255, 0.65);
  --glass-border: rgba(255, 255, 255, 0.6);
  --text-primary: rgba(15, 15, 35, 0.95);
  --text-secondary: rgba(15, 15, 35, 0.6);
  --shadow-glass: 0 8px 32px rgba(100, 100, 150, 0.12);
}
```

## Glass Panel — The Core Component

Every surface is a glass panel:

```css
.glass-panel {
  background: var(--glass-bg);
  backdrop-filter: blur(20px) saturate(1.5);
  -webkit-backdrop-filter: blur(20px) saturate(1.5);
  border: 1px solid var(--glass-border);
  border-radius: 20px;
  box-shadow: var(--shadow-glass);
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.glass-panel:hover {
  background: var(--glass-bg-hover);
  border-color: var(--glass-border-strong);
  box-shadow: var(--shadow-glass), var(--shadow-glow);
  transform: translateY(-2px);
}
```

## Backgrounds — Gradient Mesh with Orbs

Create atmospheric depth with floating gradient orbs:

```css
body {
  background: var(--bg-gradient);
  min-height: 100vh;
  position: relative;
  overflow-x: hidden;
}

/* Floating orbs for atmosphere */
body::before,
body::after {
  content: '';
  position: fixed;
  border-radius: 50%;
  filter: blur(80px);
  opacity: 0.4;
  z-index: 0;
  animation: float 20s ease-in-out infinite;
}

body::before {
  width: 500px; height: 500px;
  background: radial-gradient(circle, #4f46e5, transparent 70%);
  top: -10%; left: -10%;
}

body::after {
  width: 400px; height: 400px;
  background: radial-gradient(circle, #ec4899, transparent 70%);
  bottom: -10%; right: -10%;
  animation-delay: -10s;
}

@keyframes float {
  0%, 100% { transform: translate(0, 0) scale(1); }
  33% { transform: translate(30px, -30px) scale(1.1); }
  66% { transform: translate(-20px, 20px) scale(0.9); }
}
```

## Animations & Motion

- **Page entry**: Staggered fade-up with blur-to-clear transition
- **Hover**: Subtle lift (translateY -2px) + glow intensification
- **Glass shimmer**: Subtle moving highlight along top border on hover
- **Transitions**: Always use `cubic-bezier(0.4, 0, 0.2, 1)` — smooth, Apple-like

```css
@keyframes fadeInUp {
  from { opacity: 0; transform: translateY(20px); filter: blur(10px); }
  to { opacity: 1; transform: translateY(0); filter: blur(0); }
}

.stagger > * {
  animation: fadeInUp 0.6s cubic-bezier(0.4, 0, 0.2, 1) both;
}
.stagger > *:nth-child(1) { animation-delay: 0.1s; }
.stagger > *:nth-child(2) { animation-delay: 0.2s; }
.stagger > *:nth-child(3) { animation-delay: 0.3s; }
/* ...continue pattern */
```

## Layout Principles

- **Grid**: CSS Grid with `gap: 24px` — spacious, breathing layouts
- **Max-width**: 1200px for content, full-bleed for backgrounds
- **Padding**: Generous — `padding: 32px` inside glass panels
- **Border-radius**: `20px` for panels, `12px` for buttons, `8px` for inputs
- **Nesting**: Glass panels can be nested with decreasing blur intensity

## Buttons

```css
.btn-glass {
  background: var(--glass-bg);
  backdrop-filter: blur(12px);
  border: 1px solid var(--glass-border);
  border-radius: 12px;
  padding: 12px 24px;
  color: var(--text-primary);
  cursor: pointer;
  transition: all 0.3s ease;
}

.btn-primary {
  background: var(--accent-gradient);
  border: none;
  color: white;
  font-weight: 500;
  box-shadow: 0 4px 20px rgba(96, 165, 250, 0.3);
}

.btn-primary:hover {
  box-shadow: 0 6px 30px rgba(96, 165, 250, 0.5);
  transform: translateY(-1px);
}
```

## Key Rules

1. **Never use solid opaque backgrounds** — everything is translucent
2. **Background MUST be a gradient mesh** — the frosted glass needs something to blur
3. **Borders are thin and translucent** — `rgba(255,255,255, 0.1)` not solid colors
4. **Depth through layers** — stack glass panels at different blur levels
5. **Icons should be line-style** — Lucide React or Phosphor icons, not filled
6. **Spacing is generous** — let elements breathe
7. **Glow effects on interactive elements** — subtle colored shadows on hover
8. **No harsh shadows** — everything is soft and diffused

## When to Use

✅ SaaS dashboards, fintech apps, weather widgets, music players, portfolio sites, crypto platforms, AI product interfaces
❌ E-commerce with heavy product imagery, content-heavy blogs, government sites
