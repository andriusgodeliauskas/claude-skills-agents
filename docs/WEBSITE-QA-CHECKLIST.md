# 📋 WEBSITE QA CHECKLIST

**MANDATORY before reporting website as "COMPLETE"**

## ✅ Responsive Design Testing

### Desktop Breakpoints
- [ ] **1920px** - Full HD monitor
- [ ] **1440px** - Standard laptop
- [ ] **1024px** - Small laptop / Tablet landscape

### Mobile Breakpoints
- [ ] **768px** - iPad portrait
- [ ] **414px** - iPhone Pro Max
- [ ] **375px** - iPhone SE / Standard mobile
- [ ] **360px** - Samsung Galaxy

## ✅ Layout Checks (EACH breakpoint)

- [ ] **No content cut off** - Nothing hidden at edges
- [ ] **Proper padding** - Minimum 20px both sides
- [ ] **Text readable** - No fonts below 14px
- [ ] **Buttons tappable** - Min 44px height (mobile)
- [ ] **Images not distorted** - Correct aspect ratios
- [ ] **No horizontal scroll** - Content fits screen width

## ✅ Navigation

- [ ] **Desktop menu** - All links visible and working
- [ ] **Mobile hamburger** - Opens/closes correctly
- [ ] **Active states** - Current page highlighted
- [ ] **Logo links** - Returns to homepage
- [ ] **Sticky/fixed nav** - Works on scroll

## ✅ Interactive Elements

- [ ] **All buttons clickable** - Hover/active states work
- [ ] **Forms functional** - Inputs, validation, submit
- [ ] **Modals/popups** - Open, close, responsive
- [ ] **Image galleries** - Thumbnails, slider, zoom
- [ ] **Dropdowns/accordions** - Expand/collapse
- [ ] **External links** - Open in new tab (if needed)

## ✅ Performance

- [ ] **Images load** - No 404s or broken images
- [ ] **Fast loading** - Page loads <3 seconds
- [ ] **No console errors** - Check browser dev tools
- [ ] **No CORS issues** - External resources load
- [ ] **Fonts loaded** - Custom fonts display correctly

## ✅ Content

- [ ] **All text present** - No lorem ipsum
- [ ] **Correct links** - All href/src paths valid
- [ ] **Contact info** - Email, phone, address correct
- [ ] **Copyright year** - Current year (2026)
- [ ] **Social links** - Point to correct profiles (or #)

## ✅ Mobile-Specific

- [ ] **Touch targets** - Easy to tap (min 44x44px)
- [ ] **Pinch zoom** - Enabled (unless intentionally disabled)
- [ ] **Orientation** - Works in portrait AND landscape
- [ ] **Thumb-friendly** - Nav at bottom or easy reach
- [ ] **No hover-only features** - All actions touch-accessible

## ✅ Cross-Browser (if time permits)

- [ ] Chrome/Edge (Chromium)
- [ ] Safari (iOS)
- [ ] Firefox

## 🚨 CRITICAL BEFORE "COMPLETE" REPORT

1. **Screenshot evidence** - Take screenshots at 375px, 768px, 1920px
2. **Full-page scroll** - Verify entire page on mobile
3. **Click test** - Try every button/link
4. **Console check** - Open DevTools, verify no errors

## 📝 Report Template

When reporting website complete, include:

```
✅ WEBSITE COMPLETE: [Project Name]
📱 QA TESTED:
- Desktop (1920px) ✅
- Tablet (768px) ✅
- Mobile (375px) ✅

🔍 Screenshots:
- [Desktop screenshot]
- [Mobile screenshot]

🐛 Issues Found: None / [List any known limitations]

🔗 Live URL: [https://...]
```

## ⚠️ Zero Tolerance

**NO website reported as "complete" without:**
1. Testing ALL mobile breakpoints (minimum 375px + 768px + 1920px)
2. Verifying no horizontal scroll on mobile
3. Checking proper padding (content not touching edges)
4. Console error check

**Consequence of skip:** Extra back-and-forth, user frustration, unprofessional delivery.

**Rule:** Test once, deploy once. No "fix after deploy" unless emergency.
