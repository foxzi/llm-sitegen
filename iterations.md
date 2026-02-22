# Iterations & Revisions - LLM Instructions

Instructions for handling revision requests after initial site generation.

---

## When to Use

This document applies when:
- User has a generated site and wants changes
- User provides feedback on the result
- User requests fixes, improvements, or additions

---

## Revision Request Types

### 1. Content Changes

User wants to change text, add/remove sections.

**Examples:**
- "Change the hero title to..."
- "Add a new service called..."
- "Remove the FAQ section"
- "Update the phone number"

**Action:** Edit HTML content directly.

### 2. Style Changes

User wants to change visual appearance.

**Examples:**
- "Make the buttons more visible"
- "Change the primary color to blue"
- "Increase font size in hero"
- "Add more spacing between sections"

**Action:** Edit CSS or inline styles.

### 3. Layout Changes

User wants to change structure or arrangement.

**Examples:**
- "Move testimonials above pricing"
- "Add a sidebar"
- "Make the navbar fixed"
- "Change to two-column layout"

**Action:** Restructure HTML, may require CSS changes.

### 4. Component Changes

User wants to add, remove, or modify components.

**Examples:**
- "Add a contact form"
- "Replace the hero with a video background"
- "Add social media icons to footer"
- "Include a newsletter signup"

**Action:** Add/modify HTML blocks, may need JS.

### 5. Image Changes

User wants different or new images.

**Examples:**
- "Generate a new hero image"
- "Add icons to each service"
- "Create team photo placeholders"
- "Add product images"

**Action:** Generate NEW llm-imager commands.

**Note:** llm-imager only creates new images. To modify existing images (resize, crop, format), use ImageMagick `convert`. See `images/README.md`.

### 6. Animation Changes

User wants to add or modify animations.

**Examples:**
- "Add hover effects to buttons"
- "Make the hero title fade in"
- "Add scroll animations to sections"
- "Speed up the loading animation"

**Action:** Edit CSS animations/transitions. See `animations/README.md`.

### 7. Bug Fixes

User reports something not working.

**Examples:**
- "Mobile menu doesn't open"
- "Form doesn't submit"
- "Images are stretched"
- "Footer overlaps content"

**Action:** Debug and fix HTML/CSS/JS.

---

## Revision Format

Users should provide revisions in a structured format:

### Simple Format

```markdown
## Revisions

1. Hero: change title to "Welcome to Our Company"
2. Colors: make buttons orange (#F59E0B)
3. Add: contact form before footer
4. Fix: mobile menu not opening
```

### Detailed Format

```markdown
## Revisions

### Hero Section
- Change title: "New Title Here"
- Change subtitle: "New subtitle text"
- Replace background image: ![gen: sunset over mountains](hero-new.jpg 1792x1024)

### Services Section
- Add new service:
  - Title: "Consulting"
  - Description: "Expert advice for your business"
  - Icon: ![gen: flat handshake icon, blue](icon-consulting.png 512x512)

### Styling
- Primary color: #2563EB → #059669
- Button style: more rounded (border-radius: 9999px)
- Font size: increase body text to 18px

### Fixes
- Mobile: hamburger menu not responding to clicks
- Desktop: footer links not aligned properly
```

---

## Processing Revisions

### Step 1: Categorize

Group revisions by type:
- Content (text changes)
- Style (CSS changes)
- Layout (structure changes)
- Components (add/remove blocks)
- Images (generate new)
- Animations (effects, transitions)
- Bugs (fix issues)

### Step 2: Prioritize

Order of operations:
1. Bug fixes (site must work)
2. Layout changes (structure first)
3. Component changes (add/remove)
4. Content changes (update text)
5. Style changes (visual polish)
6. Animation changes (effects)
7. Image changes (can be done in parallel)

### Step 3: Apply Changes

For each revision:
1. Locate the relevant code
2. Make minimal necessary changes
3. Preserve existing functionality
4. Test mentally for side effects

### Step 4: Report

After applying:
1. List what was changed
2. Note any issues found
3. Suggest additional improvements (optional)

---

## Change Scope Rules

### Minimal Changes

Only change what's requested. Don't:
- Refactor unrelated code
- Change styling not mentioned
- Add features not requested
- Rewrite working code

### Preserve Functionality

When editing:
- Keep existing event handlers
- Maintain responsive behavior
- Don't break accessibility
- Test edge cases

### Consistent Style

Match existing code style:
- Same indentation
- Same naming conventions
- Same CSS methodology
- Same structure patterns

---

## Common Revision Patterns

### Change Text

```markdown
Request: "Change hero title to 'Welcome Home'"
```

```html
<!-- Before -->
<h1>Original Title</h1>

<!-- After -->
<h1>Welcome Home</h1>
```

### Change Color

```markdown
Request: "Make primary color green"
```

```css
/* Before */
--primary: #4F46E5;

/* After */
--primary: #059669;
```

### Add Section

```markdown
Request: "Add testimonial section after features"
```

```html
<!-- Features section -->
</section>

<!-- New: Testimonials -->
<section class="testimonials">
  ...
</section>

<!-- Next section -->
```

### Fix Mobile

```markdown
Request: "Menu doesn't work on mobile"
```

Check:
1. JS event listeners attached
2. CSS display/visibility rules
3. Z-index stacking
4. Touch events vs click events

### Add/Replace Image

```markdown
Request: "Different hero image, more professional"
```

```bash
# Generate NEW image (llm-imager creates, not edits)
llm-imager -p "professional corporate office, modern, bright" \
  -o assets/images/hero.jpg --size 1792x1024 --quality hd
```

### Resize/Crop Image

```markdown
Request: "Make hero image smaller"
```

```bash
# Use convert for processing existing images
convert assets/images/hero.jpg -resize 1200x600 assets/images/hero.jpg
```

### Add Animation

```markdown
Request: "Add fade-in effect to hero title"
```

```css
/* Add to CSS */
.hero h1 {
  animation: fadeIn 0.8s ease-out;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}
```

---

## Iteration Workflow

### Round 1: Initial Generation
- Generate full site from spec.md + design.md
- Deliver complete HTML/CSS/JS

### Round 2+: Revisions
- User provides revision list
- Apply changes incrementally
- Report what was changed
- Ask for clarification if needed

### Final Round: Polish
- Minor tweaks
- Performance optimization
- Final QA checks

---

## Asking for Clarification

If revision is unclear, ask:

```markdown
I need clarification on:

1. "Make buttons more visible" — Should I:
   - Increase size?
   - Change color?
   - Add shadow/border?
   - All of the above?

2. "Add contact form" — What fields needed:
   - Name, email, message (standard)?
   - Phone number?
   - Subject dropdown?
   - File upload?
```

---

## Output Format

After applying revisions:

```markdown
## Changes Applied

### Content
- ✅ Hero title changed to "Welcome Home"
- ✅ Phone number updated in footer

### Style
- ✅ Primary color changed to #059669
- ✅ Button border-radius increased to 9999px

### Layout
- ✅ Testimonials moved above pricing

### Fixes
- ✅ Mobile menu now opens correctly (added missing JS)

### Images
- ⏳ New hero image command generated (run with llm-imager)

## Files Modified
- index.html (lines 45, 78, 156)
- assets/css/style.css (lines 12, 89)

## Suggested Additional Improvements
- Consider adding hover states to service cards
- Footer could use more contrast for readability
```
