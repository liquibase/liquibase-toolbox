--liquibase formatted sql

--changeset amalik:data_01 context:DEV,QA,PROD labels:release1
INSERT INTO test1 (ID, NAME, REGION, MARKET) VALUES (2,'A', 'B', 'C'); 
INSERT INTO test1 (ID, NAME, REGION, MARKET) VALUES (2,'A', 'B', 'C'); 
INSERT INTO test1 (ID, NAME, REGION, MARKET) VALUES (3,'A', 'B', 'C'); 
INSERT INTO test1 (ID, NAME, REGION, MARKET) VALUES (4,'A', 'B', 'C'); 
INSERT INTO test1 (ID, NAME, REGION, MARKET) VALUES (5,'A', 'B', 'C'); 
--rollback TRUNCATE table test1 ;
