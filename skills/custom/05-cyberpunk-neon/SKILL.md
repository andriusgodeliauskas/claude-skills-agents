---
name: frontend-cyberpunk-neon
description: Create electrifying Cyberpunk and Neon-dark interfaces with glowing elements, scanline effects, and high-tech dystopian aesthetics. Use when user asks for cyberpunk, neon, sci-fi, gaming, futuristic dark, hacker, terminal, electric, or synthwave UI. Ideal for gaming platforms, crypto/Web3, creative tech, music production, entertainment, and immersive experiences.
---

# Cyberpunk / Neon Dark Design System

Create interfaces that pulse with electric energy — dark backgrounds illuminated by neon light, digital rain, and the glow of a thousand screens. This is the future as imagined in Blade Runner, Akira, and Cyberpunk 2077.

## Core Aesthetic Philosophy

**The Feel**: A rain-soaked neon city at 2AM. Holographic HUDs flickering over dark chrome. The screen IS the light source. Every glow has purpose, every shadow hides depth.

**Mood Keywords**: Electric, immersive, dystopian-cool, high-tech, pulsing, dark, vivid, intense

## Typography

- **Display**: `'Orbitron', 'Audiowide', 'Rajdhani'` — angular, tech, futuristic
- **UI/Body**: `'Rajdhani', 'Exo 2', 'Chakra Petch'` — readable but techy
- **Terminal/Data**: `'Share Tech Mono', 'Fira Code', 'Source Code Pro'` — monospace for the hacker feel
- **Treatment**: Uppercase for headings, glowing text-shadow for emphasis
- **Sizes**: Hero at `clamp(3rem, 8vw, 7rem)`, body at 15-16px
- Import: `Orbitron`, `Rajdhani`, `Share Tech Mono`, `Exo 2`

## Color System

Neon on pitch black:

```css
:root {
  /* Backgrounds — deep dark */
  --bg-void: #030308;
  --bg-surface: #0a0a14;
  --bg-panel: #0f0f1a;
  --bg-elevated: #161625;

  /* Neon spectrum */
  --neon-cyan: #00f0ff;
  --neon-magenta: #ff00aa;
  --neon-purple: #bf00ff;
  --neon-green: #00ff88;
  --neon-yellow: #ffe600;
  --neon-red: #ff2244;
  --neon-blue: #4466ff;

  /* Glow versions (for box-shadow / text-shadow) */
  --glow-cyan: 0 0 20px rgba(0, 240, 255, 0.5), 0 0 60px rgba(0, 240, 255, 0.2);
  --glow-magenta: 0 0 20px rgba(255, 0, 170, 0.5), 0 0 60px rgba(255, 0, 170, 0.2);
  --glow-green: 0 0 20px rgba(0, 255, 136, 0.5), 0 0 60px rgba(0, 255, 136, 0.2);

  /* Text */
  --text-primary: #e0e0f0;
  --text-secondary: #6a6a8a;
  --text-neon: var(--neon-cyan);

  /* Borders */
  --border-glow: rgba(0, 240, 255, 0.2);
  --border-dim: rgba(255, 255, 255, 0.06);

  /* Scanline overlay */
  --scanline: repeating-linear-gradient(
    0deg,
    transparent,
    transparent 2px,
    rgba(0, 0, 0, 0.15) 2px,
    rgba(0, 0, 0, 0.15) 4px
  );
}
```

## Neon Panel — Core Component

```css
.neon-panel {
  background: var(--bg-panel);
  border: 1px solid var(--border-glow);
  border-radius: 4px;  /* Sharp, not rounded */
  padding: 24px;
  position: relative;
  overflow: hidden;
}

/* Subtle scanline overlay */
.neon-panel::before {
  content: '';
  position: absolute;
  inset: 0;
  background: var(--scanline);
  pointer-events: none;
  opacity: 0.3;
}

/* Glowing top border accent */
.neon-panel::after {
  content: '';
  position: absolute;
  top: 0; left: 10%; right: 10%;
  height: 1px;
  background: linear-gradient(90deg, transparent, var(--neon-cyan), transparent);
  box-shadow: var(--glow-cyan);
}

.neon-panel:hover {
  border-color: rgba(0, 240, 255, 0.4);
  box-shadow: inset 0 0 30px rgba(0, 240, 255, 0.03), 0 0 20px rgba(0, 240, 255, 0.08);
}
```

## Glowing Text

