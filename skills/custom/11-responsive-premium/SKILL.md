---
name: frontend-responsive-premium
description: Ensure pixel-perfect responsive behavior across ALL devices — from 320px mobile to 4K desktop. This skill provides a comprehensive responsive system including fluid typography, adaptive grids, premium mobile navigation (hamburger menu with animations), safe areas, touch targets, container queries, and every micro-detail needed for production-grade responsive websites. ALWAYS apply this skill alongside any design style skill. Use when creating ANY frontend — this is mandatory for professional output.
---

# Premium Responsive Design System

**This skill is MANDATORY for every frontend project.** It ensures that every website, landing page, dashboard, or app looks and functions flawlessly across all devices — from 320px phones to 4K ultrawide monitors.

Apply this skill ALONGSIDE the chosen design style skill (Liquid Glass, Brutalist, Editorial, etc.). This handles the responsive architecture; the style skill handles aesthetics.

---

## 1. CSS RESET & FOUNDATION

Always start with this foundation. It prevents 90% of responsive bugs:

```css
/* ========================================
   PREMIUM RESPONSIVE FOUNDATION
   ======================================== */

*, *::before, *::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html {
  /* Prevent font-size inflation on iOS landscape */
  -webkit-text-size-adjust: 100%;
  text-size-adjust: 100%;

  /* Smooth scrolling with respect for user preferences */
  scroll-behavior: smooth;

  /* Font smoothing */
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;

  /* Prevent horizontal scroll on mobile */
  overflow-x: hidden;
}

body {
  min-height: 100vh;
  min-height: 100dvh; /* Dynamic viewport height — accounts for mobile browser chrome */
  line-height: 1.6;
  overflow-x: hidden;
  position: relative;
}

/* Responsive media defaults */
img, picture, video, canvas, svg {
  display: block;
  max-width: 100%;
  height: auto;
}

/* Form elements inherit fonts */
input, button, textarea, select {
  font: inherit;
}

/* Remove default button styles */
button {
  cursor: pointer;
  border: none;
  background: none;
}

/* Prevent text overflow */
p, h1, h2, h3, h4, h5, h6 {
  overflow-wrap: break-word;
  hyphens: auto;
}

/* Remove list styles */
ul, ol {
  list-style: none;
}

/* Anchor reset */
a {
  text-decoration: none;
  color: inherit;
}

/* Table fix */
table {
  border-collapse: collapse;
  width: 100%;
}

/* Focus visible — accessible but not ugly */
:focus-visible {
  outline: 2px solid var(--color-focus, #0055ff);
  outline-offset: 3px;
  border-radius: 2px;
}

:focus:not(:focus-visible) {
  outline: none;
}
```

---

## 2. BREAKPOINT SYSTEM

Use these standardized breakpoints. **Mobile-first always** — base styles are mobile, then scale up:

```css
:root {
  /* Breakpoint reference (use in media queries) */
  /* xs: 0       — phones (320-479px) */
  /* sm: 480px   — large phones */
  /* md: 768px   — tablets */
  /* lg: 1024px  — laptops / small desktops */
  /* xl: 1280px  — desktops */
  /* 2xl: 1536px — large desktops */
  /* 3xl: 1920px — full HD / ultrawide */
}

/* USAGE — always min-width (mobile-first): */
/* @media (min-width: 480px)  { ... } — sm */
/* @media (min-width: 768px)  { ... } — md */
/* @media (min-width: 1024px) { ... } — lg */
/* @media (min-width: 1280px) { ... } — xl */
/* @media (min-width: 1536px) { ... } — 2xl */
```

**Critical**: ALWAYS test at these exact widths: **320px**, 375px, 414px, **768px**, **1024px**, 1280px, **1440px**, 1920px.

---

## 3. FLUID TYPOGRAPHY SCALE

Never use fixed font sizes. Use this complete fluid scale:

