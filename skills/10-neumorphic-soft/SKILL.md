---
name: frontend-neumorphic-soft
description: Create tactile Neumorphic / Soft UI interfaces with extruded and inset elements, gentle shadows, and a sculpted monochromatic aesthetic. Use when user asks for neumorphic, soft UI, tactile, sculpted, embossed, raised, or clay-like UI. Ideal for wellness apps, smart home controls, music players, settings panels, IoT dashboards, calculator apps, and minimal productivity tools.
---

# Neumorphic / Soft UI Design System

Create interfaces that feel sculpted from a single material — buttons that extrude and press inward, surfaces that catch light like molded clay. The entire UI feels like one continuous, tactile surface.

## Core Aesthetic Philosophy

**The Feel**: Running your fingers over a sculpted control panel. Every button is physically pressable, every slider grooves into the surface. The screen has the tactile quality of a high-end audio device or smart home controller.

**Mood Keywords**: Tactile, sculpted, monolithic, soft, physical, calm, premium, understated

## Typography

- **Display**: `'Poppins', 'Nunito', 'Quicksand'` — rounded, soft, matching the sculpted aesthetic
- **Body**: `'Poppins', 'Nunito'` — same family, lightweight
- **Mono**: `'DM Mono', 'JetBrains Mono'` — for numbers/data
- **Weight**: Light (300) to Medium (500). NEVER bold — it's too aggressive for this style
- **Color**: Text is always subtle, never full black — matches the low-contrast ethos
- Import: `Poppins`, `Nunito`, `DM Mono`

## Color System

Monochromatic — one hue, many shades:

```css
:root {
  /* The base surface — EVERYTHING derives from this color */
  --surface: #e0e5ec;
  --surface-dark: #d1d9e6;
  --surface-light: #f0f5fc;

  /* Shadows — the magic of neumorphism */
  --shadow-light: #ffffff;
  --shadow-dark: #a3b1c6;

  /* Neumorphic shadows — raised */
  --neu-raised: 6px 6px 12px var(--shadow-dark), -6px -6px 12px var(--shadow-light);
  --neu-raised-sm: 3px 3px 6px var(--shadow-dark), -3px -3px 6px var(--shadow-light);
  --neu-raised-lg: 10px 10px 20px var(--shadow-dark), -10px -10px 20px var(--shadow-light);

  /* Neumorphic shadows — inset (pressed) */
  --neu-inset: inset 4px 4px 8px var(--shadow-dark), inset -4px -4px 8px var(--shadow-light);
  --neu-inset-sm: inset 2px 2px 4px var(--shadow-dark), inset -2px -2px 4px var(--shadow-light);
  --neu-inset-lg: inset 6px 6px 12px var(--shadow-dark), inset -6px -6px 12px var(--shadow-light);

  /* Text */
  --text-primary: #4a5568;
  --text-secondary: #718096;
  --text-faint: #a0aec0;

  /* Accent — ONE soft color for active states */
  --accent: #6c63ff;
  --accent-soft: rgba(108, 99, 255, 0.15);
  --accent-glow: 0 0 20px rgba(108, 99, 255, 0.3);
}
```

### Dark Neumorphic
```css
[data-theme="dark"] {
  --surface: #2d3748;
  --surface-dark: #232b3a;
  --surface-light: #374258;
  --shadow-light: #374258;
  --shadow-dark: #1a202c;
  --text-primary: #cbd5e0;
  --text-secondary: #a0aec0;
  --neu-raised: 6px 6px 12px var(--shadow-dark), -6px -6px 12px var(--shadow-light);
  --neu-inset: inset 4px 4px 8px var(--shadow-dark), inset -4px -4px 8px var(--shadow-light);
}
```

## The Neumorphic Element — Core Component

```css
/* Raised element — floats above surface */
.neu-raised {
  background: var(--surface);
  border-radius: 20px;
  box-shadow: var(--neu-raised);
  padding: 32px;
  border: none;
  /* NO actual border — shadows create the edge */
}

/* Inset element — pressed into surface */
.neu-inset {
  background: var(--surface);
  border-radius: 20px;
  box-shadow: var(--neu-inset);
  padding: 32px;
}

/* Flat — same as surface, no shadow */
.neu-flat {
  background: var(--surface);
  border-radius: 20px;
  padding: 32px;
}
```

## Buttons

