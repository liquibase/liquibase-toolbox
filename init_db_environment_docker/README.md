This solution will potentially help when there is a need to spin up a database sandbox environment to evaluate Liquibase. <br>
Each script will spin up a docker container from a publicaly available docker image from https://hub.docker.com/

**Usage** <br>
```console
./create_<databse type>_container.sh <container_name>
```

**Example** <br>
```console
./create_sybase_container.sh mysybase_container
```

**Notes** <br>
If no argument provided, the script will assign a default name for the container. <br>
It is highly advised to go through the script before running it to make sure **what the script does during execution** (what docker image is being used, etc.). <br>
The scripts can be run on Windows when using GitBash for Windows or CygWin64 emulators. <br>
