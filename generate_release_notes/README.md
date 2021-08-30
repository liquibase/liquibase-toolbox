This solution will generate release notes related to each of the pending changesets prior to running in production.

**How to:**
For each changeset a description will be given in the --comment section (please see a **sample_changeLog.sql** file example).
Before running an update in production, the script will be run and will write all the comments from the pending changesets into a release notes form.

Usage:
```console
./gen_release_notes.sh [<changelog_name>.sql]
```

**Notes**
* This solution will only work with formatted SQL changeLogs currently.
* This solution will only work with MacOS and Linux.
