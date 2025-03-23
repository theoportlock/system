#!/bin/bash
file=$(date +%F)
if [ ! -f "$file" ]; then
	cat `ls 2* | tail -1` > $file
fi
vim $file
