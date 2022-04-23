This helper script converts any [changelog type](https://docs.liquibase.com/concepts/changelogs/working-with-changelogs.html) to formatted sql changelog.

Usage:

Bash/Linux:
```console
/path/to/convertToFormattedSql.sh <database type> <Reference Changelog> <Target Changelog>
```

Example:
```console
/path/to/convertToFormattedSql.sh 'postgresql' myReferenceChangelog.xml myTargetChangelog.sql
```
