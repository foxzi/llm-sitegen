# Images - LLM Instructions

See global rules: `modules/README.md`.

Instructions for generating images for websites using llm-imager CLI tool.

**IMPORTANT: NEVER create shell scripts (.sh, .bat) for image generation. NEVER save llm-imager commands to files like images.sh or generate-images.sh. Always execute llm-imager commands directly and inline.**
**Note:** Batch scripts are allowed for post-processing with `convert`, but not for `llm-imager` generation.

---

## Purpose

Define how to generate and reference local images.

## How to Use

1. Add inline `![gen: ...]` directives in `content.md`
2. Run `llm-imager` directly for each image
3. Output images to `assets/images/`

## Examples

```markdown
![gen: modern office with natural light](hero.jpg 1792x1024)
```

## Rules

- Do not create scripts for image generation
- Use `assets/images/` for output paths

## Prerequisites

The `llm-imager` tool must be installed and configured locally by the user.

**Important:** All llm-imager configuration (API keys, model selection, dry-run mode, etc.) is the user's responsibility. LLM should run commands normally without checking or modifying behavior based on user's configuration.

**Installation:** https://github.com/foxzi/llm-imager

```bash
# Debian/Ubuntu
echo "deb [trusted=yes] https://foxzi.github.io/llm-imager/apt stable main" | sudo tee /etc/apt/sources.list.d/llm-imager.list
sudo apt update && sudo apt install llm-imager

# Or via Go
go install github.com/foxzi/llm-imager/cmd/llm-imager@latest
```

## Checklist

- [ ] All required images listed in spec
- [ ] Outputs placed in assets/images
- [ ] No generation scripts created

## References

- `modules/images/README.md`
- `modules/images/processing/README.md`

## Inline Image Commands

Generate images directly from content.md using special syntax.

### Syntax

```markdown
![gen: description](filename.jpg size)
```

**Parts:**
- `gen:` — marker that this image should be generated
- `description` — prompt for image generation
- `filename.jpg` — output file path (relative to assets/images/)
- `size` — dimensions (optional, default 1024x1024)

### Examples

**Basic:**
```markdown
![gen: modern office with natural light](hero.jpg 1792x1024)
```

**With detailed prompt:**
```markdown
![gen: flat minimalist icon of a rocket, orange color, white background, simple style](icon-speed.png 512x512)
```

**Team photo:**
```markdown
![gen: professional headshot, business woman, 35 years, friendly smile, neutral background](team-anna.jpg)
```

**Without size (default 1024x1024):**
```markdown
![gen: abstract blue gradient background](bg-pattern.jpg)
```

### Advanced Options

**With style modifier:**
```markdown
![gen: city skyline at sunset | style: photorealistic, cinematic](hero-city.jpg 1920x1080)
```

**With negative prompt:**
```markdown
![gen: clean product photo of laptop | negative: text, watermarks, people](product.jpg 1200x800)
```

**With quality:**
```markdown
![gen: detailed illustration of workflow | quality: hd](workflow.png 1400x900)
```

### Full Syntax

```markdown
![gen: prompt | style: ... | negative: ... | quality: hd](filename size)
```

### Usage in content.md

```markdown
# Company Website

## Hero Section
Welcome to our company.

![gen: modern tech startup office, bright natural light, minimalist furniture, no people](hero.jpg 1792x1024)

## Our Services

### Web Development
We build modern websites.

![gen: flat icon of code brackets, blue color, white background](icon-web.png 512x512)

### Mobile Apps
Native iOS and Android apps.

![gen: flat icon of smartphone with app interface, purple color, white background](icon-mobile.png 512x512)

## Our Team

### John Smith, CEO
Leading the company since 2015.

![gen: professional headshot, confident man 50s, suit, neutral gray background](team-john.jpg 800x800)
```

### Processing

LLM will:
1. Parse all `![gen: ...]` commands from content.md
2. Run llm-imager directly for each image
3. Replace with standard markdown images in HTML:

