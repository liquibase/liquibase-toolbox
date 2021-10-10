-- liquibase formatted sql

-- changeset SteveZ:createTable_customer

CREATE TABLE customer (
    id IDENTITY PRIMARY KEY,
    name VARCHAR(256),
    birthdate DATE
);
