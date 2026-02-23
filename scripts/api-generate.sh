#!/usr/bin/env bash
set -euo pipefail

# Generate a website for a project via the OpenCode HTTP API.
#
# Usage:
#   ./scripts/api-generate.sh <project-name> [provider/model]
#
# Examples:
#   ./scripts/api-generate.sh 001_my-company
#   ./scripts/api-generate.sh 001_my-company anthropic/claude-sonnet-4
#   ./scripts/api-generate.sh 001_my-company openai/gpt-4o
#
# Environment:
#   OPENCODE_URL              Server URL (default: http://localhost:3000)
#   OPENCODE_SERVER_PASSWORD  Basic auth password (optional)
#   OPENCODE_SERVER_USERNAME  Basic auth username (default: opencode)

server_url="${OPENCODE_URL:-http://localhost:3000}"

# --- Args ---

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <project-name> [provider/model]" >&2
  echo "" >&2
  echo "Examples:" >&2
  echo "  $0 001_my-company" >&2
  echo "  $0 001_my-company anthropic/claude-sonnet-4" >&2
  exit 2
fi

project_name="$1"
model_spec="${2:-}"

# --- Validate project ---

project_dir="projects/$project_name"
specs_dir="$project_dir/specs"

if [[ ! -d "$specs_dir" ]]; then
  echo "Error: $specs_dir/ not found" >&2
  exit 2
fi

if [[ ! -f "$specs_dir/spec.md" ]]; then
  echo "Error: $specs_dir/spec.md not found" >&2
  exit 2
fi

if [[ ! -f "$specs_dir/design.md" ]]; then
  echo "Error: $specs_dir/design.md not found" >&2
  exit 2
fi

# --- Auth ---

auth_args=()
if [[ -n "${OPENCODE_SERVER_PASSWORD:-}" ]]; then
  auth_user="${OPENCODE_SERVER_USERNAME:-opencode}"
  auth_args=(-u "$auth_user:$OPENCODE_SERVER_PASSWORD")
fi

# --- Helper ---

api() {
  local method="$1" path="$2"
  shift 2
  curl -sf "${auth_args[@]+"${auth_args[@]}"}" \
    -X "$method" \
    -H "Content-Type: application/json" \
    "$server_url$path" \
    "$@"
}

# --- Health check ---

echo "Checking server at $server_url..."
if ! api GET /global/health > /dev/null 2>&1; then
  echo "Error: server not reachable at $server_url" >&2
  echo "Start it with: docker compose up" >&2
  exit 1
fi

# --- Build prompt ---

prompt="Read the following files and generate a website:

- master.md (main generation instructions)
- $specs_dir/spec.md (content specification)
- $specs_dir/design.md (design specification)"

# Include task.md if present
if [[ -f "$specs_dir/task.md" ]]; then
  prompt="$prompt
- $specs_dir/task.md (additional tasks)"
fi

prompt="$prompt

Generate the website according to the specifications.
Save all output files to $project_dir/build/"

# --- Build message body ---

body=$(jq -n \
  --arg prompt "$prompt" \
  '{
    parts: [{ type: "text", text: $prompt }]
  }')

# Add model if specified
if [[ -n "$model_spec" ]]; then
  provider_id="${model_spec%%/*}"
  model_id="${model_spec#*/}"
  body=$(echo "$body" | jq \
    --arg pid "$provider_id" \
    --arg mid "$model_id" \
    '. + { model: { providerID: $pid, modelID: $mid } }')
fi

# --- Create session ---

echo "Creating session for $project_name..."
session_response=$(api POST /session -d "{\"title\": \"$project_name\"}")
session_id=$(echo "$session_response" | jq -r '.id')

if [[ -z "$session_id" || "$session_id" == "null" ]]; then
  echo "Error: failed to create session" >&2
  echo "$session_response" >&2
  exit 1
fi

echo "Session: $session_id"

# --- Send prompt ---

echo "Generating site with ${model_spec:-default model}..."
echo "This may take a few minutes..."
echo ""

response=$(api POST "/session/$session_id/message" -d "$body")

# --- Report ---

echo ""
echo "--- Done ---"
echo "Session: $session_id"
echo "Output:  $project_dir/build/"
echo ""

# Show summary from response
echo "$response" | jq -r '
  .parts[]? |
  select(.type == "text") |
  .text' 2>/dev/null | head -20

echo ""
echo "View full session: $server_url (open in browser)"
