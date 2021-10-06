--liquibase formatted sql

--changeset SteveZ:15894-createTable_ServiceTech33
CREATE TABLE ServiceTech33 (id INT NOT NULL, name VARCHAR(50) NOT NULL, active BIT DEFAULT 1 NULL, CONSTRAINT PK_SERVICETECH33 PRIMARY KEY (id));
--rollback drop table ServiceTech33;
