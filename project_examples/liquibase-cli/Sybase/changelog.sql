-- liquibase formatted sql

--changeset RobS:15914322 context:dev labels:Jira-123
CREATE TABLE contact (id VARCHAR(100) NULL, city VARCHAR(100) NULL, state VARCHAR(100) NULL, country_code VARCHAR(100) NULL);
--rollback drop table contact;

--changeset SteveZ:1591842 context:test labels:Jira-123
CREATE TABLE ACTUAL1 (id VARCHAR(100) NULL, city VARCHAR(100) NULL, state VARCHAR(100) NULL, country_code VARCHAR(100) NULL);
--rollback drop table ACTUAL1;

--changeset SteveZ:1591756 context:dev labels:Jira-123
CREATE VIEW VIEW_ACTUAL2 AS SELECT * FROM ACTUAL1;
--rollback drop VIEW VIEW_ACTUAL2;

--changeset SteveZ:1591876 context:dev,test labels:Jira-124
CREATE INDEX proj_curr_cmp ON ACTUAL1 ( id, city );
--rollback drop INDEX ACTUAL1.proj_curr_cmp;

--changeset DonnaS:1599272 context:prod labels:Jira-124 runOnChange:true
CREATE FUNCTION DoubleIt ( @Input INT )
RETURNS INT 
AS 
DECLARE @Result INT  
SELECT @Result = @Input * 2 
RETURN @Result
--rollback DROP FUNCTION DoubleIt;