```css
:root {
  /* Fluid type scale — smoothly scales between mobile and desktop */
  --fs-xs:   clamp(0.7rem,   0.65rem + 0.25vw,  0.8rem);     /* 11.2–12.8px */
  --fs-sm:   clamp(0.8rem,   0.74rem + 0.3vw,   0.95rem);    /* 12.8–15.2px */
  --fs-base: clamp(0.95rem,  0.88rem + 0.35vw,  1.125rem);   /* 15.2–18px */
  --fs-lg:   clamp(1.125rem, 1rem + 0.625vw,    1.5rem);     /* 18–24px */
  --fs-xl:   clamp(1.35rem,  1.1rem + 1.25vw,   2rem);       /* 21.6–32px */
  --fs-2xl:  clamp(1.7rem,   1.2rem + 2.5vw,    3rem);       /* 27.2–48px */
  --fs-3xl:  clamp(2.2rem,   1.4rem + 4vw,      4.5rem);     /* 35.2–72px */
  --fs-4xl:  clamp(2.8rem,   1.5rem + 6.5vw,    7rem);       /* 44.8–112px */
  --fs-hero: clamp(3.2rem,   1.5rem + 8.5vw,    10rem);      /* 51.2–160px */

  /* Fluid spacing scale */
  --space-3xs: clamp(0.25rem, 0.22rem + 0.15vw, 0.375rem);
  --space-2xs: clamp(0.5rem,  0.45rem + 0.25vw, 0.625rem);
  --space-xs:  clamp(0.75rem, 0.65rem + 0.5vw,  1rem);
  --space-sm:  clamp(1rem,    0.85rem + 0.75vw,  1.5rem);
  --space-md:  clamp(1.5rem,  1.2rem + 1.5vw,   2.5rem);
  --space-lg:  clamp(2rem,    1.5rem + 2.5vw,   4rem);
  --space-xl:  clamp(3rem,    2rem + 5vw,       6rem);
  --space-2xl: clamp(4rem,    2.5rem + 7.5vw,   10rem);
  --space-3xl: clamp(6rem,    3rem + 10vw,      14rem);

  /* Max content widths */
  --max-width-text: 68ch;      /* Optimal reading width */
  --max-width-content: 1200px;  /* Standard content */
  --max-width-wide: 1400px;     /* Wide layouts */
  --max-width-full: 1920px;     /* Full HD cap */
}
```

---

## 4. RESPONSIVE CONTAINER

```css
.container {
  width: 100%;
  max-width: var(--max-width-content);
  margin-inline: auto;
  padding-inline: var(--space-sm);
}

.container-wide {
  max-width: var(--max-width-wide);
}

.container-narrow {
  max-width: 800px;
}

.container-text {
  max-width: var(--max-width-text);
}

/* Full-bleed utility — breaks out of container */
.full-bleed {
  width: 100vw;
  margin-left: calc(-50vw + 50%);
}
```

---

## 5. RESPONSIVE GRID SYSTEM

```css
/* Auto-responsive grid — NO media queries needed! */
.grid-auto {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(min(100%, 300px), 1fr));
  gap: var(--space-md);
}

/* 2-column responsive */
.grid-2 {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-md);
}
@media (min-width: 768px) {
  .grid-2 { grid-template-columns: repeat(2, 1fr); }
}

/* 3-column responsive */
.grid-3 {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-md);
}
@media (min-width: 640px) {
  .grid-3 { grid-template-columns: repeat(2, 1fr); }
}
@media (min-width: 1024px) {
  .grid-3 { grid-template-columns: repeat(3, 1fr); }
}

/* 4-column responsive */
.grid-4 {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-md);
}
@media (min-width: 480px) {
  .grid-4 { grid-template-columns: repeat(2, 1fr); }
}
@media (min-width: 1024px) {
  .grid-4 { grid-template-columns: repeat(4, 1fr); }
}

/* Sidebar + content layout */
.grid-sidebar {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-md);
}
@media (min-width: 768px) {
  .grid-sidebar {
    grid-template-columns: minmax(200px, 280px) 1fr;
  }
}

/* Prevent grid item overflow */
.grid-auto > *, .grid-2 > *, .grid-3 > *, .grid-4 > * {
  min-width: 0; /* CRITICAL — prevents text overflow in grid */
}
```

