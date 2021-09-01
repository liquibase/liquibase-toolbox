**The challenge**
For some database platforms and JDBC drivers, the class name will be needed for the Liquibase Driver property.

**The solution**
The script **printDriver.sh** will help finding out what the driver class name for a specific JDBC jar file.

**Usage**
./printDriver.sh &lt;jdbc driver name&gt;.jar

**Notes**
The scripts can be run on Windows when using GitBash for Windows or CygWin64 emulators.
