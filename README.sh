#!/bin/bash

# Installing docker
sudo apt install docker.io

# use this to create the image
# this should be done inside the main folder
# it will take some time to complete so be patient
# This should be done only once, after that use the image created from it
sudo docker build -t "project:v1" . --no-cache

# use this command to start the container
sudo docker run -itd -p 80:80 project:v1

# visit your_servers_ip to get the result

# Stop container by using 
# Replace container_name with actual name of container
#  sudo docker container stop container_name 

# list active containers
sudo docker container ls 

# Restart container
# sudo docker container start container_name
