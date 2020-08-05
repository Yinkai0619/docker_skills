#!/bin/bash

containers=$(sudo docker container ls | awk 'NR>1{print $1}')

if [ $1 == 'all' ]; then
	for c in ${containers}; do
		sudo docker container stop $c
	done
else
	for c in $@; do
		sudo docker container stop $c
	done
fi

sudo docker container ls
