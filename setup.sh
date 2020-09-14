#!/bin/bash

if [[ ! -e ~/.computer ]]; then
	# wificard=$(ip link | grep -m 1 -o "w\w\+[^:]")
	# echo "wifi_card=$wificard" >> ~/.computer
	echo 'Input computer name'
	read hostnam
	echo "name=$hostnam" >> ~/.computer
	echo "copy_computer_profile_name=" >> ~/.computer
	echo "package_manager_install_command=" >> ~/.computer
	echo "copy_rcfiles=n" >> ~/.computer
	echo "install_bash_programs=n" >> ~/.computer
	echo "install_pip_programs=n" >> ~/.computer
	echo "install_git_repositories=n" >> ~/.computer
	exit
fi

hostnam=$(sed -n -e 's/^name=//p' ~/.computer)
copy_computer_profile_name=$(sed -n -e 's/^copy_computer_profile_name=//p' ~/.computer)
package_manager_install_command=$(sed -n -e 's/^package_manager_install_command=//p' ~/.computer)
copy_rcfiles=$(sed -n -e 's/^copy_rcfiles=//p' ~/.computer)
install_bash_programs=$(sed -n -e 's/^install_bash_programs=//p' ~/.computer)
install_pip_programs=$(sed -n -e 's/^install_pip_programs=//p' ~/.computer)
install_git_repositories=$(sed -n -e 's/^install_git_repositories=//p' ~/.computer)

# setup computer
mkdir -p ~/system/computers/$hostnam && cp -r ~/system/computers/$copy_computer_profile_name/* ~/system/computers/$hostnam

if [[ $copy_rcfiles == "y" ]]
then
	cp -a ~/system/computers/$hostnam/rcfiles/. ~
	mkdir -p ~/.vim/tmp
	source ~/.bashrc
	# ln -s ~/system/computers/$hostnam/rcfiles/. ~
fi

if [[ $install_bash_programs == "y" ]]
then
	xargs -a ~/system/computers/$hostnam/programs/bashlist $package_manager_install_command
fi

if [[ $install_pip_programs == "y" ]]
then
	pip3 install -r ~/system/computers/$hostnam/programs/pythonlist 
fi

if [[ $install_git_repositories == "y" ]]
then
	while read repo; do
	    git clone "$repo"
	done < ~/system/computers/$hostnam/programs/gitlist 
fi

# history settings
shopt -s histappend &&
shopt -s cmdhist

# stats
# screenfetch -Nn > ~/system/computers/$hostnam/stats
# copy current packages
# dpkg-query -f '${binary:Package}\n' -W > ~/system/computers/$hostnam/programlist
