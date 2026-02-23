#!/usr/bin/env bash
set -euo pipefail

# Quick test of OpenCode API connectivity.
# Usage: ./scripts/api-test.sh [server-url]

server_url="${OPENCODE_URL:-${1:-http://localhost:3000}}"

# Auth header (if OPENCODE_SERVER_PASSWORD is set)
auth_args=()
if [[ -n "${OPENCODE_SERVER_PASSWORD:-}" ]]; then
  auth_user="${OPENCODE_SERVER_USERNAME:-opencode}"
  auth_args=(-u "$auth_user:$OPENCODE_SERVER_PASSWORD")
fi

echo "Server: $server_url"
echo "---"

# Health check
echo -n "Health: "
health=$(curl -sf "${auth_args[@]+"${auth_args[@]}"}" "$server_url/global/health")
echo "$health" | jq -r '"ok (v" + .version + ")"' 2>/dev/null || echo "$health"

# List providers
echo -n "Providers: "
providers=$(curl -sf "${auth_args[@]+"${auth_args[@]}"}" "$server_url/provider")
echo "$providers" | jq -r '.connected | join(", ")' 2>/dev/null || echo "$providers"

# List sessions
echo -n "Sessions: "
sessions=$(curl -sf "${auth_args[@]+"${auth_args[@]}"}" "$server_url/session")
echo "$sessions" | jq -r 'length | tostring + " total"' 2>/dev/null || echo "$sessions"

echo "---"
echo "API spec: $server_url/doc"
