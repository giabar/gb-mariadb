# MariaDB Docker image

> Docker image based on CentOS 7.4

Quick start:

```
docker run \
-d \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=SecurePassword123 \
giabar/gb-mariadb
```

Where to store data:

```
docker run \
  -d \
  -p 3306:3306 \
  --name gbmariadb \
  -e MYSQL_ROOT_PASSWORD=SecurePassword123 \
  -v /mariadb/db:/var/lib/mysql \
  -v /maroadb/logs:/var/log/mariadb \
  giabar/gb-mariadb
```

For details read the official documentation: https://hub.docker.com/_/mariadb/
