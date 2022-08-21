#!/bin/bash

#Instalar dependencias
npm i

#Creamos la imagen
docker build -t node-app:1.0.0 .

#Listamos las imagenes
docker images

#Levantamos el contenedor
docker run -d --name node-app -p 4000:4000 node-app:1.0.0

#Chequeamos que corra
docker ps

#Corroboramos que funciona ok
docker logs node-app

#Open Google Chrome
google-chrome http://localhost:4000

#Docker login
echo "Ingresar usuario"
read USER
echo "Ingresar contraseña"
read PWD
docker login -u $USER -p $PWD docker.io
#Tagear la imagen
docker tag node-app:1.0.0 $USER/node-app:1.0.0
#Push en el registry
docker push $USER/node-app:1.0.0

#Borrar imagen y contendor

while true; do
    read -p "Do you wish to delete the container and image? yes/no: " yn
    case $yn in
        [Yy]* ) docker stop node-app; docker rm node-app; docker rmi node-app:1.0.0 -f; exit;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done