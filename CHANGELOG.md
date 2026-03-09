# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Changed
- Rename spec.md to content.md and design.md to technical.md across all files
- Rename example project files (spec.md -> content.md, design.md -> technical.md)
- Update all documentation references (guides, docker docs, file requirements, README)
- Update AGENTS.md and module prompts with new file names

### Added
- Global modules style guide at modules/README.md
- Image post-processing guide at modules/images/processing/README.md

### Changed
- Unified module README structure and bilingual layout
- Normalized asset paths to assets/css, assets/js, assets/icons, assets/images
- Refined framework examples and README setup to match build asset layout
- Updated examples README to reference modules paths and asset layout
- Added requirements section to user guides (RU/EN)
- Aligned file requirements assets list with icons/fonts and fixed normalize path
- Updated docs to use modules/master.md and modules/iterations.md paths consistently

### Changed
- Move master.md and iterations.md into modules/ directory
- Remove Docker files (Dockerfile, docker-compose.yml, .dockerignore, docker/)
- Update AGENTS.md: remove Docker section, update project structure
- Repository is now a content-only submodule (Docker managed by PageForge)
- Updated llm-imager integration: all commands now use `generate` subcommand (e.g. `llm-imager generate -p "..." -o file.jpg`)
- Updated llm-imager examples to prefer `--aspect-ratio` over `--size` where applicable
- Added new llm-imager flags to `modules/images/README.md`: `--aspect-ratio`, `--steps`, `--provider`
- Added models table to `modules/images/README.md` with all supported providers and their capabilities

### Added
- File requirements documentation (`docs/file-requirements-ru.md`, `docs/file-requirements-en.md`) describing spec.md, design.md, and task.md structure

### Changed
- entrypoint.sh: add --refine mode for modifying existing versions in-place
- entrypoint.sh: add non-interactive batch mode instruction to prevent agent from asking questions
- entrypoint.sh: add verbose logging (timestamp, prompt, arguments, output file list)
- entrypoint.sh: add write restriction to prompt (only build/ directory allowed)
- entrypoint.sh: rewrite with 3-phase pipeline (pre-copy assets, generate, post-process HTML paths)
- entrypoint.sh: auto-attach to running opencode server for batch mode
- master.md: add explicit self-contained build instructions (no modules/ references in output)
- master.md: update Phase 6 output, Styling, and Checklist sections for asset bundling
- Dockerfile: chmod +x entrypoint.sh during build

### Fixed
- master.md: removed contradictory "Image commands - Shell script" from output phase
- master.md: strengthened script prohibition to include all extensions (.sh, .bat, .ps1) and saving commands to files
- modules/images/README.md: added explicit prohibition against creating script files for image generation

### Changed
- Restructured `projects/` directory: each project now has `specs/` (input) and `build/` (output) subdirectories
- Project folder naming convention: `id_project-name` (e.g. `001_cleaning-service`)
- Updated `docker/entrypoint.sh` to use new project structure (`specs/` for input, `build/` for output)
- Updated `docker-compose.yml`: single `projects/` volume mount instead of separate `projects/` and `build/`
- Updated `.gitignore`: track `projects/*/specs/`, ignore `projects/*/build/`
- Updated all documentation (guides, Docker docs) to reflect new project structure
- Docker docs: added web panel workflow with LLM provider configuration (OpenAI, Anthropic, GitHub Copilot)
- Docker: mount `.llm-imager.yaml` from repo root into container for image generation

### Added
- API usage documentation in Docker guides (EN + RU): endpoints, curl examples, JS SDK

### Fixed
- `docker/entrypoint.sh`: removed broken stdout redirect, LLM now writes files through its tools

### Removed
- `scripts/api-generate.sh`, `scripts/api-test.sh` — redundant, web UI covers all scenarios
- Test project `projects/001_test-landing/`

### Added
- New example: Bosch appliance repair Palo Alto (`examples/bosch/`)
- New example: Apartment renovation multipage site (`examples/apartment-renovation/`)
- New example: Cleaning service landing (`examples/cleaning-service/`)
- New example: Food delivery landing (`examples/food-delivery/`)

### Changed
- master.md: Fixed instructions to run llm-imager directly instead of creating scripts
- master.md: Added explicit "NEVER create shell scripts" instruction
- docs/guide-en.md, docs/guide-ru.md: Updated image generation instructions

### Removed
- Deleted obsolete shell scripts: scripts/fix-contrast.sh, scripts/normalize-colors.sh, test-frameworks.sh

### Added
- Generated Electrolux Roseville appliance repair landing page in `build/electrolux-roseville/sonnet/`
- Full landing page with sections: navbar, hero, 16 service cards, why-us, 10 reviews, trust, common-issues accordion, about-brand, 11-item FAQ, CTA, service-areas, footer
- Ocean Trust color palette with Bootstrap 5 framework and Inter font
- Custom CSS with scroll-reveal animations, hover-lift cards, gradient hero
- SEO meta tags, Open Graph, Schema.org ProfessionalService and BreadcrumbList
- sitemap.xml and robots.txt
- 4 color variants: executive-green, medical-trust, fresh-market, carbon-dark
- Generated QuickFood food delivery landing page in `build/food-delivery/sonnet/`
- Full landing with sections: navbar, hero-split, categories, popular dishes, benefits, how-it-works, promotions, testimonials, app-download, footer
- Custom color palette (red #EF4444, orange #F97316, yellow #FCD34D) applied with proper contrast
- Tailwind-compatible CSS with Poppins/Inter fonts via Google Fonts
- SEO meta tags, Open Graph, Schema.org FoodEstablishment and Service structured data
- Scroll fade-in animations, floating hero image, pulse CTA button, hover scale on category cards
- Cart toast notification for add-to-cart interaction
- 12 images generated with llm-imager (hero, 4 dishes, 4 icons, delivery, app mockup, promo banner)
- Generated CleanPro cleaning service landing page in `build/cleaning-service/sonnet/`
- Full landing page with all sections: navbar, hero, features, services, pricing, process, team, testimonials, FAQ, CTA, contact form, footer
- Fresh Market palette applied with proper contrast (heading: #111827, text: #374151)
- Bulma CSS framework with Montserrat/Open Sans fonts
- SEO meta tags, Open Graph, Schema.org LocalBusiness structured data
- Image placeholders for hero, service icons, and team photo generated with llm-imager
- OpenCode CLI documentation in user guides (Russian and English)

### Added
- `modules/colors/base.css` - ready-to-use CSS template for all palettes with correct contrast
- Standard text colors definition (heading: #111827, text: #374151) for all palettes

### Changed
- generate-examples.sh now generates images directly with llm-imager instead of creating generate-images.sh script
- modules/images/README.md updated to run llm-imager directly instead of creating scripts
- Palettes now explicitly require neutral heading/text colors
- master.md: LLM must start from base.css when setting up colors
- Updated Fresh Market palette with full color specification
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
- Content generation syntax `[generate: ...]` for creating text content (services, FAQ, testimonials, CTA, meta descriptions)
- Simplified README.md with quick start examples and links to documentation
- Added text generation rules to master.md
- Added animation changes type to iterations.md
- Clarified that llm-imager only creates images, convert for processing
- Restructured project: moved all modules to `modules/` directory
- Added 3 example projects: cleaning-service, apartment-renovation, food-delivery
- Added generate-examples.sh script for batch site generation
