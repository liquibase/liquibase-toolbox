@echo off
set tag=%1
if "%tag%"=="" set tag="version1"

FOR /F "tokens=* USEBACKQ" %%F IN (`liquibase status`) DO ( SET status=%%F )

if "%status%"=="%status:is up to date=%" (
    liquibase tag $tag
) else (
    echo Noting to update; no tag applied.
)

