--liquibase formatted sql

--changeset support.liquibase.net:1589919347165-1
CREATE TABLE EMPLOYEE (EMPNO CHAR(6) NOT NULL, FIRSTNME VARCHAR(12) NOT NULL, MIDINIT CHAR(1), LASTNAME VARCHAR(15) NOT NULL, WORKDEPT CHAR(3), PHONENO CHAR(4), HIREDATE date, JOB CHAR(8), EDLEVEL SMALLINT NOT NULL, SEX CHAR(1), BIRTHDATE date, SALARY DECIMAL(9, 2), BONUS DECIMAL(9, 2), COMM DECIMAL(9, 2), CONSTRAINT PK_EMPLOYEE PRIMARY KEY (EMPNO));

--changeset support.liquibase.net:1589919347165-2
CREATE TABLE PROJECT (PROJNO CHAR(6) NOT NULL, PROJNAME VARCHAR(24) DEFAULT '' NOT NULL, DEPTNO CHAR(3) NOT NULL, RESPEMP CHAR(6) NOT NULL, PRSTAFF DECIMAL(5, 2), PRSTDATE date, PRENDATE date, MAJPROJ CHAR(6), CONSTRAINT PK_PROJECT PRIMARY KEY (PROJNO));

--changeset support.liquibase.net:1589919347165-3
CREATE ALIAS EMP FOR TABLE "EMPLOYEE";

--changeset support.liquibase.net:1589919347165-4
CREATE TABLE ACT (ACTNO SMALLINT NOT NULL, ACTKWD CHAR(6) NOT NULL, ACTDESC VARCHAR(20) NOT NULL, CONSTRAINT PK_ACT PRIMARY KEY (ACTNO));
--rollback drop table ACT;

--changeset support.liquibase.net:1589919347165-5
CREATE TABLE DEPARTMENT (DEPTNO CHAR(3) NOT NULL, DEPTNAME VARCHAR(36) NOT NULL, MGRNO CHAR(6), ADMRDEPT CHAR(3) NOT NULL, LOCATION CHAR(16), CONSTRAINT PK_DEPARTMENT PRIMARY KEY (DEPTNO));

--changeset support.liquibase.net:1589919347165-6
CREATE ALIAS PROJ FOR TABLE "PROJECT";

--changeset support.liquibase.net:1589919347165-7
CREATE TABLE PROJACT (PROJNO CHAR(6) NOT NULL, ACTNO SMALLINT NOT NULL, ACSTAFF DECIMAL(5, 2), ACSTDATE date NOT NULL, ACENDATE date, CONSTRAINT PK_PROJACT PRIMARY KEY (PROJNO, ACTNO, ACSTDATE));

--changeset support.liquibase.net:1589919347165-8
CREATE TABLE EMPPROJACT (EMPNO CHAR(6) NOT NULL, PROJNO CHAR(6) NOT NULL, ACTNO SMALLINT NOT NULL, EMPTIME DECIMAL(5, 2), EMSTDATE date, EMENDATE date);

--changeset support.liquibase.net:1589919347165-9
CREATE ALIAS DEPT FOR TABLE "DEPARTMENT";

--changeset support.liquibase.net:1589919347165-10
CREATE VIEW VDEPMG1 (DEPTNO, DEPTNAME, MGRNO, FIRSTNME, MIDINIT,   LASTNAME, ADMRDEPT) AS SELECT ALL DEPTNO, DEPTNAME, EMPNO, FIRSTNME, MIDINIT,   LASTNAME, ADMRDEPT FROM DEPT LEFT OUTER  JOIN EMP ON MGRNO = EMPNO;

--changeset support.liquibase.net:1589919347165-11
CREATE VIEW VEMP    AS SELECT ALL EMPNO ,   FIRSTNME,   MIDINIT ,   LASTNAME,   WORKDEPT   FROM EMP;

