#/path/to/rawToChangeLog.sh /path/to/plain_sql/folder /path/to/new/generated/<changeLog Name>.sql
changelogFile="${2:-"sample_changeLog.sql"}"
if [ -z "$1" ]
then
    tput setaf 2; echo "No argument provided. Please specify the path to your SQL files.
    For example: ./plainSqlToChangeLog.sh SampleSqlScripts/";tput sgr0
    exit 1
fi

echo '-- liquibase formatted sql' > $changelogFile;
i=0
find $1 -type f \( -iname "*.sql" ! -iname $changelogFile \) -print |sort -n| while read filename; do
    i=$((i+1))
    printf '%s\n' "-- changeset "author"$i:${filename}"
    cat "$filename"
    echo -e "\n-- rollback \n"
done >> $changelogFile

liquibase status --verbose
liquibase update
liquibase --changeLogFile=sample_changeLog.xml generateChangeLog
liquibase --changeLogFile=sample_changeLog.json generateChangeLog
liquibase --changeLogFile=sample_changeLog.yaml generateChangeLog