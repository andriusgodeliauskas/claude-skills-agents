---
name: ux-about-page
description: Complete About Us / About page with modular block system — hero section, mission/values, team grid, timeline/history, stats/numbers, testimonials, partners/clients logos, CTA section. Each block is independent and reorderable. Follows UX best practices for storytelling, trust building, and conversion. Use for any internal "About" page, "Our Story", "Who We Are", or company information page. ALWAYS combine with 11-responsive-premium and 12-deployment-paths skills.
---

# About Us Page UX Skill

**Purpose**: Build trust, tell the brand story, humanize the company, drive conversion.
**This page is NOT optional** — 52% of users want to see an About page (KoMarketing study).

---

## PAGE STRUCTURE (recommended block order)

```
1. Hero → Brand statement / mission headline
2. Story → Who we are, how we started
3. Mission & Values → What drives us (3-4 values)
4. Stats → Key numbers (years, clients, projects)
5. Team → People behind the brand
6. Timeline → History milestones (optional)
7. Testimonials → Social proof
8. Clients/Partners → Logo wall
9. CTA → What to do next (contact, buy, etc.)
```

Each block is independent. Pick the ones that fit.

---

## BLOCK 1: HERO — Brand Statement

```html
<section class="about-hero">
  <div class="container">
    <span class="about-tag">About Us</span>
    <h1 class="about-hero-title">We build digital products that <em>people love</em></h1>
    <p class="about-hero-desc">Founded in 2018, we're a team of designers and developers passionate about creating meaningful digital experiences.</p>
  </div>
</section>
```

```css
.about-hero {
  padding: clamp(80px, 12vw, 160px) 0 clamp(60px, 8vw, 100px);
  text-align: center;
}

.about-tag {
  display: inline-block;
  font-size: 0.75rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.15em;
  color: var(--accent, #6366F1);
  margin-bottom: 20px;
}

.about-hero-title {
  font-size: clamp(2.5rem, 5vw, 4.5rem);
  font-weight: 700;
  line-height: 1.1;
  max-width: 800px;
  margin: 0 auto 24px;
}

.about-hero-title em {
  font-style: italic;
  color: var(--accent, #6366F1);
}

.about-hero-desc {
  font-size: clamp(1rem, 1.2vw, 1.25rem);
  color: var(--text-muted, #6B7280);
  max-width: 600px;
  margin: 0 auto;
  line-height: 1.7;
}
```

---

## BLOCK 2: STORY — Who We Are (text + image)

```html
<section class="about-story">
  <div class="container story-grid">
    <div class="story-content">
      <h2>Our Story</h2>
      <p>It all started in a small garage in Vilnius. Two friends, a laptop, and a dream to make the web more beautiful.</p>
      <p>Today, we've grown into a team of 25 creatives serving clients across Europe. But our mission hasn't changed — craft digital experiences that matter.</p>
    </div>
    <div class="story-image">
      <img src="images/about-story.jpg" alt="Our team at work" loading="lazy">
    </div>
  </div>
</section>
```

```css
.story-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: clamp(40px, 6vw, 80px);
  align-items: center;
  padding: 80px 0;
}

.story-content h2 {
  font-size: clamp(1.75rem, 3vw, 2.5rem);
  margin-bottom: 20px;
}

.story-content p {
  color: var(--text-muted, #6B7280);
  line-height: 1.8;
  margin-bottom: 16px;
}

.story-image img {
  width: 100%;
  border-radius: 16px;
  object-fit: cover;
  aspect-ratio: 4/3;
}

@media (max-width: 768px) {
  .story-grid { grid-template-columns: 1fr; }
  .story-image { order: -1; } /* Image first on mobile */
}
```

---

## BLOCK 3: MISSION & VALUES (3-4 cards)

```html
<section class="about-values">
  <div class="container">
    <h2 class="section-heading">What We Stand For</h2>
    <div class="values-grid">
      <div class="value-card">
        <div class="value-icon">🎯</div>
        <h3>Purpose-Driven</h3>
        <p>Every pixel has a purpose. We don't design for decoration — we design for results.</p>
      </div>
      <div class="value-card">
        <div class="value-icon">🤝</div>
        <h3>Transparency</h3>
        <p>No hidden agendas. We communicate openly with our clients and each other.</p>
      </div>
      <div class="value-card">
        <div class="value-icon">🚀</div>
        <h3>Innovation</h3>
        <p>We stay ahead of trends and push boundaries to deliver cutting-edge solutions.</p>
      </div>
    </div>
  </div>
</section>
```

```css
.section-heading {
  text-align: center;
  font-size: clamp(1.75rem, 3vw, 2.5rem);
  margin-bottom: 48px;
}

.values-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
  gap: 24px;
}

.value-card {
  text-align: center;
  padding: 40px 24px;
  border: 1px solid #E5E7EB;
  border-radius: 16px;
  transition: transform 0.2s, box-shadow 0.2s;
}

.value-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 24px rgba(0,0,0,0.06);
}

.value-icon { font-size: 2.5rem; margin-bottom: 16px; }
.value-card h3 { font-size: 1.25rem; margin-bottom: 8px; }
.value-card p { color: var(--text-muted, #6B7280); font-size: 0.9375rem; line-height: 1.6; }
```

---

## BLOCK 4: STATS / KEY NUMBERS

