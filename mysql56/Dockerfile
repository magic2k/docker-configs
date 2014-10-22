
FROM phusion/baseimage:latest
MAINTAINER Moo korova

RUN apt-get -qq update
RUN apt-get install -y --no-install-recommends mysql-server-5.6 \
 && rm -rf /var/lib/mysql/mysql \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 3306

ENTRYPOINT mysqld
