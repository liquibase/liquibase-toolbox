#!/bin/bash
containerName="${1:-"mymaxdb"}"
docker run --name $containerName -d -p 9776:9776 integra/maxdb-provider
myIp=`docker inspect $containerName | grep -m 1 -w IPAddress | grep -o '[[:digit:].]' | tr -d '\n'`
#docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerName
echo "New container '${containerName}' created with ip address: ${myIp}"
echo "Adding new databases 'DEV,TEST,PROD'"
docker update --restart unless-stopped $containerName
# sleep 30
# docker exec -i $containerName cqlsh $myIp -e "
# CREATE KEYSPACE ${keySpaceName}
#   WITH REPLICATION = { 
#    'class' : 'SimpleStrategy', 
#    'replication_factor' : 1 
#   }
# "
