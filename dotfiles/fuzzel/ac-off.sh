#!/bin/sh

ENCRYPTED_FILE="$HOME/.encrypted/mqtt-password.gpg"

MQTT_PASSWORD=$(gpg --quiet --decrypt "$ENCRYPTED_FILE") || {
  echo "failed to decrypt"
  exit 1
}

mosquitto_pub -h 192.168.1.191 \
              -t "homeassistant/script/run" \
              -m "acbedroomoff" \
              -u mqtt \
              -P "$MQTT_PASSWORD"
