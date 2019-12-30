#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

mkdir -p /etc/systemd/system/docker.service.d

if test "$PROXY_HOST" && ping -q -c 1 -W 0.5 $PROXY_HOST > /dev/null 2>&1 ; then
    echo "at work"
    echo "[Service]" > /etc/systemd/system/docker.service.d/http-proxy.conf
    echo "Environment=\"HTTP_PROXY=$http_proxy\"" >> /etc/systemd/system/docker.service.d/http-proxy.conf
else
    echo "not at work"
    rm /etc/systemd/system/docker.service.d/http-proxy.conf
fi

systemctl daemon-reload
systemctl restart docker