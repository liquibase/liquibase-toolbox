--liquibase formatted sql

--changeset amalik:ddl_01 context:DEV,QA,PROD labels:release1
CREATE TABLE test1 (
   ID int NOT NULL,
   NAME varchar(20),
   REGION varchar(20),
   MARKET varchar(20)
)

--rollback DROP TABLE test1