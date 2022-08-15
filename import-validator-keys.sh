#! /bin/bash

source .env

data_dir_path=$(readlink -f ${NIMBUS_DATA})

docker run -i --rm \
    -v ${data_dir_path}:/home/user/nimbus-eth2/build/data -v ${PWD}/validator_keys:/var/lib/nimbus/validator_keys:ro -u $(id -u):$(id -g) \
    statusim/nimbus-eth2:amd64-${NIMBUS_VERSION} deposits import --data-dir=/home/user/nimbus-eth2/build/data /var/lib/nimbus/validator_keys