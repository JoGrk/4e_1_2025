--  Lista rozwijana z nazwami krajów z których pochodzą klienci (tylko tych krajów) - wyświetla nazwy klientów z tego kraju

-- nazwę kraju
SELECT DISTINCT country
FROM customers
ORDER BY country;
-- nazwy klientów z Francji
SELECT customername
FROM customers
WHERE Country = 'France'
ORDER BY customername;

-- pole tekstowe, gdzie podajemy początek nazwy produkty i są wyświetlone produkty razem z ceną. Uwaga, ceny podajemy w zł, z dokładnością do dwóch miejsc po przecinku. Jeśli nic nie będzie wpisane do pola, powinny być wyświetlone wszystkie produkt

SELECT 
    ProductName,
    Price
FROM Products
WHERE ProductName LIKE 'CH%';