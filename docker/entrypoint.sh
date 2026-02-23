#!/usr/bin/env bash
set -euo pipefail

# Batch-mode entrypoint for llm-sitegen.
#
# Usage inside container:
#   Generate:  entrypoint.sh <project-id> [provider/model]
#   Refine:    entrypoint.sh <project-id> --refine <version-num> [--model provider/model] "instructions"
#
# Examples:
#   entrypoint.sh 091bc65b-... anthropic/claude-sonnet-4
#   entrypoint.sh 091bc65b-... --refine 3 "Change header color to blue"
#   entrypoint.sh 091bc65b-... --refine 3 --model anthropic/claude-sonnet-4 "Add contact form"

project_dir="/app/llm-sitegen"
modules_dir="$project_dir/modules"
projects_dir="$project_dir/projects"

project_name="${1:-}"

if [[ -z "$project_name" ]]; then
  echo "Error: project name is required" >&2
  echo "Usage:" >&2
  echo "  entrypoint.sh <project-id> [provider/model]" >&2
  echo "  entrypoint.sh <project-id> --refine <version-num> [--model provider/model] \"instructions\"" >&2
  exit 2
fi

shift

# Parse mode: --refine or generate
refine_mode=false
refine_version=""
model_spec=""
refine_instructions=""

if [[ "${1:-}" == "--refine" ]]; then
  refine_mode=true
  shift
  refine_version="${1:-}"
  if [[ -z "$refine_version" ]]; then
    echo "Error: version number is required for --refine" >&2
    exit 2
  fi
  shift
  # Parse optional --model
  if [[ "${1:-}" == "--model" ]]; then
    shift
    model_spec="${1:-}"
    shift
  fi
  # Remaining args are the instructions
  refine_instructions="$*"
  if [[ -z "$refine_instructions" ]]; then
    echo "Error: refinement instructions are required" >&2
    exit 2
  fi
else
  model_spec="${1:-}"
fi

# Validate project structure
specs_dir="$projects_dir/$project_name/specs"
build_dir="$projects_dir/$project_name/build"

# Common: attach to running opencode server if available
opencode_url="${OPENCODE_URL:-http://localhost:${OPENCODE_PORT:-3000}}"
attach_args=()
if curl -sf "$opencode_url/global/health" >/dev/null 2>&1; then
  attach_args=(--attach "$opencode_url")
fi

# ============================================================
# REFINE MODE
# ============================================================
if [[ "$refine_mode" == true ]]; then
  version_dir="$projects_dir/$project_name/versions/$refine_version"

  if [[ ! -d "$version_dir" ]]; then
    echo "Error: version directory not found: $version_dir" >&2
    exit 2
  fi

  # List existing files for context
  file_list=$(find "$version_dir" -type f -printf "%P\n" 2>/dev/null | sort)

  prompt="You are modifying an existing website. The site files are in $version_dir/."
  prompt="$prompt Here are the existing files:"
  prompt="$prompt $file_list"
  prompt="$prompt"
  prompt="$prompt User instructions: $refine_instructions"
  prompt="$prompt"
  prompt="$prompt Read the existing files, apply the requested changes, and save modified files back to $version_dir/."
  prompt="$prompt Keep all existing files unless the user explicitly asks to remove something."
  prompt="$prompt IMPORTANT: ONLY write files inside $version_dir/. Do NOT create, modify, or delete any files outside of $version_dir/."
  prompt="$prompt You are running in non-interactive batch mode. Do NOT ask questions, do NOT wait for confirmation. Make all decisions yourself and complete the task fully."

  # Build run arguments — attach all existing HTML/CSS/JS files
  run_args=(
    --title "refine-$project_name-v$refine_version"
  )

  for f in "$version_dir"/*.html "$version_dir"/*.css "$version_dir"/assets/css/*.css; do
    [[ -f "$f" ]] && run_args+=(--file "$f")
  done

  if [[ -n "$model_spec" ]]; then
    run_args+=(--model "$model_spec")
  fi

  run_args+=("${attach_args[@]}")

  echo "=== Version Refinement Log ==="
  echo "Timestamp:    $(date -Iseconds)"
  echo "Project:      $project_name"
  echo "Version:      $refine_version"
  echo "Version dir:  $version_dir/"
  echo "Model:        ${model_spec:-default}"
  echo "Instructions: $refine_instructions"
  echo ""
  echo "--- Run arguments ---"
  printf "  %s\n" "${run_args[@]}"
  echo ""
  echo "--- Prompt ---"
  echo "$prompt"
  echo "--- End prompt ---"
  echo ""

  opencode run "${run_args[@]}" "$prompt"

  echo ""
  echo "=== Refinement complete ==="
  echo "Timestamp: $(date -Iseconds)"
  echo "Output: $version_dir/"
  echo "Files:"
  find "$version_dir" -type f -printf "  %p (%s bytes)\n" 2>/dev/null || ls -lR "$version_dir"
  exit 0
fi

# ============================================================
# GENERATE MODE
# ============================================================

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
prompt="$prompt IMPORTANT: ONLY write files inside $build_dir/. Do NOT create, modify, or delete any files outside of $build_dir/."
prompt="$prompt You are running in non-interactive batch mode. Do NOT ask questions, do NOT wait for confirmation. Make all decisions yourself and complete the task fully."

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

run_args+=("${attach_args[@]}")

echo "=== Site Generation Log ==="
echo "Timestamp: $(date -Iseconds)"
echo "Project:   $project_name"
echo "Specs:     $specs_dir/"
echo "Output:    $build_dir/"
echo "Model:     ${model_spec:-default}"
echo "Framework: ${framework:-auto}"
echo ""
echo "--- Run arguments ---"
printf "  %s\n" "${run_args[@]}"
echo ""
echo "--- Prompt ---"
echo "$prompt"
echo "--- End prompt ---"
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

# Check for remaining modules/ references
for html_file in "$build_dir"/*.html; do
  [[ -f "$html_file" ]] || continue
  remaining=$(grep -oP 'modules/[^"'"'"']+' "$html_file" 2>/dev/null || true)
  if [[ -n "$remaining" ]]; then
    echo "Warning: remaining modules/ references in $(basename "$html_file"):"
    echo "$remaining"
  fi
done

echo ""
echo "=== Generation complete ==="
echo "Timestamp: $(date -Iseconds)"
echo "Output: $build_dir/"
echo "Files:"
find "$build_dir" -type f -printf "  %p (%s bytes)\n" 2>/dev/null || ls -lR "$build_dir"
