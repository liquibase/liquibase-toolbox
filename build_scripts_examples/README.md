<p align="left">
  <img src="img/liquibase.png" alt="Liquibase Logo" title="Liquibase Logo" width="324" height="72">
</p>

This repository contains working examples of Liquibase running with various automation tools.

# Updated Examples

| Automation Tool |
|----------|
| [Ansible](Ansible_Tower/liquibase_playbook.yml)|
| [Azure DevOps](ADO/azure_pipelines_docker.yml)|
| [Bitbucket](Bitbucket/bitbucket-pipelines.yml) |
| [CircleCI](CircleCI/config.yml) |
| [CodeBuild (Amazon Web Services)](CodeBuild/buildspec.yml) |
| [GitHub Actions](GitHub_Actions/liquibase_workflow.yml) |
| [GitLab](GitLab_CICD_Pipelines/gitlab-ci.yml) |
| [Jenkins](Jenkins/Jenkinsfile) |

# Methodology
Each pipeline will perform the following steps:
1. Checkout repository
1. Execute Liquibase flow via Docker
1. Update respository

Note for some pipelines, a personal access token was used to provide read/write access to the repository (e.g., GitHub Actions). The repository and access will have to be updated prior to use in your environment.

# Assumptions
* Pipelines must be reviewed and updated prior to use
* Pro-only features utilized
* Docker container utilized (https://hub.docker.com/r/liquibase/liquibase)
* Git based repository utilized
* Local agents/runners utilized where noted
* Required environment variables defined in configuration file or pipeline itself
* Credentials pulled from secure location

# Required Environment Variables
The following environment variables must be defined and passed in to the Liquibase Docker container. If running Liquibase locally, these need to be set prior to invocation.
| Variable | Secret | Description |
|----------|   :---:   |------------|
| LIQUIBASE_SEARCH_PATH | | The root directory where Liquibase files are stored.
| LIQUIBASE_COMMAND_CHANGELOG_FILE | | The changelog file to process. Typically, a main file is invoked which calls other changelog files. https://docs.liquibase.com/concepts/changelogs/home.html
| LIQUIBASE_COMMAND_TAG | | A unique identifier to tag the database. By default, the pipeline build/job number is used.
| LIQUIBASE_COMMAND_URL | x | The JDBC URL of the target database.
| LIQUIBASE_COMMAND_USERNAME | x | The user ID for the target database.
| LIQUIBASE_COMMAND_PASSWORD | x | The user password for the target database.
| LIQUIBASE_LICENSE_KEY | x | A valid Liquibase license key.
| LB_BASE_DIR | | The directory where Liquibase will write files.
| LB_ENVIRONMENT | | The environment the pipeline is running against (e.g., DEV, TEST, PROD). By default, diff and snapshot files are created with this variable in the name.


# Required Files
The following files must be located in the source code repository for these pipelines to execute successfully.
| File name | Description | Documentation
|----------|------------|-------------|
| changelog.main.xml | Main changelog file | https://docs.liquibase.com/concepts/changelogs/home.html
| liquibase.flowfile.yaml | Flow file | https://docs.liquibase.com/commands/flow/flow.html
| liquibase.checks-settings.conf | Quality checks configuration | https://docs.liquibase.com/commands/quality-checks/home.html

To create the initial quality checks file:
```
liquibase checks show
```

# Contact Liquibase
#### Liquibase sales: https://www.liquibase.com/contact
#### Liquibase support: https://support.liquibase.com/knowledge