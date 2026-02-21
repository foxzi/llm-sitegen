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
examples/
  my-project/
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

Provide the LLM with necessary files as context:
- Your project's `spec.md` and `design.md`
- README.md from needed folders (frameworks, layouts, colors, etc.)

---

## Project Structure

```
llm-sitegen/
├── frameworks/     # CSS/JS frameworks
├── colors/         # Color palettes
├── fonts/          # Fonts (woff2)
├── icons/          # SVG icons
├── layouts/        # Page and section templates
├── components/     # UI components
├── animations/     # CSS animations
├── seo/            # SEO templates
├── content/        # Text processing
├── examples/       # Project examples
└── docs/           # Documentation
```

### What to Include as Context

| Task | Context Files |
|------|---------------|
| Choose framework | `frameworks/README.md` |
| Choose colors | `colors/README.md` |
| Choose fonts | `fonts/README.md` |
| Page structure | `layouts/README.md` |
| UI elements | `components/README.md` |
| SEO setup | `seo/README.md` |
| Text processing | `content/README.md` |

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

There are 35+ ready palettes in `colors/README.md`:

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
llm-imager -p "image description" -o output.jpg --size 1792x1024
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

More details: `images/README.md`

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
