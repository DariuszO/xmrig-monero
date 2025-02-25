#!/bin/bash
version="6.12.2"
image="xmrig"
docker build . --tag docker.io/cniweb/$image:$version
docker tag docker.io/cniweb/$image:$version ghcr.io/cniweb/$image:$version
docker tag docker.io/cniweb/$image:$version ghcr.io/cniweb/$image:latest
docker tag docker.io/cniweb/$image:$version docker.io/cniweb/$image:latest
docker push ghcr.io/cniweb/$image:$version
docker push ghcr.io/cniweb/$image:latest
docker push docker.io/cniweb/$image:$version
docker push docker.io/cniweb/$image:latest