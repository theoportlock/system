#!/bin/bash

if [[ ! -e ~/.computer ]]; then
	# wificard=$(ip link | grep -m 1 -o "w\w\+[^:]")
	# echo "wifi_card=$wificard" >> ~/.computer
	printf 'Input computer name'
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
if [[ ! -e ~/system/computers/$hostnam ]]; then
	printf "Creating new machine profile"
	mkdir -p ~/system/computers/$hostnam && cp -r ~/system/computers/$copy_computer_profile_name/* ~/system/computers/$hostnam
	printf "Done\n"
fi

if [[ $copy_rcfiles == "y" ]]
then
	printf "Copying rc files"
	cp -a ~/system/computers/$hostnam/rcfiles/. ~
	mkdir -p ~/.vim/tmp
	# ln -s ~/system/computers/$hostnam/rcfiles/. ~
	printf "Done\n"
fi

if [[ $install_bash_programs == "y" ]]
then
	printf "Installing bash programs"
	xargs -a ~/system/computers/$hostnam/programs/bashlist $package_manager_install_command
	printf "Done\n"
fi

if [[ $install_pip_programs == "y" ]]
then
	printf "Installing python-pip programs"
	pip install -r ~/system/computers/$hostnam/programs/pythonlist 
	printf "Done\n"
fi

if [[ $install_git_repositories == "y" ]]
then
	printf "Installing git programs"
	while read repo; do
	    git clone "$repo"
	done < ~/system/computers/$hostnam/programs/gitlist 
	printf "Done\n"
fi

# history settings
shopt -s histappend &&
shopt -s cmdhist

printf "Completed\n"
# stats
# screenfetch -Nn > ~/system/computers/$hostnam/stats
# copy current packages
# dpkg-query -f '${binary:Package}\n' -W > ~/system/computers/$hostnam/programlist
# pip freeze | sed s/=.*// > piplist
