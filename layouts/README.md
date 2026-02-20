# Layouts - LLM Instructions

Ready-to-use HTML layout templates and sections for websites. All layouts are standalone HTML with embedded CSS.

## How to Use

1. Choose layout type based on project needs
2. Copy entire file or specific sections
3. Customize content, colors, and styles
4. Combine sections to build complete pages

## Structure

```
layouts/
  sections/     # Reusable page sections
  pages/        # Complete page templates
```

---

## Sections

Standalone sections that can be combined into pages.

### Navigation

| File | Description |
|------|-------------|
| `sections/navbar.html` | Sticky navbar with mobile menu |

### Hero Sections

| File | Description |
|------|-------------|
| `sections/hero-centered.html` | Centered hero with gradient background |
| `sections/hero-split.html` | Split layout with image and stats |

### Content Sections

| File | Description |
|------|-------------|
| `sections/features-grid.html` | 3-column feature cards with icons |
| `sections/testimonials.html` | Customer testimonial cards |
| `sections/team.html` | Team member grid with photos |
| `sections/stats.html` | Statistics/numbers row |
| `sections/faq.html` | Accordion FAQ section |

### Conversion

| File | Description |
|------|-------------|
| `sections/pricing-cards.html` | 3-tier pricing with popular badge |
| `sections/cta.html` | Call-to-action with gradient |
| `sections/contact-form.html` | Contact form with info sidebar |

### Footer

| File | Description |
|------|-------------|
| `sections/footer.html` | Multi-column footer with social |

---

## Pages

Complete page templates ready for customization.

### General Pages

| File | Description | Best For |
|------|-------------|----------|
| `pages/landing.html` | SaaS/Product landing page | Products, services, SaaS |
| `pages/blog-post.html` | Article/blog post template | Blogs, news, tutorials |
| `pages/dashboard.html` | Admin panel with sidebar | Apps, admin panels |
| `pages/portfolio.html` | Personal portfolio | Freelancers, designers |
| `pages/about.html` | Company/team about page | Company sites |
| `pages/services.html` | Services listing page | Agencies, consultants |
| `pages/pricing.html` | Pricing page with FAQ | SaaS, subscriptions |
| `pages/careers.html` | Jobs/careers page | Hiring companies |
| `pages/404.html` | Error page | All sites |

### Landing Pages

| File | Description | Best For |
|------|-------------|----------|
| `pages/lead-gen.html` | Lead generation landing | Email capture, signups |
| `pages/click-through.html` | Click-through sales page | Product sales, promos |
| `pages/coming-soon.html` | Pre-launch countdown | Launches, waitlists |

### E-commerce Pages

| File | Description | Best For |
|------|-------------|----------|
| `pages/product-listing.html` | Product catalog with filters | Online stores |
| `pages/product-detail.html` | Single product page | E-commerce |
| `pages/cart.html` | Shopping cart | E-commerce |

### Auth Pages

| File | Description | Best For |
|------|-------------|----------|
| `pages/login.html` | Login/sign in page | Apps, SaaS |

---

## Building a Page

Combine sections to create custom pages:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Page Title</title>
</head>
<body>
  <!-- Copy navbar section -->
  <!-- Copy hero section -->
  <!-- Copy features section -->
  <!-- Copy testimonials section -->
  <!-- Copy cta section -->
  <!-- Copy footer section -->
</body>
</html>
```

### Typical Page Structures

**Landing Page:**
1. Navbar
2. Hero (centered or split)
3. Features grid
4. Stats
5. Testimonials
6. Pricing
7. CTA
8. Footer

**About Page:**
1. Navbar
2. Hero (centered)
3. Team
4. Stats
5. CTA
6. Footer

**Contact Page:**
1. Navbar
2. Contact form
3. Footer

**Blog Post:**
- Use `pages/blog-post.html` template

---

## Customization Guide

### Colors

Replace primary color `#4F46E5` (indigo) with your brand:

```css
/* Find and replace */
#4F46E5 → your primary color
#4338CA → your primary dark
#EEF2FF → your primary light
```

### Typography

Add font links and update font-family:

```css
body {
  font-family: 'Inter', system-ui, sans-serif;
}
```

### Spacing

Sections use consistent padding:
- Desktop: `padding: 5rem 1.5rem`
- Mobile: `padding: 3rem 1rem`

### Responsive

All layouts include mobile breakpoints:
- `768px` - Tablet
- `640px` - Mobile

---

## Section Details

