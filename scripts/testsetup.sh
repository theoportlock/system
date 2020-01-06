#!/bin/bash

Question(){
	read -p "$1" choice
	case "$choice" in 
		y|Y ) $($2) ;;
		* );;
	esac
}

inputs=$(echo "test1";)
Question "does this work y/n " inputs
