#!/bin/bash
docker build . --tag truesqn/xmrig:6.15.2
docker tag truesqn/xmrig:6.15.2 truesqn/xmrig:latest
docker push truesqn/xmrig:6.15.2
docker push truesqn/xmrig:latest
