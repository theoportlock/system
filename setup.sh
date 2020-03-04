#!/bin/bash
hostnam=$(hostname)

# install programs and copy rc files from another computer
./scripts/makecomputerfile &&

copy_wifi_profiles=$(sed -n -e 's/^copy_wifi_profiles=//p' ~/.computer)
install_programs=$(sed -n -e 's/^install_programs=//p' ~/.computer)
install_git_repositories=$(sed -n -e 's/^install_git_repositories=//p' ~/.computer)
fix_history_settings=$(sed -n -e 's/^fix_history_settings=//p' ~/.computer)
stats=$(sed -n -e 's/^stats=//p' ~/.computer)

if [ $copy_wifi_profiles == "y" ]
then
	sudo cp -r ~/system/wifiprofiles/* /etc/wpa_supplicant/; 
fi

if [ $install_programs== "y" ]
then
	sudo apt install $(cat ~/system/computers/$hostnam/programlist)
	pacman --needed -S - < ~/system/computers/$hostnam/programlist
	sudo pip install -r ~/system/computers/$hostnam/pythonlist
fi

if [ $install_git_repositories == "y" ]
then
	cd &&
	git clone https://github.com/theoportlock/thoughts.git ;
	git clone https://github.com/theoportlock/tis.git ;
	git clone https://github.com/theoportlock/tester.git ;
	git clone https://github.com/theoportlock/proteintools.git ;
	git clone https://github.com/theoportlock/thesis.git ;
	git clone https://github.com/theoportlock/notes.git ;
	git clone https://github.com/theoportlock/todo.git
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
