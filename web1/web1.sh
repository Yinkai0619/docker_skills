#!/bin/bash

con_name="web1"
data_vol="/home/yinkai/Projects/docker_skills/web1/html/"
log_dir="/home/yinkai/Projects/docker_skills/web1/logs/"

if [ $1 == 'start' ]
then
	sudo docker container run --name ${con_name} \
		-P -d --rm -p 8080:80 \
		-v ${log_dir}:/var/log/nginx/ \
		-v ${data_vol}:/usr/share/nginx/html/ \
		nginx:latest
elif [ $1 == "stop" ]
then
	sudo docker container stop ${con_name}
else
	echo "Error Arg: $1"
fi
