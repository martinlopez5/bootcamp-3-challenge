#!/bin/bash

#Levantamos el contenedor
docker run -d --name web -p 8000 php:7.4-apache

#Revisamos que este up correcamente
docker ps

#Nos conectamos dentro del contenedor
docker exec -it web bash

#Instalamos nano dentro del mismo
apt update
apt-get install nano

#Vamos a la ruta donde se guardan los archivos .html

#Creamos index.html y le pasamos info
touch index.html

#Esto de aca abajo no anda
echo "<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="site.css" rel="stylesheet" />
</head>

<body>
    HOLA SOMOS MARTIN LOPEZ Y LAUTARO LAMONICA!
</body>

</html>" > index.html




