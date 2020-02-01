#!/bin/bash
hostnam=$(hostname)
if [[ ! -e ~/.computer ]]; then
	echo "name=$hostnam" >> ~/.computer
	echo "copy_wifi_profiles=n" >> ~/.computer
	echo "install_pacman_programs=n" >> ~/.computer
	echo "install_git_repositories=n" >> ~/.computer
	echo "setup_grive=n" >> ~/.computer
	echo "fix_history_settings=n" >> ~/.computer
	echo "stats=n" >> ~/.computer
else
	echo "computer file already exists "
fi

