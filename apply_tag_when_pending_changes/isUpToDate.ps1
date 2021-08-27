Param ( $tag = 'version1')

$status=(liquibase status | Select-String -Pattern 'is up to date')

if ( $status -like '*is up to date*' ){
    Write-Output "echo Noting to update; no tag applied."
}
else {
    liquibase tag $tag
}