```css
.text-neon {
  color: var(--neon-cyan);
  text-shadow:
    0 0 7px rgba(0, 240, 255, 0.6),
    0 0 20px rgba(0, 240, 255, 0.4),
    0 0 40px rgba(0, 240, 255, 0.2);
}

.text-neon-magenta {
  color: var(--neon-magenta);
  text-shadow:
    0 0 7px rgba(255, 0, 170, 0.6),
    0 0 20px rgba(255, 0, 170, 0.4),
    0 0 40px rgba(255, 0, 170, 0.2);
}

/* Flickering neon effect */
@keyframes neonFlicker {
  0%, 19%, 21%, 23%, 25%, 54%, 56%, 100% { opacity: 1; }
  20%, 24%, 55% { opacity: 0.5; }
}

.text-flicker {
  animation: neonFlicker 3s infinite alternate;
}
```

## Backgrounds

```css
body {
  background: var(--bg-void);
  color: var(--text-primary);
  position: relative;
}

/* Grid floor effect */
.cyber-grid-bg {
  background:
    linear-gradient(var(--border-dim) 1px, transparent 1px),
    linear-gradient(90deg, var(--border-dim) 1px, transparent 1px);
  background-size: 40px 40px;
  position: fixed;
  inset: 0;
  z-index: 0;
  perspective: 500px;
  transform: rotateX(60deg);
  transform-origin: center top;
  opacity: 0.3;
}

/* Ambient neon glow spots */
.glow-spot {
  position: fixed;
  width: 300px;
  height: 300px;
  border-radius: 50%;
  filter: blur(100px);
  opacity: 0.15;
  pointer-events: none;
}

.glow-spot-cyan { background: var(--neon-cyan); top: 20%; left: 10%; }
.glow-spot-magenta { background: var(--neon-magenta); bottom: 20%; right: 10%; }
```

## Animations & Motion

Pulsing, glitching, energetic:

```css
/* Glitch effect */
@keyframes glitch {
  0% { transform: translate(0); }
  2% { transform: translate(2px, -2px); }
  4% { transform: translate(-2px, 2px); }
  6% { transform: translate(0); }
  100% { transform: translate(0); }
}

/* Neon pulse */
@keyframes neonPulse {
  0%, 100% { box-shadow: 0 0 10px rgba(0, 240, 255, 0.3); }
  50% { box-shadow: 0 0 25px rgba(0, 240, 255, 0.6), 0 0 50px rgba(0, 240, 255, 0.2); }
}

/* Typing cursor for terminal */
@keyframes blink {
  0%, 100% { opacity: 1; }
  50% { opacity: 0; }
}

.cursor {
  display: inline-block;
  width: 10px;
  height: 1.2em;
  background: var(--neon-green);
  animation: blink 1s step-end infinite;
  margin-left: 2px;
}
```

## Buttons

```css
.btn-neon {
  font-family: 'Rajdhani', sans-serif;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  padding: 12px 32px;
  border: 1px solid var(--neon-cyan);
  background: transparent;
  color: var(--neon-cyan);
  position: relative;
  cursor: pointer;
  transition: all 0.3s ease;
  clip-path: polygon(10px 0, 100% 0, calc(100% - 10px) 100%, 0 100%);
}

.btn-neon:hover {
  background: rgba(0, 240, 255, 0.1);
  box-shadow: var(--glow-cyan);
  text-shadow: 0 0 10px rgba(0, 240, 255, 0.5);
}

.btn-neon-fill {
  background: var(--neon-cyan);
  color: var(--bg-void);
}
```

## Key Rules

1. **Pure black backgrounds** — `#030308` to `#0f0f1a`, never gray
2. **Neon = the only light source** — all color comes from glowing elements
3. **Text-shadow for all colored text** — multiple layers of glow
4. **Scanline overlays** — subtle CRT effect on panels
5. **Monospace for data** — terminal aesthetic for numbers/code
6. **Angular shapes** — use `clip-path` for cut corners, no soft curves
7. **Minimal border-radius** — `2-4px` max, sharp is cyberpunk
8. **Grid backgrounds** — perspective grids, matrix rain, circuit patterns
9. **Glitch effects** — sparingly, for emphasis and transitions
10. **Audio/haptic feel** — design as if the interface makes sounds when you interact

## When to Use

✅ Gaming platforms, crypto/Web3, music production tools, VR/AR interfaces, entertainment, hacker tools, creative tech, esports, synthwave-themed projects
❌ Corporate B2B, healthcare, education for children, accessibility-critical apps
