# PREMIUM WEBSITE WORKFLOW

## ⚠️ MANDATORY FIRST STEP: SYNC LATEST AGENTS & WORKFLOWS

**Before starting ANY website project:**

```bash
cd /root/claude-skills-agents
git pull origin main
cat CHANGELOG.md  # Check what changed
```

**Critical Updates to Watch:**
- New design trends (Awwwards winners, 2026 patterns)
- Agent improvements (better analysis, faster builds)
- Quality gate changes (new checkpoints)
- Automation scripts (deployment, testing)

**Andrius continuously updates this repo!** Skipping sync = outdated methods = lower quality.

**When to sync:**
1. ✅ Before Phase 1 (every new project)
2. ✅ Weekly (proactive learning)
3. ✅ After Andrius announces updates

---

## 🆕 MANDATORY: QA Agent Testing (Phase 7)
**ALWAYS run automated QA testing after build completion!**

After every website build, spawn the QA Agent to test:
- All planned features working
- Responsive design (4 breakpoints)
- Mobile menu, forms, galleries
- Console errors, performance
- Cross-browser compatibility

Agent generates detailed report with PASS/FAIL scores.
**Do NOT deploy if score <80% or critical bugs exist.**

---

## PHASE 1: PREPARATION (5-10 min)
1. **Receive Design Brief**
   - Business type & target audience
   - Brand colors & typography preferences
   - Design inspiration images/links
   - Content requirements (pages, sections)

2. **Research Phase**
   - Check Awwwards SOTD (last 30 days)
   - Review current design trends
   - Find reference sites in same industry
   - Curate image collections (Unsplash/Pexels)

3. **Build Prompt**
   - Use PREMIUM-TEMPLATE.md as base
   - Fill in specific business details
   - Add design direction from references
   - List all required sections
   - Specify image needs

## PHASE 2: GENERATION (5-10 min per page)
1. **Setup Build Environment**
   ```bash
   mkdir -p /root/clawd/projects/[project-name]/{html,css,js,assets/{images,fonts,icons}}
   cd /root/clawd/projects/[project-name]
   ```

2. **Run Claude CLI**
   ```bash
   # With wildcards settings (no --dangerously-skip-permissions!)
   tmux new -s build-[project] "cat prompt.txt | claude --model opus"
   
   # Monitor progress
   tmux attach -t build-[project]
   ```

3. **Approve & Extract**
   - Approve file creation (Enter key)
   - Wait for completion
   - Extract CSS to separate file
   - Extract JS to separate file
   - Organize images

## PHASE 3: IMAGE INTEGRATION (10-15 min)
1. **Download High-Quality Images**
   ```bash
   # Unsplash API example
   curl "https://api.unsplash.com/photos/random?query=[keyword]&count=10" \
     -H "Authorization: Client-ID YOUR_ACCESS_KEY" > images.json
   
   # Download each image
   # Or use Pexels API
   ```

2. **Process Images**
   ```bash
   # Convert to WebP
   for img in assets/images/*.jpg; do
     cwebp -q 85 "$img" -o "${img%.jpg}.webp"
   done
   
   # Generate responsive sizes
   # 1920w, 1280w, 768w, 480w
   ```

3. **Update HTML**
   - Replace placeholder images
   - Add srcset for responsive images
   - Implement lazy loading
   - Add alt text (descriptive + SEO)

## PHASE 4: MULTI-LANGUAGE (15-20 min)
1. **Extract All Text Content**
   ```bash
   # Create translation JSON
   cat > translations.json << 'EOF'
   {
     "en": {
       "nav": {...},
       "hero": {...},
       "sections": {...}
     },
     "lt": {
       "nav": {...},
       "hero": {...},
       "sections": {...}
     }
   }
   EOF
   ```

2. **Implement Language System**
   ```javascript
   // Add to script.js
   class i18n {
     constructor() {
       this.lang = localStorage.getItem('lang') || 'en';
       this.translations = {}; // Load from translations.json
     }
     
     t(key) {
       return this.translations[this.lang][key] || key;
     }
     
     setLang(lang) {
       this.lang = lang;
       localStorage.setItem('lang', lang);
       this.updateDOM();
     }
   }
   ```

