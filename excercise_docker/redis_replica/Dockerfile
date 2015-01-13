FROM jamtur01/redis
MAINTAINER That guy

ENTRYPOINT [ "redis-server", "--logfile /var/log/redis/redis-replica.log", "--slaveof redis_primary 6379" ]


