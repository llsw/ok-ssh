#!/bin/bash
SCRIPT=dev
docker stop oksh
docker rm oksh
docker run -d -p 8022:22 --name oksh --restart=always -e SCRIPT=$SCRIPT registry.cloud.okteto.net/interfacekun/oksh:latest
docker logs -f oksh