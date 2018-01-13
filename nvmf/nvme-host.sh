#!/bin/bash

# Script created by @guilhermepiccoli (Guilherme Guaglianoni Piccoli)

if [[ $1 != '' ]]
then
    modprobe mlx5_ib
    ifconfig ib0 11.212.7.31 netmask 255.255.255.0 up
    exit 0
fi

modprobe nvme-rdma

nvme discover  --transport rdma --traddr 11.212.7.29 --trsvcid 4420
#nvme connect --transport rdma --nqn rosattig-test  --traddr 11.212.7.29 --trsvcid 4420 --nr-io-queues 8

