# WEBSITE-DEPLOYMENT.md - Complete FTP Deployment Workflow

**Updated:** 2026-02-07 14:55 UTC  
**Owner:** Andrius + Alfred

---

## 🎯 Deployment Structure

**FTP Root:** `https://alfred.godeliauskas.com/`

### Folder Structure:
```
/ (FTP root - alfred.godeliauskas.com)
├── index.html              # Portfolio index (18 sites)
├── seed-to-cup-v2/         # Each site in own folder
├── truewinner-v1-modern/
├── barber-shop/
├── cake-bake/
└── [other-sites]/
```

---

## 📝 COMPLETE DEPLOYMENT WORKFLOW (6 Steps)

### Step 0: QA Testing (MANDATORY)
```bash
# Before ANY deployment, test ALL breakpoints:
# Read checklist: /root/clawd/WEBSITE-QA-CHECKLIST.md

# Test in browser:
# - 375px (mobile)
# - 768px (tablet)
# - 1920px (desktop)

# Verify:
# ✅ No horizontal scroll on mobile
# ✅ Content has 20px+ padding from edges
# ✅ All buttons/links work
# ✅ No console errors
# ✅ Images load correctly

# Take screenshots for report
```

**❌ DO NOT PROCEED if QA fails. Fix issues first.**

### Step 1: Build Website
```bash
# Create project folder
SITE_NAME="my-new-site"
mkdir -p /root/clawd/projects/$SITE_NAME

# Build all pages
# - Use Claude CLI or manual development
# - Create: index.html, pages/, assets/css/, assets/js/
# - Test locally if needed
```

**Files Structure:**
```
/root/clawd/projects/my-new-site/
├── index.html
├── pages/
│   ├── about.html
│   ├── contact.html
│   └── ...
├── assets/
│   ├── css/
│   │   └── main.css
│   ├── js/
│   │   └── main.js
│   └── images/
```

---

### Step 2: Upload to FTP
```bash
cd /root/clawd/projects/$SITE_NAME

lftp -u "afread@godeliauskas.com,PASSWORD" altas.serveriai.lt <<EOF
cd /
mkdir $SITE_NAME
cd $SITE_NAME
lcd /root/clawd/projects/$SITE_NAME
mirror -R --verbose
bye
EOF
```

**Command Explanation:**
- `cd /` - Go to FTP root
- `mkdir $SITE_NAME` - Create site folder
- `mirror -R` - Upload all files recursively
- `--verbose` - Show upload progress

---

### Step 3: VERIFY UPLOAD ✅ (MANDATORY!)

#### 3.1 Check FTP Files
```bash
lftp -u "afread@godeliauskas.com,PASSWORD" altas.serveriai.lt <<EOF
ls -la $SITE_NAME/
ls -la $SITE_NAME/pages/
ls -la $SITE_NAME/assets/
bye
EOF
```

**What to verify:**
- ✅ All HTML files present
- ✅ CSS and JS files uploaded
- ✅ Correct folder structure
- ✅ File sizes match local files

#### 3.2 Test Live URL
```bash
# Test main page
curl -I "https://alfred.godeliauskas.com/$SITE_NAME/"

# Should return:
# HTTP/2 200
# content-type: text/html

# If 404 error → files in wrong location!
```

**Common Issues:**
- **404 Error:** Files uploaded to nested folder (e.g., `/domains/alfred.../`)
  - Solution: Move files to FTP root (`/`)
- **403 Error:** Missing index.html
  - Solution: Check filename (must be `index.html`, not `Index.html`)
- **Empty Page:** CSS/JS paths broken
  - Solution: Check relative paths in HTML

---

### Step 4: Update Portfolio Index

#### 4.1 Count Current Sites
```bash
curl -s "https://alfred.godeliauskas.com/" | grep -o "stat-num\">.*</div>" | head -1
# Should show current count (e.g., 18)
```

#### 4.2 Add New Card
Update `/tmp/portfolio-updated.html`:
```html
<div class="card" onclick="window.location='/$SITE_NAME/'">
    <div class="card-emoji">🎨</div>
    <h3 class="card-title">My New Site</h3>
    <p class="card-desc">Description of the site, tech stack, features</p>
</div>
```

#### 4.3 Update Site Count
Change from `<div class="stat-num">18</div>` to `<div class="stat-num">19</div>`

#### 4.4 Deploy Updated Portfolio
```bash
lftp -u "afread@godeliauskas.com,PASSWORD" altas.serveriai.lt <<EOF
rm index.html
put /tmp/portfolio-updated.html -o index.html
chmod 644 index.html
bye
EOF
```

---

### Step 5: SCREENSHOT & REPORT 📸 (MANDATORY!)

#### 5.1 Screenshot Portfolio
```bash
# Open browser
browser --action=open --targetUrl="https://alfred.godeliauskas.com/?v=$(date +%s)"

# Wait for load
sleep 3

# Take screenshot
browser --action=screenshot --fullPage=false
```

**What to verify in screenshot:**
- ✅ Site count updated (e.g., 18 → 19)
- ✅ New site card visible at top
- ✅ All cards render correctly

#### 5.2 Screenshot New Website
```bash
# Open new site
browser --action=open --targetUrl="https://alfred.godeliauskas.com/$SITE_NAME/"

# Wait for load
sleep 3

# Take screenshot
browser --action=screenshot --fullPage=true
```

