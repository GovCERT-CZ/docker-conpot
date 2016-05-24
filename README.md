# docker-conpot

This is Docker image for honeypot Conpot (https://github.com/mushorg/conpot).

Build docker image
    
    $ git clone https://github.com/GovCERT-CZ/docker-conpot
    $ cd docker-conpot
    $ docker build -t <repository>/<name> .
    
Run docker container
    
    $ docker run [--name <container name>] [-d] -p 80:80 -p 102:102 -p 161:161/udp -p 502:502 -p 623:623/udp -p 47808:47808/udp [-v <host path>:/opt/conpot/log] <repository>/<name>
    
    
Run docker container with specified conpot template
    
    $ docker run [--name <container name>] [-d] -p 80:80 -p 102:102 -p 161:161/udp -p 502:502 -p 623:623/udp -p 47808:47808/udp [-v <host path>:/opt/conpot/log] [-e "CONPOT_TEMPLATE=<template name>"] <repository>/<name>
    

Run docker container with custom configuration
    
    $ wget https://raw.githubusercontent.com/mushorg/conpot/master/conpot/conpot.cfg -O conpot.cfg
    update conpot.cfg file with your settings 
    $ docker run [--name <container name>] [-d] -p 80:80 -p 102:102 -p 161:161/udp -p 502:502 -p 623:623/udp -p 47808:47808/udp [-v <host path>/conpot.cfg:/opt/conpot/conpot/conpot.cfg] [-v <host path>:/opt/conpot/log] <repository>/<name>
    
