#!/bin/bash

apt-get install -y mysql-server-5.6 && rm -rf /var/lib/apt/lists/*
sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

/etc/init.d/mysql start

# some time to let mysqld start
sleep 8;

mysql -uroot -e "create database bbmobile_admin CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -uroot -e "create database bbmobile_users CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -uroot -e "create database bbmobile_commons CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -uroot -e "create database bbmobile_const CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -uroot -e "create database bbmobile_replays CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -uroot -e "create database bbmobile_logs CHARACTER SET utf8 COLLATE utf8_general_ci;"

mysql -uroot -e "grant all privileges on *.* to bbmobiledev@'%' identified by 'passwd';"


/etc/init.d/mysql restart
