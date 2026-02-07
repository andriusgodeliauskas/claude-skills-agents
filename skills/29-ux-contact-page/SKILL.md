---
name: ux-contact-page
description: Complete Contact page with form, company info, map embed, social links, FAQ section, and office hours. Follows 2024-2025 UX best practices — minimal fields, clear labels, inline validation, success states, accessible form. Use for any "Contact Us", "Get in Touch", or "Reach Out" page. Includes 4 layout variants (split, stacked, card-based, minimal). ALWAYS combine with 11-responsive-premium and 12-deployment-paths skills.
---

# Contact Page UX Skill

**Purpose**: Make it effortless for users to reach out. Every friction point = lost lead.

---

## LAYOUT VARIANT 1: Split (form left, info right) — RECOMMENDED

```html
<section class="contact-page">
  <div class="container">
    <!-- Header -->
    <div class="contact-header">
      <span class="contact-tag">Contact</span>
      <h1>Get in Touch</h1>
      <p>Have a question or want to work together? Fill out the form and we'll get back to you within 24 hours.</p>
    </div>

    <div class="contact-grid">
      <!-- LEFT: Contact Form -->
      <div class="contact-form-wrapper">
        <form class="contact-form" id="contact-form" novalidate>
          <div class="form-row">
            <div class="form-group">
              <label for="c-name" class="form-label">Full Name *</label>
              <input type="text" id="c-name" name="name" class="form-input" required autocomplete="name" placeholder="John Smith">
              <span class="form-error"></span>
            </div>
            <div class="form-group">
              <label for="c-email" class="form-label">Email *</label>
              <input type="email" id="c-email" name="email" class="form-input" required autocomplete="email" placeholder="john@example.com">
              <span class="form-error"></span>
            </div>
          </div>

          <div class="form-group">
            <label for="c-subject" class="form-label">Subject</label>
            <select id="c-subject" name="subject" class="form-input form-select">
              <option value="">Select a topic...</option>
              <option value="general">General Inquiry</option>
              <option value="quote">Request a Quote</option>
              <option value="support">Support</option>
              <option value="partnership">Partnership</option>
            </select>
          </div>

          <div class="form-group">
            <label for="c-message" class="form-label">Message *</label>
            <textarea id="c-message" name="message" class="form-input form-textarea" required rows="5" placeholder="Tell us about your project..."></textarea>
            <span class="form-error"></span>
          </div>

          <div class="form-check">
            <input type="checkbox" id="c-privacy" name="privacy" required>
            <label for="c-privacy">I agree to the <a href="privacy.html">Privacy Policy</a> *</label>
          </div>

          <button type="submit" class="btn-submit" id="submit-btn">
            <span class="btn-text">Send Message</span>
            <span class="btn-loading" style="display:none">Sending...</span>
          </button>
        </form>

        <!-- Success message (hidden by default) -->
        <div class="form-success" id="form-success" style="display:none">
          <div class="success-icon">✓</div>
          <h3>Message Sent!</h3>
          <p>Thank you for reaching out. We'll get back to you within 24 hours.</p>
        </div>
      </div>

      <!-- RIGHT: Contact Info -->
      <div class="contact-info">
        <!-- Info cards -->
        <div class="info-card">
          <div class="info-icon">📧</div>
          <h3>Email Us</h3>
          <a href="mailto:hello@company.com">hello@company.com</a>
        </div>

        <div class="info-card">
          <div class="info-icon">📞</div>
          <h3>Call Us</h3>
          <a href="tel:+37060000000">+370 600 00000</a>
          <p class="info-note">Mon-Fri, 9:00 - 18:00</p>
        </div>

        <div class="info-card">
          <div class="info-icon">📍</div>
          <h3>Visit Us</h3>
          <p>Gedimino pr. 1<br>Vilnius, LT-01103<br>Lithuania</p>
        </div>

        <!-- Social links -->
        <div class="contact-socials">
          <a href="#" class="social-link" aria-label="Facebook">FB</a>
          <a href="#" class="social-link" aria-label="Instagram">IG</a>
          <a href="#" class="social-link" aria-label="LinkedIn">LI</a>
          <a href="#" class="social-link" aria-label="Twitter/X">X</a>
        </div>
      </div>
    </div>
  </div>
</section>
```

---

## CSS

