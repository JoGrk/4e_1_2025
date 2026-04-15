-- select
-- 1.  Wypisać nazwę wszystkich towarów, cenę i pole ze średnią cenę wszystkich towarów

-- 2 . Wypisać nazwę towaru, cenę i różnicę między jego ceną a średnią ceną wszystkich towarów

-- 3. wypisze nazwę towaru, cenę oraz ile razy jego cena jest większa od najmniejszej ceny wszystkich towarów (stosunek ceny do ceny minimalnej)

-- where
-- 4.  wybieramy te zamówienia, w których łączna ilość zamówionych produktów jest mniejsza od średniej ilości zamawianych produktów

-- 5. zapytanie zwracające nazwę najtańszego towaru

-- 6. zapytanie zwracające nazwy i ceny wszystkich produktów z kategorii Seafood o cenach niższych niż średnia cena produktów

-- 7. wyświetl nazwę i cenę towarów, które zostały zamówione (kiedykolwiek) w ilości co najmniej 15 sztuk (Quantity )
SELECT DISTINCT ProductName, price
FROM Products
    INNER JOIN order_details ON products.productID = order_details.productID
WHERE Quantity >= 15;

SELECT ProductName, price
FROM Products
WHERE ProductID IN (
    SELECT DISTINCT ProductID
    FROM order_details
    WHERE Quantity >= 15
);

-- 8. wyświetl nazwę i cenę towarów, które zawsze są zamawiane w ilości co najmniej 15 sztuk (Quantity ) (i były co najmniej raz zamówione)
SELECT ProductName, price
FROM Products
WHERE ProductID NOT IN (
    SELECT ProductID
    FROM order_details
    WHERE Quantity < 15
);
-- 9. Wyświetl nazwiska i imiona klientów (Customer Name), którzy nie korzystali z firmy  Speedy Express
SELECT CustomerName 
FROM Customers
WHERE CustomerID NOT IN(
    SELECT CustomerID
    FROM orders
        INNER JOIN Shippers USING(ShipperID)
    WHERE ShipperName = 'Speedy Express'
);

-- 10. Wszystkie informacje o klientach, mających tę samą wartość w polu CustomerName (może wpisanych przez pomyłkę?)

INSERT INTO customers
(customername, country)
VALUES
('Wolski','Polska');

SELECT *
FROM customers
WHERE customername IN (
        SELECT
            customername
        FROM customers
        GROUP BY  customername
        HAVING COUNT(customername) > 1
);

SELECT
    customername,
    COUNT(customername) AS wystapienia
FROM customers
GROUP BY  customername
HAVING wystapienia > 1;

-- update

-- 11 Podnieś o 10% ceny produktów z kategorii  "Confections"

UPDATE Products
SET Price = 1.10*Price
WHERE CategoryID IN (
    SELECT 
        CategoryID
    FROM Categories
    WHERE CategoryName = 'Confections'
);



-- 12  Dla zamówień klientów z UK zmień spedytora na "United Package"

UPDATE orders
SET ShipperID = (
    SELECT 
        shipperid
    FROM Shippers
    WHERE shippername = 'United Package'
)
WHERE customerid IN(
    SELECT 
        CustomerID
    FROM customers
    WHERE COUNTRY = 'UK'
);

SELECT 
    shipper

-- 13. Dodaj nowy produkt z kategorii Confections dostarczony przez Exotic Liquid 

INSERT INTO Products
(ProductName, CategoryID, SUPPLIERID)
VALUES (
    'jakas',
    (select CategoryID from Categories where CategoryName = 'confections'),(select SuplierID from suppliers where supplierName = 'Exotic Liquid')
);