# SEO & Meta - LLM Instructions

Ready-to-use SEO templates: meta tags, Open Graph, Twitter Cards, Schema.org markup, and technical SEO files.

## How to Use

1. Copy relevant meta tags to `<head>` section
2. Replace placeholder values with actual content
3. Combine multiple templates as needed
4. Validate with testing tools

## Structure

```
seo/
  meta-tags.html      # Essential meta tags
  open-graph.html     # Facebook/LinkedIn sharing
  twitter-cards.html  # Twitter sharing
  favicon.html        # Favicon setup
  robots.txt          # Crawler instructions
  sitemap.xml         # Sitemap template
  schema/             # JSON-LD structured data
```

---

## Quick Reference

### Essential Meta Tags

```html
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Page description (150-160 chars)">
<title>Page Title - Brand (50-60 chars)</title>
```

### Open Graph (Facebook/LinkedIn)

```html
<meta property="og:title" content="Page Title">
<meta property="og:description" content="Description">
<meta property="og:image" content="https://example.com/image.jpg">
<meta property="og:url" content="https://example.com/page">
<meta property="og:type" content="website">
```

### Twitter Cards

```html
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Page Title">
<meta name="twitter:description" content="Description">
<meta name="twitter:image" content="https://example.com/image.jpg">
```

### Canonical URL

```html
<link rel="canonical" href="https://example.com/page">
```

---

## Files

### meta-tags.html

Complete meta tags template:
- Charset and viewport
- Title and description
- Robots directives
- Canonical URL
- Language and locale
- Author and copyright
- Theme color

### open-graph.html

Facebook/LinkedIn sharing:
- og:title, og:description
- og:image (1200x630 recommended)
- og:url, og:type
- og:site_name
- og:locale
- Article-specific tags

### twitter-cards.html

Twitter sharing:
- summary_large_image card
- twitter:title, twitter:description
- twitter:image
- twitter:site, twitter:creator
- App card variant

### favicon.html

Complete favicon setup:
- favicon.ico (legacy)
- PNG icons (16x16, 32x32, 192x192, 512x512)
- Apple touch icons
- Safari pinned tab
- Windows tiles
- Web app manifest link

### robots.txt

Crawler instructions:
- User-agent rules
- Allow/Disallow paths
- Sitemap location
- Crawl-delay (optional)

### sitemap.xml

XML sitemap template:
- URL entries with lastmod, changefreq, priority
- Multi-page structure
- Image sitemap extension

---

## Schema.org (JSON-LD)

Structured data templates in `schema/` directory.

### Available Schemas

| File | Use Case |
|------|----------|
| `organization.json` | Company/brand info |
| `local-business.json` | Local business with address |
| `website.json` | Website with search box |
| `article.json` | Blog posts, news articles |
| `product.json` | E-commerce products |
| `faq.json` | FAQ pages |
| `breadcrumb.json` | Navigation breadcrumbs |
| `person.json` | Personal profiles |
| `review.json` | Product/service reviews |
| `service.json` | Professional services |

### How to Add Schema

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "Company Name",
  "url": "https://example.com"
}
</script>
```

### Schema Best Practices

1. Place in `<head>` or end of `<body>`
2. One script tag per schema (or use @graph)
3. Test with Google Rich Results Test
4. Include required properties for each type

---

## Image Requirements

### Open Graph Images
- Size: 1200x630 px (1.91:1 ratio)
- Format: JPG or PNG
- Max file size: 5MB
- Text: Keep centered, may be cropped

### Twitter Images
- summary_large_image: 1200x628 px
- summary: 144x144 px minimum
- Format: JPG, PNG, GIF, WEBP

### Favicon Sizes
- 16x16 - Browser tab
- 32x32 - Taskbar shortcut
- 180x180 - Apple touch icon
- 192x192 - Android Chrome
- 512x512 - PWA splash

---

## Validation Tools

| Tool | URL |
|------|-----|
| Google Rich Results | search.google.com/test/rich-results |
| Facebook Debugger | developers.facebook.com/tools/debug |
| Twitter Card Validator | cards-dev.twitter.com/validator |
| Schema Validator | validator.schema.org |

---

## Page Type Guidelines

### Homepage
- meta-tags.html (full)
- open-graph.html (website type)
- twitter-cards.html
- schema/organization.json
- schema/website.json

### Blog Post
- meta-tags.html
- open-graph.html (article type)
- twitter-cards.html
- schema/article.json
- schema/breadcrumb.json

### Product Page
- meta-tags.html
- open-graph.html (product type)
- twitter-cards.html
- schema/product.json
- schema/breadcrumb.json

### About Page
- meta-tags.html
- open-graph.html
- schema/organization.json
- schema/person.json (for team)

### Contact Page
- meta-tags.html
- schema/local-business.json (if applicable)

### FAQ Page
- meta-tags.html
- schema/faq.json

---

## Common Mistakes

1. **Missing og:image** - Posts look plain when shared
2. **Description too long** - Gets truncated (keep under 160 chars)
3. **Wrong image size** - Gets cropped badly
4. **Relative URLs in OG/Twitter** - Must be absolute URLs
5. **Missing canonical** - Duplicate content issues
6. **No robots meta** - Index issues
7. **Schema errors** - Test before deploying

---

## Checklist

Before launch, verify:

- [ ] Title tag unique per page (50-60 chars)
- [ ] Meta description unique per page (150-160 chars)
- [ ] Canonical URL set
- [ ] Open Graph tags complete
- [ ] Twitter Card tags complete
- [ ] Favicon all sizes
- [ ] Schema.org markup valid
- [ ] robots.txt configured
- [ ] sitemap.xml generated
- [ ] Tested with validation tools
