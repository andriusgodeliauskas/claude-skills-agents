---
name: ux-image-gallery
description: Complete image gallery system with 5 gallery types — simple grid, masonry, horizontal scroll carousel, lightbox viewer, and accordion expand. Pure HTML/CSS/JS, no libraries. Includes touch swipe, keyboard navigation, lazy loading, responsive breakpoints. Use this skill whenever creating photo galleries, portfolio showcases, event photos, travel galleries, or any multi-image display. ALWAYS combine with 11-responsive-premium and 12-deployment-paths skills.
---

# Image Gallery UX Skill

**Use when**: Any page needs to display 4+ images in a visually appealing layout with interaction.

---

## GALLERY TYPE 1: Responsive Grid (equal sizes)

Best for: uniform content (team photos, products, thumbnails)

```html
<div class="gallery-grid">
  <div class="gallery-item">
    <img src="images/photo-01.jpg" alt="Description" loading="lazy">
    <div class="gallery-caption">Caption text</div>
  </div>
  <div class="gallery-item">
    <img src="images/photo-02.jpg" alt="Description" loading="lazy">
  </div>
  <!-- more items... -->
</div>
```

```css
.gallery-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 16px;
  padding: 20px;
}

.gallery-item {
  position: relative;
  overflow: hidden;
  border-radius: 8px;
  cursor: pointer;
}

.gallery-item img {
  width: 100%;
  aspect-ratio: 4/3;
  object-fit: cover;
  display: block;
  transition: transform 0.4s ease;
}

.gallery-item:hover img {
  transform: scale(1.05);
}

.gallery-caption {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 12px 16px;
  background: linear-gradient(transparent, rgba(0,0,0,0.7));
  color: white;
  font-size: 0.875rem;
  transform: translateY(100%);
  transition: transform 0.3s ease;
}

.gallery-item:hover .gallery-caption {
  transform: translateY(0);
}

/* Column variants */
.gallery-grid.cols-2 { grid-template-columns: repeat(2, 1fr); }
.gallery-grid.cols-3 { grid-template-columns: repeat(3, 1fr); }
.gallery-grid.cols-4 { grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)); }

@media (max-width: 768px) {
  .gallery-grid { grid-template-columns: repeat(2, 1fr); gap: 8px; }
  .gallery-grid.cols-2,
  .gallery-grid.cols-3 { grid-template-columns: repeat(2, 1fr); }
}

@media (max-width: 480px) {
  .gallery-grid { grid-template-columns: 1fr; }
}
```

---

## GALLERY TYPE 2: Masonry (Pinterest-style, varying heights)

Best for: mixed aspect ratios (photography, art, travel)

```css
.gallery-masonry {
  columns: 3;
  column-gap: 16px;
  padding: 20px;
}

.gallery-masonry .gallery-item {
  break-inside: avoid;
  margin-bottom: 16px;
  border-radius: 8px;
  overflow: hidden;
  cursor: pointer;
}

.gallery-masonry .gallery-item img {
  width: 100%;
  display: block;
  /* NO fixed aspect-ratio — let natural height show */
  transition: transform 0.4s ease, filter 0.4s ease;
}

.gallery-masonry .gallery-item:hover img {
  transform: scale(1.03);
  filter: brightness(1.05);
}

@media (max-width: 1024px) { .gallery-masonry { columns: 2; } }
@media (max-width: 600px)  { .gallery-masonry { columns: 1; } }
```

```html
<div class="gallery-masonry">
  <div class="gallery-item" data-lightbox="gallery1">
    <img src="images/tall-photo.jpg" alt="Tall" loading="lazy">
  </div>
  <div class="gallery-item" data-lightbox="gallery1">
    <img src="images/wide-photo.jpg" alt="Wide" loading="lazy">
  </div>
  <!-- Images naturally stack in columns with different heights -->
</div>
```

---

## GALLERY TYPE 3: Horizontal Scroll Carousel

Best for: featured photos, project showcases, stories

```html
<div class="gallery-carousel">
  <button class="carousel-btn carousel-prev" aria-label="Previous">‹</button>
  <div class="carousel-track">
    <div class="carousel-slide"><img src="images/slide-01.jpg" alt="" loading="lazy"></div>
    <div class="carousel-slide"><img src="images/slide-02.jpg" alt="" loading="lazy"></div>
    <div class="carousel-slide"><img src="images/slide-03.jpg" alt="" loading="lazy"></div>
    <div class="carousel-slide"><img src="images/slide-04.jpg" alt="" loading="lazy"></div>
    <div class="carousel-slide"><img src="images/slide-05.jpg" alt="" loading="lazy"></div>
  </div>
  <button class="carousel-btn carousel-next" aria-label="Next">›</button>
</div>
```

