# MariaDB 10.2.x Docker image

> Docker image based on CentOS 7.5

Quick start:

```
docker run \
-d \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=SecurePassword123 \
giabar/gb-mariadb
```

Specify your db and credentials:

```
docker run \
-d \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=password \
-e MYSQL_DATABASE=mydb \
-e MYSQL_USER=myuser \
-e MYSQL_PASSWORD=mypassword \
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
  -v /mariadb/logs:/var/log/mariadb \
  giabar/gb-mariadb
```


For details read the official documentation: https://hub.docker.com/_/mariadb/
