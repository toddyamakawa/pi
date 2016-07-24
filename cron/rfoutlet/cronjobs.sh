#!/bin/bash
here=$(dirname $(readlink -f $0))
run=$here/set.sh

function job() {
	hour=${1%:*}
	minute=${1#*:}
	echo $minute $hour "* * *" $run $2 $3
}

job 06:00 light29 on
job 21:00 light29 off

job 09:00 light75 on
job 17:00 light75 off

