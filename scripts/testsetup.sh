#!/bin/bash

Question($command){
	read -p "$1" choice
	case "$choice" in 
		y|Y ) $command ;;
		* );;
	esac
}

inputs=$(echo test1)
Question($inputs) "does this work y/n "
