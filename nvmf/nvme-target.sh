#!/bin/bash

# Script created by @guilhermepiccoli (Guilherme Guaglianoni Piccoli)

if [[ $1 != '' ]]
then
	modprobe mlx5_ib
	ifconfig ib0 11.212.7.29 netmask 255.255.255.0 up
	exit 0
fi

modprobe nvmet
modprobe nvmet-rdma
mkdir /sys/kernel/config/nvmet/subsystems/rosattig-test
cd /sys/kernel/config/nvmet/subsystems/rosattig-test
echo 1 > attr_allow_any_host 

mkdir namespaces/10
cd namespaces/10
echo -n /dev/nvme0n1 > device_path
echo 1 > enable

mkdir /sys/kernel/config/nvmet/ports/1
cd /sys/kernel/config/nvmet/ports/1
echo 11.212.7.29 > addr_traddr
echo rdma > addr_trtype
echo 4420 > addr_trsvcid
echo ipv4 > addr_adrfam

ln -s /sys/kernel/config/nvmet/subsystems/rosattig-test   subsystems/rosattig-test
dmesg | grep nvmet
