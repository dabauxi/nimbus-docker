#!/bin/bash

set +H

if [ ! -f /secrets/jwtsecret ]; then
  echo "Please create a jwtsecret file in the secrets folder. Exiting."
  exit 1
fi

if [ "$IMPORT_LAUNCHPAD_KEYSTORES" != "" ]; then
  echo "${KEYSTORE_PWD}" | ./build/nimbus_beacon_node deposits import --data-dir=/var/lib/nimbus /var/lib/nimbus/validator_keys
fi

if [ "$ENABLE_METRICS" != "" ]; then
  METRICS_PARAMS="--metrics --metrics-address=0.0.0.0 --metrics-port=8008"
fi

if [ "$ENABLE_RPC" != "" ]; then
  RPC_PARAMS="--rpc --rpc-address=0.0.0.0 --rpc-port=9190"
fi

if [ "$SUBSCRIBE_ALL_SUBNETS" != "" ]; then
  SUBSCRIBE_ALL_SUBNETS_PARAM="--subscribe-all-subnets"
fi

if [ "$GRAFFITI" != "" ]; then
  GRAFFITI_PARAM="--graffiti=${GRAFFITI}"
fi

if [ "$SUGGESTED_FEE_RECIPIENT" == "" ]; then
  echo "No fee recipient address set. Make sure to provide a valid address by setting SUGGESTED_FEE_RECIPIENT environment variable."
  exit 1
else
  FEE_RECIPIENT_PARAM=--suggested-fee-recipient=${SUGGESTED_FEE_RECIPIENT}
fi

if [ "$TRUSTED_NODE_SYNC_URL" != "" ]; then
  TRUSTED_NODE_SYNC_PARAMS="--trusted-node-url=${TRUSTED_NODE_SYNC_URL} --backfill=false"

  ~/nimbus-eth2/build/nimbus_beacon_node trustedNodeSync \
  --network=$NETWORK \
  --data-dir=/var/lib/nimbus \
  $TRUSTED_NODE_SYNC_PARAMS
fi

if [ "$STATIC_PUBLIC_IP" != "" ]; then
  STATIC_PULIC_IP_PARAM="--nat:extip:${STATIC_PUBLIC_IP}"
fi


exec ~/nimbus-eth2/build/nimbus_beacon_node \
  --network=$NETWORK \
  --tcp-port=9000 \
  --udp-port=9000 \
  --web3-url=$EXECUTION_NODE \
  --enr-auto-update=true \
  --data-dir="/var/lib/nimbus" \
  --jwt-secret="/secrets/jwtsecret" \
  --status-bar=false \
  --non-interactive \
  --doppelganger-detection=false \
  --metrics \
  --metrics-address=0.0.0.0 \
  --metrics-port=8008 \
  $FEE_RECIPIENT_PARAM \
  $METRICS_PARAMS \
  $RPC_PARAMS \
  $SUBSCRIBE_ALL_SUBNETS_PARAM \
  $GRAFFITI_PARAM \
  $STATIC_PULIC_IP_PARAM