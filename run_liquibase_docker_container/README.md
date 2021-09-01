The **test_liquibase_docker_container.sh** script eases the experience using liquibase docker image https://hub.docker.com/r/liquibase/liquibase

**Usage** <br>

For optional parameters, you can try: <br>
```console
/path/to/test_liquibase_docker_container.sh <docker tag name> <path to changelog> <'liquibase flags'> <liquibase command>
For example: /path/to/test_liquibase_docker_container.sh latest ./CLI-Projects/H2/myChangeLog.xml '--url=jdbc:h2:file:./h2tutorial --username=admin --password=password' update
```

For defaults file parameter, you can try: <br>
```console
/path/to/test_liquibase_docker_container.sh latest ./CLI-Projects/H2/myChangeLog.xml --defaultsFile=changelog/liquibase.properties update
```

**Notes** <br>
This solution is only compatible on Linux/Unix at the moment.