```css
.gallery-carousel {
  position: relative;
  overflow: hidden;
}

.carousel-track {
  display: flex;
  gap: 16px;
  overflow-x: auto;
  scroll-snap-type: x mandatory;
  scroll-behavior: smooth;
  -webkit-overflow-scrolling: touch;
  scrollbar-width: none; /* Firefox */
  padding: 20px;
}

.carousel-track::-webkit-scrollbar { display: none; }

.carousel-slide {
  flex: 0 0 auto;
  width: 70vw;
  max-width: 600px;
  scroll-snap-align: center;
  border-radius: 12px;
  overflow: hidden;
}

.carousel-slide img {
  width: 100%;
  aspect-ratio: 16/9;
  object-fit: cover;
  display: block;
}

/* Nav buttons */
.carousel-btn {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  z-index: 10;
  width: 48px;
  height: 48px;
  border-radius: 50%;
  border: none;
  background: rgba(255, 255, 255, 0.9);
  color: #333;
  font-size: 1.5rem;
  cursor: pointer;
  box-shadow: 0 2px 8px rgba(0,0,0,0.15);
  transition: all 0.2s;
  display: flex;
  align-items: center;
  justify-content: center;
}

.carousel-prev { left: 16px; }
.carousel-next { right: 16px; }

.carousel-btn:hover {
  background: #fff;
  box-shadow: 0 4px 16px rgba(0,0,0,0.2);
}

@media (max-width: 768px) {
  .carousel-slide { width: 85vw; }
  .carousel-btn { width: 40px; height: 40px; font-size: 1.2rem; }
}
```

```javascript
// Carousel navigation
document.querySelectorAll('.gallery-carousel').forEach(carousel => {
  const track = carousel.querySelector('.carousel-track');
  const prev = carousel.querySelector('.carousel-prev');
  const next = carousel.querySelector('.carousel-next');
  const slideWidth = () => track.querySelector('.carousel-slide').offsetWidth + 16;

  prev.addEventListener('click', () => track.scrollBy({ left: -slideWidth(), behavior: 'smooth' }));
  next.addEventListener('click', () => track.scrollBy({ left: slideWidth(), behavior: 'smooth' }));
});
```

---

## GALLERY TYPE 4: Horizontal Free-Scroll Strip

Best for: logo walls, quick previews, Instagram-style feeds

```css
.gallery-strip {
  display: flex;
  gap: 12px;
  overflow-x: auto;
  scroll-snap-type: x proximity;
  -webkit-overflow-scrolling: touch;
  scrollbar-width: none;
  padding: 16px;
}

.gallery-strip::-webkit-scrollbar { display: none; }

.gallery-strip .strip-item {
  flex: 0 0 auto;
  width: 200px;
  height: 200px;
  border-radius: 12px;
  overflow: hidden;
  scroll-snap-align: start;
}

.gallery-strip .strip-item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
```

---

## GALLERY TYPE 5: Expanding Accordion Gallery

Best for: before/after, categories, featured collections

```css
.gallery-accordion {
  display: flex;
  height: 500px;
  gap: 8px;
  padding: 20px;
}

.gallery-accordion .acc-item {
  flex: 1;
  min-width: 60px;
  border-radius: 12px;
  overflow: hidden;
  position: relative;
  cursor: pointer;
  transition: flex 0.5s cubic-bezier(0.16, 1, 0.3, 1);
}

.gallery-accordion .acc-item:hover {
  flex: 4;
}

.gallery-accordion .acc-item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.gallery-accordion .acc-item .acc-label {
  position: absolute;
  bottom: 20px;
  left: 20px;
  color: white;
  font-size: 1.25rem;
  font-weight: 600;
  opacity: 0;
  transform: translateY(10px);
  transition: all 0.3s ease 0.15s;
  text-shadow: 0 1px 4px rgba(0,0,0,0.5);
}

.gallery-accordion .acc-item:hover .acc-label {
  opacity: 1;
  transform: translateY(0);
}

@media (max-width: 768px) {
  .gallery-accordion {
    flex-direction: column;
    height: auto;
  }
  .gallery-accordion .acc-item {
    height: 120px;
    min-width: unset;
  }
  .gallery-accordion .acc-item:hover { flex: 3; }
}
```

---

## LIGHTBOX VIEWER (works with ALL gallery types)

Add `data-lightbox="groupname"` to any `.gallery-item` to enable lightbox.

```html
<!-- Lightbox overlay (add once at end of body) -->
<div class="lightbox" id="lightbox" role="dialog" aria-modal="true" aria-label="Image viewer">
  <button class="lightbox-close" aria-label="Close">&times;</button>
  <button class="lightbox-prev" aria-label="Previous image">‹</button>
  <button class="lightbox-next" aria-label="Next image">›</button>
  <div class="lightbox-content">
    <img src="" alt="" class="lightbox-img" id="lightbox-img">
    <div class="lightbox-counter" id="lightbox-counter"></div>
  </div>
</div>
```

