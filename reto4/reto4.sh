#!/bin/bash

#Creamos la imagen
docker build -t simple-apache:new .

#Listamos las imagenes
docker images

#Levantamos el contenedor
docker run -d --name my_apache -p 5050:80 simple-apache:new

#Open Google Chrome
google-chrome http://localhost:5050

#Chequeamos que corra el contenedor
docker ps


while true; do
    read -p "Do you wish to delete the container and image? yes/no: " yn
    case $yn in
        [Yy]* ) docker stop my_apache; docker rm my_apache; docker rmi simple-apache:new -f; exit;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

