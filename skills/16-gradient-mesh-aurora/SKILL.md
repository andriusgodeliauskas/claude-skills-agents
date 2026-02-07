---
name: gradient-mesh-aurora
description: Vibrant multi-color gradient mesh backgrounds, aurora-like color transitions, mesh gradient blobs, iridescent surfaces. Evergreen trend 2022-2024 fueled by Apple, Stripe, Linear, Vercel aesthetics. Uses CSS radial-gradient layering, animated color shifts, noise texture overlay. Perfect for SaaS landing pages, startup sites, product launches, creative portfolios. NOT the same as single-direction linear gradients — this is MESH (multiple overlapping radial gradients). ALWAYS combine with 11-responsive-premium skill.
---

# Gradient Mesh Aurora Design Style

**Era**: 2022-2024 (evergreen) | **Vibe**: Modern, vibrant, dynamic, premium
**Best for**: SaaS landing, startup launches, tech products, creative studios, app showcases
**Inspired by**: Stripe, Linear, Vercel, Apple, Figma marketing sites

---

## CORE: MESH GRADIENT TECHNIQUE

A mesh gradient is NOT a single `linear-gradient`. It's **multiple overlapping radial gradients** that create organic, flowing color blobs.

```css
.mesh-bg {
  background-color: #0F0F1A;
  background-image:
    /* Blob 1 — top-left, purple */
    radial-gradient(ellipse at 15% 20%, rgba(139, 92, 246, 0.4) 0%, transparent 50%),
    /* Blob 2 — center-right, blue */
    radial-gradient(ellipse at 75% 40%, rgba(59, 130, 246, 0.35) 0%, transparent 50%),
    /* Blob 3 — bottom-left, cyan */
    radial-gradient(ellipse at 25% 80%, rgba(6, 182, 212, 0.3) 0%, transparent 50%),
    /* Blob 4 — top-right, pink */
    radial-gradient(ellipse at 85% 15%, rgba(236, 72, 153, 0.25) 0%, transparent 45%);
  min-height: 100vh;
}
```

---

## COLOR PALETTES (5 mesh combos)

### Northern Lights (default)
```css
--mesh-1: rgba(139, 92, 246, 0.4);   /* Purple */
--mesh-2: rgba(59, 130, 246, 0.35);  /* Blue */
--mesh-3: rgba(6, 182, 212, 0.3);    /* Cyan */
--mesh-4: rgba(236, 72, 153, 0.25);  /* Pink */
--mesh-base: #0F0F1A;
```

### Sunset Fire
```css
--mesh-1: rgba(251, 146, 60, 0.4);   /* Orange */
--mesh-2: rgba(244, 63, 94, 0.35);   /* Rose */
--mesh-3: rgba(168, 85, 247, 0.3);   /* Purple */
--mesh-4: rgba(251, 191, 36, 0.25);  /* Amber */
--mesh-base: #1A0F0F;
```

### Ocean Deep
```css
--mesh-1: rgba(6, 182, 212, 0.4);    /* Cyan */
--mesh-2: rgba(34, 211, 238, 0.3);   /* Teal */
--mesh-3: rgba(99, 102, 241, 0.35);  /* Indigo */
--mesh-4: rgba(16, 185, 129, 0.2);   /* Emerald */
--mesh-base: #0A1628;
```

### Cotton Candy (light mode)
```css
--mesh-1: rgba(236, 72, 153, 0.2);   /* Pink */
--mesh-2: rgba(168, 85, 247, 0.15);  /* Purple */
--mesh-3: rgba(59, 130, 246, 0.15);  /* Blue */
--mesh-4: rgba(251, 191, 36, 0.1);   /* Yellow */
--mesh-base: #FAFAFA;
```

### Emerald Forest
```css
--mesh-1: rgba(16, 185, 129, 0.4);   /* Emerald */
--mesh-2: rgba(34, 197, 94, 0.3);    /* Green */
--mesh-3: rgba(6, 182, 212, 0.25);   /* Cyan */
--mesh-4: rgba(251, 191, 36, 0.15);  /* Amber */
--mesh-base: #0A1A14;
```

---

## ANIMATED MESH (slowly moving blobs)

