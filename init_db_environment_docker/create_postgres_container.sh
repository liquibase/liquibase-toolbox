#!/bin/bash
containerName="${1:-"mypostgres"}"
docker run --name $containerName -e POSTGRES_PASSWORD=password -p 5432:5432 -d postgres
myIp=`docker inspect $containerName | grep -m 1 -w IPAddress | grep -o '[[:digit:].]' | tr -d '\n'`
# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerName
echo "New container '${containerName}' created with ip address: ${myIp}"
docker update --restart unless-stopped $containerName
echo "Adding new databases 'dev, test, prod'"
sleep 30

docker exec -i $containerName psql -U postgres -d postgres --command "CREATE DATABASE dev;";echo 'dev'
docker exec -i $containerName psql -U postgres -d postgres --command "CREATE DATABASE test;";echo 'test'
docker exec -i $containerName psql -U postgres -d postgres --command "CREATE DATABASE prod;";echo 'prod'
