#!/usr/bin/env bash
set -euo pipefail

project_dir="/app/llm-sitegen"
projects_dir="$project_dir/projects"

project_name="${1:-}"

if [[ -z "$project_name" ]]; then
  echo "Error: project name is required" >&2
  echo "Usage: llm-sitegen <project-name> [prompt]" >&2
  echo "" >&2
  echo "Available projects:" >&2
  ls -1 "$projects_dir" 2>/dev/null | grep -v '^\.' || echo "  (none)" >&2
  exit 2
fi

shift
prompt="${1:-Generate website according to master.md instructions}"

source_dir="$projects_dir/$project_name"

if [[ ! -d "$source_dir" ]]; then
  echo "Error: project '$project_name' not found in $projects_dir" >&2
  exit 2
fi

specs_dir="$source_dir/specs"
spec_file="$specs_dir/spec.md"
design_file="$specs_dir/design.md"

if [[ ! -d "$specs_dir" ]]; then
  echo "Error: specs/ directory not found in $source_dir" >&2
  exit 2
fi

if [[ ! -f "$spec_file" ]]; then
  echo "Error: spec.md not found in $specs_dir" >&2
  exit 2
fi

if [[ ! -f "$design_file" ]]; then
  echo "Error: design.md not found in $specs_dir" >&2
  exit 2
fi

output_dir="$source_dir/build"
mkdir -p "$output_dir"

opencode run \
  --file "$project_dir/master.md" \
  --file "$spec_file" \
  --file "$design_file" \
  "$prompt" \
  > "$output_dir/index.html"

echo "Generated: $output_dir/index.html"
