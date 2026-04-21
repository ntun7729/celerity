# Celerity + Cloudflare Tunnel

Thin wrapper image around `clickdevtech/hysteria-panel:latest` that starts `cloudflared` first and then launches the original CELERITY container command.

## Files

- `Dockerfile` - wraps the upstream CELERITY image and installs `cloudflared`
- `entrypoint.sh` - starts the Cloudflare Tunnel and then execs the original container command
- `.github/workflows/docker.yml` - builds and pushes `ghcr.io/<owner>/<repo>:latest`

## Required environment variable

```env
TUNNEL_TOKEN=your_cloudflare_tunnel_token
```

## Run locally

```bash
docker build -t celerity-cf .
docker run -e TUNNEL_TOKEN=your_cloudflare_tunnel_token celerity-cf
```

## Image output

When GitHub Actions runs on `main`, it publishes:

```text
ghcr.io/ntun7729/celerity:latest
```

## Notes

- This repo does not copy the whole CELERITY source tree.
- It tracks the published upstream image `clickdevtech/hysteria-panel:latest`.
- The entrypoint preserves the base image command by running `exec "$@"` after `cloudflared` starts.
