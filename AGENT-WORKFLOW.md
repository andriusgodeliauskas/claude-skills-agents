# MULTI-AGENT WEBSITE DEVELOPMENT WORKFLOW

## ⚠️ MANDATORY FIRST STEP: CHECK FOR UPDATES

**Before starting ANY website project, sync latest agents and workflows:**

```bash
cd /root/claude-skills-agents
git pull origin main
```

**Why this matters:**
- Andrius continuously improves agents with new trends (Awwwards SOTD analysis, 2026 design patterns)
- Workflow optimizations (faster build times, better quality gates)
- Bug fixes and security improvements
- New automation scripts

**What to check after sync:**
1. Read `CHANGELOG.md` for breaking changes
2. Review updated agent instructions if any
3. Test new features on small project first

**Skip this = outdated workflows = lower quality results!**

---

## OVERVIEW

Premium website development using 5 specialized AI agents working in sequence through Claude CLI terminal.

## 🚨 DEPLOYMENT PRINCIPLE (CRITICAL)

**ALWAYS create a NEW folder in FTP for each project:**
- ✅ Each website = separate folder
- ✅ Folder naming: `project-name` (lowercase, hyphens)
- ✅ Use `./scripts/deploy-website.sh` for automatic deployment
- ✅ Portfolio updates automatically after deployment

**Example:**
```bash
./scripts/deploy-website.sh "coffee-shop-v2" "/root/clawd/projects/coffee-shop-v2"
# → Creates /coffee-shop-v2/ folder in FTP
# → Uploads all files
# → Portfolio auto-updates with new project ✅
```

**Why separate folders:**
- Clean URLs (alfred.godeliauskas.com/project-name/)
- Easy updates (replace entire folder)
- No conflicts between projects
- Automatic portfolio detection

## AGENT TEAM

| Agent | Experience | Purpose | Phase |
|-------|-----------|---------|-------|
| **Analysis Agent** | 20 years | Pre-development validation | 1 |
| **Design Agent** | 20 years | Premium UX/UI design (3 variants) | 2 |
| **Programming Agent** | 20 years | WordPress-ready coding | 3 |
| **Code Review Agent** | 20 years | Quality & security review | 4 |
| **QA Agent** | 20 years | End-to-end testing | 5 |

## WORKFLOW PHASES

### PHASE 1: PROJECT ANALYSIS (5-10 min) 🔍

**Agent:** `/root/clawd/agents/website-analysis-agent.md`

**Input:**
- Project brief
- Design inspiration
- Assets (images, logos)
- Requirements document

**Tasks:**
- ✅ Verify all images uploaded
- ✅ Check menu structure documented
- ✅ Confirm functionalities listed
- ✅ Validate prompt completeness
- ✅ Check latest trends included (Bento grids, GSAP, etc.)
- ✅ Ensure 2026 design standards

**Output:**
- Analysis report: `/root/clawd/reports/analysis-[project]-[date].md`
- Score: 0-100
- GO/NO-GO decision

**Run Command:**
```bash
cd /root/clawd
tmux new -s analysis "cat /root/clawd/prompts/analysis-task.txt | claude --model opus"
```

**Pass Criteria:** Score >80

---

### PHASE 2: UX/UI DESIGN (30-45 min) 🎨

**Agent:** `/root/clawd/agents/website-design-agent.md`

**Input:**
- Analysis report (approved)
- Brand guidelines
- Design inspiration

**Design Style Selection (NEW):**
```bash
# 1. Review style router
cat /root/clawd/skills/00-design-master/SKILL.md

# 2. Select appropriate style based on industry/audience
# Example styles available:
# - 01-liquid-glass (SaaS, fintech, dashboards)
# - 02-neobrutalist (creative agencies, portfolios)
# - 03-editorial-luxury (fashion, luxury goods)
# - 04-bento-dashboard (analytics, admin panels)
# - 05-cyberpunk-neon (gaming, crypto, music)
# - 06-organic-nature (wellness, eco brands)
# - 07-retro-futurism-y2k (fashion, youth brands)
# - 08-minimal-swiss (dev tools, professional)
# - 09-3d-immersive (product showcases, automotive)
# - 10-neumorphic-soft (wellness apps, smart home)

# 3. Read chosen style guide
cat /root/clawd/skills/[CHOSEN-STYLE]/SKILL.md

# Quick reference:
cat /root/clawd/skills/DESIGN-STYLES-INDEX.md
```

