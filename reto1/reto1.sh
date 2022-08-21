#!/bin/bash

docker run -d --name servidor_web -p 8181:80 nginx
docker ps 
docker images
docker stop servidor_web
docker ps
docker rm servidor_web
docker ps -a 



