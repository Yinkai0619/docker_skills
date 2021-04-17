#sudo docker container run --name db --hostname db \
#	-d \
#	-p 127.0.0.1:33061:3306 \
#	-v /mnt/docker_volumes/db/data/:/var/lib/mysql \
#	-e MYSQL_ROOT_PASSWORD=mydbpass \
#	mariadb:latest

sudo docker container run --name db1 --hostname db1 \
	--rm -d \
	-p 127.0.0.1::3306 \
	-v /mnt/docker_volumes/db/data/:/var/lib/mysql \
	-e MYSQL_ROOT_PASSWORD=mydbpass \
	mariadb:latest
