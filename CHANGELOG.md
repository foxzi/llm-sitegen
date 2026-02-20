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