---

## 6. PREMIUM MOBILE NAVIGATION — HAMBURGER MENU

This is the most critical responsive component. It MUST work flawlessly:

### HTML Structure
```html
<header class="nav-header">
  <div class="nav-container container">
    <!-- Logo -->
    <a href="/" class="nav-logo">Logo</a>

    <!-- Desktop nav links — hidden on mobile -->
    <nav class="nav-desktop" aria-label="Main navigation">
      <ul class="nav-links">
        <li><a href="#" class="nav-link">Home</a></li>
        <li><a href="#" class="nav-link">About</a></li>
        <li><a href="#" class="nav-link">Services</a></li>
        <li><a href="#" class="nav-link">Contact</a></li>
      </ul>
    </nav>

    <!-- CTA button (visible on desktop) -->
    <a href="#" class="nav-cta">Get Started</a>

    <!-- Hamburger toggle — visible on mobile -->
    <button class="nav-toggle" aria-label="Toggle menu" aria-expanded="false" aria-controls="mobile-menu">
      <span class="hamburger-line"></span>
      <span class="hamburger-line"></span>
      <span class="hamburger-line"></span>
    </button>
  </div>

  <!-- Mobile menu overlay -->
  <div class="mobile-menu" id="mobile-menu" role="dialog" aria-label="Mobile menu">
    <nav aria-label="Mobile navigation">
      <ul class="mobile-nav-links">
        <li><a href="#" class="mobile-nav-link">Home</a></li>
        <li><a href="#" class="mobile-nav-link">About</a></li>
        <li><a href="#" class="mobile-nav-link">Services</a></li>
        <li><a href="#" class="mobile-nav-link">Contact</a></li>
      </ul>
      <a href="#" class="nav-cta mobile-cta">Get Started</a>
    </nav>
  </div>
</header>
```

