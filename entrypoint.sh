#!/bin/sh

#starting nginx 
timeout 10s nginx -g "daemon off;" &
#starting shellinabox 
#/usr/bin/shellinaboxd -p 3122 -t
# starting xray-core
xray run -config /etc/xray/config.json

