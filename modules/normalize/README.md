# Color Normalization - LLM Instructions

See global rules: `modules/README.md`.

Module for post-processing generated sites. Fixes color contrast issues.

Модуль для постобработки сгенерированных сайтов. Исправляет проблемы с контрастом цветов.

---

## Purpose

Normalize colors to meet contrast and readability rules.

Нормализует цвета для читабельности и контраста.

## How to Use

Run after generation to verify and fix contrast.

Запускай после генерации сайта для проверки и исправления контраста.

---

## Examples

### 1. Colored heading text

Цветной текст для заголовков.

**Плохо:**
```css
--text: #166534;  /* зелёный */
body { color: var(--text); }
/* заголовки наследуют зелёный */
```

**Хорошо:**
```css
--text: #374151;     /* нейтральный серый */
--heading: #111827;  /* тёмный для заголовков */

body { color: var(--text); }
h1, h2, h3, .title { color: var(--heading); }
```

### 2. Headings without explicit color

Заголовки без явного цвета.

**Плохо:**
```css
h1, h2, h3 {
  font-family: 'Montserrat';
  /* нет color — наследует от body */
}
```

**Хорошо:**
```css
h1, h2, h3 {
  font-family: 'Montserrat';
  color: var(--heading);
}
```

### 3. Form fields without explicit background

Поля форм без явного фона.

**Плохо:**
```css
.input, .textarea {
  border-color: #ccc;
  /* Firefox с тёмной темой покажет чёрный фон */
}
```

**Хорошо:**
```css
.input, .textarea {
  background-color: #fff;
  color: #374151;
  border-color: #ccc;
}
```

### 4. Low-contrast labels

Бледные labels и strong.

**Плохо:**
```css
/* strong наследует цвет от родителя */
p { color: #9CA3AF; }  /* бледный серый */
p strong { /* нет стиля — тоже бледный */ }
```

**Хорошо:**
```css
strong {
  color: var(--heading, #111827);
}
```

### 5. Colored text in components

Зелёный/синий текст в компонентах.

**Плохо:**
```css
.faq-item summary { color: #126c31; }
.faq-item p { color: #1a7f3d; }
.quote { color: #1e7d3b; }
```

**Хорошо:**
```css
.faq-item summary { color: var(--heading); }
.faq-item p { color: var(--text); }
.quote { color: var(--text); }
```

---

## Rules

### Variables

Переменные.

Если в CSS есть цветные переменные для текста — замени на нейтральные:

```css
/* Заменить */
--text: #166534;      /* цветной */
--cp-text: #166534;   /* цветной */

/* На */
--text: #374151;      /* нейтральный серый */
--heading: #111827;   /* тёмный для заголовков */
```

### Headings

Заголовки.

Добавь явный цвет:

```css
h1, h2, h3, h4, h5, h6, .title {
  color: var(--heading, #111827);
}
```

### Cards

Карточки.

Карточки должны иметь свой контекст:

```css
.card, .card-content, .box {
  background: #fff;
  color: var(--text, #374151);
}

.card .title, .box .title {
  color: var(--heading, #111827);
}
```

### Dark sections

Тёмные секции.

Текст на тёмном фоне — светлый:

```css
.footer, .has-background-dark {
  color: #F9FAFB;
}

.footer .title, .has-background-dark .title {
  color: #FFFFFF;
}
```

### Labels and strong

Labels и strong.

Элементы `<strong>` должны быть контрастными:

```css
strong {
  color: var(--heading, #111827);
}
```

### Form fields

Поля форм.

Firefox использует системную тёмную тему для input-ов. Всегда задавай явный фон и цвет:

**Плохо:**
```css
.input, .textarea, .select select {
  border-color: #ccc;
  /* нет background — Firefox покажет чёрный фон */
}
```

**Хорошо:**
```css
.input, .textarea, .select select {
  background-color: var(--surface, #FFFFFF);
  color: var(--text, #374151);
  border-color: #ccc;
}
```

---

## Checklist

After normalization, verify:

После нормализации проверь:

- [ ] Переменные текста нейтральные (не цветные)
- [ ] Заголовки имеют явный тёмный цвет
- [ ] Карточки: белый фон + тёмный текст
- [ ] Footer: тёмный фон + светлый текст
- [ ] Нет зелёного/синего текста в основном контенте
- [ ] Labels/strong имеют тёмный цвет
- [ ] Поля форм: явный background-color и color

---

## References

- `modules/normalize/README.md`

## Example usage

Пример применения.

```
Прочитай modules/normalize/README.md и примени к build/site/assets/css/style.css
```
