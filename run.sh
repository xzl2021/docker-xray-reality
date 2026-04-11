#!/bin/bash
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)
mkdir -p /etc/xray/ /var/log/xray
if [ ! -f "/etc/xray/config.json" ]; then
    cp "$SCRIPT_DIR/config.json" /etc/xray/config.json
fi
docker run -d -p 0.0.0.0:10443:443/tcp -v /etc/xray:/etc/xray -v /var/log/xray:/var/log/xray --restart=always --name xray-reality xray-reality:latest