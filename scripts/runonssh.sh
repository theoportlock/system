#!/bin/bash -xv

remote_dir=/home/nmrbox/tportlock/
remote_addr='tportlock@tportlock.nmrbox.org'
script=$1
input=$2
scp -r $input $remote_addr:$remote_dir &&
scp -r $script $remote_addr:$remote_dir &&
ssh $remote_addr "${remote_dir}$script $input"

#if [ $? == 0 ]; then
#	scp -r tportlock@tportlock.nmrbox.org:"/home/nmrbox/tportlock/aria/${nam}/run${run}/structures/it8 /home/nmrbox/tportlock/aria/${nam}/run${run}/structures/refine /home/nmrbox/tportlock/aria/${nam}/run${run}analysis" .
#	ssh tportlock@tportlock.nmrbox.org "rm -r /home/nmrbox/tportlock/aria/${nam}/${run}"
#fi
