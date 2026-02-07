---
name: parallax-storytelling
description: Modern parallax scrolling with multi-layer depth, video backgrounds, sticky elements, and scroll-speed variation. Revived 2022-2024 with modern CSS (sticky, scroll-snap) replacing old jQuery plugins. Creates cinematic depth as layers move at different speeds. Perfect for product showcases, brand stories, travel sites, real estate, restaurants, wine/spirits, automotive. Different from scrollytelling (which focuses on content reveal) — this focuses on DEPTH and MOVEMENT. ALWAYS combine with 11-responsive-premium and 12-deployment-paths skills.
---

# Parallax Storytelling Design Style

**Era**: 2022-2024 (revived with modern CSS) | **Vibe**: Cinematic, immersive, layered, atmospheric
**Best for**: Product showcases, travel, real estate, restaurants, wine/spirits, automotive, hotels, landing pages

---

## TECHNIQUE 1: CSS-ONLY Parallax (simplest, best performance)

```css
.parallax-wrapper {
  height: 100vh;
  overflow-x: hidden;
  overflow-y: auto;
  perspective: 1px;             /* Creates 3D space */
  perspective-origin: center;
}

.parallax-layer-back {
  position: absolute;
  inset: 0;
  transform: translateZ(-2px) scale(3);  /* Further = slower scroll */
  z-index: -1;
}

.parallax-layer-mid {
  position: absolute;
  inset: 0;
  transform: translateZ(-1px) scale(2);
  z-index: 0;
}

.parallax-layer-front {
  position: relative;
  transform: translateZ(0);     /* Normal scroll speed */
  z-index: 1;
}
```

---

## TECHNIQUE 2: Fixed Background Parallax (widely supported)

```css
.parallax-section {
  min-height: 100vh;
  background-attachment: fixed;   /* Background stays while content scrolls */
  background-position: center;
  background-size: cover;
  display: flex;
  align-items: center;
  justify-content: center;
}

.parallax-section-1 {
  background-image: url('images/hero-bg.jpg');
}

.parallax-section-2 {
  background-image: url('images/mid-bg.jpg');
}

/* Content between parallax sections */
.content-section {
  background: var(--bg);
  padding: 100px clamp(20px, 4vw, 80px);
  position: relative;
  z-index: 2;
}

/* MOBILE FIX — background-attachment: fixed doesn't work on mobile */
@media (max-width: 768px) {
  .parallax-section {
    background-attachment: scroll; /* Fallback on mobile */
  }
}
```

---

## TECHNIQUE 3: JS Scroll-Speed Parallax (most control)

```javascript
function initParallax() {
  const layers = document.querySelectorAll('[data-parallax-speed]');

  function updatePositions() {
    const scrollY = window.scrollY;

    layers.forEach(layer => {
      const speed = parseFloat(layer.dataset.parallaxSpeed);
      const rect = layer.parentElement.getBoundingClientRect();
      const offsetTop = rect.top + scrollY;
      const relativeScroll = scrollY - offsetTop;

      layer.style.transform = `translateY(${relativeScroll * speed}px)`;
    });

    requestAnimationFrame(updatePositions);
  }

  requestAnimationFrame(updatePositions);
}

// Disable on mobile for performance
if (window.innerWidth > 768) {
  initParallax();
}
```

```html
<section class="hero" style="position: relative; overflow: hidden; height: 100vh;">
  <!-- Background moves at 30% speed (slower) -->
  <div data-parallax-speed="0.3" style="position: absolute; inset: -20%; background: url('images/bg.jpg') center/cover;"></div>

  <!-- Mid layer at 50% speed -->
  <div data-parallax-speed="0.5" style="position: absolute; bottom: 0;">
    <img src="images/mountains.png" alt="">
  </div>

  <!-- Content at normal speed (no data attribute) -->
  <div style="position: relative; z-index: 2; text-align: center; padding-top: 30vh;">
    <h1>Explore the Wild</h1>
  </div>
</section>
```

---

## TECHNIQUE 4: Sticky Scroll Sections

```css
.sticky-container {
  position: relative;
}

.sticky-bg {
  position: sticky;
  top: 0;
  height: 100vh;
  overflow: hidden;
}

.sticky-bg img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.sticky-content {
  position: relative;
  z-index: 2;
  margin-top: -50vh;      /* Overlaps sticky image */
  padding: 60vh clamp(20px, 4vw, 80px) 100px;
}

.sticky-content .card {
  background: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(10px);
  border-radius: 16px;
  padding: 48px;
  max-width: 600px;
  margin-bottom: 40px;
}
```

---

## STYLING

```css
@import url('https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Inter:wght@400;500&display=swap');

:root {
  --bg: #FAFAFA;
  --text: #1A1A1A;
  --text-muted: #666666;
  --accent: #B8860B;           /* Warm gold */
  --surface: rgba(255,255,255,0.9);
  --font-display: 'DM Serif Display', Georgia, serif;
  --font-body: 'Inter', sans-serif;
}

h1 {
  font-family: var(--font-display);
  font-size: clamp(3rem, 7vw, 6rem);
  font-weight: 400;
  color: white;
  text-shadow: 0 2px 20px rgba(0,0,0,0.3);
}

/* Overlay for text readability on images */
.overlay {
  background: linear-gradient(to bottom, rgba(0,0,0,0.1) 0%, rgba(0,0,0,0.6) 100%);
}

/* Photo darkening for text contrast */
.darken-img {
  filter: brightness(0.7);
}
```

---

## SCROLL INDICATOR

```css
.scroll-indicator {
  position: absolute;
  bottom: 40px;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
  color: white;
  font-size: 0.75rem;
  letter-spacing: 0.15em;
  text-transform: uppercase;
  opacity: 0.7;
  animation: bounce-down 2s ease infinite;
}

.scroll-indicator::after {
  content: '↓';
  font-size: 1.2rem;
}

@keyframes bounce-down {
  0%, 100% { transform: translateX(-50%) translateY(0); }
  50% { transform: translateX(-50%) translateY(10px); }
}
```

---

## PERFORMANCE RULES

1. **Images**: Use `loading="lazy"` on below-fold images
2. **Mobile**: DISABLE parallax transforms (use `scroll` instead of `fixed`)
3. **GPU**: Use `will-change: transform` only on moving layers
4. **Size**: Optimize images (WebP, compressed JPEG, max 1920px wide)
5. **Layers**: Max 3-4 parallax layers per section
6. **Test**: 60fps target — check Chrome DevTools Performance panel

```css
@media (prefers-reduced-motion: reduce) {
  .parallax-section { background-attachment: scroll; }
  [data-parallax-speed] { transform: none !important; }
  .scroll-indicator { animation: none; }
}
```

---

## COMMON MISTAKES
1. ❌ `background-attachment: fixed` on mobile — broken on iOS/Android; always fallback to `scroll`
2. ❌ Too many layers — 2-3 max per section
3. ❌ Parallax on every section — use sparingly (2-3 sections per page)
4. ❌ Text directly on photos without overlay — unreadable
5. ❌ Large uncompressed images — kills load time
6. ❌ Forgetting `overflow: hidden` — content bleeds during scroll
