#!/bin/bash

# Скрипт генерации тестовых сайтов с помощью Claude и Codex
# Использование: ./generate-examples.sh [claude|codex|all]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

EXAMPLES=("cleaning-service" "apartment-renovation" "food-delivery")

generate_claude() {
    local example=$1
    local output_dir="build/$example/claude"

    echo "=== Generating $example with Claude ==="
    mkdir -p "$output_dir"

    claude --dangerously-skip-permissions -p "
Прочитай файлы:
- master.md (главные инструкции)
- examples/$example/spec.md (контент сайта)
- examples/$example/design.md (дизайн)

Затем сгенерируй полный сайт и сохрани все файлы в директорию $output_dir/:

1. index.html (и другие HTML страницы если multipage)
2. assets/css/style.css
3. assets/js/main.js (если нужен JS)
4. robots.txt
5. sitemap.xml
6. Сгенерируй все картинки с помощью llm-imager в assets/images/

Используй модули из modules/ для справки по компонентам и стилям.
Не спрашивай подтверждений, просто создай файлы."

    echo "Done: $output_dir/"
}

generate_codex() {
    local example=$1
    local output_dir="build/$example/codex"

    echo "=== Generating $example with Codex ==="
    mkdir -p "$output_dir"

    codex exec --dangerously-bypass-approvals-and-sandbox "
Прочитай файлы:
- master.md (главные инструкции)
- examples/$example/spec.md (контент сайта)
- examples/$example/design.md (дизайн)

Затем сгенерируй полный сайт и сохрани все файлы в директорию $output_dir/:

1. index.html (и другие HTML страницы если multipage)
2. assets/css/style.css
3. assets/js/main.js (если нужен JS)
4. robots.txt
5. sitemap.xml
6. Сгенерируй все картинки с помощью llm-imager в assets/images/

Используй модули из modules/ для справки по компонентам и стилям.
Не спрашивай подтверждений, просто создай файлы."

    echo "Done: $output_dir/"
}

run_claude() {
    for example in "${EXAMPLES[@]}"; do
        generate_claude "$example"
    done
}

run_codex() {
    for example in "${EXAMPLES[@]}"; do
        generate_codex "$example"
    done
}

run_all() {
    for example in "${EXAMPLES[@]}"; do
        generate_claude "$example"
        generate_codex "$example"
    done
}

show_results() {
    echo ""
    echo "=== Generated structure ==="
    for example in "${EXAMPLES[@]}"; do
        echo ""
        echo "--- $example ---"
        for cli in claude codex; do
            dir="build/$example/$cli"
            if [ -d "$dir" ]; then
                echo "$cli:"
                find "$dir" -type f 2>/dev/null | sort | sed 's|^|  |'
            fi
        done
    done
}

case "${1:-all}" in
    claude)
        run_claude
        show_results
        ;;
    codex)
        run_codex
        show_results
        ;;
    all)
        run_all
        show_results
        ;;
    *)
        echo "Usage: $0 [claude|codex|all]"
        echo ""
        echo "  claude - Generate with Claude only"
        echo "  codex  - Generate with Codex only"
        echo "  all    - Generate with both (default)"
        echo ""
        echo "Each generation creates in build/<example>/<cli>/:"
        echo "  - index.html (+ other pages)"
        echo "  - assets/css/style.css"
        echo "  - assets/js/main.js"
        echo "  - assets/images/ (generated with llm-imager)"
        echo "  - robots.txt"
        echo "  - sitemap.xml"
        exit 1
        ;;
esac
