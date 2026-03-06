# Color Palettes - LLM Instructions

See global rules: `modules/README.md`.

Ready-to-use color combinations for websites. Each palette has a unique name and tested color harmony.

## Purpose

Provide named color palettes and rules for consistent usage.

## How to Use

1. Choose palette based on project type or mood
2. **Copy `base.css`** and replace CSS variables with palette values
3. **CRITICAL: `heading` is always neutral** (black/dark gray) — never use colored text for headings
4. Follow the 60-30-10 rule: 60% primary, 30% secondary, 10% accent

Use `modules/colors/base.css` as the single source of truth for variable names.

## Examples

```css
:root {
  /* copy from base.css, then set palette values */
  --primary: #16A34A;
  --primary-dark: #15803D;
  --secondary: #22C55E;
  --accent: #EA580C;
  --heading: #111827;
  --text: #374151;
}
```

## Rules

- Use `modules/colors/base.css` as the source of truth
- Headings must always be neutral (not colored)
- Follow the 60-30-10 rule for usage

## Checklist

- [ ] base.css copied and filled
- [ ] headings neutral
- [ ] surface pairs defined

## References

- `modules/colors/base.css`

### Standard Text Colors

Use for all palettes.

These values are the same for every palette:

```css
--heading:    #111827;  /* h1-h6, .title */
--text:       #374151;  /* body text */
--text-muted: #6B7280;  /* secondary text */
--on-primary: #FFFFFF;  /* text on primary-colored backgrounds */
```

Only `--on-dark` changes per palette (lighter variant of primary for dark footer).

---

## Professional / Corporate

### Ocean Trust
Clean, trustworthy feel for business sites.
```
primary:    #0066CC (blue)
secondary:  #004499 (dark blue)
accent:     #FF6B35 (orange)
background: #F8FAFC (light gray)
text:       #1E293B (dark slate)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #1E293B
on-dark:    #F8FAFC
```

### Slate Professional
Modern corporate, serious tone.
```
primary:    #334155 (slate)
secondary:  #64748B (gray)
accent:     #3B82F6 (blue)
background: #FFFFFF (white)
text:       #0F172A (dark)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #0F172A
on-dark:    #F8FAFC
```

### Executive Green
Finance, legal, consulting.
```
primary:    #166534 (green)
secondary:  #14532D (dark green)
accent:     #CA8A04 (gold)
background: #FAFAF9 (warm white)
text:       #1C1917 (charcoal)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #14532D
on-dark:    #F0FDF4
```

### Navy Authority
Government, institutions, enterprise.
```
primary:    #1E3A5F (navy)
secondary:  #3D5A80 (steel blue)
accent:     #EE6C4D (coral)
background: #F0F4F8 (blue gray)
text:       #293241 (dark blue)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #1E3A5F
on-dark:    #F0F4F8
```

---

## Tech / Startup

### Midnight Tech

Dark mode tech aesthetic.
```
primary:    #6366F1 (indigo)
secondary:  #8B5CF6 (violet)
accent:     #22D3EE (cyan)
background: #0F0F23 (dark)
text:       #E2E8F0 (light)
heading:    #FFFFFF (neutral on dark)
on-primary: #FFFFFF
surface-dark: #0F0F23
on-dark:    #E2E8F0
```

### Electric Startup

Energetic, modern SaaS.
```
primary:    #7C3AED (purple)
secondary:  #2563EB (blue)
accent:     #10B981 (emerald)
background: #FFFFFF (white)
text:       #111827 (near black)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #111827
on-dark:    #F9FAFB
```

### Neon Cyber

Gaming, crypto, futuristic.
```
primary:    #00FF88 (neon green)
secondary:  #FF00FF (magenta)
accent:     #00FFFF (cyan)
background: #0A0A0A (black)
text:       #FFFFFF (white)
heading:    #FFFFFF (neutral on dark)
on-primary: #0A0A0A
surface-dark: #0A0A0A
on-dark:    #FFFFFF
```

### Clean SaaS

Minimal tech product.
```
primary:    #2563EB (blue)
secondary:  #1D4ED8 (dark blue)
accent:     #F59E0B (amber)
background: #F9FAFB (gray 50)
text:       #374151 (gray 700)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #1D4ED8
on-dark:    #F9FAFB
```

### Terminal Dark

