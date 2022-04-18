#!/bin/bash
containerName="${1:-"myneo4j"}"
docker run \
     --name $containerName -p=7474:7474 -p=7687:7687 \
     -d \
     -v $HOME/neo4j/data:/data:z \
     -v $HOME/neo4j/logs:/logs:z \
     -v $HOME/neo4j/logs/import:/var/lib/import:z \
     -v $HOME/neo4j/plugins:/plugins:z \
     --env NEO4J_AUTH=neo4j/test \
     neo4j:latest

myIp=`docker inspect $containerName | grep -m 1 -w IPAddress | grep -o '[[:digit:].]' | tr -d '\n'`
echo "New container '${containerName}' created with ip address: ${myIp}"
