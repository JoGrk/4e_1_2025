DROP DATABASE IF EXISTS departaments;
CREATE DATABASE departaments;
USE departaments;

CREATE TABLE departments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50)
);


INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Sales'),
(4, 'logistic');



CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO employees VALUES
(1, 'Alice', 7000, 1),
(2, 'Bob', 9000, 1),
(3, 'Carol', 5000, 2),
(4, 'David', 6000, 2),
(5, 'Eve', 8000, 3),
(6, 'Frank', 8000, 3);



CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);


INSERT INTO customers VALUES
(1, 'John'),
(2, 'Anna'),
(3, 'Mark'),
(4, 'Sophia');


CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    employee_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

INSERT INTO orders VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 3, 2);



CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(1, 'Laptop', 4500.00),
(2, 'Phone', 4500.00),
(3, 'Tablet', 2500.00),
(4, 'Monitor', 1200.00);


CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


INSERT INTO order_items VALUES
(1, 4, 1),  
(2, 2, 2),  
(3, 3, 1),  
(1, 1, 1),  
(4, 1, 1);
