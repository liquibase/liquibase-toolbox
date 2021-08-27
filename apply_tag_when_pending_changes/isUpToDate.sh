#!/bin/bash

tag="${1:-"version1"}"

status=$(liquibase status | grep "is up to date")

if [[ $status == *'is up to date'* ]]
then
    echo "Noting to update; no tag applied."
else
    liquibase tag $tag
fi
