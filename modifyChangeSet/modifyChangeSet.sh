# ./modifyChangeSet.sh /path/to/changelog.sql label author:id
EXAMPLE_COMMAND="./modifyChangeSet.sh /path/to/changelog.sql labelName author:id"

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

sed "/${3}/s/$/ labels:${2}/" ${1} > ${1}.temp
# mv ${1}.temp ${1}
