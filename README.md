## OpenClaw Custom Docker Image

Custom Docker image for OpenClaw with additional developer tools and utilities pre-installed.

## Features

This image extends the official OpenClaw Docker image and adds:

* Bash
* Curl
* Git
* jq
* unzip
* Python 3 + pip
* ripgrep (`rg`)
* fd (`fdfind`)
* build-essential
* GitHub CLI (`gh`)
* mcporter
* Obsidian CLI wrapper

## Base Image

This image is built from the official OpenClaw image:

```text
ghcr.io/openclaw/openclaw:latest
```

The build process automatically incorporates the latest OpenClaw releases while preserving all custom additions.

## Available Image

```bash
docker pull ghcr.io/bgrenat/openclaw-image:latest
```

## Usage

### Docker

```bash
docker run --rm -it \
  ghcr.io/bgrenat/openclaw-image:latest
```

### OpenClaw Configuration

```env
OPENCLAW_IMAGE=ghcr.io/bgrenat/openclaw-image:latest
```

## Included Commands

Verify installed tools:

```bash
gh --version
python3 --version
pip3 --version
rg --version
fd --version
mcporter --version
obsidian-cli --help
```

## Automatic Updates

This repository automatically rebuilds the custom image from the latest official OpenClaw image.

Workflow triggers:

* Push to `main`
* Manual execution (`workflow_dispatch`)
* Scheduled rebuild every 6 hours

When a new OpenClaw version is published, the custom image is rebuilt and pushed automatically to GHCR.

## Dockerfile Overview

The image is generated from:

```dockerfile
ARG OPENCLAW_IMAGE=ghcr.io/openclaw/openclaw:latest
FROM ${OPENCLAW_IMAGE}
```

Additional packages and utilities are then installed on top of the official OpenClaw image.

## Container Registry

Package:

```text
ghcr.io/bgrenat/openclaw-image
```

Latest version:

```text
ghcr.io/bgrenat/openclaw-image:latest
```

## License

This project extends OpenClaw and follows the licensing terms of the upstream project.
