#!/bin/bash
#

if [ -z "$1" -o $# -lt 2 ]; then 
	#if [ $# -lt 2 ]; then
		echo -e "The arguments given are incorrect.\n"
		echo -e 'Usage: web [start|stop|restart|check] CONTAINER \n'
		exit 5
elif [[ $1 != "check" || $1 != "stop" ]]; then
fi


function start {
	con_name="$1"
	con_root="/home/yinkai/Projects/docker_skills/${con_name}/"
	data_vol="${con_root}/html/"
	log_dir="${con_root}/logs/"
	ngx_conf="${con_root}/conf/"

	sudo docker container run --name ${con_name} \
		-P -d --rm \
		-v ${log_dir}:/var/log/nginx/ \
		-v ${data_vol}:/usr/share/nginx/html/ \
		-v ${ngx_conf}:/etc/nginx/ \
		nginx:latest > /dev/null
}


function stop {
	sudo docker container stop $1 > /dev/null
	sleep 1
}


# 输出容器当前状态
print_status(){
	cons=$(docker container ls | awk 'NR>1{print $11}')
	echo "$cons--------"
#	# 检查容器运行状态。正在运行返回1, 否则返回0
#	is_running(){
#		[ -z "$(sudo docker container ls -a | grep $1)" ] && echo 0 || echo 1
#	}

	ret=$(echo ${cons} | grep "$1")

    if [ $ret -eq "" ] ; then
            echo -e "$1 is stoped."
    else
            echo "$1 is running."
    fi
}


if [ $1 == 'start' ]
then
	start $2
	print_status $2

elif [ $1 == "stop" ]
then
	if [[ $2 == all || $2 == "" ]]; then
		for c in ${cons}; do
			stop c
			print_status c
		done
	else
		stop $2
		print_status $2
	fi

elif [ $1 == "restart" ]
then
	stop $2
	print_status $2
	start $2
	print_status $2

elif [ $1 == "check" ]
then
	if [[ -z "$2" || $2 == "all" ]]; then
		sudo docker container ls
	else
		sudo docker container ls -f name=^"$2"$
	fi		
else
	echo "Error Arg: $1"
fi