### CSS — Premium Hamburger Menu
```css
/* ========================================
   NAVIGATION — RESPONSIVE
   ======================================== */

.nav-header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 1000;
  /* Background — adapt to your design style */
  background: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
  border-bottom: 1px solid rgba(0, 0, 0, 0.06);
  transition: transform 0.3s ease, background 0.3s ease;
}

/* Auto-hide on scroll down, show on scroll up (via JS) */
.nav-header.nav-hidden {
  transform: translateY(-100%);
}

.nav-container {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 64px;
}

@media (min-width: 1024px) {
  .nav-container { height: 80px; }
}

/* Logo */
.nav-logo {
  font-weight: 700;
  font-size: var(--fs-lg);
  z-index: 1001;
  flex-shrink: 0;
}

/* Desktop navigation */
.nav-desktop {
  display: none;
}

@media (min-width: 1024px) {
  .nav-desktop {
    display: flex;
    align-items: center;
  }
}

.nav-links {
  display: flex;
  gap: clamp(20px, 3vw, 40px);
}

.nav-link {
  font-size: var(--fs-sm);
  font-weight: 500;
  color: var(--text-secondary, #555);
  transition: color 0.2s ease;
  position: relative;
  padding: 4px 0;
  white-space: nowrap;
}

.nav-link:hover {
  color: var(--text-primary, #111);
}

/* Animated underline on hover */
.nav-link::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 0;
  height: 2px;
  background: var(--accent, currentColor);
  transition: width 0.3s cubic-bezier(0.25, 0.1, 0.25, 1);
}

.nav-link:hover::after {
  width: 100%;
}

/* CTA button in nav */
.nav-cta {
  display: none;
  font-size: var(--fs-sm);
  font-weight: 600;
  padding: 10px 24px;
  border-radius: 8px;
  background: var(--accent, #111);
  color: var(--accent-text, #fff);
  transition: all 0.2s ease;
  white-space: nowrap;
}

@media (min-width: 1024px) {
  .nav-cta { display: inline-flex; }
}

.nav-cta:hover {
  opacity: 0.9;
  transform: translateY(-1px);
}

/* ========================================
   HAMBURGER TOGGLE BUTTON
   ======================================== */

.nav-toggle {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 44px;   /* Apple HIG minimum touch target */
  height: 44px;
  gap: 6px;
  z-index: 1001;
  background: none;
  border: none;
  cursor: pointer;
  padding: 8px;
  -webkit-tap-highlight-color: transparent; /* Remove blue tap highlight on mobile */
}

@media (min-width: 1024px) {
  .nav-toggle { display: none; }
}

.hamburger-line {
  display: block;
  width: 24px;
  height: 2px;
  background: var(--text-primary, #111);
  border-radius: 2px;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  transform-origin: center;
}

/* Animated X when open */
.nav-toggle[aria-expanded="true"] .hamburger-line:nth-child(1) {
  transform: translateY(8px) rotate(45deg);
}

.nav-toggle[aria-expanded="true"] .hamburger-line:nth-child(2) {
  opacity: 0;
  transform: scaleX(0);
}

.nav-toggle[aria-expanded="true"] .hamburger-line:nth-child(3) {
  transform: translateY(-8px) rotate(-45deg);
}

/* ========================================
   MOBILE MENU OVERLAY
   ======================================== */

.mobile-menu {
  position: fixed;
  inset: 0;
  z-index: 999;
  background: var(--bg-primary, #ffffff);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: var(--space-lg);

  /* Start hidden */
  opacity: 0;
  visibility: hidden;
  transform: translateY(-10px);
  transition: all 0.35s cubic-bezier(0.4, 0, 0.2, 1);

  /* Safe area for notch phones */
  padding-top: env(safe-area-inset-top, 20px);
  padding-bottom: env(safe-area-inset-bottom, 20px);
  padding-left: env(safe-area-inset-left, 20px);
  padding-right: env(safe-area-inset-right, 20px);
}

.mobile-menu.open {
  opacity: 1;
  visibility: visible;
  transform: translateY(0);
}

.mobile-nav-links {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: var(--space-sm);
}

.mobile-nav-link {
  font-size: var(--fs-2xl);
  font-weight: 600;
  color: var(--text-primary, #111);
  padding: 12px 24px;
  border-radius: 8px;
  transition: all 0.2s ease;
  min-height: 48px;
  display: flex;
  align-items: center;

  /* Staggered animation */
  opacity: 0;
  transform: translateY(20px);
}

.mobile-menu.open .mobile-nav-link {
  opacity: 1;
  transform: translateY(0);
}

/* Staggered link reveal */
.mobile-menu.open .mobile-nav-link:nth-child(1) { transition-delay: 0.1s; }
.mobile-menu.open .mobile-nav-link:nth-child(2) { transition-delay: 0.15s; }
.mobile-menu.open .mobile-nav-link:nth-child(3) { transition-delay: 0.2s; }
.mobile-menu.open .mobile-nav-link:nth-child(4) { transition-delay: 0.25s; }
.mobile-menu.open .mobile-nav-link:nth-child(5) { transition-delay: 0.3s; }
.mobile-menu.open .mobile-nav-link:nth-child(6) { transition-delay: 0.35s; }

.mobile-nav-link:hover,
.mobile-nav-link:active {
  background: var(--bg-hover, rgba(0,0,0,0.05));
}

.mobile-cta {
  display: inline-flex;
  margin-top: var(--space-md);
  font-size: var(--fs-lg);
  padding: 16px 40px;
  opacity: 0;
  transform: translateY(20px);
}

.mobile-menu.open .mobile-cta {
  opacity: 1;
  transform: translateY(0);
  transition-delay: 0.35s;
}

@media (min-width: 1024px) {
  .mobile-menu { display: none !important; }
}
```

