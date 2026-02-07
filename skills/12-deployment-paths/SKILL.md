---
name: frontend-deployment-paths
description: Ensure all file paths, asset references, internal links, and resource URLs work correctly when a website is deployed to a subdomain subfolder (e.g. alfred.godeliauskas.com/project-name/). This skill fixes the #1 deployment bug — broken paths. Use this skill ALWAYS when creating any HTML website that will be uploaded via FTP to a subfolder. Handles relative paths, base href, CSS/JS/image references, multi-page linking, favicon, Open Graph meta, and canonical URLs. MANDATORY for every ClowBot/FTP deployment.
---

# Deployment Paths & Links Skill

**PROBLEM**: When a website is uploaded to a subfolder like `https://alfred.godeliauskas.com/seed-to-cup-v2/`, all paths break if they use absolute references like `/styles.css` or `/images/logo.png`. This is because `/` points to the domain root (`alfred.godeliauskas.com/`), not the project subfolder.

**THIS SKILL ENSURES**: Every link, asset, and reference works correctly regardless of where the site is hosted.

---

## RULE #1: USE RELATIVE PATHS FOR EVERYTHING

**NEVER** use root-relative paths (starting with `/`):
```html
<!-- ❌ WRONG — will look for alfred.godeliauskas.com/styles.css -->
<link rel="stylesheet" href="/styles.css">
<script src="/js/main.js"></script>
<img src="/images/hero.jpg">
<a href="/about.html">About</a>

<!-- ✅ CORRECT — relative to current file location -->
<link rel="stylesheet" href="styles.css">
<script src="js/main.js"></script>
<img src="images/hero.jpg">
<a href="about.html">About</a>
```

**NEVER** use absolute paths without the full URL:
```html
<!-- ❌ WRONG -->
<link rel="stylesheet" href="/seed-to-cup-v2/styles.css">

<!-- ✅ CORRECT — just relative -->
<link rel="stylesheet" href="styles.css">
```

---

## RULE #2: FOLDER STRUCTURE

Always create a clean, flat-as-possible structure:

```
project-name/
├── index.html              ← Main page
├── about.html              ← Subpage (same level)
├── contact.html
├── style-01.html           ← Style variants (same level)
├── style-02.html
├── css/
│   ├── styles.css          ← Main stylesheet
│   └── responsive.css      ← Responsive styles (if separate)
├── js/
│   └── main.js             ← Main JavaScript
├── images/
│   ├── logo.svg
│   ├── hero.jpg
│   └── favicon.ico
├── fonts/                  ← Local fonts (if any)
│   └── custom-font.woff2
└── assets/                 ← Other assets
    └── data.json
```

**KEY**: All HTML files should be at the SAME level (root of project folder). This makes linking between pages simple: `href="about.html"`, not `href="../about.html"`.

---

## RULE #3: LINKING BETWEEN PAGES

When all HTML files are in the same folder:

```html
<!-- From index.html → about.html -->
<a href="about.html">About</a>

<!-- From about.html → index.html -->
<a href="index.html">Home</a>

<!-- From any page → style variant -->
<a href="style-01.html">Style 1</a>

<!-- Anchor links on same page -->
<a href="#features">Features</a>

<!-- Anchor links to section on another page -->
<a href="about.html#team">Our Team</a>
```

**NEVER** use:
```html
<!-- ❌ These WILL break on subfolder deployment -->
<a href="/about.html">
<a href="/pages/about.html">
<a href="https://alfred.godeliauskas.com/seed-to-cup-v2/about.html">
```

---

## RULE #4: CSS REFERENCES

### In HTML `<head>`:
```html
<!-- ✅ CORRECT -->
<link rel="stylesheet" href="css/styles.css">

<!-- Also correct — if CSS is in same folder as HTML -->
<link rel="stylesheet" href="styles.css">
```

