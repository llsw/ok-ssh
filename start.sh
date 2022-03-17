#!/bin/bash
wstunnel -s 0.0.0.0:8989 &
/usr/sbin/sshd -D
/usr/sbin/nginx