#! /bin/bash

docker-compose pull nethermind
# stop and remove containers
docker-compose stop nethermind && yes | docker-compose rm -v geth
docker-compose up -d nethermind
