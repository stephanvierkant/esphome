#!/usr/bin/env bash
set -e

if [ -z "$1" ]; then
  echo "Gebruik: $0 <bestand.yaml> [extra esphome-argumenten]"
  exit 1
fi

YAML="$1"
shift

if [ -e /dev/ttyACM0 ]; then
  DEVICE=/dev/ttyACM0
elif [ -e /dev/ttyUSB0 ]; then
  DEVICE=/dev/ttyUSB0
else
  DEVICE=""
fi

if [ -n "$DEVICE" ]; then
  echo "-> Gebruik USB device: $DEVICE"
  docker run --rm -v "${PWD}":/config --device="$DEVICE" -it ghcr.io/esphome/esphome \
    run "$YAML" --device="$DEVICE" "$@"
else
  echo "-> Geen USB device gevonden, gebruik OTA"
  docker run --rm -v "${PWD}":/config -it ghcr.io/esphome/esphome \
    run "$YAML" "$@"
fi
