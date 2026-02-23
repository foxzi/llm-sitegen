#!/usr/bin/env bash
set -euo pipefail

# Batch-mode entrypoint for llm-sitegen.
#
# Usage inside container:
#   entrypoint.sh <project-name> [model]
#
# Examples:
#   entrypoint.sh 001_my-company
#   entrypoint.sh 001_my-company anthropic/claude-sonnet-4

project_dir="/app/llm-sitegen"
modules_dir="$project_dir/modules"
projects_dir="$project_dir/projects"

project_name="${1:-}"

if [[ -z "$project_name" ]]; then
  echo "Error: project name is required" >&2
  echo "Usage: entrypoint.sh <project-name> [provider/model]" >&2
  echo "" >&2
  echo "Available projects:" >&2
  ls -1 "$projects_dir" 2>/dev/null | grep -v '^\.' || echo "  (none)" >&2
  exit 2
fi

shift
model_spec="${1:-}"

# Validate project structure
specs_dir="$projects_dir/$project_name/specs"
build_dir="$projects_dir/$project_name/build"

if [[ ! -d "$specs_dir" ]]; then
  echo "Error: $specs_dir/ not found" >&2
  exit 2
fi

if [[ ! -f "$specs_dir/spec.md" ]]; then
  echo "Error: spec.md not found in $specs_dir/" >&2
  exit 2
fi

if [[ ! -f "$specs_dir/design.md" ]]; then
  echo "Error: design.md not found in $specs_dir/" >&2
  exit 2
fi

mkdir -p "$build_dir"

# --- Phase 1: Pre-copy assets based on design.md ---

design_lower=$(tr '[:upper:]' '[:lower:]' < "$specs_dir/design.md")

# Detect framework from design.md
framework=""
for fw in tailwind bootstrap bulma pico water milligram uikit; do
  if echo "$design_lower" | grep -q "$fw"; then
    framework="$fw"
    break
  fi
done

# Copy framework CSS/JS to build/assets/css/ and build/assets/js/
if [[ -n "$framework" ]] && [[ -d "$modules_dir/frameworks/$framework/dist" ]]; then
  echo "Pre-copying framework: $framework"
  mkdir -p "$build_dir/assets/css" "$build_dir/assets/js"
  for f in "$modules_dir/frameworks/$framework/dist/"*.css; do
    [[ -f "$f" ]] && cp "$f" "$build_dir/assets/css/"
  done
  for f in "$modules_dir/frameworks/$framework/dist/"*.js; do
    [[ -f "$f" ]] && cp "$f" "$build_dir/assets/js/"
  done
fi

# Copy Alpine.js if referenced
if echo "$design_lower" | grep -q "alpine"; then
  if [[ -d "$modules_dir/frameworks/alpinejs/dist" ]]; then
    echo "Pre-copying Alpine.js"
    mkdir -p "$build_dir/assets/js"
    cp "$modules_dir/frameworks/alpinejs/dist/"*.js "$build_dir/assets/js/" 2>/dev/null || true
  fi
fi

# Detect and copy fonts from design.md
available_fonts=$(ls -1 "$modules_dir/fonts/" 2>/dev/null | grep -v '^\.' | grep -v README | grep -v download | grep -v index)
for font_dir in $available_fonts; do
  font_search=$(echo "$font_dir" | tr '-' ' ')
  if echo "$design_lower" | grep -qi "$font_search\|$font_dir"; then
    if [[ -d "$modules_dir/fonts/$font_dir" ]]; then
      echo "Pre-copying font: $font_dir"
      mkdir -p "$build_dir/assets/fonts/$font_dir"
      cp "$modules_dir/fonts/$font_dir/"*.woff2 "$build_dir/assets/fonts/$font_dir/" 2>/dev/null || true
      cp "$modules_dir/fonts/$font_dir/local.css" "$build_dir/assets/fonts/$font_dir/" 2>/dev/null || true
    fi
  fi
done

# Copy base.css color template
mkdir -p "$build_dir/assets/css"
cp "$modules_dir/colors/base.css" "$build_dir/assets/css/base.css" 2>/dev/null || true