**Tasks:**
- ✅ Select 1-2 design styles from 10 premium systems
- ✅ Create 3 design variants based on chosen style(s)
- ✅ Design every element in detail:
  - Buttons (primary, secondary, text links)
  - Form fields (inputs, dropdowns, validation states)
  - Galleries (3 variants: Bento, Masonry, Carousel)
  - Navigation (desktop menu, mobile hamburger, dropdowns)
  - Cards & containers
  - Micro-interactions
- ✅ Specify all hover states, animations
- ✅ Define color palette, typography, spacing
- ✅ Ensure premium quality (Awwwards SOTD level)
- ✅ Follow 2026 trends

**Output:**
- Design specs: `/root/clawd/designs/[project]-variant-[1-3].md`
- Style guide for each variant
- Component library
- Animation specifications

**Run Command:**
```bash
tmux new -s design "cat /root/clawd/prompts/design-task.txt | claude --model opus"
```

**Client chooses variant:** User selects preferred design direction

---

### PHASE 3: PROGRAMMING (60-120 min) 💻

**Agent:** `/root/clawd/agents/website-programming-agent.md`

**Input:**
- Chosen design variant
- Project requirements
- Assets

**Tasks:**
- ✅ Build WordPress template-ready code
- ✅ Write clean, commented, understandable code
- ✅ Follow security standards (sanitize input, escape output)
- ✅ Implement all pages:
  - Home page
  - Internal pages
  - Product pages (if e-commerce)
  - Checkout page (if e-commerce)
- ✅ WordPress editor integration ready
- ✅ WooCommerce integration (if products)
- ✅ Multi-language system (string keys for translation)
- ✅ Gallery variants implemented
- ✅ Responsive design (320px, 768px, 1024px, 1920px)
- ✅ HTML5 semantic markup
- ✅ Performance optimized (lazy loading, WebP, critical CSS)
- ✅ SEO ready (meta tags, structured data, Google indexing)
- ✅ AI indexing optimized

**Output:**
- WordPress theme: `/root/clawd/projects/[project]-wp-theme/`
- All template files (header.php, footer.php, page templates)
- Functions.php with proper enqueuing
- Assets organized (CSS, JS, images)
- README.md with WordPress setup instructions

**Run Command:**
```bash
tmux new -s programming "cat /root/clawd/prompts/programming-task.txt | claude --model opus"
```

**Coding Standards:**
- Clean code (DRY, Single Responsibility)
- Security-first (OWASP Top 10)
- Performance optimized (Lighthouse 95+)
- WordPress Coding Standards compliant

---

### PHASE 4: CODE REVIEW (15-30 min) 🔎

**Agent:** `/root/clawd/agents/website-code-review-agent.md`

**Input:**
- Generated code from Programming Agent

**Tasks:**
- ✅ Review code quality (clean, documented, maintainable)
- ✅ Check security (XSS, SQL injection, CSRF protection)
- ✅ Verify performance (optimized assets, lazy loading)
- ✅ Test accessibility (WCAG AA compliance)
- ✅ Validate responsive design
- ✅ Check WordPress standards
- ✅ Verify browser compatibility
- ✅ Test SEO optimization
- ✅ Assess maintainability

**Output:**
- Code review report: `/root/clawd/reports/code-review-[project]-[date].md`
- Issues list with severity (P0, P1, P2, P3)
- Fix recommendations
- Score: 0-100
- APPROVE / CONDITIONAL / REJECT decision