--changeset support.liquibase.net:1589919347165-12
CREATE VIEW VEMPDPT1 (DEPTNO, DEPTNAME, EMPNO, FRSTINIT, MIDINIT,   LASTNAME, WORKDEPT) AS SELECT ALL DEPTNO, DEPTNAME, EMPNO, SUBSTR(FIRSTNME, 1, 1), MIDINIT,   LASTNAME, WORKDEPT FROM DEPT  RIGHT OUTER JOIN EMP ON WORKDEPT = DEPTNO;

--changeset support.liquibase.net:1589919347165-13
CREATE VIEW VEMPLP   (EMPLOYEENUMBER,   PHONENUMBER) AS SELECT ALL EMPNO ,   PHONENO FROM EMP;

--changeset support.liquibase.net:1589919347165-14
CREATE VIEW VPHONE   (LASTNAME,   FIRSTNAME,   MIDDLEINITIAL,   PHONENUMBER,   EMPLOYEENUMBER,   DEPTNUMBER,   DEPTNAME) AS SELECT ALL LASTNAME,   FIRSTNME,   MIDINIT ,   VALUE(PHONENO,' '),   EMPNO,   DEPTNO,   DEPTNAME FROM EMP, DEPT WHERE WORKDEPT = DEPTNO;

--changeset support.liquibase.net:1589919347165-15
CREATE VIEW VPROJRE1   (PROJNO,PROJNAME,PROJDEP,RESPEMP,FIRSTNME,MIDINIT,   LASTNAME,MAJPROJ) AS SELECT ALL   PROJNO,PROJNAME,DEPTNO,EMPNO,FIRSTNME,MIDINIT,   LASTNAME,MAJPROJ FROM PROJ, EMP WHERE RESPEMP = EMPNO;

--changeset support.liquibase.net:1589919347165-16
CREATE VIEW VSTAFAC2 (PROJNO, ACTNO, ACTDESC, EMPNO, FIRSTNME, MIDINIT, LASTNAME, EMPTIME,STDATE, ENDATE, TYPE) AS SELECT ALL EP.PROJNO, EP.ACTNO, AC.ACTDESC, EP.EMPNO,EM.FIRSTNME, EM.MIDINIT, EM.LASTNAME, EP.EMPTIME, EP.EMSTDATE,   EP.EMENDATE,'2' FROM EMPPROJACT EP, ACT AC, EMP EM WHERE EP.ACTNO = AC.ACTNO AND EP.EMPNO = EM.EMPNO;

--changeset support.liquibase.net:1589919347165-17
CREATE VIEW VASTRDE2   (DEPT1NO,DEPT1NAM,EMP1NO,EMP1FN,EMP1MI,EMP1LN,TYPE2,   DEPT2NO,DEPT2NAM,EMP2NO,EMP2FN,EMP2MI,EMP2LN) AS SELECT ALL   D1.DEPTNO,D1.DEPTNAME,D1.MGRNO,D1.FIRSTNME,D1.MIDINIT,   D1.LASTNAME,'2',   D1.DEPTNO,D1.DEPTNAME,E2.EMPNO,E2.FIRSTNME,E2.MIDINIT,   E2.LASTNAME FROM VDEPMG1 D1, EMP E2 WHERE D1.DEPTNO = E2.WORKDEPT;

--changeset support.liquibase.net:1589919347165-18
CREATE VIEW VPROJ    AS SELECT ALL PROJNO, PROJNAME, DEPTNO, RESPEMP, PRSTAFF, PRSTDATE, PRENDATE, MAJPROJ FROM PROJ;

--changeset support.liquibase.net:1589919347165-19
CREATE VIEW VACT AS SELECT ALL ACTNO ,   ACTKWD ,   ACTDESC FROM ACT;

