# Запуск через Docker

Руководство по генерации сайтов с помощью llm-sitegen в Docker.

---

## Требования

- Установлен [Docker](https://docs.docker.com/get-docker/)
- API-ключ хотя бы одного LLM-провайдера (OpenAI, Anthropic или GitHub Copilot)
- (Опционально) Конфиг [llm-imager](https://github.com/foxzi/llm-imager) для генерации изображений

---

## Быстрый старт

### 1. Клонируйте репозиторий

```bash
git clone git@github.com:foxzi/llm-sitegen.git
cd llm-sitegen
```

### 2. Подготовьте файлы проекта

Создайте папку проекта с директорией `specs/`:

```bash
mkdir -p projects/001_my-company/specs
```

**projects/001_my-company/specs/spec.md** — контент и требования:

```markdown
# Моя компания

## О нас
Мы создаём отличные продукты с 2010 года.

## Услуги
- Веб-разработка
- Мобильные приложения

## Контакты
Телефон: +7 999 123-45-67
```

**projects/001_my-company/specs/design.md** — визуальный дизайн:

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

### 3. Настройте llm-imager (опционально)

Если проект использует генерацию изображений, создайте `.llm-imager.yaml` в корне репозитория:

```yaml
provider: openai
api_key: sk-...
model: dall-e-3
```

Этот файл добавлен в gitignore (содержит API-ключи) и монтируется в контейнер в режиме только чтение.

### 4. Соберите и запустите сервер

```bash
docker compose build
docker compose up
```

### 5. Откройте веб-панель

Перейдите в браузере на [http://localhost:3000](http://localhost:3000).

### 6. Настройте LLM-провайдера

При первом запуске нужно добавить хотя бы одного LLM-провайдера в веб-панели OpenCode. Используйте любого провайдера, на которого у вас есть подписка:

| Провайдер | Примеры моделей | Где взять API-ключ |
|-----------|----------------|-------------------|
| OpenAI | gpt-4o, o3, codex | [platform.openai.com/api-keys](https://platform.openai.com/api-keys) |
| Anthropic | claude-sonnet-4, claude-opus-4 | [console.anthropic.com](https://console.anthropic.com/) |
| GitHub Copilot | gpt-4o, claude-sonnet-4 | Токен подписки Copilot |

Настройки провайдера сохраняются в Docker-томе (`opencode-config`) и не теряются при перезапуске.

### 7. Сгенерируйте сайт

В чате OpenCode укажите файлы проекта и промпт:

```
Прочитай файлы master.md, projects/001_my-company/specs/spec.md, projects/001_my-company/specs/design.md

Сгенерируй сайт согласно спецификации и сохрани в projects/001_my-company/build/
```

Сгенерированный сайт будет сохранён в `projects/001_my-company/build/`.

---

## Как это работает

1. `docker compose up` запускает веб-сервер OpenCode на порту 3000
2. Вы настраиваете API-ключи LLM-провайдеров через веб-панель (один раз)
3. Вы взаимодействуете с LLM через веб-чат, передавая спеки проекта как контекст
4. LLM генерирует сайт и сохраняет результат в папку `build/` проекта

---

## Монтируемые тома

| Монтирование | Путь в контейнере | Назначение |
|--------------|-------------------|------------|
| `./projects` | `/app/llm-sitegen/projects` | Папки проектов (specs/ + build/) |
| `./.llm-imager.yaml` | `/app/.llm-imager.yaml` | Конфиг llm-imager (только чтение, опционально) |
| `opencode-data` | `/app/.local` | Данные сессий OpenCode (persistent) |
| `opencode-config` | `/app/.config` | API-ключи и настройки провайдеров (persistent) |

---

## Структура проекта

Каждый проект живёт в `projects/` с числовым ID-префиксом:

```
projects/
  001_my-company/
    specs/
      spec.md        # Контент и требования
      design.md      # Визуальный дизайн
      task.md        # Задание на правки (опционально)
    build/
      index.html     # Сгенерированный сайт
      assets/        # CSS, JS, изображения
```

---

## Работа через API

OpenCode предоставляет HTTP API (OpenAPI 3.1) для программной генерации сайтов. Спецификация доступна по адресу `http://localhost:3000/doc`.

### Требования

- Запущенный сервер (`docker compose up`)
- Настроенный LLM-провайдер (через веб-панель)
- `curl` и `jq` на хосте

### Проверка связи

**Проверка здоровья:**

```bash
curl -s http://localhost:3000/global/health | jq
```

**Список подключённых провайдеров:**

```bash
curl -s http://localhost:3000/provider | jq '.connected'
```

**Создание сессии:**

```bash
curl -s -X POST http://localhost:3000/session \
  -H 'Content-Type: application/json' \
  -d '{"title": "001_my-company"}' | jq '.id'
```

**Отправка промпта (синхронно, ждёт завершения):**

```bash
curl -s -X POST http://localhost:3000/session/<session-id>/message \
  -H 'Content-Type: application/json' \
  -d '{
    "model": {"providerID": "anthropic", "modelID": "claude-sonnet-4"},
    "parts": [{"type": "text", "text": "Прочитай master.md и projects/001_my-company/specs/spec.md, specs/design.md. Сгенерируй сайт в projects/001_my-company/build/"}]
  }'
```

**Отправка промпта асинхронно (возвращается сразу):**

```bash
curl -s -X POST http://localhost:3000/session/<session-id>/prompt_async \
  -H 'Content-Type: application/json' \
  -d '{
    "parts": [{"type": "text", "text": "Сгенерируй сайт..."}]
  }'
```

**Подписка на события в реальном времени (SSE):**

```bash
curl -N http://localhost:3000/event
```

### Основные эндпоинты API

| Метод | Путь | Описание |
|-------|------|----------|
| `GET` | `/global/health` | Здоровье сервера и версия |
| `GET` | `/provider` | Список провайдеров и статус подключения |
| `POST` | `/session` | Создать сессию |
| `GET` | `/session` | Список всех сессий |
| `POST` | `/session/:id/message` | Отправить промпт, дождаться ответа |
| `POST` | `/session/:id/prompt_async` | Отправить промпт, вернуться сразу |
| `GET` | `/session/:id/message` | Список сообщений сессии |
| `POST` | `/session/:id/abort` | Прервать выполнение сессии |
| `GET` | `/event` | Поток событий (SSE) |
| `GET` | `/doc` | Спецификация OpenAPI 3.1 |

### Аутентификация

Если сервер защищён паролем:

```bash
curl -u opencode:your-password http://localhost:3000/global/health
```

### JS SDK

Для программной интеграции используйте официальный SDK:

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
      text: "Прочитай master.md и projects/001_my-company/specs/spec.md, specs/design.md. Сгенерируй сайт в projects/001_my-company/build/"
    }]
  }
})
```

---

## Пакетный режим

Для одноразовой генерации без веб-панели используйте `docker compose run`:

```bash
docker compose run --rm llm-sitegen \
  bash /app/llm-sitegen/docker/entrypoint.sh 001_my-company
```

С указанием модели:

```bash
docker compose run --rm llm-sitegen \
  bash /app/llm-sitegen/docker/entrypoint.sh 001_my-company anthropic/claude-sonnet-4
```

LLM читает спеки проекта, генерирует сайт и сохраняет результат в `projects/001_my-company/build/`. Контейнер завершается после генерации.

> **Примечание:** В пакетном режиме выполняется один промпт без возможности итерации. Для пошаговой доработки используйте веб-панель.

---

## Решение проблем

### "Error: specs/ directory not found"

Убедитесь, что в проекте есть директория `specs/` с файлами `spec.md` и `design.md`:

```bash
ls projects/001_my-company/specs/spec.md
ls projects/001_my-company/specs/design.md
```

### "Error: project not found"

Проверьте доступные проекты:

```bash
ls projects/
```

### Провайдер не работает

Откройте веб-панель [http://localhost:3000](http://localhost:3000) и проверьте правильность API-ключа в настройках провайдера.

### Пересборка после обновления репозитория

```bash
git pull
docker compose build
```