### JavaScript — Minimal & Bulletproof
```javascript
// ========================================
// MOBILE MENU CONTROLLER
// ========================================

(function() {
  const toggle = document.querySelector('.nav-toggle');
  const menu = document.querySelector('.mobile-menu');
  const body = document.body;
  const header = document.querySelector('.nav-header');

  if (!toggle || !menu) return;

  // Toggle menu
  toggle.addEventListener('click', () => {
    const isOpen = toggle.getAttribute('aria-expanded') === 'true';
    toggle.setAttribute('aria-expanded', !isOpen);
    menu.classList.toggle('open');

    // Lock body scroll when menu is open
    if (!isOpen) {
      body.style.overflow = 'hidden';
      body.style.position = 'fixed';
      body.style.width = '100%';
      body.style.top = `-${window.scrollY}px`;
    } else {
      const scrollY = body.style.top;
      body.style.overflow = '';
      body.style.position = '';
      body.style.width = '';
      body.style.top = '';
      window.scrollTo(0, parseInt(scrollY || '0') * -1);
    }
  });

  // Close on link click
  menu.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', () => {
      toggle.setAttribute('aria-expanded', 'false');
      menu.classList.remove('open');
      body.style.overflow = '';
      body.style.position = '';
      body.style.width = '';
      body.style.top = '';
    });
  });

  // Close on Escape key
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && menu.classList.contains('open')) {
      toggle.click();
    }
  });

  // Close on resize to desktop
  window.addEventListener('resize', () => {
    if (window.innerWidth >= 1024 && menu.classList.contains('open')) {
      toggle.click();
    }
  });

  // ========================================
  // AUTO-HIDE NAV ON SCROLL
  // ========================================
  let lastScroll = 0;
  const scrollThreshold = 80;

  window.addEventListener('scroll', () => {
    if (menu.classList.contains('open')) return;

    const currentScroll = window.scrollY;

    if (currentScroll > scrollThreshold) {
      if (currentScroll > lastScroll) {
        // Scrolling down — hide
        header.classList.add('nav-hidden');
      } else {
        // Scrolling up — show
        header.classList.remove('nav-hidden');
      }
    } else {
      header.classList.remove('nav-hidden');
    }

    lastScroll = currentScroll;
  }, { passive: true });
})();
```

---

## 7. SAFE AREAS (Notch Phones, Dynamic Island)

```css
/* Apply to any element near screen edges */
.safe-area-padding {
  padding-top: env(safe-area-inset-top, 0);
  padding-bottom: env(safe-area-inset-bottom, 0);
  padding-left: env(safe-area-inset-left, 0);
  padding-right: env(safe-area-inset-right, 0);
}

/* For fixed bottom elements */
.fixed-bottom {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  padding-bottom: calc(16px + env(safe-area-inset-bottom, 0));
}

/* Viewport height that accounts for mobile browser chrome */
.full-height {
  min-height: 100vh;
  min-height: 100dvh;
  min-height: 100svh;
}
```

---

## 8. TOUCH TARGETS & INTERACTION

```css
/* ALL interactive elements: minimum 44x44px touch target */
a, button, input, select, textarea, [role="button"], [tabindex] {
  min-height: 44px;
  min-width: 44px;
}

/* Small inline links exception — add padding to compensate */
.inline-link {
  min-height: auto;
  min-width: auto;
  padding: 8px 4px;
  margin: -8px -4px; /* Extend touch area without affecting layout */
}

/* Remove iOS tap highlight */
* {
  -webkit-tap-highlight-color: transparent;
}

/* iOS input zoom prevention — keep font-size >= 16px on inputs */
@media (max-width: 1024px) {
  input, select, textarea {
    font-size: max(16px, 1rem); /* Prevents iOS zoom on focus */
  }
}

/* Smooth touch scrolling for horizontal scroll areas */
.scroll-x {
  overflow-x: auto;
  -webkit-overflow-scrolling: touch;
  scroll-snap-type: x mandatory;
  scrollbar-width: none; /* Firefox */
}

.scroll-x::-webkit-scrollbar {
  display: none; /* Chrome/Safari */
}

.scroll-x > * {
  scroll-snap-align: start;
}
```

---

## 9. CONTAINER QUERIES (2026 Standard)

