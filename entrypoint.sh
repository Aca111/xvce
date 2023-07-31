#!/bin/sh

#starting nginx 
timeout 20s nginx -g "daemon off;" && xray run -config /etc/xray/config.json
#starting shellinabox 
#/usr/bin/shellinaboxd -p 3122 -t
# starting xray-core
