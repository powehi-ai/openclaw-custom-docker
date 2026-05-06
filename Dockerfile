ARG OPENCLAW_IMAGE=alpine/openclaw:latest
FROM ${OPENCLAW_IMAGE}

USER root

RUN apt-get update && apt-get install -y \
  bash curl git jq unzip ca-certificates \
  python3 python3-pip ripgrep fd-find \
  build-essential procps file \
  && rm -rf /var/lib/apt/lists/*

RUN npm install -g \
  mcporter \
  defuddle \
  obsidian

RUN npx playwright install --with-deps chromium || true

RUN echo "openclaw-custom-2026-05-06" > /etc/openclaw-custom-build

ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
