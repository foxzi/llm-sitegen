# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added
- Local framework bundles in `frameworks/*/dist` for Tailwind, Bootstrap, Bulma, UIkit, Pico.css, Water.css, Milligram, Alpine.js, and htmx.
- Per-framework usage guides and minimal examples in `frameworks/*/README.md` and `frameworks/*/examples/index.example.html`.
- Framework index file `frameworks/README.md` with bundle overview.
- Bulk update script `frameworks/update.sh` and usage notes in `frameworks/README.md`.
- Repository `.gitignore` for local instruction files (`CLAUDE.md`, `tz.md`).
- Added source spec file `examples/electrolux-roseville/spec.md`.
- Converted all framework README files to LLM-friendly prompts with usage instructions.
- Main `frameworks/README.md` now serves as LLM routing prompt for framework selection.
- Color palettes collection in `colors/README.md` with 35+ named schemes for different project types.
- Local font collection in `fonts/` with 16 Google Fonts (woff2 format).
- Typography preprompt `fonts/README.md` with font pairings and usage guide.
- Font preview page `fonts/index.html` with all fonts and pairing examples.
- Font download script `fonts/download.sh` for updating fonts from Google Fonts.
- SVG icon collection in `icons/` with 6 icon sets (15000+ icons total).
- Icon sets: Heroicons, Feather, Lucide, Bootstrap Icons, Tabler, Phosphor.
- Icons preprompt `icons/README.md` with usage guide and selection recommendations.
- Icon preview page `icons/index.html` with search and style switching.
- Icon download script `icons/download.sh` for updating icon sets.
- HTML layout templates in `layouts/` with sections and full page templates.
- Section templates: navbar, hero (2 variants), features, pricing, testimonials, FAQ, team, stats, CTA, contact form, footer.
- Page templates: landing page, blog post, dashboard, portfolio.
- Additional page templates: lead-gen, click-through, coming-soon, product-listing, product-detail, cart, about, services, 404, login, pricing, careers.
- Page Details section in layouts README with detailed descriptions for all 16 page templates.
- SEO/Meta templates collection in `seo/` directory.
- Meta tags template with essential and advanced options.
- Open Graph templates for Facebook/LinkedIn sharing.
- Twitter Cards templates for all card types.
- Favicon setup template with manifest and browserconfig.
- robots.txt templates for various use cases.
- sitemap.xml template with images and video support.
- Schema.org JSON-LD templates: organization, local-business, website, article, product, faq, breadcrumb, person, review, service.
- SEO preprompt with validation tools and checklists.
- UI components collection in `components/` directory.
- Component templates: buttons, cards, forms, modals, alerts, badges, tabs, dropdowns, avatars, loaders, tooltips.
- Components preprompt with quick reference and customization guide.
- Layouts preprompt `layouts/README.md` with usage guide and customization instructions.
- Layout preview page `layouts/index.html` with live iframe previews.
- CSS animations collection in `animations/` directory.
- Animation templates: transitions, keyframes, hover effects, scroll-triggered, text effects.
- Animations preprompt with quick reference and best practices.
- Main README.md with project overview and usage guide.
- Added `build/` to .gitignore (generated output not tracked)
- Project structure for examples with separate spec.md and design.md files
- Examples README with structure documentation
- Surface Pairs documentation in colors/README.md for contrast handling
- CSS variables for surface pairs in example templates
- Fix: CTA section text contrast in all Bulma color variants
- Keywords extraction guide `seo/keywords.md` with LLM instructions for extracting and generating SEO keywords from project specs
- Content processing module `content/` with text transformation instructions (rewrite, tone, length)
- User guide documentation in `docs/` (Russian and English versions)
- Image generation module `images/` with llm-imager CLI instructions
- Image processing instructions with ImageMagick convert (resize, crop, optimize, format conversion)
- Inline image generation syntax `![gen: description](file.jpg size)` for spec.md
- Iterations and revisions preprompt `iterations.md` with LLM instructions for handling changes
- Revisions section in user guides (Russian and English)
- Master prompt `master.md` connecting all modules with workflow and decision trees
- CLI usage examples for Claude Code and Codex in user guides
