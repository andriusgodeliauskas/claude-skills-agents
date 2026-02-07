---
name: ux-product-gallery
description: E-commerce product image gallery with main image + thumbnail strip, zoom on hover/click, horizontal swipe carousel on mobile, fullscreen lightbox, variant image switching. Follows 2024-2025 UX best practices from Baymard Institute and top retailers (Amazon, Apple, Nike). Use whenever building product pages, e-commerce listings, or any detail page with multiple images of one item. ALWAYS combine with 11-responsive-premium and 12-deployment-paths skills.
---

# Product Gallery UX Skill

**Use when**: Product detail pages, e-commerce items, property listings, car detail pages — anywhere ONE item has MULTIPLE images.

---

## LAYOUT PATTERN: Main Image + Thumbnail Strip

### Desktop: Thumbnails on LEFT side, main image on RIGHT

```html
<div class="product-gallery">
  <!-- Thumbnail strip (left) -->
  <div class="pg-thumbs">
    <button class="pg-thumb active" data-index="0">
      <img src="images/product-01-thumb.jpg" alt="Front view">
    </button>
    <button class="pg-thumb" data-index="1">
      <img src="images/product-02-thumb.jpg" alt="Side view">
    </button>
    <button class="pg-thumb" data-index="2">
      <img src="images/product-03-thumb.jpg" alt="Back view">
    </button>
    <button class="pg-thumb" data-index="3">
      <img src="images/product-04-thumb.jpg" alt="Detail">
    </button>
    <button class="pg-thumb" data-index="4">
      <img src="images/product-05-thumb.jpg" alt="In use">
    </button>
  </div>

  <!-- Main image viewer -->
  <div class="pg-main">
    <div class="pg-main-img-wrapper">
      <img src="images/product-01.jpg" alt="Product front view" class="pg-main-img" id="pg-main-img">
      <!-- Zoom lens (desktop only) -->
      <div class="pg-zoom-lens" id="pg-zoom-lens"></div>
    </div>
    <!-- Image counter (mobile) -->
    <div class="pg-counter"><span id="pg-current">1</span> / <span id="pg-total">5</span></div>
    <!-- Fullscreen button -->
    <button class="pg-fullscreen-btn" aria-label="View fullscreen">
      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <path d="M8 3H5a2 2 0 0 0-2 2v3m18 0V5a2 2 0 0 0-2-2h-3m0 18h3a2 2 0 0 0 2-2v-3M3 16v3a2 2 0 0 0 2 2h3"/>
      </svg>
    </button>
  </div>
</div>
```

```css
.product-gallery {
  display: grid;
  grid-template-columns: 80px 1fr;
  gap: 16px;
  max-width: 700px;
}

/* THUMBNAIL STRIP — vertical on desktop */
.pg-thumbs {
  display: flex;
  flex-direction: column;
  gap: 8px;
  overflow-y: auto;
  max-height: 500px;
}

.pg-thumb {
  flex-shrink: 0;
  width: 72px;
  height: 72px;
  border-radius: 8px;
  overflow: hidden;
  border: 2px solid transparent;
  cursor: pointer;
  background: none;
  padding: 0;
  transition: border-color 0.2s;
}

.pg-thumb img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.pg-thumb.active {
  border-color: #111;
}

.pg-thumb:hover:not(.active) {
  border-color: #ccc;
}

/* MAIN IMAGE */
.pg-main {
  position: relative;
  overflow: hidden;
  border-radius: 12px;
  background: #F5F5F5;
}

.pg-main-img-wrapper {
  position: relative;
  cursor: zoom-in;
}

.pg-main-img {
  width: 100%;
  aspect-ratio: 1/1;
  object-fit: contain;
  display: block;
  transition: opacity 0.2s;
}

/* Fullscreen button */
.pg-fullscreen-btn {
  position: absolute;
  top: 12px;
  right: 12px;
  width: 40px;
  height: 40px;
  border-radius: 8px;
  background: rgba(255,255,255,0.8);
  border: none;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: background 0.2s;
  z-index: 2;
}

.pg-fullscreen-btn:hover { background: white; }

/* Counter — hidden on desktop, shown on mobile */
.pg-counter {
  display: none;
  position: absolute;
  bottom: 12px;
  right: 12px;
  background: rgba(0,0,0,0.6);
  color: white;
  padding: 4px 10px;
  border-radius: 12px;
  font-size: 0.75rem;
}

/* MOBILE: horizontal swipe carousel */
@media (max-width: 768px) {
  .product-gallery {
    grid-template-columns: 1fr;
    gap: 8px;
  }

  /* Main image becomes swipe carousel */
  .pg-main-img-wrapper {
    display: flex;
    overflow-x: auto;
    scroll-snap-type: x mandatory;
    -webkit-overflow-scrolling: touch;
    scrollbar-width: none;
    cursor: default;
  }

  .pg-main-img-wrapper::-webkit-scrollbar { display: none; }

  .pg-main-img-wrapper img {
    flex: 0 0 100%;
    scroll-snap-align: start;
    aspect-ratio: 1/1;
  }

  .pg-counter { display: block; }

  /* Thumbnails become horizontal strip below */
  .pg-thumbs {
    flex-direction: row;
    overflow-x: auto;
    overflow-y: hidden;
    max-height: none;
    scrollbar-width: none;
    padding: 4px;
  }

  .pg-thumbs::-webkit-scrollbar { display: none; }

  .pg-thumb {
    width: 56px;
    height: 56px;
  }
}
```

---

## ZOOM ON HOVER (desktop only)

