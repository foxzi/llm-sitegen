# Pico CSS - LLM Instructions

See global rules: `modules/README.md`.

## Purpose

Provide classless styling for semantic HTML.

## How to Use

1. Link local Pico CSS from `dist/`
2. Use semantic HTML without extra classes

## Examples

### HTML Setup

```html
<meta name="color-scheme" content="light dark">
<link rel="stylesheet" href="assets/css/pico.min.css" />
```

## Rules

- Use local `dist/` assets only
- Do not use CDN links

## Checklist

- [ ] Pico CSS linked locally

## References

- `modules/frameworks/pico/dist/pico.min.css`

## Structure

- `dist/pico.min.css` - include in HTML

## Core Concepts

Pico is classless. Semantic HTML is styled automatically. Minimal classes needed.

## Basic Template

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="color-scheme" content="light dark">
  <link rel="stylesheet" href="assets/css/pico.min.css">
  <title>Page</title>
</head>
<body>
  <main class="container">
    <h1>Title</h1>
    <p>Content</p>
  </main>
</body>
</html>
```

## Container

```html
<main class="container">
  <!-- Centered with max-width -->
</main>

<main class="container-fluid">
  <!-- Full width -->
</main>
```

## Typography

All styled automatically, no classes.

```html
<h1>Heading 1</h1>
<h2>Heading 2</h2>
<h3>Heading 3</h3>
<p>Paragraph text.</p>
<p><strong>Bold</strong> and <em>italic</em>.</p>
<p><small>Small text</small></p>
<p><mark>Highlighted</mark></p>

<blockquote>
  Quote text
  <footer><cite>— Author</cite></footer>
</blockquote>

<pre><code>Code block</code></pre>
<p>Inline <code>code</code></p>
```

## Buttons

```html
<!-- Primary (default) -->
<button>Primary</button>

<!-- Secondary -->
<button class="secondary">Secondary</button>

<!-- Contrast -->
<button class="contrast">Contrast</button>

<!-- Outline -->
<button class="outline">Outline</button>
<button class="outline secondary">Outline Secondary</button>

<!-- Link as button -->
<a href="#" role="button">Link Button</a>

<!-- Disabled -->
<button disabled>Disabled</button>
```

## Forms

Styled automatically with semantic HTML.

```html
<form>
  <label for="name">Name</label>
  <input type="text" id="name" placeholder="Your name" required>

  <label for="email">Email</label>
  <input type="email" id="email" placeholder="email@example.com">

  <label for="message">Message</label>
  <textarea id="message" placeholder="Your message"></textarea>

  <label for="country">Country</label>
  <select id="country">
    <option value="">Select...</option>
    <option>USA</option>
    <option>Canada</option>
  </select>

  <label>
    <input type="checkbox">
    I agree to terms
  </label>

  <fieldset>
    <legend>Choose:</legend>
    <label><input type="radio" name="opt" value="a"> Option A</label>
    <label><input type="radio" name="opt" value="b"> Option B</label>
  </fieldset>

  <button type="submit">Submit</button>
</form>
```

### Input States

```html
<input type="text" aria-invalid="false" value="Valid">
<input type="text" aria-invalid="true" value="Invalid">
<input type="text" disabled value="Disabled">
<input type="text" readonly value="Read only">
```

## Grid

```html
<div class="grid">
  <div>Column 1</div>
  <div>Column 2</div>
</div>

<div class="grid">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
```

## Navigation

```html
<nav>
  <ul>
    <li><strong>Brand</strong></li>
  </ul>
  <ul>
    <li><a href="#">Home</a></li>
    <li><a href="#">About</a></li>
    <li><a href="#">Contact</a></li>
  </ul>
</nav>
```

## Cards

Use `<article>` for card-like elements.

```html
<article>
  <header>Card Header</header>
  <p>Card content</p>
  <footer>Card Footer</footer>
</article>

<!-- Simple card -->
<article>
  <h3>Title</h3>
  <p>Description</p>
  <a href="#" role="button">Action</a>
</article>
```

## Tables

```html
<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Email</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>John</td>
      <td>john@example.com</td>
    </tr>
  </tbody>
</table>
```

## Modal

```html
<button onclick="document.getElementById('modal').showModal()">
  Open
</button>

<dialog id="modal">
  <article>
    <header>
      <button aria-label="Close" rel="prev"
              onclick="document.getElementById('modal').close()"></button>
      <h3>Modal Title</h3>
    </header>
    <p>Content</p>
    <footer>
      <button class="secondary"
              onclick="document.getElementById('modal').close()">Cancel</button>
      <button>Confirm</button>
    </footer>
  </article>
</dialog>
```

## Dark Mode

Auto-switches based on system preference.

```html
<!-- Auto (default) -->
<html lang="en">

<!-- Force light -->
<html lang="en" data-theme="light">

<!-- Force dark -->
<html lang="en" data-theme="dark">
```

## Loading State

```html
<button aria-busy="true">Loading...</button>
<article aria-busy="true">Loading content...</article>
```

## Tooltips

```html
<span data-tooltip="Tooltip text">Hover me</span>
<button data-tooltip="Click to submit">Submit</button>
```

## CSS Variables (Customization)

```html
<style>
  :root {
    --pico-border-radius: 2rem;
    --pico-font-weight: 400;
  }
</style>
```

## Version

2
