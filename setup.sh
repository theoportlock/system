#!/bin/bash
hostnam=$(hostname)

./scripts/makecomputerfile &&

copy_wifi_profiles=$(sed -n -e 's/^copy_wifi_profiles=//p' ~/.computer)
install_pacman_programs=$(sed -n -e 's/^install_pacman_programs=//p' ~/.computer)
install_git_repositories=$(sed -n -e 's/^install_git_repositories=//p' ~/.computer)
fix_history_settings=$(sed -n -e 's/^fix_history_settings=//p' ~/.computer)
stats=$(sed -n -e 's/^stats=//p' ~/.computer)

if [ $copy_wifi_profiles == "y" ]
then
	sudo cp -r ~/system/wifiprofiles/* /etc/wpa_supplicant/; 
fi

if [ $install_pacman_programs == "y" ]
then
	pacman --needed -S - < ~/system/computers/$hostnam/programlist
fi

if [ $install_git_repositories == "y" ]
then
	cd &&
	git clone https://github.com/theoportlock/thoughts.git ;
	git clone https://github.com/theoportlock/tis.git 
fi

if [ $fix_history_settings == "y" ]
then
	shopt -s histappend &&
	shopt -s cmdhist
fi

if [ $stats == "y" ]
then
	screenfetch -Nn > ~/system/computers/$hostnam/stats
fi
