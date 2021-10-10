-- liquibase formatted sql

-- changeset SteveZ:createTable_product

CREATE TABLE product (
    id IDENTITY PRIMARY KEY,
    sku VARCHAR(256),
    name VARCHAR(256),
    price DECIMAL(20, 2),
    UNIQUE KEY UNIQUE_PRODUCT_SKU (sku)
);
