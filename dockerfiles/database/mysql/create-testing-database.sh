#!/usr/bin/env bash

mysql --user=root --password="$MYSQL_ROOT_PASSWORD" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS testing;
    CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
    GRANT ALL PRIVILEGES ON \`testing%\`.* TO '$DB_USER'@'%';
EOSQL