```css
.contact-page { padding: clamp(60px, 8vw, 120px) 0; }

.contact-header {
  text-align: center;
  margin-bottom: clamp(40px, 6vw, 64px);
}

.contact-tag {
  display: inline-block;
  font-size: 0.75rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.15em;
  color: var(--accent, #6366F1);
  margin-bottom: 12px;
}

.contact-header h1 {
  font-size: clamp(2rem, 4vw, 3.5rem);
  font-weight: 700;
  margin-bottom: 12px;
}

.contact-header p {
  color: var(--text-muted, #6B7280);
  max-width: 500px;
  margin: 0 auto;
  font-size: 1.0625rem;
}

/* GRID LAYOUT */
.contact-grid {
  display: grid;
  grid-template-columns: 1.4fr 1fr;
  gap: clamp(32px, 5vw, 64px);
  align-items: start;
}

/* FORM STYLING */
.contact-form-wrapper {
  background: white;
  border: 1px solid #E5E7EB;
  border-radius: 16px;
  padding: clamp(24px, 3vw, 40px);
}

.form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
.form-group { margin-bottom: 20px; }

.form-label {
  display: block;
  font-size: 0.8125rem;
  font-weight: 500;
  margin-bottom: 6px;
  color: #374151;
}

.form-input {
  width: 100%;
  padding: 12px 16px;
  border: 1px solid #D1D5DB;
  border-radius: 10px;
  font-family: inherit;
  font-size: max(16px, 1rem);
  color: #111;
  background: #FAFAFA;
  transition: all 0.15s;
}

.form-input:focus {
  outline: none;
  border-color: var(--accent, #6366F1);
  background: white;
  box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.1);
}

.form-textarea { resize: vertical; min-height: 120px; }
.form-select { appearance: none; cursor: pointer; }

.form-input.error { border-color: #EF4444; }
.form-error { font-size: 0.75rem; color: #EF4444; margin-top: 4px; min-height: 1em; display: block; }

.form-check {
  display: flex;
  align-items: flex-start;
  gap: 10px;
  margin: 20px 0;
  font-size: 0.8125rem;
  color: #6B7280;
}

.form-check input { margin-top: 2px; width: 18px; height: 18px; accent-color: var(--accent, #6366F1); }
.form-check a { color: var(--accent, #6366F1); }

/* Submit button */
.btn-submit {
  width: 100%;
  padding: 16px;
  background: #111;
  color: white;
  border: none;
  border-radius: 12px;
  font-family: inherit;
  font-size: 1rem;
  font-weight: 600;
  cursor: pointer;
  transition: background 0.15s;
}

.btn-submit:hover { background: var(--accent, #6366F1); }
.btn-submit:disabled { opacity: 0.5; cursor: not-allowed; }

/* Success state */
.form-success {
  text-align: center;
  padding: 60px 20px;
}

.success-icon {
  width: 64px;
  height: 64px;
  border-radius: 50%;
  background: #D1FAE5;
  color: #059669;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5rem;
  font-weight: 700;
  margin: 0 auto 16px;
}

.form-success h3 { font-size: 1.5rem; margin-bottom: 8px; }
.form-success p { color: var(--text-muted, #6B7280); }

/* CONTACT INFO CARDS */
.contact-info {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.info-card {
  padding: 24px;
  border: 1px solid #E5E7EB;
  border-radius: 12px;
  background: white;
}

.info-icon { font-size: 1.5rem; margin-bottom: 8px; }
.info-card h3 { font-size: 0.9375rem; font-weight: 600; margin-bottom: 4px; }
.info-card a { color: var(--accent, #6366F1); text-decoration: none; font-size: 0.9375rem; }
.info-card a:hover { text-decoration: underline; }
.info-card p { color: var(--text-muted, #6B7280); font-size: 0.875rem; line-height: 1.5; }
.info-note { font-size: 0.75rem; color: #9CA3AF; margin-top: 4px; }

/* Social links */
.contact-socials { display: flex; gap: 12px; margin-top: 8px; }

.social-link {
  width: 44px;
  height: 44px;
  border-radius: 10px;
  border: 1px solid #E5E7EB;
  display: flex;
  align-items: center;
  justify-content: center;
  text-decoration: none;
  color: #374151;
  font-size: 0.8125rem;
  font-weight: 600;
  transition: all 0.2s;
}

.social-link:hover { background: #111; color: white; border-color: #111; }

/* RESPONSIVE */
@media (max-width: 768px) {
  .contact-grid { grid-template-columns: 1fr; }
  .form-row { grid-template-columns: 1fr; }
  .contact-info { order: -1; } /* Info first on mobile */
}
```

---

