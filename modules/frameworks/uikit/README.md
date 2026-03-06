# UIkit - LLM Instructions

See global rules: `modules/README.md`.

## Purpose

Provide feature-rich components with JS behaviors.

## How to Use

1. Link local UIkit CSS and JS from `dist/`
2. Use `uk-` classes and attributes

## Examples

### HTML Setup

```html
<link rel="stylesheet" href="assets/css/uikit.min.css" />
<script src="assets/js/uikit.min.js"></script>
<script src="assets/js/uikit-icons.min.js"></script>
```

## Rules

- Use local `dist/` assets only
- Do not use CDN links

## Checklist

- [ ] UIkit CSS linked locally
- [ ] UIkit JS linked locally

## References

- `modules/frameworks/uikit/dist/uikit.min.css`
- `modules/frameworks/uikit/dist/uikit.min.js`
- `modules/frameworks/uikit/dist/uikit-icons.min.js`

## Structure

- `dist/uikit.min.css` - CSS styles
- `dist/uikit.min.js` - JavaScript components
- `dist/uikit-icons.min.js` - Icon library (optional)

## Core Concepts

UIkit uses `uk-` prefixed classes and attributes. JavaScript components use `uk-*` attributes.

## Grid

```html
<!-- Basic grid -->
<div class="uk-grid" uk-grid>
  <div class="uk-width-1-2">Half</div>
  <div class="uk-width-1-2">Half</div>
</div>

<!-- Three columns -->
<div class="uk-grid" uk-grid>
  <div class="uk-width-1-3">1/3</div>
  <div class="uk-width-1-3">1/3</div>
  <div class="uk-width-1-3">1/3</div>
</div>

<!-- Responsive -->
<div class="uk-grid" uk-grid>
  <div class="uk-width-1-1 uk-width-1-2@s uk-width-1-3@m">Responsive</div>
</div>

<!-- Grid gap -->
<div class="uk-grid uk-grid-small" uk-grid>Small gap</div>
<div class="uk-grid uk-grid-large" uk-grid>Large gap</div>
```

Breakpoints: `@s` (640px), `@m` (960px), `@l` (1200px), `@xl` (1600px)

## Container

```html
<div class="uk-container">Default container</div>
<div class="uk-container uk-container-small">Small</div>
<div class="uk-container uk-container-large">Large</div>
<div class="uk-container uk-container-expand">Full width</div>
```

## Navbar

```html
<nav class="uk-navbar-container" uk-navbar>
  <div class="uk-navbar-left">
    <a class="uk-navbar-item uk-logo" href="#">Logo</a>
    <ul class="uk-navbar-nav">
      <li class="uk-active"><a href="#">Active</a></li>
      <li><a href="#">Item</a></li>
      <li>
        <a href="#">Dropdown</a>
        <div class="uk-navbar-dropdown">
          <ul class="uk-nav uk-navbar-dropdown-nav">
            <li><a href="#">Item</a></li>
            <li><a href="#">Item</a></li>
          </ul>
        </div>
      </li>
    </ul>
  </div>
  <div class="uk-navbar-right">
    <ul class="uk-navbar-nav">
      <li><a href="#">Login</a></li>
    </ul>
  </div>
</nav>
```

## Buttons

```html
<button class="uk-button uk-button-default">Default</button>
<button class="uk-button uk-button-primary">Primary</button>
<button class="uk-button uk-button-secondary">Secondary</button>
<button class="uk-button uk-button-danger">Danger</button>
<button class="uk-button uk-button-text">Text</button>
<button class="uk-button uk-button-link">Link</button>

<!-- Sizes -->
<button class="uk-button uk-button-default uk-button-small">Small</button>
<button class="uk-button uk-button-default uk-button-large">Large</button>

<!-- Group -->
<div class="uk-button-group">
  <button class="uk-button uk-button-default">Left</button>
  <button class="uk-button uk-button-default">Middle</button>
  <button class="uk-button uk-button-default">Right</button>
</div>
```

## Cards

```html
<div class="uk-card uk-card-default uk-card-body">
  <h3 class="uk-card-title">Title</h3>
  <p>Content</p>
</div>

<!-- With sections -->
<div class="uk-card uk-card-default">
  <div class="uk-card-header">
    <h3 class="uk-card-title">Title</h3>
  </div>
  <div class="uk-card-body">
    <p>Content</p>
  </div>
  <div class="uk-card-footer">
    <a href="#" class="uk-button uk-button-text">More</a>
  </div>
</div>

<!-- With media -->
<div class="uk-card uk-card-default">
  <div class="uk-card-media-top">
    <img src="image.jpg" alt="">
  </div>
  <div class="uk-card-body">
    <h3 class="uk-card-title">Title</h3>
  </div>
</div>

<!-- Styles -->
<div class="uk-card uk-card-primary uk-card-body">Primary</div>
<div class="uk-card uk-card-secondary uk-card-body">Secondary</div>
```

