#!/bin/bash
containerName="${1:-"mysqldb"}"
docker run -p 3306:3306 --name $containerName -e MYSQL_ROOT_PASSWORD=password -d mysql
myIp=`docker inspect $containerName | grep -m 1 -w IPAddress | grep -o '[[:digit:].]' | tr -d '\n'`
# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerName
echo "New container '${containerName}' created with ip address: ${myIp}"
docker update --restart unless-stopped $containerName
echo "Adding new databases 'DEV, TEST, PROD'"
sleep 30

docker exec -i $containerName mysql --user=root --password=password -e "use sys; create database DEV; create database TEST; create database PROD;"
