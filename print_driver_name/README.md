**The challenge** <br>
For some database platforms and JDBC drivers, the class name will be needed for the Liquibase Driver property.

**The solution** <br>
The script **printDriver.sh** will help finding out what the driver class name for a specific JDBC jar file.

**Usage** <br>
./printDriver.sh &lt;jdbc driver name&gt;.jar

**Notes** <br>
The scripts can be run on Windows when using GitBash for Windows or CygWin64 emulators.
