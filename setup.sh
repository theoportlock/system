#!/bin/bash
# need to change the copy rc files to hard links (ln)
echo 'Input computer name'
read hostnam

# wificard=$(ip link | grep -m 1 -o "w\w\+[^:]")
if [[ ! -e ~/.computer ]]; then
	echo "name=$hostnam" >> ~/.computer
	# echo "wifi_card=$wificard" >> ~/.computer
	echo "copy_computer_profile_name=" >> ~/.computer
	echo "package_manager_install_command=" >> ~/.computer
	echo "copy_rcfiles=n" >> ~/.computer
	echo "install_bash_programs=n" >> ~/.computer
	echo "install_pip_programs=n" >> ~/.computer
	echo "install_git_repositories=n" >> ~/.computer
	echo "setup_rclone=n" >> ~/.computer
	vi ~/.computer
	exit
fi

copy_computer_profile_name=$(sed -n -e 's/^copy_computer_profile_name=//p' ~/.computer)
package_manager_install_command=$(sed -n -e 's/^package_manager_install_command=//p' ~/.computer)
copy_rcfiles=$(sed -n -e 's/^copy_rcfiles=//p' ~/.computer)
install_bash_programs=$(sed -n -e 's/^install_bash_programs=//p' ~/.computer)
install_pip_programs=$(sed -n -e 's/^install_pip_programs=//p' ~/.computer)
install_git_repositories=$(sed -n -e 's/^install_git_repositories=//p' ~/.computer)
setup_rclone=$(sed -n -e 's/^setup_rclone=//p' ~/.computer)

echo "$package_manager_install_command"

if [[ $copy_rcfiles == "y" ]]
then
	cp -a ~/system/computers/$copy_computer_profile_name/rcfiles/. ~
fi

if [[ $install_bash_programs == "y" ]]
then
	sudo xargs -a ~/system/computers/$copy_computer_profile_name/programlist $package_manager_install_command
fi

if [[ $install_pip_programs == "y" ]]
then
	sudo pip3 install -r ~/system/computers/$copy_computer_profile_name/pythonlist 
fi

if [[ $install_git_repositories == "y" ]]
then
	while read repo; do
	    git clone "$repo"
	done < ~/system/computers/$copy_computer_profile_name/programs/gitlist 
fi

# history settings
shopt -s histappend &&
shopt -s cmdhist

# stats
# screenfetch -Nn > ~/system/computers/$hostnam/stats

# copy current packages
# sudo dpkg-query -f '${binary:Package}\n' -W > ~/system/computers/$hostnam/programlist
