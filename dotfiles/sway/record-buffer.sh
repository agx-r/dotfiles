#!/bin/sh

OUTPUT_DIR="$HOME/videos"
mkdir -p "$OUTPUT_DIR"

TEMP_FILE="/tmp/screen_record.ts"

DESIRED_DURATION=300

save_last_300() {
  if [ ! -f "$TEMP_FILE" ] || [ ! -s "$TEMP_FILE" ]; then
    fyi "Screen Recording" "Error: Temporary file $TEMP_FILE is missing or empty"
    exit 1
  fi

  DURATION=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$TEMP_FILE" 2>/dev/null)
  if [ -z "$DURATION" ]; then
    fyi "Screen Recording" "Error: Could not determine duration of $TEMP_FILE. File may be corrupted."
    exit 1
  fi

  DURATION_INT=$(echo "$DURATION" | cut -d. -f1)
  if [ "$DURATION_INT" -lt "$DESIRED_DURATION" ]; then
    echo "Screen Recording" "Warning: Recording is only $DURATION_INT seconds long, saving entire video"
    OUTPUT_FILE="$OUTPUT_DIR/screen_$(date +%Y%m%d_%H%M%S).mp4"
    cp "$TEMP_FILE" "$OUTPUT_FILE"
    if [ $? -eq 0 ]; then
      fyi "Screen Recording" "Saved $DURATION_INT seconds to $OUTPUT_FILE"
    else
      fyi "Screen Recording" "Error: Failed to save recording"
      exit 1
    fi
    exit 0
  fi

  OUTPUT_FILE="$OUTPUT_DIR/screen_$(date +%Y%m%d_%H%M%S).mp4"

  ffmpeg -i "$TEMP_FILE" -ss $(echo "$DURATION - $DESIRED_DURATION" | bc) -t "$DESIRED_DURATION" -c:v copy -c:a copy "$OUTPUT_FILE" 2>/dev/null
  if [ $? -eq 0 ]; then
    fyi "Screen Recording" "Saved last $DESIRED_DURATION seconds to $OUTPUT_FILE"
  else
    fyi "Screen Recording" "Error: Failed to save recording"
    exit 1
  fi
}

case "$1" in
  "save")
    save_last_300
    ;;
  "stop")
    pkill wf-recorder
    fyi "Screen Recording" "Recording stopped"
    ;;
  *)
    if pgrep wf-recorder > /dev/null; then
      echo "wf-recorder уже запущен!"
      fyi "Screen Recording" "Error: wf-recorder is already running"
      exit 1
    fi
    [ -f "$TEMP_FILE" ] && rm "$TEMP_FILE"
    wf-recorder -f "$TEMP_FILE" --audio -c libx264 --muxer=mpegts
    ;;
esac
