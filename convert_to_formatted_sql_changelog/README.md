This helper script converts any [changelog type](https://docs.liquibase.com/concepts/changelogs/working-with-changelogs.html) to formatted sql changelog.
You can find your database type name [here](https://www.liquibase.org/get-started/databases) along with Liquibase supported databases.

Usage:

Bash/Linux:
```console
/path/to/convertToFormattedSql.sh <database type> <Reference Changelog> <Target Changelog>
```

Example:
```console
/path/to/convertToFormattedSql.sh postgresql myReferenceChangelog.xml myTargetChangelog.sql
```
