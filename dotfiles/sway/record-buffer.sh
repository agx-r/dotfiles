#!/bin/sh

OUTPUT_DIR="$HOME/videos"
mkdir -p "$OUTPUT_DIR"

TEMP_FILE="/tmp/screen_record.mkv"  # MKV для ffv1
MAX_DURATION=300  # 5 минут в секундах

# Получение текущего разрешения экрана через swaymsg
RESOLUTION=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .current_mode | "\(.width)x\(.height)"')
if [ -z "$RESOLUTION" ]; then
    echo "Error: Screen resolution unknown"
    exit 1
fi
WIDTH=$(echo "$RESOLUTION" | cut -d'x' -f1)
HEIGHT=$(echo "$RESOLUTION" | cut -d'x' -f2)
HALF_WIDTH=$((WIDTH / 2))
HALF_HEIGHT=$((HEIGHT / 2))
GEOMETRY="${HALF_WIDTH}x${HALF_HEIGHT}"

save_last_5min() {
    if [ ! -f "$TEMP_FILE" ]; then
        fyi "Screen Recording" "Error: No video"
        exit 1
    fi

    OUTPUT_FILE="$OUTPUT_DIR/screen_$(date +%Y%m%d_%H%M%S).mkv"
    cp "$TEMP_FILE" "$OUTPUT_FILE" && \
        fyi "Screen Recording" "Saved as $OUTPUT_FILE" || \
        fyi "Screen Recording" "cp error"
}

case "$1" in
    "save")
        save_last_5min
        ;;
    "stop")
        pkill -INT wf-recorder  # Остановка записи
        fyi "Screen Recording" "Recording stopped"
        ;;
    *)
        if pgrep wf-recorder >/dev/null; then
            fyi "Screen Recording" "Already recording"
            exit 1
        fi
        rm -f "$TEMP_FILE"  # Удаляем старый файл
        fyi "Screen Recording" "Recording started"
        timeout $MAX_DURATION wf-recorder -g "$GEOMETRY" -f "$TEMP_FILE" --framerate=20 --codec ffv1 --muxer=matroska
        ;;
esac
