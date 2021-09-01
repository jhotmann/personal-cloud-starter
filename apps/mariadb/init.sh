#!/bin/bash
set -e

mysql -u"root" -p"$MYSQL_ROOT_PASSWORD" <<EOSQL
    CREATE DATABASE IF NOT EXISTS nextcloud;
    CREATE USER IF NOT EXISTS 'nextcloud'@'%' IDENTIFIED BY '${NEXTCLOUD_DB_PASSWORD}';
    GRANT ALL ON nextcloud.* TO 'nextcloud'@'%';
EOSQL

mysql -u"root" -p"$MYSQL_ROOT_PASSWORD" <<EOSQL
    CREATE DATABASE IF NOT EXISTS bitwarden;
    CREATE USER IF NOT EXISTS 'bitwarden'@'%' IDENTIFIED BY '${BITWARDEN_DB_PASSWORD}';
    GRANT ALL ON bitwarden.* TO 'bitwarden'@'%';
EOSQL

# Repeat for any additional mariadb databases
