#!/bin/bash
containerName="${1:-"mydb2"}"
docker run -itd --name $containerName --privileged=true -p 50000:50000 -e LICENSE=accept -e DB2INST1_PASSWORD=password -e DBNAME=testdb ibmcom/db2
myIp=`docker inspect $containerName | grep -m 1 -w IPAddress | grep -o '[[:digit:].]' | tr -d '\n'`
# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerName
echo "New container '${containerName}' created with ip address: ${myIp}"
docker update --restart unless-stopped $containerName
echo "Please wait (about 60 seconds) until the 'TESTDB' database finishes getting configured..."
sleep 60

tput setaf 2;echo "To create more databases, follow the steps/commands below:
docker exec -ti mydb2 bash -c "su - db2inst1"
db2
CREATE DATABASE <DATABASE NAME>
ACTIVATE DATABASE <DATABASE NAME>
QUIT
exit";tput sgr0