```html
<img src="assets/images/hero.jpg" alt="modern tech startup office">
```

### Direct Generation

From the spec above, LLM runs:

```bash
mkdir -p assets/images

llm-imager generate -p "modern tech startup office, bright natural light, minimalist furniture, no people" \
  -o assets/images/hero.jpg --aspect-ratio 16:9

llm-imager generate -p "flat icon of code brackets, blue color, white background" \
  -o assets/images/icon-web.png --aspect-ratio 1:1 --size 512x512

llm-imager generate -p "flat icon of smartphone with app interface, purple color, white background" \
  -o assets/images/icon-mobile.png --aspect-ratio 1:1 --size 512x512

llm-imager generate -p "professional headshot, confident man 50s, suit, neutral gray background" \
  -o assets/images/team-john.jpg --aspect-ratio 1:1
```

**Note:** Run commands directly, do not create scripts.

### Basic Command

```bash
llm-imager generate -p "prompt" -o assets/images/output.png
```

**Aliases:** `generate`, `gen`, `g`

**Parameters:**
| Flag | Description |
|------|-------------|
| `-p, --prompt` | Image description (required) |
| `-o, --output` | Output file path (required) |
| `-m, --model` | Model to use (e.g., `openrouter/google/gemini-2.5-flash-image`) |
| `--aspect-ratio` | Aspect ratio (e.g., `16:9`, `1:1`, `4:3`) — preferred over `--size` |
| `--size` | Exact dimensions (e.g., `1024x1024`, `1792x1024`) |
| `--quality` | `standard`/`hd` or `low`/`medium`/`high` |
| `--style` | `natural`/`vivid` |
| `--negative-prompt` | What to avoid |
| `--seed` | For reproducibility |
| `--steps` | Generation steps (Stability AI, Replicate) |
| `--provider` | Explicit provider (`openai`/`google`/`stability`/`replicate`/`openrouter`) |

## Available Models

| Model | Provider | Supported features |
|-------|----------|--------------------|
| `openrouter/google/gemini-2.5-flash-image` | openrouter | aspect_ratio, image_size |
| `openrouter/google/gemini-3-pro-image-preview` | openrouter | aspect_ratio, image_size |
| `openrouter/openai/gpt-5-image` | openrouter | aspect_ratio |
| `openrouter/openai/gpt-5-image-mini` | openrouter | aspect_ratio |
| `openai/dall-e-3` | openai | quality, style |
| `openai/gpt-image-1` | openai | quality |
| `openai/dall-e-2` | openai | — |
| `google/gemini-2.0-flash-exp-image` | google | — |
| `google/imagen-3.0-generate-002` | google | aspect_ratio |
| `replicate/flux-1.1-pro` | replicate | aspect_ratio, seed |
| `replicate/flux-schnell` | replicate | aspect_ratio, seed |
| `replicate/sdxl` | replicate | negative_prompt, seed, steps |
| `stability/stable-image-core` | stability | negative_prompt, seed, aspect_ratio, style_preset |
| `stability/stable-image-ultra` | stability | negative_prompt, seed, aspect_ratio |
| `stability/sd3-large` | stability | negative_prompt, seed |

Use `llm-imager list models` to see available models.
Use `llm-imager list providers` to check which providers are configured.

---

## Image Types for Websites

### Defaults (Quick Reference)

| Image Type | Aspect Ratio | Size (if needed) | Quality | Notes |
|------------|--------------|------------------|---------|-------|
| Hero background | 16:9 | 1792x1024 | hd | No people, no text |
| Feature icons | 1:1 | 512x512 | standard | Flat or isometric |
| Team photos | 1:1 | 800x800 | hd | Neutral background |
| Product images | 1:1 or 4:3 | 1200x1200 | hd | Clean product photo |
| Blog featured | 16:9 | 1200x630 | hd | Open Graph friendly |
| Background patterns | 1:1 | 512x512 | standard | Tileable texture |

