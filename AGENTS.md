# AGENTS.md

Instructions for AI coding agents operating in this repository.

## Project Overview

LLM Site Generator Toolkit — a collection of Markdown prompts, HTML/CSS templates,
fonts, icons, and frameworks for generating websites with LLMs. This is NOT a
traditional software application. There is no runtime, no package.json, no compiled code.

Key content: `master.md` (main LLM prompt), `modules/` (all templates and assets),
`examples/` (sample projects with spec.md + design.md), `docs/` (guides).

## Build and Run

### Docker (primary way to run)

```bash
# Build the image
docker compose build

# Run site generation (requires spec.md and design.md mounted)
docker compose up
```

Always use `docker compose` (space), NEVER `docker-compose` (hyphen).
Use Docker containers when installing dependencies or heavy tooling.

### No Build/Lint/Test Pipeline

There is no package manager, no linter, no test runner, no CI pipeline.
There are no unit tests or integration tests.

### Visual Testing

Use Playwright MCP for page and design verification:
- Open generated HTML in browser via Playwright
- Take screenshots to verify layout and design
- Check color contrast and responsiveness

### HTTP Requests

Use `curl` or `wget` for any HTTP operations. No other HTTP tools.

## Git Rules

### Commit Messages
- English only
- Imperative mood, verb-first: `Add`, `Fix`, `Update`, `Remove`, `Move`
- Concise: max 15 lines total (title + body)
- No emojis, no special characters
- No `Co-Authored-By` or `Generated with` trailers

### Commit Discipline
- Atomic commits: each commit solves exactly one task
- NEVER run `git reset` in any form (soft, hard, mixed)
- NEVER commit `CLAUDE.md` or `tz.md` (both are in .gitignore)
- Update `CHANGELOG.md` `[Unreleased]` section with EVERY commit

### CHANGELOG.md Format

Use categories under `## [Unreleased]`:
```markdown
### Added
- Description of new feature or file

### Changed
- Description of modification

### Removed
- Description of what was deleted
```

## Code Style

### General Principles
- KISS: Keep It Simple, Stupid
- Never write speculative code that is not needed for the current task
- Never fabricate information; say you do not know or ask a question

### File and Directory Naming
- `kebab-case` for all files and directories: `hero-centered.html`, `cleaning-service/`

### Markdown (primary language of this repo)
- Structured headings with `##` and `###`
- Tables for reference data
- Code blocks with language tags
- Checklists for validation steps

### HTML Templates
- Standalone files with embedded `<style>` and `<script>` blocks
- Semantic HTML5 elements (`<nav>`, `<main>`, `<section>`, `<footer>`)
- BEM-like class naming: `card-body`, `form-input`, `hero-centered`
- Inline SVG for icons (no external icon requests)
- All assets must be local (offline-first, no CDN links)

### CSS
- CSS custom properties with `--kebab-case`: `--color-primary`, `--font-heading`
- Start from `modules/colors/base.css` for color setup
- 4-space indentation
- Comment blocks with `/* ... */`

### Shell Scripts (Bash)
- Strict mode: `set -euo pipefail`
- `snake_case` variable names: `spec_dir`, `output_dir`
- Explicit error checks with `if [[ ... ]]` and meaningful exit codes
- Comments in English

### Docker
- Base image: `node:22-slim`
- Always use `docker compose` (not `docker-compose`)

## Documentation

- Format: Markdown only
- Language: bilingual — Russian AND English versions required
- Location: all docs in `docs/` directory, except `README.md` which stays at root
- README.md itself is bilingual (Russian + English in one file)

## Project Structure

```
llm-sitegen/
  master.md              # Main LLM generation prompt
  iterations.md          # Revision handling prompt
  modules/
    layouts/             # Section and page HTML templates
    frameworks/          # CSS/JS frameworks (Tailwind, Bootstrap, Bulma, etc.)
    colors/              # Color palettes and base.css
    fonts/               # 16 Google Fonts in woff2 (local)
    icons/               # 15,000+ SVG icons from 6 sets
    components/          # UI component templates (buttons, cards, forms, etc.)
    animations/          # CSS animation templates
    seo/                 # Meta tags, Open Graph, Schema.org, keywords
    content/             # Text processing instructions
    images/              # Image generation with llm-imager
    normalize/           # Post-generation color contrast fixes
  projects/              # User projects
    001_project-name/    # Project folder: id_name
      specs/             # Input: spec.md, design.md, task.md
      build/             # Output: generated site (gitignored)
  examples/              # Sample projects (spec.md + design.md pairs)
  docs/                  # User guides (RU + EN)
  docker/                # Docker entrypoint script
  build/                 # Legacy generated output (gitignored)
  Dockerfile
  docker-compose.yml
  CHANGELOG.md
```

## Module Conventions

Each module in `modules/` follows the same pattern:
- `README.md` — LLM-oriented prompt with usage instructions and examples
- HTML files — standalone templates with embedded CSS/JS
- Assets stored locally (fonts as woff2, icons as SVG, frameworks as dist bundles)

## Generation Workflow (for reference)

1. Read `spec.md` (content) and `design.md` (visual design)
2. Select framework, colors, fonts, layout from `modules/`
3. Process content: `[generate: ...]` commands and text transformations
4. Generate images with `llm-imager` (never create shell scripts for this)
5. Assemble HTML with SEO meta tags and Schema.org markup
6. Normalize colors and verify contrast
7. Output to project's `build/` directory (`projects/<id>_<name>/build/`)
