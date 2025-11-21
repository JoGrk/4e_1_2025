-- 1. Tabela Order_Details. Wyświetl sumę wszystkich sprzedanych ilości (Quantity)

SELECT SUM(Quantity)
FROM Order_Details;

-- 2. Products. 

-- A.Wyświetl najpierw 23% podatek z ceny (price) oraz nazwę produktu (productname). 

SELECT ROUND(0.23*price,2), productname
FROM Products;

-- B.Następnie wyświetl średni 23% podatek z cen wszystkich produktów

SELECT ROUND(AVG(0.23*price),2)
FROM Products;
-- 3 Products. Zlicz ilość produktów.

SELECT COUNT(productID)
FROM Products;

-- 4. Product. Pogrupuj produkty według CategoryID i oblicz dla każdej kategorii najwyższą i najniższą cenę. Dane posortuj rosnąco według najwyższej ceny
SELECT CategoryID, MAX(price), MIN(price)
FROM Products
GROUP BY CategoryID
ORDER BY MAX(price);
-- 5. Products

-- A. Wyświetl wszystkie towary sprzedawane w butelkach ( unit zawiera tekst  "bottle")
DESC Products;

SELECT productname, unit
FROM Products
WHERE unit like '%bottle%';
-- B. Pogrupuj według kategorii (CategoryID)  i policz ilość produktów w każdej kategorii. Do zapytania wybierz tylko produkty sprzedawane w butelkach.

SELECT 
    CategoryID,
    COUNT(*)
FROM Products
WHERE unit LIKE '%bottle%'
GROUP BY CategoryID;


-- 6. Customers

-- A. Policz, ilu jest klientów w poszczególnych krajach. Dane posortuj malejąco według ilości klientów

SELECT
    country,
    COUNT(*) AS ilosc_klientow
FROM Customers
GROUP BY country
ORDER BY ilosc_klientow DESC;

-- B.  Policz, ilu jest klientów w poszczególnych krajach. Dane posortuj malejąco według ilości klientów, wyświetl tylko te kraje, w których jest co najmniej 10 klientów

SELECT
    country,
    COUNT(*) AS ilosc_klientow
FROM Customers
GROUP BY country
HAVING ilosc_klientow >= 10
ORDER BY ilosc_klientow DESC;

-- 7. Products

-- A. Dla poszczególnych dostawców (SupplierID) oblicz maksymalną cenę.

SELECT SupplierID, MAX(price)
FROM Products
GROUP BY SupplierID;

-- B. Wyświetl supplierID, cenę oraz unit produktów sprzedawanych w paczkach (pole unit zawiera tekst 'pkg')


-- C. Dla poszczególnych dostawców (SupplierID) oblicz maksymalną cenę, do zapytania wybierz tylko produkty sprzedawane w paczkach

SELECT SupplierID, MAX(price)
FROM Products
WHERE unit LIKE '%pkg%'
GROUP BY SupplierID;

-- D. Dla poszczególnych dostawców (SupplierID) oblicz maksymalną cenę, do zapytania wybierz tylko produkty sprzedawane w paczkach, ale wyświetl tylko te wiersze, w których maksymalna cena jest większa od 50

SELECT SupplierID, MAX(price)
FROM Products
WHERE unit LIKE '%pkg%'
GROUP BY SupplierID
HAVING MAX(price) > 50;

-- 8. OrderDetails

-- A. Dla poszczególnych produktów (productID) podaj średnią, minimalną oraz maksymalną ilość sprzedawaną w ramach zamówienia (quantity)

SELECT productID, ROUND(AVG(quantity),2), MIN(quantity), MAX(quantity)
FROM Order_Details
GROUP BY productID;
-- B. z powyższego zestawienia wybierz tylko te wiersze, w których ta średnia ilość jest mniejsza od 20
SELECT productID, ROUND(AVG(quantity),2), MIN(quantity), MAX(quantity)
FROM Order_Details
GROUP BY productID
HAVING AVG(quantity) < 20;
-- 9.  Customers. Z jakiego kraju jest najwięcej klientów? (jest tylko jeden taki kraj)

SELECT country, COUNT(*)
FROM Customers
GROUP BY country
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 10. Products. Wymień trzy id kategorii z najdroższymi produktami (o największej średniej)

SELECT CategoryID, AVG(price)
FROM Products
GROUP BY CategoryID
ORDER BY AVG(price) DESC
LIMIT 3;
