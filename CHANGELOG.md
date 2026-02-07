# Changelog

All notable changes to agents and workflows will be documented here.

## [1.0.0] - 2026-02-07

### Added
- Initial repository setup
- 6 AI agents for website development workflow:
  - website-analysis-agent.md
  - website-design-agent.md
  - website-programming-agent.md
  - website-code-review-agent.md
  - website-qa-agent.md
  - ui-qa-agent.md
- 7 Clawdbot built-in skills (website development):
  - coding-agent (Claude Code, Codex integration)
  - github (GitHub CLI `gh` integration)
  - gemini (Gemini CLI for analysis)
  - notion (Notion API)
  - tmux (remote tmux control)
  - skill-creator (create new skills)
  - weather (weather data)
- 15 custom skills:
  - **Workflow automation (4):** autonomous-mode, browser-restart, deploy-portfolio, last30days
  - **Design styles (11):**
    - 00-design-master (style router & selection logic)
    - 01-liquid-glass (Glassmorphism)
    - 02-neobrutalist (Neo-Brutalist)
    - 03-editorial-luxury (Editorial/Luxury Magazine)
    - 04-bento-dashboard (Bento Grid Dashboard)
    - 05-cyberpunk-neon (Cyberpunk/Neon Dark)
    - 06-organic-nature (Organic/Nature)
    - 07-retro-futurism-y2k (Retro-Futurism/Y2K Revival)
    - 08-minimal-swiss (Minimal Swiss/Scandinavian)
    - 09-3d-immersive (3D Immersive/Spatial)
    - 10-neumorphic-soft (Neumorphic/Soft UI)
- 4 workflow documentation files:
  - AGENT-WORKFLOW.md (5-phase master process)
  - PREMIUM-WORKFLOW.md (9-phase detailed manual)
  - WEBSITE-DEPLOYMENT.md (FTP deployment guide)
  - WEBSITE-QA-CHECKLIST.md (manual testing checklist)
- 2 automation scripts:
  - deploy-website.sh (FTP deployment)
  - ui-qa-seed-to-cup.sh (automated UI testing example)
- README.md with usage instructions and skills documentation
- GitHub sync integration documentation

### Design Trends (2026)
All 11 design styles incorporate latest trends:
- Bento grid layouts
- Glassmorphism / Liquid Glass (Apple-inspired)
- AI-adaptive interfaces
- Scroll-driven animations (GSAP + ScrollTrigger)
- Dark mode as default
- Variable fonts & fluid typography
- 3D and spatial elements
- Neo-brutalism and anti-design
- Organic nature-inspired aesthetics

### Changed
- N/A (initial release)

### Fixed
- N/A (initial release)

### Security
- N/A (initial release)

---

## How to Use This Changelog

- **Added** for new features/agents
- **Changed** for changes in existing functionality
- **Deprecated** for soon-to-be removed features
- **Removed** for now removed features
- **Fixed** for any bug fixes
- **Security** in case of vulnerabilities

---

## Version Format

We use [Semantic Versioning](https://semver.org/):
- MAJOR version: Incompatible API/workflow changes
- MINOR version: New functionality (backward-compatible)
- PATCH version: Bug fixes (backward-compatible)

---

**Always check this file after `git pull` to see what changed!**
