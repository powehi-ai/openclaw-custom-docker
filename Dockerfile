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

# rg alias
RUN ln -sf /usr/bin/rg /usr/local/bin/rg || true

# fd alias
RUN ln -sf /usr/bin/fdfind /usr/local/bin/fd || true

# obsidian-cli
RUN npm install -g obsidian-cli

# mcporter
RUN npm install -g mcporter

# playwright
RUN npx playwright install --with-deps chromium || true

USER root

RUN touch /etc/openclaw-custom-build

ENV PATH="/usr/local/bin:/usr/bin:/bin:${PATH}"

USER root
