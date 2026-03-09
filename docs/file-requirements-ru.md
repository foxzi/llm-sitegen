# Требования к файлам проекта

Каждый проект для генерации сайта использует набор файлов, которые описывают контент и дизайн. Эта документация объясняет структуру и требования к каждому файлу.

## Содержание

1. [Общая структура](#общая-структура)
2. [content.md — контент](#contentmd--контент)
3. [technical.md — дизайн](#technicalmd--дизайн)
4. [task.md — задание](#taskmd--задание)

---

## Общая структура

Файлы проекта располагаются в папке `projects/{id}_{name}/specs/`:

```
projects/
  001_my-project/
    specs/
      content.md      # Обязательный: контент и содержимое сайта
      technical.md    # Обязательный: визуальное оформление
      task.md      # Опциональный: дополнительные инструкции
    build/         # Сгенерированный сайт
```

---

## content.md — контент

**Назначение:** Описывает ЧТО будет на сайте — весь текстовый контент, структуру информации и бизнес-данные.

### Структура файла

#### 1. Метаданные (YAML frontmatter) — опционально

```yaml
---
site: Название сайта
type: landing | multipage | portfolio | e-commerce | blog
css: tailwind | bootstrap | bulma | uikit | pico
lang: ru | en
version: 1
url: https://example.com
keywords: ключевые слова через запятую
---
```

#### 2. Страницы (для multipage)

```markdown
<!-- page: path="index.html" title="Заголовок страницы" description="SEO описание" -->
```

#### 3. Schema.org разметка — опционально

```markdown
<!-- schema: type="local-business" -->
```json
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Company Name",
  ...
}
```

#### 4. Блоки контента

```markdown
<!-- block: type="hero" id="home" -->

# Заголовок Hero секции

Описание и текст...

[Кнопка действия](#contact) [Вторая кнопка](#services)

<!-- block: type="features" id="services" -->

## Наши услуги

### Услуга 1
Описание услуги...

### Услуга 2
Описание услуги...
```

### Типы блоков

| Тип | Назначение | Типичное содержимое |
|-----|------------|---------------------|
| `hero` | Главный экран | Заголовок, описание, CTA кнопки |
| `features` | Услуги/преимущества | Список с заголовками и описаниями |
| `reviews` | Отзывы | Цитаты с авторами |
| `faq` | FAQ | Вопросы и ответы |
| `cta` | Призыв к действию | Заголовок, текст, кнопка |
| `contacts` | Контакты | Телефон, адрес, зоны обслуживания |
| `footer` | Подвал | Информация о компании, ссылки |

### Генерация контента

Для автоматической генерации текста используйте синтаксис:

```markdown
## Услуги

### Веб-разработка
[generate: описание услуги веб-разработки | professional | medium]

## FAQ
[generate: FAQ 5 вопросов про доставку]

## Отзывы
[generate: 3 отзыва про клининг | enthusiastic]
```

**Параметры генерации:**
- Тональность: `formal`, `professional`, `friendly`, `casual`, `enthusiastic`, `confident`, `luxurious`, `technical`, `playful`
- Длина: `short`, `medium`, `long`

### Генерация изображений

```markdown
## Hero
![gen: современный офис с панорамными окнами](hero.jpg 1792x1024)

## Иконки услуг
![gen: плоская иконка кода, синяя, белый фон](icon-web.png 512x512)
```

**Формат:** `![gen: описание](имя_файла.расширение ШИРИНАxВЫСОТА)`

### Обязательные секции

| Секция | Обязательность | Описание |
|--------|----------------|----------|
| О компании/продукте | Да | Кто вы и что делаете |
| Услуги/продукты | Да | Что предлагаете |
| Контакты | Да | Как связаться |
| Преимущества | Рекомендуется | Почему выбрать вас |
| Отзывы | Рекомендуется | Социальное доказательство |
| FAQ | Рекомендуется | Ответы на частые вопросы |

### Пример минимального content.md

```markdown
# CleanPro - Клининговая компания

## О компании
Клининговая компания CleanPro работает в Москве с 2015 года.

## Услуги

### Уборка квартир
Профессиональная уборка жилых помещений.

### Генеральная уборка
Полная уборка с мытьём окон и чисткой мебели.

## Контакты
- Телефон: +7 (495) 123-45-67
- Email: info@cleanpro.ru
- Адрес: Москва, ул. Чистая, 15
```

### Пример полного content.md

Смотрите примеры в папке `examples/`:
- `examples/electrolux-roseville/content.md` — полный лендинг с Schema.org
- `examples/cleaning-service/content.md` — с генерацией контента
- `examples/food-delivery/content.md` — с изображениями

---

## technical.md — дизайн

**Назначение:** Описывает КАК будет выглядеть сайт — визуальное оформление, фреймворк, цвета, шрифты, структуру секций.

### Структура файла

```markdown
# Design Settings

## Site Type
type: landing

## Framework
framework: bootstrap

## Colors
palette: ocean-trust

## Fonts
heading: Montserrat
body: Open Sans

## Sections
- navbar
- hero-centered
- features-grid
- testimonials
- footer

## Text Processing
tone: professional
length: same

## SEO
- Meta description
- Open Graph
- Schema.org LocalBusiness
```

### Обязательные поля

| Поле | Описание | Примеры значений |
|------|----------|------------------|
| `type` | Тип сайта | `landing`, `multipage`, `portfolio`, `e-commerce`, `blog` |
| `framework` | CSS фреймворк | `bootstrap`, `tailwind`, `bulma`, `uikit`, `pico`, `water`, `milligram` |
| `palette` или цвета | Цветовая схема | Название палитры или HEX цвета |

### Рекомендуемые поля

| Поле | Описание | Примеры значений |
|------|----------|------------------|
| `heading` | Шрифт заголовков | `Montserrat`, `Playfair Display`, `Roboto` |
| `body` | Шрифт текста | `Open Sans`, `Inter`, `Lato` |
| `sections` | Список секций | Список секций в порядке появления |
| `tone` | Тональность текста | `professional`, `friendly`, `enthusiastic` |

### Цветовые палитры

Доступно 35+ готовых палитр. Основные категории:

| Категория | Палитры |
|-----------|---------|
| Corporate | `ocean-trust`, `executive-green`, `steel-professional` |
| Creative | `sunset-creative`, `aurora-dreams`, `neon-nights` |
| Tech | `cyber-blue`, `matrix-green`, `quantum-purple` |
| E-commerce | `fresh-market`, `luxury-gold`, `minimal-mono` |
| Medical | `medical-trust`, `healthcare-calm` |

**Использование палитры:**
```markdown
## Colors
palette: ocean-trust
```

**Кастомные цвета:**
```markdown
## Colors
primary: #0284C7
secondary: #1E40AF
accent: #F59E0B
background: #FFFFFF
text: #1F2937
```

### Секции

Стандартные секции для landing page:

| Секция | Описание |
|--------|----------|
| `navbar` | Навигационное меню |
| `hero-centered` | Hero с центрированным контентом |
| `hero-split` | Hero с разделением на две части |
| `features-grid` | Сетка преимуществ/услуг |
| `services` | Карточки услуг |
| `pricing-cards` | Таблица цен |
| `testimonials` | Отзывы клиентов |
| `faq` | Часто задаваемые вопросы |
| `contact-form` | Форма обратной связи |
| `cta` | Призыв к действию |
| `footer` | Подвал сайта |

### Дополнительные настройки

#### Анимации

```markdown
## Animations
- Scroll reveal on sections
- Hover lift on cards
- Smooth scroll for anchor links
```

#### Мобильная версия

```markdown
## Mobile
- Collapsible burger menu
- Stack cards vertically
- Full-width buttons
```

#### SEO

```markdown
## SEO
- Meta description
- Open Graph
- Schema.org LocalBusiness
- sitemap.xml
- robots.txt
```

#### Изображения

```markdown
## Images

### Hero
![gen: описание hero изображения](hero.jpg 1792x1024)

### Icons
![gen: иконка услуги](icon-service.png 512x512)
```

#### Варианты генерации

```markdown
## Variants to Generate
- ocean-trust (default)
- executive-green
- carbon-dark
```

#### Ассеты

```markdown
## Assets
- Logo: logo.png
- Favicon: favicon.ico
- Структура папок: assets/css/, assets/js/, assets/images/, assets/icons/, assets/fonts/
```

### Пример минимального technical.md

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
```

### Пример полного technical.md

```markdown
# Design Settings

## Site Type
type: landing

## Framework
framework: tailwind

## Colors
palette: fresh-market

## Fonts
heading: Poppins
body: Inter

## Sections
- navbar (с кнопкой "Заказать")
- hero-split (с фото и CTA)
- features-grid (преимущества)
- services (карточки услуг)
- pricing-cards
- testimonials
- faq
- contact-form
- footer

## Text Processing
tone: friendly
length: same

## SEO
- Meta description
- Open Graph
- Schema.org LocalBusiness
- Keywords extraction

## Animations
- Scroll reveal on sections
- Hover lift on cards

## Mobile
- Collapsible burger menu
- Stack cards vertically

## Images
### Hero
![gen: яркий современный интерьер](hero.jpg 1792x1024)

## Assets
- Logo: logo.png (transparent background)
- Favicon: favicon.ico
```

---

## task.md — задание

**Назначение:** Опциональный файл с дополнительными инструкциями, которые не вписываются в content.md или technical.md.

### Когда использовать

- Специфические указания для LLM
- Ссылки на другие файлы
- Инструкции по структуре вывода
- Особые требования к генерации

### Структура файла

```markdown
# Задание

Спецификация в файле `content.md`.
Дизайн в файле `technical.md`.

## Особые требования

- Сайт создать в папке build/
- Использовать только локальные ресурсы
- Не использовать внешние CDN

## Приоритеты

1. Мобильная адаптация
2. Быстрая загрузка
3. SEO оптимизация
```

### Пример

```markdown
# Задание на создание сайта

Спецификация для создания сайта и контент в файле `content.md`.
Технические детали по созданию сайта в файле `technical.md`.

Сайт создать в папке build/site/.

## Дополнительно

- Футер должен быть тёмным
- Добавить иконки к сервисам из папки icons/
- Обязательно использовать Schema.org разметку
```

---

## Чеклист перед генерацией

### content.md
- [ ] Указано название компании/проекта
- [ ] Описаны все услуги/продукты
- [ ] Добавлены контактные данные
- [ ] Указаны преимущества
- [ ] Добавлены отзывы (или директивы генерации)
- [ ] Описаны FAQ (если нужны)

### technical.md
- [ ] Указан тип сайта
- [ ] Выбран фреймворк
- [ ] Выбрана цветовая палитра
- [ ] Указаны шрифты
- [ ] Перечислены секции
- [ ] Настроены SEO требования

### task.md (опционально)
- [ ] Указан путь для вывода
- [ ] Описаны особые требования
