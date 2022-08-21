#!/bin/bash

docker pull mariadb

docker run -d --name bbdd -p 3306:3306 -e "MARIADB_ROOT_PASSWORD=root" -e "MARIADB_DATABASE=prueba" -e "MARIADB_USER=invitado" -e "MARIADB_PASSWORD=invitado" mariadb

docker ps

docker rmi mariadb

docker stop bbdd

docker rm bbdd

docker rmi mariadb -f