## JS: Form Validation

```javascript
const form = document.getElementById('contact-form');
const successMsg = document.getElementById('form-success');

form.addEventListener('submit', function(e) {
  e.preventDefault();
  let valid = true;

  // Validate required fields
  form.querySelectorAll('[required]').forEach(input => {
    const error = input.closest('.form-group')?.querySelector('.form-error') ||
                  input.closest('.form-check');

    if (!input.value.trim() && input.type !== 'checkbox') {
      input.classList.add('error');
      if (error && error.classList.contains('form-error')) error.textContent = 'This field is required';
      valid = false;
    } else if (input.type === 'checkbox' && !input.checked) {
      valid = false;
    } else if (input.type === 'email' && !input.value.includes('@')) {
      input.classList.add('error');
      if (error) error.textContent = 'Please enter a valid email';
      valid = false;
    } else {
      input.classList.remove('error');
      if (error && error.classList.contains('form-error')) error.textContent = '';
    }
  });

  if (valid) {
    // Show loading
    const btn = document.getElementById('submit-btn');
    btn.disabled = true;
    btn.querySelector('.btn-text').style.display = 'none';
    btn.querySelector('.btn-loading').style.display = 'inline';

    // Simulate sending (replace with actual API call)
    setTimeout(() => {
      form.style.display = 'none';
      successMsg.style.display = 'block';
    }, 1500);
  }
});

// Inline validation on blur
form.querySelectorAll('.form-input').forEach(input => {
  input.addEventListener('blur', function() {
    if (this.required && !this.value.trim()) {
      this.classList.add('error');
    } else {
      this.classList.remove('error');
    }
  });

  input.addEventListener('input', function() {
    this.classList.remove('error');
    const err = this.closest('.form-group')?.querySelector('.form-error');
    if (err) err.textContent = '';
  });
});
```

---

## OPTIONAL: MAP EMBED

```html
<section class="contact-map">
  <iframe
    src="https://www.google.com/maps/embed?pb=!1m18!..."
    width="100%"
    height="400"
    style="border:0; border-radius: 16px;"
    allowfullscreen=""
    loading="lazy"
    referrerpolicy="no-referrer-when-downgrade"
    title="Our office location">
  </iframe>
</section>
```

```css
.contact-map {
  margin-top: 60px;
  padding: 0 clamp(16px, 3vw, 40px);
}

.contact-map iframe {
  width: 100%;
  height: 400px;
  border-radius: 16px;
}
```

---

## OPTIONAL: FAQ ACCORDION

```html
<section class="contact-faq">
  <h2 class="section-heading">Frequently Asked Questions</h2>
  <div class="faq-list">
    <details class="faq-item">
      <summary class="faq-question">What is your typical response time?</summary>
      <div class="faq-answer"><p>We respond to all inquiries within 24 business hours.</p></div>
    </details>
    <details class="faq-item">
      <summary class="faq-question">Do you offer free consultations?</summary>
      <div class="faq-answer"><p>Yes! Our initial consultation is always free.</p></div>
    </details>
  </div>
</section>
```

```css
.faq-list { max-width: 700px; margin: 0 auto; }

.faq-item {
  border-bottom: 1px solid #E5E7EB;
}

.faq-question {
  padding: 20px 0;
  font-size: 1rem;
  font-weight: 500;
  cursor: pointer;
  list-style: none;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.faq-question::after { content: '+'; font-size: 1.25rem; color: #9CA3AF; }
.faq-item[open] .faq-question::after { content: '−'; }
.faq-question::-webkit-details-marker { display: none; }

.faq-answer { padding: 0 0 20px; color: var(--text-muted, #6B7280); line-height: 1.7; }
```

---

## CONTACT PAGE UX RULES

1. **Max 4-5 form fields** — name, email, subject (optional), message, privacy checkbox
2. **`font-size: max(16px, 1rem)`** on inputs — prevents iOS zoom
3. **Inline validation on blur** — show errors immediately, not on submit
4. **Success state** — replace form with confirmation message after send
5. **Phone number clickable** — `<a href="tel:+370...">` for mobile tap-to-call
6. **Email clickable** — `<a href="mailto:...">`
7. **Response time promise** — "within 24 hours" sets expectations
8. **Privacy checkbox** — GDPR requirement in EU
9. **No CAPTCHA** if possible — use honeypot field instead
10. **Social links** — include all active channels
11. **Map** — optional but useful for physical businesses
12. **Mobile: info first** — show phone/email before the form on small screens
