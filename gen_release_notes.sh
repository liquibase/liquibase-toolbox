changeLogFile=$(liquibase status --verbose | grep -m 1 ".*::" | sed 's/:.*/ /g' | sed 's/ //g')
changeSets=$(liquibase status --verbose | grep -o "::.*" | sed 's/:/ /g' | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' | tr -s '[:blank:]' ':')

echo "changeLog file: $changeLogFile" > release_notes.txt

for changeSet in $changeSets
do
    echo "******************************" >> release_notes.txt
    comment=$(cat "$changeLogFile"  | grep -A 1 "$changeSet")
    echo "$comment" >> release_notes.txt
done
