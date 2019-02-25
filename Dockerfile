## Descargo una version concreta de Ubuntu
FROM ubuntu:12.04

MAINTAINER Vicente Romero Jimenez "vicenromeroji@gmail.com"

## Actualizo el sistema
RUN apt-get update

## Instalo nginx
RUN apt-get install -y nginx

VOLUME /usr/share/nginx/www/

ARG webpage

## Creo un fichero index.html en el directorio por defecto de nginx
##RUN echo "Mi primer Dockerfile con nginx" > /usr/share/nginx/www/index.html
ADD $webpage/* /usr/share/nginx/www/

## Arranco nginx con ENTRYPOINT para que no pueda ser modificado durante la creacion del contenedor
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

## Expongo el puerto 80
EXPOSE 80 
