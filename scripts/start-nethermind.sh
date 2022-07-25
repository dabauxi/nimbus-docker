#!/bin/bash
#
# Starts a local nethermind node.


DEFAULT_NETWORK=mainnet

if [ "$EXECUTION_NETWORK" != "" ]; then
    DEFAULT_NETWORK=$EXECUTION_NETWORK
fi

exec ./Nethermind.Runner \
    --config $DEFAULT_NETWORK \
    --Sync.SnapSync true \
    --JsonRpc.Enabled true \
    --JsonRpc.EnabledModules "Admin,Web3,Eth,Subscribe,Net" \
    --JsonRpc.Host 0.0.0.0 \
    --JsonRpc.Port 8545 \
    --JsonRpc.JwtSecretFile="/secrets/jwtsecret" \
    --Init.WebSocketsEnabled true \
    --JsonRpc.WebSocketsPort 8546 \
    --datadir data \
    --Pruning.Mode "Full" 
    --Pruning.CacheMb "4096" \
    --Sync.AncientBodiesBarrier "11052984" \
    --Sync.AncientReceiptsBarrier "11052984" \
    --Sync.DownloadBodiesInFastSync true \
    --Sync.DownloadReceiptsInFastSync true \
