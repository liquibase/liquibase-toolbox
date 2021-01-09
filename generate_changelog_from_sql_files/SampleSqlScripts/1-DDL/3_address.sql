CREATE TABLE address (
    id INT8 PRIMARY KEY,
    street VARCHAR(128),
    postal_code VARCHAR(16),
    FOREIGN KEY(id) REFERENCES customer(id) ON DELETE CASCADE
);