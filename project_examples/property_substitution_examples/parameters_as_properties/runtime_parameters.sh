#!/bin/bash

export JAVA_OPTS=-Dliquibase.hub.mode=off

# running the first set of properties from defaults file "1st_set.properties"
# printing and confirming values with updateSQL
liquibase --defaultsFile=1st_set.properties updateSQL
liquibase --defaultsFile=1st_set.properties update

# running the second set of properties from defaults file "2st_set.properties"
# printing and confirming values with updateSQL
liquibase --defaultsFile=2st_set.properties updateSQL
liquibase --defaultsFile=2st_set.properties update

# running a set of runtime parameters as "-Dparameter_name=parameter_value" in the command line instead of a properties file
# printing and confirming values with updateSQL
FORMAT=json
liquibase --url=jdbc:h2:mem:liquibase --changeLogFile=${FORMAT}_changelogs/test_variables1.${FORMAT} updateSQL -Dtable.name=myTable3 -DmySpecialValue=CHAR\(10\)
liquibase --url=jdbc:h2:mem:liquibase --changeLogFile=${FORMAT}_changelogs/test_variables1.${FORMAT} update -Dtable.name=myTable3 -DmySpecialValue=CHAR\(10\)
