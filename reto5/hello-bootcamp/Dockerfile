#Imagen que voy a utilizar como base
FROM node:14-alpine

#Etiquetado
LABEL maintainer="martingustavolopez@gmail.com/lautaroglamonica@gmail.com"
LABEL project="bootcamp"

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

CMD ["npm","start"]