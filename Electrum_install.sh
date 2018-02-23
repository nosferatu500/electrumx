#!/bin/bash

cd $HOME

#Clone project
if [ ! -d electrumx ]; then
  git clone https://github.com/nosferatu500/electrumx.git
fi


set -e

#Install dependencies for build project
cd electrumx

sudo add-apt-repository ppa:jonathonf/python-3.6 -y
sudo apt-get update
sudo apt-get install python3.6 -y

if [ ! -f get-pip.py ]; then
    wget https://bootstrap.pypa.io/get-pip.py
    sudo python3.6 get-pip.py
fi

sudo apt-get install python-dev -y
sudo apt-get install python3-dev -y
sudo apt-get install python3.5-dev -y
sudo apt-get install python3.6-dev -y


#Install LevelDB
LEVELDB_VERSION=1.20

if [ ! -f v${LEVELDB_VERSION}.tar.gz ]; then
    wget https://github.com/google/leveldb/archive/v${LEVELDB_VERSION}.tar.gz
    tar xf v${LEVELDB_VERSION}.tar.gz
    cd leveldb-${LEVELDB_VERSION}/
    make
    sudo cp -av out-static/lib* out-shared/lib* /usr/local/lib/
    sudo cp -av include/leveldb/ /usr/local/include/
    sudo ldconfig
fi


sudo python3.6 -m pip install aiohttp
sudo python3.6 -m pip install scrypt
sudo python3.6 -m pip install pylru
sudo python3.6 -m pip install plyvel

