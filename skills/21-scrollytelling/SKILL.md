---
name: scrollytelling
description: Scroll-driven storytelling with progressive content reveal, parallax layers, scroll-snapping sections, scroll-triggered animations, and progress indicators. Major 2023-2024 engagement trend. Content unfolds as user scrolls — each section reveals new information with visual transitions. Uses IntersectionObserver, CSS scroll-snap, scroll-linked animations. Perfect for product landing pages, case studies, annual reports, brand stories, one-pagers, portfolios. ALWAYS combine with 11-responsive-premium and 12-deployment-paths skills.
---

# Scrollytelling Interactive Design

**Era**: 2023-2024 (engagement-focused) | **Vibe**: Immersive, narrative, cinematic, engaging
**Best for**: Product landing pages, brand stories, case studies, annual reports, one-pagers, interactive portfolios
**Avoid for**: Multi-page sites, blogs, e-commerce, documentation

---

## CORE: FULL-SCREEN SCROLL SECTIONS

```css
:root {
  --color-bg: #0C0C0C;
  --color-text: #FAFAFA;
  --color-accent: #4F7EF7;
  --color-muted: #777777;
  --font-display: 'Syne', sans-serif;
  --font-body: 'Inter', sans-serif;
}

@import url('https://fonts.googleapis.com/css2?family=Syne:wght@400;700;800&family=Inter:wght@400;500&display=swap');

/* Full-screen scroll snap */
html {
  scroll-snap-type: y mandatory;
  scroll-behavior: smooth;
}

.scroll-section {
  min-height: 100vh;
  min-height: 100dvh;
  scroll-snap-align: start;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: clamp(40px, 6vw, 80px);
  position: relative;
  overflow: hidden;
}
```

---

## SCROLL-TRIGGERED REVEAL (IntersectionObserver)

```css
/* Fade-up reveal */
.reveal {
  opacity: 0;
  transform: translateY(40px);
  transition: all 0.8s cubic-bezier(0.16, 1, 0.3, 1);
}

.reveal.visible {
  opacity: 1;
  transform: translateY(0);
}

/* Reveal from left */
.reveal-left {
  opacity: 0;
  transform: translateX(-60px);
  transition: all 0.8s cubic-bezier(0.16, 1, 0.3, 1);
}

.reveal-left.visible {
  opacity: 1;
  transform: translateX(0);
}

/* Scale-in reveal */
.reveal-scale {
  opacity: 0;
  transform: scale(0.9);
  transition: all 0.6s cubic-bezier(0.16, 1, 0.3, 1);
}

.reveal-scale.visible {
  opacity: 1;
  transform: scale(1);
}

/* Staggered children */
.reveal-stagger.visible > *:nth-child(1) { transition-delay: 0s; }
.reveal-stagger.visible > *:nth-child(2) { transition-delay: 0.1s; }
.reveal-stagger.visible > *:nth-child(3) { transition-delay: 0.2s; }
.reveal-stagger.visible > *:nth-child(4) { transition-delay: 0.3s; }
.reveal-stagger.visible > *:nth-child(5) { transition-delay: 0.4s; }

.reveal-stagger > * {
  opacity: 0;
  transform: translateY(30px);
  transition: all 0.6s cubic-bezier(0.16, 1, 0.3, 1);
}

.reveal-stagger.visible > * {
  opacity: 1;
  transform: translateY(0);
}
```

```javascript
// Reveal on scroll
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
    }
  });
}, {
  threshold: 0.15,
  rootMargin: '0px 0px -50px 0px'
});

document.querySelectorAll('.reveal, .reveal-left, .reveal-scale, .reveal-stagger').forEach(el => {
  observer.observe(el);
});
```

---

## SCROLL PROGRESS BAR

```css
.scroll-progress {
  position: fixed;
  top: 0;
  left: 0;
  height: 3px;
  background: var(--color-accent);
  z-index: 9999;
  transform-origin: left;
  transform: scaleX(0);
  transition: transform 0.1s linear;
}
```

```javascript
const progressBar = document.querySelector('.scroll-progress');
window.addEventListener('scroll', () => {
  const scrollTop = window.scrollY;
  const docHeight = document.documentElement.scrollHeight - window.innerHeight;
  const scrollPercent = scrollTop / docHeight;
  progressBar.style.transform = `scaleX(${scrollPercent})`;
});
```

```html
<div class="scroll-progress"></div>
```

---

## SECTION DOT NAVIGATION