Developer tools, code editors.
```
primary:    #22C55E (green)
secondary:  #3B82F6 (blue)
accent:     #F97316 (orange)
background: #1E1E1E (vs code dark)
text:       #D4D4D4 (light gray)
heading:    #FFFFFF (neutral on dark)
on-primary: #0A0A0A
surface-dark: #1E1E1E
on-dark:    #D4D4D4
```

---

## Nature / Organic

### Forest Calm

Eco, sustainability, wellness.
```
primary:    #2D5016 (forest green)
secondary:  #4D7C0F (lime green)
accent:     #A3E635 (bright lime)
background: #FEFCE8 (warm white)
text:       #1A2E05 (dark green)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #2D5016
on-dark:    #F0FDF4
```

### Earth Tone

Natural products, organic brands.
```
primary:    #78716C (stone)
secondary:  #A8A29E (warm gray)
accent:     #84CC16 (green)
background: #FAF9F6 (cream)
text:       #44403C (brown)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #44403C
on-dark:    #FAFAF9
```

### Ocean Breeze

Beach, travel, relaxation.
```
primary:    #0891B2 (cyan)
secondary:  #06B6D4 (light cyan)
accent:     #F59E0B (sand/amber)
background: #F0FDFA (mint)
text:       #164E63 (dark cyan)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #164E63
on-dark:    #F0FDFA
```

### Desert Sand

Warm, earthy, bohemian.
```
primary:    #B45309 (amber)
secondary:  #D97706 (orange)
accent:     #0D9488 (teal)
background: #FFFBEB (cream)
text:       #78350F (brown)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #78350F
on-dark:    #FFFBEB
```

### Botanical

Plants, gardens, florists.
```
primary:    #15803D (green)
secondary:  #86EFAC (light green)
accent:     #FB7185 (rose)
background: #F0FDF4 (green tint)
text:       #14532D (dark green)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #14532D
on-dark:    #F0FDF4
```

---

## Creative / Design

### Sunset Gradient

Bold, creative, artistic.
```
primary:    #F43F5E (rose)
secondary:  #FB923C (orange)
accent:     #FBBF24 (yellow)
background: #18181B (dark)
text:       #FAFAFA (white)
heading:    #FFFFFF (neutral on dark)
on-primary: #FFFFFF
surface-dark: #18181B
on-dark:    #FAFAFA
```

### Pastel Dream

Soft, feminine, lifestyle.
```
primary:    #F9A8D4 (pink)
secondary:  #C4B5FD (lavender)
accent:     #6EE7B7 (mint)
background: #FFFBFE (rose white)
text:       #581C87 (purple)
heading:    #111827 (neutral)
on-primary: #1F2937
surface-dark: #581C87
on-dark:    #FDF4FF
```

### Bold Contrast

Striking, memorable, high impact.
```
primary:    #DC2626 (red)
secondary:  #000000 (black)
accent:     #FBBF24 (yellow)
background: #FFFFFF (white)
text:       #171717 (near black)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #000000
on-dark:    #FFFFFF
```

### Studio Minimal

Clean portfolio, photography.
```
primary:    #18181B (black)
secondary:  #71717A (gray)
accent:     #E11D48 (rose)
background: #FAFAFA (off white)
text:       #27272A (dark gray)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #18181B
on-dark:    #FAFAFA
```

### Candy Pop

Fun, playful, youth brands.
```
primary:    #EC4899 (pink)
secondary:  #8B5CF6 (purple)
accent:     #06B6D4 (cyan)
background: #FDF4FF (light pink)
text:       #1F2937 (dark)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #1F2937
on-dark:    #FDF4FF
```

---

## E-commerce / Retail

### Luxury Gold

Premium, high-end products.
```
primary:    #B8860B (dark gold)
secondary:  #1C1917 (charcoal)
accent:     #D4AF37 (gold)
background: #FFFEF7 (ivory)
text:       #292524 (dark brown)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #1C1917
on-dark:    #FFFEF7
```

### Trust Blue

General retail, marketplaces.
```
primary:    #1D4ED8 (blue)
secondary:  #3B82F6 (lighter blue)
accent:     #EF4444 (red for sales)
background: #FFFFFF (white)
text:       #1F2937 (dark gray)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #1F2937
on-dark:    #F9FAFB
```

### Fashion Noir

Clothing, accessories.
```
primary:    #000000 (black)
secondary:  #404040 (dark gray)
accent:     #B91C1C (deep red)
background: #FFFFFF (white)
text:       #171717 (black)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #000000
on-dark:    #FFFFFF
```

### Fresh Market

