---
name: memphis-maximalist
description: Bold, colorful maximalist design inspired by Memphis Group (1980s Italian design movement). Revived 2022-2024 as anti-minimalism counter-trend. Clashing colors, geometric shapes, bold patterns, playful typography. Perfect for youth brands, creative events, toy companies, music festivals. ALWAYS combine with 11-responsive-premium and 12-deployment-paths skills.
---

# Memphis Maximalist Design Style

**Era**: 2022-2024 | **Vibe**: Loud, playful, chaotic, joyful, rebellious
**Best for**: Youth brands, festivals, creative agencies, toy companies, art schools, music events

---

## CSS VARIABLES

```css
@import url('https://fonts.googleapis.com/css2?family=Fredoka:wght@400;600;700&family=DM+Sans:wght@400;500;700&display=swap');

:root {
  --mem-bg: #FFF5E1;
  --mem-black: #1A1A1A;
  --mem-pink: #FF6B9D;
  --mem-yellow: #FFD93D;
  --mem-blue: #6C5CE7;
  --mem-green: #00D2AA;
  --mem-red: #FF4757;
  --mem-orange: #FF9F43;
  --font-display: 'Fredoka', sans-serif;
  --font-body: 'DM Sans', sans-serif;
}
```

## CORE PATTERNS

### Confetti Dots Background
```css
.pattern-dots {
  background-color: var(--mem-bg);
  background-image:
    radial-gradient(var(--mem-pink) 2px, transparent 2px),
    radial-gradient(var(--mem-blue) 2px, transparent 2px),
    radial-gradient(var(--mem-yellow) 1.5px, transparent 1.5px);
  background-size: 40px 40px, 60px 60px, 50px 50px;
  background-position: 0 0, 20px 30px, 10px 15px;
}
```

### Floating Geometric Shapes (decorative)
```css
.shape { position: absolute; pointer-events: none; animation: float 6s ease-in-out infinite; }
.shape-circle { width: 80px; height: 80px; border-radius: 50%; background: var(--mem-pink); }
.shape-triangle { border-left: 40px solid transparent; border-right: 40px solid transparent; border-bottom: 70px solid var(--mem-yellow); }

@keyframes float {
  0%, 100% { transform: translateY(0) rotate(0deg); }
  50% { transform: translateY(-20px) rotate(10deg); }
}
```

## TYPOGRAPHY
```css
h1 {
  font-family: var(--font-display);
  font-size: clamp(3rem, 8vw, 7rem);
  font-weight: 700;
  text-transform: uppercase;
  line-height: 1.1;
}

/* Color-block inline word */
.word-highlight {
  background: var(--mem-yellow);
  padding: 4px 16px;
  display: inline-block;
  transform: rotate(-2deg);
}
```

## CARDS — Bold Offset Shadow
```css
.mem-card {
  background: white;
  border: 3px solid var(--mem-black);
  border-radius: 20px;
  padding: 32px;
  position: relative;
}

.mem-card::after {
  content: '';
  position: absolute;
  inset: 6px -6px -6px 6px;
  background: var(--mem-yellow);
  border: 3px solid var(--mem-black);
  border-radius: 20px;
  z-index: -1;
}

.mem-card:hover { transform: translate(-3px, -3px); }
```

## BUTTONS
```css
.mem-btn {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 16px 36px;
  background: var(--mem-pink);
  color: white;
  border: 3px solid var(--mem-black);
  border-radius: 999px;
  font-family: var(--font-display);
  font-size: 1.1rem;
  font-weight: 600;
  cursor: pointer;
  box-shadow: 4px 4px 0 var(--mem-black);
  transition: all 0.15s ease;
}

.mem-btn:hover { transform: translate(-2px, -2px); box-shadow: 6px 6px 0 var(--mem-black); }
.mem-btn:active { transform: translate(2px, 2px); box-shadow: 0 0 0 var(--mem-black); }
```

## COMMON MISTAKES
1. ❌ Using too few colors — Memphis needs 4+ bold colors
2. ❌ Uniform spacing — vary wildly between sections
3. ❌ No geometric decorations — shapes are essential, not optional
4. ❌ Using for corporate — will look unprofessional
5. ❌ Forgetting mobile — hide decorative shapes on small screens
