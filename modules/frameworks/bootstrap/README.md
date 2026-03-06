# Bootstrap - LLM Instructions

See global rules: `modules/README.md`.

## Purpose

Provide component-based CSS/JS for standard layouts and UI.

## How to Use

1. Link local Bootstrap CSS and JS from `dist/`
2. Use Bootstrap classes for layout and components

## Examples

### HTML Setup

```html
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<script src="assets/js/bootstrap.bundle.min.js"></script>
```

## Rules

- Use local `dist/` assets only
- Do not use CDN links

## Checklist

- [ ] Bootstrap CSS linked locally
- [ ] Bootstrap JS linked locally (if needed)

## References

- `modules/frameworks/bootstrap/dist/bootstrap.min.css`
- `modules/frameworks/bootstrap/dist/bootstrap.bundle.min.js`

## Structure

- `dist/bootstrap.min.css` - CSS styles
- `dist/bootstrap.bundle.min.js` - JavaScript (includes Popper.js)

## Grid System

12-column grid. Use `container`, `row`, `col`.

### Basic Grid
```html
<div class="container">
  <div class="row">
    <div class="col">Equal</div>
    <div class="col">Equal</div>
    <div class="col">Equal</div>
  </div>
</div>
```

### Sized Columns
```html
<div class="container">
  <div class="row">
    <div class="col-8">8/12</div>
    <div class="col-4">4/12</div>
  </div>
</div>
```

### Responsive Grid
```html
<div class="container">
  <div class="row">
    <!-- Full on mobile, half on md+, third on lg+ -->
    <div class="col-12 col-md-6 col-lg-4">Item</div>
    <div class="col-12 col-md-6 col-lg-4">Item</div>
    <div class="col-12 col-md-6 col-lg-4">Item</div>
  </div>
</div>
```

### Breakpoints
- `col-` - all sizes
- `col-sm-` - 576px+
- `col-md-` - 768px+
- `col-lg-` - 992px+
- `col-xl-` - 1200px+

## Containers

```html
<div class="container">Fixed width</div>
<div class="container-fluid">Full width</div>
```

## Buttons

```html
<button class="btn btn-primary">Primary</button>
<button class="btn btn-secondary">Secondary</button>
<button class="btn btn-success">Success</button>
<button class="btn btn-danger">Danger</button>
<button class="btn btn-warning">Warning</button>
<button class="btn btn-outline-primary">Outline</button>

<!-- Sizes -->
<button class="btn btn-primary btn-lg">Large</button>
<button class="btn btn-primary btn-sm">Small</button>
```

## Navbar

```html
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">
    <a class="navbar-brand" href="#">Brand</a>
    <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#nav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="nav">
      <ul class="navbar-nav me-auto">
        <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="#">About</a></li>
      </ul>
    </div>
  </div>
</nav>
```

## Cards

```html
<div class="card" style="width: 18rem;">
  <img src="image.jpg" class="card-img-top" alt="">
  <div class="card-body">
    <h5 class="card-title">Title</h5>
    <p class="card-text">Content</p>
    <a href="#" class="btn btn-primary">Action</a>
  </div>
</div>
```

## Modal

```html
<!-- Trigger -->
<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
  Open Modal
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Title</h5>
        <button class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">Content</div>
      <div class="modal-footer">
        <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button class="btn btn-primary">Save</button>
      </div>
    </div>
  </div>
</div>
```

## Forms

```html
<form>
  <div class="mb-3">
    <label class="form-label">Email</label>
    <input type="email" class="form-control" placeholder="email@example.com">
  </div>
  <div class="mb-3">
    <label class="form-label">Password</label>
    <input type="password" class="form-control">
  </div>
  <div class="mb-3">
    <label class="form-label">Select</label>
    <select class="form-select">
      <option>Option 1</option>
      <option>Option 2</option>
    </select>
  </div>
  <div class="mb-3 form-check">
    <input type="checkbox" class="form-check-input" id="check">
    <label class="form-check-label" for="check">Remember me</label>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
```

## Alerts

```html
<div class="alert alert-primary">Primary</div>
<div class="alert alert-success">Success</div>
<div class="alert alert-danger">Danger</div>
<div class="alert alert-warning">Warning</div>

<!-- Dismissible -->
<div class="alert alert-warning alert-dismissible fade show">
  Message
  <button class="btn-close" data-bs-dismiss="alert"></button>
</div>
```

## Spacing Utilities

Format: `{property}{sides}-{size}`

- `m` - margin, `p` - padding
- `t` top, `b` bottom, `s` start, `e` end, `x` horizontal, `y` vertical
- Sizes: 0, 1, 2, 3, 4, 5, auto

```html
<div class="mt-3 mb-4 px-2">Margins and padding</div>
<div class="mx-auto" style="width: 200px;">Centered</div>
```

## Display Utilities

```html
<div class="d-none">Hidden</div>
<div class="d-none d-md-block">Hidden on mobile, visible on md+</div>
<div class="d-flex justify-content-between">Flexbox</div>
```

## Text Utilities

```html
<p class="text-center">Centered</p>
<p class="text-primary">Primary color</p>
<p class="fw-bold">Bold</p>
<p class="fs-4">Font size 4</p>
```

## Background

```html
<div class="bg-primary text-white p-3">Primary</div>
<div class="bg-light p-3">Light</div>
<div class="bg-dark text-white p-3">Dark</div>
```

## Dropdown

```html
<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown">
    Dropdown
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">Action</a></li>
    <li><a class="dropdown-item" href="#">Another</a></li>
  </ul>
</div>
```

## Version

5.3.3
