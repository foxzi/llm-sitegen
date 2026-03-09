# Keywords Extraction - LLM Instructions

Instructions for extracting and generating SEO keywords from project specifications.

## How to Use

1. Analyze the project text (content.md, technical.md, or user brief)
2. Extract keywords following the rules below
3. Generate output in both formats: meta tag and content list

---

## Extraction Rules

### Step 1: Identify Key Elements

Extract from the text:

| Element | What to look for |
|---------|------------------|
| **Business** | Company name, brand, industry, niche |
| **Services/Products** | What they sell or offer |
| **Location** | City, region, country (if local business) |
| **Target audience** | Who are the customers |
| **USP** | Unique selling points, differentiators |
| **Actions** | What users should do (buy, order, contact, etc.) |

### Step 2: Generate Keyword Types

Create keywords in these categories:

1. **Primary keywords** (3-5) - Main topics, high search volume
2. **Secondary keywords** (5-10) - Related terms, modifiers
3. **Long-tail keywords** (5-10) - Specific phrases, 3-5 words
4. **Local keywords** (if applicable) - With location modifiers

### Step 3: Keyword Formatting

- Use lowercase (except proper nouns)
- Singular and plural forms where relevant
- No stop words unless part of natural phrase
- Include synonyms and related terms
- Mix English and local language if multilingual site

---

## Extraction Examples

### Example Input (Restaurant)

```
Итальянский ресторан "Bella Vista" в центре Москвы.
Авторская кухня от шеф-повара из Неаполя.
Домашняя паста, пицца на дровах, морепродукты.
Романтическая атмосфера, винная карта 200+ позиций.
Доставка и банкеты.
```

### Example Output

**Primary keywords:**
- итальянский ресторан москва
- ресторан итальянской кухни
- Bella Vista

**Secondary keywords:**
- авторская кухня
- пицца на дровах
- домашняя паста
- морепродукты
- романтический ресторан
- винный ресторан

**Long-tail keywords:**
- итальянский ресторан в центре москвы
- ресторан с доставкой итальянской еды
- банкетный зал итальянский ресторан
- пицца на дровах москва центр
- романтический ужин москва

**Local keywords:**
- ресторан центр москвы
- итальянская кухня москва
- где поесть пасту москва

---

## Output Format 1: Meta Keywords Tag

```html
<meta name="keywords" content="итальянский ресторан москва, Bella Vista, пицца на дровах, домашняя паста, авторская кухня, романтический ресторан москва, морепродукты, винный ресторан, банкеты, доставка итальянской еды">
```

### Meta Keywords Guidelines

- Maximum 10-15 keywords
- Separate with commas
- Most important keywords first
- Total length: under 200 characters recommended
- No duplicates
- No keyword stuffing

> Note: Google ignores meta keywords, but other search engines (Yandex, Bing) may use them.

---

## Output Format 2: Content Keywords List

Structure for using keywords throughout the site:

```yaml
keywords:
  # Use in H1, title, first paragraph
  primary:
    - итальянский ресторан москва
    - ресторан итальянской кухни
    - Bella Vista ресторан

  # Use in H2, subheadings, body text
  secondary:
    - авторская кухня
    - пицца на дровах
    - домашняя паста
    - морепродукты
    - романтический ресторан
    - винная карта

  # Use in blog posts, FAQ, detailed descriptions
  long_tail:
    - итальянский ресторан в центре москвы
    - где заказать пиццу на дровах
    - романтический ужин для двоих москва
    - банкет в итальянском стиле

  # Use in contact page, footer, local landing pages
  local:
    - ресторан центр москвы
    - итальянская кухня рядом
    - доставка еды центр москвы

  # Use in image alt texts
  image_alt:
    - пицца маргарита на дровах
    - интерьер итальянского ресторана
    - домашняя паста с морепродуктами
    - винный погреб ресторана
```

---

## Keyword Placement Guide

| Location | Keywords to use | Density |
|----------|-----------------|---------|
| Title tag | 1 primary | - |
| H1 | 1 primary | - |
| Meta description | 1-2 primary + 1 secondary | - |
| H2-H3 | Secondary, long-tail | - |
| First paragraph | 1 primary | - |
| Body text | All types | 1-2% |
| Image alt | Image-specific | - |
| URL slug | 1 primary | - |
| Anchor text | Varied | - |

---

## Industry-Specific Keywords

### E-commerce
- Product names, categories, brands
- "buy", "order", "price", "delivery"
- Product attributes (size, color, material)
- Comparison terms ("best", "top", "review")

### Services
- Service names, specializations
- "professional", "expert", "certified"
- Problem-solution keywords
- Location + service combinations

### Local Business
- City, district, neighborhood
- "near me", "nearby", "in [location]"
- Working hours keywords ("24/7", "open now")
- Directions keywords

### B2B
- Industry terminology
- Solution-oriented keywords
- Company size modifiers ("enterprise", "SMB")
- Integration and compatibility terms

---

## Keyword Expansion

If provided keywords are limited, expand using:

1. **Synonyms** - Alternative words with same meaning
2. **Related terms** - Conceptually connected words
3. **Modifiers** - Adjectives, qualifiers (best, professional, cheap)
4. **Questions** - How, what, where, why + topic
5. **Actions** - Verbs relevant to the business
6. **Comparisons** - vs, alternative, compare
7. **Location** - Add geographic modifiers

### Expansion Example

Given keyword: `ремонт квартир`

Expanded:
- Synonyms: отделка квартир, renovation
- Related: дизайн интерьера, ремонт под ключ
- Modifiers: качественный ремонт, недорогой ремонт, быстрый ремонт
- Questions: сколько стоит ремонт квартиры, как выбрать бригаду
- Actions: заказать ремонт, вызвать мастера
- Location: ремонт квартир москва, ремонт квартир недорого спб

---

## Checklist

Before finalizing keywords:

- [ ] Primary keywords reflect main business offering
- [ ] Location included (if local business)
- [ ] Mix of short and long-tail keywords
- [ ] No keyword stuffing
- [ ] Keywords are actually searchable (real user queries)
- [ ] Competitors' keywords considered
- [ ] Both formats generated (meta + content list)
- [ ] Keywords assigned to specific page elements
