-- liquibase formatted sql

--changeset SteveZ:45555-createTable_TABLE200 context:"UAT,QA,SIT" labels:Jira-166,feature1
CREATE TABLE TABLE200
 (
   JOB_ID VARCHAR2(10 BYTE) NOT NULL,
   MIN_SALARY NUMBER(6, 0),
   MAX_SALARY NUMBER(6, 0),
   CONSTRAINT JOB_ID_PK200 PRIMARY KEY (JOB_ID)
 )
;
--rollback drop table TABLE200

--changeset SteveZ:45555-createTable_EMPLOYEES context:"UAT,QA,SIT" labels:Jira-166,feature1
CREATE TABLE EMPLOYEES
(	
  EMPLOYEE_ID NUMBER(6,0) NOT NULL ENABLE, 
	FIRST_NAME VARCHAR2(20), 
	LAST_NAME VARCHAR2(25) CONSTRAINT "EMP_LAST_NAME_NN" NOT NULL ENABLE, 
	EMAIL VARCHAR2(25) CONSTRAINT "EMP_EMAIL_NN" NOT NULL ENABLE, 
	PHONE_NUMBER VARCHAR2(20), 
	HIRE_DATE DATE CONSTRAINT "EMP_HIRE_DATE_NN" NOT NULL ENABLE, 
	JOB_ID VARCHAR2(10) CONSTRAINT "EMP_JOB_NN" NOT NULL ENABLE, 
	SALARY NUMBER(8,2), 
	COMMISSION_PCT NUMBER(2,2), 
	MANAGER_ID NUMBER(6,0), 
	DEPARTMENT_ID NUMBER(4,0), 
	CONSTRAINT EMP_EMP_ID_PK PRIMARY KEY ("EMPLOYEE_ID"))
   ;
--rollback DROP TABLE EMPLOYEES

--changeset MikeO:45556-CreatePROC_add_job_history112 context:PROD labels:Jira-167 endDelimiter:/ splitStatements:false runOnChange:true
CREATE OR REPLACE PROCEDURE add_job_history112
 (  p_emp_id          job_history.employee_id%type
  , p_start_date      job_history.start_date%type
  , p_end_date        job_history.end_date%type
  , p_job_id          job_history.job_id%type
  , p_department_id   job_history.department_id%type
  )
IS
BEGIN
 INSERT INTO job_history (employee_id, start_date, end_date,
                          job_id, department_id)
   VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END;
/
--rollback DROP PROCEDURE add_job_history112;

--changeset AmyS:45678-createTrigger_t splitStatements:false context:DEV labels:feature13389,Jira-167
create or replace TRIGGER t
 BEFORE
   INSERT OR
   UPDATE OF salary, department_id OR
   DELETE
 ON EMPLOYEES
BEGIN
 CASE
   WHEN INSERTING THEN
     DBMS_OUTPUT.PUT_LINE('Inserting');
   WHEN UPDATING('salary') THEN
     DBMS_OUTPUT.PUT_LINE('Updating salary');
   WHEN UPDATING('department_id') THEN
     DBMS_OUTPUT.PUT_LINE('Updating department ID');
   WHEN DELETING THEN
     DBMS_OUTPUT.PUT_LINE('Deleting');
 END CASE;
END;
/

--rollback DROP TRIGGER t
