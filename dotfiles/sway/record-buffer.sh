#!/bin/sh

OUTPUT_DIR="$HOME/videos"
mkdir -p "$OUTPUT_DIR"

TEMP_FILE="/tmp/screen_record.mkv"  # MKV лучше подходит для сырой записи
MAX_DURATION=300  # 5 минут в секундах

save_last_5min() {
    if [ ! -f "$TEMP_FILE" ]; then
        fyi "Screen Recording" "Ошибка: Нет записанного видео!"
        exit 1
    fi

    # Просто копируем последние 5 минут без точной обрезки
    OUTPUT_FILE="$OUTPUT_DIR/screen_$(date +%Y%m%d_%H%M%S).mkv"
    cp "$TEMP_FILE" "$OUTPUT_FILE" && \
        fyi "Screen Recording" "Сохранено в $OUTPUT_FILE" || \
        fyi "Screen Recording" "Ошибка копирования!"
}

case "$1" in
    "save")
        save_last_5min
        ;;
    "stop")
        pkill -INT wf-recorder  # Остановка записи
        fyi "Screen Recording" "Запись остановлена"
        ;;
    *)
        if pgrep wf-recorder >/dev/null; then
            fyi "Screen Recording" "Запись уже идет!"
            exit 1
        fi
        rm -f "$TEMP_FILE"  # Удаляем старый файл
        fyi "Screen Recording" "Recording started"
        wf-recorder -f "$TEMP_FILE" --audio -c libx264 --muxer=matroska
        ;;
esac
