To make the download/upgrade process easier for Linux/Unix headless machines, you can use the following scripts programatically.

**download_liquibase.sh**
This script will download the Liquibase zip folder and unzip it.  
It will download Liquibase latest version unless specified differently using an argument.

**update_liquibase.sh**
This script will download the Liquibase zip folder and unzip it in your home directory (~ path).
It will download Liquibase latest version unless specified differently using an argument.
[ Warning ] - The script will replace/overwrite an existing 'liquibase' directory in the home directory. 

Usage:

**download_liquibase.sh:**
```console
./download_liquibase.sh [version #]
```
Or for latest version no need to provide an argument.
```console
./download_liquibase.sh
```

**update_liquibase.sh:**
```console
./update_liquibase.sh [version #]
```
Or for latest version no need to provide an argument.
```console
./update_liquibase.sh
```
