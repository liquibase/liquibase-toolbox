#!/bin/bash

# Dynamic list of schema names
# To read schema names from the SQL filenames, run the following:
#LBSCHEMANAMES=$(ls SQLFILES/ | grep -o "_.*.sql" | sed "s/_//g" | sed -e "s/\.sql//g" | xargs -n1 | sort -u | xargs)

# Fixed list of schema names
LBSCHEMANAMES="ATEST BTEST CTEST"

for LBSCHEMA in $LBSCHEMANAMES
do
    echo "Running against $LBSCHEMA"
    #liquibase --liquibaseSchemaName=$LBSCHEMA --contexts=$LBSCHEMA validate
    liquibase --liquibaseSchemaName=$LBSCHEMA --contexts=$LBSCHEMA status --verbose
    #liquibase --liquibaseSchemaName=$LBSCHEMA --contexts=$LBSCHEMA tag version1
    #liquibase --liquibaseSchemaName=$LBSCHEMA --contexts=$LBSCHEMA updateSQL
    liquibase --liquibaseSchemaName=$LBSCHEMA --contexts=$LBSCHEMA update
    #liquibase --liquibaseSchemaName=$LBSCHEMA --contexts=$LBSCHEMA rollback version1
done
