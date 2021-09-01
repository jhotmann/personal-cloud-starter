#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER miniflux WITH PASSWORD '${MINIFLUX_DB_PASSWORD}';
    CREATE DATABASE miniflux;
    GRANT ALL PRIVILEGES ON DATABASE miniflux TO miniflux;
EOSQL

# Repeat for any additional psql databases
