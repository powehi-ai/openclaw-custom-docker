OpenClaw Custom Image

This repository provides a custom Docker image for OpenClaw.

The image extends the official `alpine/openclaw:latest` image and adds:

- jq
- ripgrep (`rg`)
- Python 3
- Playwright Chromium dependencies
- mcporter
- defuddle
- obsidian CLI

## Build and Publish

The GitHub Actions workflow automatically:

1. Builds the Docker image
2. Pushes it to GitHub Container Registry (GHCR)

Published image:

```txt
ghcr.io/powehi-ai/openclaw-image:latest
```

## Usage

Set the following environment variable in your deployment platform:

```env
OPENCLAW_IMAGE=ghcr.io/powehi-ai/openclaw-image:latest
```