```css
.mesh-animated {
  position: relative;
  overflow: hidden;
  background: var(--mesh-base);
}

.mesh-animated .blob {
  position: absolute;
  border-radius: 50%;
  filter: blur(80px);
  opacity: 0.6;
  animation: blob-drift 20s ease-in-out infinite alternate;
}

.blob-1 {
  width: 600px; height: 600px;
  background: var(--mesh-1);
  top: -10%; left: -5%;
  animation-delay: 0s;
}

.blob-2 {
  width: 500px; height: 500px;
  background: var(--mesh-2);
  top: 30%; right: -10%;
  animation-delay: -5s;
  animation-duration: 25s;
}

.blob-3 {
  width: 450px; height: 450px;
  background: var(--mesh-3);
  bottom: -10%; left: 20%;
  animation-delay: -10s;
  animation-duration: 22s;
}

@keyframes blob-drift {
  0%   { transform: translate(0, 0) scale(1); }
  33%  { transform: translate(30px, -20px) scale(1.05); }
  66%  { transform: translate(-20px, 20px) scale(0.95); }
  100% { transform: translate(10px, -10px) scale(1.02); }
}
```

```html
<section class="mesh-animated">
  <div class="blob blob-1"></div>
  <div class="blob blob-2"></div>
  <div class="blob blob-3"></div>
  <div class="content" style="position: relative; z-index: 1;">
    <!-- Your content above the blobs -->
  </div>
</section>
```

---

## NOISE TEXTURE OVERLAY (premium touch)

Subtle grain prevents gradient banding and adds texture:

```css
.mesh-bg::after {
  content: '';
  position: absolute;
  inset: 0;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='0.04'/%3E%3C/svg%3E");
  pointer-events: none;
  z-index: 1;
  opacity: 0.5;
}
```

---

## TYPOGRAPHY

```css
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap');

body {
  font-family: 'Inter', sans-serif;
  -webkit-font-smoothing: antialiased;
}

/* Gradient text — popular with mesh style */
.gradient-text {
  background: linear-gradient(135deg, #818CF8, #C084FC, #F472B6);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

h1 {
  font-size: clamp(3rem, 6vw, 5rem);
  font-weight: 800;
  letter-spacing: -0.03em;
  line-height: 1.05;
  color: #FAFAFA;
}
```

---

## FROSTED GLASS CARDS (complements mesh)

```css
.glass-card {
  background: rgba(255, 255, 255, 0.05);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border: 1px solid rgba(255, 255, 255, 0.08);
  border-radius: 20px;
  padding: 32px;
  position: relative;
  z-index: 2;
}

.glass-card:hover {
  background: rgba(255, 255, 255, 0.08);
  border-color: rgba(255, 255, 255, 0.12);
}
```

---

## BUTTONS

```css
/* Gradient button */
.btn-gradient {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 14px 28px;
  background: linear-gradient(135deg, #6366F1, #8B5CF6);
  color: #FFFFFF;
  border: none;
  border-radius: 12px;
  font-weight: 600;
  font-size: 0.9375rem;
  cursor: pointer;
  transition: all 0.2s ease;
  position: relative;
  overflow: hidden;
}

.btn-gradient:hover {
  box-shadow: 0 8px 30px -6px rgba(99, 102, 241, 0.5);
  transform: translateY(-1px);
}

/* Glass button */
.btn-glass {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 14px 28px;
  background: rgba(255, 255, 255, 0.06);
  backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.1);
  color: #FAFAFA;
  border-radius: 12px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.2s ease;
}

.btn-glass:hover {
  background: rgba(255, 255, 255, 0.1);
  border-color: rgba(255, 255, 255, 0.15);
}
```

---

## PERFORMANCE

1. Blur filter is expensive — limit to 3-4 blobs max
2. Use `will-change: transform` on animated blobs
3. On mobile, reduce blob count to 2 and increase blur to hide seams
4. Noise texture SVG is inline (no extra HTTP request)
5. `backdrop-filter` is GPU-accelerated but test on low-end devices

```css
/* Mobile: simpler mesh, fewer blobs */
@media (max-width: 768px) {
  .blob-3 { display: none; }
  .blob-1, .blob-2 { filter: blur(100px); }
}
```

---

## COMMON MISTAKES

1. ❌ Using `linear-gradient` instead of layered `radial-gradient` — flat, not mesh
2. ❌ Too many blob colors (>4) — becomes muddy brown/grey
3. ❌ Forgetting `filter: blur()` on blobs — sharp circles instead of soft aurora
4. ❌ No noise texture — gradient shows visible color banding
5. ❌ Content below z-index of blobs — text invisible
6. ❌ Animating too fast — aurora should be slow and smooth (15-30s cycles)
