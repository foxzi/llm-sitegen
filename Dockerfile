FROM node:22-slim

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g opencode

RUN curl -fsSL https://foxzi.github.io/llm-imager/install.sh | bash || true

WORKDIR /app

COPY master.md /app/
COPY modules/ /app/modules/
COPY docker/entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

VOLUME ["/spec", "/design", "/output", "/opencode", "/llm-imager"]

ENTRYPOINT ["/app/entrypoint.sh"]
