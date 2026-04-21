#!/bin/sh
set -eu

if [ -z "${TUNNEL_TOKEN:-}" ]; then
  echo "ERROR: TUNNEL_TOKEN is required" >&2
  exit 1
fi

echo "Starting cloudflared tunnel..." >&2
cloudflared tunnel --no-autoupdate run --token "$TUNNEL_TOKEN" &

echo "Starting CELERITY: $*" >&2
exec "$@"
