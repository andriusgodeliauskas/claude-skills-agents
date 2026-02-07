---
name: frontend-3d-immersive
description: Create immersive 3D and Spatial interfaces with perspective transforms, parallax depth, floating elements, and dimensional layouts. Use when user asks for 3D, immersive, spatial, parallax, dimensional, depth, floating, or interactive visual UI. Ideal for product showcases, landing pages, creative portfolios, tech demos, VR/AR interfaces, automotive, real estate, and interactive storytelling.
---

# 3D Immersive / Spatial Design System

Create interfaces that break the flat screen illusion — elements float in 3D space, respond to scroll and mouse with perspective shifts, and create a sense of physical depth without WebGL complexity.

## Core Aesthetic Philosophy

**The Feel**: Reaching into the screen and touching the content. Elements exist on different planes of depth, casting real shadows and responding to your movement. The screen becomes a window into dimensional space.

**Mood Keywords**: Dimensional, immersive, interactive, cinematic, floating, perspective, responsive

## Typography

- **Display**: `'Cabinet Grotesk', 'Clash Display'` → fallback: `'Sora', 'Outfit'` — modern, geometric, strong
- **Body**: `'Outfit', 'DM Sans'` — clean, neutral, doesn't compete with 3D effects
- **Weight**: Bold (700-900) for floating headlines, Regular for grounded body
- **3D text**: Use CSS `transform: perspective()` + `rotateX/Y` for tilted headings
- Import: `Sora`, `Outfit`, `DM Sans`

## Color System

Deep backgrounds with luminous foregrounds:

```css
:root {
  /* Backgrounds — deep enough for shadows to work */
  --bg-deep: #0c0c14;
  --bg-space: #10101c;
  --bg-surface: #1a1a28;
  --bg-card: #222236;

  /* Foreground — bright and floating */
  --fg-white: #ffffff;
  --fg-light: #f0f0ff;
  --fg-muted: #8888aa;

  /* Accent */
  --accent-primary: #6c5ce7;
  --accent-secondary: #00cec9;
  --accent-warm: #fd79a8;

  /* Depth shadows — multi-layered for realism */
  --shadow-close: 0 4px 8px rgba(0, 0, 0, 0.3);
  --shadow-mid: 0 12px 24px rgba(0, 0, 0, 0.4);
  --shadow-far: 0 32px 64px rgba(0, 0, 0, 0.5);
  --shadow-float: 0 20px 40px rgba(0, 0, 0, 0.3), 0 40px 80px rgba(0, 0, 0, 0.2);

  /* Perspective */
  --perspective: 1000px;
}
```

### Light 3D Variant
```css
[data-theme="light"] {
  --bg-deep: #f0f0f5;
  --bg-space: #e8e8f0;
  --bg-surface: #ffffff;
  --bg-card: #ffffff;
  --fg-white: #111122;
  --fg-muted: #666688;
  --shadow-float: 0 20px 40px rgba(0, 0, 0, 0.08), 0 40px 80px rgba(0, 0, 0, 0.04);
}
```

## 3D Card — The Core Component

```css
.card-3d {
  background: var(--bg-card);
  border-radius: 20px;
  padding: 40px;
  box-shadow: var(--shadow-float);
  transform-style: preserve-3d;
  transform: perspective(var(--perspective)) rotateX(0deg) rotateY(0deg);
  transition: transform 0.4s cubic-bezier(0.25, 0.8, 0.25, 1), box-shadow 0.4s ease;
  will-change: transform;
}

/* Mouse-tracking tilt — apply via JS:
   card.style.transform = `perspective(1000px) rotateX(${y}deg) rotateY(${x}deg)`;
*/

.card-3d:hover {
  box-shadow: var(--shadow-far);
}

/* Inner element that pops forward */
.card-3d .pop-element {
  transform: translateZ(40px);
  transition: transform 0.4s ease;
}

.card-3d:hover .pop-element {
  transform: translateZ(60px);
}
```

## JS Helper for Mouse-Tracking Tilt

```javascript
// Apply to any .card-3d element
function initTilt(el, maxDeg = 8) {
  el.addEventListener('mousemove', (e) => {
    const rect = el.getBoundingClientRect();
    const x = (e.clientX - rect.left) / rect.width - 0.5;
    const y = (e.clientY - rect.top) / rect.height - 0.5;
    el.style.transform = `perspective(1000px) rotateY(${x * maxDeg}deg) rotateX(${-y * maxDeg}deg)`;
  });
  el.addEventListener('mouseleave', () => {
    el.style.transform = 'perspective(1000px) rotateY(0deg) rotateX(0deg)';
  });
}
```

