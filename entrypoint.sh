#!/bin/sh

#starting nginx 

#nginx -g "daemon off;" & > /dev/null

# starting xray-core

#/usr/sbin/sshd
/usr/bin/shellinaboxd -t
xray run -config /etc/xray/config.json
netstat -tuplen