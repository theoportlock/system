#!/bin/bash
sh="/usr/bin/env sh"
SESSION="Phones"       # Session name.
WINDOW="experiments" # Window name.

tmux kill-session -t "$SESSION" 2>&1
tmux start \; new-session  -d -s "$SESSION" -n "$WINDOW" "$sh -c \"ssh sony\"; $sh -i" \;
tmux split-window -v "$sh -c \"ssh moto_old\"" \;
tmux split-window -v "$sh -c \"ssh moto_old_old\"" \;
tmux split-window -h "$sh -c \"ssh tablet\"" \;
tmux select-layout tiled \;
tmux attach -t "$SESSION" \;
tmux switch -t "$SESSION"