## Modal

```html
<!-- Trigger -->
<button class="uk-button uk-button-default" uk-toggle="target: #my-modal">
  Open
</button>

<!-- Modal -->
<div id="my-modal" uk-modal>
  <div class="uk-modal-dialog uk-modal-body">
    <button class="uk-modal-close-default" uk-close></button>
    <h2 class="uk-modal-title">Title</h2>
    <p>Content</p>
  </div>
</div>

<!-- With header/footer -->
<div id="modal-sections" uk-modal>
  <div class="uk-modal-dialog">
    <button class="uk-modal-close-default" uk-close></button>
    <div class="uk-modal-header">
      <h2 class="uk-modal-title">Title</h2>
    </div>
    <div class="uk-modal-body">
      <p>Content</p>
    </div>
    <div class="uk-modal-footer uk-text-right">
      <button class="uk-button uk-button-default uk-modal-close">Cancel</button>
      <button class="uk-button uk-button-primary">Save</button>
    </div>
  </div>
</div>
```

## Forms

```html
<form class="uk-form-stacked">
  <div class="uk-margin">
    <label class="uk-form-label">Name</label>
    <div class="uk-form-controls">
      <input class="uk-input" type="text" placeholder="Name">
    </div>
  </div>

  <div class="uk-margin">
    <label class="uk-form-label">Select</label>
    <div class="uk-form-controls">
      <select class="uk-select">
        <option>Option 1</option>
        <option>Option 2</option>
      </select>
    </div>
  </div>

  <div class="uk-margin">
    <label class="uk-form-label">Message</label>
    <div class="uk-form-controls">
      <textarea class="uk-textarea" rows="5"></textarea>
    </div>
  </div>

  <div class="uk-margin">
    <label><input class="uk-checkbox" type="checkbox"> Agree</label>
  </div>

  <button class="uk-button uk-button-primary">Submit</button>
</form>
```

## Dropdown

```html
<div class="uk-inline">
  <button class="uk-button uk-button-default">Dropdown</button>
  <div uk-dropdown>
    <ul class="uk-nav uk-dropdown-nav">
      <li class="uk-active"><a href="#">Active</a></li>
      <li><a href="#">Item</a></li>
      <li class="uk-nav-divider"></li>
      <li><a href="#">Item</a></li>
    </ul>
  </div>
</div>

<!-- Modes -->
<div uk-dropdown="mode: click">Click to open</div>
<div uk-dropdown="mode: hover">Hover to open</div>
```

## Accordion

```html
<ul uk-accordion>
  <li class="uk-open">
    <a class="uk-accordion-title" href="#">Item 1</a>
    <div class="uk-accordion-content">
      <p>Content 1</p>
    </div>
  </li>
  <li>
    <a class="uk-accordion-title" href="#">Item 2</a>
    <div class="uk-accordion-content">
      <p>Content 2</p>
    </div>
  </li>
</ul>
```

## Alerts

```html
<div class="uk-alert-primary" uk-alert>
  <a class="uk-alert-close" uk-close></a>
  <p>Primary alert</p>
</div>
<div class="uk-alert-success" uk-alert>Success</div>
<div class="uk-alert-warning" uk-alert>Warning</div>
<div class="uk-alert-danger" uk-alert>Danger</div>
```

## Icons

```html
<span uk-icon="home"></span>
<span uk-icon="user"></span>
<span uk-icon="settings"></span>
<span uk-icon="search"></span>
<span uk-icon="icon: heart; ratio: 2"></span>

<a href="#" class="uk-icon-button" uk-icon="twitter"></a>
```

## Utility Classes

```html
<!-- Text -->
<p class="uk-text-left">Left</p>
<p class="uk-text-center">Center</p>
<p class="uk-text-right">Right</p>
<p class="uk-text-bold">Bold</p>
<p class="uk-text-muted">Muted</p>

<!-- Margin -->
<div class="uk-margin">Default</div>
<div class="uk-margin-small">Small</div>
<div class="uk-margin-large">Large</div>
<div class="uk-margin-remove">None</div>

<!-- Padding -->
<div class="uk-padding">Default</div>
<div class="uk-padding-small">Small</div>

<!-- Background -->
<div class="uk-background-muted uk-padding">Muted</div>
<div class="uk-background-primary uk-light uk-padding">Primary</div>

<!-- Visibility -->
<div class="uk-visible@m">Visible on medium+</div>
<div class="uk-hidden@m">Hidden on medium+</div>
```

## Section

```html
<section class="uk-section uk-section-default">
  <div class="uk-container">
    <h2>Section Title</h2>
  </div>
</section>

<section class="uk-section uk-section-muted">Muted</section>
<section class="uk-section uk-section-primary uk-light">Primary</section>
```

## Version

3.21.6
