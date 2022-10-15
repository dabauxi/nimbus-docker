#! /bin/bash

source .env

data_dir_path=$(readlink -f ${CONSENSUS_DATA})

docker run -i --rm \
    -v ${data_dir_path}:/home/user/nimbus-eth2/build/data -u $(id -u):$(id -g) \
    statusim/nimbus-eth2:amd64-${NIMBUS_VERSION} trustedNodeSync --network=${NETWORK} --data-dir=/home/user/nimbus-eth2/build/data --trusted-node-url=${TRUSTED_NODE_SYNC_URL} --backfill=false
