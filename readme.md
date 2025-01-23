ESP8266:
    
    docker run --rm -v "${PWD}":/config --device=/dev/ttyUSB0 -it ghcr.io/esphome/esphome run doorsensor.yaml

ESP32:

    docker run --rm -v "${PWD}":/config --device=/dev/ttyACM0 -it ghcr.io/esphome/esphome run lea.yaml

Update ESPHOME:

    docker pull ghcr.io/esphome/esphome