--changeset support.liquibase.net:1589919347165-20
CREATE VIEW VSTAFAC1(PROJNO, ACTNO, ACTDESC, EMPNO, FIRSTNME, MIDINIT,      LASTNAME, EMPTIME,STDATE,ENDATE, TYPE) AS SELECT ALL PA.PROJNO, PA.ACTNO, AC.ACTDESC,' ', ' ', ' ', ' ',   PA.ACSTAFF, PA.ACSTDATE,   PA.ACENDATE,'1' FROM PROJACT PA, ACT AC  WHERE PA.ACTNO = AC.ACTNO;

--changeset support.liquibase.net:1589919347165-21
CREATE VIEW VDEPT      AS SELECT ALL DEPTNO,   DEPTNAME,   MGRNO,   ADMRDEPT   FROM DEPT;

--changeset support.liquibase.net:1589919347165-22
CREATE VIEW VHDEPT    AS SELECT ALL DEPTNO ,   DEPTNAME,   MGRNO ,   ADMRDEPT,   LOCATION   FROM DEPT;

--changeset support.liquibase.net:1589919347165-23
CREATE VIEW VPROJACT    AS SELECT ALL PROJNO,ACTNO, ACSTAFF, ACSTDATE, ACENDATE FROM PROJACT;

--changeset support.liquibase.net:1589919347165-24
CREATE VIEW VEMPPROJACT AS SELECT ALL EMPNO, PROJNO, ACTNO, EMPTIME, EMSTDATE, EMENDATE FROM EMPPROJACT;

--changeset support.liquibase.net:1589919347165-25
CREATE VIEW VFORPLA   (PROJNO,PROJNAME,RESPEMP,PROJDEP,FRSTINIT,MIDINIT,LASTNAME) AS SELECT ALL F1.PROJNO,PROJNAME,RESPEMP,PROJDEP, SUBSTR(FIRSTNME, 1, 1),   MIDINIT, LASTNAME FROM VPROJRE1 F1 LEFT OUTER JOIN EMPPROJACT F2 ON F1.PROJNO = F2.PROJNO;

--changeset support.liquibase.net:1589919347165-26
CREATE VIEW VASTRDE1   (DEPT1NO,DEPT1NAM,EMP1NO,EMP1FN,EMP1MI,EMP1LN,TYPE2,   DEPT2NO,DEPT2NAM,EMP2NO,EMP2FN,EMP2MI,EMP2LN) AS SELECT ALL   D1.DEPTNO,D1.DEPTNAME,D1.MGRNO,D1.FIRSTNME,D1.MIDINIT,   D1.LASTNAME, '1',   D2.DEPTNO,D2.DEPTNAME,D2.MGRNO,D2.FIRSTNME,D2.MIDINIT,   D2.LASTNAME FROM VDEPMG1 D1, VDEPMG1 D2 WHERE D1.DEPTNO = D2.ADMRDEPT;

--changeset support.liquibase.net:1589919347165-27
CREATE VIEW VPSTRDE1   (PROJ1NO,PROJ1NAME,RESP1NO,RESP1FN,RESP1MI,RESP1LN,   PROJ2NO,PROJ2NAME,RESP2NO,RESP2FN,RESP2MI,RESP2LN) AS SELECT ALL   P1.PROJNO,P1.PROJNAME,P1.RESPEMP,P1.FIRSTNME,P1.MIDINIT,   P1.LASTNAME,   P2.PROJNO,P2.PROJNAME,P2.RESPEMP,P2.FIRSTNME,P2.MIDINIT,   P2.LASTNAME FROM VPROJRE1 P1,   VPROJRE1 P2 WHERE P1.PROJNO = P2.MAJPROJ;

--changeset support.liquibase.net:1589919347165-28
CREATE VIEW VPSTRDE2   (PROJ1NO,PROJ1NAME,RESP1NO,RESP1FN,RESP1MI,RESP1LN,   PROJ2NO,PROJ2NAME,RESP2NO,RESP2FN,RESP2MI,RESP2LN) AS SELECT ALL   P1.PROJNO,P1.PROJNAME,P1.RESPEMP,P1.FIRSTNME,P1.MIDINIT,   P1.LASTNAME,   P1.PROJNO,P1.PROJNAME,P1.RESPEMP,P1.FIRSTNME,P1.MIDINIT,   P1.LASTNAME FROM VPROJRE1 P1 WHERE NOT EXISTS (SELECT * FROM VPROJRE1 P2 WHERE P1.PROJNO = P2.MAJPROJ);

