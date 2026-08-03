ARG OPENCLAW_IMAGE=ghcr.io/openclaw/openclaw:latest
ARG POWEHI_PLUGIN_REF=v2.2.9
FROM ${OPENCLAW_IMAGE}
ARG POWEHI_PLUGIN_REF

USER root

RUN apt-get update && apt-get install -y \
  bash curl git jq unzip ca-certificates \
  python3 python3-pip ripgrep fd-find \
  build-essential procps file gh \
  && rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/bin/rg /usr/local/bin/rg || true
RUN ln -sf /usr/bin/fdfind /usr/local/bin/fd || true

RUN npm install -g \
  mcporter \
  obsidian

RUN openclaw plugins install \
  "git:github.com/powehi-eu/powehi-seo-geo-universal@${POWEHI_PLUGIN_REF}" \
  --force \
  && openclaw plugins enable powehi-universal-seo-geo \
  && openclaw plugins inspect powehi-universal-seo-geo --runtime --json

RUN printf '#!/bin/sh\nexec obsidian "$@"\n' > /usr/local/bin/obsidian-cli \
  && chmod +x /usr/local/bin/obsidian-cli

RUN touch /etc/openclaw-custom-build

LABEL org.opencontainers.image.base.name="ghcr.io/openclaw/openclaw:latest"
LABEL io.openclaw.plugin.powehi-universal-seo-geo.version="${POWEHI_PLUGIN_REF}"

ENV PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

USER root
