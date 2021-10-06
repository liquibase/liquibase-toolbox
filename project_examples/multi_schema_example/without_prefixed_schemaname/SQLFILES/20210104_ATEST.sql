--liquibase formatted sql

--changeset SteveZ:45555-createTable_TABLE201 context:ATEST labels:Jira-166,feature1
CREATE TABLE TABLE201
 (
   JOB_ID VARCHAR2(10 BYTE) NOT NULL,
   MIN_SALARY NUMBER(6, 0),
   MAX_SALARY NUMBER(6, 0),
   CONSTRAINT JOB_ID_PK201 PRIMARY KEY (JOB_ID)
 )
;
--rollback DROP TABLE TABLE201