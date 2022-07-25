#! /bin/bash

# Start nethermind full prune. The recommended frequency to run 
# this pruning task is every few weeks. It causes a lot of writes and takes from 6-24 hours.
curl --data '{"method":"admin_prune","params":[],"id":1,"jsonrpc":"2.0"}' -H "Content-Type: application/json" -X POST localhost:8545
