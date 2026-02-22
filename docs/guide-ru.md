# Руководство по использованию LLM Site Generator

Это руководство объясняет, как использовать репозиторий для генерации сайтов с помощью LLM (ChatGPT, Claude и др.).

## Содержание

1. [Что это такое](#что-это-такое)
2. [Быстрый старт](#быстрый-старт)
3. [Структура проекта](#структура-проекта)
4. [Создание задания](#создание-задания)
5. [Типы сайтов](#типы-сайтов)
6. [Настройка дизайна](#настройка-дизайна)
7. [Работа с контентом](#работа-с-контентом)
8. [Примеры](#примеры)

---

## Что это такое

LLM Site Generator — это набор шаблонов, инструкций и ресурсов для генерации сайтов с помощью AI. Вместо того чтобы объяснять LLM как создавать сайты с нуля, вы подключаете готовые модули как контекст, и AI использует их для генерации качественного кода.

**Преимущества:**
- Консистентный результат
- Готовые компоненты и секции
- Локальные шрифты и иконки (без CDN)
- SEO-шаблоны из коробки
- Работает офлайн

---

## Быстрый старт

### Шаг 1: Создайте папку проекта

```
examples/
  my-project/
    spec.md      # Контент и требования
    design.md    # Дизайн и стилизация
```

### Шаг 2: Опишите проект в spec.md

```markdown
# Название проекта

## О компании
Краткое описание бизнеса...

## Услуги
- Услуга 1
- Услуга 2

## Контакты
Телефон: +7 999 123-45-67
Адрес: г. Москва, ул. Примерная, 1
```

### Шаг 3: Настройте дизайн в design.md

```markdown
# Design

## Site Type
type: landing

## Colors
palette: ocean-trust

## Fonts
heading: Montserrat
body: Open Sans
```

### Шаг 4: Запустите генерацию

Передайте LLM файлы как контекст:
- `master.md` — главный промпт (связывает все модули)
- `spec.md` и `design.md` вашего проекта

**Опционально** (для детальных инструкций):
- README.md из нужных папок (frameworks, layouts, colors и т.д.)

---

## Запуск генерации

### Claude Code (Anthropic)

```bash
# Базовый запуск
claude --print "$(cat master.md spec.md design.md)" \
  "Сгенерируй сайт согласно спецификации"

# С дополнительными модулями
claude --print "$(cat master.md layouts/README.md colors/README.md spec.md design.md)" \
  "Сгенерируй сайт согласно спецификации"

# Интерактивный режим с файлами
claude
> /read master.md
> /read examples/my-project/spec.md
> /read examples/my-project/design.md
> Сгенерируй сайт согласно спецификации и сохрани в build/

# С выводом в файл
claude --print "$(cat master.md spec.md design.md)" \
  "Сгенерируй только HTML код сайта" > build/index.html
```

### Codex (OpenAI)

```bash
# Базовый запуск
codex "$(cat master.md spec.md design.md)

Сгенерируй сайт согласно спецификации"

# С указанием модели
codex --model gpt-4 "$(cat master.md spec.md design.md)

Сгенерируй сайт согласно спецификации"

# Интерактивный режим
codex
> Прочитай файлы master.md, spec.md, design.md и сгенерируй сайт
```

### Примеры команд

**Простой лендинг:**
```bash
claude --print "$(cat master.md layouts/README.md examples/my-site/spec.md examples/my-site/design.md)" \
  "Сгенерируй лендинг и сохрани в examples/my-site/build/"
```

**С генерацией картинок:**
```bash
claude --print "$(cat master.md images/README.md spec.md design.md)" \
  "Сгенерируй сайт и создай скрипт generate-images.sh для llm-imager"
```

**Итерация (правки):**
```bash
claude --print "$(cat iterations.md)" \
  "В файле build/index.html измени цвет кнопок на оранжевый и добавь секцию FAQ"
```

### Рекомендации

1. **Используй master.md** — он содержит все инструкции и ссылки
2. **Добавляй модули по необходимости** — не нужно подключать всё сразу
3. **Сохраняй в build/** — держи сгенерированные файлы отдельно
4. **Итерируй** — используй iterations.md для правок

---

## Структура проекта

```
llm-sitegen/
├── frameworks/     # CSS/JS фреймворки
├── colors/         # Цветовые палитры
├── fonts/          # Шрифты (woff2)
├── icons/          # SVG иконки
├── layouts/        # Шаблоны страниц и секций
├── components/     # UI компоненты
├── animations/     # CSS анимации
├── seo/            # SEO шаблоны
├── content/        # Обработка текста
├── examples/       # Примеры проектов
└── docs/           # Документация
```

### Что подключать как контекст

| Задача | Файлы для контекста |
|--------|---------------------|
| Выбор фреймворка | `frameworks/README.md` |
| Выбор цветов | `colors/README.md` |
| Выбор шрифтов | `fonts/README.md` |
| Структура страницы | `layouts/README.md` |
| UI элементы | `components/README.md` |
| SEO настройка | `seo/README.md` |
| Обработка текста | `content/README.md` |

---

## Создание задания

### Файл spec.md (контент)

Описывает ЧТО будет на сайте:

```markdown
# Company Name

## About
История компании, миссия, ценности...

## Services
### Услуга 1
Описание услуги...

### Услуга 2
Описание услуги...

## Testimonials
> "Отличный сервис!" - Иван Иванов, директор ООО "Компания"

## FAQ
Q: Частый вопрос?
A: Ответ на вопрос.

## Contact
- Phone: +7 999 123-45-67
- Email: info@example.com
- Address: г. Москва, ул. Примерная, 1
```

### Файл design.md (дизайн)

Описывает КАК будет выглядеть сайт:

```markdown
# Design Specification

## Site Type
type: landing
# Варианты: landing, multipage, portfolio, e-commerce, blog

## Framework
framework: bulma
# Варианты: tailwind, bootstrap, bulma, uikit, pico, water, milligram

## Colors
palette: ocean-trust
# Или кастомные:
# primary: #2563EB
# secondary: #1E40AF
# accent: #F59E0B

## Fonts
heading: Montserrat
body: Inter
# Доступные: см. fonts/README.md

## Layout
sections:
  - navbar
  - hero-centered
  - features-grid
  - testimonials
  - pricing-cards
  - cta
  - footer

## SEO
- Meta description
- Open Graph
- Schema.org LocalBusiness
- sitemap.xml
- robots.txt

## Text Processing
rewrite: true
tone: professional
length: shorter
```

---

## Типы сайтов

### Landing Page (Лендинг)

Одностраничный сайт для продукта или услуги.

```markdown
type: landing

sections:
  - navbar
  - hero
  - features
  - testimonials
  - pricing
  - cta
  - footer
```

### Multipage (Многостраничный)

Корпоративный сайт с несколькими страницами.

```markdown
type: multipage

pages:
  - index.html: landing
  - about.html: about
  - services.html: services
  - contact.html: contact
```

### Portfolio (Портфолио)

Персональный сайт или портфолио работ.

```markdown
type: portfolio

sections:
  - navbar
  - hero (с фото)
  - work-grid
  - about
  - contact-form
  - footer
```

### E-commerce (Интернет-магазин)

Каталог товаров с корзиной.

```markdown
type: e-commerce

pages:
  - index.html: product-listing
  - product.html: product-detail
  - cart.html: cart
```

### Blog (Блог)

Блог или новостной сайт.

```markdown
type: blog

pages:
  - index.html: blog-listing
  - post.html: blog-post
```

---

## Настройка дизайна

### Цветовые палитры

В `colors/README.md` есть 35+ готовых палитр:

| Категория | Примеры палитр |
|-----------|----------------|
| Corporate | ocean-trust, executive-green, steel-professional |
| Creative | sunset-creative, aurora-dreams, neon-nights |
| Tech | cyber-blue, matrix-green, quantum-purple |
| Nature | forest-calm, ocean-breeze, earth-tones |
| E-commerce | fresh-market, luxury-gold, minimal-mono |

Использование:
```markdown
## Colors
palette: ocean-trust
```

Или кастомные цвета:
```markdown
## Colors
primary: #2563EB
secondary: #1E40AF
accent: #F59E0B
background: #FFFFFF
text: #1F2937
```

### Шрифты

В `fonts/` есть 16 Google Fonts. Популярные пары:

| Заголовки | Текст | Стиль |
|-----------|-------|-------|
| Montserrat | Open Sans | Современный |
| Playfair Display | Lato | Элегантный |
| Roboto | Roboto | Нейтральный |
| Poppins | Inter | Геометричный |

Использование:
```markdown
## Fonts
heading: Montserrat
body: Open Sans
```

### Иконки

В `icons/` есть 15,000+ SVG иконок из 6 наборов:

| Набор | Стиль | Количество |
|-------|-------|------------|
| Heroicons | Outline/Solid | 300+ |
| Feather | Тонкие линии | 280+ |
| Lucide | Консистентные | 1000+ |
| Bootstrap | Классические | 1800+ |
| Tabler | Современные | 4000+ |
| Phosphor | 6 стилей | 6000+ |

---

## Работа с контентом

### Генерация текста

Генерируйте контент прямо в spec.md:

```markdown
## Services

### Web Development
[generate: описание услуги веб-разработки | professional | medium]

## FAQ
[generate: FAQ 5 вопросов про доставку и оплату]

## Testimonials
[generate: 3 отзыва про ремонт техники | enthusiastic]
```

**Что можно генерировать:**
- Описания услуг и продуктов
- FAQ (вопросы и ответы)
- Отзывы (плейсхолдеры)
- CTA тексты
- Meta descriptions
- Hero заголовки
- Преимущества

### Обработка текста

Если исходный текст нужно переписать или изменить тон:

```markdown
## Text Processing
rewrite: true        # Перефразировать
tone: professional   # Тональность
length: shorter      # Сократить
```

**Доступные тональности:**
- `formal` — официальный, деловой
- `professional` — профессиональный
- `friendly` — дружелюбный
- `casual` — разговорный
- `enthusiastic` — энергичный
- `confident` — уверенный
- `empathetic` — сочувствующий
- `luxurious` — премиальный
- `technical` — технический
- `playful` — игривый

**Длина:**
- `much_shorter` — 25-30% от оригинала
- `shorter` — 50-60%
- `same` — без изменений
- `longer` — 150-170%
- `much_longer` — 200-250%

### Ключевые слова (SEO)

LLM автоматически извлечёт keywords из текста. Можно указать дополнительные:

```markdown
## Keywords
- ремонт бытовой техники
- ремонт стиральных машин москва
- срочный ремонт холодильников
```

---

## Примеры

### Пример 1: Лендинг для сервиса

**spec.md:**
```markdown
# QuickFix - Ремонт техники

## О нас
Ремонтируем бытовую технику с 2010 года.
Выезд мастера в день обращения.

## Услуги
- Ремонт стиральных машин
- Ремонт холодильников
- Ремонт посудомоечных машин

## Преимущества
- Гарантия 1 год
- Оригинальные запчасти
- Бесплатная диагностика

## Контакты
Телефон: +7 495 123-45-67
Адрес: Москва
Режим работы: 9:00-21:00, без выходных
```

**design.md:**
```markdown
# Design

## Site Type
type: landing

## Framework
framework: bulma

## Colors
palette: ocean-trust

## Fonts
heading: Montserrat
body: Open Sans

## Sections
- navbar
- hero-centered
- features-grid (услуги)
- stats (цифры)
- testimonials
- cta
- contact-form
- footer

## Text Processing
tone: professional
length: same

## SEO
- Meta tags
- Open Graph
- Schema.org LocalBusiness
- Keywords extraction
```

### Пример 2: Портфолио дизайнера

**spec.md:**
```markdown
# Анна Петрова - UX/UI дизайнер

## Обо мне
5 лет опыта в дизайне интерфейсов.
Работала с: Яндекс, Сбер, Тинькофф.

## Работы
### Мобильное приложение банка
Редизайн приложения для 2М пользователей...

### Интернет-магазин одежды
Дизайн e-commerce платформы...

## Контакты
Email: anna@example.com
Telegram: @anna_design
```

**design.md:**
```markdown
# Design

## Site Type
type: portfolio

## Framework
framework: tailwind

## Colors
palette: minimal-mono

## Fonts
heading: Playfair Display
body: Inter

## Text Processing
tone: confident
```

---

## Советы

1. **Начинайте с простого** — сначала landing, потом усложняйте
2. **Используйте готовые палитры** — они уже подобраны
3. **Не перегружайте** — 5-7 секций достаточно для лендинга
4. **Проверяйте результат** — LLM может ошибаться
5. **Итерируйте** — уточняйте требования, если результат не устраивает

---

---

## Генерация изображений

Для генерации изображений используется утилита [llm-imager](https://github.com/foxzi/llm-imager).

### Установка

```bash
# Debian/Ubuntu
echo "deb [trusted=yes] https://foxzi.github.io/llm-imager/apt stable main" | sudo tee /etc/apt/sources.list.d/llm-imager.list
sudo apt update && sudo apt install llm-imager
```

### Использование

```bash
llm-imager -p "описание изображения" -o output.jpg --size 1792x1024
```

### Inline-синтаксис в spec.md

Вставляйте команды генерации прямо в текст:

```markdown
## Hero Section
Добро пожаловать в нашу компанию.

![gen: современный офис с панорамными окнами](hero.jpg 1792x1024)

## Услуги

### Веб-разработка
![gen: плоская иконка кода, синяя, белый фон](icon-web.png 512x512)
```

**Расширенный синтаксис:**
```markdown
![gen: описание | style: photorealistic | negative: text, watermarks](file.jpg 1024x1024)
```

### Указание в design.md

```markdown
## Images
generation: llm-imager
style: professional, modern, blue tones

images:
  - hero.jpg: "современный офис с естественным светом"
  - icon-speed.png: "плоская иконка ракеты, оранжевая"
  - team-ceo.jpg: "профессиональный портрет, мужчина, 50 лет"
```

### Типы изображений

| Тип | Размер | Описание |
|-----|--------|----------|
| Hero фон | 1792x1024 | Фоновое изображение для hero секции |
| Иконки | 512x512 | Иконки для features секции |
| Команда | 1024x1024 | Фото членов команды |
| Продукт | 1024x1024 | Фото продукта или мокап |
| Блог | 1200x630 | Обложка для статей (OG-совместимый) |

Подробнее: `images/README.md`

---

## Доработка и правки

После генерации сайта можно вносить правки, описывая их в структурированном формате.

### Формат запроса на правки

```markdown
## Правки

### Контент
- Hero: изменить заголовок на "Добро пожаловать"
- Футер: обновить телефон на +7 999 000-00-00

### Стили
- Кнопки: сделать оранжевыми (#F59E0B)
- Шрифт: увеличить размер текста до 18px

### Структура
- Переместить отзывы выше прайсинга
- Добавить секцию FAQ перед футером

### Картинки
- Заменить hero: ![gen: закат над горами](hero-new.jpg 1792x1024)

### Баги
- Мобильное меню не открывается
- Картинки растянуты на мобильных
```

### Типы правок

| Тип | Примеры |
|-----|---------|
| Контент | Изменить текст, добавить/удалить секции |
| Стили | Цвета, шрифты, отступы, размеры |
| Структура | Порядок секций, layout, колонки |
| Компоненты | Добавить форму, карусель, модалку |
| Картинки | Перегенерировать, заменить, добавить |
| Баги | Исправить неработающий функционал |

### Советы

1. **Будьте конкретны** — "сделать кнопки заметнее" → "кнопки: оранжевые, крупнее, с тенью"
2. **Группируйте** — собирайте похожие правки вместе
3. **Приоритизируйте** — баги и критичное сначала
4. **Указывайте секции** — "в hero", "в футере", "на странице контактов"

---

## Чеклист перед генерацией

- [ ] spec.md содержит весь контент
- [ ] design.md указывает тип сайта
- [ ] Выбрана цветовая палитра
- [ ] Выбраны шрифты
- [ ] Указаны нужные секции
- [ ] Настроена обработка текста (если нужно)
- [ ] Указаны SEO требования
- [ ] Описаны нужные изображения (если нужно)
