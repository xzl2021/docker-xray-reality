#!/bin/sh
if [ ! -f "/etc/xray/config.json" ]; then
    cp /config.json /etc/xray/config.json
    echo -e "Please modify the config.json file!!!"
    exit
fi
/usr/local/bin/xray -config /etc/xray/config.json