#!/bin/bash
hostnam=$(hostname)
if [[ ! -e ~/system/computers/$hostnam ]]; then
	mkdir ~/system/computers/$hostnam
	screenfetch -Nn > ~/system/computers/$hostnam/stats
	echo "name=$hostnam" > ~.computer
fi
