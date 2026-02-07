---
name: kinetic-typography
description: Text-as-hero animated typography design. Dominant trend 2022-2024 across agencies, portfolios, SaaS landing pages. Large bold text replaces hero images. Uses CSS animations, marquee scrolling text, hover-triggered reveals, scroll-linked motion. Oversized headlines (8-20vw), monochrome or high-contrast palettes, minimal imagery. Perfect for agencies, portfolios, startups, creative studios, event pages. ALWAYS combine with 11-responsive-premium skill.
---

# Kinetic Typography Design Style

**Era**: 2022-2024 (still trending 2025+) | **Vibe**: Bold, editorial, motion-rich, text-first
**Best for**: Creative agencies, portfolios, SaaS landing pages, event sites, fashion brands, studios
**Avoid for**: E-commerce product pages, data dashboards, documentation sites

---

## CORE PRINCIPLE

**Typography IS the design.** No hero images needed — the headline IS the hero. Text moves, scales, reveals, and reacts to user interaction.

---

## TYPOGRAPHY SETUP

```css
@import url('https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=Syne:wght@400;700;800&display=swap');
/* Alternatives: Clash Display, Satoshi, Cabinet Grotesk, Bebas Neue, Oswald */

:root {
  --font-display: 'Syne', sans-serif;
  --font-body: 'Space Grotesk', sans-serif;

  /* Oversized type scale */
  --fs-mega: clamp(4rem, 12vw, 12rem);    /* Hero text */
  --fs-huge: clamp(3rem, 8vw, 8rem);       /* Section headers */
  --fs-large: clamp(2rem, 5vw, 4rem);      /* Sub-headers */
  --fs-body: clamp(1rem, 1.2vw, 1.25rem);
  --fs-small: 0.875rem;

  /* High-contrast palette */
  --color-bg: #0A0A0A;
  --color-text: #FAFAFA;
  --color-accent: #FF4D00;       /* One strong accent */
  --color-muted: #666666;
  --color-border: #222222;
}
```

---

## THE MEGA HEADLINE

```css
.hero-text {
  font-family: var(--font-display);
  font-size: var(--fs-mega);
  font-weight: 800;
  line-height: 0.9;              /* Tight leading for display type */
  letter-spacing: -0.03em;       /* Tight tracking */
  text-transform: uppercase;
  color: var(--color-text);
}

/* Outline / stroke text variant */
.text-outline {
  color: transparent;
  -webkit-text-stroke: 2px var(--color-text);
}

/* Accent word */
.text-accent {
  color: var(--color-accent);
  font-style: italic;
}
```

---

## ANIMATION 1: MARQUEE SCROLLING TEXT

Infinite horizontal scroll — extremely popular 2023-2024.

```css
.marquee {
  overflow: hidden;
  white-space: nowrap;
  border-top: 1px solid var(--color-border);
  border-bottom: 1px solid var(--color-border);
  padding: 20px 0;
}

.marquee-inner {
  display: inline-flex;
  animation: marquee-scroll 20s linear infinite;
}

.marquee-inner span {
  font-family: var(--font-display);
  font-size: clamp(1.5rem, 4vw, 3rem);
  font-weight: 700;
  text-transform: uppercase;
  padding: 0 2rem;
  color: var(--color-muted);
}

.marquee-inner span::after {
  content: '✦';
  margin-left: 2rem;
  color: var(--color-accent);
}

@keyframes marquee-scroll {
  0% { transform: translateX(0); }
  100% { transform: translateX(-50%); }
}

/* Reverse direction variant */
.marquee-reverse .marquee-inner {
  animation-direction: reverse;
}

/* Pause on hover */
.marquee:hover .marquee-inner {
  animation-play-state: paused;
}
```

```html
<div class="marquee">
  <div class="marquee-inner">
    <!-- Duplicate content for seamless loop -->
    <span>Design</span><span>Develop</span><span>Deploy</span><span>Iterate</span>
    <span>Design</span><span>Develop</span><span>Deploy</span><span>Iterate</span>
  </div>
</div>
```

---

## ANIMATION 2: STAGGERED LETTER REVEAL

```css
.split-text {
  overflow: hidden;
}

.split-text .letter {
  display: inline-block;
  opacity: 0;
  transform: translateY(100%);
  animation: letter-up 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards;
}

/* Stagger each letter */
.split-text .letter:nth-child(1)  { animation-delay: 0.05s; }
.split-text .letter:nth-child(2)  { animation-delay: 0.08s; }
.split-text .letter:nth-child(3)  { animation-delay: 0.11s; }
.split-text .letter:nth-child(4)  { animation-delay: 0.14s; }
.split-text .letter:nth-child(5)  { animation-delay: 0.17s; }
.split-text .letter:nth-child(6)  { animation-delay: 0.20s; }
.split-text .letter:nth-child(7)  { animation-delay: 0.23s; }
.split-text .letter:nth-child(8)  { animation-delay: 0.26s; }
.split-text .letter:nth-child(9)  { animation-delay: 0.29s; }
.split-text .letter:nth-child(10) { animation-delay: 0.32s; }

@keyframes letter-up {
  to { opacity: 1; transform: translateY(0); }
}
```

