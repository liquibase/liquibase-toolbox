#!/bin/bash
# ./modifyChangeSet.sh /path/to/changelog.sql labelName author:id
EXAMPLE_COMMAND="./modifyChangeSet.sh /path/to/changelog.sql labelName author:id"
grep -q "\<$3\>" $1
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "ERROR: Unique identifier $3 doesn't exists."
    exit $retVal
fi

if [ -z "$1" ]
then
    tput setaf 2; echo "No argument provided. Please specify a path to a changelog.
    For example: $EXAMPLE_COMMAND";tput sgr0
    exit 1
elif [ -z "$2" ]
then
    tput setaf 2; echo "No argument provided. Please specify a changeset label.
    For example: $EXAMPLE_COMMAND";tput sgr0
    exit 1
elif [ -z "$3" ]
then
    tput setaf 2; echo "No argument provided. Please specify a changeset author:id.
    For example: $EXAMPLE_COMMAND";tput sgr0
    exit 1
fi

if [ $1 != *".sql" ]
then
    echo "ERROR: changelog '$1' can only be of SQL format.";
    exit 1
fi

if [[ $3 == *":"* ]]
then
    echo "Appending label '$2' to changelog: $1 and changeset: $3";
else
    echo "ERROR: changeset unique identifier '$3' is missing the key:value ':' operator.";
    exit 1
fi

sed "/${3}/s/$/ labels:${2}/" ${1} > ${1}.temp

# Uncomment below line to overwrite to current changelog with the temp file
# mv ${1}.temp ${1}
