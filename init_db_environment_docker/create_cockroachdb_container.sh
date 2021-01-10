#!/bin/bash
containerName="${1:-"roach"}"
#docker network create -d bridge roachnet
docker run -d --name=$containerName --hostname=roach -p 26257:26257 -p 8080:8080 cockroachdb/cockroach:v20.2.3 start --insecure --join=roach
containerIp=`docker inspect $containerName | grep -m 1 -w IPAddress | grep -o '[[:digit:].]' | tr -d '\n'`
# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerName
echo "New container '${containerName}' created with ip address: ${containerIp}"
docker update --restart unless-stopped $containerName
docker exec -it $containerName ./cockroach init --insecure
echo creating dev, test and prod databases.  Please wait...
sleep 10
localIp="$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')"
#docker exec -it roach ./cockroach sql --insecure
docker run --rm liquibase/liquibase:latest --url=jdbc:postgresql://${localIp}:26257/postgres --username=root --password=password executeSql --sql="CREATE DATABASE dev;CREATE DATABASE test;CREATE DATABASE prod;"
docker rmi liquibase/liquibase:latest