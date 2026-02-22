# Content Processing - LLM Instructions

Instructions for preprocessing, transforming, and generating text content for websites.

## How to Use

1. Check if `task.md` or `spec.md` contains a `Text Processing` section
2. If present, apply the specified transformations to all text content
3. Look for `[generate: ...]` commands to create new content
4. Process text BEFORE generating HTML

---

## Content Generation

Generate new text content using inline commands.

### Syntax

```markdown
[generate: description | tone | length]
```

**Parts:**
- `description` — what to generate (required)
- `tone` — tone of voice (optional, default: professional)
- `length` — short/medium/long (optional, default: medium)

### Examples

**Service description:**
```markdown
### Web Development
[generate: описание услуги веб-разработки для IT-компании | professional | medium]
```

**Output:**
```markdown
### Web Development
Мы создаём современные веб-приложения с использованием передовых технологий.
От корпоративных сайтов до сложных SaaS-платформ — наша команда обеспечивает
полный цикл разработки с фокусом на производительность и масштабируемость.
```

### Generation Types

#### Service Descriptions

```markdown
[generate: описание услуги {название} для {тип бизнеса}]
```

**Example:**
```markdown
## Services

### Appliance Repair
[generate: описание услуги ремонта бытовой техники | friendly | short]

### Installation
[generate: описание услуги установки техники | professional | medium]
```

#### FAQ Generation

```markdown
[generate: FAQ {количество} вопросов про {тема}]
```

**Example:**
```markdown
## FAQ
[generate: FAQ 5 вопросов про доставку и оплату интернет-магазина]
```

**Output:**
```markdown
## FAQ

**Какие способы оплаты вы принимаете?**
Мы принимаем банковские карты, электронные кошельки и наличные при получении.

**Сколько стоит доставка?**
Доставка бесплатна при заказе от 3000 рублей. Стандартная стоимость — 300 рублей.

**Как быстро доставляете?**
Доставка по городу — 1-2 дня, по России — 3-7 рабочих дней.

...
```

#### Testimonials (Placeholders)

```markdown
[generate: {количество} отзывов про {услуга/продукт}]
```

**Example:**
```markdown
## Testimonials
[generate: 3 отзыва про ремонт стиральных машин | enthusiastic]
```

**Output:**
```markdown
> "Мастер приехал в тот же день и починил машинку за час. Очень доволен!"
> — Алексей М., Москва

> "Уже второй раз обращаюсь. Всегда качественно и с гарантией."
> — Елена К., Санкт-Петербург

> "Сервис на высоте! Позвонил утром — вечером машинка работала."
> — Дмитрий В., Казань
```

#### About/Company Description

```markdown
[generate: описание компании {название} | {сфера деятельности} | {особенности}]
```

**Example:**
```markdown
## About Us
[generate: описание компании QuickFix | ремонт техники | 10 лет на рынке, 50000 клиентов]
```

#### CTA Texts

```markdown
[generate: CTA для {действие}]
```

**Example:**
```markdown
[generate: CTA для заказа обратного звонка | enthusiastic | short]
```

**Output:**
```markdown
Оставьте заявку — перезвоним за 5 минут!
```

#### Meta Descriptions

```markdown
[generate: meta description для {страница} | {ключевые слова}]
```

**Example:**
```markdown
[generate: meta description для страницы услуг | ремонт техники москва, быстрый ремонт]
```

**Output:**
```
Профессиональный ремонт бытовой техники в Москве. Выезд мастера в день обращения.
Гарантия 1 год. Звоните: +7 495 123-45-67
```

#### Hero Headlines

```markdown
[generate: заголовок hero для {тип бизнеса} | {стиль}]
```

**Example:**
```markdown
[generate: заголовок hero для фитнес-клуба | enthusiastic]
```

**Output:**
```markdown
# Твоё тело. Твои правила. Твой результат.
```

#### Feature Benefits

```markdown
[generate: {количество} преимуществ для {продукт/услуга}]
```

**Example:**
```markdown
## Why Choose Us
[generate: 4 преимущества для сервиса доставки еды]
```

### Full Syntax

```markdown
[generate: тип контента | tone: ... | length: ... | keywords: ... | language: ...]
```

