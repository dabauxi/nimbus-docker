#! /bin/bash
# Update docker services.
# Either update all services or the services you name.
# e.g. ./update.sh nimbus nethermind

if [ "$#" -eq 0 ]; then
    services="nimbus nethermind"
fi

services=$@

docker-compose pull
docker-compose stop $services && yes | docker-compose rm -v $services
docker-compose up -d $@