### Hero Images

Large background images for hero sections.

**Recommended:** `--aspect-ratio 16:9`

```bash
llm-imager generate -p "modern office workspace with natural light, minimalist design, professional atmosphere, no people" \
  -o assets/images/hero-bg.jpg \
  --aspect-ratio 16:9 \
  --quality hd
```

### Feature Icons/Illustrations

Small illustrations for feature sections.

**Recommended:** `--aspect-ratio 1:1`

```bash
llm-imager generate -p "simple flat icon of a shield with checkmark, blue color, white background, minimal style" \
  -o assets/images/icon-security.png \
  --aspect-ratio 1:1 \
  --style natural
```

### Team Photos (Placeholders)

AI-generated placeholder portraits.

**Recommended:** `--aspect-ratio 1:1`

```bash
llm-imager generate -p "professional headshot of a smiling business woman, 30s, neutral background, corporate style" \
  -o assets/images/team-1.jpg \
  --aspect-ratio 1:1 \
  --quality hd
```

### Product Images

Product photos or mockups.

**Recommended:** `--aspect-ratio 1:1` or `4:3`

```bash
llm-imager generate -p "smartphone mockup showing app interface, floating on gradient background, professional product photography" \
  -o assets/images/product-mockup.png \
  --aspect-ratio 1:1 \
  --quality hd
```

### Background Patterns

Subtle patterns for sections.

**Recommended:** `--aspect-ratio 1:1 --size 512x512`

```bash
llm-imager generate -p "seamless geometric pattern, subtle blue lines on white, minimal, tileable texture" \
  -o assets/images/pattern-bg.png \
  --aspect-ratio 1:1 \
  --size 512x512
```

### Blog/Article Images

Featured images for blog posts.

**Recommended:** `--aspect-ratio 16:9` (Open Graph compatible)

```bash
llm-imager generate -p "abstract illustration of digital transformation, blue and purple gradient, modern tech style" \
  -o assets/images/blog-featured.jpg \
  --aspect-ratio 16:9 \
  --quality hd
```

---

## Prompt Writing Guidelines

### Structure

```
[subject] + [style] + [colors] + [mood] + [technical requirements]
```

### Good Prompt Examples

**Hero background:**
```
modern city skyline at sunset, warm orange and purple gradient sky,
photorealistic, cinematic lighting, no text, horizontal composition
```

**Service illustration:**
```
isometric 3D illustration of cloud computing concept,
blue and white color scheme, clean minimal style,
floating servers and data connections
```

**Team placeholder:**
```
professional portrait of a confident male engineer,
40s, wearing casual business attire,
warm smile, neutral gray background,
studio lighting, high quality headshot
```

### Negative Prompts

Use `--negative-prompt` to avoid unwanted elements:

```bash
llm-imager generate -p "clean office interior" \
  --negative-prompt "people, text, watermarks, logos, clutter" \
  -o office.jpg
```

### Prompt Cheatsheet

```
[subject] + [style] + [colors] + [mood] + [constraints]

Example (hero):
modern office workspace, photorealistic, neutral blue-gray palette,
bright natural light, no people, no text, wide composition

Example (icon):
flat icon of a shield with checkmark, minimal, blue on white, no text
```

---

## Generating Multiple Images

Run llm-imager commands directly for each image:

