# UI Components - LLM Instructions

Atomic UI components with standalone CSS. Each component file contains complete styles and examples.

## How to Use

1. Open the component file you need
2. Copy the `<style>` block to your page
3. Copy the HTML markup
4. Include JavaScript if the component requires interactivity

## Structure

```
components/
  buttons.html      # Button variants, sizes, states
  cards.html        # Card layouts and styles
  forms.html        # Form inputs, selects, validation
  modals.html       # Modal dialogs, panels, sheets
  alerts.html       # Alerts, toasts, notifications
  badges.html       # Badges, tags, status indicators
  tabs.html         # Tab navigation variants
  dropdowns.html    # Dropdown menus, selects
  avatars.html      # Avatar images, groups, status
  loaders.html      # Spinners, progress, skeleton
  tooltips.html     # Tooltips and popovers
```

---

## Quick Reference

### Buttons

```html
<button class="btn btn-primary">Primary</button>
<button class="btn btn-secondary">Secondary</button>
<button class="btn btn-outline">Outline</button>
<button class="btn btn-ghost">Ghost</button>
<button class="btn btn-danger">Danger</button>
```

**Variants:** primary, secondary, outline, ghost, danger, success, warning, dark, light, link

**Sizes:** btn-xs, btn-sm, (default), btn-lg, btn-xl

**Modifiers:** btn-rounded, btn-square, btn-icon, btn-block, btn-loading

### Cards

```html
<div class="card">
  <div class="card-body">
    <h3 class="card-title">Title</h3>
    <p class="card-text">Content</p>
  </div>
</div>
```

**Types:** card-product, card-user, card-stats, card-pricing, card-testimonial, card-horizontal

**Modifiers:** card-hover

### Forms

```html
<div class="form-group">
  <label class="form-label">Label</label>
  <input type="text" class="form-input" placeholder="...">
</div>
```

**Elements:** form-input, form-select, form-textarea, form-checkbox, form-radio, form-toggle, form-file, form-range

**States:** is-valid, is-invalid

**Helpers:** input-group (with icon), input-addon-group

### Modals

```html
<div class="modal-overlay" id="modal-id">
  <div class="modal">
    <div class="modal-header">...</div>
    <div class="modal-body">...</div>
    <div class="modal-footer">...</div>
  </div>
</div>
```

**Sizes:** modal-sm, modal-lg, modal-xl, modal-full

**Types:** modal-centered, modal-confirm

**Other:** panel (side panel), sheet (bottom sheet)

### Alerts

```html
<div class="alert alert-info">
  <svg class="alert-icon">...</svg>
  <div class="alert-content">Message</div>
</div>
```

**Variants:** alert-info, alert-success, alert-warning, alert-error, alert-neutral

**Modifiers:** alert-solid, alert-banner, alert-inline

**Toast:** Use toast-container + toast elements

### Badges

```html
<span class="badge badge-primary">Badge</span>
```

**Colors:** badge-default, badge-primary, badge-success, badge-warning, badge-error, badge-info, badge-purple, badge-pink

**Styles:** badge-solid, badge-outline

**Sizes:** badge-sm, badge-lg

**Modifiers:** badge-square, badge-dot, badge-removable, badge-count

### Tabs

```html
<div class="tabs" data-tabs>
  <div class="tab-list">
    <button class="tab-button active" data-tab="tab1">Tab 1</button>
    <button class="tab-button" data-tab="tab2">Tab 2</button>
  </div>
  <div class="tab-content">
    <div class="tab-panel active" id="tab1">Content 1</div>
    <div class="tab-panel" id="tab2">Content 2</div>
  </div>
</div>
```

**Styles:** tabs-pills, tabs-boxed, tabs-vertical, tabs-card

**Modifiers:** tabs-full, tabs-scrollable

### Dropdowns

```html
<div class="dropdown">
  <button class="dropdown-toggle">Options</button>
  <div class="dropdown-menu">
    <a class="dropdown-item">Item 1</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item">Item 2</a>
  </div>
</div>
```

**Elements:** dropdown-header, dropdown-divider, dropdown-item

**Modifiers:** dropdown-item.active, dropdown-item.danger

**Types:** select-dropdown, user-dropdown

