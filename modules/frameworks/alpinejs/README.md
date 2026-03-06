# Alpine.js - LLM Instructions

See global rules: `modules/README.md`.

## Purpose

Provide lightweight reactivity via HTML attributes.

## How to Use

1. Link local Alpine.js from `dist/` with `defer`
2. Use `x-` directives for behavior

## Examples

### HTML Setup

```html
<script defer src="assets/js/alpine.min.js"></script>
```

## Rules

- Use local `dist/` assets only
- Do not use CDN links

## Checklist

- [ ] Alpine.js linked locally

## References

- `modules/frameworks/alpinejs/dist/alpine.min.js`

## Structure

- `dist/alpine.min.js` - include with `defer` attribute

## Core Concepts

Alpine adds reactivity to HTML using `x-` directives. No build step needed.

## x-data (State)

Define reactive data on any element.

```html
<div x-data="{ open: false, count: 0, name: '' }">
  <!-- Use state here -->
</div>

<!-- With methods -->
<div x-data="{
  count: 0,
  increment() { this.count++ }
}">
  <button @click="increment">Add</button>
  <span x-text="count"></span>
</div>
```

## x-show (Toggle Visibility)

Show/hide elements. Element stays in DOM.

```html
<div x-data="{ open: false }">
  <button @click="open = !open">Toggle</button>
  <div x-show="open">Visible when open is true</div>
</div>
```

## x-if (Conditional Render)

Add/remove elements from DOM. Must use `<template>` tag.

```html
<div x-data="{ show: false }">
  <button @click="show = !show">Toggle</button>
  <template x-if="show">
    <div>Rendered only when show is true</div>
  </template>
</div>
```

## x-for (Loops)

Iterate arrays. Must use `<template>` tag.

```html
<ul x-data="{ items: ['Apple', 'Banana', 'Cherry'] }">
  <template x-for="item in items">
    <li x-text="item"></li>
  </template>
</ul>

<!-- With index -->
<ul x-data="{ items: ['A', 'B', 'C'] }">
  <template x-for="(item, index) in items" :key="index">
    <li x-text="index + ': ' + item"></li>
  </template>
</ul>
```

## x-on / @ (Events)

Listen to DOM events.

```html
<button x-on:click="count++">Click</button>
<button @click="count++">Shorthand</button>

<!-- Modifiers -->
<button @click.prevent="submit()">Prevent default</button>
<button @click.stop="handle()">Stop propagation</button>
<button @click.once="runOnce()">Fire once</button>
<input @keyup.enter="submit()">
<input @keyup.escape="close()">
```

## x-bind / : (Attributes)

Dynamically set HTML attributes.

```html
<img :src="imageUrl">
<button :disabled="!isValid">Submit</button>

<!-- Classes -->
<div :class="{ 'active': isActive }">Conditional class</div>
<div :class="isRed ? 'text-red' : 'text-blue'">Ternary</div>

<!-- Styles -->
<div :style="{ color: textColor }">Styled</div>
```

## x-model (Two-way Binding)

Sync form inputs with data.

```html
<div x-data="{ message: '' }">
  <input type="text" x-model="message">
  <p x-text="message"></p>
</div>

<!-- Modifiers -->
<input x-model.lazy="text">      <!-- Update on change, not input -->
<input x-model.number="count">   <!-- Cast to number -->
<input x-model.debounce="query"> <!-- Debounce updates -->
```

## x-text (Text Content)

Set element text.

```html
<span x-text="username"></span>
<span x-text="'Hello, ' + name"></span>
<span x-text="`Count: ${count}`"></span>
```

## x-html (HTML Content)

Set inner HTML. Use carefully.

```html
<div x-html="htmlContent"></div>
```

## x-ref (References)

Reference DOM elements.

```html
<div x-data>
  <input type="text" x-ref="input">
  <button @click="$refs.input.focus()">Focus</button>
</div>
```

## x-init (Initialize)

Run code on component init.

```html
<div x-data="{ items: [] }" x-init="items = ['a', 'b', 'c']">
  <!-- items populated on init -->
</div>
```

## x-cloak (Hide Until Ready)

Hide element until Alpine loads. Add CSS rule.

```html
<style>[x-cloak] { display: none !important; }</style>

<div x-data x-cloak>
  No flash of unstyled content
</div>
```

## Common Components

### Dropdown
```html
<div x-data="{ open: false }" class="relative">
  <button @click="open = !open">Menu</button>
  <div x-show="open" @click.outside="open = false" class="absolute">
    <a href="#">Item 1</a>
    <a href="#">Item 2</a>
  </div>
</div>
```

### Tabs
```html
<div x-data="{ tab: 'home' }">
  <nav>
    <button @click="tab = 'home'" :class="{ 'active': tab === 'home' }">Home</button>
    <button @click="tab = 'about'" :class="{ 'active': tab === 'about' }">About</button>
  </nav>
  <div x-show="tab === 'home'">Home content</div>
  <div x-show="tab === 'about'">About content</div>
</div>
```

### Modal
```html
<div x-data="{ open: false }">
  <button @click="open = true">Open Modal</button>
  <div x-show="open" class="modal-overlay" @click.self="open = false">
    <div class="modal-content">
      <h2>Modal Title</h2>
      <p>Content here</p>
      <button @click="open = false">Close</button>
    </div>
  </div>
</div>
```

### Accordion
```html
<div x-data="{ active: null }">
  <div>
    <button @click="active = active === 1 ? null : 1">Section 1</button>
    <div x-show="active === 1">Content 1</div>
  </div>
  <div>
    <button @click="active = active === 2 ? null : 2">Section 2</button>
    <div x-show="active === 2">Content 2</div>
  </div>
</div>
```

### Counter
```html
<div x-data="{ count: 0 }">
  <button @click="count--">-</button>
  <span x-text="count"></span>
  <button @click="count++">+</button>
</div>
```

## Magic Properties

```html
<!-- $el - current element -->
<button @click="$el.classList.toggle('active')">Toggle class</button>

<!-- $refs - access x-ref elements -->
<input x-ref="input">
<button @click="$refs.input.focus()">Focus</button>

<!-- $watch - watch for changes -->
<div x-data="{ count: 0 }" x-init="$watch('count', value => console.log(value))">

<!-- $nextTick - after DOM update -->
<button @click="items.push('new'); $nextTick(() => scrollToBottom())">Add</button>
```

## Version

3.14.8
