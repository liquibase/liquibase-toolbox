--liquibase formatted sql

--changeset SteveZ:158940-createTable-ServiceTech2
CREATE TABLE "ServiceTech2" (id INTEGER NOT NULL, name VARCHAR(50) NOT NULL, active BOOLEAN DEFAULT TRUE, fk_servicetech2_id INTEGER, CONSTRAINT servicetech2_pkey PRIMARY KEY (id));
--rollback drop table ServiceTech2;