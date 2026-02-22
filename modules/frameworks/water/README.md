# Water.css - LLM Instructions

## Files

- `dist/water.min.css` - auto theme (light/dark based on system)
- `dist/water-dark.min.css` - dark theme only

## HTML Setup

```html
<!-- Auto theme (recommended) -->
<link rel="stylesheet" href="./dist/water.min.css" />

<!-- Dark only -->
<link rel="stylesheet" href="./dist/water-dark.min.css" />
```

## Core Concepts

Water.css is classless. Write semantic HTML, it looks good automatically. No classes needed.

## Basic Template

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="./dist/water.min.css">
  <title>Page</title>
</head>
<body>
  <h1>Title</h1>
  <p>Content. No classes needed.</p>
</body>
</html>
```

## Typography

All styled automatically.

```html
<h1>Heading 1</h1>
<h2>Heading 2</h2>
<h3>Heading 3</h3>
<h4>Heading 4</h4>

<p>Paragraph with <strong>bold</strong> and <em>italic</em>.</p>
<p><small>Small text</small></p>
<p><mark>Highlighted</mark></p>
<p><code>Inline code</code></p>

<pre><code>
Code block
</code></pre>

<blockquote>
  Blockquote text
</blockquote>

<hr>
```

## Links

```html
<p>Visit <a href="#">this link</a> for more.</p>

<nav>
  <a href="#">Home</a> |
  <a href="#">About</a> |
  <a href="#">Contact</a>
</nav>
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

## Buttons

```html
<button>Button</button>
<button disabled>Disabled</button>
<input type="submit" value="Submit">
<input type="reset" value="Reset">
```

## Forms

```html
<form>
  <label for="name">Name:</label>
  <input type="text" id="name" placeholder="Your name">

  <label for="email">Email:</label>
  <input type="email" id="email" placeholder="you@example.com">

  <label for="msg">Message:</label>
  <textarea id="msg" rows="4"></textarea>

  <label for="country">Country:</label>
  <select id="country">
    <option>USA</option>
    <option>Canada</option>
  </select>

  <label>
    <input type="checkbox"> I agree
  </label>

  <fieldset>
    <legend>Choose:</legend>
    <label><input type="radio" name="opt"> Option A</label>
    <label><input type="radio" name="opt"> Option B</label>
  </fieldset>

  <button type="submit">Submit</button>
</form>
```

## Tables

```html
<table>
  <caption>Data Table</caption>
  <thead>
    <tr>
      <th>Name</th>
      <th>Age</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Alice</td>
      <td>28</td>
    </tr>
    <tr>
      <td>Bob</td>
      <td>34</td>
    </tr>
  </tbody>
</table>
```

## Details (Accordion)

```html
<details>
  <summary>Click to expand</summary>
  <p>Hidden content</p>
</details>

<details open>
  <summary>Already open</summary>
  <p>Visible content</p>
</details>
```

## Images

```html
<img src="photo.jpg" alt="Description">

<figure>
  <img src="photo.jpg" alt="Photo">
  <figcaption>Caption text</figcaption>
</figure>
```

## Progress

```html
<progress value="70" max="100">70%</progress>
<meter value="0.7">70%</meter>
```

## Page Layout

```html
<body>
  <header>
    <h1>Site Title</h1>
    <nav>
      <a href="#">Home</a> |
      <a href="#">About</a>
    </nav>
  </header>

  <main>
    <article>
      <h2>Article</h2>
      <p>Content</p>
    </article>
  </main>

  <footer>
    <p>&copy; 2024</p>
  </footer>
</body>
```

## Customization

Override CSS variables:

```html
<style>
  :root {
    --links: blue;
    --background: #ffffff;
    --text-main: #333333;
  }

  @media (prefers-color-scheme: dark) {
    :root {
      --links: lightblue;
      --background: #1a1a1a;
      --text-main: #e0e0e0;
    }
  }
</style>
```

Available variables:
- `--background-body` - page background
- `--background` - element backgrounds
- `--text-main` - main text color
- `--text-bright` - headings
- `--links` - link color
- `--focus` - focus ring
- `--border` - borders
- `--code` - code text
- `--button-base` - button background

## Version

2
