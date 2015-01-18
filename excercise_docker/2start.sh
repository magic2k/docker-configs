#!/bin/bash

docker start redis_primary
docker start redis_replica1
docker start redis_replica2
docker start nodeapp
docker start logstash



#show logs
docker run --rm -ti --volumes-from redis_primary ubuntu cat /var/log/redis/redis-server.log
docker run --rm -ti --volumes-from redis_replica1 ubuntu cat /var/log/redis/redis-replica.log
docker run --rm -ti --volumes-from redis_replica2 ubuntu cat /var/log/redis/redis-replica.log


