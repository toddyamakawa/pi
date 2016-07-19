#!/bin/bash
here=$(dirname $(readlink -f $0))
log=$here/../logs/speedtest.log
#download=http://speedtest.wdc01.softlayer.com/downloads/test10.zip
download=http://speedtest.wdc01.softlayer.com/downloads/test100.zip
speed=$(wget -O /dev/null $download 2>&1 | awk '/saved/{print $1,$2,$3,$4}')
echo $speed >> $log
