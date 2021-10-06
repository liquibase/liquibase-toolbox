#!/bin/bash

# List of schema names
LBSCHEMANAMES="${1:-"ATEST BTEST CTEST"}"

for LBSCHEMA in $LBSCHEMANAMES
do
    echo "Running against $LBSCHEMA"
    #liquibase --defaultSchemaName=$LBSCHEMA --contexts=$LBSCHEMA validate
    liquibase --defaultSchemaName=$LBSCHEMA --contexts=$LBSCHEMA status --verbose
    #liquibase --defaultSchemaName=$LBSCHEMA --contexts=$LBSCHEMA tag version1
    #liquibase --defaultSchemaName=$LBSCHEMA --contexts=$LBSCHEMA updateSQL
    liquibase --defaultSchemaName=$LBSCHEMA --contexts=$LBSCHEMA update
    #liquibase --defaultSchemaName=$LBSCHEMA --contexts=$LBSCHEMA rollback version1
done