--changeset support.liquibase.net:1589919347165-29
CREATE SEQUENCE SAMPSEQUENCE;

--changeset support.liquibase.net:1589919347165-30
CREATE TABLE CL_SCHED (CLASS_CODE CHAR(7), DAY SMALLINT, STARTING time, ENDING time);

--changeset support.liquibase.net:1589919347165-31
CREATE TABLE EMPMDC (EMPNO INTEGER, DEPT INTEGER, DIV INTEGER);

--changeset support.liquibase.net:1589919347165-32
CREATE TABLE EMP_PHOTO (EMPNO CHAR(6) NOT NULL, PHOTO_FORMAT VARCHAR(10) NOT NULL, PICTURE BLOB(102400), CONSTRAINT PK_EMP_PHOTO PRIMARY KEY (EMPNO, PHOTO_FORMAT));

--changeset support.liquibase.net:1589919347165-33
CREATE TABLE EMP_RESUME (EMPNO CHAR(6) NOT NULL, RESUME_FORMAT VARCHAR(10) NOT NULL, RESUME CLOB(5120), CONSTRAINT PK_EMP_RESUME PRIMARY KEY (EMPNO, RESUME_FORMAT));

--changeset support.liquibase.net:1589919347165-34
CREATE TABLE IN_TRAY (RECEIVED timestamp, SOURCE CHAR(8), SUBJECT CHAR(64), NOTE_TEXT VARCHAR(3000));

--changeset support.liquibase.net:1589919347165-35
CREATE TABLE ORG (DEPTNUMB SMALLINT NOT NULL, DEPTNAME VARCHAR(14), MANAGER SMALLINT, DIVISION VARCHAR(10), LOCATION VARCHAR(13));

--changeset support.liquibase.net:1589919347165-36
CREATE TABLE SALES (SALES_DATE date, SALES_PERSON VARCHAR(15), REGION VARCHAR(15), SALES INTEGER);

--changeset support.liquibase.net:1589919347165-37
CREATE TABLE STAFF (ID SMALLINT NOT NULL, NAME VARCHAR(9), DEPT SMALLINT, JOB CHAR(5), YEARS SMALLINT, SALARY DECIMAL(7, 2), COMM DECIMAL(7, 2));

--changeset support.liquibase.net:1589919347165-38
CREATE TABLE STAFFG (ID SMALLINT NOT NULL, NAME VARGRAPHIC(9), DEPT SMALLINT, JOB GRAPHIC(5), YEARS SMALLINT, SALARY DECIMAL(9), COMM DECIMAL(9));

--changeset support.liquibase.net:1589919347165-39
CREATE TABLE STORES (STORE_ID INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL, STORE_NAME VARCHAR(150) NOT NULL, ADDRESS_LINE_1 VARCHAR(255) NOT NULL, ADDRESS_LINE_2 VARCHAR(100), CITY_ID INTEGER NOT NULL, STATE_ID INTEGER NOT NULL, ZIP_CODE VARCHAR(6), CONSTRAINT SQL191222190828260 PRIMARY KEY (STORE_ID));

--changeset support.liquibase.net:1589919347165-40
ALTER TABLE EMPLOYEE ADD CONSTRAINT NUMBER CHECK (PHONENO >= '0000' AND PHONENO <= '9999');

--changeset support.liquibase.net:1589919347165-41
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

--changeset support.liquibase.net:1589919347165-42
CREATE TRIGGER do_not_del_sales NO CASCADE BEFORE DELETE ON staff REFERENCING OLD AS oldstaff FOR EACH ROW MODE DB2SQL WHEN(oldstaff.job = 'Sales') BEGIN ATOMIC SIGNAL SQLSTATE '75000' ('Sales staff cannot be deleted... see the DO_NOT_DEL_SALES trigger.'); END