```html
<section class="about-stats">
  <div class="container stats-grid">
    <div class="stat">
      <div class="stat-number">7+</div>
      <div class="stat-label">Years Experience</div>
    </div>
    <div class="stat">
      <div class="stat-number">200+</div>
      <div class="stat-label">Projects Delivered</div>
    </div>
    <div class="stat">
      <div class="stat-number">50+</div>
      <div class="stat-label">Happy Clients</div>
    </div>
    <div class="stat">
      <div class="stat-number">15</div>
      <div class="stat-label">Team Members</div>
    </div>
  </div>
</section>
```

```css
.about-stats {
  background: #111;
  color: white;
  padding: clamp(48px, 6vw, 80px) 0;
}

.stats-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 32px;
  text-align: center;
}

.stat-number {
  font-size: clamp(2.5rem, 5vw, 4rem);
  font-weight: 800;
  line-height: 1;
  margin-bottom: 8px;
}

.stat-label {
  font-size: 0.875rem;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  color: rgba(255,255,255,0.6);
}

@media (max-width: 768px) {
  .stats-grid { grid-template-columns: repeat(2, 1fr); }
}
```

---

## BLOCK 5: TEAM GRID

```html
<section class="about-team">
  <div class="container">
    <h2 class="section-heading">Meet the Team</h2>
    <div class="team-grid">
      <div class="team-member">
        <div class="team-photo">
          <img src="images/team-01.jpg" alt="Jonas Jonaitis" loading="lazy">
        </div>
        <h3 class="team-name">Jonas Jonaitis</h3>
        <p class="team-role">Founder & CEO</p>
      </div>
      <!-- more members... -->
    </div>
  </div>
</section>
```

```css
.team-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 32px;
  text-align: center;
}

.team-photo {
  width: 160px;
  height: 160px;
  border-radius: 50%;
  overflow: hidden;
  margin: 0 auto 16px;
}

.team-photo img { width: 100%; height: 100%; object-fit: cover; }
.team-name { font-size: 1.0625rem; font-weight: 600; margin-bottom: 4px; }
.team-role { font-size: 0.8125rem; color: var(--text-muted, #6B7280); }
```

---

## BLOCK 6: TIMELINE / HISTORY

```html
<section class="about-timeline">
  <div class="container">
    <h2 class="section-heading">Our Journey</h2>
    <div class="timeline">
      <div class="timeline-item">
        <div class="timeline-year">2018</div>
        <div class="timeline-content">
          <h3>The Beginning</h3>
          <p>Founded by two friends with a passion for web design.</p>
        </div>
      </div>
      <div class="timeline-item">
        <div class="timeline-year">2020</div>
        <div class="timeline-content">
          <h3>Team Growth</h3>
          <p>Expanded to 10 team members and opened our first office.</p>
        </div>
      </div>
      <div class="timeline-item">
        <div class="timeline-year">2024</div>
        <div class="timeline-content">
          <h3>Going International</h3>
          <p>Started serving clients across Europe and beyond.</p>
        </div>
      </div>
    </div>
  </div>
</section>
```

```css
.timeline { position: relative; padding-left: 40px; max-width: 700px; margin: 0 auto; }

.timeline::before {
  content: '';
  position: absolute;
  left: 12px;
  top: 0;
  bottom: 0;
  width: 2px;
  background: #E5E7EB;
}

.timeline-item {
  position: relative;
  padding-bottom: 40px;
}

.timeline-item::before {
  content: '';
  position: absolute;
  left: -34px;
  top: 4px;
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background: var(--accent, #6366F1);
  border: 3px solid white;
  box-shadow: 0 0 0 2px var(--accent, #6366F1);
}

.timeline-year {
  font-size: 0.75rem;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  color: var(--accent, #6366F1);
  margin-bottom: 4px;
}

.timeline-content h3 { font-size: 1.125rem; margin-bottom: 4px; }
.timeline-content p { color: var(--text-muted, #6B7280); font-size: 0.9375rem; }
```

---

## BLOCK 7: CLIENT/PARTNER LOGOS

```css
.logo-wall {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 40px;
  align-items: center;
  padding: 60px 0;
  opacity: 0.5;
}

.logo-wall img {
  height: 32px;
  width: auto;
  filter: grayscale(1);
  transition: filter 0.2s, opacity 0.2s;
}

.logo-wall img:hover { filter: grayscale(0); opacity: 1; }
```

---

## BLOCK 8: CTA — Call to Action

```html
<section class="about-cta">
  <div class="container" style="text-align:center">
    <h2>Ready to Work Together?</h2>
    <p>Let's create something amazing. Get in touch today.</p>
    <a href="contact.html" class="cta-btn">Contact Us</a>
  </div>
</section>
```

```css
.about-cta {
  padding: clamp(60px, 10vw, 120px) 0;
  text-align: center;
}

.about-cta h2 { font-size: clamp(2rem, 4vw, 3rem); margin-bottom: 12px; }
.about-cta p { color: var(--text-muted); margin-bottom: 32px; font-size: 1.125rem; }

.cta-btn {
  display: inline-flex;
  padding: 16px 40px;
  background: #111;
  color: white;
  text-decoration: none;
  border-radius: 999px;
  font-weight: 600;
  font-size: 1rem;
  transition: background 0.2s;
}

.cta-btn:hover { background: var(--accent, #6366F1); }
```

---

## UX RULES FOR ABOUT PAGES

1. **Lead with WHY** — mission/purpose first, history later
2. **Real photos** — team photos must be real, not stock
3. **Max 4 values** — more than 4 becomes unmemorable
4. **Stats with context** — "200+ projects" means more than just "200"
5. **Team = round photos** — circle crops are standard for headshots
6. **CTA at the end** — always end with what user should do next
7. **Responsive** — all grids collapse to 1-2 columns on mobile
8. **No jargon** — write for customers, not for yourself
