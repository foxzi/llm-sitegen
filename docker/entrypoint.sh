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

# Build prompt
prompt="Read master.md, $specs_dir/spec.md, $specs_dir/design.md."

if [[ -f "$specs_dir/task.md" ]]; then
  prompt="$prompt Also read $specs_dir/task.md."
fi

prompt="$prompt Generate the website and save all output to $build_dir/"

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

echo "Project: $project_name"
echo "Output:  $build_dir/"
echo "Model:   ${model_spec:-default}"
echo ""

opencode run "${run_args[@]}" "$prompt"

echo ""
echo "Done. Output: $build_dir/"
