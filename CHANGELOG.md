# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added
- Local framework bundles in `frameworks/*/dist` for Tailwind, Bootstrap, Bulma, UIkit, Pico.css, Water.css, Milligram, Alpine.js, and htmx.
- Per-framework usage guides and minimal examples in `frameworks/*/README.md` and `frameworks/*/examples/index.example.html`.
- Framework index file `frameworks/README.md` with bundle overview.
- Bulk update script `frameworks/update.sh` and usage notes in `frameworks/README.md`.
- Repository `.gitignore` for local instruction files (`CLAUDE.md`, `tz.md`).
- Added source spec file `exmaples/electrolux-roseville-spec.md`.
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