Food, groceries, organic.
```
primary:      #16A34A (green)
primary-dark: #15803D
secondary:    #22C55E (light green)
accent:       #EA580C (orange)
background:   #FFFFFF (white)
heading:      #111827 (neutral black)
text:         #374151 (neutral gray)
text-muted:   #6B7280
surface-dark: #14532D (for footer)
on-dark:      #F0FDF4
on-primary:   #FFFFFF
```

---

## Health / Wellness

### Medical Trust

Healthcare, clinics, pharma.
```
primary:    #0EA5E9 (sky blue)
secondary:  #0284C7 (darker blue)
accent:     #10B981 (green)
background: #F0F9FF (light blue)
text:       #0C4A6E (dark blue)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #0C4A6E
on-dark:    #F0F9FF
```

### Spa Serenity

Wellness, meditation, yoga.
```
primary:    #5EEAD4 (teal)
secondary:  #99F6E4 (light teal)
accent:     #C084FC (purple)
background: #F0FDFA (mint white)
text:       #134E4A (dark teal)
heading:    #111827 (neutral)
on-primary: #1F2937
surface-dark: #134E4A
on-dark:    #F0FDFA
```

### Fitness Energy

Gym, sports, active lifestyle.
```
primary:    #EF4444 (red)
secondary:  #F97316 (orange)
accent:     #1E1E1E (black)
background: #FFFFFF (white)
text:       #171717 (near black)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #1E1E1E
on-dark:    #F9FAFB
```

---

## Food / Restaurant

### Appetito

Italian, warm dining.
```
primary:    #B91C1C (red)
secondary:  #7F1D1D (dark red)
accent:     #CA8A04 (olive gold)
background: #FFFBEB (cream)
text:       #292524 (brown)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #7F1D1D
on-dark:    #FFFBEB
```

### Cafe Warm

Coffee shops, bakeries.
```
primary:    #78350F (brown)
secondary:  #A16207 (caramel)
accent:     #65A30D (green)
background: #FFFBF5 (warm white)
text:       #422006 (dark brown)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #422006
on-dark:    #FFFBF5
```

### Fresh Kitchen

Modern, healthy food.
```
primary:    #65A30D (lime green)
secondary:  #84CC16 (bright lime)
accent:     #F97316 (orange)
background: #FFFFFF (white)
text:       #1A2E05 (dark green)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #1A2E05
on-dark:    #F0FDF4
```

---

## Education / Learning

### Scholar Blue

Schools, universities, courses.
```
primary:    #1E40AF (royal blue)
secondary:  #3B82F6 (blue)
accent:     #F59E0B (amber)
background: #EFF6FF (blue tint)
text:       #1E3A8A (dark blue)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #1E3A8A
on-dark:    #EFF6FF
```

### Kids Bright

Children, playful learning.
```
primary:    #F59E0B (yellow)
secondary:  #10B981 (green)
accent:     #EC4899 (pink)
background: #FFFFFF (white)
text:       #1F2937 (dark gray)
heading:    #111827 (neutral)
on-primary: #1F2937
surface-dark: #1F2937
on-dark:    #F9FAFB
```

---

## Dark Themes

### Carbon Dark

Universal dark mode.
```
primary:    #3B82F6 (blue)
secondary:  #1E293B (dark slate)
accent:     #22D3EE (cyan)
background: #0F172A (dark blue)
text:       #F1F5F9 (light)
heading:    #FFFFFF (neutral on dark)
on-primary: #FFFFFF
surface-dark: #0F172A
on-dark:    #F1F5F9
```

### Midnight Purple

Creative dark theme.
```
primary:    #A855F7 (purple)
secondary:  #7C3AED (violet)
accent:     #F472B6 (pink)
background: #18181B (zinc 900)
text:       #E4E4E7 (zinc 200)
heading:    #FFFFFF (neutral on dark)
on-primary: #FFFFFF
surface-dark: #18181B
on-dark:    #E4E4E7
```

### Charcoal Minimal

Elegant dark mode.
```
primary:    #FFFFFF (white)
secondary:  #A1A1AA (gray)
accent:     #F43F5E (rose)
background: #27272A (dark gray)
text:       #FAFAFA (white)
heading:    #FFFFFF (neutral on dark)
on-primary: #111827
surface-dark: #27272A
on-dark:    #FAFAFA
```

---

## Monochrome

### Pure Grayscale

