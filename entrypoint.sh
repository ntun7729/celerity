#!/bin/sh
set -e

: "${TUNNEL_TOKEN:?TUNNEL_TOKEN is required}"

cloudflared tunnel --no-autoupdate run --token "$TUNNEL_TOKEN" &

exec "$@"
