# Claude Skills & Agents - Website Development

Professional agents and skills for premium website development workflow.

**Repository maintained by:** Andrius Godeliauskas  
**Last Updated:** 2026-02-07

---

## 📁 Repository Structure

```
claude-skills-agents/
├── agents/              # AI agents for website development
├── skills/              # Reusable skills (tools & integrations)
├── scripts/             # Automation scripts
├── docs/                # Workflow documentation
└── README.md
```

---

## 🤖 Agents

### Website Development Workflow (5-Phase Process)

1. **website-analysis-agent.md** - Pre-development validation
   - Image requirements analysis
   - Menu structure planning
   - Requirements validation
   - Design trends research

2. **website-design-agent.md** - Design system creation
   - 3 premium design variants
   - Awwwards-level aesthetics
   - 2026 design trends
   - Complete component specs

3. **website-programming-agent.md** - Code implementation
   - WordPress-ready structure
   - Clean, secure, optimized code
   - Multi-language support
   - Performance optimization

4. **website-code-review-agent.md** - Quality assurance
   - Code quality review
   - Security audit
   - Performance analysis
   - Bug detection

5. **website-qa-agent.md** - End-to-end testing
   - Manual QA checklist
   - Cross-browser testing
   - Deployment verification
   - Portfolio update checks

### Additional Agents

- **ui-qa-agent.md** - Automated UI testing
  - Responsive breakpoint testing (375px, 768px, 1920px)
  - Horizontal scroll detection
  - Console error checking
  - Interactive element validation

---

## 📚 Documentation

- **AGENT-WORKFLOW.md** - Master coordination workflow (5-phase process)
- **PREMIUM-WORKFLOW.md** - Manual workflow (9-phase, detailed)
- **WEBSITE-DEPLOYMENT.md** - FTP deployment guide
- **WEBSITE-QA-CHECKLIST.md** - Manual QA checklist (all breakpoints)

---

## 🚀 Scripts

- **deploy-website.sh** - Automated FTP deployment
- **ui-qa-seed-to-cup.sh** - Example UI QA automation script

---

## ⚠️ MANDATORY: Check for Updates Before Starting

**Before starting any website project, ALWAYS check for updates:**

```bash
cd /root/claude-skills-agents
git pull origin main
```

**Why?**
- Andrius continuously improves agents and workflows
- New design trends and best practices are added regularly
- Bug fixes and performance improvements
- Updated quality gates and checkpoints

**When to check:**
1. ✅ Before Phase 1 (Analysis)
2. ✅ After client feedback (before next phase)
3. ✅ Weekly (proactive sync)

**If updates found:**
- Read CHANGELOG.md for breaking changes
- Update your local agents/workflows
- Test new features before production use

---

## 🔄 Workflow Integration

### For Clawdbot / Claude CLI:

Add to your workspace's daily heartbeat or project init:

```bash
# Sync latest agents & skills
cd /root/claude-skills-agents && git pull --quiet
```

### For Manual Workflow:

Before starting Phase 1, run:

```bash
./scripts/sync-agents.sh
```

---

## 📝 Usage

### 1. Analysis Phase

```bash
# Read agent instructions
cat agents/website-analysis-agent.md

# Use analysis agent to validate project requirements
# Output: /root/clawd/reports/analysis-PROJECTNAME-DATE.md
```

### 2. Design Phase

```bash
# Read design agent instructions
cat agents/website-design-agent.md

# Generate 3 design variants
# Output: /root/clawd/reports/design-PROJECTNAME-DATE.md
```

### 3. Programming Phase

```bash
# Read programming agent instructions
cat agents/website-programming-agent.md

# Build website following design specs
# Output: /root/clawd/projects/PROJECTNAME/
```

### 4. Code Review Phase

```bash
# Read code review agent instructions
cat agents/website-code-review-agent.md

# Review code quality & security
# Output: /root/clawd/reports/review-PROJECTNAME-DATE.md
```

### 5. QA Phase

```bash
# Manual QA checklist
cat docs/WEBSITE-QA-CHECKLIST.md

# Automated UI testing
./scripts/ui-qa-PROJECTNAME.sh
```

### 6. Deployment

```bash
# Deploy to FTP
./scripts/deploy-website.sh "site-name" "/path/to/site" "Title" "Description" "Emoji"
```

---

## 🎯 Quality Gates

Projects **CANNOT** proceed to next phase until:

1. **Analysis Score:** ≥80/100
2. **Design Approval:** Client selects 1 variant
3. **Code Review Score:** ≥80/100, no P0 bugs
4. **QA Pass Rate:** ≥80%, no P0 bugs
5. **Deployment:** All verification steps complete

---

## 🔗 Related Resources

- **Main Workspace:** `/root/clawd/`
- **Project Templates:** `/root/clawd/prompts/`
- **Reports Archive:** `/root/clawd/reports/`
- **Live Sites Portfolio:** https://alfred.godeliauskas.com/

---

## 📊 Version History

- **v1.0** (2026-02-07) - Initial repository setup
  - 6 agents (analysis, design, programming, review, QA, UI-QA)
  - 4 workflow documents
  - 2 automation scripts
  - GitHub sync integration

---

## 🤝 Contributing

This repository is maintained by Andrius Godeliauskas.

**For team members using these agents:**
- Pull latest version before each project
- Report bugs/improvements via issues
- Suggest new agents/skills for common workflows

**DO NOT:**
- Modify agents without testing
- Skip quality gates
- Deploy without QA approval
- Fork without sync strategy

---

## 📞 Support

**Issues:** Create GitHub issue with `[AGENT]` or `[WORKFLOW]` prefix  
**Urgent:** Contact Andrius directly  
**Documentation:** See `/docs/` folder

---

**Last Sync:** Check `git log -1` for latest commit
**Next Update:** Continuous (pull before each project)