```css
.dot-nav {
  position: fixed;
  right: 24px;
  top: 50%;
  transform: translateY(-50%);
  display: flex;
  flex-direction: column;
  gap: 12px;
  z-index: 100;
}

.dot-nav a {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.2);
  border: 1px solid rgba(255, 255, 255, 0.3);
  transition: all 0.3s ease;
}

.dot-nav a.active {
  background: var(--color-accent);
  border-color: var(--color-accent);
  transform: scale(1.3);
}

@media (max-width: 768px) {
  .dot-nav { display: none; }
}
```

---

## PARALLAX LAYER EFFECT

```css
.parallax-container {
  position: relative;
  min-height: 100vh;
  overflow: hidden;
}

.parallax-bg {
  position: absolute;
  inset: -20%;
  background-size: cover;
  background-position: center;
  will-change: transform;
}

.parallax-content {
  position: relative;
  z-index: 2;
  padding: 100px clamp(20px, 4vw, 80px);
}

/* Dark overlay for text readability */
.parallax-overlay {
  position: absolute;
  inset: 0;
  background: rgba(0, 0, 0, 0.5);
  z-index: 1;
}
```

```javascript
// Simple parallax on scroll
window.addEventListener('scroll', () => {
  document.querySelectorAll('.parallax-bg').forEach(bg => {
    const rect = bg.parentElement.getBoundingClientRect();
    const speed = 0.3;
    const yOffset = rect.top * speed;
    bg.style.transform = `translateY(${yOffset}px)`;
  });
});
```

---

## COUNTER / STAT ANIMATION

```css
.stat-number {
  font-family: var(--font-display);
  font-size: clamp(3rem, 8vw, 6rem);
  font-weight: 800;
  color: var(--color-accent);
  line-height: 1;
}

.stat-label {
  font-size: 0.875rem;
  text-transform: uppercase;
  letter-spacing: 0.15em;
  color: var(--color-muted);
  margin-top: 8px;
}
```

```javascript
// Animate number counting up
function animateCounter(el, target, duration = 2000) {
  let start = 0;
  const startTime = performance.now();

  function update(currentTime) {
    const elapsed = currentTime - startTime;
    const progress = Math.min(elapsed / duration, 1);
    // Ease out
    const eased = 1 - Math.pow(1 - progress, 3);
    const current = Math.floor(eased * target);
    el.textContent = current.toLocaleString();

    if (progress < 1) requestAnimationFrame(update);
    else el.textContent = target.toLocaleString();
  }

  requestAnimationFrame(update);
}

// Trigger when visible
const statObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const target = parseInt(entry.target.dataset.target);
      animateCounter(entry.target, target);
      statObserver.unobserve(entry.target);
    }
  });
}, { threshold: 0.5 });

document.querySelectorAll('.stat-number[data-target]').forEach(el => {
  statObserver.observe(el);
});
```

```html
<div class="stat">
  <div class="stat-number" data-target="15000">0</div>
  <div class="stat-label">Happy Customers</div>
</div>
```

---

## SECTION TRANSITIONS

```css
/* Background color transitions between sections */
.scroll-section[data-bg="dark"] { background: var(--color-bg); color: var(--color-text); }
.scroll-section[data-bg="light"] { background: #FAFAFA; color: #111111; }
.scroll-section[data-bg="accent"] { background: var(--color-accent); color: #FFFFFF; }

/* Diagonal clip transition */
.clip-diagonal {
  clip-path: polygon(0 5%, 100% 0%, 100% 95%, 0 100%);
  margin: -5vh 0;
  padding: calc(5vh + 80px) 0;
}
```

---

## REDUCED MOTION

```css
@media (prefers-reduced-motion: reduce) {
  html { scroll-snap-type: none; scroll-behavior: auto; }
  .reveal, .reveal-left, .reveal-scale { opacity: 1; transform: none; transition: none; }
  .reveal-stagger > * { opacity: 1; transform: none; transition: none; }
  .parallax-bg { position: absolute; transform: none !important; }
}
```

---

## PERFORMANCE TIPS

1. Use `will-change: transform` ONLY on actively animated elements
2. Parallax: throttle scroll event or use `requestAnimationFrame`
3. IntersectionObserver is more efficient than scroll event listeners
4. Use `scroll-snap-type: y proximity` instead of `mandatory` for smoother feel
5. Limit animations to `transform` and `opacity` only
6. On mobile, reduce parallax intensity or disable entirely
7. Lazy-load images in non-visible sections

---

## COMMON MISTAKES

1. ❌ Scroll-snap mandatory on long content — traps users; use `proximity` or per-section
2. ❌ Animations replaying on scroll up — use `once` flag in observer
3. ❌ No fallback for JS disabled — content should be visible without JS
4. ❌ Too many parallax layers — maximum 2-3, more kills performance
5. ❌ Forgetting mobile — disable snap + parallax on mobile
6. ❌ Content only visible after scroll — above-the-fold should be immediately visible
