#!/bin/bash
docker rm mysql1_ready_cont
#docker run -d -p 3306:3306 --name mysql1_ready_cont --entrypoint=/usr/sbin/mysqld --volumes-from data1_for_mysql mysql1_ready -c start
#docker run -d -p 3306:3306 --name mysql1_ready_cont --volumes-from data1_for_mysql mysql1_ready /bin/sh -c '/usr/sbin/mysqld start'
docker run -d -p 3306:3306 --name mysql1_ready_cont --volumes-from data1_for_mysql mysql1_ready /usr/bin/mysqld_safe
sleep 3;
docker ps
docker ps -a
echo "______________________________"
docker logs mysql1_ready_cont

