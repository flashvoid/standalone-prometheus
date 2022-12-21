#!/bin/bash

while :; do

	ps -haxo pid,rss,pcpu,comm | awk '{ print "process_rss{pid=\""$1"\",name=\""$4"\"} " $2 }' > /data/textfile_collector/process_rss.prom
	ps -haxo pid,rss,pcpu,comm | awk '{ print "process_cpu{pid=\""$1"\",name=\""$4"\"} " $3 }' > /data/textfile_collector/process_cpu.prom
	ps -haxo pid,rss,pcpu,comm,cmd | awk '{ if ( $3 > 80 ) { print $1, $3, $5} }' | tee -a /data/logs/process.log
	sleep 30
done
