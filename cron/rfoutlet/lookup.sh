#!/bin/bash
here=$(dirname $(readlink -f $0))

# --- Remote Codes ---
# Note: These are the ON codes.
# To find the OFF codes, add 9.
declare -A remote
remote[0313.1]=5575987
remote[0313.2]=5576131
remote[0313.3]=5576451
remote[0313.4]=5577987
remote[0313.X]=5584131

declare -A outlets
outlets[light29]=0313.1

for outlet in "${!outlets[@]}"; do
	echo [${outlets[$outlet]}] $outlet = ${remote[${outlets[$outlet]}]}
done

