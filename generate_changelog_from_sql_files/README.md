This solution will help with situations where users need to take their existing SQL files and turn them into a Liquibase changelog.

Usage:
```script
./plainSqlToChangeLog.sh /path/to/plain_sql/folder /path/to/new/generated/<changeLog Name>.sql
```
Or for Oracle SQL Plus SQL files
```script
./plainSqlToSqlPlusChangeLog.sh /path/to/plain_sql/folder /path/to/new/generated/<changeLog Name>.sql
```
**Note**

To run the shell scripts on Windows, install GitBash for Windows or CygWin64