## Parallax Depth Layers

```css
.parallax-container {
  perspective: 800px;
  overflow: hidden;
  height: 100vh;
}

.layer-back {
  transform: translateZ(-200px) scale(1.5);
  opacity: 0.3;
}

.layer-mid {
  transform: translateZ(-100px) scale(1.25);
  opacity: 0.6;
}

.layer-front {
  transform: translateZ(0);
}

.layer-float {
  transform: translateZ(50px) scale(0.95);
  filter: drop-shadow(0 20px 40px rgba(0, 0, 0, 0.3));
}
```

## Scroll-Based Depth (CSS-only with scroll-driven animations)

```css
/* Modern scroll-driven animation (Chrome 115+) */
@keyframes scrollParallax {
  from { transform: translateY(100px) scale(0.9) rotateX(10deg); opacity: 0; }
  to { transform: translateY(0) scale(1) rotateX(0deg); opacity: 1; }
}

.scroll-reveal-3d {
  animation: scrollParallax linear both;
  animation-timeline: view();
  animation-range: entry 0% entry 100%;
}

/* Fallback: Intersection Observer approach */
.reveal-3d {
  opacity: 0;
  transform: translateY(60px) perspective(1000px) rotateX(5deg);
  transition: all 0.8s cubic-bezier(0.25, 0.8, 0.25, 1);
}

.reveal-3d.visible {
  opacity: 1;
  transform: translateY(0) perspective(1000px) rotateX(0deg);
}
```

## Floating Elements

```css
.floating-element {
  animation: float3d 6s ease-in-out infinite;
  filter: drop-shadow(0 20px 30px rgba(0, 0, 0, 0.3));
}

@keyframes float3d {
  0%, 100% {
    transform: translateY(0) rotateX(0deg) rotateY(0deg);
  }
  25% {
    transform: translateY(-15px) rotateX(3deg) rotateY(-3deg);
  }
  50% {
    transform: translateY(-5px) rotateX(-2deg) rotateY(2deg);
  }
  75% {
    transform: translateY(-20px) rotateX(2deg) rotateY(-1deg);
  }
}
```

## Backgrounds

```css
body {
  background: var(--bg-deep);
  color: var(--fg-white);
}

/* Gradient orbs at different depths */
.depth-bg {
  position: relative;
}

.depth-bg::before {
  content: '';
  position: absolute;
  width: 500px;
  height: 500px;
  border-radius: 50%;
  background: radial-gradient(circle, rgba(108, 92, 231, 0.15), transparent 70%);
  top: -100px;
  left: -100px;
  filter: blur(60px);
  animation: float3d 15s ease-in-out infinite;
}
```

## Buttons

```css
.btn-3d {
  font-family: 'Outfit', sans-serif;
  font-weight: 600;
  padding: 16px 36px;
  border-radius: 14px;
  border: none;
  background: var(--accent-primary);
  color: white;
  cursor: pointer;
  transform: perspective(500px) translateZ(0);
  box-shadow: var(--shadow-mid);
  transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
}

.btn-3d:hover {
  transform: perspective(500px) translateZ(10px) translateY(-2px);
  box-shadow: var(--shadow-far);
}

.btn-3d:active {
  transform: perspective(500px) translateZ(-5px);
  box-shadow: var(--shadow-close);
}
```

## Key Rules

1. **`perspective()` on all 3D containers** — 800-1200px for natural depth
2. **`preserve-3d` for layered elements** — children exist in same 3D space
3. **Multi-layered shadows** — close + mid + far for realistic depth
4. **Mouse-tracking tilt** — cards respond to cursor position
5. **Scroll-triggered transforms** — elements rotate into view on scroll
6. **Dark backgrounds** — shadows and depth need contrast to work
7. **`will-change: transform`** — optimize 3D transforms for GPU
8. **Floating animations** — gentle 3D rotation + translation loops
9. **`translateZ` for pop-out elements** — icons, images, CTAs pop forward
10. **Performance**: Limit 3D elements to ~10 per viewport. Test on mobile!

## When to Use

✅ Product showcases, landing pages, creative portfolios, tech demos, automotive sites, real estate, interactive storytelling, AR/VR interfaces, luxury product launches
❌ Text-heavy content, data dashboards, accessibility-critical apps, low-power device targets
