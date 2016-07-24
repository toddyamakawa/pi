#!/bin/bash
# Usage: $0 outlet [on|off]
here=$(dirname $(readlink -f $0))
code=$($here/lookup.sh $1)
state=$2
[[ $code == 0 ]] && exit 1
[[ $state == off ]] && code=$(($code + 9))
$here/codesend $code && $here/codesend $code && $here/codesend $code