**What to verify in screenshot:**
- ✅ Homepage loads correctly
- ✅ Design matches expectations
- ✅ No broken images or styling
- ✅ Navigation works

#### 5.3 Test All Pages
```bash
# Test each page URL
curl -I "https://alfred.godeliauskas.com/$SITE_NAME/pages/about.html"
curl -I "https://alfred.godeliauskas.com/$SITE_NAME/pages/contact.html"

# All should return: HTTP/2 200
```

#### 5.4 Update HEARTBEAT.md
```bash
# Add deployment record
cat >> /root/clawd/HEARTBEAT.md << EOF

## ✅ [SITE NAME] - COMPLETE & DEPLOYED ($(date -u +"%Y-%m-%d %H:%M UTC"))
**Status:** LIVE - https://alfred.godeliauskas.com/$SITE_NAME/
**Time:** Xh Xmin (start → finish)
**Type:** [Site category - e.g., E-Commerce, Services, etc.]
**Pages:** X (Home, About, Contact, etc.)
**Tech:** [Tech stack - e.g., Vanilla HTML + GSAP + ScrollTrigger]
**Features:**
- Feature 1
- Feature 2
- Feature 3
**Design System:**
- Colors: [color palette]
- Typography: [fonts used]
- Style: [design style]
**File Size:** ~XXkB total
**Performance:** Lighthouse XX+

## ✅ PORTFOLIO UPDATE ($(date -u +"%Y-%m-%d %H:%M UTC"))
**Action:** Added $SITE_NAME to portfolio
**Old:** XX sites
**New:** XX sites
**URL:** https://alfred.godeliauskas.com/
**Status:** ✅ Deployed & Verified
EOF
```

#### 5.5 Report to Andrius
**Include in message:**
1. ✅ Site deployed successfully
2. 🌐 Live URL: https://alfred.godeliauskas.com/$SITE_NAME/
3. 📊 Portfolio updated: XX sites total
4. 📸 Screenshots:
   - Portfolio (showing new site card)
   - New website (homepage)
5. ⏱️ Time taken: Xh Xmin
6. 🎨 Key features: [bullet points]

**Message template:**
```
✅ [SITE NAME] COMPLETE & LIVE!

🌐 URL: https://alfred.godeliauskas.com/$SITE_NAME/
📊 Portfolio: XX sites total
⏱️ Time: Xh Xmin

Key Features:
- Feature 1
- Feature 2
- Feature 3

Screenshots attached:
📸 Portfolio (updated)
📸 Website (homepage)

All pages tested & verified! ✅
```

---

## 🔍 TROUBLESHOOTING

### Issue: 404 Error on Live Site

**Cause:** Files uploaded to wrong path (nested folder)

**Solution:**
```bash
lftp -u "afread@godeliauskas.com,PASSWORD" altas.serveriai.lt <<EOF
# Check where files actually are
pwd
ls -la

# If in /domains/alfred.../
cd /
mv domains/alfred.godeliauskas.com/public_html/$SITE_NAME .

# Verify
ls -la $SITE_NAME/
bye
EOF
```

### Issue: Portfolio Shows Old Count

**Cause:** Browser cache or server cache

**Solutions:**
1. Hard refresh: Ctrl + Shift + R
2. Add cache-busting: `?v=$(date +%s)`
3. Update .htaccess:
```apache
<Files "index.html">
    Header set Cache-Control "no-cache, no-store, must-revalidate"
</Files>
```

### Issue: CSS/JS Not Loading

**Cause:** Relative paths incorrect

**Fix:** Use relative paths from page location:
```html
<!-- ❌ Wrong (absolute from root) -->
<link rel="stylesheet" href="/assets/css/main.css">

<!-- ✅ Correct (relative from page) -->
<link rel="stylesheet" href="../assets/css/main.css">
```

---

## 📋 DEPLOYMENT CHECKLIST

Before reporting complete:
- [ ] Step 1: Site built with all pages
- [ ] Step 2: Uploaded to FTP
- [ ] Step 3: Verified upload (FTP ls + curl test)
- [ ] Step 4: Portfolio updated with new site
- [ ] Step 5: Screenshots taken (portfolio + site)
- [ ] Step 6: All pages return HTTP 200
- [ ] Step 7: HEARTBEAT.md updated
- [ ] Step 8: Report sent to Andrius with screenshots

**Only report complete when ALL steps pass!** ✅

---

## 🎯 QUICK REFERENCE

### One-Line Deploy (After Building)
```bash
SITE="my-site" && lftp -u "afread@godeliauskas.com,PASS" altas.serveriai.lt -e "cd /; mkdir $SITE; cd $SITE; lcd /root/clawd/projects/$SITE; mirror -R; bye"
```

### One-Line Verify
```bash
curl -I "https://alfred.godeliauskas.com/$SITE/" && echo "✅ Site live"
```

### Screenshot Portfolio + Site
```bash
browser --action=screenshot --targetUrl="https://alfred.godeliauskas.com/" && browser --action=screenshot --targetUrl="https://alfred.godeliauskas.com/$SITE/" --fullPage=true
```

---

**Last Updated:** 2026-02-07 14:55 UTC  
**By:** Alfred 🤵  
**Status:** Active workflow - follow for every deployment