--changeset support.liquibase.net:1589919347165-43
CREATE TRIGGER min_salary NO CASCADE BEFORE INSERT ON staff REFERENCING NEW AS newstaff FOR EACH ROW MODE DB2SQL BEGIN ATOMIC SET newstaff.salary = CASE WHEN newstaff.job = 'Mgr' AND newstaff.salary < 17000.00 THEN 17000.00 WHEN newstaff.job = 'Sales' AND newstaff.salary < 14000.00 THEN 14000.00 WHEN newstaff.job = 'Clerk' AND newstaff.salary < 10000.00 THEN 10000.00 ELSE newstaff.salary END; END

--changeset support.liquibase.net:1589919347165-44
CREATE PROCEDURE bonus_increase                            (IN p_bonusFactor DECIMAL (3,2),                              IN p_bonusMaxSumForDept DECIMAL (9,2),                              OUT p_deptsWithoutNewBonuses VARCHAR(255),                              OUT p_countDeptsViewed INTEGER,                              OUT p_countDeptsBonusChanged INTEGER,                              OUT p_errorMsg VARCHAR(255)) SPECIFIC BONUS_INCREASE
LANGUAGE SQL
DYNAMIC RESULT SETS 1

BEGIN
-- -------------------------------------------------------------------------------------
-- Routine type:  SQL stored procedure
-- Routine name:  bonus_increase
--
-- Purpose:  This procedure takes in a multiplier value that is used to update
--           employee bonus values.  The employee bonus updates are done department
--           by department.  Updated employee bonus values are only committed if the
--           sum of the bonuses for a department does not exceed the threshold amount
--           specified by another input parameter.  A result is returned listing, by
--           department, employee numbers and currently set bonus values.
--
-- Features shown:
--           - IN and OUT parameters
--           - Variable declaration and setting
--           - Condition handler declaration and use
--           - Use of CURSOR WITH HOLD
--           - Use of SAVEPOINT and ROLLBACK to SAVEPOINT
--           - Returning of a result set to the caller
--           - Use of a WHILE loop control-statement
--           - Use of IF/ELSE statement
--           - Use of labels and GOTO statement
--           - Use of RETURN statement
--
-- Parameters:
-- IN  p_bonusFactor:      Constant multiple by which employee bonuses are updated
-- IN  p_bonusMaxSumForDept:    Maximum amount for departmental bonuses without review
-- OUT p_deptsWithoutNewBonuses:  Comma delimited list of departments that require
--                                   a manual setting and review of bonus amounts
-- OUT p_countDeptsViewed:     Number of departments processed
-- OUT p_countDeptsBonusChanged:  Number of departments for which bonuses were set
-- OUT p_errorMsg:       Error message string
-- --------------------------------------------------------------------------------------
    DECLARE v_dept, v_actdept CHAR(3);
    DECLARE v_bonus, v_deptbonus, v_newbonus DECIMAL(9,2);
    DECLARE v_empno CHAR(6);
    DECLARE v_atend SMALLINT DEFAULT 0;

    -- Cursor that lists employee numbers and bonuses ordered by department
    -- This cursor is declared as WITH HOLD so that on rollbacks it remains
    -- open.  It is declared as FOR UPDATE OF bonus, so that the employee
    -- bonus column field can be updated as the cursor iterates through the rows.

    DECLARE cSales CURSOR WITH HOLD FOR
          SELECT workdept, bonus, empno FROM employee ORDER BY workdept
      FOR UPDATE OF bonus;

    -- This cursor, declared with WITH RETURN TO CALLER, is used to return
    -- a result set to the caller when this procedure returns.  The result
    -- set contains a list of the employees and their bonus values ordered
    -- by the department numbers.

    DECLARE cEmpBonuses CURSOR WITH RETURN TO CALLER FOR
          SELECT workdept, empno, bonus FROM employee ORDER BY workdept;

    -- This continue handler is used to catch the NOT FOUND error
    -- associated with the end of the iteration over the cursor cSales.
    -- It is used to set v_atend which flags the end of the WHILE loop.

     DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_atend=1;

    -- This continue handler is used to catch any numeric overflows

    DECLARE EXIT HANDLER FOR SQLSTATE '22003'
    BEGIN
      SET p_errorMsg = 'SQLSTATE 22003 - Numeric overflow occurred setting bonus';
    END;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION SET v_atend=1;

    -- Initialize local variables

    SET p_errorMsg = '';
    SET p_deptsWithoutNewBonuses = '';
    SET p_countDeptsViewed = 0;
    SET p_countDeptsBonusChanged = 0;

    -- Check input parameter is valid

    IF (p_bonusFactor < 1 OR p_bonusFactor > 2) THEN
      SET p_errorMsg = 'E01 Checking parameter p_bonusFactor, validation';
      GOTO error_found;
    END IF;

    OPEN cSales;

    FETCH cSales INTO v_dept, v_bonus, v_empno;

    nextdept:
        IF v_atend = 0 THEN

            -- This savepoint is used to rollback the bonuses assigned to employees if
            -- the sum of bonuses for a department exceeds a threshold amount

            SAVEPOINT svpt_bonus ON ROLLBACK RETAIN CURSORS;

            SET v_actdept = v_dept;
            SET v_deptbonus = 0;

            WHILE ( v_actdept = v_dept ) AND ( v_atend = 0 ) DO
                    SET v_newbonus = v_bonus * p_bonusFactor;
                    UPDATE employee SET bonus = v_newbonus WHERE empno = v_empno;
                    SET v_deptbonus = v_deptbonus + v_newbonus;
                    FETCH cSales INTO v_dept, v_bonus, v_empno;
            END WHILE;

            SET p_countDeptsViewed = p_countDeptsViewed + 1;

            IF v_deptbonus <= p_bonusMaxSumForDept THEN
                SET p_countDeptsBonusChanged = p_countDeptsBonusChanged + 1;
                COMMIT;
            ELSE
                     ROLLBACK TO SAVEPOINT svpt_bonus;
                     RELEASE SAVEPOINT svpt_bonus;
                     SET p_deptsWithoutNewBonuses =
                                     (CASE WHEN p_deptsWithoutNewBonuses = ''
                                           THEN v_actdept
                                      ELSE
                                           p_deptsWithoutNewBonuses || ', ' || v_actdept
                                      END);
            END IF;
            GOTO nextdept;
        END IF;

    OPEN cEmpBonuses;

    RETURN 0;