**All options:**
- `tone` — formal, professional, friendly, casual, enthusiastic, etc.
- `length` — short (1-2 предложения), medium (3-5), long (6+)
- `keywords` — ключевые слова для SEO
- `language` — ru, en (default: language of surrounding text)

**Example:**
```markdown
[generate: описание услуги клининга | tone: friendly | length: medium | keywords: уборка квартир, клининг москва]
```

### Bulk Generation

Generate multiple items at once:

```markdown
## Services

[generate-list: 4 услуги для клининговой компании | format: название + описание (2 предложения)]
```

**Output:**
```markdown
## Services

### Уборка квартир
Профессиональная уборка жилых помещений любой площади. Используем безопасные средства и современное оборудование.

### Уборка офисов
Поддержание чистоты в офисных пространствах. Гибкий график — работаем в удобное для вас время.

### Генеральная уборка
Глубокая очистка всех поверхностей, мытьё окон, химчистка мебели. Идеально перед праздниками или после ремонта.

### Уборка после ремонта
Удаление строительной пыли, мытьё полов и окон, вывоз мусора. Сдадим объект в идеальном состоянии.
```

---

## Processing Directives

---

## Processing Directive Format

In task.md or spec.md, text processing is specified like this:

```markdown
# Text Processing

rewrite: true
tone: professional
length: shorter
language: ru
```

Or inline for specific sections:

```markdown
## About Us
<!-- processing: rewrite, tone=friendly -->
Original text here...
```

---

## Processing Types

### 1. Rewrite (Перефразирование)

Rewrite text in different words while preserving the original meaning.

**Directive:** `rewrite: true`

**Rules:**
- Keep the same meaning and key information
- Change sentence structure and word choice
- Remove repetitions and improve flow
- Preserve proper nouns, brand names, technical terms
- Maintain the same approximate length (unless `length` directive specified)

**Example:**

Input:
```
Наша компания была основана в 2010 году. Мы занимаемся ремонтом бытовой техники.
У нас работают опытные мастера. Мы делаем ремонт быстро и качественно.
```

Output:
```
С 2010 года мы специализируемся на ремонте бытовой техники. Команда опытных
специалистов обеспечивает оперативный и качественный сервис.
```

---

### 2. Tone (Тональность)

Adjust the emotional tone and style of the text.

**Directive:** `tone: <tone_name>`

**Available tones:**

| Tone | Description | Use case |
|------|-------------|----------|
| `formal` | Официальный, деловой | Корпоративные сайты, B2B, юридические |
| `professional` | Профессиональный, экспертный | Услуги, консалтинг, медицина |
| `friendly` | Дружелюбный, тёплый | Локальный бизнес, услуги для людей |
| `casual` | Разговорный, неформальный | Молодёжные бренды, стартапы |
| `enthusiastic` | Энергичный, вдохновляющий | Фитнес, события, развлечения |
| `confident` | Уверенный, авторитетный | Премиум бренды, лидеры рынка |
| `empathetic` | Сочувствующий, понимающий | Медицина, психология, поддержка |
| `luxurious` | Премиальный, изысканный | Люкс товары, элитные услуги |
| `technical` | Технический, точный | IT, инженерия, наука |
| `playful` | Игривый, весёлый | Детские товары, игры, креатив |

**Example - formal:**
```
Input: Звоните нам, мы всегда рады помочь!
Output: Для получения консультации свяжитесь с нами по указанным контактам.
```

**Example - friendly:**
```
Input: Компания оказывает услуги по ремонту техники.
Output: Мы с радостью починим вашу технику — обращайтесь!
```

**Example - enthusiastic:**
```
Input: Мы проводим фитнес-тренировки.
Output: Готовы к трансформации? Наши тренировки зарядят вас энергией!
```

---

### 3. Length (Длина)

Adjust the length of the text content.

**Directive:** `length: <modifier>`

**Modifiers:**

| Modifier | Description | Ratio |
|----------|-------------|-------|
| `much_shorter` | Максимально сжато, только суть | 25-30% |
| `shorter` | Сокращённая версия | 50-60% |
| `same` | Сохранить длину (default) | 100% |
| `longer` | Расширенная версия | 150-170% |
| `much_longer` | Подробное изложение | 200-250% |

**Shortening rules:**
- Remove filler words and redundancies
- Combine related sentences
- Keep only essential information
- Preserve key facts and calls-to-action

