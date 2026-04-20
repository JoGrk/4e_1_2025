SELECT CEIL( MAX(price)) AS max_price
FROM Products;

SELECT productname, categoryname, price
FROM Products
inner join categories on categories.categoryid=Products.categoryid
where price between 10 and 50;

-- do zadania produkty dostarczane przez dostawców

SELECT SuplierID, supplierName
FROM suppliers;

SELECT ProductName, Price
FROM Products
WHERE SupplierID = 2;

-- do zadania firmy spedycyjne

SELECT ShipperID, ShipperName
FROM Shippers;

SELECT OrderDate, OrderID
FROM orders
WHERE ShipperID =1;