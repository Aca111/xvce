#!/bin/sh

#starting shellinabox 
/usr/bin/shellinaboxd -p 3122 -t
#starting nginx 
nginx -g "daemon off;"
# starting xray-core
#xray run -config /etc/xray/config.json

