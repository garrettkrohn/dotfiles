#!/bin/bash

echo "stopping and destroying the db"
docker stop db && docker rm db && docker rmi offensive-security-platform-db && docker volume rm offensive-security-platform_db_data 

echo 'taking down the rest'
docker-compose down --volumes --rmi all
docker rm authenticator db parent
docker rmi authenticator

echo "stopping authenticator container"
docker ps -a --filter "name=authenticator" --format "{{.ID}}" | xargs docker stop

echo 'removing authenticator image'
docker images --format '{{.Repository}}:{{.Tag}} {{.ID}}' | grep "authenticator" | awk '{print$2}' | xargs docker rmi --force

echo "stopping bootstrap container"
docker ps -a --filter "name=bootstrap" --format "{{.ID}}" | xargs docker stop

echo 'removing bootstrap image'
docker images --format '{{.Repository}}:{{.Tag}} {{.ID}}' | grep "bootstrap" | awk '{print$2}' | xargs docker rmi --force

echo "starting the containers"
docker-compose up db authenticator -d 
