---
name: ux-checkout
description: Complete e-commerce checkout page with UX best practices from Baymard Institute (2024-2025). Includes progress indicator, guest checkout, form validation, order summary, shipping/payment selection, trust badges, promo code, mobile optimization. Average checkout has 5.1 steps and 11.3 fields — this skill minimizes to essential fields only. 70% cart abandonment rate means checkout UX is critical. Use for any e-commerce, booking, or payment flow. ALWAYS combine with 11-responsive-premium and 12-deployment-paths skills.
---

# Checkout UX Skill

**70% of users abandon cart. 18% abandon due to checkout complexity.** This skill prevents that.

---

## CHECKOUT STRUCTURE (recommended flow)

```
Step 1: Contact Information (email + guest/login option)
Step 2: Shipping Address (with auto-detect city from postal code)
Step 3: Shipping Method (with price + estimated delivery)
Step 4: Payment (card + alternatives)
Step 5: Review & Place Order
```

**ONE-PAGE variant**: All steps visible on one page with sticky order summary on right.

---

## HTML STRUCTURE — ONE-PAGE CHECKOUT (recommended)

```html
<div class="checkout-page">
  <!-- LEFT: Form sections -->
  <main class="checkout-form">
    <h1 class="checkout-title">Checkout</h1>

    <!-- Progress indicator -->
    <div class="checkout-progress">
      <div class="progress-step active" data-step="1"><span class="step-num">1</span> Contact</div>
      <div class="progress-step" data-step="2"><span class="step-num">2</span> Shipping</div>
      <div class="progress-step" data-step="3"><span class="step-num">3</span> Payment</div>
    </div>

    <!-- SECTION 1: Contact -->
    <section class="checkout-section" id="section-contact">
      <h2 class="section-title">Contact Information</h2>
      <p class="section-subtitle">Already have an account? <a href="#" class="link">Log in</a></p>

      <div class="form-group">
        <label for="email" class="form-label">Email address *</label>
        <input type="email" id="email" name="email" class="form-input" required
               autocomplete="email" placeholder="your@email.com">
        <span class="form-error" id="email-error"></span>
      </div>

      <div class="form-check">
        <input type="checkbox" id="newsletter" name="newsletter" checked>
        <label for="newsletter">Email me with news and offers</label>
      </div>
    </section>

    <!-- SECTION 2: Shipping Address -->
    <section class="checkout-section" id="section-shipping">
      <h2 class="section-title">Shipping Address</h2>

      <div class="form-row">
        <div class="form-group">
          <label for="firstName" class="form-label">First name *</label>
          <input type="text" id="firstName" name="firstName" class="form-input" required autocomplete="given-name">
        </div>
        <div class="form-group">
          <label for="lastName" class="form-label">Last name *</label>
          <input type="text" id="lastName" name="lastName" class="form-input" required autocomplete="family-name">
        </div>
      </div>

      <div class="form-group">
        <label for="address" class="form-label">Address *</label>
        <input type="text" id="address" name="address" class="form-input" required autocomplete="address-line1" placeholder="Street address">
      </div>

      <div class="form-group">
        <label for="address2" class="form-label">Apartment, suite, etc. <span class="optional">(optional)</span></label>
        <input type="text" id="address2" name="address2" class="form-input" autocomplete="address-line2">
      </div>

      <div class="form-row form-row-3">
        <div class="form-group">
          <label for="city" class="form-label">City *</label>
          <input type="text" id="city" name="city" class="form-input" required autocomplete="address-level2">
        </div>
        <div class="form-group">
          <label for="state" class="form-label">State/Region</label>
          <input type="text" id="state" name="state" class="form-input" autocomplete="address-level1">
        </div>
        <div class="form-group">
          <label for="postal" class="form-label">Postal code *</label>
          <input type="text" id="postal" name="postal" class="form-input" required autocomplete="postal-code">
        </div>
      </div>

      <div class="form-group">
        <label for="phone" class="form-label">Phone <span class="optional">(for delivery updates)</span></label>
        <input type="tel" id="phone" name="phone" class="form-input" autocomplete="tel">
      </div>

      <!-- Shipping method -->
      <h3 class="subsection-title">Shipping Method</h3>
      <div class="shipping-options">
        <label class="radio-card active">
          <input type="radio" name="shipping" value="standard" checked>
          <div class="radio-card-content">
            <span class="radio-card-title">Standard Shipping</span>
            <span class="radio-card-desc">5-7 business days</span>
          </div>
          <span class="radio-card-price">Free</span>
        </label>
        <label class="radio-card">
          <input type="radio" name="shipping" value="express">
          <div class="radio-card-content">
            <span class="radio-card-title">Express Shipping</span>
            <span class="radio-card-desc">2-3 business days</span>
          </div>
          <span class="radio-card-price">€9.99</span>
        </label>
      </div>

      <div class="form-check">
        <input type="checkbox" id="sameBilling" name="sameBilling" checked>
        <label for="sameBilling">Billing address same as shipping</label>
      </div>
    </section>

    <!-- SECTION 3: Payment -->
    <section class="checkout-section" id="section-payment">
      <h2 class="section-title">Payment</h2>
      <p class="section-subtitle secure-note">🔒 All transactions are secure and encrypted</p>

      <!-- Payment method tabs -->
      <div class="payment-tabs">
        <label class="payment-tab active">
          <input type="radio" name="paymentMethod" value="card" checked>
          <span>Credit Card</span>
        </label>
        <label class="payment-tab">
          <input type="radio" name="paymentMethod" value="paypal">
          <span>PayPal</span>
        </label>
      </div>

      <!-- Card form -->
      <div class="payment-card-form" id="card-form">
        <div class="form-group">
          <label for="cardNumber" class="form-label">Card number *</label>
          <input type="text" id="cardNumber" name="cardNumber" class="form-input"
                 autocomplete="cc-number" placeholder="1234 5678 9012 3456"
                 inputmode="numeric" maxlength="19">
        </div>
        <div class="form-row">
          <div class="form-group">
            <label for="cardExpiry" class="form-label">Expiry date *</label>
            <input type="text" id="cardExpiry" name="cardExpiry" class="form-input"
                   autocomplete="cc-exp" placeholder="MM / YY" inputmode="numeric" maxlength="7">
          </div>
          <div class="form-group">
            <label for="cardCvc" class="form-label">Security code *</label>
            <input type="text" id="cardCvc" name="cardCvc" class="form-input"
                   autocomplete="cc-csc" placeholder="CVC" inputmode="numeric" maxlength="4">
          </div>
        </div>
        <div class="form-group">
          <label for="cardName" class="form-label">Name on card *</label>
          <input type="text" id="cardName" name="cardName" class="form-input" autocomplete="cc-name">
        </div>
      </div>

      <!-- Trust signals -->
      <div class="trust-badges">
        <span class="trust-badge">🔒 SSL Secured</span>
        <span class="trust-badge">💳 Visa / MC / Amex</span>
        <span class="trust-badge">↩ 30-Day Returns</span>
      </div>
    </section>

    <!-- Place Order button -->
    <button type="submit" class="btn-place-order" id="place-order-btn">
      Place Order — <span id="order-total-btn">€0.00</span>
    </button>

    <p class="checkout-terms">
      By placing your order, you agree to our <a href="terms.html">Terms of Service</a> and <a href="privacy.html">Privacy Policy</a>.
    </p>
  </main>

  <!-- RIGHT: Order Summary (sticky) -->
  <aside class="order-summary" id="order-summary">
    <h2 class="summary-title">Order Summary</h2>

    <div class="summary-items">
      <div class="summary-item">
        <div class="summary-item-img">
          <img src="images/product-thumb.jpg" alt="Product">
          <span class="summary-item-qty">2</span>
        </div>
        <div class="summary-item-info">
          <div class="summary-item-name">Product Name</div>
          <div class="summary-item-variant">Size: M / Color: Black</div>
        </div>
        <div class="summary-item-price">€49.98</div>
      </div>
    </div>

    <!-- Promo code -->
    <div class="promo-code">
      <div class="promo-toggle" id="promo-toggle">Have a promo code?</div>
      <div class="promo-input-wrap" id="promo-wrap" style="display:none">
        <input type="text" class="form-input" placeholder="Discount code" id="promo-input">
        <button class="promo-apply-btn" id="promo-apply">Apply</button>
      </div>
    </div>

    <div class="summary-totals">
      <div class="summary-row"><span>Subtotal</span><span>€49.98</span></div>
      <div class="summary-row"><span>Shipping</span><span>Free</span></div>
      <div class="summary-row"><span>Tax</span><span>€10.50</span></div>
      <div class="summary-row total"><span>Total</span><span id="order-total">€60.48</span></div>
    </div>
  </aside>
</div>
```

