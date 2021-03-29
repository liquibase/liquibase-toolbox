# Starter pipeline
# Start with a minimal pipeline that you can customize to build and deploy your code.
# Add steps that build, run tests, deploy, and more:
# https://aka.ms/yaml

trigger:
- none

pool:
  name: 'Default'

variables:
  appname: MyApp
  version: $(Build.BuildId)

steps:

- script: |
    whoami
    echo $(System.DefaultWorkingDirectory)
    liquibase --version
  displayName: 'Run Prechecks'

- script: |
    echo "Using liquibase updateSQL command"
    liquibase --url=$(URL) --username=$(USER_NAME) --password=$(PASSWORD) --classpath=path/to/driver/jdbc.jar --changeLogFile=changeLog.sql updateSQL
  displayName: 'Running Liquibase updateSQL command' 

- script: |
    echo "Using liquibase update command"
    liquibase --url=$(URL) --username=$(USER_NAME) --password=$(PASSWORD) --classpath=path/to/driver/jdbc.jar --changeLogFile=changeLog.sql update
  displayName: 'Running Liquibase update command'

- script: |
    echo "Using liquibase rollbackCount command"
    liquibase --url=$(URL) --username=$(USER_NAME) --password=$(PASSWORD) --classpath=path/to/driver/jdbc.jar --changeLogFile=changeLog.sql rollbackCount 3
  displayName: 'Running Liquibase rollback command'


- script: |
    echo "Zipping Files"
    zip -q -r $(appname)-$(Build.BuildId).zip *
  displayName: 'Zipping Artifact'

- script: |
    mkdir $(System.DefaultWorkingDirectory)\artifacts
    copy "$(appname)-$(Build.BuildId).zip" "$(System.DefaultWorkingDirectory)\artifacts"
  displayName: 'Copy zip to Azure Artifacts'


- upload: $(System.DefaultWorkingDirectory)\artifacts\$(appname)-$(Build.BuildId).zip
  artifact: MyApp