# Build list of pre-copied assets for prompt
assets_note=""
if [[ -n "$framework" ]]; then
  assets_note="Framework $framework CSS is pre-copied to $build_dir/assets/css/. "
fi
if ls "$build_dir/assets/fonts/" >/dev/null 2>&1; then
  fonts_list=$(ls -1 "$build_dir/assets/fonts/" 2>/dev/null | tr '\n' ', ' | sed 's/,$//')
  if [[ -n "$fonts_list" ]]; then
    assets_note="${assets_note}Fonts ($fonts_list) are pre-copied to $build_dir/assets/fonts/. "
  fi
fi

# --- Phase 2: Run LLM generation ---

prompt="Read master.md, $specs_dir/spec.md, $specs_dir/design.md."

if [[ -f "$specs_dir/task.md" ]]; then
  prompt="$prompt Also read $specs_dir/task.md."
fi

prompt="$prompt Generate the website and save all output to $build_dir/."
prompt="$prompt ${assets_note}Use these pre-copied files with relative paths from HTML:"
prompt="$prompt CSS framework: assets/css/, fonts: assets/fonts/<name>/local.css, custom styles: assets/css/style.css."
prompt="$prompt NEVER use paths containing 'modules/' in HTML or CSS. All asset references must start with 'assets/'."

# Build opencode run arguments
run_args=(
  --file "$project_dir/master.md"
  --file "$specs_dir/spec.md"
  --file "$specs_dir/design.md"
  --title "$project_name"
)

if [[ -f "$specs_dir/task.md" ]]; then
  run_args+=(--file "$specs_dir/task.md")
fi

if [[ -n "$model_spec" ]]; then
  run_args+=(--model "$model_spec")
fi

# Attach to running opencode server if available
opencode_url="${OPENCODE_URL:-http://localhost:${OPENCODE_PORT:-3000}}"
if curl -sf "$opencode_url/global/health" >/dev/null 2>&1; then
  run_args+=(--attach "$opencode_url")
fi

echo "Project: $project_name"
echo "Output:  $build_dir/"
echo "Model:   ${model_spec:-default}"
echo "Framework: ${framework:-auto}"
echo ""

opencode run "${run_args[@]}" "$prompt"

# --- Phase 3: Post-process — fix any remaining modules/ references ---

echo ""
echo "Post-processing: fixing asset paths..."

for html_file in "$build_dir"/*.html; do
  [[ -f "$html_file" ]] || continue

  # Fix framework CSS paths: ../../modules/frameworks/<name>/dist/<file>.css -> assets/css/<file>.css
  sed -i 's|[^"]*modules/frameworks/[^/]*/dist/\([^"]*\.css\)|assets/css/\1|g' "$html_file"

  # Fix framework JS paths: ../../modules/frameworks/<name>/dist/<file>.js -> assets/js/<file>.js
  sed -i 's|[^"]*modules/frameworks/[^/]*/dist/\([^"]*\.js\)|assets/js/\1|g' "$html_file"

  # Fix font paths: ../../modules/fonts/<name>/local.css -> assets/fonts/<name>/local.css
  sed -i 's|[^"]*modules/fonts/\([^"]*\)|assets/fonts/\1|g' "$html_file"

  # Fix color base.css: ../../modules/colors/base.css -> assets/css/base.css
  sed -i 's|[^"]*modules/colors/base\.css|assets/css/base.css|g' "$html_file"
done

# Also copy any modules/ assets referenced in HTML that weren't pre-copied
for html_file in "$build_dir"/*.html; do
  [[ -f "$html_file" ]] || continue

  # Find any remaining modules/ references (shouldn't be any after sed, but just in case)
  remaining=$(grep -oP 'modules/[^"'"'"']+' "$html_file" 2>/dev/null || true)
  if [[ -n "$remaining" ]]; then
    echo "Warning: remaining modules/ references in $(basename "$html_file"):"
    echo "$remaining"
  fi
done

echo ""
echo "Done. Output: $build_dir/"
