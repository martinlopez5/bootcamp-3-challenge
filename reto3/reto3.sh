#!/bin/bash

#Crear Volumen
docker volume create static_content

#Creamos la imagen
docker build -t bootcamp_nginx:1.0.0 .

#Listamos las imagenes
docker images

#Levantamos el contenedor
docker run -d --name bootcamp_container -v static_content -p 8080:80 bootcamp_nginx:1.0.0

#Chequeamos que corra el contenedor
docker ps

#Open Google Chrome
google-chrome http://localhost:8080


#Docker login
echo "Ingresar usuario"
#Read USER
echo "Ingresar contraseña"
#Read PWD
docker login -u $USER -p $PWD docker.io
#Tagear la imagen
docker tag bootcamp_nginx:1.0.0 $USER/bootcamp_nginx:1.0.0
#Push en el registry
docker push $USER/bootcamp_nginx:1.0.0


while true; do
    read -p "Do you wish to delete the container and image? yes/no: " yn
    case $yn in
        [Yy]* ) docker stop bootcamp_container; docker rm bootcamp_container; docker rmi bootcamp_nginx:1.0.0 -f; docker volume rm static_content  exit;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

