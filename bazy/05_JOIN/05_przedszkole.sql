 use 4e_1_przedszkola;
--  A. Ile jest chętnych do przyjęcia do poszczególnych przedszkoli? Wyświetl nazwę przedszkola i ilość chętnych.

SELECT nazwa_przedszkola, COUNT(*)
FROM dzieci
    INNER JOIN przedszkola ON dzieci.Id_przedszkola = przedszkola.ID_przedszkola
GROUP BY nazwa_przedszkola;


-- B. Ilu jest chętnych do przyjęcia do poszczególnych przedszkoli, uwzględnij wyłącznie trzylatków
SELECT nazwa_przedszkola, COUNT(*)  
FROM dzieci
    INNER JOIN przedszkola ON dzieci.Id_przedszkola = przedszkola.ID_przedszkola
WHERE wiek = 3
GROUP BY nazwa_przedszkola;
-- C. Wyświetl imiona i nazwiska dzieci, które mają na liście preferencji przedszkole mające w nazwie "Zuch". 

SELECT
    imie,
    nazwisko,
    nazwa_przedszkola
FROM dzieci
    INNER JOIN przedszkola ON dzieci.Id_przedszkola = przedszkola.ID_przedszkola
WHERE nazwa_przedszkola LIKE '%zuch%';
 
-- D. Wyświetl imiona i nazwiska dzieci, które chodzą do przedszkola o identyfikatorze 16, 14, 8,28, 27 . Wyświetl nazwy przedszkoli. Użyj operatora IN
SELECT imie, nazwisko, nazwa_przedszkola
FROM dzieci
    INNER JOIN przedszkola ON dzieci.Id_przedszkola = przedszkola.ID_przedszkola
WHERE przedszkola.Id_przedszkola IN(16,14,8,28,27);
 
-- E. Policz, ilu jest kandydatów do poszczególnych przedszkoli (wyświetl nazwy przedszkoli), uwzględnij tylko chłopców. Dane uporządkuj malejąco według ilości chętnych. Wyświetl tylko te wiersze, w których  ta ilość jest większa od 15.

SELECT 
    COUNT(*) AS kandydaci,
    nazwa_przedszkola,
    plec
FROM dzieci
    INNER JOIN przedszkola USING (Id_przedszkola)
WHERE plec = 'chlopiec'
GROUP BY nazwa_przedszkola
HAVING kandydaci > 15
ORDER BY kandydaci DESC;

-- F. Policz, ilu jest chętnych do poszczególnych przedszkoli. Wyświetl nazwy przedszkoli i liczbę miejsc w przedszkolach. Czy są takie przedszkola, w których liczba chętnych jest różna od ilości miejsc? 

SELECT
    COUNT(*),
    nazwa_przedszkola,
    liczba_miejsc
FROM przedszkola
    INNER JOIN dzieci USING (ID_przedszkola)
GROUP BY nazwa_przedszkola
HAVING COUNT(*) != liczba_miejsc;
 
-- G. Utwórz uporządkowaną alfabetycznie według nazwisk, listę pięcioletnich dziewczynek, które są zapisane do przedszkola Smerf lub Stokrotka.

SELECT
    nazwisko
FROM dzieci
    INNER JOIN przedszkola USING (Id_przedszkola)
WHERE wiek = 5
    AND plec = 'dziewczynka'
    AND (nazwa_przedszkola LIKE '%smerf%' OR nazwa_przedszkola LIKE '%stokrotka%')
ORDER BY nazwisko;

-- H.  Podaj nazwy czterech przedszkoli, które mają największą ilość chętnych (uporządkowane malejąco według ilości chętnych) 

SELECT
    nazwa_przedszkola,
    COUNT(*) AS chetni
FROM dzieci INNER JOIN przedszkola USING (Id_przedszkola)
GROUP BY nazwa_przedszkola
ORDER BY chetni DESC
LIMIT 4;