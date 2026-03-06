# htmx - LLM Instructions

See global rules: `modules/README.md`.

## Purpose

Enable HTML-driven AJAX without custom JS.

## How to Use

1. Link local htmx from `dist/`
2. Use `hx-` attributes for requests

## Examples

### HTML Setup

```html
<script src="assets/js/htmx.min.js"></script>
```

## Rules

- Use local `dist/` assets only
- Do not use CDN links

## Checklist

- [ ] htmx linked locally

## References

- `modules/frameworks/htmx/dist/htmx.min.js`

## Structure

- `dist/htmx.min.js` - include in HTML

## Core Concepts

htmx sends AJAX requests from HTML attributes. Server returns HTML fragments, not JSON.

## HTTP Requests

### hx-get
```html
<button hx-get="/api/data">Load</button>
<div hx-get="/api/content" hx-trigger="load">Loading...</div>
```

### hx-post
```html
<form hx-post="/api/users">
  <input name="email" type="email">
  <button type="submit">Submit</button>
</form>
```

### hx-put
```html
<button hx-put="/api/users/123">Update</button>
```

### hx-delete
```html
<button hx-delete="/api/users/123" hx-confirm="Delete?">Delete</button>
```

## hx-target (Where to Put Response)

```html
<!-- Target by ID -->
<button hx-get="/data" hx-target="#result">Load</button>
<div id="result"></div>

<!-- Target this element -->
<button hx-get="/data" hx-target="this">Replace me</button>

<!-- Relative targets -->
<button hx-get="/data" hx-target="closest div">Closest div</button>
<button hx-get="/data" hx-target="next .result">Next .result</button>
<button hx-get="/data" hx-target="previous p">Previous p</button>
```

## hx-swap (How to Insert Response)

```html
<!-- innerHTML (default) - replace inner content -->
<div hx-get="/data" hx-swap="innerHTML">Replace my content</div>

<!-- outerHTML - replace entire element -->
<div hx-get="/data" hx-swap="outerHTML">Replace me entirely</div>

<!-- beforebegin - insert before element -->
<div hx-get="/data" hx-swap="beforebegin">Insert before me</div>

<!-- afterbegin - insert as first child -->
<ul hx-get="/item" hx-swap="afterbegin">
  <li>Existing</li>
</ul>

<!-- beforeend - insert as last child -->
<ul hx-get="/item" hx-swap="beforeend">
  <li>Existing</li>
</ul>

<!-- afterend - insert after element -->
<div hx-get="/data" hx-swap="afterend">Insert after me</div>

<!-- delete - remove element -->
<div hx-delete="/item" hx-swap="delete">Click to delete me</div>

<!-- none - no swap -->
<button hx-post="/action" hx-swap="none">Fire and forget</button>
```

### Swap Modifiers
```html
<div hx-get="/data" hx-swap="innerHTML swap:500ms">Delay swap</div>
<div hx-get="/data" hx-swap="innerHTML settle:1s">Settle delay</div>
<div hx-get="/data" hx-swap="innerHTML scroll:top">Scroll to top</div>
```

## hx-trigger (When to Send Request)

```html
<!-- Click (default for buttons) -->
<button hx-get="/data" hx-trigger="click">Click me</button>

<!-- Change (default for inputs) -->
<select hx-get="/filter" hx-trigger="change">
  <option>A</option>
  <option>B</option>
</select>

<!-- Load - on page load -->
<div hx-get="/data" hx-trigger="load">Loads immediately</div>

<!-- Revealed - when visible -->
<div hx-get="/data" hx-trigger="revealed">Lazy load</div>

<!-- Polling -->
<div hx-get="/status" hx-trigger="every 5s">Updates every 5s</div>

<!-- Keyboard -->
<input hx-get="/search" hx-trigger="keyup changed delay:300ms">

<!-- Multiple triggers -->
<div hx-get="/data" hx-trigger="click, keyup">Multiple</div>
```

### Trigger Modifiers
```html
<button hx-get="/data" hx-trigger="click once">Fire once</button>
<input hx-get="/search" hx-trigger="keyup changed">
<input hx-get="/search" hx-trigger="keyup delay:500ms">
<input hx-get="/search" hx-trigger="keyup throttle:500ms">
<div hx-get="/data" hx-trigger="click from:#other">Triggered by #other</div>
```

## hx-indicator (Loading State)

```html
<style>
  .htmx-indicator { display: none; }
  .htmx-request .htmx-indicator { display: inline; }
</style>

<button hx-get="/data" hx-indicator="#spinner">
  Load
  <span id="spinner" class="htmx-indicator">Loading...</span>
</button>
```

## hx-confirm

```html
<button hx-delete="/item" hx-confirm="Are you sure?">Delete</button>
```

## hx-push-url (Browser History)

```html
<a hx-get="/page/about" hx-push-url="true">About</a>
<button hx-get="/data" hx-push-url="/custom-url">Custom URL</button>
```

## hx-vals (Extra Values)

```html
<button hx-post="/action" hx-vals='{"key": "value"}'>Submit</button>
<button hx-post="/action" hx-vals="js:{time: Date.now()}">With JS</button>
```

## Common Patterns

### Search
```html
<input type="search"
       name="q"
       hx-get="/search"
       hx-trigger="keyup changed delay:300ms"
       hx-target="#results"
       placeholder="Search...">
<div id="results"></div>
```

### Infinite Scroll
```html
<div id="items">
  <!-- Items -->
</div>
<div hx-get="/items?page=2"
     hx-trigger="revealed"
     hx-swap="outerHTML"
     hx-target="this">
  Load more...
</div>
```

### Tabs
```html
<div hx-target="#tab-content">
  <button hx-get="/tabs/1" class="active">Tab 1</button>
  <button hx-get="/tabs/2">Tab 2</button>
  <button hx-get="/tabs/3">Tab 3</button>
</div>
<div id="tab-content" hx-get="/tabs/1" hx-trigger="load"></div>
```

### Click to Edit
```html
<div hx-get="/edit/123" hx-trigger="click" hx-swap="outerHTML">
  Click to edit: John Doe
</div>
```

### Delete with Confirmation
```html
<button hx-delete="/items/123"
        hx-confirm="Delete this item?"
        hx-target="closest tr"
        hx-swap="outerHTML swap:500ms">
  Delete
</button>
```

### Form Submission
```html
<form hx-post="/submit" hx-target="#result" hx-swap="innerHTML">
  <input name="email" type="email" required>
  <button type="submit">Submit</button>
</form>
<div id="result"></div>
```

### Polling
```html
<div hx-get="/notifications"
     hx-trigger="every 30s"
     hx-swap="innerHTML">
  <!-- Updates every 30 seconds -->
</div>
```

## Events (JavaScript)

```javascript
document.body.addEventListener('htmx:afterRequest', function(evt) {
  if (evt.detail.successful) {
    console.log('Success');
  } else {
    console.log('Failed');
  }
});

document.body.addEventListener('htmx:beforeSwap', function(evt) {
  if (evt.detail.xhr.status === 404) {
    evt.detail.shouldSwap = false;
    alert('Not found');
  }
});
```

## Server Response

Server should return HTML fragments:

```html
<!-- For hx-get="/users" -->
<ul>
  <li>User 1</li>
  <li>User 2</li>
</ul>
```

## Version

1.9.12
