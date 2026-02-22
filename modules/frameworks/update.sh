#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DRY_RUN=false

if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=true
fi

download() {
  local url="$1"
  local out="$2"
  mkdir -p "$(dirname "$out")"

  if $DRY_RUN; then
    printf '[dry-run] %s -> %s\n' "$url" "$out"
    return 0
  fi

  printf 'Downloading %s\n' "$out"
  curl -fL "$url" -o "$out"
}

# tailwind

download "https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.css" \
  "$ROOT_DIR/tailwind/dist/tailwind.css"

# bootstrap

download "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" \
  "$ROOT_DIR/bootstrap/dist/bootstrap.min.css"

download "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" \
  "$ROOT_DIR/bootstrap/dist/bootstrap.bundle.min.js"

# bulma

download "https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/bulma.min.css" \
  "$ROOT_DIR/bulma/dist/bulma.min.css"

# uikit

download "https://cdn.jsdelivr.net/npm/uikit@3.21.6/dist/css/uikit.min.css" \
  "$ROOT_DIR/uikit/dist/uikit.min.css"

download "https://cdn.jsdelivr.net/npm/uikit@3.21.6/dist/js/uikit.min.js" \
  "$ROOT_DIR/uikit/dist/uikit.min.js"

download "https://cdn.jsdelivr.net/npm/uikit@3.21.6/dist/js/uikit-icons.min.js" \
  "$ROOT_DIR/uikit/dist/uikit-icons.min.js"

# pico

download "https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css" \
  "$ROOT_DIR/pico/dist/pico.min.css"

# water

download "https://cdn.jsdelivr.net/npm/water.css@2/out/water.min.css" \
  "$ROOT_DIR/water/dist/water.min.css"

download "https://cdn.jsdelivr.net/npm/water.css@2/out/dark.min.css" \
  "$ROOT_DIR/water/dist/water-dark.min.css"

# milligram

download "https://cdn.jsdelivr.net/npm/normalize.css@8.0.1/normalize.min.css" \
  "$ROOT_DIR/milligram/dist/normalize.min.css"

download "https://cdn.jsdelivr.net/npm/milligram@1.4.1/dist/milligram.min.css" \
  "$ROOT_DIR/milligram/dist/milligram.min.css"

# alpinejs

download "https://cdn.jsdelivr.net/npm/alpinejs@3.14.8/dist/cdn.min.js" \
  "$ROOT_DIR/alpinejs/dist/alpine.min.js"

# htmx

download "https://cdn.jsdelivr.net/npm/htmx.org@1.9.12/dist/htmx.min.js" \
  "$ROOT_DIR/htmx/dist/htmx.min.js"

printf 'Done.\n'
