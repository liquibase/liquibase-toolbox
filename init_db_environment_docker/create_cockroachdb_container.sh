#!/bin/bash
containerName="${1:-"roach"}"
#docker network create -d bridge roachnet
docker run -d --name=$containerName --hostname=roach -p 26257:26257 -p 8080:8080 cockroachdb/cockroach:v20.2.3 start --insecure --join=roach
myIp=`docker inspect $containerName | grep -m 1 -w IPAddress | grep -o '[[:digit:].]' | tr -d '\n'`
# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerName
echo "New container '${containerName}' created with ip address: ${myIp}"
docker update --restart unless-stopped $containerName
docker exec -it $containerName ./cockroach init --insecure
echo creating dev, test and prod databases.  Please wait...
sleep 10
#docker exec -it roach ./cockroach sql --insecure
cd ~/CLI-Projects/CockroachDB
liquibase --url=jdbc:postgresql://localhost:26257/postgres executeSql --sql="CREATE DATABASE dev;CREATE DATABASE test;CREATE DATABASE prod;"

