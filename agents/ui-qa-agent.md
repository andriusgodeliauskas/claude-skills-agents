# 🤖 UI QA Agent - Automatic Website Testing

**Purpose:** Automated UI/UX quality assurance for all website pages  
**Owner:** Alfred  
**Created:** 2026-02-07 13:21 UTC

---

## 🎯 Mission

After website deployment, automatically test EVERY page at EVERY breakpoint to ensure:
- ✅ Mobile-responsive layout
- ✅ Navigation works
- ✅ No content cut-off/hidden
- ✅ Proper spacing/padding
- ✅ Interactive elements functional
- ✅ Forms, galleries, cart working

**Zero manual checks. Zero guesswork. Full automation.**

---

## 📋 Test Protocol

### 1. Discovery
Find all HTML pages in website:
```bash
# Example for seed-to-cup-v2
SITE_URL="https://alfred.godeliauskas.com/seed-to-cup-v2"
PAGES=(
  "$SITE_URL/index.html"
  "$SITE_URL/pages/collection.html"
  "$SITE_URL/pages/product.html"
  "$SITE_URL/pages/story.html"
  "$SITE_URL/pages/brewing-guide.html"
  "$SITE_URL/pages/contact.html"
)
```

### 2. Breakpoint Testing
Test each page at:
- **375px** - Mobile (iPhone SE)
- **768px** - Tablet (iPad portrait)
- **1920px** - Desktop (Full HD)

### 3. Test Categories

#### A. Layout & Spacing
- [ ] No horizontal scroll
- [ ] Content has ≥20px padding from edges (left + right)
- [ ] Elements not cut off at screen edges
- [ ] Text readable (font-size ≥14px on mobile)
- [ ] Images not distorted (aspect ratio preserved)

#### B. Navigation
- [ ] Desktop menu visible (>768px)
- [ ] Mobile hamburger visible (<768px)
- [ ] Hamburger opens/closes on click
- [ ] All nav links clickable
- [ ] Logo links to homepage
- [ ] Active page highlighted

#### C. Interactive Elements
- [ ] All buttons clickable
- [ ] Buttons have proper touch targets (≥44px height on mobile)
- [ ] Hover states work (desktop)
- [ ] Forms have input fields
- [ ] Form submit buttons work
- [ ] Modals/popups open and close
- [ ] Cart icon clickable (if exists)
- [ ] Image galleries/sliders work (thumbnails, arrows)

#### D. Content Visibility
- [ ] All text visible (not hidden/overlapped)
- [ ] Headings not cut off
- [ ] Images load (no broken 404s)
- [ ] Footer visible and formatted
- [ ] No overlapping elements

#### E. Console Health
- [ ] Zero JavaScript errors
- [ ] No 404s (missing images/files)
- [ ] No CORS errors
- [ ] Fonts loaded successfully

---

## 🛠️ Implementation

### Automated Test Script
```bash
#!/bin/bash
# /root/clawd/scripts/ui-qa-test.sh

SITE_URL="$1"
REPORT_FILE="/root/clawd/reports/ui-qa-$(date +%Y-%m-%d-%H%M).md"

echo "# UI QA Report - $(date)" > "$REPORT_FILE"
echo "Site: $SITE_URL" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Test each page
for PAGE in index.html pages/*.html; do
    echo "## Testing: $PAGE" >> "$REPORT_FILE"
    
    # Test breakpoints via browser tool
    # - 375px mobile
    # - 768px tablet
    # - 1920px desktop
    
    # Check for issues
    # Log to report
done

echo "Report saved: $REPORT_FILE"
```

### Browser-Based Testing (via Clawdbot browser tool)
```javascript
// Test page at specific breakpoint
async function testPage(url, width, height) {
    const issues = [];
    
    // 1. Navigate & resize
    await browser.navigate(url);
    await browser.resize(width, height);
    
    // 2. Check horizontal scroll
    const hasHScroll = await browser.evaluate(() => {
        return document.body.scrollWidth > window.innerWidth;
    });
    if (hasHScroll) issues.push(`❌ Horizontal scroll detected`);
    
    // 3. Check padding
    const padding = await browser.evaluate(() => {
        const container = document.querySelector('.container, main, body');
        const style = getComputedStyle(container);
        return {
            left: parseInt(style.paddingLeft),
            right: parseInt(style.paddingRight)
        };
    });
    if (padding.left < 20 || padding.right < 20) {
        issues.push(`❌ Insufficient padding: L${padding.left}px R${padding.right}px`);
    }
    
    // 4. Test mobile menu
    if (width < 768) {
        const hamburger = await browser.snapshot().find('[class*="hamburger"]');
        if (hamburger) {
            await browser.click(hamburger);
            // Check if menu opened
        } else {
            issues.push(`❌ Mobile hamburger menu not found`);
        }
    }
    
    // 5. Check console errors
    const consoleErrors = await browser.console();
    const errors = consoleErrors.filter(msg => msg.type === 'error');
    if (errors.length > 0) {
        issues.push(`❌ Console errors: ${errors.length}`);
    }
    
    return issues;
}
```