### Inside CSS files — url() paths are relative TO THE CSS FILE:
```css
/* If CSS is in css/ folder and images are in images/ folder:
   css/styles.css → needs to go UP one level to reach images/ */

/* ✅ CORRECT — relative to CSS file location */
body {
  background-image: url('../images/bg-pattern.png');
}

.logo {
  background-image: url('../images/logo.svg');
}

/* ✅ CORRECT — Google Fonts are absolute URLs (external) */
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap');

/* ✅ CORRECT — local fonts relative to CSS */
@font-face {
  font-family: 'CustomFont';
  src: url('../fonts/custom-font.woff2') format('woff2');
}

/* ❌ WRONG — root-relative will break */
body {
  background-image: url('/images/bg-pattern.png');
}
```

---

## RULE #5: JAVASCRIPT REFERENCES

### In HTML:
```html
<!-- ✅ CORRECT -->
<script src="js/main.js"></script>
<script src="js/main.js" defer></script>

<!-- ❌ WRONG -->
<script src="/js/main.js"></script>
```

### Inside JavaScript — fetch/import paths:
```javascript
// ✅ CORRECT — relative to HTML file that loaded the script
fetch('assets/data.json')
  .then(r => r.json())
  .then(data => console.log(data));

// ✅ CORRECT — relative path for images set via JS
img.src = 'images/photo.jpg';

// ❌ WRONG
fetch('/assets/data.json');
img.src = '/images/photo.jpg';
```

---

## RULE #6: META TAGS, FAVICON, OPEN GRAPH

```html
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Seed to Cup — Premium Coffee</title>

  <!-- Favicon — relative path -->
  <link rel="icon" type="image/svg+xml" href="images/favicon.svg">
  <link rel="icon" type="image/x-icon" href="images/favicon.ico">
  <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

  <!-- Open Graph — THESE NEED FULL ABSOLUTE URLs to work on social media -->
  <!-- Use a variable/placeholder that can be updated per deployment -->
  <meta property="og:title" content="Seed to Cup — Premium Coffee">
  <meta property="og:description" content="From farm to your morning cup">
  <meta property="og:image" content="https://alfred.godeliauskas.com/seed-to-cup-v2/images/og-image.jpg">
  <meta property="og:url" content="https://alfred.godeliauskas.com/seed-to-cup-v2/">
  <meta property="og:type" content="website">

  <!-- Canonical URL — also needs full absolute URL -->
  <link rel="canonical" href="https://alfred.godeliauskas.com/seed-to-cup-v2/">

  <!-- CSS — relative -->
  <link rel="stylesheet" href="css/styles.css">
</head>
```

**IMPORTANT**: Open Graph `og:image` and `og:url` MUST be full absolute URLs — social media crawlers don't resolve relative paths. Everything else should be relative.

---

## RULE #7: NAVIGATION COMPONENT — CORRECT LINKING

```html
<!-- Navigation that works on ANY page in the project -->
<nav>
  <a href="index.html" class="nav-logo">Brand</a>
  <ul>
    <li><a href="index.html">Home</a></li>
    <li><a href="about.html">About</a></li>
    <li><a href="services.html">Services</a></li>
    <li><a href="contact.html">Contact</a></li>
  </ul>
</nav>

<!-- ❌ NEVER DO THIS -->
<a href="/">Home</a>                  <!-- Goes to domain root! -->
<a href="/about.html">About</a>      <!-- Goes to domain root! -->
<a href="./about.html">About</a>     <!-- Works but unnecessary dot -->
```

---

## RULE #8: STYLE SHOWCASE / MULTI-VARIANT PAGES

When creating multiple style variants (like your seed-to-cup styles):

```html
<!-- styles-overview.html — links to all variants -->
<h2>Available Styles:</h2>
<ul>
  <li><a href="style-01.html">Style 01 — Liquid Glass</a></li>
  <li><a href="style-02.html">Style 02 — Neo Brutalist</a></li>
  <li><a href="style-03.html">Style 03 — Editorial</a></li>
  <!-- ... -->
</ul>

<!-- Inside each style-XX.html — link back and to other styles -->
<a href="index.html">← Back to Overview</a>
<a href="style-02.html">Next Style →</a>
```

