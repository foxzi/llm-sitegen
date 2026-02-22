#!/bin/bash

# Download Google Fonts for local use
# Usage: ./download.sh [--dry-run]

DRY_RUN=false
if [ "$1" == "--dry-run" ]; then
  DRY_RUN=true
  echo "Dry run mode - showing what would be downloaded"
fi

UA="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
BASE_DIR="$(dirname "$0")"

download_font() {
  local name=$1
  local family=$2
  local weights=$3
  local dir="$BASE_DIR/$name"

  echo "Downloading $name..."

  mkdir -p "$dir"

  # Get CSS with woff2 URLs
  local css_url="https://fonts.googleapis.com/css2?family=${family}:wght@${weights}&display=swap"
  local css=$(curl -s "$css_url" -H "User-Agent: $UA")

  if [ "$DRY_RUN" == "true" ]; then
    echo "  Would download from: $css_url"
    echo "  To directory: $dir"
    return
  fi

  # Extract and download woff2 files
  echo "$css" | grep -oP 'url\(\K[^)]+\.woff2' | while read url; do
    local filename=$(basename "$url" | cut -d'?' -f1)
    echo "  Downloading $filename"
    curl -s "$url" -o "$dir/$filename"
  done

  # Save CSS file
  echo "$css" > "$dir/font.css"

  # Create local CSS with relative paths
  echo "$css" | sed 's|https://fonts.gstatic.com/s/[^/]*/[^/]*/|./|g' > "$dir/local.css"

  echo "  Done: $name"
}

# Sans-serif fonts
download_font "inter" "Inter" "400;500;600;700"
download_font "roboto" "Roboto" "400;500;700"
download_font "open-sans" "Open+Sans" "400;500;600;700"
download_font "lato" "Lato" "400;700"
download_font "poppins" "Poppins" "400;500;600;700"
download_font "montserrat" "Montserrat" "400;500;600;700"
download_font "nunito" "Nunito" "400;600;700"
download_font "raleway" "Raleway" "400;500;600;700"
download_font "source-sans" "Source+Sans+3" "400;600;700"

# Serif fonts
download_font "playfair-display" "Playfair+Display" "400;500;600;700"
download_font "merriweather" "Merriweather" "400;700"
download_font "source-serif" "Source+Serif+4" "400;600;700"
download_font "lora" "Lora" "400;500;600;700"
download_font "pt-serif" "PT+Serif" "400;700"

# Mono fonts
download_font "fira-code" "Fira+Code" "400;500;600;700"
download_font "jetbrains-mono" "JetBrains+Mono" "400;500;700"

echo ""
echo "All fonts downloaded!"
