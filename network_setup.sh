#!/bin/bash
# macvlan network setup for docker container example
# $1 - name of container 

# Create a macvlan interface associated with your physical interface
ip link add p6p1p0 link p6p1 type macvlan mode bridge

# Add this interface to the container's network namespace
ip link set netns $(scripts/get_container_PID.sh $1) p6p1p0

#install nsenter on debian/ubuntu
docker run --rm -v /usr/local/bin:/target jpetazzo/nsenter

# bring up the link:
nsenter -t $(scripts/get_container_PID.sh $1) -n ip link set p6p1p0 up

CPID=$(scripts/get_container_PID.sh $1)

# and configure the ip address and routing
nsenter -t $CPID -n ip route del default
nsenter -t $CPID -n ip addr add 172.18.64.251/26 dev p6p1p0
nsenter -t $CPID -n ip route add default via 172.18.64.193 dev p6p1p0

# setting for docker host, so he can communicate with container macvlan interfaces
#ip link add p6p1p1 link p6p1 type macvlan mode bridge
#ip addr add 172.18.64.249/26 dev p6p1p1
#ip route add 172.18.64.251 dev p6p1p1

