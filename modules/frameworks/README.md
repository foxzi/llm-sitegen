# Frontend Frameworks - LLM Instructions

See global rules: `modules/README.md`.

You have access to local frontend framework bundles. When user asks to create a website or use a specific framework, follow these instructions.

## Structure

```
frameworks/
├── tailwind/README.md    - Tailwind CSS documentation
├── bootstrap/README.md   - Bootstrap documentation
├── bulma/README.md       - Bulma documentation
├── uikit/README.md       - UIkit documentation
├── pico/README.md        - Pico CSS documentation
├── water/README.md       - Water.css documentation
├── milligram/README.md   - Milligram documentation
├── alpinejs/README.md    - Alpine.js documentation
└── htmx/README.md        - htmx documentation
```

## Purpose

Select and apply local CSS/JS frameworks for site generation.

## How to Use

1. When user requests a specific framework, read `frameworks/<name>/README.md` for detailed usage instructions
2. Use files from `frameworks/<name>/dist/` directory - all assets are local, no CDN needed
3. Follow code examples from the framework's README.md
4. Do not mix multiple CSS frameworks on one page unless explicitly required

### Local Asset Example

```html
<!-- CSS framework (local) -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<!-- JS framework (local, optional) -->
<script src="assets/js/alpine.min.js" defer></script>
```

## Examples

```html
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<script src="assets/js/alpine.min.js" defer></script>
```

## Available Frameworks

### CSS Frameworks

| Framework | Path | Type | Best for |
|-----------|------|------|----------|
| Tailwind CSS | `frameworks/tailwind/README.md` | Utility-first | Custom designs, rapid prototyping |
| Bootstrap | `frameworks/bootstrap/README.md` | Component | Standard websites, admin panels |
| Bulma | `frameworks/bulma/README.md` | Component | Modern layouts, no JS needed |
| UIkit | `frameworks/uikit/README.md` | Component | Feature-rich interfaces |
| Pico CSS | `frameworks/pico/README.md` | Classless | Simple sites, semantic HTML |
| Water.css | `frameworks/water/README.md` | Classless | Minimal sites, documentation |
| Milligram | `frameworks/milligram/README.md` | Minimal | Lightweight pages, 2KB only |

### JavaScript Frameworks

| Framework | Path | Best for |
|-----------|------|----------|
| Alpine.js | `frameworks/alpinejs/README.md` | Reactive UI, dropdowns, modals, tabs |
| htmx | `frameworks/htmx/README.md` | AJAX without writing JS, server-rendered apps |

## Rules

- Do not mix multiple CSS frameworks on one page
- Use local `dist/` assets only (no CDN)
- Add JS frameworks only when needed

## Checklist

- [ ] Framework README read
- [ ] Local dist paths used
- [ ] No mixed CSS frameworks

## References

- `modules/frameworks/<name>/README.md`
- `modules/frameworks/<name>/dist/`

## Framework Selection Guide

**User wants simple/minimal site:**
→ Use `pico` or `water` (classless, just semantic HTML)

**User wants standard business site:**
→ Use `bootstrap` (well-known, lots of components)

**User wants modern custom design:**
→ Use `tailwind` (utility classes, flexible)

**User wants interactivity without heavy JS:**
→ Add `alpinejs` for dropdowns, modals, toggles
→ Add `htmx` for AJAX requests from HTML

**User wants lightweight:**
→ Use `milligram` (only 2KB)

## Recommended Combinations

| Use case | CSS | JS |
|----------|-----|----|
| Landing page | tailwind | alpinejs |
| Business site | bootstrap | - |
| Documentation | pico or water | - |
| Web app | bootstrap or tailwind | htmx |
| Admin panel | uikit | alpinejs |

## Important Rules

1. **Always read the framework README before using it** - each contains specific syntax and examples
2. **Use local paths** - files are in `dist/` folder, no CDN links needed
3. **Check examples** - each framework has `examples/index.example.html`
4. **Combine wisely** - CSS framework + JS framework work well together

## Quick Reference

When user says "use Tailwind" → read `frameworks/tailwind/README.md`
When user says "use Bootstrap" → read `frameworks/bootstrap/README.md`
When user says "use Bulma" → read `frameworks/bulma/README.md`
When user says "use UIkit" → read `frameworks/uikit/README.md`
When user says "use Pico" → read `frameworks/pico/README.md`
When user says "use Water.css" → read `frameworks/water/README.md`
When user says "use Milligram" → read `frameworks/milligram/README.md`
When user says "use Alpine" → read `frameworks/alpinejs/README.md`
When user says "use htmx" → read `frameworks/htmx/README.md`
