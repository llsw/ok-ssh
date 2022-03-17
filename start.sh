#!/bin/bash
wstunnel -s 0.0.0.0:8989 &
/usr/sbin/nginx -t
/usr/sbin/nginx
lsof -i:80
/usr/sbin/sshd
tail -f /dev/null