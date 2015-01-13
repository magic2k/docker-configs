#!bin/bash

#build images
cd redis_base
docker build -t jamtur01/redis .
cd ../redis_primary
docker build -t jamtur01/redis_primary .
cd ../redis_replica
docker build -t jamtur01/redis_replica .
cd ../nodejs
docker build -t jamtur01/nodejs .
cd ..


#run them
docker run -d -h redis_primary --name redis_primary jamtur01/redis_primary
docker run -d -h redis_replica1 --name redis_replica1 --link redis_primary:redis_primary jamtur01/redis_replica
docker run -d -h redis_replica2 --name redis_replica2 --link redis_primary:redis_primary jamtur01/redis_replica
docker run -d --name nodeapp -p 3000:3000 --link redis_primary:redis_primary jamtur01/nodejs

#show logs
docker run --rm -ti --volumes-from redis_primary ubuntu cat /var/log/redis/redis-server.log
docker run --rm -ti --volumes-from redis_replica1 ubuntu cat /var/log/redis/redis-replica.log
docker run --rm -ti --volumes-from redis_replica2 ubuntu cat /var/log/redis/redis-replica.log


