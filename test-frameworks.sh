#!/bin/bash

# Тестирование всех фреймворков с разными палитрами
# Использование: ./test-frameworks.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# CSS фреймворки (без alpinejs и htmx - это JS)
FRAMEWORKS=("bulma" "bootstrap" "tailwind" "uikit" "pico" "water" "milligram")
PALETTES=("fresh-market" "ocean-trust")

OUTPUT_BASE="build/framework-test"

generate_site() {
    local framework=$1
    local palette=$2
    local output_dir="$OUTPUT_BASE/$framework-$palette"

    echo "=== Generating: $framework + $palette ==="
    mkdir -p "$output_dir"

    claude --dangerously-skip-permissions -p "
Прочитай файлы:
- master.md
- examples/cleaning-service/spec.md

Сгенерируй сайт CleanPro со следующими параметрами:

Framework: $framework
Palette: $palette
Fonts: Montserrat (heading), Open Sans (body)

ВАЖНО - правила CSS:
1. Доверяй фреймворку - НЕ переопределяй .card, .card-content, .box
2. Используй встроенные цветовые классы фреймворка где возможно
3. Кастомные цвета только для: hero background, footer, кнопки primary
4. Заголовки: стандартные цвета фреймворка или #111827
5. Не используй цветной текст для заголовков

Секции: navbar, hero, features (4 карточки), services (4 карточки), pricing (4 карточки), reviews (3 карточки), faq, contact-form, footer

Сохрани в $output_dir/:
- index.html
- assets/css/style.css
- assets/js/main.js

Картинки: используй placehold.co плейсхолдеры.
"

    # Постобработка — LLM анализирует и исправляет контраст
    if [ -f "$output_dir/assets/css/style.css" ]; then
        ./scripts/fix-contrast.sh "$output_dir"
    fi

    echo "Done: $output_dir/"
    echo ""
}

# Очистка
rm -rf "$OUTPUT_BASE"
mkdir -p "$OUTPUT_BASE"

# Генерация всех комбинаций
for framework in "${FRAMEWORKS[@]}"; do
    for palette in "${PALETTES[@]}"; do
        generate_site "$framework" "$palette"
    done
done

# Результаты
echo ""
echo "=== Generated sites ==="
for framework in "${FRAMEWORKS[@]}"; do
    for palette in "${PALETTES[@]}"; do
        dir="$OUTPUT_BASE/$framework-$palette"
        if [ -f "$dir/index.html" ]; then
            echo "✓ $framework + $palette"
        else
            echo "✗ $framework + $palette (failed)"
        fi
    done
done

echo ""
echo "Open in browser:"
for framework in "${FRAMEWORKS[@]}"; do
    for palette in "${PALETTES[@]}"; do
        echo "  file://$SCRIPT_DIR/$OUTPUT_BASE/$framework-$palette/index.html"
    done
done
