# [Service Name](https://example.com/)
A quick description of the service.

## Docker Compose
Integrate the following configuration in your `docker-compose.yml` file.

```yaml
services:
  servicename:
    container_name: servicename
    image: someorg/containername:tag
    restart: unless-stopped # background services 'always', applications 'unless-stopped'
    networks:
      - caddy # if exposed via reverse proxy
      - internal # if database access is required
    ports:
      - 8000:80 # port on server:port in container
    volumes:
      - servicename_data:/path/to/data
      - ./apps/servicename:/path/to/config
    environment:
      - SOME_VAR=some value
      - ANOTHER_VAR=${ENV_VAR_NAME}
    depends_on:
      - postgres|mariadb # if database used
    labels:
      # if exposed via reverse proxy
      # make sure to point to the port the service is running on inside the container
      caddy: servicename.${DOMAIN_NAME}
      caddy.reverse_proxy: "{{upstreams 80}}"

volumes:
  servicename_data: {}
```

## .env variables

Add the following configuration values to your `.env` file.

```
# comment description
ENV_VAR_NAME=changeme
```

## Configuration Files

Edit the following and place it in `apps/servicename/config/configname.ext`

```
Config file contents
```

## Database Initialization

Add the following to your mariadb/postgres `init.sh`

```sh
mysql -u"root" -p"$MYSQL_ROOT_PASSWORD" <<EOSQL
    CREATE DATABASE IF NOT EXISTS servicename;
    CREATE USER IF NOT EXISTS 'servicename'@'%' IDENTIFIED BY '${SERVICENAME_DB_PASSWORD}';
    GRANT ALL ON servicename.* TO 'servicename'@'%';
EOSQL

or

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER servicename WITH PASSWORD '${SERVICENAME_DB_PASSWORD}';
    CREATE DATABASE servicename;
    GRANT ALL PRIVILEGES ON DATABASE servicename TO servicename;
EOSQL
```