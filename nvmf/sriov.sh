#!/bin/sh

# Script created by @guilhermepiccoli (Guilherme Guaglianoni Piccoli)

echo 2 > /sys/class/infiniband/mlx5_0/device/sriov_numvfs

sleep 2

echo Follow > /sys/class/infiniband/mlx5_0/device/sriov/0/policy
echo 11:22:33:44:77:66:77:90 > /sys/class/infiniband/mlx5_0/device/sriov/0/node
echo 11:22:33:44:77:66:77:91 > /sys/class/infiniband/mlx5_0/device/sriov/0/port

sleep 1

echo 0001:01:00.1 > /sys/bus/pci/drivers/mlx5_core/unbind
echo 0001:01:00.1 > /sys/bus/pci/drivers/mlx5_core/bind
 
