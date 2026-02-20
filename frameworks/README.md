# Frameworks

Local framework bundles for static-site generation.

## Convention

Each framework lives in its own folder:

- `frameworks/<name>/dist` - local runtime files to include in site output
- `frameworks/<name>/examples` - minimal usage examples
- `frameworks/<name>/README.md` - usage instructions and source URLs

## Available bundles

- `frameworks/tailwind` - Tailwind CSS (static local CSS file)
- `frameworks/bootstrap` - Bootstrap CSS + JS bundle
- `frameworks/bulma` - Bulma CSS
- `frameworks/uikit` - UIkit CSS + JS + icons
- `frameworks/pico` - Pico.css
- `frameworks/water` - Water.css (light + dark)
- `frameworks/milligram` - Milligram + Normalize
- `frameworks/alpinejs` - Alpine.js
- `frameworks/htmx` - htmx

## Update all local bundles

- Dry run: `./frameworks/update.sh --dry-run`
- Download updates: `./frameworks/update.sh`
