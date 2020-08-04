#!/bin/bash

con_name="web1"
data_vol="/home/yinkai/Projects/docker_skills/web1/html/"

if [ $1 == 'start' ]
then
	sudo docker container run --name ${con_name} -P --rm -p 8080:80 -v ${data_vol}:/usr/share/nginx/html/ -d nginx:latest
elif [ $1 == "stop" ]
then
	sudo docker container stop ${con_name}
else
	echo "Error Arg: $1"
fi
