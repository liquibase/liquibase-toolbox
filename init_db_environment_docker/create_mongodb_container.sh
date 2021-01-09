#!/bin/bash
containerName="${1:-"mymongodb"}"
docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=mongoAdmin -e MONGO_INITDB_ROOT_PASSWORD=password --name $containerName mongo
myIp=`docker inspect $containerName | grep -m 1 -w IPAddress | grep -o '[[:digit:].]' | tr -d '\n'`
# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerName
echo "New container '${containerName}' created with ip address: ${myIp}"
docker update --restart unless-stopped $containerName
echo "Listing current databases:"
sleep 30

docker exec -i $containerName mongo -u "mongoAdmin" -p "password" HOSTIP --authenticationDatabase "admin" --eval 'db.adminCommand( { listDatabases: 1 } )'
