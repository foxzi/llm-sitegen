# Modules - Style Guide and Rules

This document defines shared rules and a unified structure for all module README files.

---

## Goals

- Keep modules consistent and easy to scan
- Avoid contradictions across modules
- Provide single sources of truth for shared rules

---

## Unified README Structure

Each module README must follow this order:

1. Purpose
2. How to Use
3. Examples
4. Rules
5. Checklist
6. References

---

## Global Rules (Apply to All Modules)

### Offline-First

- Use local assets only (no CDN links)
- If a fallback is needed, it must be local

### Source of Truth

- Colors: `modules/colors/base.css`
- Fonts: `modules/fonts/<font>/local.css`
- Icons: `modules/icons/` (SVG files)

### Paths in Generated Output

- Output assets must be under `assets/`
  - `assets/css/`
  - `assets/js/`
  - `assets/images/`
  - `assets/icons/`
  - `assets/fonts/`

### Language Consistency

- Module README files must be either English-only or bilingual
- If bilingual, keep EN first, then RU
- If a section is bilingual, place RU immediately after the EN paragraph

### Scripts

- Generation scripts are not allowed unless explicitly permitted
- Post-processing scripts are allowed only when stated in the module

---

## References

- `modules/colors/base.css`
- `modules/fonts/README.md`
- `modules/icons/README.md`
