-- 1, Przygotuj zapytanie wyświetlające dane dotyczące klientów: nazwa, miasto, kraj, dane ogranicz tylko do klientów, którzy zamawiali towary w lipcu dowolnego roku

SELECT CustomerName, City, Country
FROM customers
    INNER JOIN orders ON customers.CustomerID = orders.CustomerID
WHERE OrderDate LIKE '%-07-%';