#!/bin/bash

# Нормализация цветов в сгенерированном CSS
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

# Нейтральные цвета для текста
HEADING_COLOR="#111827"
TEXT_COLOR="#374151"
TEXT_MUTED="#6B7280"
TEXT_ON_DARK="#F9FAFB"

# 1. Заголовки — всегда нейтральный цвет
# Заменяем цветные заголовки на нейтральные
sed -i -E "s/(h[1-6].*\{[^}]*color:\s*)#[0-9a-fA-F]{3,6}/\1$HEADING_COLOR/g" "$CSS_FILE"

# 2. .title — нейтральный цвет (без !important, чтобы не сломать тёмные секции)
# Если .title имеет цветной color, заменяем
sed -i -E "s/(\.title\s*\{[^}]*color:\s*)#[0-9a-fA-F]{3,6}/\1$HEADING_COLOR/g" "$CSS_FILE"

# 3. Добавляем правила для карточек если их нет
if ! grep -q "\.card-content" "$CSS_FILE"; then
    cat >> "$CSS_FILE" << 'EOF'

/* === Color Normalization (auto-added) === */
.card, .card-content, .box {
    background: #FFFFFF;
    color: #374151;
}

.card .title, .card-content .title, .box .title,
.card h1, .card h2, .card h3, .card h4,
.box h1, .box h2, .box h3, .box h4 {
    color: #111827;
}
EOF
    echo "  Added card/box normalization rules"
fi

# 4. Проверяем что на тёмных секциях текст светлый
if ! grep -q "\.has-background-dark.*\.title" "$CSS_FILE"; then
    cat >> "$CSS_FILE" << 'EOF'

/* Dark section text (auto-added) */
.has-background-dark .title,
.has-background-dark h1,
.has-background-dark h2,
.has-background-dark h3 {
    color: #FFFFFF !important;
}

.has-background-dark p,
.has-background-dark span,
.has-background-dark li {
    color: #F9FAFB;
}
EOF
    echo "  Added dark section rules"
fi

# 5. Footer текст
if ! grep -q "\.footer.*\.title" "$CSS_FILE"; then
    cat >> "$CSS_FILE" << 'EOF'

/* Footer text (auto-added) */
.footer .title {
    color: #FFFFFF !important;
}

.footer p, .footer a, .footer li {
    color: rgba(255,255,255,0.8);
}

.footer a:hover {
    color: #FFFFFF;
}
EOF
    echo "  Added footer rules"
fi

echo "Done. Backup saved as: $CSS_FILE.backup"