```css
/* Zoom effect — image follows cursor */
.pg-zoom-lens {
  display: none;
  position: absolute;
  pointer-events: none;
  width: 200px;
  height: 200px;
  border: 2px solid rgba(0,0,0,0.1);
  border-radius: 50%;
  background-repeat: no-repeat;
  box-shadow: 0 4px 20px rgba(0,0,0,0.15);
  z-index: 5;
}

@media (min-width: 769px) {
  .pg-main-img-wrapper:hover .pg-zoom-lens {
    display: block;
  }
}
```

```javascript
// Zoom on hover
const mainImg = document.getElementById('pg-main-img');
const zoomLens = document.getElementById('pg-zoom-lens');
const wrapper = mainImg.closest('.pg-main-img-wrapper');

if (window.innerWidth > 768) {
  wrapper.addEventListener('mousemove', (e) => {
    const rect = wrapper.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;
    const px = (x / rect.width) * 100;
    const py = (y / rect.height) * 100;

    zoomLens.style.left = `${x - 100}px`;
    zoomLens.style.top = `${y - 100}px`;
    zoomLens.style.backgroundImage = `url(${mainImg.src})`;
    zoomLens.style.backgroundSize = `${rect.width * 2.5}px ${rect.height * 2.5}px`;
    zoomLens.style.backgroundPosition = `${px}% ${py}%`;
  });
}
```

---

## THUMBNAIL SWITCHING

```javascript
const thumbs = document.querySelectorAll('.pg-thumb');
const mainImage = document.getElementById('pg-main-img');
const currentSpan = document.getElementById('pg-current');

// Full-size image URLs (same order as thumbs)
const fullImages = [
  'images/product-01.jpg',
  'images/product-02.jpg',
  'images/product-03.jpg',
  'images/product-04.jpg',
  'images/product-05.jpg'
];

thumbs.forEach(thumb => {
  thumb.addEventListener('click', () => {
    const index = parseInt(thumb.dataset.index);
    mainImage.src = fullImages[index];
    mainImage.alt = thumb.querySelector('img').alt;
    currentSpan.textContent = index + 1;

    thumbs.forEach(t => t.classList.remove('active'));
    thumb.classList.add('active');
  });
});
```

---

## FULLSCREEN LIGHTBOX FOR PRODUCT

```javascript
const fullscreenBtn = document.querySelector('.pg-fullscreen-btn');

fullscreenBtn.addEventListener('click', () => {
  // Reuse the general lightbox from skill 25
  // OR create a simple fullscreen overlay:
  const overlay = document.createElement('div');
  overlay.className = 'pg-lightbox';
  overlay.innerHTML = `
    <button class="pg-lb-close" aria-label="Close">&times;</button>
    <button class="pg-lb-prev" aria-label="Previous">‹</button>
    <button class="pg-lb-next" aria-label="Next">›</button>
    <img src="${mainImage.src}" alt="${mainImage.alt}" class="pg-lb-img">
    <div class="pg-lb-counter">${currentSpan.textContent} / ${fullImages.length}</div>
  `;
  document.body.appendChild(overlay);
  document.body.style.overflow = 'hidden';

  let idx = parseInt(currentSpan.textContent) - 1;

  const update = () => {
    overlay.querySelector('.pg-lb-img').src = fullImages[idx];
    overlay.querySelector('.pg-lb-counter').textContent = `${idx + 1} / ${fullImages.length}`;
  };

  overlay.querySelector('.pg-lb-close').addEventListener('click', () => {
    overlay.remove();
    document.body.style.overflow = '';
  });

  overlay.querySelector('.pg-lb-next').addEventListener('click', () => {
    idx = (idx + 1) % fullImages.length;
    update();
  });

  overlay.querySelector('.pg-lb-prev').addEventListener('click', () => {
    idx = (idx - 1 + fullImages.length) % fullImages.length;
    update();
  });

  overlay.addEventListener('click', (e) => {
    if (e.target === overlay) { overlay.remove(); document.body.style.overflow = ''; }
  });
});
```

```css
.pg-lightbox {
  position: fixed;
  inset: 0;
  background: rgba(0,0,0,0.95);
  z-index: 10000;
  display: flex;
  align-items: center;
  justify-content: center;
}

.pg-lb-img {
  max-width: 90vw;
  max-height: 90vh;
  object-fit: contain;
}

.pg-lb-close {
  position: absolute; top: 16px; right: 16px;
  background: none; border: none; color: white;
  font-size: 2.5rem; cursor: pointer; z-index: 10;
}

.pg-lb-prev, .pg-lb-next {
  position: absolute; top: 50%; transform: translateY(-50%);
  background: rgba(255,255,255,0.1); border: none; color: white;
  width: 52px; height: 52px; border-radius: 50%;
  font-size: 1.8rem; cursor: pointer;
}

.pg-lb-prev { left: 16px; }
.pg-lb-next { right: 16px; }

.pg-lb-counter {
  position: absolute; bottom: 24px; left: 50%; transform: translateX(-50%);
  color: rgba(255,255,255,0.5); font-size: 0.875rem;
}
```

---

## UX BEST PRACTICES (Baymard Institute research)

1. **3-8 images per product** — show all angles (front, back, side, detail, in-use, scale)
2. **First image = hero** — clean product on white/neutral background
3. **Zoom is mandatory** — users need to inspect details before purchasing
4. **Thumbnails visible always** — user must see ALL available images at a glance
5. **Active thumbnail highlighted** — clear border/indicator on selected thumb
6. **Mobile = swipe carousel** — thumbnails below, counter showing position
7. **Fullscreen option** — button always visible for detailed inspection
8. **Keyboard navigation** — Arrow keys in lightbox
9. **Fast loading** — thumbnails ~100px, main image ~800px, zoom image ~1600px
10. **No autoplay** — product gallery should NEVER auto-rotate; user controls all
11. **Aspect ratio = 1:1** — square images are industry standard for products
12. **White/neutral background** — product must be the focus, not the background
