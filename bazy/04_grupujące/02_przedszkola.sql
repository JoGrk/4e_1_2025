 CREATE DATABASE 4e_1_group;
 USE 4e_1_group;
-- 4. Wyświetl łączną liczbę miejsc we wszystkich przedszkolach
SELECT SUM(liczba_miejsc)
FROM przedszkola;
 
-- 5. Jaka jest średnia liczba miejsc we wszystkich przedszkolach? Zmień nazwę kolumny na srednia_liczba_miejsc

SELECT AVG(liczba_miejsc) AS srednia_liczba_miejsc
FROM przedszkola;

 
-- 6. Jaka jest maksymalna i minimalna liczba miejsc w przedszkolach? Zmień nazwę kolumn na najmniejsza_liczba i najwieksza_liczba

SELECT 
    MAX(liczba_miejsc) AS maksymalna_liczba_miejsc, 
    MIN(liczba_miejsc) AS minimalna_liczba_miejsc
FROM przedszkola;

-- 7. Pogrupuj przedszkola według ilości miejsc, policz ile przedszkoli ma poszczególną liczbę miejsc.

SELECT liczba_miejsc, COUNT(*)
FROM przedszkola
GROUP BY liczba_miejsc;

 
-- 8. Zmodyfikuj powyższe zapytanie tak, aby były wyświetlone tylko te wiersze, w których liczba takich przedszkoli jest większa od dwóch.

SELECT liczba_miejsc, COUNT(*) AS liczba_przedszkoli
FROM przedszkola
GROUP BY liczba_miejsc
HAVING liczba_przedszkoli > 2;

-- 9.Jaka łączna liczba dzieci stara się o przyjęcie do przedszkoli?

SELECT COUNT(*)
from dzieci;

-- 10. Ile dzieci stara się do poszczególnych przedszkoli? (wyświetl Id_przedszkola oraz liczbę dzieci starających się o przyjęcie do tego przedszkola)

SELECT Id_przedszkola, COUNT(*)
FROM dzieci
GROUP BY Id_przedszkola;

 
-- 11. Zmodyfikuj powyższe zapytanie tak, aby wyświetlane były tylko te wiersze, w których liczba starających się dzieci jest większa od 30

SELECT Id_przedszkola, COUNT(*)
FROM dzieci
GROUP BY Id_przedszkola
HAVING COUNT(*) > 30;
 
-- 12. Pogrupuj dane według wieku dzieci i wyświetl ile jest dzieci w poszczególnym wieku starających się o przyjęcie do przedszkola (wyświetl wiek dzieci oraz liczbę dzieci)
SELECT wiek, COUNT(*) as liczba_dzieci
from dzieci
GROUP by wiek;
 
-- 13. Zmodyfikuj powyższe zapytanie tak, aby wyświetliło tylko dane dotyczące chłopców.
SELECT wiek, COUNT(*) as liczba_dzieci
FROM dzieci
WHERE plec = 'chlopiec'
GROUP BY wiek;
 
-- 14. Jaki jest średni wiek chłopców, a jaki średni wiek dziewczynek? (w jednym zapytaniu)

SELECT plec, AVG(wiek)
FROM dzieci
GROUP BY plec;
 
-- 15. Ile małych dzieci stara się do poszczególnych przedszkoli (do zapytania wybierz tylko trzylatków i czterolatków)
SELECT Id_przedszkola, COUNT(*)
FROM dzieci
WHERE wiek = 3 or wiek = 4
GROUP BY Id_przedszkola
;