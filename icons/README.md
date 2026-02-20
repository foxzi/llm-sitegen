# Icons - LLM Instructions

Local SVG icon collections for websites. All icons are SVG format, scalable and styleable with CSS.

## How to Use

1. Choose icon set based on project type or style
2. Include SVG inline or as img src
3. Style with CSS (color, size)

## HTML Usage

### Inline SVG (Recommended)
```html
<!-- Copy SVG content directly -->
<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="icon">
  <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
</svg>

<style>
.icon {
  width: 24px;
  height: 24px;
  color: currentColor; /* inherits text color */
}
</style>
```

### Image Tag
```html
<img src="icons/heroicons/outline/plus.svg" alt="Add" width="24" height="24">
```

### CSS Background
```css
.icon-plus {
  width: 24px;
  height: 24px;
  background: url('icons/feather/plus.svg') no-repeat center;
  background-size: contain;
}
```

---

## Available Icon Sets

### Heroicons
By Tailwind team. Clean, modern UI icons.
```
icons/heroicons/outline/   - 324 icons, stroke style
icons/heroicons/solid/     - 324 icons, filled style
icons/heroicons/mini/      - 324 icons, 20px filled
```
**Best for:** Tailwind projects, modern UI, dashboards
**Size:** 24x24 (outline/solid), 20x20 (mini)
**Style:** `stroke="currentColor"` or `fill="currentColor"`

### Feather
Simple, minimal icons.
```
icons/feather/   - 287 icons
```
**Best for:** Clean designs, minimal UI
**Size:** 24x24
**Style:** `stroke="currentColor"`

### Lucide
Extended Feather fork with 6x more icons.
```
icons/lucide/   - 1688 icons
```
**Best for:** When you need more variety than Feather
**Size:** 24x24
**Style:** `stroke="currentColor"`

### Bootstrap
Official Bootstrap framework icons.
```
icons/bootstrap/   - 2078 icons
```
**Best for:** Bootstrap projects, general purpose
**Size:** 16x16 (scalable)
**Style:** `fill="currentColor"`

### Tabler
Large open source collection.
```
icons/tabler/outline/   - 4985 icons
icons/tabler/filled/    - 1019 icons
```
**Best for:** Maximum variety, any project
**Size:** 24x24
**Style:** `stroke="currentColor"` (outline), `fill="currentColor"` (filled)

### Phosphor
Flexible icon family with consistent design.
```
icons/phosphor/regular/   - 1512 icons
icons/phosphor/bold/      - 1512 icons
icons/phosphor/fill/      - 1512 icons
```
**Best for:** Consistent design system, flexibility
**Size:** 256x256 (scalable)
**Style:** `fill="currentColor"`

---

## Icon Selection Guide

| Project Type | Recommended Set | Style |
|--------------|-----------------|-------|
| Tailwind/SaaS | Heroicons | outline or solid |
| Minimal/Clean | Feather | stroke |
| General Web | Lucide | stroke |
| Bootstrap | Bootstrap | fill |
| Large Project | Tabler | outline |
| Design System | Phosphor | regular/bold/fill |
| Dashboard | Heroicons, Tabler | outline |
| Mobile App | Phosphor | regular |
| E-commerce | Bootstrap, Lucide | mixed |

---

## Common Icons by Category

### Navigation
```
arrow-left, arrow-right, arrow-up, arrow-down
chevron-left, chevron-right, chevron-up, chevron-down
menu, x, home, search
```

### Actions
```
plus, minus, check, x
edit, trash, copy, save
download, upload, share, link
refresh, sync, settings, cog
```

### Communication
```
mail, phone, chat, message
bell, inbox, send, at-sign
```

### Media
```
play, pause, stop, volume
camera, image, film, music
mic, speaker, headphones
```

### User/Account
```
user, users, user-plus, user-minus
lock, unlock, key, shield
login, logout, eye, eye-off
```

### Files/Documents
```
file, folder, document, clipboard
archive, book, bookmark, tag
```

### Commerce
```
shopping-cart, credit-card, dollar-sign
gift, package, truck, store
```

### Social
```
heart, star, thumbs-up, share
facebook, twitter, instagram, github
```

---

## Styling Icons

### Size
```css
.icon-sm { width: 16px; height: 16px; }
.icon-md { width: 24px; height: 24px; }
.icon-lg { width: 32px; height: 32px; }
.icon-xl { width: 48px; height: 48px; }
```

### Color
```css
/* Inherit from parent */
.icon { color: currentColor; }

/* Specific colors */
.icon-primary { color: #3B82F6; }
.icon-success { color: #10B981; }
.icon-danger { color: #EF4444; }
.icon-muted { color: #9CA3AF; }
```

### Stroke Width (for outline icons)
```css
.icon-thin { stroke-width: 1; }
.icon-normal { stroke-width: 1.5; }
.icon-bold { stroke-width: 2; }
```

### Hover Effects
```css
.icon-hover:hover {
  color: #3B82F6;
  transform: scale(1.1);
  transition: all 0.2s;
}
```

---

## Quick Start Examples

### Icon Button
```html
<button class="btn">
  <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
    <path d="M12 4v16m8-8H4"/>
  </svg>
  Add Item
</button>

<style>
.btn {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 8px 16px;
  border: none;
  border-radius: 6px;
  background: #3B82F6;
  color: white;
  cursor: pointer;
}
.btn .icon {
  width: 20px;
  height: 20px;
}
</style>
```

### Icon in Navigation
```html
<nav>
  <a href="/">
    <svg class="nav-icon"><!-- home icon --></svg>
    Home
  </a>
  <a href="/settings">
    <svg class="nav-icon"><!-- settings icon --></svg>
    Settings
  </a>
</nav>

<style>
nav a {
  display: flex;
  align-items: center;
  gap: 8px;
  color: #374151;
}
.nav-icon {
  width: 20px;
  height: 20px;
}
</style>
```

### Social Icons
```html
<div class="social">
  <a href="#"><img src="icons/lucide/twitter.svg" alt="Twitter"></a>
  <a href="#"><img src="icons/lucide/github.svg" alt="GitHub"></a>
  <a href="#"><img src="icons/lucide/linkedin.svg" alt="LinkedIn"></a>
</div>

<style>
.social {
  display: flex;
  gap: 16px;
}
.social img {
  width: 24px;
  height: 24px;
  opacity: 0.7;
  transition: opacity 0.2s;
}
.social img:hover {
  opacity: 1;
}
</style>
```

---

## File Structure

```
icons/
  heroicons/
    outline/     # 24x24 stroke icons
    solid/       # 24x24 fill icons
    mini/        # 20x20 fill icons
  feather/       # 24x24 stroke icons
  lucide/        # 24x24 stroke icons
  bootstrap/     # 16x16 fill icons
  tabler/
    outline/     # 24x24 stroke icons
    filled/      # 24x24 fill icons
  phosphor/
    regular/     # standard weight
    bold/        # bold weight
    fill/        # filled style
```

## Icon Naming Convention

All sets use kebab-case naming:
```
arrow-left.svg
chevron-down.svg
shopping-cart.svg
user-plus.svg
```

To find an icon, check the directory listing or use file search:
```bash
ls icons/heroicons/outline/ | grep arrow
ls icons/lucide/ | grep cart
```
