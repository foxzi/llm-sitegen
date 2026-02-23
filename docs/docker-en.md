# Running with Docker

This guide explains how to generate websites using llm-sitegen in Docker.

---

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed
- API key for at least one LLM provider (OpenAI, Anthropic, or GitHub Copilot)
- (Optional) [llm-imager](https://github.com/foxzi/llm-imager) config for image generation

---

## Quick Start

### 1. Clone the repository

```bash
git clone git@github.com:foxzi/llm-sitegen.git
cd llm-sitegen
```

### 2. Prepare project files

Create a project folder with a `specs/` directory:

```bash
mkdir -p projects/001_my-company/specs
```

**projects/001_my-company/specs/spec.md** — content and requirements:

```markdown
# My Company

## About
We build great products since 2010.

## Services
- Web Development
- Mobile Apps

## Contact
Phone: +1 555 123-4567
```

**projects/001_my-company/specs/design.md** — visual design:

```markdown
## Site Type
type: landing

## Colors
palette: ocean-trust

## Fonts
heading: Montserrat
body: Open Sans

## Sections
- navbar
- hero-centered
- features-grid
- cta
- footer
```

### 3. Configure llm-imager (optional)

If your project uses image generation, create `.llm-imager.yaml` in the repository root:

```yaml
provider: openai
api_key: sk-...
model: dall-e-3
```

This file is gitignored (contains API keys) and is mounted read-only into the container.

### 4. Build and start the server

```bash
docker compose build
docker compose up
```

### 5. Open the web panel

Open [http://localhost:3000](http://localhost:3000) in your browser.

### 6. Configure an LLM provider

On first launch you need to add at least one LLM provider in the OpenCode web panel. Use any provider you already have a subscription for:

| Provider | Model examples | API key source |
|----------|---------------|----------------|
| OpenAI | gpt-4o, o3, codex | [platform.openai.com/api-keys](https://platform.openai.com/api-keys) |
| Anthropic | claude-sonnet-4, claude-opus-4 | [console.anthropic.com](https://console.anthropic.com/) |
| GitHub Copilot | gpt-4o, claude-sonnet-4 | Copilot subscription token |

Provider settings are saved in a Docker volume (`opencode-config`) and persist between restarts.

### 7. Generate the site

In the OpenCode chat, provide the project files and prompt:

```
Read files master.md, projects/001_my-company/specs/spec.md, projects/001_my-company/specs/design.md

Generate a website according to the specification and save to projects/001_my-company/build/
```

The generated site will be saved to `projects/001_my-company/build/`.

---

## How It Works

1. `docker compose up` starts the OpenCode web server on port 3000
2. You configure LLM provider API keys through the web panel (once)
3. You interact with the LLM via the web chat, providing project specs as context
4. The LLM generates the site and saves output to the project's `build/` directory

---

## Volume Mounts

| Mount | Path in container | Purpose |
|-------|-------------------|---------|
| `./projects` | `/app/llm-sitegen/projects` | Project folders (specs/ + build/) |
| `./.llm-imager.yaml` | `/app/.llm-imager.yaml` | llm-imager config (read-only, optional) |
| `opencode-data` | `/app/.local` | OpenCode session data (persistent) |
| `opencode-config` | `/app/.config` | Provider API keys and settings (persistent) |

---

## Project Structure

Each project lives in `projects/` with a numeric ID prefix:

```
projects/
  001_my-company/
    specs/
      spec.md        # Content and requirements
      design.md      # Visual design
      task.md        # Revision tasks (optional)
    build/
      index.html     # Generated site
      assets/        # CSS, JS, images
```

---

## API Usage

OpenCode exposes an HTTP API (OpenAPI 3.1) that allows programmatic site generation. The API spec is available at `http://localhost:3000/doc`.

### Prerequisites

- Running server (`docker compose up`)
- Configured LLM provider (via web panel)
- `curl` and `jq` installed on the host

### Test connectivity

**Health check:**

```bash
curl -s http://localhost:3000/global/health | jq
```

**List connected providers:**

```bash
curl -s http://localhost:3000/provider | jq '.connected'
```

**Create a session:**

```bash
curl -s -X POST http://localhost:3000/session \
  -H 'Content-Type: application/json' \
  -d '{"title": "001_my-company"}' | jq '.id'
```

**Send a generation prompt (sync, waits for completion):**

```bash
curl -s -X POST http://localhost:3000/session/<session-id>/message \
  -H 'Content-Type: application/json' \
  -d '{
    "model": {"providerID": "anthropic", "modelID": "claude-sonnet-4"},
    "parts": [{"type": "text", "text": "Read master.md and projects/001_my-company/specs/spec.md, specs/design.md. Generate website to projects/001_my-company/build/"}]
  }'
```

**Send a prompt asynchronously (returns immediately):**

```bash
curl -s -X POST http://localhost:3000/session/<session-id>/prompt_async \
  -H 'Content-Type: application/json' \
  -d '{
    "parts": [{"type": "text", "text": "Generate website..."}]
  }'
```

**Listen to real-time events (SSE):**

```bash
curl -N http://localhost:3000/event
```

### Key API endpoints

| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/global/health` | Server health and version |
| `GET` | `/provider` | List providers and connected status |
| `POST` | `/session` | Create a new session |
| `GET` | `/session` | List all sessions |
| `POST` | `/session/:id/message` | Send prompt, wait for response |
| `POST` | `/session/:id/prompt_async` | Send prompt, return immediately |
| `GET` | `/session/:id/message` | List messages in a session |
| `POST` | `/session/:id/abort` | Abort a running session |
| `GET` | `/event` | Server-sent events stream |
| `GET` | `/doc` | OpenAPI 3.1 spec |

### Authentication

If the server is protected with a password:

```bash
curl -u opencode:your-password http://localhost:3000/global/health
```

### JS SDK

For programmatic integration, use the official SDK:

```bash
npm install @opencode-ai/sdk
```

```js
import { createOpencodeClient } from "@opencode-ai/sdk"

const client = createOpencodeClient({ baseUrl: "http://localhost:3000" })

const session = await client.session.create({ body: { title: "001_my-company" } })

const result = await client.session.prompt({
  path: { id: session.id },
  body: {
    model: { providerID: "anthropic", modelID: "claude-sonnet-4" },
    parts: [{
      type: "text",
      text: "Read master.md and projects/001_my-company/specs/spec.md, specs/design.md. Generate website to projects/001_my-company/build/"
    }]
  }
})
```

---

## Batch Mode

For one-shot generation without the web panel, use `docker compose run`:

```bash
docker compose run --rm llm-sitegen \
  bash /app/llm-sitegen/docker/entrypoint.sh 001_my-company
```

With a specific model:

```bash
docker compose run --rm llm-sitegen \
  bash /app/llm-sitegen/docker/entrypoint.sh 001_my-company anthropic/claude-sonnet-4
```

The LLM reads project specs, generates the site, and writes output to `projects/001_my-company/build/`. The container exits when done.

> **Note:** Batch mode runs a single prompt without interaction. For iterative refinement, use the web panel.

---

## Troubleshooting

### "Error: specs/ directory not found"

Make sure the project has a `specs/` directory with `spec.md` and `design.md`:

```bash
ls projects/001_my-company/specs/spec.md
ls projects/001_my-company/specs/design.md
```

### "Error: project not found"

Check available projects:

```bash
ls projects/
```

### Provider not working

Open the web panel at [http://localhost:3000](http://localhost:3000) and verify the API key is correct in the provider settings.

### Rebuild after repository updates

```bash
git pull
docker compose build
```
