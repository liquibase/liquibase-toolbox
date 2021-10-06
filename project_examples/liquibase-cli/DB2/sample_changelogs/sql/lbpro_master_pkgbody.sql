CREATE OR REPLACE PACKAGE BODY DB2INST1.TEST_PKG
AS
	-- ###################################################################################
	-- # PL/SQL package body
	-- ###################################################################################
	PROCEDURE SampleProcedure (VARNAME IN VARCHAR(128), VARCOUNT OUT INTEGER)
	AS
	BEGIN
	-- ###################################################################################
	-- # Returns count of all tables created by DB2JUBULA and like VARNAME
	-- ###################################################################################
	SELECT COUNT(*) INTO VARCOUNT FROM SYSIBM.SYSTABLES	WHERE CREATOR = 'DB2JUBULA' AND NAME LIKE VARNAME;
	END SampleProcedure;
	FUNCTION SampleFunction (VARNAME IN VARCHAR(128))
	RETURN INTEGER
	AS
	VARCOUNT INTEGER := 0;
	BEGIN
	-- ###################################################################################
	-- # Returns count of tables created by DB2JUBULA and like VARNAME
	-- ###################################################################################
	SELECT COUNT(*) INTO VARCOUNT FROM SYSIBM.SYSTABLES WHERE CREATOR = 'DB2JUBULA' AND NAME = VARNAME;
	RETURN VARCOUNT;
	END SampleFunction;
END TEST_PKG;