```bash
OUTPUT_DIR="assets/images"
mkdir -p $OUTPUT_DIR

# Hero image
llm-imager generate -p "modern tech company office, bright natural light, minimalist design" \
  -o "$OUTPUT_DIR/hero.jpg" --aspect-ratio 16:9 --quality hd

# Feature icons
llm-imager generate -p "flat icon of a rocket launching, orange color, white background" \
  -o "$OUTPUT_DIR/icon-fast.png" --aspect-ratio 1:1 --size 512x512

llm-imager generate -p "flat icon of a shield with lock, blue color, white background" \
  -o "$OUTPUT_DIR/icon-secure.png" --aspect-ratio 1:1 --size 512x512

llm-imager generate -p "flat icon of a gear with sparkles, green color, white background" \
  -o "$OUTPUT_DIR/icon-easy.png" --aspect-ratio 1:1 --size 512x512

# Team photos
llm-imager generate -p "professional headshot, business woman, 30s, friendly smile" \
  -o "$OUTPUT_DIR/team-1.jpg" --aspect-ratio 1:1

llm-imager generate -p "professional headshot, business man, 40s, confident look" \
  -o "$OUTPUT_DIR/team-2.jpg" --aspect-ratio 1:1
```

**Important:** Execute commands directly during site generation. Do not create separate scripts.

---

## Image Specifications by Section

| Section | `--aspect-ratio` | `--size` (if needed) | Style |
|---------|-----------------|----------------------|-------|
| Hero background | `16:9` | `1792x1024` | Photo/Abstract |
| Feature icons | `1:1` | `512x512` | Flat/Isometric |
| Team photos | `1:1` | — | Portrait |
| Product images | `1:1` or `4:3` | — | Product photo |
| Blog featured | `16:9` | — | Illustration |
| Testimonial avatars | `1:1` | `256x256` | Portrait |
| Logo placeholder | `1:1` | `512x512` | Minimal |
| Gallery images | `4:3` | — | Photo |

---

## Style Consistency

For consistent look across images, reuse style descriptors:

**Corporate style:**
```
professional, clean, modern, blue color scheme, minimalist, high quality
```

**Creative style:**
```
vibrant colors, artistic, bold, dynamic composition, creative
```

**Tech style:**
```
futuristic, digital, gradient colors, abstract, tech aesthetic
```

**Natural style:**
```
organic, earth tones, warm lighting, authentic, natural textures
```

Add the style string to all prompts for the project:

```bash
STYLE="professional, clean, modern, blue color scheme"

llm-imager generate -p "office workspace, $STYLE" -o hero.jpg --aspect-ratio 16:9
llm-imager generate -p "team meeting, $STYLE" -o about.jpg --aspect-ratio 16:9
llm-imager generate -p "handshake, $STYLE" -o contact.jpg --aspect-ratio 16:9
```

---

## Integration with Design Spec

In technical.md, specify image requirements:

```markdown
## Images

generation: llm-imager
style: professional, modern, blue tones
output: assets/images/

images:
  - hero.jpg: "modern office with natural light, wide angle"
  - icon-speed.png: "flat rocket icon, orange, white background"
  - icon-security.png: "flat shield icon, blue, white background"
  - team-ceo.jpg: "professional headshot, male, 50s, confident"
```

---

## Output Structure

Generated images should be placed in project assets:

```
project/
├── index.html
└── assets/
    └── images/
        ├── hero.jpg
        ├── icon-speed.png
        ├── icon-security.png
        ├── team-1.jpg
        ├── team-2.jpg
        └── product.png
```

---

## Fallback Options

If llm-imager is not available:

1. **Local placeholders:** Use local SVGs copied from `modules/icons/` into `assets/icons/`
2. **Simple local assets:** Use neutral gradients or solid backgrounds in CSS
3. **Local photos:** Use project-provided assets in `assets/images/`

```html
<!-- Local SVG fallback -->
<img src="assets/icons/hero-placeholder.svg" alt="Hero">

<!-- Gradient fallback -->
<div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);"></div>
```

---
## Image Processing with Convert

For post-processing (resize, crop, optimize, format conversion), use:

- `modules/images/processing/README.md`

---

## Checklist

Before generating images:

- [ ] Image list identified from spec/design
- [ ] Defaults selected for each image type
- [ ] Style keywords defined for consistency
- [ ] Output directory created
- [ ] Prompts written with negative prompts if needed
- [ ] llm-imager configured with API keys