---

## CSS STYLING

```css
* { box-sizing: border-box; margin: 0; }

body {
  font-family: 'Inter', -apple-system, sans-serif;
  background: #F9FAFB;
  color: #111;
  line-height: 1.5;
}

.checkout-page {
  display: grid;
  grid-template-columns: 1fr 400px;
  gap: 40px;
  max-width: 1200px;
  margin: 0 auto;
  padding: 40px clamp(16px, 3vw, 40px);
  min-height: 100vh;
}

.checkout-title {
  font-size: 1.75rem;
  font-weight: 700;
  margin-bottom: 24px;
}

/* PROGRESS INDICATOR */
.checkout-progress {
  display: flex;
  gap: 4px;
  margin-bottom: 32px;
}

.progress-step {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px 16px;
  background: #F3F4F6;
  border-radius: 8px;
  font-size: 0.8125rem;
  font-weight: 500;
  color: #9CA3AF;
  flex: 1;
  justify-content: center;
}

.progress-step.active { background: #111; color: #fff; }
.progress-step.completed { background: #D1FAE5; color: #065F46; }
.step-num { font-weight: 700; }

/* SECTIONS */
.checkout-section {
  background: white;
  border: 1px solid #E5E7EB;
  border-radius: 12px;
  padding: 28px;
  margin-bottom: 20px;
}

.section-title { font-size: 1.125rem; font-weight: 600; margin-bottom: 4px; }
.section-subtitle { font-size: 0.8125rem; color: #6B7280; margin-bottom: 20px; }
.subsection-title { font-size: 0.9375rem; font-weight: 600; margin: 24px 0 12px; }
.optional { color: #9CA3AF; font-weight: 400; }

/* FORM ELEMENTS */
.form-group { margin-bottom: 16px; }
.form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }
.form-row-3 { grid-template-columns: 1fr 1fr 1fr; }

.form-label {
  display: block;
  font-size: 0.8125rem;
  font-weight: 500;
  margin-bottom: 6px;
  color: #374151;
}

.form-input {
  width: 100%;
  padding: 12px 14px;
  border: 1px solid #D1D5DB;
  border-radius: 8px;
  font-family: inherit;
  font-size: max(16px, 1rem); /* Prevents iOS zoom */
  color: #111;
  transition: border-color 0.15s;
  background: white;
}

.form-input:focus {
  outline: none;
  border-color: #111;
  box-shadow: 0 0 0 3px rgba(0,0,0,0.05);
}

.form-input.error { border-color: #EF4444; }
.form-error { display: block; font-size: 0.75rem; color: #EF4444; margin-top: 4px; min-height: 1em; }

/* Checkboxes */
.form-check {
  display: flex;
  align-items: center;
  gap: 10px;
  margin: 16px 0;
  font-size: 0.875rem;
  color: #4B5563;
}

.form-check input[type="checkbox"] { width: 18px; height: 18px; accent-color: #111; }

/* RADIO CARDS (shipping options) */
.shipping-options { display: flex; flex-direction: column; gap: 8px; }

.radio-card {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 16px;
  border: 2px solid #E5E7EB;
  border-radius: 10px;
  cursor: pointer;
  transition: border-color 0.15s;
}

.radio-card.active,
.radio-card:has(input:checked) { border-color: #111; }
.radio-card-content { flex: 1; }
.radio-card-title { font-weight: 600; font-size: 0.9375rem; display: block; }
.radio-card-desc { font-size: 0.8125rem; color: #6B7280; }
.radio-card-price { font-weight: 600; font-size: 0.9375rem; }
.radio-card input[type="radio"] { accent-color: #111; }

/* PAYMENT TABS */
.payment-tabs { display: flex; gap: 8px; margin-bottom: 20px; }

.payment-tab {
  flex: 1;
  padding: 14px;
  text-align: center;
  border: 2px solid #E5E7EB;
  border-radius: 10px;
  cursor: pointer;
  font-weight: 500;
  font-size: 0.875rem;
  transition: border-color 0.15s;
}

.payment-tab.active,
.payment-tab:has(input:checked) { border-color: #111; background: #F9FAFB; }
.payment-tab input { display: none; }

/* Trust badges */
.trust-badges {
  display: flex;
  gap: 16px;
  margin-top: 20px;
  flex-wrap: wrap;
}

.trust-badge {
  font-size: 0.75rem;
  color: #6B7280;
  display: flex;
  align-items: center;
  gap: 4px;
}

.secure-note { color: #059669; font-weight: 500; }

/* PLACE ORDER BUTTON */
.btn-place-order {
  width: 100%;
  padding: 18px;
  background: #111;
  color: white;
  border: none;
  border-radius: 12px;
  font-size: 1.0625rem;
  font-weight: 600;
  font-family: inherit;
  cursor: pointer;
  transition: background 0.15s;
  margin-top: 8px;
}

.btn-place-order:hover { background: #333; }

.checkout-terms { font-size: 0.75rem; color: #9CA3AF; text-align: center; margin-top: 12px; }
.checkout-terms a { color: #6B7280; }

/* ORDER SUMMARY (sticky sidebar) */
.order-summary {
  background: white;
  border: 1px solid #E5E7EB;
  border-radius: 12px;
  padding: 28px;
  position: sticky;
  top: 40px;
  height: fit-content;
}

.summary-title { font-size: 1.125rem; font-weight: 600; margin-bottom: 20px; }

.summary-item {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px 0;
  border-bottom: 1px solid #F3F4F6;
}

.summary-item-img {
  position: relative;
  width: 64px;
  height: 64px;
  border-radius: 8px;
  overflow: hidden;
  border: 1px solid #E5E7EB;
  flex-shrink: 0;
}

.summary-item-img img { width: 100%; height: 100%; object-fit: cover; }

.summary-item-qty {
  position: absolute;
  top: -6px;
  right: -6px;
  width: 22px;
  height: 22px;
  background: #6B7280;
  color: white;
  border-radius: 50%;
  font-size: 0.6875rem;
  display: flex;
  align-items: center;
  justify-content: center;
}

.summary-item-name { font-weight: 500; font-size: 0.875rem; }
.summary-item-variant { font-size: 0.75rem; color: #9CA3AF; }
.summary-item-price { font-weight: 600; margin-left: auto; }

/* Promo code */
.promo-code { padding: 16px 0; border-bottom: 1px solid #F3F4F6; }
.promo-toggle { font-size: 0.8125rem; color: #6B7280; cursor: pointer; text-decoration: underline; }

.promo-input-wrap {
  display: flex;
  gap: 8px;
  margin-top: 8px;
}

.promo-input-wrap .form-input { flex: 1; padding: 10px 12px; }

.promo-apply-btn {
  padding: 10px 20px;
  background: #374151;
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 0.8125rem;
  font-weight: 600;
  cursor: pointer;
}

/* Totals */
.summary-totals { padding-top: 16px; }

.summary-row {
  display: flex;
  justify-content: space-between;
  padding: 6px 0;
  font-size: 0.875rem;
  color: #4B5563;
}

.summary-row.total {
  font-size: 1.125rem;
  font-weight: 700;
  color: #111;
  padding-top: 12px;
  margin-top: 8px;
  border-top: 1px solid #E5E7EB;
}

/* MOBILE */
@media (max-width: 768px) {
  .checkout-page {
    grid-template-columns: 1fr;
    padding: 16px;
    gap: 16px;
  }

  .order-summary {
    position: static;
    order: -1; /* Summary first on mobile */
  }

  .form-row { grid-template-columns: 1fr; }
  .form-row-3 { grid-template-columns: 1fr 1fr; }

  .checkout-progress { overflow-x: auto; flex-wrap: nowrap; }
  .progress-step { white-space: nowrap; padding: 8px 12px; font-size: 0.75rem; }
}
```

