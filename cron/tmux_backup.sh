#!/bin/bash
here=$(dirname $(readlink -f $0))
timestamp=$(date +%b%d_%H%M%S)
backup=$here/tmux_backup/$timestamp
sourceme=$backup/sourceme.bash
tmux=/arm/tools/gnu/tmux/2.1/rhe6-x86_64/bin/tmux

mkdir -p $backup
echo "here=$backup" > $sourceme

sessions=$($tmux list-sessions -F '#{session_name}')
for session in $sessions; do
	script=$backup/$session.bash

	windows=$($tmux list-windows -t $session -F '#{window_id} #{window_name} #{window_layout}')

	# For Each Window
	window_index=0
	while read -r window; do
		window_id=$(echo $window | awk '{print $1}')
		window_name=$(echo $window | awk '{print $2}')
		window_layout=$(echo $window | awk '{print $3}')

		panes=$($tmux list-panes -t $session:$window_id -F '#{pane_current_path}')

		# For Each Pane
		pane_index=0
		while read -r pane; do

			if [[ $window_index == 0 ]]; then
				if [[ $pane_index == 0 ]]; then
					echo "$tmux new-session -s $session -n $window_name -c $pane -d \\; source-file \$here/$session.bash" >> $sourceme
				else
					echo "split-window -c $pane" >> $script
				fi
			else
				if [[ $pane_index == 0 ]]; then
					echo "new-window -n $window_name -c $pane" >> $script
				else
					echo "split-window -c $pane" >> $script
				fi
			fi

			pane_index=$(($pane_index+1))
		done <<< "$panes"
		echo "select-layout $window_layout" >> $script

		window_index=$(($window_index+1))
	done <<< "$windows"

done

