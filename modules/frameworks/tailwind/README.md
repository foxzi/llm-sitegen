# Tailwind CSS - LLM Instructions

## Files

- `dist/tailwind.css` - include this file in HTML

## HTML Setup

```html
<link rel="stylesheet" href="./dist/tailwind.css" />
```

## Core Concepts

Tailwind uses utility classes directly in HTML. No custom CSS needed.

## Layout

### Container
```html
<div class="container mx-auto px-4">
  <!-- Centered content with padding -->
</div>
```

### Flexbox
```html
<!-- Horizontal layout -->
<div class="flex items-center justify-between">
  <div>Left</div>
  <div>Right</div>
</div>

<!-- Vertical layout -->
<div class="flex flex-col space-y-4">
  <div>Item 1</div>
  <div>Item 2</div>
</div>

<!-- Center everything -->
<div class="flex items-center justify-center h-screen">
  <div>Centered</div>
</div>
```

### Grid
```html
<!-- 3 columns -->
<div class="grid grid-cols-3 gap-4">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>

<!-- Responsive: 1 col mobile, 2 tablet, 4 desktop -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
  <div>Item</div>
</div>
```

## Spacing

### Padding
```html
<div class="p-4">All sides</div>
<div class="px-4 py-2">Horizontal 4, vertical 2</div>
<div class="pt-6 pr-4 pb-8 pl-2">Individual sides</div>
```

### Margin
```html
<div class="m-4">All sides</div>
<div class="mx-auto">Center horizontally</div>
<div class="mt-8 mb-4">Top and bottom</div>
```

## Typography

```html
<h1 class="text-4xl font-bold">Large heading</h1>
<h2 class="text-2xl font-semibold">Medium heading</h2>
<p class="text-base text-gray-700">Body text</p>
<span class="text-sm text-gray-500">Small text</span>

<!-- Alignment -->
<p class="text-center">Centered</p>
<p class="text-right">Right aligned</p>
```

## Colors

```html
<!-- Background -->
<div class="bg-blue-500">Blue</div>
<div class="bg-gray-100">Light gray</div>
<div class="bg-white">White</div>

<!-- Text -->
<p class="text-red-600">Red text</p>
<p class="text-gray-900">Dark text</p>

<!-- Border -->
<div class="border border-gray-300">Gray border</div>
```

## Responsive Breakpoints

- `sm:` - 640px+
- `md:` - 768px+
- `lg:` - 1024px+
- `xl:` - 1280px+

```html
<!-- Width changes per breakpoint -->
<div class="w-full md:w-1/2 lg:w-1/3">Responsive width</div>

<!-- Hidden on mobile, visible on desktop -->
<div class="hidden md:block">Desktop only</div>

<!-- Visible on mobile, hidden on desktop -->
<div class="block md:hidden">Mobile only</div>
```

## States

```html
<!-- Hover -->
<button class="bg-blue-500 hover:bg-blue-700">Hover me</button>

<!-- Focus -->
<input class="border focus:border-blue-500 focus:ring-2" />

<!-- Active -->
<button class="bg-blue-500 active:bg-blue-800">Click</button>
```

## Common Components

### Button
```html
<button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
  Button
</button>

<!-- Outline button -->
<button class="bg-transparent hover:bg-blue-500 text-blue-700 hover:text-white py-2 px-4 border border-blue-500 rounded">
  Outline
</button>
```

### Card
```html
<div class="bg-white rounded-lg shadow-lg p-6">
  <h3 class="text-xl font-bold mb-2">Card Title</h3>
  <p class="text-gray-700">Card content</p>
</div>
```

### Form Input
```html
<input class="w-full px-3 py-2 border border-gray-300 rounded focus:outline-none focus:border-blue-500"
       type="text" placeholder="Enter text">
```

### Navigation
```html
<nav class="bg-white shadow">
  <div class="container mx-auto px-4">
    <div class="flex justify-between items-center py-4">
      <a href="#" class="text-xl font-bold">Logo</a>
      <div class="flex space-x-4">
        <a href="#" class="text-gray-700 hover:text-blue-500">Home</a>
        <a href="#" class="text-gray-700 hover:text-blue-500">About</a>
        <a href="#" class="text-gray-700 hover:text-blue-500">Contact</a>
      </div>
    </div>
  </div>
</nav>
```

## Dark Mode

```html
<!-- Add class="dark" to html tag to enable -->
<div class="bg-white dark:bg-gray-800">
  <p class="text-gray-900 dark:text-white">Adapts to dark mode</p>
</div>
```

## Size Reference

- `1` = 0.25rem (4px)
- `2` = 0.5rem (8px)
- `4` = 1rem (16px)
- `6` = 1.5rem (24px)
- `8` = 2rem (32px)
- `12` = 3rem (48px)
- `16` = 4rem (64px)

## Version

2.2.19
