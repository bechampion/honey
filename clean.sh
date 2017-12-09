#!/bin/bash
while read line
do
	DIP=$(echo ${line} | awk '{ print $2 }')
	CID=$(echo ${line} | awk '{ print $1 }')
	[[ $(ps ax | grep ${DIP}| grep -v grep | wc -l ) == 0 ]] && echo "killing ${CID} ${DIP} $(date)" && docker kill ${CID} && sed -e "/${CID}/d" -i /tmp/track  
done < /tmp/track
