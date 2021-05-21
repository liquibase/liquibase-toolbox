#!/bin/bash
containerName="${1:-"myoracle_11g"}"
docker run -e ORACLE_CHARACTERSET=AL32UTF8 -d -p 49161:1521 --name $containerName oracleinanutshell/oracle-xe-11g
myIp=`docker inspect $containerName | grep -m 1 -w IPAddress | grep -o '[[:digit:].]' | tr -d '\n'`
# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerName
echo "New container '${containerName}' created with ip address: ${myIp}"
docker update --restart unless-stopped $containerName
echo "
hostname: localhost
port: 49161
sid: xe
username: system
password: oracle
"
echo "Please wait until the database creation is finished"
sleep 30