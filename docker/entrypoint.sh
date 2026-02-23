#!/usr/bin/env bash
set -euo pipefail

spec_dir="/spec"
design_dir="/design"
output_dir="/output"
opencode_config_dir="/opencode"
llm_imager_config_dir="/llm-imager"

prompt="${1:-}"

if [[ -z "$prompt" ]]; then
  echo "Error: prompt argument is required" >&2
  echo "Usage: llm-sitegen \"<prompt>\"" >&2
  exit 2
fi

if [[ ! -d "$spec_dir" ]]; then
  echo "Error: /spec is not mounted" >&2
  exit 2
fi

if [[ ! -d "$design_dir" ]]; then
  echo "Error: /design is not mounted" >&2
  exit 2
fi

if [[ ! -d "$output_dir" ]]; then
  echo "Error: /output is not mounted" >&2
  exit 2
fi

spec_file="$spec_dir/spec.md"
design_file="$design_dir/design.md"

if [[ ! -f "$spec_file" ]]; then
  echo "Error: /spec/spec.md not found" >&2
  exit 2
fi

if [[ ! -f "$design_file" ]]; then
  echo "Error: /design/design.md not found" >&2
  exit 2
fi

if [[ -d "$opencode_config_dir" ]]; then
  export XDG_CONFIG_HOME="$opencode_config_dir"
fi

llm_imager_config_file="$llm_imager_config_dir/llm-imager.yaml"
if [[ -f "$llm_imager_config_file" ]]; then
  cp "$llm_imager_config_file" "$HOME/.llm-imager.yaml"
fi

input_prompt="$(cat /app/master.md "$spec_file" "$design_file")

$prompt"

opencode run --file /app/master.md --file "$spec_file" --file "$design_file" \
  "$prompt" \
  > "$output_dir/index.html"

echo "Generated: $output_dir/index.html"
