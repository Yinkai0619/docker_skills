#!/bin/bash

echo -e "Filename: $(basename $0)"

if [ $1 == "check" -o $1 == "status" ]; then
	echo $1
else
	echo "Error"
fi
