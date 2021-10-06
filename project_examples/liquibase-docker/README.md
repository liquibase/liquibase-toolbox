## This is a sample Liquibase project runnning Liquibase with Docker in automation

## Usage:

### The build_scripts_examples folder.
#### Jenkins setup
Sample Jenkinsfile (currently Linux example only). The file can be refrenced as pipline in a Jenkins job.
Sample shell script (in the root folder) `exp_lb_env_vars_h2.sh` to set [Liquibase Pro Environment Variables](https://www.liquibase.com/blog/liquibase-environment-variables-control-deployments) to be used with Docker.


#### Github actions setup
Sample github_actions_workflow_example.yml you can place in your .github/workflows github repository to run the workflow example.

