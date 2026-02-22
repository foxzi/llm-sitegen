#!/bin/bash

# Download popular SVG icon sets
# Usage: ./download.sh

BASE_DIR="$(dirname "$0")"
TEMP_DIR=$(mktemp -d)

echo "Downloading icon sets..."

# Heroicons (Tailwind)
echo "Downloading Heroicons..."
mkdir -p "$BASE_DIR/heroicons"
curl -sL "https://github.com/tailwindlabs/heroicons/archive/refs/heads/master.zip" -o "$TEMP_DIR/heroicons.zip"
unzip -q "$TEMP_DIR/heroicons.zip" -d "$TEMP_DIR"
cp -r "$TEMP_DIR/heroicons-master/src/24/outline" "$BASE_DIR/heroicons/"
cp -r "$TEMP_DIR/heroicons-master/src/24/solid" "$BASE_DIR/heroicons/"
cp -r "$TEMP_DIR/heroicons-master/src/20/solid" "$BASE_DIR/heroicons/mini"
echo "  Done: heroicons (outline, solid, mini)"

# Feather Icons
echo "Downloading Feather Icons..."
mkdir -p "$BASE_DIR/feather"
curl -sL "https://github.com/feathericons/feather/archive/refs/heads/main.zip" -o "$TEMP_DIR/feather.zip"
unzip -q "$TEMP_DIR/feather.zip" -d "$TEMP_DIR"
cp "$TEMP_DIR/feather-main/icons/"*.svg "$BASE_DIR/feather/"
echo "  Done: feather"

# Lucide Icons (Feather fork with more icons)
echo "Downloading Lucide Icons..."
mkdir -p "$BASE_DIR/lucide"
curl -sL "https://github.com/lucide-icons/lucide/archive/refs/heads/main.zip" -o "$TEMP_DIR/lucide.zip"
unzip -q "$TEMP_DIR/lucide.zip" -d "$TEMP_DIR"
cp "$TEMP_DIR/lucide-main/icons/"*.svg "$BASE_DIR/lucide/"
echo "  Done: lucide"

# Bootstrap Icons
echo "Downloading Bootstrap Icons..."
mkdir -p "$BASE_DIR/bootstrap"
curl -sL "https://github.com/twbs/icons/archive/refs/heads/main.zip" -o "$TEMP_DIR/bootstrap.zip"
unzip -q "$TEMP_DIR/bootstrap.zip" -d "$TEMP_DIR"
cp "$TEMP_DIR/icons-main/icons/"*.svg "$BASE_DIR/bootstrap/"
echo "  Done: bootstrap"

# Tabler Icons
echo "Downloading Tabler Icons..."
mkdir -p "$BASE_DIR/tabler/outline"
mkdir -p "$BASE_DIR/tabler/filled"
curl -sL "https://github.com/tabler/tabler-icons/archive/refs/heads/main.zip" -o "$TEMP_DIR/tabler.zip"
unzip -q "$TEMP_DIR/tabler.zip" -d "$TEMP_DIR"
cp "$TEMP_DIR/tabler-icons-main/icons/outline/"*.svg "$BASE_DIR/tabler/outline/"
cp "$TEMP_DIR/tabler-icons-main/icons/filled/"*.svg "$BASE_DIR/tabler/filled/"
echo "  Done: tabler (outline, filled)"

# Phosphor Icons
echo "Downloading Phosphor Icons..."
mkdir -p "$BASE_DIR/phosphor"
curl -sL "https://github.com/phosphor-icons/core/archive/refs/heads/main.zip" -o "$TEMP_DIR/phosphor.zip"
unzip -q "$TEMP_DIR/phosphor.zip" -d "$TEMP_DIR"
cp -r "$TEMP_DIR/core-main/assets/regular" "$BASE_DIR/phosphor/"
cp -r "$TEMP_DIR/core-main/assets/bold" "$BASE_DIR/phosphor/"
cp -r "$TEMP_DIR/core-main/assets/fill" "$BASE_DIR/phosphor/"
echo "  Done: phosphor (regular, bold, fill)"

# Cleanup
rm -rf "$TEMP_DIR"

echo ""
echo "All icon sets downloaded!"
echo ""
echo "Icon sets:"
echo "  heroicons/ - Tailwind team icons (outline, solid, mini)"
echo "  feather/   - Simple, clean icons"
echo "  lucide/    - Extended Feather fork"
echo "  bootstrap/ - Bootstrap framework icons"
echo "  tabler/    - Large open source set (outline, filled)"
echo "  phosphor/  - Flexible icon family (regular, bold, fill)"