Minimalist, typography focused.
```
primary:    #171717 (black)
secondary:  #525252 (gray)
accent:     #A3A3A3 (light gray)
background: #FFFFFF (white)
text:       #262626 (near black)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #171717
on-dark:    #FFFFFF
```

### Warm Gray

Softer monochrome.
```
primary:    #292524 (warm black)
secondary:  #78716C (stone)
accent:     #D6D3D1 (light stone)
background: #FAFAF9 (warm white)
text:       #1C1917 (dark)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #292524
on-dark:    #FAFAF9
```

---

## Seasonal

### Spring Bloom

Fresh, renewal.
```
primary:    #22C55E (green)
secondary:  #A3E635 (lime)
accent:     #F472B6 (pink)
background: #F0FDF4 (green white)
text:       #14532D (dark green)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #14532D
on-dark:    #F0FDF4
```

### Summer Vibrant

Energetic, sunny.
```
primary:    #0EA5E9 (sky blue)
secondary:  #FBBF24 (yellow)
accent:     #F97316 (orange)
background: #FFFFFF (white)
text:       #0C4A6E (dark blue)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #0C4A6E
on-dark:    #F0F9FF
```

### Autumn Warm

Cozy, harvest.
```
primary:    #C2410C (rust)
secondary:  #EA580C (orange)
accent:     #CA8A04 (gold)
background: #FFFBEB (cream)
text:       #431407 (dark brown)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #431407
on-dark:    #FFFBEB
```

### Winter Cool

Clean, crisp.
```
primary:    #0891B2 (cyan)
secondary:  #67E8F9 (light cyan)
accent:     #E11D48 (rose)
background: #F8FAFC (cool white)
text:       #164E63 (dark cyan)
heading:    #111827 (neutral)
on-primary: #FFFFFF
surface-dark: #164E63
on-dark:    #F8FAFC
```

---

## Selection Guide

| Project Type | Recommended Palettes |
|--------------|---------------------|
| Corporate/Business | Ocean Trust, Slate Professional, Navy Authority |
| Tech/SaaS | Midnight Tech, Electric Startup, Clean SaaS |
| E-commerce | Trust Blue, Fresh Market, Luxury Gold |
| Healthcare | Medical Trust, Spa Serenity |
| Food/Restaurant | Appetito, Cafe Warm, Fresh Kitchen |
| Creative/Portfolio | Sunset Gradient, Studio Minimal, Bold Contrast |
| Nature/Eco | Forest Calm, Earth Tone, Botanical |
| Dark Mode | Carbon Dark, Midnight Purple, Charcoal Minimal |
| Minimal | Pure Grayscale, Warm Gray |
| Kids/Fun | Kids Bright, Candy Pop |

## Color Application

```
60% - Primary/Background (main areas)
30% - Secondary (supporting elements)
10% - Accent (CTAs, highlights, links)
```

### Typical Usage

- **Background**: Page background, cards
- **Primary**: Headers, main buttons, key elements
- **Secondary**: Borders, secondary buttons, subtle backgrounds
- **Accent**: Links, CTAs, hover states, notifications
- **Text**: Body text, headings

## Accessibility Notes

Ensure contrast ratio of at least:
- 4.5:1 for normal text
- 3:1 for large text and UI components

Dark text on light background or light text on dark background.

---

## Surface Pairs

When alternating light and dark sections, ensure each surface has a matching text color.

Контрастные секции.

### Rule: each surface has its own text color

Правило: каждая поверхность имеет свой цвет текста.

```css
:root {
  /* Light surface (белые/светлые блоки) */
  --surface-light: #FFFFFF;
  --on-light: #1F2937;           /* тёмный текст */
  --on-light-muted: #6B7280;     /* приглушённый */

  /* Dark surface (тёмные блоки) */
  --surface-dark: #1F2937;
  --on-dark: #F9FAFB;            /* светлый текст */
  --on-dark-muted: #9CA3AF;      /* приглушённый */

  /* Primary surface (CTA, hero с основным цветом) */
  --surface-primary: var(--primary);
  --on-primary: #FFFFFF;         /* обычно белый */
}
```

### Ready-to-use section classes

Готовые классы для секций.

```css
.section-light {
  background: var(--surface-light);
  color: var(--on-light);
}
.section-light .text-muted { color: var(--on-light-muted); }

.section-dark {
  background: var(--surface-dark);
  color: var(--on-dark);
}
.section-dark .text-muted { color: var(--on-dark-muted); }

.section-primary {
  background: var(--surface-primary);
  color: var(--on-primary);
}
```

