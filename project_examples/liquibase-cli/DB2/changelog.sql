--liquibase formatted sql

--changeset TsviZ:CreateTableEMPLOYEE
CREATE TABLE EMPLOYEE 
(
    EMPNO CHAR(6) NOT NULL, 
    FIRSTNME VARCHAR(12) NOT NULL, 
    MIDINIT CHAR(1), 
    LASTNAME VARCHAR(15) NOT NULL, 
    WORKDEPT CHAR(3), 
    PHONENO CHAR(4), 
    HIREDATE date, JOB CHAR(8), 
    EDLEVEL SMALLINT NOT NULL, 
    SEX CHAR(1), 
    BIRTHDATE date, 
    SALARY DECIMAL(9, 2), 
    BONUS DECIMAL(9, 2), 
    COMM DECIMAL(9, 2), 
    CONSTRAINT PK_EMPLOYEE PRIMARY KEY (EMPNO)
)
;
--rollback DROP TABLE EMPLOYEE


--changeset AditiA:CreateTablePROJECT
CREATE TABLE PROJECT 
(
    PROJNO CHAR(6) NOT NULL, 
    PROJNAME VARCHAR(24) DEFAULT '' NOT NULL, 
    DEPTNO CHAR(3) NOT NULL, 
    RESPEMP CHAR(6) NOT NULL, 
    PRSTAFF DECIMAL(5, 2), 
    PRSTDATE date, 
    PRENDATE date, 
    MAJPROJ CHAR(6), 
    CONSTRAINT PK_PROJECT PRIMARY KEY (PROJNO)
)
;
--rollback DROP TABLE PROJECT

--changeset TsviZ:CreateViewEMPLOYEE_VIEW
CREATE VIEW EMPLOYEE_VIEW 
AS 
SELECT * FROM EMPLOYEE;
--rollback DROP VIEW EMPLOYEE_VIEW

--changeset MarkW:CreateFunc_resign_employee endDelimiter:/
CREATE FUNCTION resign_employee (number CHAR(6))
  RETURNS TABLE (empno  CHAR(6),
                 salary DOUBLE,
                 dept   CHAR(3))
  MODIFIES SQL DATA
  LANGUAGE SQL
  BEGIN ATOMIC
-- -------------------------------------------------------------------------------------
-- Routine type:  SQL table function
-- Routine name:  resign_employee
--
-- Purpose:  This procedure takes in an employee number, then removes that
--           employee from the EMPLOYEE table.
--           A useful extension to this function would be to archive the
--           original record into an archive table.
--
-- --------------------------------------------------------------------------------------
    DECLARE l_salary DOUBLE;
    DECLARE l_job CHAR(3);

    SET (l_salary, l_job) = (SELECT salary, job
                               FROM OLD TABLE (DELETE FROM employee
                                                WHERE employee.empno = number));

    RETURN VALUES (number,l_salary, l_job);
  END
/
--rollback DROP FUNCTION resign_employee

--changeset MarthaB:CreateIndexEMP_IX
CREATE UNIQUE INDEX EMP_IX
    ON EMPLOYEE(EMPNO)
    INCLUDE(FIRSTNME, JOB);
--rollback DROP INDEX EMP_IX;