error_found:
    SET p_errorMsg = p_errorMsg || ' failed.';
    RETURN -1;

END

--changeset support.liquibase.net:1589919347165-45
CREATE ALIAS EMPACT FOR TABLE "EMPPROJACT";

--changeset support.liquibase.net:1589919347165-46
CREATE ALIAS EMP_ACT FOR TABLE "EMPPROJACT";

--changeset support.liquibase.net:1589919347165-47
CREATE UNIQUE INDEX XACT2 ON ACT(ACTNO, ACTKWD);

--changeset support.liquibase.net:1589919347165-48
CREATE INDEX XDEPT2 ON DEPARTMENT(MGRNO);

--changeset support.liquibase.net:1589919347165-49
CREATE INDEX XDEPT3 ON DEPARTMENT(ADMRDEPT);

--changeset support.liquibase.net:1589919347165-50
CREATE INDEX XEMP2 ON EMPLOYEE(WORKDEPT);

--changeset support.liquibase.net:1589919347165-51
CREATE INDEX XPROJ2 ON PROJECT(RESPEMP);

--changeset support.liquibase.net:1589919347165-52
ALTER TABLE EMP_PHOTO ADD CONSTRAINT FK_EMP_PHOTO FOREIGN KEY (EMPNO) REFERENCES EMPLOYEE (EMPNO) ON UPDATE NO ACTION ON DELETE RESTRICT;

