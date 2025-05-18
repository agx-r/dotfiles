#!/bin/sh

PASSWORD_CACHE="/dev/shm/mqtt-password"

ENCRYPTED_FILE="$HOME/.encrypted/mqtt-password.gpg"

if [ ! -f "$PASSWORD_CACHE" ]; then
  echo "decrypting..."
  gpg --quiet --decrypt "$ENCRYPTED_FILE" > "$PASSWORD_CACHE" || {
    echo "failed"
    exit 1
  }
  chmod 600 "$PASSWORD_CACHE"
fi

MQTT_PASSWORD=$(cat "$PASSWORD_CACHE")

mosquitto_pub -h 192.168.1.191 \
              -t "homeassistant/script/run" \
              -m "acbedroomoff" \
              -u mqtt \
              -P "$MQTT_PASSWORD"
