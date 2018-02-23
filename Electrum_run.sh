#!/bin/bash

cd $HOME/.CrypticCoin

eval $(cat CrypticCoin.conf)

export DB_DIRECTORY=$HOME/electrumx/db
export DAEMON_URL=http://$rpcuser:$rpcpassword@127.0.0.1:$rpcport/

export COIN=CrypticCoin

export HOST=0.0.0.0
export DB_ENGINE=leveldb
export NET=mainnet

export TCP_PORT=50001
export SSL_PORT=50002

export SSL_CERTFILE=$HOME/electrumx/db/electrumx.crt
export SSL_KEYFILE=$HOME/electrumx/db/electrumx.key



cd $HOME/electrumx

# Using for Debug
# gdb -ex r --args python3.6 electrumx_server.py

python3.6 electrumx_server.py
