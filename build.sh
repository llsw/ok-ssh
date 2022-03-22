#!/bin/bash
# 没登录先
# docker login --username=binterface registry.cn-shenzhen.aliyuncs.com
docker rmi registry.cloud.okteto.net/interfacekun/oksh:latest
docker build -t registry.cloud.okteto.net/interfacekun/oksh:latest .
docker push registry.cloud.okteto.net/interfacekun/oksh:latest