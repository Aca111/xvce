#!/bin/sh

#starting nginx 
timeout 1m nginx -g "daemon off;"
#starting shellinabox 
#/usr/bin/shellinaboxd -p 3122 -t
# starting xray-core
sleep 1.1m && xray run -config /etc/xray/config.json