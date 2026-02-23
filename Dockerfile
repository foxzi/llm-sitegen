FROM node:22-slim

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g opencode-ai

RUN echo "deb [trusted=yes] https://foxzi.github.io/llm-imager/apt stable main" \
    > /etc/apt/sources.list.d/llm-imager.list \
    && apt-get update \
    && apt-get install -y llm-imager \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -d /app -s /bin/bash sitegen

WORKDIR /app

COPY . /app/llm-sitegen/

RUN mkdir -p /app/.local /app/.config /app/llm-sitegen/build \
    && chown -R sitegen:sitegen /app

USER sitegen

WORKDIR /app/llm-sitegen

EXPOSE 3000

CMD ["opencode", "serve", "--hostname", "0.0.0.0", "--port", "3000"]
