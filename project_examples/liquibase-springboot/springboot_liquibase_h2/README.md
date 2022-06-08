This is a sample Liquibase project runnning Liquibase with [Springboot and Maven](https://docs.liquibase.com/tools-integrations/springboot/using-springboot-with-maven.html)

To run database changes against different data sources, you can use a profile to manage the database setup (see profile examples in the POM).
For example for profile id `DB3` run:
```shell
mvn liquibase:update -PDB3
```
