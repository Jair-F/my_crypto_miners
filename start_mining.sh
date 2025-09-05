#!/bin/bash

function start_xmring() {
    xmrig/xmrig --config=xmrig_config/config_gulf_moneroocean_no_Nvidia.json
}

function start_gminer() {
    gminer/miner --algo kawpow --server asia-rvn.2miners.com:6060 --user RMEBu11tvvdpgA2Avb8CQDEypqb2nLKMnT.DOCKER_MINER
}

start_xmring &
start_gminer &
echo "miners started"

sleep infinity