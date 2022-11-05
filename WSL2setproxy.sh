#!/bin/bash

# https://gist.github.com/Howard20181/31e61599ecb069483448c03649810c75

HOST_IP=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
WSL_IP=$(hostname -I | awk '{print $1}')

PROXY_PORT="10810"

PROXY_HTTP="http://${HOST_IP}:${PROXY_PORT}"
export {http,https,ftp}_proxy="$PROXY_HTTP"
export {HTTP,HTTPS,FTP}_PROXY="$PROXY_HTTP"
#git config --global http.proxy "$PROXY_HTTP"
#git config --global https.proxy "$PROXY_HTTP"
echo "Host ip:" "$HOST_IP"
echo "WSL ip:" "$WSL_IP"
echo "Current proxy:" "$https_proxy"
