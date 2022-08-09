#!/bin/bash
#
# Starts a local nethermind node.


DEFAULT_NETWORK=mainnet

if [ "$NETWORK" != "" ]; then
    DEFAULT_NETWORK=$NETWORK
fi

exec ./Nethermind.Runner \
    --config "$DEFAULT_NETWORK" \
    --Sync.SnapSync true \
    --JsonRpc.Enabled true \
    --JsonRpc.EnabledModules "Admin,Web3,Eth,Subscribe,Net" \
    --JsonRpc.Host 0.0.0.0 \
    --JsonRpc.Port 8545 \
    --JsonRpc.JwtSecretFile="/secrets/jwtsecret" \
    --JsonRpc.AdditionalRpcUrls=["http://0.0.0.0:8551|http;ws|net;eth;subscribe;engine;web3;client"] \
    --Init.WebSocketsEnabled true \
    --datadir data \
    --Pruning.Mode "Full" \
    --Pruning.FullPruningMaxDegreeOfParallelism "2" \
    --Sync.AncientBodiesBarrier "11052984" \
    --Sync.AncientReceiptsBarrier "11052984" \
    --Sync.DownloadBodiesInFastSync true \
    --Sync.DownloadReceiptsInFastSync true \
    --HealthChecks.Enabled true

