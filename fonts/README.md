# Typography - LLM Instructions

Local font collection for websites. All fonts are Google Fonts in woff2 format with local CSS files.

## How to Use

1. Choose fonts based on project type
2. Use recommended font pairings (heading + body)
3. Include the local.css file from font directory
4. Apply font-family in CSS

## HTML Setup

```html
<!-- Single font -->
<link rel="stylesheet" href="fonts/inter/local.css">

<!-- Font pairing -->
<link rel="stylesheet" href="fonts/playfair-display/local.css">
<link rel="stylesheet" href="fonts/source-sans/local.css">
```

## CSS Usage

```css
body {
  font-family: 'Inter', sans-serif;
}

h1, h2, h3 {
  font-family: 'Playfair Display', serif;
}

code, pre {
  font-family: 'Fira Code', monospace;
}
```

---

## Available Fonts

### Sans-Serif

| Font | Weights | Use Case | CSS Name |
|------|---------|----------|----------|
| Inter | 400, 500, 600, 700 | UI, Apps, SaaS | 'Inter' |
| Roboto | 400, 500, 700 | Android, Material | 'Roboto' |
| Open Sans | 400, 500, 600, 700 | General, Readable | 'Open Sans' |
| Lato | 400, 700 | Corporate, Clean | 'Lato' |
| Poppins | 400, 500, 600, 700 | Modern, Geometric | 'Poppins' |
| Montserrat | 400, 500, 600, 700 | Headers, Bold | 'Montserrat' |
| Nunito | 400, 600, 700 | Friendly, Rounded | 'Nunito' |
| Raleway | 400, 500, 600, 700 | Elegant, Thin | 'Raleway' |
| Source Sans | 400, 600, 700 | Adobe, Technical | 'Source Sans 3' |

### Serif

| Font | Weights | Use Case | CSS Name |
|------|---------|----------|----------|
| Playfair Display | 400, 500, 600, 700 | Luxury, Editorial | 'Playfair Display' |
| Merriweather | 400, 700 | Reading, Blog | 'Merriweather' |
| Source Serif | 400, 600, 700 | Articles, Print | 'Source Serif 4' |
| Lora | 400, 500, 600, 700 | Books, Classic | 'Lora' |
| PT Serif | 400, 700 | Russian, Academic | 'PT Serif' |

### Monospace

| Font | Weights | Use Case | CSS Name |
|------|---------|----------|----------|
| Fira Code | 400, 500, 600, 700 | Code, Ligatures | 'Fira Code' |
| JetBrains Mono | 400, 500, 700 | IDE, Terminal | 'JetBrains Mono' |

---

## Font Pairings

Proven heading + body combinations.

### Professional / Corporate

**Classic Business**
```
heading: 'Playfair Display', serif
body:    'Source Sans 3', sans-serif
```

**Modern Corporate**
```
heading: 'Montserrat', sans-serif
body:    'Open Sans', sans-serif
```

**Clean Professional**
```
heading: 'Raleway', sans-serif
body:    'Lato', sans-serif
```

### Tech / Startup

**SaaS Product**
```
heading: 'Inter', sans-serif
body:    'Inter', sans-serif
```

**Modern Tech**
```
heading: 'Poppins', sans-serif
body:    'Inter', sans-serif
```

**Developer Focus**
```
heading: 'Inter', sans-serif
body:    'Inter', sans-serif
code:    'Fira Code', monospace
```

### Editorial / Blog

**Magazine Style**
```
heading: 'Playfair Display', serif
body:    'Merriweather', serif
```

**Modern Blog**
```
heading: 'Lora', serif
body:    'Open Sans', sans-serif
```

**News Site**
```
heading: 'Source Serif 4', serif
body:    'Source Sans 3', sans-serif
```

### Creative / Portfolio

**Designer Portfolio**
```
heading: 'Montserrat', sans-serif
body:    'Raleway', sans-serif
```

**Artistic**
```
heading: 'Playfair Display', serif
body:    'Nunito', sans-serif
```

**Minimalist**
```
heading: 'Raleway', sans-serif
body:    'Lato', sans-serif
```

### E-commerce

**Luxury Brand**
```
heading: 'Playfair Display', serif
body:    'Lato', sans-serif
```

**Modern Shop**
```
heading: 'Poppins', sans-serif
body:    'Open Sans', sans-serif
```

**Fashion**
```
heading: 'Montserrat', sans-serif
body:    'Source Sans 3', sans-serif
```

---

## Typography Scale

Recommended size hierarchy.

### Desktop

```css
h1 { font-size: 3rem; }      /* 48px */
h2 { font-size: 2.25rem; }   /* 36px */
h3 { font-size: 1.5rem; }    /* 24px */
h4 { font-size: 1.25rem; }   /* 20px */
body { font-size: 1rem; }    /* 16px */
small { font-size: 0.875rem; } /* 14px */
```

### Mobile

```css
h1 { font-size: 2rem; }      /* 32px */
h2 { font-size: 1.5rem; }    /* 24px */
h3 { font-size: 1.25rem; }   /* 20px */
h4 { font-size: 1.125rem; }  /* 18px */
body { font-size: 1rem; }    /* 16px */
```

### Line Height

```css
h1, h2 { line-height: 1.2; }
h3, h4 { line-height: 1.3; }
body { line-height: 1.6; }
```

---

## Selection Guide

| Project Type | Heading Font | Body Font |
|--------------|--------------|-----------|
| Corporate | Montserrat | Open Sans |
| Tech/SaaS | Inter | Inter |
| Blog/Editorial | Playfair Display | Merriweather |
| E-commerce | Poppins | Open Sans |
| Portfolio | Raleway | Lato |
| Luxury | Playfair Display | Lato |
| Modern | Poppins | Inter |
| Friendly | Nunito | Open Sans |
| Academic | PT Serif | Source Serif 4 |
| Developer | Inter | Fira Code (code) |

---

## File Structure

Each font directory contains:
```
fonts/[font-name]/
  local.css    # Use this - has relative paths
  font.css     # Original Google CSS
  *.woff2      # Font files
```

## Quick Start

```html
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="fonts/inter/local.css">
  <style>
    body {
      font-family: 'Inter', sans-serif;
      font-size: 16px;
      line-height: 1.6;
    }
  </style>
</head>
<body>
  <h1>Hello World</h1>
  <p>Body text with Inter font.</p>
</body>
</html>
```

## Font Pairing Quick Start

```html
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="fonts/playfair-display/local.css">
  <link rel="stylesheet" href="fonts/source-sans/local.css">
  <style>
    body {
      font-family: 'Source Sans 3', sans-serif;
      font-size: 16px;
      line-height: 1.6;
    }
    h1, h2, h3 {
      font-family: 'Playfair Display', serif;
      line-height: 1.2;
    }
  </style>
</head>
<body>
  <h1>Elegant Heading</h1>
  <p>Clean body text with Source Sans.</p>
</body>
</html>
```
