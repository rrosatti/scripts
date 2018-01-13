#!/bin/bash

unlink /sys/kernel/config/nvmet/ports/1/subsystems/rosattig-test 
rmdir /sys/kernel/config/nvmet/ports/1/
rmdir /sys/kernel/config/nvmet/subsystems/rosattig-test/namespaces/10
rmdir /sys/kernel/config/nvmet/subsystems/rosattig-test/

modprobe -r nvmet-rdma nvmet

lsmod | grep nvme
