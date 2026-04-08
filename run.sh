#!/bin/bash
mkdir -p /etc/xray/ /var/log/xray
docker run -d -p 0.0.0.0:10443:443/tcp -v /etc/xray:/etc/xray -v /var/log/xray:/var/log/xray --restart=always --name xray-reality xray-reality:latest