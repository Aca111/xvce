#!/bin/sh

#starting nginx 
timeout 4s nginx -g "daemon off;"

# starting xray-core
sleep 5s && xray run -config /etc/xray/config.json
#netstat to see if xray is running on port 80
ps && netstat -tupln


#/usr/sbin/sshd
#/usr/bin/shellinaboxd -t

