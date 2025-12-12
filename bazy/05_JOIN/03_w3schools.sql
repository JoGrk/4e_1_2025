-- 1. Wyświetl nazwy firm klientów  i daty zamówień
 SELECT CustomerName, OrderDate
 FROM customers
    INNER JOIN orders ON customers.CustomerID = Orders.CustomerID;
-- 2, Wyświetl dane kuriera z datą zamówienia
 SELECT ShipperName, Phone, OrderDate
 FROM shippers  
    INNER JOIN orders ON shippers.ShipperID = Orders.ShipperID;
-- 3. Wyświetl nazwiska pracowników i daty zamówień

SELECT
    LastName,
    OrderDate
FROM employees
    INNER JOIN orders ON employees.employeeID = orders.employeeID;
 
-- 4. Wyświetl nazwy towarów, nazwy kategorii

SELECT
    productname,
    categoryname
FROM products
    INNER JOIN categories ON products.categoryid = categories.categoryid;
 
-- 5. Wyświetl nazwy towarów, nazwy kategorii i idzamówień
SELECT ProductName, CategoryName, OrderID
FROM products
    INNER JOIN categories ON products.CategoryID = categories.CategoryID
    INNER JOIN order_details ON products.ProductID = order_details.ProductID;



-- 6. Wyświetl nazwy towarów, nazwy kategorii, daty zamówień i idklienta

SELECT ProductName, CategoryName, OrderDate, CustomerID
FROM products
    INNER JOIN categories ON products.CategoryID = categories.CategoryID
    INNER JOIN order_details ON products.ProductID = order_details.ProductID
    INNER JOIN orders ON order_details.OrderID = orders.OrderID;
 
-- 7. Wyświetl nazwy towarów, nazwy kategorii, daty zamówień i nazwę firmy klienta
 
SELECT ProductName, CategoryName, OrderDate, CustomerName
FROM products
    INNER JOIN categories ON products.CategoryID = categories.CategoryID
    INNER JOIN order_details ON products.ProductID = order_details.ProductID
    INNER JOIN orders ON order_details.OrderID = orders.OrderID
    INNER JOIN customers ON orders.CustomerID = customers.CustomerID;

-- 8. Ile razy był zamawiany dany produkt? (podaj nazwy produktów)
 
SELECT productname, count(*) as times
from products
inner JOIN order_details ON products.ProductID = order_details.ProductID
Group BY productname;


-- 9. Wyświetl nazwy firm klientów, daty zamówień i nazwy towarów

SELECT
    CustomerName,
    OrderDate,
    
