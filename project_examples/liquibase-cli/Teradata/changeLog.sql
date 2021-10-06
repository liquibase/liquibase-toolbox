--liquibase formatted sql

--changeset steveZ:create-test-table
CREATE TABLE orders2 (
  orderkey INT,
  orderstatus INT,
  totalprice INT,
  orderdate date
)
;
--rollback DROP TABLE orders2;

--changeset steveZ:orders4
CREATE TABLE orders4 (
  orderkey INT,
  orderstatus INT,
  totalprice INT,
  orderdate date
)
;
--rollback DROP TABLE orders4;

--changeset steveZ:Sample_p splitStatements:false
CREATE PROCEDURE Sample_p (INOUT c INTEGER)
       DYNAMIC RESULT SETS 2
    BEGIN
       DECLARE cur1 CURSOR WITH RETURN ONLY FOR
          SELECT * FROM orders2;
       DECLARE cur2 CURSOR WITH RETURN ONLY FOR
          SELECT * FROM orders4 WHERE orders4.orderkey > c;
       SET c = c +1;
    END;
	
--rollback DROP PROCEDURE Sample_p;