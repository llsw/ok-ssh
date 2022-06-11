#!/bin/bash
SCRIPT=dev
docker stop oksh
docker rm oksh
docker run -d -p 7022:22 --name oksh --restart=always -e SCRIPT=$SCRIPT registry.cn-shenzhen.aliyuncs.com/ainterface/oksh:latest
docker logs -f oksh