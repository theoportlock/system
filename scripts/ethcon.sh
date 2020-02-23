#!/bin/bash
sudo ip link set eth0 up
sudo ip addr add 192.168.123.201/24 dev eth0  # arbitrary address, first three blocks must match the address from above
sudo ip link set up dev eth0
sudo ip route add 192.168.1.1 dev eth0
