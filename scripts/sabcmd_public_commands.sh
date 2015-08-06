#!/bin/bash
#
# These Commands can be triggered from any
# user and from any channel.
#

sabcmd=$(which sabcmd)
command=$1
hostmask=$2
args=$3

#echo $command
#echo $hostmask
#echo "$args"

if [ "$command" == "status" ]; then
	$sabcmd status | sed 's/SABcmd/%BOLDSABcmd%BOLD/g'
elif [ "$command" == "add" ]; then
	nzbName=$(echo $args | awk '{ print $1F }')
	if [[ $nzbName == http* ]]; then
		$sabcmd add --nzb $nzbName | sed 's/SABcmd/%BOLDSABcmd%BOLD/g'
	else
		echo "Error: add command requires a http(s)-url."
	fi
elif [ "$command" == "del"  ]; then
	
	nzbName=$(echo $args | awk '{ print $1F }')
	$sabcmd delete --target $nzbName | sed 's/SABcmd/%BOLDSABcmd%BOLD/g'	

elif [ "$command" == "help" ]; then
	echo "%UNDERLINEIRCCatX-SABcmd commands:"
	echo "   "
	echo "%UNDERLINEPublic commands:"
	echo "   !%BOLDsabstatus%BOLD                -- display status"
	echo "   !%BOLDsabadd%BOLD <url>             -- add a nzb file from url"
	echo "   !%BOLDsabdel%BOLD <#num|title|nzo>  -- delete queue item #, title or nzo_id"
	echo "   "
	echo "%UNDERLINEAdmin commands:"
	echo "   !%BOLDsabpause%BOLD                 -- pause SABnzbd"
	echo "   !%BOLDsabresume%BOLD                -- resume SABnzbd"
	echo "   !%BOLDsabrestart%BOLD               -- restart SABnzbd"
	echo "   "
fi