---

## 📊 Report Format

```markdown
# UI QA Report - Seed to Cup V2
**Date:** 2026-02-07 13:25 UTC  
**Site:** https://alfred.godeliauskas.com/seed-to-cup-v2/

---

## Summary
- **Pages Tested:** 6
- **Breakpoints:** 3 (375px, 768px, 1920px)
- **Total Tests:** 18
- **Issues Found:** 3

---

## Test Results

### ✅ index.html
- **375px Mobile:** PASS (0 issues)
- **768px Tablet:** PASS (0 issues)
- **1920px Desktop:** PASS (0 issues)

### ⚠️ pages/product.html
- **375px Mobile:** FAIL (2 issues)
  - ❌ Horizontal scroll detected
  - ❌ Insufficient padding: L10px R10px
- **768px Tablet:** PASS
- **1920px Desktop:** PASS

### ✅ pages/collection.html
- **375px Mobile:** PASS
- **768px Tablet:** PASS
- **1920px Desktop:** PASS

---

## Screenshots
- [Mobile 375px - Homepage]
- [Mobile 375px - Product (FAILED)]
- [Desktop 1920px - All Pages]

---

## Recommendations
1. Fix product.html mobile padding (increase to 25px)
2. Remove horizontal scroll on product page
3. Re-test after fixes
```

---

## 🚀 Usage

### Manual Invocation
```bash
# Test entire website
cd /root/clawd
./scripts/ui-qa-test.sh "https://alfred.godeliauskas.com/seed-to-cup-v2"

# Test single page
./scripts/ui-qa-test.sh "https://alfred.godeliauskas.com/seed-to-cup-v2/pages/product.html"
```

### Automated (Post-Deployment Hook)
Add to deployment script:
```bash
# After FTP upload
echo "🔍 Running UI QA tests..."
./scripts/ui-qa-test.sh "$SITE_URL"

# Check report
REPORT_FILE=$(ls -t /root/clawd/reports/ui-qa-*.md | head -1)
cat "$REPORT_FILE"

# Fail deployment if critical issues
if grep -q "❌" "$REPORT_FILE"; then
    echo "⚠️ QA FAILED - Fix issues before reporting complete"
    exit 1
fi
```

---

## 🎯 Success Criteria

**Before reporting website as "COMPLETE":**
- [ ] UI QA Agent ran successfully
- [ ] Zero ❌ issues in report
- [ ] All pages tested at 3 breakpoints
- [ ] Screenshots attached
- [ ] Console error-free

**No exceptions. No shortcuts.**

---

## 📝 Example Test Scenarios

### Scenario 1: New Website Deployment
```
1. Deploy to FTP
2. Run: ./scripts/ui-qa-test.sh "https://alfred.godeliauskas.com/my-site"
3. Review report
4. Fix issues (if any)
5. Re-run test
6. Report complete ONLY when test passes
```

### Scenario 2: Quick Fix Verification
```
1. Fix mobile padding issue
2. Upload to FTP
3. Run: ./scripts/ui-qa-test.sh "https://alfred.godeliauskas.com/my-site/pages/product.html"
4. Verify fix worked
```

### Scenario 3: Portfolio Update
```
1. Test ALL 18 websites quarterly
2. Generate batch report
3. Fix any regressions
4. Update portfolio with "QA Verified" badge
```

---

## 🔧 Future Enhancements

1. **Visual Regression Testing** - Compare screenshots before/after changes
2. **Accessibility Checks** - WCAG compliance, contrast ratios
3. **Performance Metrics** - Load time, Lighthouse score
4. **Cross-Browser Testing** - Chrome, Safari, Firefox
5. **Automated Fixes** - Suggest CSS patches for common issues

---

## 📌 Related Files
- `/root/clawd/WEBSITE-QA-CHECKLIST.md` - Manual QA checklist
- `/root/clawd/WEBSITE-DEPLOYMENT.md` - Deployment workflow
- `/root/clawd/scripts/ui-qa-test.sh` - Test automation script
- `/root/clawd/reports/ui-qa-*.md` - Generated reports
