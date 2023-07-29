#!/bin/sh

#starting nginx 
timeout 14s nginx -g "daemon off;"

# starting xray-core
sleep 15s && xray run -config /etc/xray/config.json
#netstat to see if xray is running on port 80
sleep 16s && netstat -tuplen


#/usr/sbin/sshd
#/usr/bin/shellinaboxd -t

