
FROM phusion/baseimage:latest
MAINTAINER That guy

RUN apt-get -qq update
RUN apt-get -y upgrade

#RUN apt-get install -y mysql-server-5.6 && rm -rf /var/lib/apt/lists/*
#RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ADD run.sh /root/run.sh
RUN chmod 755 /root/run.sh
#RUN /root/run.sh

ADD REFRESHED_AT 2014-11-20
EXPOSE 3306
#USER mysql
#ENTRYPOINT /usr/sbin/mysqld
#CMD ["start"]
#CMD ["/usr/sbin/mysqld start"]
CMD ["/bin/bash"]