```css
/* Make any element a container */
.container-query {
  container-type: inline-size;
}

/* Component adapts to its container, not viewport */
@container (min-width: 400px) {
  .card-adaptive {
    flex-direction: row;
  }
}

@container (min-width: 600px) {
  .card-adaptive {
    padding: 2rem;
    font-size: 1.1rem;
  }
}

/* Fluid type based on container width */
.container-fluid-text {
  container-type: inline-size;
}

.container-fluid-text h2 {
  font-size: clamp(1.2rem, 5cqi, 2.5rem);
}

.container-fluid-text p {
  font-size: clamp(0.9rem, 3cqi, 1.1rem);
}
```

---

## 10. RESPONSIVE IMAGES & MEDIA

```css
/* Responsive image with aspect ratio preservation */
.responsive-img {
  width: 100%;
  height: auto;
  object-fit: cover;
  aspect-ratio: 16 / 9;
}

/* Hero image — full viewport */
.hero-img {
  width: 100%;
  height: 50vh;
  object-fit: cover;
}

@media (min-width: 768px) {
  .hero-img { height: 70vh; }
}

@media (min-width: 1024px) {
  .hero-img { height: 85vh; }
}

/* Responsive video container (16:9) */
.video-wrapper {
  position: relative;
  width: 100%;
  aspect-ratio: 16 / 9;
  overflow: hidden;
  border-radius: var(--radius, 12px);
}

.video-wrapper iframe,
.video-wrapper video {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
}
```

**Use HTML `srcset` for responsive images:**
```html
<img
  src="image-800.jpg"
  srcset="image-400.jpg 400w, image-800.jpg 800w, image-1200.jpg 1200w, image-1600.jpg 1600w"
  sizes="(max-width: 480px) 100vw, (max-width: 1024px) 50vw, 33vw"
  alt="Description"
  loading="lazy"
  decoding="async"
>
```

---

## 11. RESPONSIVE TABLES

Tables are notoriously bad on mobile. Always handle them:

```css
/* Horizontal scroll wrapper for tables on mobile */
.table-responsive {
  width: 100%;
  overflow-x: auto;
  -webkit-overflow-scrolling: touch;
  border-radius: var(--radius, 8px);
  border: 1px solid var(--border-color, #e5e5e5);
}

.table-responsive table {
  min-width: 600px; /* Ensures table doesn't squish */
}

/* Alternative: Stack table on mobile */
@media (max-width: 768px) {
  .table-stack thead { display: none; }

  .table-stack tr {
    display: block;
    margin-bottom: 16px;
    border: 1px solid var(--border-color, #e5e5e5);
    border-radius: 8px;
    padding: 16px;
  }

  .table-stack td {
    display: flex;
    justify-content: space-between;
    padding: 8px 0;
    border-bottom: 1px solid var(--border-color, #e5e5e5);
  }

  .table-stack td:last-child {
    border-bottom: none;
  }

  .table-stack td::before {
    content: attr(data-label);
    font-weight: 600;
    margin-right: 16px;
  }
}
```

---

## 12. ACCESSIBILITY & USER PREFERENCES

```css
/* Respect reduced motion preference */
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}

/* Respect color scheme preference */
@media (prefers-color-scheme: dark) {
  :root:not([data-theme="light"]) {
    /* Apply dark theme colors */
    color-scheme: dark;
  }
}

/* High contrast mode */
@media (prefers-contrast: high) {
  :root {
    --border-color: currentColor;
  }

  * {
    border-color: currentColor !important;
  }
}

/* Print styles */
@media print {
  .nav-header,
  .nav-toggle,
  .mobile-menu,
  .no-print {
    display: none !important;
  }

  body {
    font-size: 12pt;
    line-height: 1.5;
    color: #000;
    background: #fff;
  }

  a[href]::after {
    content: " (" attr(href) ")";
    font-size: 0.8em;
    color: #666;
  }
}
```

---

## 13. RESPONSIVE UTILITY CLASSES

