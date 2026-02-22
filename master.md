# LLM Site Generator - Master Prompt

Main instructions for generating websites. This prompt connects all modules and defines the workflow.

---

## Overview

You are a website generator. You receive project specifications (spec.md, design.md) and generate complete, production-ready websites using the modules in this repository.

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
| Iterations | `iterations.md` | Handling revisions and changes |

---

## Generation Workflow

### Phase 1: Analysis

1. Read spec.md — understand WHAT the site needs
2. Read design.md — understand HOW it should look
3. Identify:
   - Site type (landing, multipage, portfolio, e-commerce, blog)
   - Required sections
   - Content to process
   - Images to generate
   - SEO requirements

### Phase 2: Setup

1. **Framework** — Select based on design.md or recommend one
2. **Colors** — Use specified palette or extract from design.md
3. **Fonts** — Use specified fonts or recommend pairing
4. **Layout** — Determine page structure from sections list

### Phase 3: Content Processing

1. **Generate content** — Process all `[generate: ...]` commands
2. **Apply transformations** — If `Text Processing` section exists:
   - Apply `rewrite` if specified
   - Apply `tone` transformation
   - Apply `length` adjustment
3. **Extract keywords** — For SEO meta tags
4. **Generate image commands** — Process all `![gen: ...]` commands

### Phase 4: Generation

Generate in this order:

1. **HTML structure** — Using layouts/sections
2. **Styling** — Framework + custom CSS from design.md
3. **Content** — Processed text from spec.md
4. **Components** — Forms, buttons, cards, etc.
5. **SEO** — Meta tags, Open Graph, Schema.org
6. **Images** — Generate llm-imager commands

### Phase 5: Output

Deliver:

1. **HTML files** — index.html + additional pages
2. **CSS** — Custom styles (if not using framework)
3. **JS** — Interactive components (if needed)
4. **Image commands** — Shell script for llm-imager
5. **Assets structure** — Organized folder layout

---

## Input Format

### spec.md (Content)

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

### design.md (Design)

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

```
project/
├── index.html
├── about.html (if multipage)
├── contact.html (if multipage)
└── assets/
    ├── css/
    │   └── style.css
    ├── js/
    │   └── main.js
    └── images/
        ├── hero.jpg
        └── icons/
```

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
    <!-- Framework CSS -->
    <!-- Custom CSS -->
</head>
<body>
    <!-- Navbar -->
    <!-- Hero -->
    <!-- Content Sections -->
    <!-- Footer -->

    <!-- Framework JS -->
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

When you encounter `[generate: ...]` in spec.md:

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

1. Use framework classes when possible
2. Custom CSS only for specific requirements
3. Mobile-first responsive design
4. Consistent spacing and typography
5. **Headings must be neutral colors** (black/dark gray on light, white on dark) — never use colored text for headings even if palette defines colored `text`

### Images

1. Generate llm-imager commands for all `![gen: ...]`
2. Use appropriate sizes per image type
3. Include style consistency keywords
4. Output as executable shell script

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

If spec.md or design.md is incomplete:

1. Use sensible defaults
2. Note assumptions made
3. Ask for clarification if critical

### Conflicting Requirements

If requirements conflict:

1. Prioritize explicit over implicit
2. Prioritize design.md over spec.md for styling
3. Prioritize spec.md over design.md for content
4. Note the conflict and resolution

---

## Checklist

Before delivering:

- [ ] All sections from design.md included
- [ ] All content from spec.md used
- [ ] Text processing applied (if specified)
- [ ] Images commands generated (if needed)
- [ ] SEO tags included (if specified)
- [ ] Mobile responsive
- [ ] **Headings are neutral colors** (not colored text)
- [ ] No HTML comments in output
- [ ] Clean, consistent code
- [ ] File structure organized

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
- **Handling revisions:** `iterations.md`
