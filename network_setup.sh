#!/bin/bash
#macvlan network setup for docker container example

#Create a macvlan interface associated with your physical interface
ip link add p6p1p0 link p6p1 type macvlan mode bridge

ip link set netns $(scripts/get_container_PID.sh $1) p6p1p0

#install nsenter on debian/ubuntu
docker run --rm -v /usr/local/bin:/target jpetazzo/nsenter

