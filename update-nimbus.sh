#! /bin/bash

docker-compose pull nimbus
# stop and remove containers
docker-compose stop nimbus && yes | docker-compose rm -v nimbus
docker-compose up -d nimbus
