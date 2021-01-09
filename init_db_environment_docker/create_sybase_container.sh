#!/bin/bash
containerName="${1:-"mysybase"}"
docker run -d -p 8000:5000 -p 8001:5001 --name $containerName nguoianphu/docker-sybase
myIp=`docker inspect $containerName | grep -m 1 -w IPAddress | grep -o '[[:digit:].]' | tr -d '\n'`
# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerName
echo "New container '${containerName}' created with ip address: ${myIp}"
docker update --restart unless-stopped $containerName
echo Creating databases 'dev, test, and prod'.  Please wait...
sleep 30
liquibase executeSql --url=jdbc:jtds:sybase://localhost:8000/master --username=sa --password=myPassword --driver=net.sourceforge.jtds.jdbc.Driver --classpath=/root/Drivers/jtds-1.3.1.jar --sql="use master;disk resize name='master', size='80m';create database dev on master ='25M';create database test on master ='25M';create database prod on master ='25M'"
