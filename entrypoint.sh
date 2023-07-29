#!/bin/sh

#starting nginx 
nginx -g "daemon off;"
netstat -tupln

# starting xray-core
#sleep 5s && xray run -config /etc/xray/config.json
#timeout 10s watch netstat -tupln

#netstat to see if xray is running on port 80

#/usr/sbin/sshd
#/usr/bin/shellinaboxd -t

