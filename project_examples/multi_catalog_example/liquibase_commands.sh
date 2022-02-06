set -e
if [ -z "$1" ]; then echo "No tag provided.  Please provide a tag when running the script."; echo  "For example: ./liquibase_commands.sh version1"; exit 1; fi
RED='\033[0;31m'
NC='\033[0m' # No Color
DATABASES=ev1,ev2,ev3,ev4

export LIQUIBASE_COMMAND_USERNAME="<username>"
export LIQUIBASE_COMMAND_PASSWORD="<password>"
export LIQUIBASE_CLASSPATH="<path/to/mssql-jdbc-version.jar>"
export LIQUIBASE_PRO_LICENSE_KEY="<paste Liquibase Pro License key here>"
export LIQUIBASE_HUB_MODE=off

for i in ${DATABASES//,/ }
do

    printf "${RED}***** DATABASE=${i} *******${NC}\n"
    export LIQUIBASE_COMMAND_URL="jdbc:sqlserver://<hostname>:<port#>;databaseName=${i}"
    export LIQUIBASE_COMMAND_CHANGELOG_FILE="${i}_changelog.xml"
    export LB_ARGS="--url=${LIQUIBASE_COMMAND_URL} --username=${LIQUIBASE_COMMAND_USERNAME} --password=${LIQUIBASE_COMMAND_PASSWORD} --changeLogFile=${LIQUIBASE_COMMAND_CHANGELOG_FILE} --liquibaseProLicenseKey=${LIQUIBASE_PRO_LICENSE_KEY} --classpath=${LIQUIBASE_CLASSPATH}"

    # liquibase ${LB_ARGS} status --verbose
    # liquibase ${LB_ARGS} tag ${1}
    # liquibase ${LB_ARGS} update
    # liquibase ${LB_ARGS} history
    # liquibase ${LB_ARGS} rollback ${1}
    # liquibase ${LB_ARGS} history

done