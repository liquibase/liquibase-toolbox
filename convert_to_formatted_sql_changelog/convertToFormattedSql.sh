# !bin/bash
if [ -z $1 ] 
then echo "
Database type was not set.  For example:
/path/to/convertToFormattedSql.sh 'postgresql' myReferenceChangelog.xml myTargetChangelog.sql
" & exit 1 
fi

if [ -z $2 ] 
then echo "
Reference changelog was not set.  That is the changelog you wish to convert. For example:
/path/to/convertToFormattedSql.sh postgresql 'myReferenceChangelog.xml' myTargetChangelog.sql
" & exit 1 
fi

if [ -z $2 ] 
then echo "
Reference changelog was not set.  That is the changelog you wish to convert. For example:
/path/to/convertToFormattedSql.sh postgresql 'myReferenceChangelog.xml' myTargetChangelog.sql
" & exit 1 
fi

if [ -z $3 ] 
then echo "
Target changelog was not set.  That is the changelog you wish to create. For example:
/path/to/convertToFormattedSql.sh postgresql myReferenceChangelog.xml 'myTargetChangelog.sql'
" & exit 1 
fi

if [ ! -f $2 ]
then
    echo "Target ChangeLog '$2' does not exist" & exit 1
fi

databaseType="$1"
referenceChangeLog="$2"
targetChangeLog="$3"
echo "-- liquibase formatted sql" >> $targetChangeLog
liquibase --url=offline:$databaseType --changeLogFile=$referenceChangeLog updateSQL | grep -iv DATABASECHANGELOG.* | sed -r 's/::/:/g' | sed -r "s/${referenceChangeLog}://g" >> $targetChangeLog
echo "New '${targetChangeLog}' changelog file was created"
# rm databasechangelog.csv
