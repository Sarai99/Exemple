CREATE DATABASE IF NOT EXISTS my_database;
USE my_database;

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE IF NOT EXISTS order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (first_name, last_name, email, phone_number)
VALUES
    ('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
    ('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210');
    
INSERT INTO products (product_name, price, stock_quantity)
VALUES
    ('Laptop', 899.99, 10),
    ('Smartphone', 499.99, 25),
    ('Tablet', 299.99, 30);

INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES
    (1, '2024-10-08', 1399.98, 'Completed'),
    (2, '2024-10-08', 499.99, 'Pending');

INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES
    (1, 1, 1, 899.99),  -- Customer 1 bought 1 Laptop
    (1, 2, 1, 499.99),  -- Customer 1 bought 1 Smartphone
    (2, 2, 1, 499.99);  -- Customer 2 bought 1 Smartphone