3. **Add Language Switcher**
   ```html
   <div class="lang-switcher">
     <button data-lang="en" class="active">EN</button>
     <button data-lang="lt">LT</button>
   </div>
   ```

## PHASE 5: MOBILE OPTIMIZATION (10-15 min)
1. **Test Responsive Breakpoints**
   - Chrome DevTools responsive mode
   - Test all breakpoints (320, 768, 1024, 1920)
   - Fix layout issues

2. **Mobile-Specific Features**
   - Hamburger menu implementation
   - Touch gesture support
   - Simplified animations (reduce motion)
   - Optimize font sizes (clamp)

3. **Performance Check**
   ```bash
   # Lighthouse audit
   lighthouse https://preview-url --view
   
   # Target: 95+ on all metrics
   ```

## PHASE 6: WORDPRESS PREPARATION (20-30 min)
1. **Separate Assets**
   ```bash
   # Extract inline CSS to style.css
   # Extract inline JS to script.js
   # Move all images to assets/images/
   ```

2. **Add WP Markers**
   ```html
   <!-- In HTML, add PHP comments -->
   <?php /* Header Section */ ?>
   <header>...</header>
   
   <?php /* Loop starts here */ ?>
   <?php /* Loop ends here */ ?>
   ```

3. **Create WP Conversion Guide**
   ```markdown
   # WordPress Conversion Guide
   
   ## Files Structure
   - index.html → page-template.php
   - style.css → style.css (with WP headers)
   - script.js → assets/js/main.js
   
   ## Steps:
   1. Create theme folder: wp-content/themes/[theme-name]/
   2. Add style.css with WP headers
   3. Convert HTML to PHP templates
   4. Enqueue scripts/styles in functions.php
   5. Register menus + widgets
   6. Add ACF fields for content
   ```

4. **Create functions.php Template**
   ```php
   <?php
   // Enqueue scripts
   function theme_enqueue_scripts() {
     wp_enqueue_style('main', get_stylesheet_uri());
     wp_enqueue_script('gsap', 'https://cdn.jsdelivr.net/npm/gsap@3.12/dist/gsap.min.js', [], null, true);
     wp_enqueue_script('main', get_template_directory_uri() . '/assets/js/main.js', ['gsap'], null, true);
   }
   add_action('wp_enqueue_scripts', 'theme_enqueue_scripts');
   ```

## PHASE 7: AUTOMATED QA TESTING (5-10 min) 🆕 MANDATORY

**ALWAYS run QA Agent after build completion!**

1. **Spawn QA Agent**
   ```bash
   # Automated testing via sub-agent
   sessions_spawn with task:
   "Perform comprehensive QA testing on [PROJECT NAME] website.
   
   Website URL: https://alfred.godeliauskas.com/[project-name]/
   
   Project Requirements:
   - [List all planned features]
   - [List all pages]
   - [Special functionality]
   
   Follow QA checklist in /root/clawd/agents/website-qa-agent.md
   
   Generate detailed report: /root/clawd/reports/qa-[project]-[date].md"
   ```

2. **Agent Tests (Automated)**
   - Homepage completeness (all sections present)
   - Internal pages (all exist, all links work)
   - Responsive design (320px, 768px, 1024px, 1920px)
   - Mobile menu functionality
   - Galleries & lightboxes
   - Multi-language switcher
   - Search, cart, checkout (if applicable)
   - Contact forms (validation, submission)
   - GSAP/animations working
   - Console errors
   - Performance (load time)
   - Cross-browser compatibility

3. **Review QA Report**
   - Read generated report
   - Check PASS/FAIL/WARNING items
   - Prioritize critical bugs (P0)
   - Plan fixes for high-priority issues (P1)

4. **Fix Critical Bugs**
   - Address all P0 issues immediately
   - Re-test after fixes
   - Re-deploy if needed

