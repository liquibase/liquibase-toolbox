-- liquibase formatted sql
-- changeset author1:SampleSqlScripts_1-DDL_1_product.sql
CREATE TABLE product (
    id IDENTITY PRIMARY KEY,
    sku VARCHAR(256),
    name VARCHAR(256),
    price DECIMAL(20, 2),
    UNIQUE KEY UNIQUE_PRODUCT_SKU (sku)
);
-- rollback 

-- changeset author2:SampleSqlScripts__1-DDL_2_customer.sql 
CREATE TABLE customer (
    id IDENTITY PRIMARY KEY,
    name VARCHAR(256),
    birthdate DATE
);
-- rollback 

-- changeset author3:SampleSqlScripts__1-DDL_3_address.sql 
CREATE TABLE address (
    id INT8 PRIMARY KEY,
    street VARCHAR(128),
    postal_code VARCHAR(16),
    FOREIGN KEY(id) REFERENCES customer(id) ON DELETE CASCADE
);
-- rollback 

-- changeset author4:SampleSqlScripts__1-DDL_4_email_address.sql 
CREATE TABLE email_address (
    id IDENTITY PRIMARY KEY,
    customer_id INT8,
    address VARCHAR(128),
    FOREIGN KEY(customer_id) REFERENCES customer(id) ON DELETE CASCADE
);
-- rollback 

-- changeset author5:SampleSqlScripts__1-DDL_5_purchase_order.sql 
CREATE TABLE purchase_order (
    id IDENTITY PRIMARY KEY,
    customer_id INT8,
    order_date DATE,
    FOREIGN KEY(customer_id) REFERENCES customer(id)
);
-- rollback 

-- changeset author6:SampleSqlScripts__1-DDL_6_item.sql 
CREATE TABLE item (
    id IDENTITY PRIMARY KEY,
    order_id INT8,
    product_id INT8,
    quantity INT,
    total DECIMAL(20, 2),
    FOREIGN KEY(order_id) REFERENCES purchase_order(id),
    FOREIGN KEY(product_id) REFERENCES product(id)
);
-- rollback 

-- changeset author7:SampleSqlScripts__2-DML_1_insert_product.sql 
INSERT INTO product (id, sku, name, price) VALUES (1, 'keyboard', 'Keyboard', 7.99);
INSERT INTO product (id, sku, name, price) VALUES (2, 'tv', 'Television', 351.96);
INSERT INTO product (id, sku, name, price) VALUES (3, 'shirt', 'Shirt', 3.57);
INSERT INTO product (id, sku, name, price) VALUES (4, 'bed', 'Bed', 131.00);
INSERT INTO product (id, sku, name, price) VALUES (5, 'cell-phone', 'Cell Phone', 1000.00);
INSERT INTO product (id, sku, name, price) VALUES (6, 'spoon', 'Spoon', 1.00);
-- rollback 

-- changeset author8:SampleSqlScripts__2-DML_2_insert_customer.sql 
INSERT INTO customer (id, name, birthdate) VALUES (1, 'John Doe', '1960-10-30');
INSERT INTO customer (id, name, birthdate) VALUES (2, 'Pepito Pérez', '1954-07-15');
INSERT INTO customer (id, name, birthdate) VALUES (3, 'Cosme Fulanito', '1956-05-12');
-- rollback 

-- changeset author9:SampleSqlScripts__2-DML_3_insert_address.sql 
INSERT INTO address (id, street, postal_code) VALUES (1, 'La Habana 4310', '1000');
INSERT INTO address (id, street, postal_code) VALUES (2, '10 rue Henri Poincaré', '13014');
INSERT INTO address (id, street, postal_code) VALUES (3, 'Calle Falsa 123', '01102');
-- rollback 

-- changeset author10:SampleSqlScripts__2-DML_4_insert_email_address.sql 
INSERT INTO email_address (id, customer_id, address) VALUES (1, 1, 'john.doe@gmail.com');
INSERT INTO email_address (id, customer_id, address) VALUES (2, 1, 'john.doe@hotmail.com');
INSERT INTO email_address (id, customer_id, address) VALUES (3, 2, 'pepito@perez.com');
INSERT INTO email_address (id, customer_id, address) VALUES (4, 3, 'cosme@fulanito.com');
-- rollback 

-- changeset author11:SampleSqlScripts__2-DML_5_insert_purchase_order.sql 
INSERT INTO purchase_order (id, customer_id, order_date) VALUES (1, 2, '2018-01-04');
INSERT INTO purchase_order (id, customer_id, order_date) VALUES (2, 1, '2018-02-13');
INSERT INTO purchase_order (id, customer_id, order_date) VALUES (3, 2, '2018-02-25');
-- rollback 

-- changeset author12:SampleSqlScripts__2-DML_6_insert_item.sql 
INSERT INTO item (id, order_id, product_id, quantity, total) VALUES (1, 1, 1, 10, 79.90);
INSERT INTO item (id, order_id, product_id, quantity, total) VALUES (2, 1, 2, 2, 703.92);
INSERT INTO item (id, order_id, product_id, quantity, total) VALUES (3, 1, 3, 7, 24.99);
INSERT INTO item (id, order_id, product_id, quantity, total) VALUES (4, 2, 4, 2, 262.00);
INSERT INTO item (id, order_id, product_id, quantity, total) VALUES (5, 2, 5, 15, 15000.00);
INSERT INTO item (id, order_id, product_id, quantity, total) VALUES (6, 3, 1, 7, 55.93);
INSERT INTO item (id, order_id, product_id, quantity, total) VALUES (7, 3, 6, 18, 18.00);
-- rollback 

