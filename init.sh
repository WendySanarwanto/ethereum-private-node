#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Run command followed with name of Genesis Block's JSON file name (e.g. ./init.sh MyEthNode.json)"
else
  NETWORK_NAME=$(echo $BASH_ARGV | cut -d'.' -f 1);
  echo $NETWORK_NAME;
  trap ctrl_c INT;
  function ctrl_c() {
    geth init --datadir . $BASH_ARGV;
  };
  puppeth --network $NETWORK_NAME;
fi

