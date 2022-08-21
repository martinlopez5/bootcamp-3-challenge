#!/bin/bash


#Levantamos el docker-compose.yml
docker-compose up -d

#Revisamos que los contenedores estan up
docker ps

#Open google Chrome
google-chrome http://localhost:8081
google-chrome http://localhost:9999


#Borrar imagen y contendor

while true; do
    read -p "Do you wish to delete the container and image? yes/no: " yn
    case $yn in
        [Yy]* ) docker stop my-database; docker stop mongo-express; docker stop bootcamp-web; docker rm my-database; docker rm mongo-express; docker rm bootcamp-web; docker rmi mongo:latest -f; docker rmi mongo-express:latest -f; docker rmi nginx:latest -f; exit;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done