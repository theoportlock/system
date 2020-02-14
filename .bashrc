source ~/system/rcfiles/.bashrc
name=$(sed -n -e 's/^name=//p' ~/.computer)
source ~/system/computers/$name/rcfiles/.bashrc
