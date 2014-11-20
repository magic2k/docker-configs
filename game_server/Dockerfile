
FROM phusion/baseimage:latest
MAINTAINER That guy

RUN apt-get -qq update
RUN apt-get -y upgrade
RUN apt-get -y install php5 nginx apache2 openssh-server supervisor

RUN \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk7-installer
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

#ADD run.sh /root/run.sh
#RUN chmod 755 /root/run.sh
#RUN /root/run.sh


EXPOSE 80
EXPOSE 443
EXPOSE 22

CMD ["/bin/bash"]
