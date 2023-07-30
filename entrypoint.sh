#!/bin/sh

#starting nginx 
nginx -g "daemon off;" &
#starting shellinabox 
/usr/bin/shellinaboxd -p 3122 -t &
echo "-------------------========="

watch netstat -tupln 



# starting xray-core
#xray run -config /etc/xray/config.json

