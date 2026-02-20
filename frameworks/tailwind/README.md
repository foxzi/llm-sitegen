# Tailwind (local static bundle)

Minimal local Tailwind setup without CLI/build tools.

## Structure

- `dist/tailwind.css` - pre-downloaded Tailwind CSS file (local copy)
- `examples/index.example.html` - minimal usage example

## How to use in your site

1. Copy or reference `frameworks/tailwind/dist/tailwind.css` from your page.
2. Add stylesheet in HTML:

```html
<link rel="stylesheet" href="./tailwind.css" />
```

## Notes

- No local Tailwind compiler is included.
- Minification/post-processing is handled separately in your pipeline.
- If you need to update Tailwind version, replace `dist/tailwind.css` with a new local file.

## Current source file

- Downloaded from: `https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.css`
