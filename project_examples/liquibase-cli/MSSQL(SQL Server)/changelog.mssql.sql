--liquibase formatted sql

--changeset Donna:1589-createTable_Customer225
CREATE TABLE Customer225 (CustomerTypeID nchar(10) NOT NULL, CustomerDesc nvarchar(MAX));
--rollback drop table Customer225;