# LLM Site Generator Toolkit

Набор шаблонов и промптов для генерации сайтов с помощью LLM (Claude, ChatGPT и др.).

A collection of templates and prompts for generating websites with LLMs (Claude, ChatGPT, etc.).

## Quick Start

1. Создайте `spec.md` (контент) и `design.md` (дизайн)
2. Запустите генерацию:

```bash
claude --print "$(cat master.md spec.md design.md)" "Сгенерируй сайт"
```

### Пример spec.md

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

### Пример design.md

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

## Structure

```
llm-sitegen/
├── master.md        # Main LLM prompt
├── iterations.md    # Handling revisions
├── frameworks/      # CSS/JS frameworks
├── colors/          # Color palettes (35+)
├── fonts/           # Google Fonts (16)
├── icons/           # SVG icons (15,000+)
├── layouts/         # Page templates
├── components/      # UI components
├── animations/      # CSS animations
├── seo/             # SEO templates
├── content/         # Text processing & generation
├── images/          # Image generation (llm-imager)
├── examples/        # Example projects
└── docs/            # Documentation
```

## Documentation

- [Руководство (RU)](docs/guide-ru.md)
- [User Guide (EN)](docs/guide-en.md)

## Key Features

- **Offline**: Локальные шрифты, иконки, фреймворки — без CDN
- **Modular**: Подключайте только нужные модули
- **LLM-ready**: Промпты оптимизированы для AI
- **Content**: Генерация и обработка текста
- **Images**: Генерация картинок через llm-imager

## License

MIT
