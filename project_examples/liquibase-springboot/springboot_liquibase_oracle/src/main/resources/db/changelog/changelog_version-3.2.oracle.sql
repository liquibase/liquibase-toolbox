--liquibase formatted sql

--changeset support.liquibase.net:1582471835439-1
CREATE TABLE SALES (ID NUMBER NOT NULL, ITEM VARCHAR2(50 BYTE) NOT NULL, QUANTITY NUMBER(*, 0) NOT NULL, AMOUNT FLOAT(22) NOT NULL, CONSTRAINT SALES_PK PRIMARY KEY (ID));
--rollback DROP TABLE SALES;

--changeset support.liquibase.net:1582471835439-2
CREATE SEQUENCE SALE_SEQUENCE START WITH 21 MAXVALUE 100000;
--rollback DROP SEQUENCE SALE_SEQUENCE; 

--changeset support.liquibase.net:1582471835439-3
CREATE OR REPLACE TRIGGER "SALE_PRIMARY_KEY_TRG"
   before insert on "SALES"
   for each row
begin
   if inserting then
      if :NEW."ID" is null then
         select SALE_SEQUENCE.nextval into :NEW."ID" from dual;
      end if;
   end if;
end;
/
--rollback DROP TRIGGER "SALE_PRIMARY_KEY_TRG"; 

