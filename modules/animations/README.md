# Animations - LLM Instructions

See global rules: `modules/README.md`.

CSS animations, transitions, and effects. Each file contains complete styles and usage examples.

## Purpose

Provide reusable animation utilities and effects.

## How to Use

1. Copy CSS to your stylesheet
2. Apply classes to elements
3. Include JavaScript if required (scroll, text effects)
4. Respect `prefers-reduced-motion` for accessibility

## Structure

```
animations/
  transitions.html   # Transition utilities
  keyframes.html     # Keyframe animations
  hover.html         # Hover effects
  scroll.html        # Scroll-triggered animations
  text.html          # Text effects
```

---

## Examples

```html
<div class="animate-fade-in-up duration-500">Content</div>
```

## Rules

- Prefer transform/opacity animations
- Respect `prefers-reduced-motion`
- Add JS only for scroll/text effects

## Checklist

- [ ] Reduced motion handled
- [ ] No heavy layout animations

## References

- `modules/animations/`

## Quick Reference

### Transitions

```css
/* Duration */
.transition-200 { transition-duration: 200ms; }
.transition-300 { transition-duration: 300ms; }
.transition-500 { transition-duration: 500ms; }

/* Properties */
.transition        /* color, bg, border, shadow, transform */
.transition-all    /* all properties */
.transition-colors /* color properties only */
.transition-transform /* transform only */

/* Timing */
.ease-in
.ease-out
.ease-in-out
.ease-bounce
.ease-elastic

/* Delay */
.delay-100, .delay-200, .delay-300...
```

### Keyframe Animations

```css
/* Fade */
.animate-fade-in
.animate-fade-in-up
.animate-fade-in-down
.animate-fade-in-left
.animate-fade-in-right

/* Scale */
.animate-scale-in
.animate-zoom-in
.animate-pop

/* Bounce */
.animate-bounce
.animate-bounce-in

/* Shake */
.animate-shake
.animate-wiggle

/* Spin */
.animate-spin
.animate-spin-slow

/* Pulse */
.animate-pulse
.animate-ping
.animate-heartbeat

/* Flip */
.animate-flip-x
.animate-flip-y

/* Modifiers */
.duration-300, .duration-500, .duration-1000
.animate-delay-200, .animate-delay-500
.animate-infinite
```

### Hover Effects

```css
/* Transform */
.hover-scale       /* scale(1.05) */
.hover-lift        /* translateY(-4px) + shadow */
.hover-float       /* translateY(-2px) */
.hover-rotate      /* rotate(3deg) */

/* Visual */
.hover-shadow
.hover-glow
.hover-fade

/* Underline */
.hover-underline
.hover-underline-center

/* Background */
.hover-bg-slide
.hover-bg-radial

/* Border */
.hover-border
.hover-border-grow

/* Image */
.hover-img-zoom
.hover-img-grayscale
.hover-img-blur
```

### Scroll Animations

```html
<!-- Basic -->
<div data-scroll="fade-up">Content</div>

<!-- With delay -->
<div data-scroll="fade-up" data-scroll-delay="200">Content</div>

<!-- Stagger children -->
<div data-scroll-stagger>
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
```

**Scroll types:** fade, fade-up, fade-down, fade-left, fade-right, scale, zoom, slide-up, slide-down, flip-up, flip-down, rotate

**Modifiers:** data-scroll-delay, data-scroll-duration, data-scroll-easing

### Text Animations

```css
/* Static effects */
.text-gradient
.text-gradient-animate
.text-neon
.text-glitch

/* Animated */
.typewriter
.text-reveal
.text-blur-in
.text-highlight
.text-wave
```

---

## Component Details

### transitions.html

**Duration classes:** 75ms to 1000ms

**Property classes:**
- `.transition` - common properties
- `.transition-all` - everything
- `.transition-colors` - colors only
- `.transition-transform` - transforms only
- `.transition-opacity` - opacity only
- `.transition-shadow` - shadows only

**Timing functions:**
- `.ease-linear`, `.ease-in`, `.ease-out`, `.ease-in-out`
- `.ease-bounce`, `.ease-elastic`, `.ease-back`, `.ease-smooth`

**Transform utilities:**
- Scale: `.scale-0` to `.scale-150`
- Rotate: `.rotate-0` to `.rotate-180`
- Translate: `.translate-x-*`, `.translate-y-*`
- Skew: `.skew-x-*`, `.skew-y-*`
- Origin: `.origin-center`, `.origin-top`, etc.

**Pre-built hover:**
- `.hover-scale`, `.hover-lift`, `.hover-grow`, `.hover-shrink`

### keyframes.html

**Entrance animations:**
- Fade: fade-in, fade-in-up/down/left/right
- Scale: scale-in, zoom-in
- Slide: slide-in-up/down/left/right
- Bounce: bounce-in
- Flip: flip-x, flip-y