```css
.lightbox {
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, 0.92);
  z-index: 10000;
  display: flex;
  align-items: center;
  justify-content: center;
  opacity: 0;
  pointer-events: none;
  transition: opacity 0.3s ease;
}

.lightbox.active {
  opacity: 1;
  pointer-events: all;
}

.lightbox-content {
  position: relative;
  max-width: 90vw;
  max-height: 90vh;
  display: flex;
  align-items: center;
  justify-content: center;
}

.lightbox-img {
  max-width: 90vw;
  max-height: 85vh;
  object-fit: contain;
  border-radius: 4px;
  transition: opacity 0.2s;
}

.lightbox-close {
  position: absolute;
  top: 20px;
  right: 20px;
  background: none;
  border: none;
  color: white;
  font-size: 2.5rem;
  cursor: pointer;
  z-index: 10;
  width: 48px;
  height: 48px;
  display: flex;
  align-items: center;
  justify-content: center;
  opacity: 0.7;
  transition: opacity 0.2s;
}

.lightbox-close:hover { opacity: 1; }

.lightbox-prev,
.lightbox-next {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  background: rgba(255,255,255,0.1);
  border: none;
  color: white;
  font-size: 2rem;
  width: 56px;
  height: 56px;
  border-radius: 50%;
  cursor: pointer;
  z-index: 10;
  transition: background 0.2s;
}

.lightbox-prev { left: 20px; }
.lightbox-next { right: 20px; }

.lightbox-prev:hover,
.lightbox-next:hover { background: rgba(255,255,255,0.2); }

.lightbox-counter {
  position: absolute;
  bottom: -40px;
  left: 50%;
  transform: translateX(-50%);
  color: rgba(255,255,255,0.6);
  font-size: 0.875rem;
}

@media (max-width: 768px) {
  .lightbox-prev, .lightbox-next { width: 44px; height: 44px; font-size: 1.5rem; }
  .lightbox-prev { left: 8px; }
  .lightbox-next { right: 8px; }
}
```

```javascript
// Lightbox functionality
(function() {
  const lightbox = document.getElementById('lightbox');
  const lbImg = document.getElementById('lightbox-img');
  const lbCounter = document.getElementById('lightbox-counter');
  let images = [];
  let currentIndex = 0;

  // Collect all lightbox-enabled items
  document.querySelectorAll('[data-lightbox]').forEach((item, i) => {
    const img = item.querySelector('img');
    if (!img) return;

    item.addEventListener('click', () => {
      // Build group
      const group = item.dataset.lightbox;
      images = [];
      document.querySelectorAll(`[data-lightbox="${group}"] img`).forEach(el => {
        images.push({ src: el.src, alt: el.alt });
      });
      currentIndex = images.findIndex(img => img.src === item.querySelector('img').src);
      openLightbox();
    });
  });

  function openLightbox() {
    showImage();
    lightbox.classList.add('active');
    document.body.style.overflow = 'hidden';
  }

  function closeLightbox() {
    lightbox.classList.remove('active');
    document.body.style.overflow = '';
  }

  function showImage() {
    lbImg.src = images[currentIndex].src;
    lbImg.alt = images[currentIndex].alt;
    lbCounter.textContent = `${currentIndex + 1} / ${images.length}`;
  }

  function nextImage() {
    currentIndex = (currentIndex + 1) % images.length;
    showImage();
  }

  function prevImage() {
    currentIndex = (currentIndex - 1 + images.length) % images.length;
    showImage();
  }

  // Event listeners
  lightbox.querySelector('.lightbox-close').addEventListener('click', closeLightbox);
  lightbox.querySelector('.lightbox-next').addEventListener('click', nextImage);
  lightbox.querySelector('.lightbox-prev').addEventListener('click', prevImage);
  lightbox.addEventListener('click', (e) => { if (e.target === lightbox) closeLightbox(); });

  // Keyboard
  document.addEventListener('keydown', (e) => {
    if (!lightbox.classList.contains('active')) return;
    if (e.key === 'Escape') closeLightbox();
    if (e.key === 'ArrowRight') nextImage();
    if (e.key === 'ArrowLeft') prevImage();
  });

  // Touch swipe
  let touchStartX = 0;
  lightbox.addEventListener('touchstart', (e) => { touchStartX = e.changedTouches[0].screenX; });
  lightbox.addEventListener('touchend', (e) => {
    const diff = e.changedTouches[0].screenX - touchStartX;
    if (Math.abs(diff) > 50) {
      diff > 0 ? prevImage() : nextImage();
    }
  });
})();
```

---

## UX RULES

1. **Lazy loading**: ALWAYS use `loading="lazy"` on images below the fold
2. **Alt text**: Every image MUST have descriptive `alt` attribute
3. **Aspect ratio**: Set `aspect-ratio` on grid images to prevent layout shift
4. **Touch targets**: Nav buttons minimum 44×44px
5. **Keyboard**: Lightbox must support Escape, Arrow keys
6. **Body scroll lock**: When lightbox open, `overflow: hidden` on body
7. **Counter**: Show "3 / 12" in lightbox so user knows position
8. **Close mechanisms**: Click overlay, click ✕, press Escape — all three must work
9. **Performance**: Max 12-20 thumbnails per page load; lazy-load the rest
10. **Mobile**: Carousel slides should be 85vw on mobile, gallery grid goes to 2 or 1 column
