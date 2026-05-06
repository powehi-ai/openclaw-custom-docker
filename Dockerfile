ARG OPENCLAW_IMAGE
FROM ${OPENCLAW_IMAGE}

USER root

RUN apt-get update && apt-get install -y \
  bash \
  curl \
  git \
  jq \
  unzip \
  ca-certificates \
  python3 \
  python3-pip \
  ripgrep \
  fd-find \
  build-essential \
  procps \
  file \
  gh \
  && rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/bin/rg /usr/local/bin/rg || true
RUN ln -sf /usr/bin/fdfind /usr/local/bin/fd || true

# Homebrew
RUN useradd -m -s /bin/bash linuxbrew || true

RUN mkdir -p /home/linuxbrew/.linuxbrew && \
    chown -R linuxbrew:linuxbrew /home/linuxbrew

USER linuxbrew

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"

RUN brew install jq

RUN npm install -g obsidian

RUN printf '#!/bin/sh\nexec obsidian "$@"\n' > /usr/local/bin/obsidian-cli \
  && chmod +x /usr/local/bin/obsidian-cli

USER root

RUN npm install -g mcporter

RUN touch /etc/openclaw-custom-build

USER root
