# LLM Site Generator Toolkit

A collection of web assets and LLM-friendly prompts for generating complete websites. Each directory contains ready-to-use templates with comprehensive documentation that serves as context for LLMs.

## Structure

```
llm-sitegen/
  frameworks/     # CSS/JS framework bundles (Tailwind, Bootstrap, etc.)
  colors/         # Color palette presets
  fonts/          # Typography collection (Google Fonts, woff2)
  icons/          # SVG icon sets (Heroicons, Feather, Lucide, etc.)
  layouts/        # Page and section templates
  components/     # UI components (buttons, cards, forms, etc.)
  animations/     # CSS animations and transitions
  seo/            # Meta tags, Open Graph, Schema.org templates
```

## Quick Start

1. Choose a framework from `frameworks/`
2. Select a color palette from `colors/`
3. Pick fonts from `fonts/`
4. Use layouts from `layouts/` as page structure
5. Add components from `components/`
6. Apply animations from `animations/`
7. Configure SEO from `seo/`

## Directory Overview

### frameworks/
CSS and JavaScript framework bundles with local distribution files. Includes Tailwind CSS, Bootstrap, Bulma, UIkit, Pico.css, Water.css, Milligram, Alpine.js, htmx.

### colors/
35+ named color palettes organized by project type: corporate, creative, e-commerce, health, tech, nature, food, finance, education, entertainment.

### fonts/
16 Google Fonts in woff2 format with font pairing recommendations. Includes serif, sans-serif, display, and monospace families.

### icons/
6 icon sets with 15,000+ SVG icons: Heroicons, Feather, Lucide, Bootstrap Icons, Tabler, Phosphor.

### layouts/
HTML templates for sections (navbar, hero, features, pricing, testimonials, FAQ, team, stats, CTA, contact, footer) and complete pages (landing, blog, dashboard, portfolio, e-commerce, auth, etc.).

### components/
Standalone UI components: buttons, cards, forms, modals, alerts, badges, tabs, dropdowns, avatars, loaders, tooltips.

### animations/
CSS animations: transitions, keyframes, hover effects, scroll-triggered animations, text effects.

### seo/
SEO templates: meta tags, Open Graph, Twitter Cards, favicons, robots.txt, sitemap.xml, Schema.org JSON-LD (organization, product, article, FAQ, review, etc.).

## Usage with LLM

Each directory contains a `README.md` that serves as an LLM prompt. When generating a website:

1. Provide the relevant README.md files as context
2. Describe the desired website
3. LLM will use the templates and guidelines to generate code

Example prompt structure:
```
Context: [contents of frameworks/README.md]
Context: [contents of colors/README.md]
Context: [contents of layouts/README.md]

Task: Create a landing page for a SaaS product...
```

## Design Principles

- **Standalone files**: Each template is self-contained with embedded CSS
- **No external dependencies**: Works offline, no CDN required
- **Framework-agnostic**: Templates work with any CSS framework
- **Copy-paste ready**: Code can be used directly without modification
- **LLM-optimized**: Documentation structured for AI comprehension

## License

MIT
