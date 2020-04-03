#!/bin/bash
sudo ip addr flush dev enp3s0
sudo ip addr add 192.168.5.5/24 dev enp3s0
sudo ip link set dev enp3s0 down
sudo ip link set dev enp3s0 up
sudo ip route add default via 192.168.5.6 dev enp3s0
