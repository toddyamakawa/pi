#!/bin/bash
here=$(dirname $(readlink -f $0))

# --- Outlets ---
declare -A outlets
outlets[modem]=1012.1
outlets[router]=1012.2
outlets[lamp]=1012.4
outlets[light29]=1016.1
outlets[light75]=1016.2


# --- Remote Codes ---
# Note: These are the ON codes.
# To find the OFF codes, add 9.
declare -A remote

remote[1012.1]=5264691
remote[1012.2]=5264835
remote[1012.3]=5265155
remote[1012.4]=5266691
remote[1012.X]=5272835

remote[1016.1]=5575987
remote[1016.2]=5576131
remote[1016.3]=5576451
remote[1016.4]=5577987
remote[1016.X]=5584131

# --- Return Outlet Code ---
if [[ -n $1 ]]; then
	outlet=${outlets[$1]}
	[[ -z $outlet ]] && { echo 0; exit 1;}
	echo ${remote[$outlet]}
	exit
fi

# --- List All Outlets ---
for outlet in "${!outlets[@]}"; do
	echo [${outlets[$outlet]}] $outlet = ${remote[${outlets[$outlet]}]}
done

