-- liquibase formatted sql

--changeset BarbaraR:createSEQUENCE_departments_seq labels:STOLO
CREATE SEQUENCE departments_seq  
 START WITH     280  
 INCREMENT BY   10  
 MAXVALUE       9990  
 NOCACHE  
 NOCYCLE
--rollback DROP SEQUENCE departments_seq