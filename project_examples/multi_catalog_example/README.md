# multi_catalog_example
This project example is for SQL Server Multi-Catalog (Database) setup. </br>
Each subfolder name (ev1, ev2, ev3 and ev4) are based on databases. In this case, ev* are names of target databases in a single SQL Server instance. </br>
The driver script is liquibase_commands.sh. </br>
This script sets up comma-separated names of databases, then sets up Liquibase environment variables, then loops through the list of databases to perform one or more Liquibase operations.
