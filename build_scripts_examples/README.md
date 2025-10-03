<p align="left">
  <img src="img/liquibase.png" alt="Liquibase Logo" title="Liquibase Logo" width="324" height="72">
</p>

# 🚀 Liquibase in Automation
This repository provides examples of running Liquibase Secure (formerly Liquibase Pro) within different automation platforms. [Get Liquibase.](https://www.liquibase.com/download-secure)

# 🔧 Included Examples
* [Ansible Tower](Ansible_Tower/liquibase_playbook.yml)  
* [AWS CodeBuild](AWS_CodeBuild/buildspec.yml)  
* [Azure DevOps](Azure_DevOps/azure_pipelines_docker.yml)  
* [Bitbucket](Bitbucket/bitbucket-pipelines.yml)  
* [CircleCI](CircleCI/config.yml)  
* [GitHub Actions](GitHub_Actions/liquibase_workflow.yml)  
* [GitLab](GitLab/gitlab-ci.yml)  
* [Jenkins](Jenkins/Jenkinsfile) 

# 📋 Methodology
Each pipeline follows these steps:
1. Check out the repository
1. Run the Liquibase flow using Docker
1. Commit and push updates to the repository

**Notes:**
* Some pipelines use a personal access token (e.g., GitHub Actions) to enable read/write access. Update the repository configuration and credentials to match your environment.
* Reports and logs can be delivered to a shared network location, email distribution list, or S3 bucket using our [Secure extension](https://docs.liquibase.com/secure/integration-guide-5-0/how-to-connect-liquibase-to-amazon-s3).

# 💡 Assumptions
* Pipelines are reviewed and updated before execution
* Only Liquibase Secure features are used
* [Docker](https://hub.docker.com/r/liquibase/liquibase-secure) container utilized
* Source control is git based
* Local agents/runners are used where specified
* All required environment variables are defined in the pipeline or configuration file
* Credentials are retrieved from a secure location

# ⚠️ Required Environment Variables
These environment variables must be set before running Liquibase.  
When using the Liquibase Docker container, pass them in at runtime.  
When running locally, set them in your shell or environment before invocation.
| Variable | Secret | Description |
|----------|   :---:   |------------|
| LIQUIBASE_COMMAND_CHANGELOG_FILE | | The changelog file to process. Typically, a root file is invoked which includes other changelog files. [Documentation](https://docs.liquibase.com/secure/user-guide-5-0/what-is-a-changelog)
| LIQUIBASE_COMMAND_URL | x | The JDBC URL of the target database.
| LIQUIBASE_COMMAND_USERNAME | x | The user ID for the target database.
| LIQUIBASE_COMMAND_PASSWORD | x | The user password for the target database.
| LIQUIBASE_LICENSE_KEY | x | A valid Liquibase license key.
| LIQUIBASE_SEARCH_PATH | | Where Liquibase searches for files. [Documentation](https://docs.liquibase.com/reference-guide/parameters/search-path)

# ⚠️ Required Files
The following files must be present in the source repository for the pipelines to run successfully.
| File name | Description | Documentation
|----------|------------|-------------|
| changelog.main.xml | Root changelog file | https://docs.liquibase.com/secure/user-guide-5-0/what-is-a-changelog
| liquibase.flowfile.yaml | Flow file | https://docs.liquibase.com/secure/user-guide-5-0/what-is-a-flow-file
| liquibase.checks-settings.conf | Policy checks configuration | https://docs.liquibase.com/secure/user-guide-5-0/what-are-policy-checks

To create the initial policy checks file:
```
liquibase checks show
```

# ☎️ Contact Liquibase
Liquibase sales: https://www.liquibase.com/contact-us<br>
Liquibase support: https://support.liquibase.com