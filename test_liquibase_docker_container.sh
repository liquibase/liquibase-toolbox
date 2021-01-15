#!/bin/bash
version="${1:-"latest"}"
cwd=$(pwd)
if [ -z "$2" ]
then
      tput setaf 2;echo "For optional parameters, you can try: /path/to/test_liquibase_docker_container.sh <docker tag name> <path to changelog> <'liquibase flags'> <liquibase command>
For example: /path/to/test_liquibase_docker_container.sh latest ./CLI-Projects/H2/myChangeLog.xml '--url=jdbc:h2:file:./h2tutorial --username=admin --password=password' updateSQL
or
/path/to/test_liquibase_docker_container.sh latest ./CLI-Projects/H2/myChangeLog.xml --defaultsFile=changelog/liquibase.properties updateSQL";tput sgr0
      mkdir ./docker_changelogs
      echo -e "-- liquibase formatted sql\n\n-- changeset Tsvi:123\nCREATE TABLE CUSTOMER (ID INT NOT NULL, NAME VARCHAR(50) NOT NULL, AGE INT, LASTNAME VARCHAR(50) NOT NULL, YEAR INT NOT NULL, CONSTRAINT PK_CUSTOMER PRIMARY KEY (ID, YEAR));\n--rollback DROP TABLE CUSTOMER;" > ./docker_changelogs/changeLog.h2.sql
      changelogPath="./docker_changelogs/changeLog.h2.sql"
else
    if [[ ${2:0:2} = "./" ]] 
    then
        changelogPath="${2}"
    else
        echo "Please specify a relative path of lower depth to your changelog.  For example: './docker_changelogs/changeLog.h2.sql'"
        exit 1
    fi
fi

PARAMS="${3:-"--url="jdbc:h2:mem:liquibase_dev" --username=admin --password=password"}"
liquibase_command="${4:-"status --verbose"}"
changelogFile="$(basename ${changelogPath})"
BASE_DIRECTORY=$(echo "$changelogPath" | cut -d "/" -f2)
FOLDER_PATH=$(echo "${changelogPath}" | sed "s/${changelogFile}//g" | sed "s/\.//g")

docker_command="docker run --rm -v "${cwd}"${FOLDER_PATH}:/liquibase/changelog:Z liquibase/liquibase:${version} --changeLogFile=changelog/${changelogFile} $PARAMS"

$docker_command $liquibase_command


rm -rf docker_changelogs
echo "removing liquibase/liquibase:${version} image..."
docker rmi liquibase/liquibase:${version}