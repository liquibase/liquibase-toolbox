#!bin/bash
cwd=$(pwd)
export LIQUIBASE_COMMAND_USERNAME="admin"
export LIQUIBASE_COMMAND_PASSWORD="password"
export LIQUIBASE_COMMAND_URL="jdbc:h2:mem:liquibase_${ENVIRONMENT_STEP}"
export LIQUIBASE_PRO_LICENSE_KEY="<paste LB Pro key here>"
export LIQUIBASE_COMMAND_CHANGELOG_FILE="changeLog.h2.sql"
