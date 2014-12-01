#!/bin/bash
cd /home/ec2-user/EventPush
while true; do
	{
	sleep 2m
	temp=$(git pull)
	if [ "$temp" != "Already up-to-date." ]; then
		~/scripts/transLocaltoServer.sh /home/ec2-user/EventPush /usr/local/tomcat7/webapps/ROOT
		~/scripts/restart.sh
	fi
	}>&/dev/null

done
