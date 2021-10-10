-- liquibase formatted sql

-- changeset MarthaB:createTable_purchase_order

CREATE TABLE purchase_order (
    id IDENTITY PRIMARY KEY,
    customer_id INT8,
    order_date DATE,
    FOREIGN KEY(customer_id) REFERENCES customer(id)
);
