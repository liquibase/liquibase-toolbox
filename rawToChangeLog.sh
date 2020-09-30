#/path/to/rawToChangeLog.sh /path/to/plain_sql/folder /path/to/new/generated/<changeLog Name>.sql

echo '--liquibase formatted sql' > $2;
i=0
find $1 -type f \( -iname "*.sql" ! -iname $2 \) -print |sort -n| while read filename; do
    i=$((i+1))
    echo -e "\n--changeset "author"$i:${filename}"
    cat "$filename"
    echo -e "\n--rollback \n"
done >> $2