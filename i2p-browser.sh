#!/bin/bash
# Запускаем I2P в фоне
/opt/i2p-browser/i2p/i2prouter start &

# Ждём 10 секунд
sleep 10

# Запускаем Firefox с I2P-прокси
/opt/i2p-browser/firefox/firefox \
    --no-remote \
    --profile /tmp/i2p-browser-profile \
    --proxy-server="socks://127.0.0.1:4447" \
    "http://i2p-projekt.i2p"