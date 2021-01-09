#!/bin/bash
containerName="${1:-"yugabyte"}"
docker run -d --name $containerName -p5433:5433 yugabytedb/yugabyte:latest bin/yugabyted start --daemon=false
myIp=`docker inspect $containerName | grep -m 1 -w IPAddress | grep -o '[[:digit:].]' | tr -d '\n'`
# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerName
echo "New container '${containerName}' created with ip address: ${myIp}"
docker update --restart unless-stopped $containerName
echo "Adding new databases 'dev, test, prod'"
sleep 30

docker exec -i $containerName ysqlsh --command "CREATE DATABASE dev"
echo 'dev'
docker exec -i $containerName ysqlsh --command "CREATE DATABASE test"
echo 'test'
docker exec -i $containerName ysqlsh --command "CREATE DATABASE prod"
echo 'prod'
docker exec -i $containerName ysqlsh --command "CREATE USER user1 WITH PASSWORD 'password'"
echo "User: "user1" created with Password: "password""
echo "GRANT ALL to user1 for "yugabyte,dev,test and prod" databases..."
docker exec -i $containerName ysqlsh --command "GRANT ALL ON DATABASE yugabyte TO user1"
docker exec -i $containerName ysqlsh --command "GRANT ALL ON DATABASE dev TO user1"
docker exec -i $containerName ysqlsh --command "GRANT ALL ON DATABASE test TO user1"
docker exec -i $containerName ysqlsh --command "GRANT ALL ON DATABASE prod TO user1"