**Run Command:**
```bash
tmux new -s code-review "cat /root/clawd/prompts/code-review-task.txt | claude --model opus"
```

**Decision Tree:**
- **Score >80, No P0:** APPROVE → Proceed to QA
- **Score 60-79 or Minor P0:** CONDITIONAL → Fix issues then proceed
- **Score <60 or Critical P0:** REJECT → Send back to Programming Agent

**If REJECTED:** Programming Agent fixes issues, Code Review runs again

---

### PHASE 5: QA TESTING (10-15 min) 🧪

**Agent:** `/root/clawd/agents/website-qa-agent.md`

**Input:**
- Code-reviewed website (approved)
- Live URL

**Tasks:**
- ✅ Test homepage completeness
- ✅ Verify all internal pages work
- ✅ Test responsive design (4 breakpoints)
- ✅ Check mobile menu functionality
- ✅ Verify galleries & lightboxes
- ✅ Test multi-language switcher
- ✅ Check search functionality (if applicable)
- ✅ Test cart & checkout (if e-commerce)
- ✅ Validate contact forms
- ✅ Check animations & GSAP
- ✅ Test performance (no console errors)
- ✅ Cross-browser compatibility
- ✅ **Verify FTP upload** ✅
- ✅ **Check Alfred portfolio updated** ✅

**Output:**
- QA report: `/root/clawd/reports/qa-[project]-[date].md`
- Score: 0-100 (% of tests passed)
- Critical bugs list (P0)
- Recommendations

**Run Command:**
```bash
tmux new -s qa "cat /root/clawd/prompts/qa-task.txt | claude --model opus"
```

**Deployment Steps (MANDATORY):**
```bash
# 1. Create NEW folder in FTP (ALWAYS new folder per project)
# Format: project-name (lowercase, hyphens)

# 2. Upload all files to FTP
./scripts/deploy-website.sh "project-name" "/path/to/project"

# 3. Portfolio automatically updates! ✅
# (scan-and-deploy-portfolio.sh runs automatically)

# 4. Verify deployment
# - Check https://alfred.godeliauskas.com/project-name/
# - Check https://alfred.godeliauskas.com/ (portfolio should show new project)
```

**Pass Criteria:**
- Score >80%
- No P0 (critical) bugs
- All planned features working
- NEW FTP folder created ✅
- FTP upload successful
- Portfolio automatically updated ✅

**If FAILED (<80%):**
- Fix critical bugs
- Re-test
- Do NOT deploy until passing

---

## COMPLETE WORKFLOW EXECUTION

### Step-by-Step Process:

```bash
# 1. PROJECT ANALYSIS
cd /root/clawd
tmux new -s phase1-analysis
# Load analysis agent task → Approve → Review report
# Decision: GO (score >80) or NO-GO

# 2. UX/UI DESIGN (if approved)
tmux new -s phase2-design
# Load design agent task → Generate 3 variants → Client chooses

# 3. PROGRAMMING
tmux new -s phase3-programming
# Load programming task with chosen design → Build WordPress theme

# 4. CODE REVIEW
tmux new -s phase4-review
# Load code review task → Review generated code
# Decision: APPROVE / CONDITIONAL / REJECT
# If REJECT: Fix issues, re-review

# 5. QA TESTING (if code approved)
tmux new -s phase5-qa
# Deploy to FTP first
# Load QA task → Test live website
# Decision: PASS (>80%) or FAIL
# If FAIL: Fix bugs, re-test

# 6. FINAL DEPLOYMENT (if QA passed)
# Already on FTP from QA phase
# Update portfolio
# Announce to client
```

### Example Complete Run:

