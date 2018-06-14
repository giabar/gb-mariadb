#!/bin/bash

MYSQL_HOST=localhost

echo "MYSQL_HOST="$MYSQL_HOST
echo "MYSQL_ROOT_PASSWORD="$MYSQL_ROOT_PASSWORD
echo "MYSQL_DATABASE="$MYSQL_DATABASE
echo "MYSQL_USER="$MYSQL_USER
echo "MYSQL_PASSWORD="$MYSQL_PASSWORD

echo "================================"
echo "= Running the mysql_install_db ="
echo "================================"
/usr/bin/mysql_install_db
chown -R mysql:mysql /var/lib/mysql
mkdir -p /var/log/mariadb
chown -R mysql:mysql /var/log/mariadb

echo "===================================="
echo "= Running the mysql mariadb daemon ="
echo "===================================="
/usr/bin/mysqld_safe &

sleep 5

mysqladmin flush-privileges
mysqladmin password $MYSQL_ROOT_PASSWORD

sleep 3

mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "select user, host FROM mysql.user;"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE USER '$MYSQL_USER'@'$MYSQL_HOST' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` ;"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

tail -f /var/log/mariadb/mariadb_error.log
