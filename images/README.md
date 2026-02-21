# Images - LLM Instructions

Instructions for generating images for websites using llm-imager CLI tool.

## Prerequisites

The `llm-imager` tool must be installed and configured locally by the user.

**Installation:** https://github.com/foxzi/llm-imager

```bash
# Debian/Ubuntu
echo "deb [trusted=yes] https://foxzi.github.io/llm-imager/apt stable main" | sudo tee /etc/apt/sources.list.d/llm-imager.list
sudo apt update && sudo apt install llm-imager

# Or via Go
go install github.com/foxzi/llm-imager/cmd/llm-imager@latest
```

---

## How to Use

1. Identify images needed from spec.md/design.md
2. Generate prompts for each image
3. Create llm-imager commands
4. Output images to project assets folder

---

## Basic Command

```bash
llm-imager -p "prompt" -o output.png --size 1024x1024
```

**Parameters:**
| Flag | Description |
|------|-------------|
| `-p, --prompt` | Image description (required) |
| `-o, --output` | Output file path (required) |
| `-m, --model` | Model to use |
| `--size` | Dimensions (e.g., 1024x1024, 1792x1024) |
| `--quality` | standard/hd or low/medium/high |
| `--style` | natural/vivid |
| `--negative-prompt` | What to avoid |
| `--seed` | For reproducibility |

---

## Image Types for Websites

### Hero Images

Large background images for hero sections.

**Recommended size:** 1792x1024 (landscape)

```bash
llm-imager -p "modern office workspace with natural light, minimalist design, professional atmosphere, no people" \
  -o assets/images/hero-bg.jpg \
  --size 1792x1024 \
  --quality hd
```

### Feature Icons/Illustrations

Small illustrations for feature sections.

**Recommended size:** 512x512 or 1024x1024

```bash
llm-imager -p "simple flat icon of a shield with checkmark, blue color, white background, minimal style" \
  -o assets/images/icon-security.png \
  --size 1024x1024 \
  --style natural
```

### Team Photos (Placeholders)

AI-generated placeholder portraits.

**Recommended size:** 1024x1024 (square)

```bash
llm-imager -p "professional headshot of a smiling business woman, 30s, neutral background, corporate style" \
  -o assets/images/team-1.jpg \
  --size 1024x1024 \
  --quality hd
```

### Product Images

Product photos or mockups.

**Recommended size:** 1024x1024 or custom aspect ratio

```bash
llm-imager -p "smartphone mockup showing app interface, floating on gradient background, professional product photography" \
  -o assets/images/product-mockup.png \
  --size 1024x1024 \
  --quality hd
```

### Background Patterns

Subtle patterns for sections.

**Recommended size:** 512x512 (tileable)

```bash
llm-imager -p "seamless geometric pattern, subtle blue lines on white, minimal, tileable texture" \
  -o assets/images/pattern-bg.png \
  --size 512x512
```

### Blog/Article Images

Featured images for blog posts.

**Recommended size:** 1200x630 (Open Graph compatible)

```bash
llm-imager -p "abstract illustration of digital transformation, blue and purple gradient, modern tech style" \
  -o assets/images/blog-featured.jpg \
  --size 1792x1024 \
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
llm-imager -p "clean office interior" \
  --negative-prompt "people, text, watermarks, logos, clutter" \
  -o office.jpg
```

---

## Batch Generation Script

For multiple images, create a shell script:

```bash
#!/bin/bash
# generate-images.sh

OUTPUT_DIR="assets/images"
mkdir -p $OUTPUT_DIR

# Hero image
llm-imager -p "modern tech company office, bright natural light, minimalist design" \
  -o "$OUTPUT_DIR/hero.jpg" --size 1792x1024 --quality hd

# Feature icons
llm-imager -p "flat icon of a rocket launching, orange color, white background" \
  -o "$OUTPUT_DIR/icon-fast.png" --size 512x512

llm-imager -p "flat icon of a shield with lock, blue color, white background" \
  -o "$OUTPUT_DIR/icon-secure.png" --size 512x512

llm-imager -p "flat icon of a gear with sparkles, green color, white background" \
  -o "$OUTPUT_DIR/icon-easy.png" --size 512x512

# Team photos
llm-imager -p "professional headshot, business woman, 30s, friendly smile" \
  -o "$OUTPUT_DIR/team-1.jpg" --size 1024x1024

llm-imager -p "professional headshot, business man, 40s, confident look" \
  -o "$OUTPUT_DIR/team-2.jpg" --size 1024x1024

echo "Images generated in $OUTPUT_DIR"
```

---

## Image Specifications by Section

| Section | Aspect Ratio | Size | Style |
|---------|--------------|------|-------|
| Hero background | 16:9 | 1792x1024 | Photo/Abstract |
| Feature icons | 1:1 | 512x512 | Flat/Isometric |
| Team photos | 1:1 | 1024x1024 | Portrait |
| Product images | 1:1 or 4:3 | 1024x1024 | Product photo |
| Blog featured | 1.91:1 | 1200x630 | Illustration |
| Testimonial avatars | 1:1 | 256x256 | Portrait |
| Logo placeholder | 1:1 | 512x512 | Minimal |
| Gallery images | Various | 1024x768 | Photo |

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

