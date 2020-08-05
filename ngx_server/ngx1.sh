#!/bin/bash

con_name="ngx1"
vol="$PWD/${con_name}/"
ngx_conf_file="/home/yinkai/Projects/docker_skills/ngx_server/conf/"
ngx_logs="/home/yinkai/Projects/docker_skills/ngx_server/logs/"

function start {
	sudo docker container run --name ${con_name} \
		-P --rm -d \
		-v ${ngx_logs}:/var/log/nginx/ \
		-v ${ngx_conf_file}:/etc/nginx/ \
		nginx:latest
}

stop(){
	sudo docker container stop ${con_name}
}

if [ $1 == 'start' ]
then
	start
	sudo docker container ls -a
elif [ $1 == "stop" ]
then
	stop
elif [ $1 == "restart" ]
then
	stop
	sleep 1
	ret=$(sudo docker container ls -a | grep ${con_name})
	if [ -z ${ret} ] ; then
		echo -e "${con_name} is stoped.\n"
	else
		echo "${con_name} is running."
	fi

	start
	sudo docker container ls -a

else
	echo "Error Arg: $1"
fi
