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
 
-- 6. Wyświetl nazwy towarów, nazwy kategorii, daty zamówień i idklienta
 
-- 7. Wyświetl nazwy towarów, nazwy kategorii, daty zamówień i nazwę firmy klienta
 
-- 8. Ile razy był zamawiany dany produkt? (podaj nazwy produktów)
 
-- 9. Wyświetl nazwy firm klientów, daty zamówień i nazwy towarów
