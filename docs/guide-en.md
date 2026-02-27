# LLM Site Generator User Guide

This guide explains how to use the repository to generate websites with LLMs (ChatGPT, Claude, etc.).

## Table of Contents

1. [What is This](#what-is-this)
2. [Quick Start](#quick-start)
3. [Project Structure](#project-structure)
4. [Creating a Task](#creating-a-task)
5. [Site Types](#site-types)
6. [Design Configuration](#design-configuration)
7. [Working with Content](#working-with-content)
8. [Examples](#examples)

---

## What is This

LLM Site Generator is a collection of templates, instructions, and resources for generating websites with AI. Instead of explaining to an LLM how to create websites from scratch, you provide ready-made modules as context, and the AI uses them to generate quality code.

**Benefits:**
- Consistent results
- Ready-made components and sections
- Local fonts and icons (no CDN)
- SEO templates out of the box
- Works offline

---

## Quick Start

### Step 1: Create a project folder

```
projects/
  001_my-project/
    specs/
      spec.md      # Content and requirements
      design.md    # Design and styling
```

### Step 2: Describe the project in spec.md

```markdown
# Project Name

## About
Brief business description...

## Services
- Service 1
- Service 2

## Contact
Phone: +1 555 123-4567
Address: 123 Main St, City
```

### Step 3: Configure design in design.md

```markdown
# Design

## Site Type
type: landing

## Colors
palette: ocean-trust

## Fonts
heading: Montserrat
body: Open Sans
```

### Step 4: Run generation

Provide the LLM with files as context:
- `master.md` — main prompt (connects all modules)
- Your project's `spec.md` and `design.md`

**Optional** (for detailed instructions):
- README.md from needed folders (frameworks, layouts, colors, etc.)

---

## Running Generation

### Claude Code (Anthropic)

```bash
# Basic run
claude -p "$(cat master.md spec.md design.md)

Generate a website according to the specification"

# With additional modules
claude -p "$(cat master.md layouts/README.md colors/README.md spec.md design.md)

Generate a website according to the specification"

# Interactive mode with files
claude
> /read master.md
> /read projects/001_my-project/specs/spec.md
> /read projects/001_my-project/specs/design.md
> Generate a website according to the specification and save to projects/001_my-project/build/

# Output to file
claude -p "$(cat master.md spec.md design.md)

Generate only the HTML code" > projects/001_my-project/build/index.html
```

### Codex (OpenAI)

```bash
# Basic run
codex "$(cat master.md spec.md design.md)

Generate a website according to the specification"

# With model specification
codex --model gpt-4 "$(cat master.md spec.md design.md)

Generate a website according to the specification"

# Interactive mode
codex
> Read files master.md, spec.md, design.md and generate the website
```

### OpenCode

```bash
# Basic run (single prompt)
opencode run "$(cat master.md spec.md design.md)

Generate a website according to the specification"

# With model specification
opencode run --model anthropic/claude-opus-4 "$(cat master.md spec.md design.md)

Generate a website according to the specification"

# With file attachments
opencode run --file master.md --file spec.md --file design.md \
  "Generate a website according to the specification"

# Interactive mode (TUI)
opencode

# Server mode for multiple commands
opencode serve --port 4096
# In another terminal:
opencode run --attach http://localhost:4096 "Generate the website"

# Web interface
opencode web --port 4096
```

**Useful flags:**
- `--model/-m` — specify model (provider/model)
- `--file/-f` — attach file to request
- `--continue/-c` — continue previous session
- `--session/-s` — resume specific session by ID
- `--format json` — output in JSON format

**Available commands:**
- `opencode models` — list available models
- `opencode models anthropic` — filter by provider
- `opencode auth login` — configure API keys

### Example Commands

**Simple landing page:**
```bash
claude -p "$(cat master.md layouts/README.md projects/001_my-site/specs/spec.md projects/001_my-site/specs/design.md)

Generate a landing page and save to projects/001_my-site/build/"
```

**With image generation:**
```bash
claude -p "$(cat master.md modules/images/README.md spec.md design.md)

Generate website and run llm-imager for all images"
```

**Iteration (revisions):**
```bash
claude -p "$(cat iterations.md)

In projects/001_my-site/build/index.html change button color to orange and add FAQ section"
```

### Recommendations

1. **Use master.md** — it contains all instructions and references
2. **Add modules as needed** — no need to include everything at once
3. **Save to project build/** — keep generated files in `projects/<id>_<name>/build/`
4. **Iterate** — use iterations.md for revisions

---

## Project Structure

```
llm-sitegen/
├── master.md          # Main LLM prompt
├── iterations.md      # Handling revisions
├── modules/           # All generation modules
│   ├── frameworks/    # CSS/JS frameworks
│   ├── colors/        # Color palettes
│   ├── fonts/         # Fonts (woff2)
│   ├── icons/         # SVG icons
│   ├── layouts/       # Page and section templates
│   ├── components/    # UI components
│   ├── animations/    # CSS animations
│   ├── seo/           # SEO templates
│   ├── content/       # Text processing & generation
│   └── images/        # Image generation
├── projects/          # User projects
│   └── 001_my-site/   # Project folder: id_name
│       ├── specs/     # Input: spec.md, design.md, task.md
│       └── build/     # Output: generated site
├── examples/          # Example projects (spec.md + design.md)
└── docs/              # Documentation
```

### What to Include as Context

| Task | Context Files |
|------|---------------|
| Choose framework | `modules/frameworks/README.md` |
| Choose colors | `modules/colors/README.md` |
| Choose fonts | `modules/fonts/README.md` |
| Page structure | `modules/layouts/README.md` |
| UI elements | `modules/components/README.md` |
| SEO setup | `modules/seo/README.md` |
| Text processing | `modules/content/README.md` |

---

## Creating a Task

### spec.md file (content)

Describes WHAT will be on the site:

```markdown
# Company Name

## About
Company history, mission, values...

## Services
### Service 1
Service description...

### Service 2
Service description...

## Testimonials
> "Great service!" - John Smith, CEO of Company Inc.

## FAQ
Q: Frequently asked question?
A: Answer to the question.

## Contact
- Phone: +1 555 123-4567
- Email: info@example.com
- Address: 123 Main St, City
```

### design.md file (design)

Describes HOW the site will look:

```markdown
# Design Specification

## Site Type
type: landing
# Options: landing, multipage, portfolio, e-commerce, blog

## Framework
framework: bulma
# Options: tailwind, bootstrap, bulma, uikit, pico, water, milligram

## Colors
palette: ocean-trust
# Or custom:
# primary: #2563EB
# secondary: #1E40AF
# accent: #F59E0B

## Fonts
heading: Montserrat
body: Inter
# Available: see fonts/README.md

## Layout
sections:
  - navbar
  - hero-centered
  - features-grid
  - testimonials
  - pricing-cards
  - cta
  - footer

## SEO
- Meta description
- Open Graph
- Schema.org LocalBusiness
- sitemap.xml
- robots.txt

## Text Processing
rewrite: true
tone: professional
length: shorter
```

---

## Site Types

### Landing Page

Single-page site for a product or service.

```markdown
type: landing

sections:
  - navbar
  - hero
  - features
  - testimonials
  - pricing
  - cta
  - footer
```

### Multipage

Corporate site with multiple pages.

```markdown
type: multipage

pages:
  - index.html: landing
  - about.html: about
  - services.html: services
  - contact.html: contact
```

### Portfolio

Personal site or work portfolio.

```markdown
type: portfolio

sections:
  - navbar
  - hero (with photo)
  - work-grid
  - about
  - contact-form
  - footer
```

### E-commerce

Product catalog with shopping cart.

```markdown
type: e-commerce

pages:
  - index.html: product-listing
  - product.html: product-detail
  - cart.html: cart
```

### Blog

Blog or news site.

```markdown
type: blog

pages:
  - index.html: blog-listing
  - post.html: blog-post
```

---

## Design Configuration

### Color Palettes

There are 35+ ready palettes in `modules/colors/README.md`:

| Category | Example Palettes |
|----------|------------------|
| Corporate | ocean-trust, executive-green, steel-professional |
| Creative | sunset-creative, aurora-dreams, neon-nights |
| Tech | cyber-blue, matrix-green, quantum-purple |
| Nature | forest-calm, ocean-breeze, earth-tones |
| E-commerce | fresh-market, luxury-gold, minimal-mono |

Usage:
```markdown
## Colors
palette: ocean-trust
```

Or custom colors:
```markdown
## Colors
primary: #2563EB
secondary: #1E40AF
accent: #F59E0B
background: #FFFFFF
text: #1F2937
```

### Fonts

There are 16 Google Fonts in `fonts/`. Popular pairings:

| Headings | Body | Style |
|----------|------|-------|
| Montserrat | Open Sans | Modern |
| Playfair Display | Lato | Elegant |
| Roboto | Roboto | Neutral |
| Poppins | Inter | Geometric |

Usage:
```markdown
## Fonts
heading: Montserrat
body: Open Sans
```

### Icons

There are 15,000+ SVG icons from 6 sets in `icons/`:

| Set | Style | Count |
|-----|-------|-------|
| Heroicons | Outline/Solid | 300+ |
| Feather | Thin lines | 280+ |
| Lucide | Consistent | 1000+ |
| Bootstrap | Classic | 1800+ |
| Tabler | Modern | 4000+ |
| Phosphor | 6 styles | 6000+ |

---

## Working with Content

### Text Generation

Generate content directly in spec.md:

```markdown
## Services

### Web Development
[generate: web development service description | professional | medium]

## FAQ
[generate: FAQ 5 questions about delivery and payment]

## Testimonials
[generate: 3 reviews about appliance repair | enthusiastic]
```

**What you can generate:**
- Service and product descriptions
- FAQ (questions and answers)
- Testimonials (placeholders)
- CTA texts
- Meta descriptions
- Hero headlines
- Feature benefits

### Text Processing

If the source text needs to be rewritten or tone adjusted:

```markdown
## Text Processing
rewrite: true        # Rephrase
tone: professional   # Tone
length: shorter      # Shorten
```

**Available tones:**
- `formal` — official, business
- `professional` — expert, competent
- `friendly` — warm, approachable
- `casual` — conversational
- `enthusiastic` — energetic, inspiring
- `confident` — authoritative
- `empathetic` — understanding, caring
- `luxurious` — premium, sophisticated
- `technical` — precise, detailed
- `playful` — fun, lighthearted

**Length:**
- `much_shorter` — 25-30% of original
- `shorter` — 50-60%
- `same` — no change
- `longer` — 150-170%
- `much_longer` — 200-250%

### Keywords (SEO)

LLM will automatically extract keywords from text. You can specify additional ones:

```markdown
## Keywords
- appliance repair
- washing machine repair near me
- emergency refrigerator service
```

---

## Examples

### Example 1: Service Landing Page

**spec.md:**
```markdown
# QuickFix - Appliance Repair

## About
Repairing home appliances since 2010.
Same-day technician dispatch.

## Services
- Washing machine repair
- Refrigerator repair
- Dishwasher repair

## Benefits
- 1-year warranty
- Original parts
- Free diagnostics

## Contact
Phone: +1 555 123-4567
Address: New York, NY
Hours: 9AM-9PM, 7 days a week
```

**design.md:**
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
- features-grid (services)
- stats (numbers)
- testimonials
- cta
- contact-form
- footer

## Text Processing
tone: professional
length: same

## SEO
- Meta tags
- Open Graph
- Schema.org LocalBusiness
- Keywords extraction
```

### Example 2: Designer Portfolio

**spec.md:**
```markdown
# Anna Smith - UX/UI Designer

## About Me
5 years of interface design experience.
Worked with: Google, Apple, Microsoft.

## Work
### Bank Mobile App
Redesigned app for 2M users...

### E-commerce Fashion Store
Designed e-commerce platform...

## Contact
Email: anna@example.com
LinkedIn: /in/annasmith
```

**design.md:**
```markdown
# Design

## Site Type
type: portfolio

## Framework
framework: tailwind

## Colors
palette: minimal-mono

## Fonts
heading: Playfair Display
body: Inter

## Text Processing
tone: confident
```

---

## Tips

1. **Start simple** — begin with landing, add complexity later
2. **Use ready palettes** — they're already well-matched
3. **Don't overload** — 5-7 sections are enough for a landing page
4. **Check the result** — LLMs can make mistakes
5. **Iterate** — refine requirements if the result isn't satisfactory

---

---

## Image Generation

For image generation, use the [llm-imager](https://github.com/foxzi/llm-imager) utility.

### Installation

```bash
# Debian/Ubuntu
echo "deb [trusted=yes] https://foxzi.github.io/llm-imager/apt stable main" | sudo tee /etc/apt/sources.list.d/llm-imager.list
sudo apt update && sudo apt install llm-imager
```

### Usage

```bash
llm-imager generate -p "image description" -o output.jpg --aspect-ratio 16:9
```

### Inline Syntax in spec.md

Insert generation commands directly in text:

```markdown
## Hero Section
Welcome to our company.

![gen: modern office with panoramic windows](hero.jpg 1792x1024)

## Services

### Web Development
![gen: flat code icon, blue, white background](icon-web.png 512x512)
```

**Extended syntax:**
```markdown
![gen: description | style: photorealistic | negative: text, watermarks](file.jpg 1024x1024)
```

### Specifying in design.md

```markdown
## Images
generation: llm-imager
style: professional, modern, blue tones

images:
  - hero.jpg: "modern office with natural light"
  - icon-speed.png: "flat rocket icon, orange"
  - team-ceo.jpg: "professional portrait, male, 50s"
```

### Image Types

| Type | Size | Description |
|------|------|-------------|
| Hero background | 1792x1024 | Background image for hero section |
| Icons | 512x512 | Icons for features section |
| Team | 1024x1024 | Team member photos |
| Product | 1024x1024 | Product photo or mockup |
| Blog | 1200x630 | Article cover (OG-compatible) |

More details: `modules/images/README.md`

---

## Revisions & Iterations

After site generation, you can request changes using a structured format.

### Revision Request Format

```markdown
## Revisions

### Content
- Hero: change title to "Welcome Home"
- Footer: update phone to +1 555 000-0000

### Styling
- Buttons: make them orange (#F59E0B)
- Font: increase body text to 18px

### Layout
- Move testimonials above pricing
- Add FAQ section before footer

### Images
- Replace hero: ![gen: sunset over mountains](hero-new.jpg 1792x1024)

### Bugs
- Mobile menu doesn't open
- Images stretched on mobile
```

### Revision Types

| Type | Examples |
|------|----------|
| Content | Change text, add/remove sections |
| Styling | Colors, fonts, spacing, sizes |
| Layout | Section order, columns, structure |
| Components | Add form, carousel, modal |
| Images | Regenerate, replace, add new |
| Bugs | Fix broken functionality |

### Tips

1. **Be specific** — "make buttons more visible" → "buttons: orange, larger, with shadow"
2. **Group changes** — collect similar revisions together
3. **Prioritize** — bugs and critical issues first
4. **Specify location** — "in hero", "in footer", "on contact page"

---

## Pre-generation Checklist

- [ ] spec.md contains all content
- [ ] design.md specifies site type
- [ ] Color palette selected
- [ ] Fonts selected
- [ ] Required sections specified
- [ ] Text processing configured (if needed)
- [ ] SEO requirements specified
- [ ] Required images described (if needed)
