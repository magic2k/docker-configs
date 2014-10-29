#!/bin/bash
/etc/init.d/mysql start

mysql -uroot -e "create database bbmobile_admin CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -uroot -e "create database bbmobile_users CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -uroot -e "create database bbmobile_commons CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -uroot -e "create database bbmobile_const CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -uroot -e "create database bbmobile_replays CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -uroot -e "create database bbmobile_logs CHARACTER SET utf8 COLLATE utf8_general_ci;"

mysql -uroot -e "grant all privileges on *.* to bbmobiledev@'%' identified by 'passwd';"


/etc/init.d/mysql restart
