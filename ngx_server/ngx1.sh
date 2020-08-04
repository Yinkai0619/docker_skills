#!/bin/bash

con_name="ngx1"
vol="$PWD/${con_name}/"
ngx_conf_file="/home/yinkai/Projects/docker_skills/ngx_server/conf/"

if [ $1 == 'start' ]
then
	#sudo docker container run --name ${con_name} -P --rm -p 8080:80 -v ${data_vol}:/usr/share/nginx/html/ -d nginx:latest
	sudo docker container run --name ${con_name} -P --rm -v ${ngx_conf_file}:/etc/nginx/ nginx:latest
elif [ $1 == "stop" ]
then
	sudo docker container stop ${con_name}
else
	echo "Error Arg: $1"
fi
