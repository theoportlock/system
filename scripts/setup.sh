#!/bin/bash
Question(){
	read -p "$1" choice
	case "$choice" in 
		y|Y ) $($2) ;;
		* );;
	esac
}

hostnam=$(hostname)
if [[ ! -e ~/system/computers/$hostnam ]]; then
	mkdir ~/system/computers/$hostnam
	screenfetch -Nn > ~/system/computers/$hostnam/stats
	echo "name=$hostnam" > ~.computer
fi

Question "Copy wifi profiles (y/n?)" $(sudo cp -r wifiprofiles/* /etc/wpa_supplicant/; )
Question "Install pacman programs (y/n)?" $(pacman --needed -S - < programlist; )
Question "Install pip programs (y/n)?" $(pip install -r piprequirements.txt; )
Question "Copy rc files (y/n)?" $(sudo cp -a rcfiles/. ~/; )
Question "Install git repositories (y/n)?" $(cd && git clone https://github.com/theoportlock/thoughts.git ; git clone https://github.com/theoportlock/tis.git; )
Question "Setup grive (y/n)?" $(cd ~ && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && yay -S grive && mkdir ~/tdrive && cd ~/tdrive && grive -a && mkdir ~/gdrive && grive -a; )
Question "Fix history settings (y/n)?" $( shopt -s histappend && shopt -s cmdhist; )
Question "Fix git configuration settings (y/n)?" $(git config --global core.editor "vim" && git config diff.tool vimdiff && git config --global credential.helper cache && git config --global credential.helper 'cache --timeout=36000'; )