### Example page structure

Пример структуры страницы.

```
┌─────────────────────────────────┐
│  Navbar (light)                 │  --on-light
├─────────────────────────────────┤
│  Hero (primary/gradient)        │  --on-primary (white)
├─────────────────────────────────┤
│  Services (light)               │  --on-light
├─────────────────────────────────┤
│  Why Us (light-alt/gray)        │  --on-light
├─────────────────────────────────┤
│  Reviews (light)                │  --on-light
├─────────────────────────────────┤
│  CTA Banner (primary)           │  --on-primary (white)
├─────────────────────────────────┤
│  Footer (dark)                  │  --on-dark
└─────────────────────────────────┘
```

### Surface pairs per palette

Surface pairs для каждой палитры.

При использовании палитры определяй все поверхности:

```
Ocean Trust:
  surface-light:   #F8FAFC    on-light:   #1E293B
  surface-dark:    #1E293B    on-dark:    #F8FAFC
  surface-primary: #0066CC    on-primary: #FFFFFF

Executive Green:
  surface-light:   #FAFAF9    on-light:   #1C1917
  surface-dark:    #14532D    on-dark:    #F0FDF4
  surface-primary: #166534    on-primary: #FFFFFF

Medical Trust:
  surface-light:   #F0F9FF    on-light:   #0C4A6E
  surface-dark:    #0C4A6E    on-dark:    #F0F9FF
  surface-primary: #0EA5E9    on-primary: #FFFFFF

Fresh Market:
  surface-light:   #FFFFFF    on-light:   #166534
  surface-dark:    #14532D    on-dark:    #F0FDF4
  surface-primary: #16A34A    on-primary: #FFFFFF

Carbon Dark:
  surface-light:   #1E293B    on-light:   #F1F5F9
  surface-dark:    #0F172A    on-dark:    #F1F5F9
  surface-primary: #3B82F6    on-primary: #FFFFFF
```

### Headings must be neutral

Важно: заголовки должны быть нейтральными.

Headings must always use neutral colors (not colored text).

**Правило: заголовки всегда используют нейтральный цвет, не цветной.**

Even if the palette sets a colored `text` (for example `#166534`), headings must be:

Даже если палитра задаёт цветной `text` (например, тёмно-зелёный `#166534`), заголовки должны быть:
- На светлом фоне: **чёрный или тёмно-серый** (`#111827`, `#1F2937`, `#171717`)
- На тёмном фоне: **белый или светло-серый** (`#FFFFFF`, `#F9FAFB`)

Colored text is allowed only for body text, not headings.

Цветной текст допустим только для body text, не для заголовков.

**Why:** Colored headings (green, blue) reduce readability even with sufficient contrast. Neutral colors provide better typography.

**Почему:** Цветные заголовки (зелёные, синие) снижают читаемость даже при достаточном контрасте. Нейтральные цвета обеспечивают лучшую типографику.

```css
:root {
  /* Нейтральные цвета для заголовков */
  --heading-light: #111827;    /* на светлом фоне */
  --heading-dark: #FFFFFF;     /* на тёмном фоне */
}

/* Заголовки всегда нейтральные */
h1, h2, h3, h4, h5, h6,
.title {
  color: var(--heading-light);
}

/* На тёмных секциях */
.section-dark h1, .section-dark h2, .section-dark .title,
.hero.is-primary .title, .hero.is-link .title {
  color: var(--heading-dark);
}
```

### Example implementation

Пример правильной реализации.

```css
:root {
  /* Палитра Fresh Market */
  --primary: #16A34A;
  --text: #166534;           /* для body text */

  /* Но заголовки нейтральные! */
  --heading: #111827;        /* чёрный для заголовков */
}

body { color: var(--text); }           /* зелёный body */
h1, h2, h3 { color: var(--heading); }  /* чёрные заголовки */
```

### Contrast checklist

Чеклист контрастности.

При создании страницы проверь:

- [ ] **Заголовки нейтральные** (чёрный/белый, НЕ цветные)
- [ ] Hero/CTA с основным цветом → белый текст
- [ ] Светлые секции → тёмный текст (`--on-light`)
- [ ] Тёмный footer → светлый текст (`--on-dark`)
- [ ] Карточки на цветном фоне → проверить контраст
- [ ] Кнопки: текст контрастен к фону кнопки
- [ ] Ссылки читаемы на любом фоне секции
