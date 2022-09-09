#! /bin/bash
# Update docker services.
# Either update all services or the services you name.
# e.g. ./update.sh nimbus besu
set -e
set -a

source .env

services=$@

if [[ -z "${ENABLE_MEVBOOST}" ]]; then
    services="nimbus besu"
else
    services="nimbus besu mevboost"
fi
echo $services

docker-compose pull
docker-compose stop $services && yes | docker-compose rm -v $services
docker-compose up --remove-orphans -d $services
