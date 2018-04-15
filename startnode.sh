#!/bin/bash

# Replace the NETWOKDID with network id that you've entered previously.
export NETWORKID=6677;

# Define number of CPU Cores/Threads you'd like to allocate as miners
export MINERTHREADS=2;
export RPCPORT="8545";

geth --networkid $NETWORKID \
--mine \
--minerthreads $MINERTHREADS \
--datadir "." \
--nodiscover \
--rpc \
--rpcport $RPCPORT \
--nat "any" \
--rpcapi eth,web3,personal,net \
--unlock 0 \
--password ./password.sec \
--ipcpath "~/.ethereum/geth.ipc"

