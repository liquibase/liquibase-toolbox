#!/bin/bash
containerName="${1:-"mysybase"}"
docker run -d -p 8000:5000 -p 8001:5001 --name $containerName nguoianphu/docker-sybase
containerIp=`docker inspect $containerName | grep -m 1 -w IPAddress | grep -o '[[:digit:].]' | tr -d '\n'`
# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerName
echo "New container '${containerName}' created with ip address: ${containerIp}"
localIp="$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')"
docker update --restart unless-stopped $containerName
echo Creating databases 'dev, test, and prod'.  Please wait...
sleep 30
cwd=$(pwd)
docker run -v ${cwd}/../print_driver_name:/liquibase/changelog --rm liquibase/liquibase:latest --url=jdbc:jtds:sybase://${localIp}:8000/master --username=sa --password=myPassword --driver=net.sourceforge.jtds.jdbc.Driver --classpath=/liquibase/changelog/jtds-1.3.1.jar executeSql --sql="use master;disk resize name='master', size='80m';create database dev on master ='25M';create database test on master ='25M';create database prod on master ='25M'"
docker rmi liquibase/liquibase:latest
