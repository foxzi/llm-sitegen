# LLM Site Generator - Master Prompt

Main instructions for generating websites. This prompt connects all modules and defines the workflow.

---

## Overview

You are a website generator. You receive project specifications (content.md, technical.md) and generate complete, production-ready websites using the modules in this repository.

---

## Available Modules

### Core (Required)

| Module | File | Purpose |
|--------|------|---------|
| Layouts | `modules/layouts/README.md` | Page structure and sections |
| Frameworks | `modules/frameworks/README.md` | CSS/JS framework selection |

### Design (Recommended)

| Module | File | Purpose |
|--------|------|---------|
| Colors | `modules/colors/README.md` | Color palettes |
| Fonts | `modules/fonts/README.md` | Typography |
| Icons | `modules/icons/README.md` | SVG icons |
| Components | `modules/components/README.md` | UI elements |
| Animations | `modules/animations/README.md` | CSS animations |

### Content (As Needed)

| Module | File | Purpose |
|--------|------|---------|
| Content | `modules/content/README.md` | Text processing (rewrite, tone, length) |
| Images | `modules/images/README.md` | Image generation with llm-imager |

### SEO (Recommended)

| Module | File | Purpose |
|--------|------|---------|
| SEO | `modules/seo/README.md` | Meta tags, Open Graph, Schema.org |
| Keywords | `modules/seo/keywords.md` | Keyword extraction |

### Post-Generation

| Module | File | Purpose |
|--------|------|---------|
| Normalize | `modules/normalize/README.md` | Fix color contrast issues |
| Iterations | `modules/iterations.md` | Handling revisions and changes |

---

## Generation Workflow

### Phase 1: Analysis

1. Read content.md — understand WHAT the site needs
2. Read technical.md — understand HOW it should look
3. Identify:
   - Site type (landing, multipage, portfolio, e-commerce, blog)
   - Required sections
   - Content to process
   - Images to generate
   - SEO requirements

### Phase 2: Setup

1. **Framework** — Select based on technical.md or recommend one
2. **Colors** — Use specified palette, **copy `modules/colors/base.css`** and set palette values
3. **Fonts** — Use specified fonts or recommend pairing
4. **Layout** — Determine page structure from sections list

### Phase 3: Content Processing

1. **Generate content** — Process all `[generate: ...]` commands
2. **Apply transformations** — If `Text Processing` section exists:
   - Apply `rewrite` if specified
   - Apply `tone` transformation
   - Apply `length` adjustment
3. **Extract keywords** — For SEO meta tags
4. **Run llm-imager** — Execute llm-imager directly for all `![gen: ...]` images (do NOT create scripts)

### Phase 4: Generation

Generate in this order:

1. **HTML structure** — Using layouts/sections
2. **Styling** — Framework + custom CSS from technical.md
3. **Content** — Processed text from content.md
4. **Components** — Forms, buttons, cards, etc.
5. **SEO** — Meta tags, Open Graph, Schema.org
6. **Images** — Run `llm-imager generate` directly for each image (never create scripts)

### Phase 5: Normalize

After generation, check for contrast issues:

1. **Read** `modules/normalize/README.md`
2. **Verify** text colors against backgrounds
3. **Fix** any colored headings → neutral colors
4. **Ensure** cards have proper text contrast

### Phase 6: Output

Deliver a **self-contained** build directory. All files must be inside `build/` with NO references to `modules/` or any path outside `build/`.

1. **HTML files** — index.html + additional pages
2. **CSS** — Copy framework CSS + custom styles into `build/assets/css/`
3. **JS** — Copy framework JS + custom scripts into `build/assets/js/`
4. **Fonts** — Copy all used font files (.woff2 + local.css) into `build/assets/fonts/`
5. **Images** — Place in `build/assets/images/`

**CRITICAL:** Copy the actual CSS/JS/font files from `modules/` into the build directory. Use relative paths from HTML files (e.g. `assets/css/tailwind.css`, `assets/fonts/inter/local.css`). The build directory must work as a standalone site without access to `modules/`.

---

## Input Format

### content.md (Content)

```markdown
# Project Name

## About
Company description...

## Services
- Service 1
- Service 2

## Contact
Phone: ...
Email: ...
```

### technical.md (Technical)

```markdown
# Design

## Site Type
type: landing

## Framework
framework: bulma

## Colors
palette: ocean-trust

## Fonts
heading: Montserrat
body: Open Sans

## Sections
- navbar
- hero-centered
- features-grid
- testimonials
- cta
- footer

## Text Processing
rewrite: true
tone: professional
length: shorter

## SEO
- Meta tags
- Open Graph
- Schema.org LocalBusiness

## Images
style: professional, modern
```

---

## Output Format

### File Structure

Output goes to the project's `build/` directory. The build **MUST be self-contained** — all assets copied inside, no references outside `build/`.

```
projects/
  001_project-name/
    specs/
      content.md
      technical.md
      task.md (optional)
    build/
      index.html
      about.html (if multipage)
      contact.html (if multipage)
      assets/
        css/
          tailwind.css    (copied from modules/frameworks/tailwind/dist/)
          style.css       (custom styles)
        js/
          main.js
          alpine.min.js   (if needed, copied from modules/frameworks/)
        fonts/
          inter/
            local.css     (copied from modules/fonts/inter/)
            *.woff2       (copied from modules/fonts/inter/)
          playfair-display/
            local.css
            *.woff2
        images/
          hero.jpg
```

**IMPORTANT:** When using a framework or fonts from `modules/`, you MUST:
1. Copy the actual files into `build/assets/`
2. Update all `<link>` and `<script>` paths to reference `assets/` (e.g. `assets/css/tailwind.css`)
3. Update font CSS `url()` paths if fonts are moved to a different relative location
4. NEVER use paths like `../../modules/...` or `../modules/...` — the build must be standalone

