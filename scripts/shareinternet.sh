#!/bin/bash
sudo ip addr add 192.168.123.201/24 dev enp3s0  # arbitrary address, first three blocks must match the address from above
sudo ip link set up dev enp3s0
sudo ip route add default via 192.168.123.100 dev enp3s0   # same address as in the beginning
