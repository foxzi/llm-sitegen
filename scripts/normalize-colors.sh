#!/bin/bash

# Нормализация цветов в сгенерированном CSS
# Использует CSS-переменные из файла, не хардкодит цвета
# Использование: ./scripts/normalize-colors.sh path/to/style.css

set -e

CSS_FILE="$1"

if [ -z "$CSS_FILE" ] || [ ! -f "$CSS_FILE" ]; then
    echo "Usage: $0 path/to/style.css"
    exit 1
fi

echo "Normalizing colors in: $CSS_FILE"

# Backup
cp "$CSS_FILE" "$CSS_FILE.backup"

# Проверяем наличие CSS-переменных
HAS_HEADING_VAR=$(grep -c "\-\-heading" "$CSS_FILE" || true)
HAS_TEXT_VAR=$(grep -c "\-\-text:" "$CSS_FILE" || true)
HAS_ON_DARK_VAR=$(grep -c "\-\-on-dark" "$CSS_FILE" || true)

# Добавляем правила только если есть переменные
if [ "$HAS_HEADING_VAR" -gt 0 ] || [ "$HAS_TEXT_VAR" -gt 0 ]; then
    cat >> "$CSS_FILE" << 'EOF'

/* === Color Normalization (auto-added) === */

/* Карточки: сбрасываем к светлому фону с тёмным текстом */
.card, .card-content, .box {
    background: var(--surface, #FFFFFF);
    color: var(--text, inherit);
}

.card .title, .card-content .title, .box .title,
.card h1, .card h2, .card h3, .card h4,
.box h1, .box h2, .box h3, .box h4 {
    color: var(--heading, inherit);
}

/* Тёмные секции: светлый текст */
.has-background-dark,
.section-dark,
.footer.has-background-dark {
    color: var(--on-dark, #F9FAFB);
}

.has-background-dark .title,
.has-background-dark h1,
.has-background-dark h2,
.has-background-dark h3,
.section-dark .title,
.footer .title {
    color: var(--on-dark, #FFFFFF) !important;
}

/* Primary секции: белый текст */
.hero.is-primary .title,
.hero.is-primary .subtitle,
.has-background-primary .title {
    color: var(--on-primary, #FFFFFF) !important;
}
EOF
    echo "  Added normalization rules using CSS variables"
else
    echo "  No CSS variables found, skipping (manual review needed)"
fi

echo "Done. Backup saved as: $CSS_FILE.backup"