```css
/* Show/hide at breakpoints */
.hide-mobile  { display: none; }
.show-mobile  { display: block; }

@media (min-width: 768px) {
  .hide-mobile  { display: block; }
  .show-mobile  { display: none; }
  .hide-tablet  { display: none; }
  .show-tablet  { display: block; }
}

@media (min-width: 1024px) {
  .hide-tablet  { display: block; }
  .hide-desktop { display: none; }
  .show-desktop { display: block; }
}

/* Text alignment responsive */
.text-center-mobile {
  text-align: center;
}

@media (min-width: 768px) {
  .text-center-mobile { text-align: left; }
}

/* Stack to row */
.stack-to-row {
  display: flex;
  flex-direction: column;
  gap: var(--space-sm);
}

@media (min-width: 768px) {
  .stack-to-row { flex-direction: row; }
}
```

---

## 14. BODY SCROLL LOCK (for modals & mobile menu)

```css
/* Applied via JS when modal/menu is open */
body.scroll-locked {
  overflow: hidden;
  position: fixed;
  width: 100%;
  /* top is set dynamically via JS to preserve scroll position */
}
```

---

## 15. RESPONSIVE CHECKLIST — VERIFY EVERY BUILD

Before shipping, verify ALL of these:

### Layout
- [ ] No horizontal scrollbar at ANY viewport width (320px–1920px)
- [ ] Content doesn't overflow containers on mobile
- [ ] Grid items stack properly on mobile
- [ ] Images don't stretch or distort
- [ ] Full-bleed sections work without horizontal overflow

### Navigation
- [ ] Hamburger button is 44x44px minimum
- [ ] Hamburger animates to X on open
- [ ] Mobile menu covers full screen
- [ ] Body scroll is locked when mobile menu is open
- [ ] Menu closes on link click
- [ ] Menu closes on Escape key
- [ ] Menu closes on resize to desktop
- [ ] Nav auto-hides on scroll down, shows on scroll up
- [ ] Logo is visible when menu is open

### Typography
- [ ] No text smaller than 14px on mobile
- [ ] Headings scale down properly (use clamp!)
- [ ] Long words don't overflow (overflow-wrap: break-word)
- [ ] Line length is max ~68ch for readability

### Touch & Interaction
- [ ] All buttons/links have 44px minimum touch target
- [ ] No iOS zoom on input focus (font-size >= 16px)
- [ ] No blue tap highlight on mobile
- [ ] Horizontal scroll areas have scroll-snap
- [ ] Form inputs are usable on mobile keyboard

### Safe Areas
- [ ] Content respects notch / Dynamic Island
- [ ] Fixed bottom elements account for safe-area-inset-bottom
- [ ] Full-height sections use 100dvh not 100vh

### Performance
- [ ] Images use lazy loading
- [ ] Heavy animations disabled for prefers-reduced-motion
- [ ] Fonts loaded with `display: swap`
- [ ] No layout shift on load (CLS < 0.1)

### Accessibility
- [ ] Focus indicators visible on all interactive elements
- [ ] aria-expanded on hamburger toggle
- [ ] aria-label on navigation landmarks
- [ ] Color contrast passes WCAG AA (4.5:1 body, 3:1 large)
- [ ] Print stylesheet hides nav/decorative elements

---

## CRITICAL RULES

1. **MOBILE-FIRST ALWAYS** — base CSS = mobile. Add complexity via `min-width` media queries
2. **100dvh not 100vh** — use dynamic viewport height for mobile browser bars
3. **min-width: 0 on grid items** — prevents text overflow in CSS Grid
4. **Font-size >= 16px on inputs** — prevents iOS auto-zoom
5. **44x44px touch targets** — Apple HIG minimum, applies to ALL interactive elements
6. **Body scroll lock** — MUST lock body scroll when mobile menu is open
7. **Safe-area-inset** — MUST use `env()` for notch phones
8. **overflow-x: hidden on html/body** — prevent horizontal scroll on mobile
9. **clamp() for EVERYTHING** — font sizes, spacing, padding, gap, max-widths
10. **Test at 320px** — the narrowest common phone. If it works here, it works everywhere
