#!/bin/bash
containerName="${1:-"sql_server"}"
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Password123' -p 1433:1433 --name $containerName -d mcr.microsoft.com/mssql/server:2017-CU8-ubuntu
myIp=`docker inspect $containerName | grep -m 1 -w IPAddress | grep -o '[[:digit:].]' | tr -d '\n'`
# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerName
echo "New container '${containerName}' created with ip address: ${myIp}"
docker update --restart unless-stopped $containerName
echo "Adding new databases 'DEV, TEST, PROD'"
sleep 30

docker exec -i $containerName /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Password123 -Q 'CREATE DATABASE DEV;CREATE DATABASE TEST;CREATE DATABASE PROD;'
