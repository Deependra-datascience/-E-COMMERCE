-- Create Database
CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    method VARCHAR(50) NOT NULL,
    
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Insert Customers
INSERT INTO Customers (name, email, phone) VALUES
('Amit Kumar', 'amit@example.com', '9876543210'),
('Priya Sharma', 'priya@example.com', '9123456789');

-- Insert Products
INSERT INTO Products (name, price, stock) VALUES
('Laptop', 55000, 10),
('Mobile', 20000, 15),
('Headphones', 1500, 30);

-- Insert Orders
INSERT INTO Orders (customer_id, product_id, quantity) VALUES
(1, 1, 1), -- Amit bought 1 Laptop
(2, 2, 2); -- Priya bought 2 Mobiles

-- Insert Payments
INSERT INTO Payments (order_id, amount, method) VALUES
(1, 55000, 'Credit Card'),
(2, 40000, 'UPI');
select * from customers;