---

## JS: Form validation + promo toggle

```javascript
// Promo code toggle
document.getElementById('promo-toggle').addEventListener('click', () => {
  const wrap = document.getElementById('promo-wrap');
  wrap.style.display = wrap.style.display === 'none' ? 'flex' : 'none';
});

// Real-time email validation
document.getElementById('email').addEventListener('blur', function() {
  const err = document.getElementById('email-error');
  if (this.value && !this.value.includes('@')) {
    this.classList.add('error');
    err.textContent = 'Please enter a valid email address';
  } else {
    this.classList.remove('error');
    err.textContent = '';
  }
});

// Card number formatting (add spaces)
document.getElementById('cardNumber').addEventListener('input', function() {
  let v = this.value.replace(/\D/g, '').substring(0, 16);
  this.value = v.replace(/(.{4})/g, '$1 ').trim();
});

// Expiry formatting (MM / YY)
document.getElementById('cardExpiry').addEventListener('input', function() {
  let v = this.value.replace(/\D/g, '').substring(0, 4);
  if (v.length >= 2) v = v.substring(0,2) + ' / ' + v.substring(2);
  this.value = v;
});
```

---

## CHECKOUT UX RULES (Baymard Institute 2024-2025)

1. **Guest checkout FIRST** — never force account creation before purchase
2. **Minimum fields** — average is 11.3 fields; aim for 7-8 essential only
3. **Show all costs upfront** — subtotal, shipping, tax visible BEFORE payment step
4. **Progress indicator** — user must know where they are and how many steps remain
5. **Inline validation** — validate on blur (not on submit), show error next to field
6. **Autocomplete attributes** — EVERY input must have proper `autocomplete` value
7. **`font-size: max(16px, 1rem)`** on inputs — prevents iOS auto-zoom
8. **Billing = Shipping checkbox** — pre-checked, most users have same address
9. **Promo code HIDDEN** — collapsed by default to prevent users leaving to search for codes
10. **Trust badges near payment** — SSL, payment logos, return policy
11. **Sticky order summary** — user always sees what they're paying for
12. **Mobile: summary first** — show order recap before asking for details
13. **`inputmode="numeric"`** — on card number, CVC, postal code for numeric keyboard
14. **Auto-detect city from postal code** — 28% of mobile sites don't do this (Baymard)
15. **No CAPTCHA at checkout** — friction = lost sales