--changeset support.liquibase.net:1589919347165-53
ALTER TABLE EMP_RESUME ADD CONSTRAINT FK_EMP_RESUME FOREIGN KEY (EMPNO) REFERENCES EMPLOYEE (EMPNO) ON UPDATE NO ACTION ON DELETE RESTRICT;

--changeset support.liquibase.net:1589919347165-54
ALTER TABLE PROJECT ADD CONSTRAINT FK_PROJECT_1 FOREIGN KEY (DEPTNO) REFERENCES DEPARTMENT (DEPTNO) ON UPDATE NO ACTION ON DELETE RESTRICT;

--changeset support.liquibase.net:1589919347165-55
ALTER TABLE PROJECT ADD CONSTRAINT FK_PROJECT_2 FOREIGN KEY (RESPEMP) REFERENCES EMPLOYEE (EMPNO) ON UPDATE NO ACTION ON DELETE RESTRICT;

--changeset support.liquibase.net:1589919347165-56
ALTER TABLE DEPARTMENT ADD CONSTRAINT RDE FOREIGN KEY (MGRNO) REFERENCES EMPLOYEE (EMPNO) ON UPDATE NO ACTION ON DELETE SET NULL;

--changeset support.liquibase.net:1589919347165-57
ALTER TABLE EMPLOYEE ADD CONSTRAINT RED FOREIGN KEY (WORKDEPT) REFERENCES DEPARTMENT (DEPTNO) ON UPDATE NO ACTION ON DELETE SET NULL;

--changeset support.liquibase.net:1589919347165-58
ALTER TABLE EMPPROJACT ADD CONSTRAINT REPAPA FOREIGN KEY (PROJNO, ACTNO, EMSTDATE) REFERENCES PROJACT (PROJNO, ACTNO, ACSTDATE) ON UPDATE NO ACTION ON DELETE RESTRICT;

--changeset support.liquibase.net:1589919347165-59
ALTER TABLE DEPARTMENT ADD CONSTRAINT ROD FOREIGN KEY (ADMRDEPT) REFERENCES DEPARTMENT (DEPTNO) ON UPDATE NO ACTION ON DELETE CASCADE;

--changeset support.liquibase.net:1589919347165-60
ALTER TABLE ACT ADD CONSTRAINT RPAA FOREIGN KEY (ACTNO) REFERENCES ACT (ACTNO) ON UPDATE NO ACTION ON DELETE RESTRICT;

--changeset support.liquibase.net:1589919347165-61
ALTER TABLE PROJACT ADD CONSTRAINT RPAP FOREIGN KEY (PROJNO) REFERENCES PROJECT (PROJNO) ON UPDATE NO ACTION ON DELETE RESTRICT;

--changeset support.liquibase.net:1589919347165-62
ALTER TABLE PROJECT ADD CONSTRAINT RPP FOREIGN KEY (MAJPROJ) REFERENCES PROJECT (PROJNO) ON UPDATE NO ACTION ON DELETE CASCADE;

--changeset SteveZ:15-TABLE_EMPLOYEE2 context:TEST
CREATE TABLE EMPLOYEE2 (EMPNO CHAR(6) NOT NULL, FIRSTNME VARCHAR(12) NOT NULL, MIDINIT CHAR(1), LASTNAME VARCHAR(15) NOT NULL, WORKDEPT CHAR(3), PHONENO CHAR(4), HIREDATE date, JOB CHAR(8), EDLEVEL SMALLINT NOT NULL, SEX CHAR(1), BIRTHDATE date, SALARY DECIMAL(9, 2), BONUS DECIMAL(9, 2), COMM DECIMAL(9, 2), CONSTRAINT PK_EMPLOYEE2 PRIMARY KEY (EMPNO));
--rollback drop table EMPLOYEE2;