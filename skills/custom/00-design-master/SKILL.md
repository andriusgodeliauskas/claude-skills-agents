---
name: frontend-design-master
description: Master frontend design system that helps select and combine the right design style for any project. Use when user asks to create any frontend interface, website, or UI component without specifying a particular style. This skill acts as a router — analyzing the project context and recommending the best design style from the 10 available premium design systems.
---

# Frontend Design Master — Style Router & Foundation

This is the master skill that helps select the right design approach from 10 premium design systems. It also provides shared best practices that apply to ALL styles.

## Available Design Systems

| # | Style | File | Best For |
|---|-------|------|----------|
| 1 | **Liquid Glass / Glassmorphism** | `01-liquid-glass/SKILL.md` | SaaS, fintech, AI products, dashboards |
| 2 | **Neo-Brutalist** | `02-neobrutalist/SKILL.md` | Creative agencies, indie brands, art, portfolios |
| 3 | **Editorial / Luxury Magazine** | `03-editorial-luxury/SKILL.md` | Fashion, luxury goods, architecture, publications |
| 4 | **Bento Grid Dashboard** | `04-bento-dashboard/SKILL.md` | Analytics, admin panels, SaaS, monitoring |
| 5 | **Cyberpunk / Neon Dark** | `05-cyberpunk-neon/SKILL.md` | Gaming, crypto/Web3, music, entertainment |
| 6 | **Organic / Nature** | `06-organic-nature/SKILL.md` | Wellness, eco brands, food, yoga, botanical |
| 7 | **Retro-Futurism / Y2K Revival** | `07-retro-futurism-y2k/SKILL.md` | Fashion, music, social media, youth brands |
| 8 | **Minimal Swiss / Scandinavian** | `08-minimal-swiss/SKILL.md` | Dev tools, architecture, professional services |
| 9 | **3D Immersive / Spatial** | `09-3d-immersive/SKILL.md` | Product showcases, tech demos, automotive, real estate |
| 10 | **Neumorphic / Soft UI** | `10-neumorphic-soft/SKILL.md` | Wellness apps, smart home, music players, IoT |

## Style Selection Logic

When user doesn't specify a style, analyze:

1. **Industry**: What business sector? → Match to recommended industries
2. **Audience**: Technical? Creative? Luxury? Mass market?
3. **Content type**: Data-heavy? Image-heavy? Text-heavy? Interactive?
4. **Mood keywords**: What feeling should the site evoke?
5. **Reference sites**: Did the user mention any sites they like?

## Shared Best Practices (Apply to ALL Styles)

### Performance
- Use `will-change` only on elements that animate
- Limit simultaneous animations to ~10 per viewport
- Prefer CSS animations over JS where possible
- Use `loading="lazy"` on images below the fold
- Test on mobile — disable heavy effects if `prefers-reduced-motion`

### Accessibility
```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}

/* Always provide focus indicators */
:focus-visible {
  outline: 2px solid var(--accent, #0055ff);
  outline-offset: 2px;
}
```

### Responsive Design
- Mobile-first approach always
- Breakpoints: 640px (sm), 768px (md), 1024px (lg), 1280px (xl)
- Touch targets minimum 44x44px
- Font sizes use `clamp()` for fluid scaling
- Test at 320px, 375px, 768px, 1024px, 1440px

### Google Fonts Loading
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=FONT_NAME:wght@300;400;500;600;700&display=swap" rel="stylesheet">
```

### CSS Reset (Universal)
```css
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
html { -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; }
img, video, svg { display: block; max-width: 100%; }
a { text-decoration: none; color: inherit; }
button { font: inherit; cursor: pointer; }
```

### Combining Styles
Styles can be mixed thoughtfully:
- **Glass + Bento**: Glassmorphic cards in a bento grid layout
- **Editorial + 3D**: Magazine typography with parallax depth
- **Swiss + Neumorphic**: Strict grid with soft UI controls
- **Brutalist + Cyberpunk**: Raw layout with neon accents

When combining, let ONE style lead (70%) and accent with another (30%).

## 2025-2026 Trends Incorporated

All 10 systems reflect current trends:
- ✅ Bento grid layouts
- ✅ Glassmorphism / Liquid Glass (Apple-inspired)
- ✅ AI-adaptive interfaces
- ✅ Micro-interactions and scroll-driven animations
- ✅ Dark mode as default
- ✅ Variable fonts and fluid typography
- ✅ High-contrast accessibility
- ✅ Asymmetric layouts
- ✅ 3D and spatial elements
- ✅ Neo-brutalism and anti-design
- ✅ Chrome/metallic effects
- ✅ Organic and nature-inspired aesthetics
