#!/bin/bash
file=$(date +%F)
echo $file | xargs touch -a
vim $file