**JS helper** to split text into spans:
```javascript
document.querySelectorAll('.split-text').forEach(el => {
  const text = el.textContent;
  el.innerHTML = text.split('').map(ch =>
    ch === ' ' ? ' ' : `<span class="letter">${ch}</span>`
  ).join('');
});
```

---

## ANIMATION 3: SCROLL-TRIGGERED REVEAL

```css
.reveal-line {
  overflow: hidden;
}

.reveal-line .line-inner {
  transform: translateY(110%);
  transition: transform 0.8s cubic-bezier(0.16, 1, 0.3, 1);
}

.reveal-line.visible .line-inner {
  transform: translateY(0);
}
```

```javascript
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
    }
  });
}, { threshold: 0.2 });

document.querySelectorAll('.reveal-line').forEach(el => observer.observe(el));
```

---

## ANIMATION 4: HOVER TEXT SWAP / IMAGE REVEAL

Popular pattern: hovering over text reveals an image.

```css
.project-link {
  display: block;
  padding: 30px 0;
  border-bottom: 1px solid var(--color-border);
  position: relative;
  overflow: hidden;
  cursor: pointer;
  transition: color 0.3s ease;
}

.project-link .title {
  font-family: var(--font-display);
  font-size: var(--fs-huge);
  font-weight: 800;
  text-transform: uppercase;
  line-height: 1;
  transition: transform 0.4s cubic-bezier(0.16, 1, 0.3, 1);
}

.project-link:hover .title {
  transform: translateX(40px);
  color: var(--color-accent);
}

.project-link .number {
  font-family: var(--font-body);
  font-size: var(--fs-small);
  color: var(--color-muted);
  text-transform: uppercase;
  letter-spacing: 0.1em;
}

/* Hover image reveal */
.project-link .hover-img {
  position: absolute;
  top: 50%;
  right: 10%;
  transform: translateY(-50%) scale(0.8);
  width: 300px;
  height: 200px;
  object-fit: cover;
  border-radius: 8px;
  opacity: 0;
  pointer-events: none;
  transition: all 0.4s cubic-bezier(0.16, 1, 0.3, 1);
}

.project-link:hover .hover-img {
  opacity: 1;
  transform: translateY(-50%) scale(1);
}
```

```html
<a href="project.html" class="project-link">
  <span class="number">01</span>
  <span class="title">Brand Identity</span>
  <img src="images/project-01.jpg" alt="" class="hover-img">
</a>
```

---

## ANIMATION 5: ROTATING TEXT

```css
.rotate-text {
  display: inline-flex;
  overflow: hidden;
  height: 1.1em;
  vertical-align: bottom;
}

.rotate-text .words {
  display: flex;
  flex-direction: column;
  animation: rotate-words 6s cubic-bezier(0.16, 1, 0.3, 1) infinite;
  color: var(--color-accent);
}

.rotate-text .words span {
  height: 1.1em;
}

@keyframes rotate-words {
  0%, 20%   { transform: translateY(0); }
  25%, 45%  { transform: translateY(-1.1em); }
  50%, 70%  { transform: translateY(-2.2em); }
  75%, 95%  { transform: translateY(-3.3em); }
  100%      { transform: translateY(0); }
}
```

```html
<h1>We make
  <span class="rotate-text">
    <span class="words">
      <span>brands</span>
      <span>websites</span>
      <span>experiences</span>
      <span>magic</span>
    </span>
  </span>
</h1>
```

---

## LAYOUT STRUCTURE

```css
body {
  background: var(--color-bg);
  color: var(--color-text);
  font-family: var(--font-body);
  margin: 0;
}

.container {
  max-width: 1400px;
  margin: 0 auto;
  padding: 0 clamp(20px, 4vw, 80px);
}

/* Asymmetric sections — big text + small body */
.section-intro {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 60px;
  align-items: end;
  padding: 100px 0;
}

.section-intro h2 {
  font-family: var(--font-display);
  font-size: var(--fs-huge);
  font-weight: 800;
  line-height: 0.95;
  text-transform: uppercase;
}

.section-intro p {
  font-size: var(--fs-body);
  color: var(--color-muted);
  line-height: 1.7;
}

/* Horizontal rule as design element */
hr {
  border: none;
  border-top: 1px solid var(--color-border);
  margin: 0;
}
```

---

## LIGHT MODE VARIANT

```css
:root {
  --color-bg: #FAFAFA;
  --color-text: #0A0A0A;
  --color-accent: #FF4D00;
  --color-muted: #999999;
  --color-border: #E0E0E0;
}

.text-outline {
  -webkit-text-stroke: 2px var(--color-text);
}
```

---

## REDUCED MOTION

```css
@media (prefers-reduced-motion: reduce) {
  .marquee-inner { animation: none; }
  .split-text .letter { opacity: 1; transform: none; animation: none; }
  .rotate-text .words { animation: none; }
  * { transition-duration: 0.01ms !important; }
}
```

---

## PERFORMANCE TIPS

1. Use `will-change: transform` on animated elements
2. Only animate `transform` and `opacity` — NEVER animate `width`, `height`, `top`, `left`
3. Marquee: duplicate content (not JS cloning) for smoother loop
4. Split-text: apply on visible elements only (IntersectionObserver)
5. Test on mobile — large text can overflow; use `clamp()` always
