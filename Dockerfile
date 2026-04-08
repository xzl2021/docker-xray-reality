# Dockerfile for xray with reality based on alpine.
# Copyright (C) 2019 - 2026 xzl2021 <xzl2021#hotmail.com>
# Reference URL:
# https://github.com/XTLS/Xray-core
# https://github.com/Loyalsoldier/v2ray-rules-dat

FROM alpine:3.23.2
LABEL maintainer="xzl2021 <xzl2021#hotmail.com>"

WORKDIR /
RUN set -ex \
	&& apk add --no-cache unzip tzdata ca-certificates openssl \
	&& mkdir -p /var/log/xray/ /usr/share/xray/ /etc/xray/ \
	&& wget -O /tmp/Xray-linux-64.zip https://github.com/XTLS/Xray-core/releases/download/v26.2.6/Xray-linux-64.zip \
	&& wget -O /etc/xray/config.json https://raw.githubusercontent.com/xzl2021/docker-xray-reality/main/config.json \
	# && wget -O /usr/share/xray/geosite.dat https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/geosite.dat \
	# && wget -O /usr/share/xray/geoip.dat https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/geoip.dat \
	&& unzip /tmp/Xray-linux-64.zip -d /tmp/ \
	&& cp /tmp/xray /usr/local/bin/xray \
	&& cp /tmp/geosite.dat /usr/share/xray/geosite.dat \
	&& cp /tmp/geoip.dat /usr/share/xray/geoip.dat \
	&& chmod +x /usr/local/bin/xray \
	&& rm -rf /tmp/*

VOLUME /etc/xray
VOLUME /var/log/xray

ENV TZ=Asia/Shanghai
CMD [ "/usr/local/bin/xray", "-config", "/etc/xray/config.json" ]