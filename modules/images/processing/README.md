# Image Processing - Convert (Post-Processing)

See global rules: `modules/README.md`.

Instructions for post-processing images with ImageMagick `convert`.

## Purpose

Define post-processing steps for local images.

## How to Use

1. Use `convert` on files in `assets/images/`
2. Save results back to `assets/images/`

## Examples

```bash
convert assets/images/hero.jpg -resize 1920x1080 -quality 85 -strip assets/images/hero.jpg
```

## Rules

- Post-processing scripts are allowed
- Keep outputs in `assets/images/`

## Checklist

- [ ] Inputs from assets/images
- [ ] Outputs saved to assets/images

## References

- `modules/images/processing/README.md`

---

## Basic Commands

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

---

## Common Operations

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

---

## Website-Specific Tasks

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

---

## Batch Processing Script

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

---

## Integration with Design Spec

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

---

## Quick Reference

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
