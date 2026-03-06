# Milligram - LLM Instructions

See global rules: `modules/README.md`.

## Purpose

Provide a minimal CSS framework with grid and basic components.

## How to Use

1. Link local Normalize and Milligram CSS from `dist/`
2. Use basic grid classes for layout

## Examples

### HTML Setup

```html
<link rel="stylesheet" href="assets/css/normalize.min.css" />
<link rel="stylesheet" href="assets/css/milligram.min.css" />
```

## Rules

- Use local `dist/` assets only
- Do not use CDN links

## Checklist

- [ ] Normalize CSS linked locally
- [ ] Milligram CSS linked locally

## References

- `modules/frameworks/milligram/dist/normalize.min.css`
- `modules/frameworks/milligram/dist/milligram.min.css`

## Structure

- `dist/normalize.min.css` - CSS reset (required, include first)
- `dist/milligram.min.css` - Milligram styles

## Core Concepts

Milligram is minimal (2KB). Uses `container`, `row`, `column` for grid. Basic styling for typography and forms.

## Basic Template

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="assets/css/normalize.min.css">
  <link rel="stylesheet" href="assets/css/milligram.min.css">
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

## Grid System

12-column flexbox grid.

```html
<div class="container">
  <!-- Equal columns -->
  <div class="row">
    <div class="column">Auto</div>
    <div class="column">Auto</div>
  </div>

  <!-- Sized columns -->
  <div class="row">
    <div class="column column-50">50%</div>
    <div class="column column-50">50%</div>
  </div>

  <div class="row">
    <div class="column column-33">33%</div>
    <div class="column column-33">33%</div>
    <div class="column column-33">33%</div>
  </div>

  <div class="row">
    <div class="column column-25">25%</div>
    <div class="column column-75">75%</div>
  </div>
</div>
```

### Column Sizes

- `column-10` - 10%
- `column-20` - 20%
- `column-25` - 25%
- `column-33` - 33.3%
- `column-40` - 40%
- `column-50` - 50%
- `column-60` - 60%
- `column-67` - 66.6%
- `column-75` - 75%
- `column-80` - 80%
- `column-90` - 90%

### Column Offset

```html
<div class="row">
  <div class="column column-50 column-offset-25">Centered 50%</div>
</div>

<div class="row">
  <div class="column column-33 column-offset-33">Centered 33%</div>
</div>
```

## Typography

```html
<h1>Heading 1</h1>
<h2>Heading 2</h2>
<h3>Heading 3</h3>
<h4>Heading 4</h4>
<h5>Heading 5</h5>
<h6>Heading 6</h6>

<p>Paragraph text with <strong>bold</strong> and <em>italic</em>.</p>
<p><a href="#">Link text</a></p>
```

## Buttons

```html
<!-- Default -->
<a class="button" href="#">Button</a>
<button class="button">Button</button>

<!-- Outline -->
<button class="button button-outline">Outline</button>

<!-- Clear (text only) -->
<button class="button button-clear">Clear</button>
```

## Forms

```html
<form>
  <fieldset>
    <label for="name">Name</label>
    <input type="text" id="name" placeholder="Your name">

    <label for="email">Email</label>
    <input type="email" id="email" placeholder="email@example.com">

    <label for="age">Age</label>
    <select id="age">
      <option disabled selected>Select</option>
      <option>18-29</option>
      <option>30-49</option>
      <option>50+</option>
    </select>

    <label for="msg">Comment</label>
    <textarea id="msg" placeholder="Message"></textarea>

    <div class="row">
      <input type="checkbox" id="confirm">
      <label class="label-inline" for="confirm">Send copy</label>
    </div>

    <input class="button-primary" type="submit" value="Submit">
  </fieldset>
</form>
```

## Lists

```html
<ul>
  <li>Item 1</li>
  <li>Item 2</li>
</ul>

<ol>
  <li>First</li>
  <li>Second</li>
</ol>

<dl>
  <dt>Term</dt>
  <dd>Definition</dd>
</dl>
```

## Tables

```html
<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Age</th>
      <th>City</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>John</td>
      <td>28</td>
      <td>NYC</td>
    </tr>
    <tr>
      <td>Jane</td>
      <td>32</td>
      <td>LA</td>
    </tr>
  </tbody>
</table>
```

## Blockquotes

```html
<blockquote>
  <p><em>Quote text here.</em></p>
  <cite>— Author</cite>
</blockquote>
```

## Code

```html
<p>Inline <code>code</code> here.</p>

<pre><code>
function hello() {
  return 'world';
}
</code></pre>
```

## Page Layout Example

```html
<body>
  <main class="container">
    <header class="row">
      <div class="column">
        <h1>Site</h1>
        <nav>
          <a href="#">Home</a>
          <a href="#">About</a>
        </nav>
      </div>
    </header>

    <section class="row">
      <div class="column column-67">
        <h2>Main Content</h2>
        <p>Content here</p>
        <a class="button" href="#">Action</a>
      </div>
      <aside class="column column-33">
        <h3>Sidebar</h3>
        <p>Extra info</p>
      </aside>
    </section>

    <footer class="row">
      <div class="column">
        <p>&copy; 2024</p>
      </div>
    </footer>
  </main>
</body>
```

## Utilities

```html
<!-- Float -->
<div class="clearfix">
  <img class="float-left" src="img.jpg">
  <img class="float-right" src="img.jpg">
</div>
```

## Version

1.4.1