**Exit animations:**
- fade-out, scale-out, zoom-out, bounce-out
- slide-out-up/down/left/right

**Looping animations:**
- bounce, pulse, pulse-scale, ping, heartbeat
- spin, spin-slow
- shake, shake-horizontal, shake-vertical, wiggle

**Attention seekers:**
- flash, rubber-band, jello, pop

**Modifiers:**
- Duration: `.duration-*`
- Delay: `.animate-delay-*`
- Iteration: `.animate-once`, `.animate-twice`, `.animate-infinite`
- Direction: `.animate-reverse`, `.animate-alternate`
- Fill mode: `.animate-fill-forwards`, `.animate-fill-both`

### hover.html

**Transform effects:**
- `.hover-scale`, `.hover-scale-sm`, `.hover-scale-lg`
- `.hover-lift`, `.hover-lift-sm`, `.hover-lift-lg`
- `.hover-float`, `.hover-rotate`

**Visual effects:**
- `.hover-shadow`, `.hover-glow`
- `.hover-fade`, `.hover-fade-75`

**Underline effects:**
- `.hover-underline` - slides from left
- `.hover-underline-center` - expands from center
- `.hover-underline-thick`

**Background effects:**
- `.hover-bg-slide` - slides from left
- `.hover-bg-slide-right`, `.hover-bg-slide-up`
- `.hover-bg-radial` - expands from center

**Image effects:**
- `.hover-img-zoom` - zoom on hover
- `.hover-img-zoom-rotate` - zoom + rotate
- `.hover-img-grayscale` - add grayscale
- `.hover-img-grayscale-off` - remove grayscale
- `.hover-img-blur`, `.hover-img-brightness`

**Overlay effects:**
- `.hover-overlay` - dark overlay
- `.hover-overlay-gradient`
- `.hover-reveal` - reveal content on hover

**Button effects:**
- `.btn-hover-fill` - background fill
- `.btn-hover-outline` - outline to fill

**Card effects:**
- `.card-hover-lift`, `.card-hover-border`, `.card-hover-glow`

### scroll.html

**Requires JavaScript** - IntersectionObserver

**Animation types:**
- `data-scroll="fade"` - simple fade
- `data-scroll="fade-up"` - fade + slide up
- `data-scroll="fade-down/left/right"` - directional
- `data-scroll="scale"` - fade + scale
- `data-scroll="slide-up/down/left/right"` - slide only
- `data-scroll="flip-up/down/left/right"` - 3D flip
- `data-scroll="rotate"` - fade + rotate

**Modifiers:**
- `data-scroll-delay="200"` - delay in ms
- `data-scroll-duration="fast/slow/slower"`
- `data-scroll-easing="ease-out/bounce"`

**Stagger children:**
```html
<div data-scroll-stagger>
  <div>Staggered 1</div>
  <div>Staggered 2</div>
  <div>Staggered 3</div>
</div>
```

**Additional features:**
- Parallax backgrounds
- Scroll progress bar
- Count-up numbers
- Smooth scroll to anchors

### text.html

**CSS-only effects:**
- `.typewriter` - typewriter with cursor
- `.text-gradient` - gradient fill
- `.text-gradient-animate` - animated gradient
- `.text-neon` - neon glow
- `.text-neon-animate` - pulsing neon
- `.text-glitch` - glitch effect (needs data-text)
- `.text-blur-in` - blur to clear
- `.text-highlight` - marker highlight

**JavaScript effects:**
- Wave text - bouncing letters
- Text scramble/decode
- Letter-by-letter reveal
- Word rotation

---

## Best Practices

### Performance

1. Use `transform` and `opacity` for smooth animations
2. Add `will-change` for heavy animations
3. Use `prefers-reduced-motion` media query
4. Avoid animating `width`, `height`, `top`, `left`

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

### Timing

| Duration | Use case |
|----------|----------|
| 100-200ms | Micro-interactions (buttons, toggles) |
| 200-300ms | Small UI changes (dropdowns, tooltips) |
| 300-500ms | Medium transitions (modals, panels) |
| 500-1000ms | Large animations (page transitions) |

### Easing

| Easing | Use case |
|--------|----------|
| ease-out | Elements entering view |
| ease-in | Elements leaving view |
| ease-in-out | UI state changes |
| linear | Continuous animations (spin) |
| bounce/elastic | Playful interactions |

---

## Combining Animations

```html
<!-- Multiple classes -->
<div class="animate-fade-in-up duration-500 animate-delay-200">
  Combined animation
</div>

<!-- Hover + scroll -->
<div data-scroll="fade-up" class="hover-lift">
  Scroll reveal + hover effect
</div>

<!-- Transition + hover effect -->
<button class="transition-all hover-scale hover-shadow">
  Button
</button>
```
