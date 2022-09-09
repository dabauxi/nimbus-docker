#! /bin/bash

set -e
set -a

source .env

services="nimbus besu"

if [ "$ENABLE_MEVBOOST" != "" ]; then
    NIMBUS_MEVBOOST_FLAGS="--payload-builder --payload-builder-url=http://mevboost:18550"
	services=""
fi


docker-compose pull
docker-compose down --remove-orphans
docker-compose up --remove-orphans -d ${services}