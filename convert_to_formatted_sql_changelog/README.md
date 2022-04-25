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

Common use-cases:
* A user might need a way to generate the SQL from modeled changes (XML,YAML or JSON) for review purposes in an offline mode.
* As a result of generating/converting a new formatted SQL changelog from a modeled changelog, the user can now run custom Quality Checks that only work for SQL (for example, [SqlUserDefinedPatternCheck](https://docs.liquibase.com/commands/quality-checks/getting-started-with-the-checks-command.html)).
