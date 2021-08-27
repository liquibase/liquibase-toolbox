To prevent tagging (liquibase tag &lt;tagname&gt;) to overwrite previous tags when there are no changes to deploy, the script will only apply a tag after verifying that there are pending changes.

Usage:

CMD/Windows: 
```console
call isUpToDate.bat [tag name parameter]

Powershell/Windows: <br>
.\isUpToDate.ps1 [tag name parameter]

Bash/Linux: <br>
./isUpToDate.sh [tag name parameter]
```