```bash
# PHASE 1: Analysis
sessions_spawn({
  agentId: "main",
  task: "Perform project analysis...",
  label: "Analysis - TrueWinner",
  cleanup: "keep"
});

# Wait for completion, review report

# PHASE 2: Design (3 variants)
sessions_spawn({
  agentId: "main", 
  task: "Create 3 premium design variants...",
  label: "Design - TrueWinner",
  cleanup: "keep"
});

# Client chooses variant #2

# PHASE 3: Programming
sessions_spawn({
  agentId: "main",
  task: "Build WordPress theme using Design Variant #2...",
  label: "Programming - TrueWinner",
  cleanup: "keep"
});

# PHASE 4: Code Review
sessions_spawn({
  agentId: "main",
  task: "Review generated code...",
  label: "Code Review - TrueWinner",
  cleanup: "keep"
});

# If issues found, fix and re-review

# PHASE 5: QA Testing
sessions_spawn({
  agentId: "main",
  task: "Perform QA testing on live site...",
  label: "QA Test - TrueWinner",
  cleanup: "keep"
});

# If passed, deployment complete!
```

## TIME ESTIMATES

| Phase | Time | Agent |
|-------|------|-------|
| Analysis | 5-10 min | Analysis Agent |
| Design | 30-45 min | Design Agent |
| Programming | 60-120 min | Programming Agent |
| Code Review | 15-30 min | Code Review Agent |
| Fixes (if needed) | 15-60 min | Programming Agent |
| QA Testing | 10-15 min | QA Agent |
| Bug Fixes (if needed) | 15-30 min | Programming Agent |
| **TOTAL** | **2.5-5 hours** | |

**Simple landing page:** 2.5-3 hours
**Multi-page site:** 3.5-4.5 hours
**Complex e-commerce:** 4.5-5 hours

## QUALITY GATES

Website can only proceed to next phase if:

1. ✅ **Analysis → Design:** Score >80
2. ✅ **Design → Programming:** Client approves variant
3. ✅ **Programming → Code Review:** Code complete
4. ✅ **Code Review → QA:** Score >80, no P0 issues
5. ✅ **QA → Deployment:** Score >80%, no P0 bugs, FTP uploaded, portfolio updated

## AGENT COORDINATION RULES

1. **Sequential Execution:** Agents run in order (1→2→3→4→5)
2. **No Skipping:** Cannot skip phases
3. **Quality Gates:** Must pass to proceed
4. **Feedback Loops:**
   - Code Review REJECT → Back to Programming
   - QA FAIL → Back to Programming (or Code Review if code issue)
5. **Documentation:** Every agent outputs report
6. **Traceability:** All reports archived in `/root/clawd/reports/`

## SUCCESS CRITERIA

**Project COMPLETE when:**
- ✅ All 5 phases passed
- ✅ QA score >80%
- ✅ No P0 bugs remaining
- ✅ Code score >80
- ✅ WordPress-ready
- ✅ FTP deployed
- ✅ Portfolio updated
- ✅ Client approval received

## DIRECTORY STRUCTURE

```
/root/clawd/
├── agents/
│   ├── website-analysis-agent.md ✅
│   ├── website-design-agent.md ✅
│   ├── website-programming-agent.md ✅
│   ├── website-code-review-agent.md ✅
│   └── website-qa-agent.md ✅
├── prompts/
│   ├── analysis-task.txt
│   ├── design-task.txt
│   ├── programming-task.txt
│   ├── code-review-task.txt
│   └── qa-task.txt
├── designs/
│   └── [project]-variant-[1-3].md
├── projects/
│   └── [project]-wp-theme/
└── reports/
    ├── analysis-[project]-[date].md
    ├── design-[project]-[date].md
    ├── code-review-[project]-[date].md
    └── qa-[project]-[date].md
```

## BENEFITS OF MULTI-AGENT APPROACH

1. **Specialization:** Each agent expert in their domain
2. **Quality Control:** Multiple checkpoints catch issues early
3. **Consistency:** Standardized process every project
4. **Traceability:** Complete audit trail
5. **Parallel Work:** Design while programming (once established)
6. **Continuous Improvement:** Agents learn from past projects

---

**This workflow ensures every website meets the highest standards of design, code quality, security, and performance.**
