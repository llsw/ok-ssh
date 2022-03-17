#!/bin/bash
# 没登录先
# docker login --username=binterface registry.cn-shenzhen.aliyuncs.com
docker rmi registry.cn-shenzhen.aliyuncs.com/ainterface/ok-ssh:latest
docker build -t registry.cn-shenzhen.aliyuncs.com/ainterface/ok-ssh:latest .
docker push registry.cn-shenzhen.aliyuncs.com/ainterface/ok-ssh:latest