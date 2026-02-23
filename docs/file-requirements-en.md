# Project File Requirements

Each website generation project uses a set of files that describe content and design. This documentation explains the structure and requirements for each file.

## Contents

1. [General Structure](#general-structure)
2. [spec.md — Content](#specmd--content)
3. [design.md — Design](#designmd--design)
4. [task.md — Task](#taskmd--task)

---

## General Structure

Project files are located in the `projects/{id}_{name}/specs/` folder:

```
projects/
  001_my-project/
    specs/
      spec.md      # Required: content and website information
      design.md    # Required: visual styling
      task.md      # Optional: additional instructions
    build/         # Generated website
```

---

## spec.md — Content

**Purpose:** Describes WHAT will be on the website — all text content, information structure, and business data.

### File Structure

#### 1. Metadata (YAML frontmatter) — optional

```yaml
---
site: Website Name
type: landing | multipage | portfolio | e-commerce | blog
css: tailwind | bootstrap | bulma | uikit | pico
lang: en | ru
version: 1
url: https://example.com
keywords: comma-separated keywords
---
```

#### 2. Pages (for multipage)

```markdown
<!-- page: path="index.html" title="Page Title" description="SEO description" -->
```

#### 3. Schema.org Markup — optional

```markdown
<!-- schema: type="local-business" -->
```json
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Company Name",
  ...
}
```

#### 4. Content Blocks

```markdown
<!-- block: type="hero" id="home" -->

# Hero Section Heading

Description and text...

[Call to Action](#contact) [Secondary Button](#services)

<!-- block: type="features" id="services" -->

## Our Services

### Service 1
Service description...

### Service 2
Service description...
```

### Block Types

| Type | Purpose | Typical Content |
|------|---------|-----------------|
| `hero` | Main screen | Heading, description, CTA buttons |
| `features` | Services/benefits | List with headings and descriptions |
| `reviews` | Testimonials | Quotes with authors |
| `faq` | FAQ | Questions and answers |
| `cta` | Call to action | Heading, text, button |
| `contacts` | Contacts | Phone, address, service areas |
| `footer` | Footer | Company info, links |

### Content Generation

For automatic text generation, use the syntax:

```markdown
## Services

### Web Development
[generate: web development service description | professional | medium]

## FAQ
[generate: FAQ 5 questions about delivery]

## Testimonials
[generate: 3 reviews about cleaning service | enthusiastic]
```

**Generation parameters:**
- Tone: `formal`, `professional`, `friendly`, `casual`, `enthusiastic`, `confident`, `luxurious`, `technical`, `playful`
- Length: `short`, `medium`, `long`

### Image Generation

```markdown
## Hero
![gen: modern office with panoramic windows](hero.jpg 1792x1024)

## Service Icons
![gen: flat code icon, blue, white background](icon-web.png 512x512)
```

**Format:** `![gen: description](filename.extension WIDTHxHEIGHT)`

### Required Sections

| Section | Required | Description |
|---------|----------|-------------|
| About company/product | Yes | Who you are and what you do |
| Services/products | Yes | What you offer |
| Contacts | Yes | How to reach you |
| Benefits | Recommended | Why choose you |
| Testimonials | Recommended | Social proof |
| FAQ | Recommended | Answers to common questions |

### Minimal spec.md Example

```markdown
# CleanPro - Cleaning Company

## About Us
CleanPro cleaning company has been operating in the city since 2015.

## Services

### Apartment Cleaning
Professional residential cleaning services.

### Deep Cleaning
Complete cleaning with window washing and furniture cleaning.

## Contacts
- Phone: +1 (555) 123-4567
- Email: info@cleanpro.com
- Address: 123 Main Street
```

### Full spec.md Example

See examples in the `examples/` folder:
- `examples/electrolux-roseville/spec.md` — complete landing page with Schema.org
- `examples/cleaning-service/spec.md` — with content generation
- `examples/food-delivery/spec.md` — with images

---

## design.md — Design

**Purpose:** Describes HOW the website will look — visual styling, framework, colors, fonts, section structure.

### File Structure

```markdown
# Design Settings

## Site Type
type: landing

## Framework
framework: bootstrap

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
- footer

## Text Processing
tone: professional
length: same

## SEO
- Meta description
- Open Graph
- Schema.org LocalBusiness
```

### Required Fields

| Field | Description | Example Values |
|-------|-------------|----------------|
| `type` | Site type | `landing`, `multipage`, `portfolio`, `e-commerce`, `blog` |
| `framework` | CSS framework | `bootstrap`, `tailwind`, `bulma`, `uikit`, `pico`, `water`, `milligram` |
| `palette` or colors | Color scheme | Palette name or HEX colors |

### Recommended Fields

| Field | Description | Example Values |
|-------|-------------|----------------|
| `heading` | Heading font | `Montserrat`, `Playfair Display`, `Roboto` |
| `body` | Body font | `Open Sans`, `Inter`, `Lato` |
| `sections` | Section list | List of sections in order |
| `tone` | Text tone | `professional`, `friendly`, `enthusiastic` |

### Color Palettes

35+ ready-made palettes available. Main categories:

| Category | Palettes |
|----------|----------|
| Corporate | `ocean-trust`, `executive-green`, `steel-professional` |
| Creative | `sunset-creative`, `aurora-dreams`, `neon-nights` |
| Tech | `cyber-blue`, `matrix-green`, `quantum-purple` |
| E-commerce | `fresh-market`, `luxury-gold`, `minimal-mono` |
| Medical | `medical-trust`, `healthcare-calm` |

**Using a palette:**
```markdown
## Colors
palette: ocean-trust
```

**Custom colors:**
```markdown
## Colors
primary: #0284C7
secondary: #1E40AF
accent: #F59E0B
background: #FFFFFF
text: #1F2937
```

### Sections

Standard sections for landing pages:

| Section | Description |
|---------|-------------|
| `navbar` | Navigation menu |
| `hero-centered` | Hero with centered content |
| `hero-split` | Hero split into two parts |
| `features-grid` | Benefits/services grid |
| `services` | Service cards |
| `pricing-cards` | Pricing table |
| `testimonials` | Customer reviews |
| `faq` | Frequently asked questions |
| `contact-form` | Contact form |
| `cta` | Call to action |
| `footer` | Website footer |

### Additional Settings

#### Animations

```markdown
## Animations
- Scroll reveal on sections
- Hover lift on cards
- Smooth scroll for anchor links
```

#### Mobile Version

```markdown
## Mobile
- Collapsible burger menu
- Stack cards vertically
- Full-width buttons
```

#### SEO

```markdown
## SEO
- Meta description
- Open Graph
- Schema.org LocalBusiness
- sitemap.xml
- robots.txt
```

#### Images

```markdown
## Images

### Hero
![gen: hero image description](hero.jpg 1792x1024)

### Icons
![gen: service icon](icon-service.png 512x512)
```

#### Generation Variants

```markdown
## Variants to Generate
- ocean-trust (default)
- executive-green
- carbon-dark
```

#### Assets

```markdown
## Assets
- Logo: logo.png
- Favicon: favicon.ico
- Folder structure: assets/css/, assets/js/, assets/images/
```

### Minimal design.md Example

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
```

### Full design.md Example

```markdown
# Design Settings

## Site Type
type: landing

## Framework
framework: tailwind

## Colors
palette: fresh-market

## Fonts
heading: Poppins
body: Inter

## Sections
- navbar (with "Order" button)
- hero-split (with photo and CTA)
- features-grid (benefits)
- services (service cards)
- pricing-cards
- testimonials
- faq
- contact-form
- footer

## Text Processing
tone: friendly
length: same

## SEO
- Meta description
- Open Graph
- Schema.org LocalBusiness
- Keywords extraction

## Animations
- Scroll reveal on sections
- Hover lift on cards

## Mobile
- Collapsible burger menu
- Stack cards vertically

## Images
### Hero
![gen: bright modern interior](hero.jpg 1792x1024)

## Assets
- Logo: logo.png (transparent background)
- Favicon: favicon.ico
```

---

## task.md — Task

**Purpose:** Optional file with additional instructions that don't fit in spec.md or design.md.

### When to Use

- Specific instructions for LLM
- References to other files
- Output structure instructions
- Special generation requirements

### File Structure

```markdown
# Task

Specification in `spec.md`.
Design in `design.md`.

## Special Requirements

- Create website in build/ folder
- Use only local resources
- Do not use external CDNs

## Priorities

1. Mobile responsiveness
2. Fast loading
3. SEO optimization
```

### Example

```markdown
# Website Creation Task

Website specification and content in `spec.md`.
Technical details for website creation in `design.md`.

Create website in build/site/ folder.

## Additional

- Footer should be dark
- Add icons to services from icons/ folder
- Must use Schema.org markup
```

---

## Pre-generation Checklist

### spec.md
- [ ] Company/project name specified
- [ ] All services/products described
- [ ] Contact information added
- [ ] Benefits listed
- [ ] Testimonials added (or generation directives)
- [ ] FAQ described (if needed)

### design.md
- [ ] Site type specified
- [ ] Framework selected
- [ ] Color palette chosen
- [ ] Fonts specified
- [ ] Sections listed
- [ ] SEO requirements configured

### task.md (optional)
- [ ] Output path specified
- [ ] Special requirements described
