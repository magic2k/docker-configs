
FROM phusion/baseimage:latest
MAINTAINER That guy

RUN apt-get -qq update
RUN apt-get install -y --no-install-recommends mysql-server-5.6 \
 && rm -rf /var/lib/apt/lists/*

ADD run.sh /root/run.sh
RUN chmod 755 /root/run.sh
RUN /root/run.sh

EXPOSE 3306
ENTRYPOINT /usr/sbin/mysqld
CMD ["start"]