### hero-centered.html
- Gradient background
- Centered title and subtitle
- Two CTA buttons
- Responsive text sizing

### hero-split.html
- Two-column layout
- Badge, title, text, buttons
- Stats row
- Image placeholder
- Mobile: stacks vertically

### features-grid.html
- Section label, title, subtitle
- 3-column card grid
- Icons (inline SVG)
- Hover animations
- Responsive: 2-col, then 1-col

### pricing-cards.html
- 3 pricing tiers
- Popular tier highlighted
- Feature lists with checkmarks
- CTA buttons
- Responsive: stacks on mobile

### testimonials.html
- 3 testimonial cards
- Star ratings
- Author avatar and info
- Responsive grid

### faq.html
- Accordion style
- Click to expand
- JavaScript included
- Clean animation

### navbar.html
- Sticky positioning
- Logo + menu + actions
- Mobile hamburger menu
- JavaScript for toggle

### footer.html
- 5-column layout
- Brand + social links
- Link columns
- Copyright
- Responsive

### contact-form.html
- Split layout
- Contact info sidebar
- Form with validation styles
- Responsive

### stats.html
- 4-column number display
- Gradient text
- Dark background
- Responsive grid

### team.html
- 4-column grid
- Photo placeholders
- Name, role, social
- Responsive

### cta.html
- Gradient background
- Centered content
- Two buttons
- Simple and effective

---

## Page Details

### landing.html
- Complete SaaS landing page
- Navbar, hero, features, testimonials, CTA, footer
- Fully responsive
- Ready for content replacement

### blog-post.html
- Article template with typography
- Author info, date, tags
- Code block styling
- Table of contents ready
- Related posts section

### dashboard.html
- Admin panel layout
- Sidebar navigation with icons
- Stats cards row
- Data table with pagination
- Header with search and user menu

### portfolio.html
- Personal portfolio
- Hero with photo placeholder
- Work grid with hover effects
- About section
- Contact form

### about.html
- Company story section
- Values grid (3 columns)
- Team members grid
- Stats row
- CTA section

### services.html
- Services grid with icons (6 items)
- Process steps (4 steps)
- Featured service highlight
- CTA section
- Responsive layout

### pricing.html
- Monthly/yearly toggle
- 3-tier pricing cards
- Popular tier highlighted
- Feature comparison
- FAQ accordion
- CTA section

### careers.html
- Perks grid (4 items)
- Job listings with filters
- Job cards with tags, salary, location
- Company values section
- Contact CTA

### 404.html
- Large error code with gradient
- Illustration SVG
- Go Home / Go Back buttons
- Popular links section
- Minimal, centered layout

### login.html
- Split layout (form + illustration)
- Social login buttons (Google, Facebook)
- Email/password form
- Remember me, forgot password
- Responsive (hides illustration on mobile)

### lead-gen.html
- Split layout
- Benefits list with checkmarks
- Email capture form
- Trust badges
- Social proof elements

### click-through.html
- Product image showcase
- Feature highlights
- Pricing display
- Testimonial
- Strong CTA buttons
- Urgency elements

### coming-soon.html
- Dark theme
- Countdown timer (JS)
- Email signup form
- Social links
- Brand logo
- Animated gradient background

### product-listing.html
- Sidebar filters (category, price, rating)
- Product grid (3 columns)
- Product cards with image, price, rating
- Pagination
- Sort dropdown
- Responsive (filters collapse)

### product-detail.html
- Image gallery with thumbnails
- Product info (title, price, rating)
- Color and size options
- Quantity selector
- Add to cart button
- Tabs (description, specs, reviews)
- Related products

### cart.html
- Cart items list
- Quantity controls (+/-)
- Remove item button
- Order summary sidebar
- Promo code input
- Checkout button
- Continue shopping link

---

## Quick Reference

### Common CSS Classes

```css
.container    /* Max-width wrapper */
.btn          /* Button base */
.btn-primary  /* Primary button */
.btn-secondary /* Secondary button */
.section-label /* Small uppercase label */
.section-title /* Large heading */
.section-subtitle /* Subtitle text */
```

### Common Breakpoints

```css
@media (max-width: 1024px) { /* Tablet */ }
@media (max-width: 768px) { /* Small tablet */ }
@media (max-width: 640px) { /* Mobile */ }
```

### Icon Usage

All sections use inline SVG icons. Replace with icons from `icons/` directory:

```html
<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
  <!-- paste icon path here -->
</svg>
```