### Avatars

```html
<span class="avatar">
  <img src="..." alt="">
</span>
```

**Sizes:** avatar-xs, avatar-sm, avatar-md, avatar-lg, avatar-xl, avatar-2xl

**Shapes:** avatar-square, avatar-rounded

**Initials:** avatar-initials with color classes (avatar-primary, etc.)

**Status:** Use avatar-wrapper with avatar-status (online, offline, busy, away)

**Groups:** avatar-group

### Loaders

```html
<div class="spinner"></div>
<div class="dots-loader"><span></span><span></span><span></span></div>
<div class="progress"><div class="progress-bar" style="width: 60%;"></div></div>
```

**Spinners:** spinner, spinner-sm, spinner-lg

**Types:** dots-loader, pulse-loader, bars-loader, ring-loader

**Progress:** progress, progress-indeterminate

**Skeleton:** skeleton, skeleton-text, skeleton-avatar, skeleton-image

### Tooltips

```html
<span class="tooltip-wrapper">
  <button>Hover me</button>
  <span class="tooltip tooltip-top">Tooltip text</span>
</span>
```

**Positions:** tooltip-top, tooltip-bottom, tooltip-left, tooltip-right

**Colors:** tooltip-light, tooltip-primary, tooltip-success, tooltip-warning, tooltip-error

**CSS-only:** Use data-tooltip attribute

---

## Component Features

| Component | CSS | JavaScript | Interactive |
|-----------|-----|------------|-------------|
| buttons | Yes | No | No |
| cards | Yes | No | No |
| forms | Yes | No | Partial |
| modals | Yes | Yes | Yes |
| alerts | Yes | Yes | Yes |
| badges | Yes | No | Partial |
| tabs | Yes | Yes | Yes |
| dropdowns | Yes | Yes | Yes |
| avatars | Yes | No | No |
| loaders | Yes | No | No |
| tooltips | Yes | Partial | Partial |

---

## Design System

### Colors

Primary: `#4F46E5` (indigo)
Primary Dark: `#4338CA`
Primary Light: `#EEF2FF`

Success: `#10B981`
Warning: `#F59E0B`
Error: `#EF4444`
Info: `#3B82F6`

Neutral: `#6B7280` (text), `#E5E7EB` (borders), `#F3F4F6` (backgrounds)

### Typography

Font: `system-ui, -apple-system, sans-serif`
Base size: `0.9375rem` (15px)

### Spacing

Padding: `0.5rem`, `0.75rem`, `1rem`, `1.25rem`, `1.5rem`
Gap: `0.5rem`, `0.75rem`, `1rem`
Border radius: `4px`, `6px`, `8px`, `12px`, `9999px`

### Transitions

Duration: `0.2s`
Easing: `ease`

---

## Combining Components

Components are designed to work together:

```html
<!-- Card with badge and button -->
<div class="card">
  <div class="card-body">
    <span class="badge badge-success">New</span>
    <h3 class="card-title">Title</h3>
    <p class="card-text">Description</p>
    <button class="btn btn-primary">Action</button>
  </div>
</div>

<!-- Form with validation and button -->
<div class="form-group">
  <label class="form-label">Email</label>
  <input type="email" class="form-input is-invalid">
  <p class="form-error">Invalid email</p>
</div>
<button class="btn btn-primary btn-loading">Submit</button>

<!-- User dropdown with avatar -->
<div class="dropdown user-dropdown">
  <span class="avatar dropdown-toggle">
    <img src="...">
  </span>
  <div class="dropdown-menu">...</div>
</div>
```

---

## Customization

### Change Primary Color

Replace in all component files:
```css
#4F46E5 → your color
#4338CA → darker shade
#EEF2FF → lighter shade
rgba(79, 70, 229, ...) → your rgba
```

### Change Border Radius

Standard values used:
```css
border-radius: 4px;  /* small elements */
border-radius: 6px;  /* inputs, small buttons */
border-radius: 8px;  /* buttons, cards */
border-radius: 12px; /* large cards, modals */
border-radius: 9999px; /* pills, avatars */
```

### Change Font

Update body font-family:
```css
font-family: 'Inter', system-ui, sans-serif;
```
