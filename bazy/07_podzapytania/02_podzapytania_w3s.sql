-- Podzapytanie wybierające wiele wartości
-- 1. Wybierz dane klientów, którzy nie kupili żadnego produktu z kategorii Confections
 
SELECT CustomerName, country
FROM customers
WHERE CustomerID NOT IN (
    SELECT CustomerID
    FROM orders
        INNER JOIN order_details ON orders.OrderID = order_details.OrderID
        INNER JOIN products ON order_details.ProductID = products.ProductID
        INNER JOIN categories ON products.CategoryID = categories.CategoryID
    WHERE CategoryName = 'Confections'
);


-- 2. Czy są jacyś klienci którzy nie złożyli żadnego zamówienia w 1997 roku, jeśli tak to pokaż ich dane adresowe.
SELECT CustomerName, Country, Address, City
FROM customers
WHERE CustomerID NOT IN(
    SELECT CustomerID
    FROM orders
    WHERE OrderDate LIKE '1997%'
);

-- 3. Wyświetl nazwiska i imiona pracowników, którzy nie sprzedali niczego do Argentyny.

SELECT
    firstname,
    lastname
FROM employees
WHERE employeeID IN(
    SELECT employeeID
    FROM orders
        INNER JOIN customers USING(CustomerID)
    WHERE country = 'Argentina'
);

-- 4. Wypisz nazwy i kraje klientów, którzy zawsze zamawiali tylko jeden produkt.

SELECT
    customername,
    country
FROM customers
WHERE customerid NOT IN(
    SELECT customerid
    FROM orders
        INNER JOIN order_details USING(orderid)
    GROUP BY orderid
    HAVING COUNT(productID) > 1
);

 
 
 
 
-- Podzapytania i zapytania DML
-- 1. Usuń wszystkich szczegóły zamówień (wiersze z OrderDetails) dotyczące produktu o nazwie "Chang"

DELETE FROM order_details
WHERE ProductID IN(
    SELECT ProductID
    FROM Products
    WHERE ProductName LIKE 'Chang'
);


-- 2. Zwiększ o 10% ceny wszystkich produktów z kategorii "Confections"

UPDATE products
SET price = price*1.10
WHERE CategoryID IN(
    SELECT 
        CategoryID
    FROM categories
    WHERE CategoryName = 'confections'
);

-- 3. Zmniejsz o 5% ceny wszystkich produktów dostarczanych przez dostawców z  Tokyo  (city)
UPDATE products
SET price = price*0.95
WHERE SUPPLIERID IN(
    SELECT SUPPLIERID
    FROM suppliers
    WHERE City = 'Tokyo'
);
-- 4. Usuń wszystkie produkty z kategorii  o opisie "Cheeses" (Description)  o cenie większej od 50

-- 5. Zwiększ o 10% cenę wszystkich produktów z kategorii o nazwie zaczynającej się na literę C 

-- 6. Usuwamy wszystkie produkty dostarczane przez dostawców z USA

-- 7. Usuń wszystkie zamówienia z Orders złożone przez klientów z Londynu ('London').

 
-- Podzapytania wybierające jedną wartość
-- 1. Podaj wszystkie produkty których cena jest mniejsza niż średnia cena produktu danej kategorii 
 
-- 2. Dla każdego produktu podaj jego nazwę, cenę, średnią cenę wszystkich produktów oraz różnicę między ceną produktu a średnią ceną wszystkich produktów
 
 
 
 
 
 
-- ------------------ NIETYPOWE ----------------------------------------------------------------------------
-- 1. Podaj produkty kupowane przez więcej niż 10 klientów (lub 10 różnych klientów - wsk. utwórz zapytanie wybierające różne wiersze CustomerID, ProductID z tabel Orders i OrdersDetalis i użyj jako podzapytanie w części FROM)
 
-- 2. Wybierz nazwy i numery telefonów klientów, którzy kupili więcej niż 3 różne produkty z kategorii .Confections.
 
-- 3. Dla każdego produktu podaj maksymalną liczbę zamówionych jednostek
 
-- 4. Dla każdego produktu podaj jego nazwę kategorii, nazwę produktu, cenę, średnią cenę wszystkich produktów danej kategorii oraz różnicę między ceną produktu a średnią ceną wszystkich produktów danej kategorii.
 
-- 5. Podaj łączną wartość zamówienia o numerze 1025 (uwzględnij cenę za przesyłkę). 
 
-- 6. Podaj łączną wartość zamówień każdego zamówienia (uwzględnij cenę za przesyłkę).
 
-- 7. Podaj produkty kupowane przez więcej niż jednego klienta
 
-- 8. Podaj produkty kupowane przez więcej niż 20 klientów