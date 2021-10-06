CREATE TABLE email_address (
    id IDENTITY PRIMARY KEY,
    customer_id INT8,
    address VARCHAR(128),
    FOREIGN KEY(customer_id) REFERENCES customer(id) ON DELETE CASCADE
);