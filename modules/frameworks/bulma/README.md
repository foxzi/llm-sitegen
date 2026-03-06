# Bulma - LLM Instructions

See global rules: `modules/README.md`.

## Purpose

Provide CSS-only components and layout helpers.

## How to Use

1. Link local Bulma CSS from `dist/`
2. Add optional custom JS for interactive parts

## Examples

### HTML Setup

```html
<link rel="stylesheet" href="assets/css/bulma.min.css" />
```

## Rules

- Use local `dist/` assets only
- Do not use CDN links

## Checklist

- [ ] Bulma CSS linked locally

## References

- `modules/frameworks/bulma/dist/bulma.min.css`

## Structure

- `dist/bulma.min.css` - CSS only, no JavaScript

## Core Concepts

Bulma is CSS-only. For interactive components (navbar toggle), add custom JavaScript.

## Layout

### Container and Section
```html
<section class="section">
  <div class="container">
    <h1 class="title">Page Title</h1>
    <p>Content</p>
  </div>
</section>
```

### Columns
```html
<!-- Auto-sized columns -->
<div class="columns">
  <div class="column">First</div>
  <div class="column">Second</div>
  <div class="column">Third</div>
</div>

<!-- Sized columns -->
<div class="columns">
  <div class="column is-8">8/12</div>
  <div class="column is-4">4/12</div>
</div>

<!-- Fractional sizes -->
<div class="columns">
  <div class="column is-one-quarter">25%</div>
  <div class="column is-half">50%</div>
  <div class="column is-one-quarter">25%</div>
</div>
```

### Responsive Columns
```html
<div class="columns">
  <div class="column is-full-mobile is-half-tablet is-one-third-desktop">
    Responsive
  </div>
</div>
```

## Hero Section

```html
<section class="hero is-primary is-medium">
  <div class="hero-body">
    <p class="title">Hero Title</p>
    <p class="subtitle">Hero subtitle</p>
  </div>
</section>
```

Sizes: `is-small`, `is-medium`, `is-large`, `is-fullheight`
Colors: `is-primary`, `is-link`, `is-info`, `is-success`, `is-warning`, `is-danger`

## Navbar

```html
<nav class="navbar" role="navigation">
  <div class="navbar-brand">
    <a class="navbar-item" href="#">
      <strong>Brand</strong>
    </a>
    <a class="navbar-burger" data-target="navMenu">
      <span></span><span></span><span></span>
    </a>
  </div>
  <div id="navMenu" class="navbar-menu">
    <div class="navbar-start">
      <a class="navbar-item">Home</a>
      <a class="navbar-item">About</a>
      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">More</a>
        <div class="navbar-dropdown">
          <a class="navbar-item">Item 1</a>
          <a class="navbar-item">Item 2</a>
        </div>
      </div>
    </div>
    <div class="navbar-end">
      <div class="navbar-item">
        <div class="buttons">
          <a class="button is-primary">Sign up</a>
          <a class="button is-light">Log in</a>
        </div>
      </div>
    </div>
  </div>
</nav>
```

### Navbar JS (for mobile toggle)
```html
<script>
document.addEventListener('DOMContentLoaded', () => {
  const burgers = document.querySelectorAll('.navbar-burger');
  burgers.forEach(el => {
    el.addEventListener('click', () => {
      const target = document.getElementById(el.dataset.target);
      el.classList.toggle('is-active');
      target.classList.toggle('is-active');
    });
  });
});
</script>
```

## Buttons

```html
<button class="button">Default</button>
<button class="button is-primary">Primary</button>
<button class="button is-link">Link</button>
<button class="button is-success">Success</button>
<button class="button is-warning">Warning</button>
<button class="button is-danger">Danger</button>

<!-- Styles -->
<button class="button is-outlined is-primary">Outlined</button>
<button class="button is-rounded">Rounded</button>
<button class="button is-loading">Loading</button>

<!-- Sizes -->
<button class="button is-small">Small</button>
<button class="button is-medium">Medium</button>
<button class="button is-large">Large</button>

<!-- Group -->
<div class="buttons">
  <button class="button is-primary">Save</button>
  <button class="button">Cancel</button>
</div>
```

## Cards

```html
<div class="card">
  <div class="card-image">
    <figure class="image is-4by3">
      <img src="image.jpg" alt="">
    </figure>
  </div>
  <div class="card-content">
    <p class="title is-4">Card Title</p>
    <p class="content">Card description</p>
  </div>
  <footer class="card-footer">
    <a class="card-footer-item">Save</a>
    <a class="card-footer-item">Edit</a>
    <a class="card-footer-item">Delete</a>
  </footer>
</div>
```

## Forms

```html
<div class="field">
  <label class="label">Name</label>
  <div class="control">
    <input class="input" type="text" placeholder="Enter name">
  </div>
</div>

<div class="field">
  <label class="label">Email</label>
  <div class="control has-icons-left">
    <input class="input" type="email" placeholder="Email">
    <span class="icon is-small is-left">
      <i class="fas fa-envelope"></i>
    </span>
  </div>
</div>

<div class="field">
  <label class="label">Message</label>
  <div class="control">
    <textarea class="textarea" placeholder="Message"></textarea>
  </div>
</div>

<div class="field">
  <label class="label">Subject</label>
  <div class="control">
    <div class="select">
      <select>
        <option>Select option</option>
        <option>Option 1</option>
      </select>
    </div>
  </div>
</div>

<div class="field">
  <div class="control">
    <label class="checkbox">
      <input type="checkbox"> I agree
    </label>
  </div>
</div>

<div class="field is-grouped">
  <div class="control">
    <button class="button is-link">Submit</button>
  </div>
  <div class="control">
    <button class="button is-light">Cancel</button>
  </div>
</div>
```

## Notifications

```html
<div class="notification is-primary">
  Primary notification
  <button class="delete"></button>
</div>
<div class="notification is-success">Success</div>
<div class="notification is-warning">Warning</div>
<div class="notification is-danger">Danger</div>
```

## Box

```html
<div class="box">
  <p>Content in a box with shadow</p>
</div>
```

## Typography

```html
<h1 class="title is-1">Title 1</h1>
<h2 class="title is-2">Title 2</h2>
<p class="subtitle">Subtitle</p>
```

## Helper Classes

```html
<!-- Text -->
<p class="has-text-centered">Centered</p>
<p class="has-text-right">Right</p>
<p class="has-text-weight-bold">Bold</p>
<p class="has-text-primary">Primary color</p>

<!-- Spacing (Bulma 0.9+) -->
<div class="mt-4 mb-2 px-3">Margins and padding</div>

<!-- Display -->
<div class="is-hidden-mobile">Hidden on mobile</div>
<div class="is-flex is-justify-content-space-between">Flexbox</div>

<!-- Background -->
<div class="has-background-primary has-text-white p-4">Primary bg</div>
```

## Footer

```html
<footer class="footer">
  <div class="content has-text-centered">
    <p>&copy; 2024 Company</p>
  </div>
</footer>
```

## Version

1.0.2