llm-imager -p "office workspace, $STYLE" -o hero.jpg
llm-imager -p "team meeting, $STYLE" -o about.jpg
llm-imager -p "handshake, $STYLE" -o contact.jpg
```

---

## Integration with Design Spec

In design.md, specify image requirements:

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

1. **Placeholder services:** Use placeholder.com or similar
2. **Stock photos:** Unsplash, Pexels (with attribution)
3. **SVG illustrations:** Use icons from `icons/` directory
4. **CSS gradients:** For abstract backgrounds

```html
<!-- Placeholder fallback -->
<img src="https://via.placeholder.com/1792x1024" alt="Hero">

<!-- Gradient fallback -->
<div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);"></div>
```

---

---

## Image Processing with Convert

Use ImageMagick `convert` for post-processing: resize, crop, optimize, format conversion.

### Basic Commands

**Resize (keep aspect ratio):**
```bash
convert input.jpg -resize 800x600 output.jpg
```

**Resize (exact dimensions, may distort):**
```bash
convert input.jpg -resize 800x600! output.jpg
```

**Resize (fit within bounds):**
```bash
convert input.jpg -resize 800x600\> output.jpg
```

**Crop (width x height + offset):**
```bash
convert input.jpg -crop 800x600+100+50 output.jpg
```

**Crop to aspect ratio (center):**
```bash
convert input.jpg -gravity center -crop 16:9 +repage output.jpg
```

### Common Operations

**Convert format:**
```bash
convert input.png output.jpg
convert input.jpg output.webp
```

**Optimize JPEG (quality 80%):**
```bash
convert input.jpg -quality 80 output.jpg
```

**Optimize PNG:**
```bash
convert input.png -strip -quality 85 output.png
```

**Create thumbnail:**
```bash
convert input.jpg -thumbnail 200x200^ -gravity center -extent 200x200 thumb.jpg
```

**Add white background (for transparent PNGs):**
```bash
convert input.png -background white -flatten output.jpg
```

**Batch resize all images in folder:**
```bash
for img in *.jpg; do
  convert "$img" -resize 800x600 "resized_$img"
done
```

### Website-Specific Tasks

**Hero image (optimize for web):**
```bash
convert hero-original.jpg -resize 1920x1080 -quality 85 -strip hero.jpg
```

**Favicon from logo:**
```bash
convert logo.png -resize 32x32 favicon.ico
convert logo.png -resize 16x16 favicon-16.png
convert logo.png -resize 32x32 favicon-32.png
convert logo.png -resize 180x180 apple-touch-icon.png
convert logo.png -resize 192x192 android-chrome-192.png
convert logo.png -resize 512x512 android-chrome-512.png
```

**Open Graph image (exact 1200x630):**
```bash
convert input.jpg -resize 1200x630^ -gravity center -extent 1200x630 og-image.jpg
```

**Team photo (square crop):**
```bash
convert photo.jpg -gravity center -crop 1:1 +repage -resize 400x400 team-member.jpg
```

**Product image (white background, square):**
```bash
convert product.png -gravity center -background white -extent 1000x1000 product-square.jpg
```

**Create WebP versions (smaller file size):**
```bash
for img in *.jpg; do
  convert "$img" -quality 80 "${img%.jpg}.webp"
done
```

### Batch Processing Script

```bash
#!/bin/bash
# process-images.sh

INPUT_DIR="assets/images/original"
OUTPUT_DIR="assets/images"

mkdir -p "$OUTPUT_DIR"

# Process hero images
for img in "$INPUT_DIR"/hero-*.jpg; do
  [ -f "$img" ] || continue
  name=$(basename "$img")
  convert "$img" -resize 1920x1080 -quality 85 -strip "$OUTPUT_DIR/$name"
done

# Process team photos (square)
for img in "$INPUT_DIR"/team-*.jpg; do
  [ -f "$img" ] || continue
  name=$(basename "$img")
  convert "$img" -gravity center -crop 1:1 +repage -resize 400x400 -quality 85 "$OUTPUT_DIR/$name"
done

# Process icons (ensure PNG, resize)
for img in "$INPUT_DIR"/icon-*.png; do
  [ -f "$img" ] || continue
  name=$(basename "$img")
  convert "$img" -resize 128x128 "$OUTPUT_DIR/$name"
done

# Create WebP versions
for img in "$OUTPUT_DIR"/*.jpg; do
  [ -f "$img" ] || continue
  convert "$img" -quality 80 "${img%.jpg}.webp"
done

echo "Images processed in $OUTPUT_DIR"
```

### Integration with Design Spec

In design.md, specify processing requirements:

```markdown
## Images

processing:
  hero.jpg:
    resize: 1920x1080
    quality: 85
  team-*.jpg:
    crop: 1:1
    resize: 400x400
  icons:
    resize: 128x128
    format: png
  all:
    webp: true  # create WebP versions
```

### Quick Reference

| Task | Command |
|------|---------|
| Resize | `-resize 800x600` |
| Exact resize | `-resize 800x600!` |
| Crop | `-crop 800x600+0+0` |
| Center crop | `-gravity center -crop 800x600+0+0` |
| Quality | `-quality 85` |
| Strip metadata | `-strip` |
| Format | just change extension |
| Thumbnail | `-thumbnail 200x200^` |
| White background | `-background white -flatten` |
| Aspect crop | `-gravity center -crop 16:9 +repage` |

---

## Checklist

Before generating images:

- [ ] Image list identified from spec/design
- [ ] Sizes determined for each image
- [ ] Style keywords defined for consistency
- [ ] Output directory created
- [ ] Prompts written with negative prompts if needed
- [ ] llm-imager configured with API keys
