#!/bin/bash
here=$(dirname $(readlink -f $0))
backup=$here/tmux_backup/$timestamp
sourceme=$backup/sourceme.bash

tmux=/usr/bin/tmux

echo_eval() {
	echo $@
	eval $@
}

while read line; do
	read session index window path layout <<<$(echo $line)

	if [[ $session != $prev_session ]]; then
		echo_eval tmux new-session -d -s $session -n $window -c $path
		prev_session=$session
		prev_index=$index
	fi

	if [[ $index != $prev_index ]]; then
		echo_eval tmux new-window -d -t $session -n $window -c $path
		prev_index=$index
	fi

	#echo_eval tmux split-window -d -t $session:$index -c $path -F "'$layout'"
	echo_eval tmux split-window -d -t $session:$index -c $path
	echo_eval tmux select-layout -t $session:$index "'$layout'"

	#echo tmux split-window -d -t $session:$index -c $path
	#tmux split-window -d -t $session:$index -c $path

	#echo tmux select-layout -t $session:$index $layout
	#tmux select-layout -t $session:$index $layout

done <$1

