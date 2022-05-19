-- liquibase formatted sql

--changeset BarbaraR:createSEQUENCE_locations_seq labels:STOLO
CREATE SEQUENCE locations_seq  
    START WITH     3300  
    INCREMENT BY   100  
    MAXVALUE       9900  
    NOCACHE  
    NOCYCLE
--rollback DROP SEQUENCE locations_seq