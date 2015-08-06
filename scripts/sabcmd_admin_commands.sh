#!/bin/bash
#
# These Commands can be triggered from any
# user and from any channel.
#

sabcmd=$(which sabcmd)
command=$1
hostmask=$2
args=$3

if [ "$command" == "pause" ]; then
	$sabcmd pause | sed 's/SABcmd/%BOLDSABcmd%BOLD/g'
elif [ "$command" == "resume" ]; then
	$sabcmd resume | sed 's/SABcmd/%BOLDSABcmd%BOLD/g'
elif [ "$command" == "restart"  ]; then
	$sabcmd restart | sed 's/SABcmd/%BOLDSABcmd%BOLD/g'	
fi
