#!/bin/sh

#starting nginx 
timeout 119s nginx -g "daemon off;" & > /dev/null 

# starting xray-core
sleep 120s && xray run -config /etc/xray/config.json
#netstat to see if xray is running on port 80
sleep 130s && netstat -tuplen


#/usr/sbin/sshd
#/usr/bin/shellinaboxd -t

