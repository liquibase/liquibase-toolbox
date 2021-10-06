# multi_schema_example
Please keep in mind the following:
1. This is a Liquibase Oracle project but can easily become another database platform with some adjustments to the scripts.
2. The <b>liquibase.properties</b> will need to be completed with the right information for the different properties.
3. Prior to running the <span style="color:red"><b>with_prefixed_schemaname/update_prefixed_multi_schemas.sh</b></span> script make sure to do the following:<br />
  a. Please keep in mind that Liquibase will combine a schema list by a fixed list.<br />
  b. Or by parsing the schemanames from the filenames (if uncommenting line 5).<br />
  c. Each SQL file (also a formatted SQL changelog) will need to have a <b>context</b> changeset attribute with the specific <b>schema name</b> associated with the SQL script, so Liquibase will know to what schema should maintain the <b>Liquibase tracking tables</b> for.<br />
4. Prior to running the <span style="color:blue"><b>without_prefixed_schemaname/update_not_prefixed_multi_schemas.sh</b></span> script make sure to do the following:<br />
  a. Please keep in mind that Liquibase will combine a schema list by a fixed list provided as an argument.  For example: <b>./update_not_prefixed_multi_schemas.sh "ATEST BTEST CTEST"</b><br />
  b. Each SQL file (also a formatted SQL changelog) will need to have a <b>context</b> changeset attribute with the specific <b>schema name/s</b> associated with the SQL script, so Liquibase will know to what <b>schema</b> to update.<br />
5. This example is using a master changelog "main.xml" with an <b>includeAll</b> tag pointing to a folder SQLFILES containing the SQL files.<br />
