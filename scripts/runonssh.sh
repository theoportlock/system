#!/bin/bash -xv
remote_dir=/home/nmrbox/tportlock/
remote_addr='tportlock@tportlock.nmrbox.org'
script=$1
input=$2
scp -r $input $remote_addr:$remote_dir &&
scp -r $script $remote_addr:$remote_dir &&
ssh $remote_addr "${remote_dir}$script $input" &
