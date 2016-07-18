#!/bin/bash
here=$(dirname $(readlink -f $0))
timestamp=$(date +%b%d_%H%M%S)
log=$here/../tmux_backup/$timestamp.tmux.log
format="'#{session_name} #{window_index} #{window_name} #{pane_current_path} #{window_layout}'"
eval tmux list-panes -a -F $format > $log