**Expanding rules:**
- Add relevant details and examples
- Include benefits and features
- Add transitional phrases
- Elaborate on key points
- Do NOT add false information

**Example - shorter:**
```
Input:
Наша компания была основана в 2010 году группой энтузиастов. С тех пор мы
выросли в крупную организацию с филиалами по всей стране. Мы обслуживаем
тысячи клиентов ежегодно и гордимся качеством нашей работы.

Output:
С 2010 года обслуживаем клиентов по всей стране, гарантируя высокое качество.
```

**Example - longer:**
```
Input:
Ремонт за 1 день.

Output:
Мы понимаем, как важна для вас работающая техника. Поэтому большинство
ремонтов мы выполняем в течение одного рабочего дня. Привозите технику
утром — забирайте вечером, уже исправную.
```

---

## Combined Processing

Multiple directives can be combined:

```markdown
# Text Processing

rewrite: true
tone: professional
length: shorter
```

**Processing order:**
1. Rewrite (if enabled)
2. Apply tone
3. Adjust length

**Example:**

Input:
```
Привет! Мы тут ремонтируем всякую технику типа стиралок, холодильников и
всего такого. Работаем давно, лет 10 уже наверное. Мастера у нас крутые,
всё знают и умеют. Цены нормальные, не дорого. Звоните если что!
```

Directives: `rewrite: true, tone: professional, length: shorter`

Output:
```
Более 10 лет специализируемся на ремонте стиральных машин, холодильников
и другой бытовой техники. Квалифицированные мастера, конкурентные цены.
```

---

## Section-Specific Processing

Apply different processing to different sections:

```markdown
## Hero Section
<!-- processing: tone=enthusiastic, length=shorter -->
Content for hero...

## About Us
<!-- processing: tone=professional -->
Content for about...

## Testimonials
<!-- processing: rewrite=false -->
Keep original testimonials...
```

---

## Language-Aware Processing

**Directive:** `language: <code>`

Ensure output matches the target language:
- `ru` - Russian
- `en` - English
- `de` - German
- etc.

When processing multilingual content:
- Translate if source differs from target
- Adapt idioms and expressions
- Use culturally appropriate phrasing

---

## Do NOT Process

Some content should never be modified:

- **Quotes** - Keep testimonials and citations verbatim
- **Legal text** - Terms, privacy policy, disclaimers
- **Technical specs** - Numbers, measurements, model names
- **Contact info** - Addresses, phones, emails
- **Proper nouns** - Brand names, person names, place names

Mark sections to skip:
```markdown
<!-- processing: none -->
This text will not be processed.
```

---

## Quality Checklist

After processing, verify:

- [ ] Original meaning preserved
- [ ] Key information not lost
- [ ] Tone consistent throughout
- [ ] No factual errors introduced
- [ ] Proper nouns unchanged
- [ ] Contact info accurate
- [ ] CTA (calls-to-action) clear
- [ ] Text flows naturally
- [ ] No awkward phrasing
- [ ] Length matches directive

---

## Examples by Industry

### E-commerce

```yaml
tone: confident
length: shorter
focus: benefits, features, urgency
```

### Professional Services

```yaml
tone: professional
length: same
focus: expertise, trust, results
```

### Local Business

```yaml
tone: friendly
length: same
focus: community, personal touch, convenience
```

### Healthcare

```yaml
tone: empathetic
length: longer
focus: understanding, care, safety
```

### Tech/SaaS

```yaml
tone: technical
length: shorter
focus: features, efficiency, innovation
```

---

## Final Cleanup

**IMPORTANT:** Before delivering the final website, remove ALL HTML comments from the output.

Remove:
- Processing markers (`<!-- processing: ... -->`)
- Development comments (`<!-- TODO -->`, `<!-- FIXME -->`)
- Section markers (`<!-- Hero Section -->`)
- Any other `<!-- ... -->` comments

The final HTML should contain NO comments whatsoever.

**Example:**

Before cleanup:
```html
<!-- Hero Section -->
<section class="hero">
  <!-- processing: tone=professional -->
  <h1>Welcome</h1>
</section>
```

After cleanup:
```html
<section class="hero">
  <h1>Welcome</h1>
</section>
```
