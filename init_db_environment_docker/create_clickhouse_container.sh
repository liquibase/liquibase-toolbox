#!/bin/bash
containerName="${1:-"myclickhouse"}"
docker run --name $containerName -p 8123:8123 clickhouse/clickhouse-server
myIp=`docker inspect $containerName | grep -m 1 -w IPAddress | grep -o '[[:digit:].]' | tr -d '\n'`
# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerName
echo "New container '${containerName}' created with ip address: ${myIp}"
docker update --restart unless-stopped $containerName
echo "Adding new databases 'dev, test, prod'"
sleep 30

docker exec -it myclickhouse clickhouse-client --query="CREATE DATABASE dev"
docker exec -it myclickhouse clickhouse-client --query="CREATE DATABASE test"
docker exec -it myclickhouse clickhouse-client --query="CREATE DATABASE prod"