5. **Document Results**
   - Add QA score to HEARTBEAT.md
   - Note any outstanding issues
   - Archive report

**Example QA Agent Call:**
```javascript
sessions_spawn({
  task: "QA test TrueWinner Wine Shop...",
  label: "TrueWinner QA Test",
  cleanup: "keep",
  runTimeoutSeconds: 600
});
```

**QA Pass Criteria:**
- Score: >80% (ideally >90%)
- No P0 (critical) bugs
- All planned features working
- Mobile responsive
- No console errors

**If QA Fails (<80%):**
- Fix critical bugs first
- Re-run QA agent
- Do NOT deploy until passing

---

## PHASE 8: MANUAL QUALITY ASSURANCE (10-15 min)
1. **Functionality Tests**
   - [ ] All links work
   - [ ] Forms submit correctly
   - [ ] Animations play smoothly
   - [ ] Images load (no 404s)
   - [ ] Language switcher works
   - [ ] Mobile menu works

2. **Cross-Browser Test**
   - [ ] Chrome (latest)
   - [ ] Safari (macOS + iOS)
   - [ ] Firefox (latest)
   - [ ] Edge (Chromium)

3. **Performance Audit**
   ```bash
   # Run Lighthouse
   lighthouse URL --preset=desktop
   lighthouse URL --preset=mobile
   
   # Check bundle sizes
   du -sh assets/*
   ```

4. **Accessibility Check**
   - [ ] Keyboard navigation works
   - [ ] Screen reader compatible
   - [ ] Color contrast: AA minimum
   - [ ] Focus indicators visible
   - [ ] Alt text on all images

5. **SEO Basics**
   - [ ] Meta title + description
   - [ ] Open Graph tags
   - [ ] Structured data (JSON-LD)
   - [ ] Semantic HTML
   - [ ] Clean URLs

## PHASE 9: DEPLOYMENT (5-10 min)
1. **Deploy to Staging**
   ```bash
   # FTP upload
   cd /root/clawd/projects/[project-name]
   ./deploy-staging.sh
   ```

2. **Client Review**
   - Share staging URL
   - Gather feedback
   - Iterate if needed

3. **Production Deployment**
   ```bash
   # After approval
   ./deploy-production.sh
   
   # Update portfolio
   ./scripts/deploy-website.sh "project-name" "path" "Title" "Description" "Emoji"
   ```

## TIME ESTIMATES (Updated with QA Phase)
- **Simple Landing Page:** 1.5-2.5 hours total
  - Build: 1-2 hours
  - QA Testing: 5-10 min ✅
  - Bug fixes: 15-30 min
- **Multi-Page Site:** 3.5-5.5 hours total
  - Build: 3-5 hours
  - QA Testing: 5-10 min ✅
  - Bug fixes: 30-60 min
- **Complex E-commerce:** 6.5-11 hours total
  - Build: 6-10 hours
  - QA Testing: 5-10 min ✅
  - Bug fixes: 30-90 min

## WORKFLOW TIPS
1. **Use tmux** - Prevents Claude CLI crashes
2. **No --dangerously-skip-permissions** - Crashes with root!
3. **Wildcards in settings.local.json** - Auto-approve tools
4. **Generate in parts** - If >2000 lines, split into pages
5. **Images last** - Get structure first, then images
6. **Test early** - Mobile/desktop testing throughout
7. **Commit often** - Git commit after each phase
8. **ALWAYS run QA Agent** - Mandatory after every build! ✅
9. **Fix P0 bugs immediately** - Do NOT deploy with critical issues
10. **Keep QA reports** - Archive all reports in `/root/clawd/reports/`

## CURRENT SETUP STATUS
✅ SWAP: 2GB active
✅ Alacritty terminal installed
✅ tmux: Session management ready
✅ Claude CLI: Wildcards configured
✅ FTP: Deployment script ready
✅ Portfolio: Auto-update system

## NEXT PROJECT READY!
Waiting for:
- Business type
- Design inspiration images
- Content requirements
- Brand guidelines (colors, fonts, logo)
