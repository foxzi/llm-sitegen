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