Each style file should be **self-contained** (CSS inline or in the same relative folder):
```html
<!-- style-01.html — self-contained with inline CSS -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Style 01 — Liquid Glass</title>
  <style>
    /* All CSS inline for single-file deployment */
  </style>
</head>
<body>
  <!-- Full page content -->
  <a href="index.html">← Back to all styles</a>
</body>
</html>
```

OR with external CSS:
```html
<!-- style-01.html — with external CSS -->
<head>
  <link rel="stylesheet" href="css/style-01.css">
</head>
```

---

## RULE #9: IMAGE REFERENCES CHECKLIST

```html
<!-- HTML img tags — relative to HTML file -->
<img src="images/hero.jpg" alt="Hero image" loading="lazy">
<img src="images/team/john.jpg" alt="John" loading="lazy">

<!-- Background images in inline styles — relative to HTML file -->
<div style="background-image: url('images/bg.jpg')"></div>

<!-- Picture element with srcset — all relative -->
<picture>
  <source srcset="images/hero-mobile.webp" media="(max-width: 768px)" type="image/webp">
  <source srcset="images/hero-desktop.webp" type="image/webp">
  <img src="images/hero-desktop.jpg" alt="Hero" loading="lazy">
</picture>

<!-- SVG inline is always safe — no path issues -->
<svg viewBox="0 0 24 24">...</svg>
```

---

## RULE #10: WHAT ABOUT `<base href>`?

**DO NOT USE `<base href="">`** unless absolutely necessary. It changes how ALL relative URLs on the page are resolved and causes more problems than it solves:

```html
<!-- ❌ AVOID — changes all relative path resolution -->
<base href="https://alfred.godeliauskas.com/seed-to-cup-v2/">

<!-- This breaks anchor links, form actions, and JS path resolution -->
```

Instead, just use correct relative paths everywhere. It's simpler and more reliable.

---

## RULE #11: FTP DEPLOYMENT VERIFICATION

After uploading via FTP, verify:

1. **Open browser DevTools → Console** — check for 404 errors (broken paths)
2. **Open Network tab** — filter by "4xx" status codes
3. **Check every page** — not just index.html
4. **Test on mobile** — open the actual URL on your phone
5. **Check images** — are they all loading?
6. **Check fonts** — is the correct font rendering?
7. **Check navigation** — do all links work between pages?
8. **Check favicon** — is it showing in the browser tab?

### Common 404 patterns to look for:
```
❌ GET /styles.css 404          → Should be: css/styles.css
❌ GET /images/hero.jpg 404     → Should be: images/hero.jpg
❌ GET /about.html 404          → Should be: about.html (relative)
❌ GET /seed-to-cup-v2/seed-to-cup-v2/styles.css 404  → Double folder! Fix paths.
```

---

## QUICK REFERENCE — PATH TYPES

| Path Type | Example | When to Use |
|-----------|---------|-------------|
| **Relative** | `styles.css`, `images/logo.png` | ✅ ALWAYS for internal assets |
| **Parent-relative** | `../images/logo.png` | ✅ When referencing from subfolder (CSS → images) |
| **Root-relative** | `/styles.css` | ❌ NEVER for subfolder deployments |
| **Absolute** | `https://...` | ✅ ONLY for external resources (Google Fonts, CDN, og:image) |

---

## CRITICAL RULES SUMMARY

1. **ALL internal paths must be RELATIVE** — never start with `/`
2. **HTML files at same level** — simplest linking between pages
3. **CSS `url()` is relative to the CSS file** — use `../` to go up
4. **JS paths are relative to the HTML** — not the JS file
5. **og:image and canonical need FULL absolute URLs** — social crawlers need them
6. **Never use `<base href>`** — it causes more problems than it solves
7. **Inline CSS for single-file pages** — simplest deployment, zero path issues
8. **Test after FTP upload** — check DevTools Console for 404 errors
9. **Favicon uses relative path** — `images/favicon.ico` not `/favicon.ico`
10. **External resources (CDN, fonts) use full https:// URLs** — these are fine
