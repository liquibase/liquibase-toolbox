The **test_liquibase_docker_container.sh** script tests liquibase docker image https://hub.docker.com/r/liquibase/liquibase

Usage

For optional parameters, you can try: 
```console
/path/to/test_liquibase_docker_container.sh &lt;docker tag name&gt; &lt;path to changelog&gt; &lt;'liquibase flags'&gt; &lt;liquibase command&gt;
For example: /path/to/test_liquibase_docker_container.sh latest ./CLI-Projects/H2/myChangeLog.xml '--url=jdbc:h2:file:./h2tutorial --username=admin --password=password' update```

```console
/path/to/test_liquibase_docker_container.sh latest ./CLI-Projects/H2/myChangeLog.xml --defaultsFile=changelog/liquibase.properties update
```

**Notes**
This solution is only compatible on Linux/Unix at the moment.
