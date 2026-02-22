#!/bin/bash

# Исправление контраста через LLM агента
# Агент анализирует CSS, находит проблемы и исправляет
# Использование: ./scripts/fix-contrast.sh path/to/project/

set -e

PROJECT_DIR="$1"

if [ -z "$PROJECT_DIR" ] || [ ! -d "$PROJECT_DIR" ]; then
    echo "Usage: $0 path/to/project/"
    exit 1
fi

CSS_FILE="$PROJECT_DIR/assets/css/style.css"
HTML_FILE="$PROJECT_DIR/index.html"

if [ ! -f "$CSS_FILE" ]; then
    echo "Error: $CSS_FILE not found"
    exit 1
fi

echo "Analyzing contrast in: $PROJECT_DIR"

# Backup
cp "$CSS_FILE" "$CSS_FILE.backup"

claude --dangerously-skip-permissions -p "
Проанализируй CSS файл и исправь проблемы с контрастом.

CSS файл: $CSS_FILE
HTML файл: $HTML_FILE (для контекста)

ЗАДАЧА:
1. Прочитай CSS и HTML файлы
2. Найди все пары: background-color + color (текст)
3. Определи где контраст недостаточный:
   - Светлый текст на светлом фоне
   - Тёмный текст на тёмном фоне
   - Цветной текст который плохо читается
4. Исправь проблемные места:
   - Заголовки на светлом фоне → тёмный нейтральный цвет
   - Текст на тёмном фоне → светлый цвет
   - Сохраняй цветовую схему, меняй только проблемные цвета

ПРАВИЛА:
- Заголовки (h1-h6, .title) должны быть максимально контрастными
- Карточки (.card, .box) обычно белые — текст в них тёмный
- Цветной текст для заголовков — плохо, заменяй на нейтральный
- Используй CSS переменные если они есть в файле

ВЫВОД:
Перезапиши $CSS_FILE с исправлениями.
Кратко опиши что исправил.
"

echo ""
echo "Done. Backup: $CSS_FILE.backup"
