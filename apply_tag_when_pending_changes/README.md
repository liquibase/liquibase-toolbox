To prevent tagging (liquibase tag &lt;tagname&gt;) to overwrite previous tags when there are no changes to deploy, the script will only apply a tag after verifying that there are pending changes.

Usage:

CMD/Windows
call isUpToDate.bat [tag name parameter]

Powershell/Windows
.\isUpToDate.ps1

Bash/Linux
./isUpToDate.sh