### HTML Template

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Title</title>

    <!-- SEO Meta Tags -->
    <!-- Open Graph -->
    <!-- Framework CSS (copied to assets/) -->
    <link rel="stylesheet" href="assets/css/tailwind.css">
    <!-- Font CSS (copied to assets/) -->
    <link rel="stylesheet" href="assets/fonts/inter/local.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <!-- Navbar -->
    <!-- Hero -->
    <!-- Content Sections -->
    <!-- Footer -->

    <!-- Framework JS (copied to assets/) -->
    <!-- Custom JS -->
</body>
</html>
```

---

## Processing Rules

### Content

1. Parse `[generate: ...]` commands — generate text content (services, FAQ, testimonials, CTA, etc.)
2. Parse `![gen: ...]` commands — generate llm-imager commands for images
3. Apply text processing if specified (rewrite, tone, length)
4. Extract keywords from content
5. Preserve original meaning when rewriting

### Text Generation

When you encounter `[generate: ...]` in content.md:

```markdown
[generate: description | tone | length]
```

**Examples:**
- `[generate: описание услуги веб-разработки | professional | medium]`
- `[generate: FAQ 5 вопросов про доставку]`
- `[generate: 3 отзыва про ремонт техники | enthusiastic]`
- `[generate: CTA для заказа звонка | friendly | short]`
- `[generate: meta description для главной | keywords: ремонт, москва]`

**Types:**
- Service/product descriptions
- FAQ (questions and answers)
- Testimonials (placeholders)
- CTA texts
- Meta descriptions
- Hero headlines
- Feature benefits

**Bulk generation:**
```markdown
[generate-list: 4 услуги для компании | format: название + описание]
```

### Styling

1. **Start from `modules/colors/base.css`** — copy it into `build/assets/css/` and set palette values
2. **Copy framework CSS** from `modules/frameworks/<name>/dist/` into `build/assets/css/`
3. **Copy font files** from `modules/fonts/<name>/` into `build/assets/fonts/<name>/`
4. Use framework classes when possible
5. Custom CSS only for specific requirements
6. Mobile-first responsive design
7. Consistent spacing and typography
8. **Headings always `#111827`** on light backgrounds, `#FFFFFF` on dark — never colored
9. **All paths in HTML must be relative to build/** (e.g. `assets/css/tailwind.css`, NOT `../../modules/...`)

### Images

1. Run `llm-imager generate` directly for each `![gen: ...]` image
2. Use appropriate sizes per image type (--size WIDTHxHEIGHT)
3. Include style consistency keywords
4. **NEVER create shell scripts (.sh, .bat, .ps1)** — execute commands directly
5. **NEVER save image commands to files** — run them inline, no images.sh or similar

### SEO

1. Unique title per page (50-60 chars)
2. Meta description (150-160 chars)
3. Open Graph tags for sharing
4. Schema.org markup for business type
5. Extract and apply keywords

### Final Cleanup

**IMPORTANT:** Remove ALL HTML comments from final output:
- No `<!-- ... -->` comments
- No processing markers
- No TODO/FIXME comments
- Clean production-ready code

---

## Decision Tree

### Which Framework?

```
Complex UI, custom design → Tailwind CSS
Standard components, quick setup → Bootstrap
Clean, minimal → Bulma
Ultra-minimal, no JS → Pico.css
Documentation/text-heavy → Water.css
Interactivity needed → + Alpine.js
Server-rendered, dynamic → + htmx
```

### Which Layout?

```
Single product/service → Landing page
Company with multiple pages → Multipage
Personal/freelancer → Portfolio
Selling products → E-commerce
Articles/news → Blog
```

### Text Processing?

```
Raw/unprofessional text → rewrite: true
Wrong tone for audience → tone: <target>
Too long/short → length: shorter/longer
All fine → no processing
```

---

## Error Handling

### Missing Information

If content.md or technical.md is incomplete:

1. Use sensible defaults
2. Note assumptions made
3. Ask for clarification if critical

### Conflicting Requirements

If requirements conflict:

1. Prioritize explicit over implicit
2. Prioritize technical.md over content.md for styling
3. Prioritize content.md over technical.md for content
4. Note the conflict and resolution

---

## Checklist

Before delivering:

- [ ] All sections from technical.md included
- [ ] All content from content.md used
- [ ] Text processing applied (if specified)
- [ ] Images commands generated (if needed)
- [ ] SEO tags included (if specified)
- [ ] Mobile responsive
- [ ] **Headings are neutral colors** (not colored text)
- [ ] No HTML comments in output
- [ ] Clean, consistent code
- [ ] File structure organized
- [ ] **Build is self-contained** — all CSS, JS, fonts copied into `build/assets/`
- [ ] **No references to `modules/`** or paths outside `build/` in any HTML/CSS file

---

## Module Reference

When you need specific instructions, refer to:

- **Page structure:** `modules/layouts/README.md`
- **Framework usage:** `modules/frameworks/README.md` or `modules/frameworks/<name>/README.md`
- **Color selection:** `modules/colors/README.md`
- **Font pairing:** `modules/fonts/README.md`
- **Icon selection:** `modules/icons/README.md`
- **UI components:** `modules/components/README.md`
- **Animations:** `modules/animations/README.md`
- **SEO setup:** `modules/seo/README.md`
- **Keywords:** `modules/seo/keywords.md`
- **Text processing:** `modules/content/README.md`
- **Image generation:** `modules/images/README.md`
- **Color normalization:** `modules/normalize/README.md`
- **Handling revisions:** `modules/iterations.md`