```css
.btn-neu {
  font-family: 'Poppins', sans-serif;
  font-weight: 500;
  font-size: 0.9rem;
  padding: 14px 32px;
  border-radius: 14px;
  border: none;
  background: var(--surface);
  color: var(--text-primary);
  box-shadow: var(--neu-raised);
  cursor: pointer;
  transition: box-shadow 0.2s ease, transform 0.1s ease;
}

.btn-neu:hover {
  box-shadow: var(--neu-raised-sm);
}

.btn-neu:active {
  box-shadow: var(--neu-inset);
  transform: scale(0.98);
}

/* Icon button — circular */
.btn-neu-icon {
  width: 56px;
  height: 56px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  background: var(--surface);
  box-shadow: var(--neu-raised);
  border: none;
  cursor: pointer;
  transition: box-shadow 0.2s ease;
  color: var(--text-secondary);
}

.btn-neu-icon:active {
  box-shadow: var(--neu-inset);
}

.btn-neu-icon.active {
  box-shadow: var(--neu-inset);
  color: var(--accent);
}
```

## Form Controls

```css
/* Input field — always inset */
.input-neu {
  font-family: 'Poppins', sans-serif;
  font-size: 1rem;
  padding: 14px 20px;
  border-radius: 12px;
  border: none;
  background: var(--surface);
  box-shadow: var(--neu-inset);
  color: var(--text-primary);
  outline: none;
  width: 100%;
  transition: box-shadow 0.3s ease;
}

.input-neu:focus {
  box-shadow: var(--neu-inset), var(--accent-glow);
}

/* Toggle switch */
.toggle-track {
  width: 56px;
  height: 28px;
  border-radius: 14px;
  background: var(--surface);
  box-shadow: var(--neu-inset-sm);
  position: relative;
  cursor: pointer;
  transition: background 0.3s ease;
}

.toggle-thumb {
  width: 24px;
  height: 24px;
  border-radius: 50%;
  background: var(--surface);
  box-shadow: var(--neu-raised-sm);
  position: absolute;
  top: 2px;
  left: 2px;
  transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.toggle-track.active .toggle-thumb {
  transform: translateX(28px);
  background: var(--accent);
  box-shadow: var(--accent-glow);
}

/* Slider */
.slider-track {
  width: 100%;
  height: 8px;
  border-radius: 4px;
  background: var(--surface);
  box-shadow: var(--neu-inset-sm);
}

.slider-thumb {
  width: 24px;
  height: 24px;
  border-radius: 50%;
  background: var(--surface);
  box-shadow: var(--neu-raised-sm);
  cursor: grab;
}
```

## Backgrounds

```css
body {
  background: var(--surface);
  color: var(--text-primary);
  /* The entire page IS the surface — monolithic */
}

/* NO patterns, NO gradients, NO textures */
/* The surface is the surface. Period. */
```

## Animations & Motion

Physical, tactile, restrained:

```css
/* The press-in animation */
@keyframes pressIn {
  0% { box-shadow: var(--neu-raised); transform: scale(1); }
  50% { box-shadow: var(--neu-inset); transform: scale(0.98); }
  100% { box-shadow: var(--neu-raised); transform: scale(1); }
}

/* Subtle appear */
@keyframes neuAppear {
  from { opacity: 0; box-shadow: none; }
  to { opacity: 1; box-shadow: var(--neu-raised); }
}
```

- **Transitions**: `0.2s ease` — quick, tactile feedback
- **Press effect**: Shadow transitions from raised → inset on click
- **No slide-ins or bounces** — physical objects don't bounce
- **Scale on press**: `scale(0.98)` — feels like pressing a real button

## Key Rules

1. **ONE surface color** — everything is the same base color. Monolithic.
2. **Depth through shadows only** — NO borders, NO color differences between elements
3. **Two shadow types**: Raised (outward dual shadow) and Inset (inward dual shadow)
4. **Border-radius 12-20px** — soft, rounded, sculpted
5. **NO pure black text** — use `#4a5568` or similar muted dark
6. **ONE accent color** — only for active/selected states, used sparingly
7. **Inputs are always inset** — they're "holes" in the surface
8. **Buttons are always raised** — they "stick up" from the surface
9. **Pressed state = inset shadow** — the physical metaphor of pressing a button
10. **Light source consistency** — shadows always from top-left (light from top-left)
11. **Low contrast intentionally** — this style IS low-contrast; add labels/icons for accessibility

## Accessibility Warning

⚠️ Neumorphism has inherent contrast challenges. Always:
- Use clear labels on all interactive elements
- Add focus rings with accent color glow
- Test with WCAG contrast checker — add text weight or darkening where needed
- Consider adding subtle borders in `rgba` for low-vision users

## When to Use

✅ Wellness apps, smart home controls, music players, calculator apps, settings panels, IoT dashboards, meditation apps, minimal productivity tools, clock/timer apps
❌ Text-heavy sites, data-dense dashboards, e-commerce, content platforms, accessibility-critical apps
