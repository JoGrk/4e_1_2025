-- policz ilość wszystkich rekordów (zapisów) ;

SELECT COUNT(*)
FROM towar;
-- z opisami - największą i najmniejsza CENĘ, oraz średnią arytmetyczną CENY ;
SELECT 
    MAX(cena) as 'największa cena', 
    MIN(cena) 'najmniejsza cena',
    ROUND(AVG(cena),2) as 'srednia cena'
FROM towar;

-- sumę wartości towarów, średnią arytmetyczną wartości (ILOSC * CENA) ;

SELECT 
    SUM(ilosc * cena) AS suma_wartosci,
    ROUND(AVG(ilosc * cena),2) AS srednia_wartosc
FROM towar;

-- policz średnią arytmetyczną ceny, a później policz ręcznie średnią arytmetyczną ceny = suma CENY / ilość rekordów. 

SELECT ROUND(AVG(cena)), ROUND(SUM(cena)/COUNT(*))
FROM towar;

-- Wyświetl średnią cenę wszystkich towarów o cenie pomiędzy 10 a 1000 zł

SELECT
    ROUND(AVG(cena),2) AS sr_cena
FROM towar
WHERE cena BETWEEN 10 AND 1000;

-- wyświetl sumę masy (ilosc * waga) , ale tylko dla rodzaju  GD i TR

SELECT
    SUM(ilosc * waga)
FROM towar
WHERE rodzaj = 'GD' OR rodzaj = 'TR';

-- Wyświetl łączną ilość wszystkich zamówionych produktów,

SELECT COUNT(*)
FROM towar
WHERE zamow = 'PRAWDA';

-- wyświetl największą wartość (ilosc * cena)  towarów wyprodukowanych w 1997 roku
SELECT MAX(ilosc * cena) as najwiejsza_wartosc
FROM towar
WHERE DATA_PROD like '1997%';

-- policz ile rekordów jest w każdym RODZAJU 

SELECT RODZAJ, COUNT(*)
FROM towar
GROUP BY rodzaj;

-- policz ile rekordów jest w każdym RODZAJU, posortuj malejąco wg RODZAJU;

SELECT RODZAJ, COUNT(*)
FROM towar
GROUP BY rodzaj 
ORDER BY rodzaj DESC;

-- policz sumę i średnią arytmetyczną wartości (ilość * cena) i minimalnej i maksymalnej masie (ilość * waga) dla każdego RODZAJU towaru ;

SELECT 
    rodzaj,
    SUM(ilosc*cena) AS suma_wartosci,
    ROUND(AVG(ilosc*cena)) AS srednia_wartosc,
    MIN(ilosc*waga) AS min_waga,
    MAX(ilosc*waga) AS max_waga
FROM towar
GROUP BY rodzaj;

-- policz ile rekordów jest w każdym RODZAJU - wyświetl ilości rekordów większe od 15 ;

SELECT
    rodzaj,
    COUNT(*) AS ilosc
FROM towar
GROUP BY rodzaj
HAVING ilosc > 15;

-- policz średnią arytmetyczną ceny dla każdego RODZAJU - wyświetl średnie mniejsze od 500;

SELECT
    rodzaj,
    ROUND(AVG(cena)) AS srednia_cena
FROM towar
GROUP BY RODZAJ
HAVING srednia_cena < 500;

-- dla każdego rodzaju towarów wyświetl ilość rekordów, średnią wagę, średnią ilość, maksymalną i minimalną cenę dla ilości rekordów w RODZAJU mniejszej od 15.

SELECT 
    rodzaj,
    COUNT(*) AS ilosc,
    ROUND(AVG(waga)) AS sr_waga,
    ROUND(AVG(ilosc)) AS sr_ilosc,
    MAX(cena) AS max_cena,
    MIN(cena) AS min_cena
FROM towar
GROUP BY rodzaj
HAVING ilosc < 15;

-- dla każdego rodzaju towarów wyświetl maksymalną cenę dla ilości rekordów w RODZAJU większe od 10. Uwzględnij tylko towary zamówione.

SELECT 
    rodzaj,
    MAX(cena)
FROM towar
WHERE zamow = 'PRAWDA'
GROUP BY rodzaj
HAVING count(*) > 10;

-- Oblicz minimalną cenę towarów niezamówionych dla każdego rodzaju. 

SELECT rodzaj, MIN(cena)
FROM towar
WHERE zamow != 'PRAWDA'
GROUP BY rodzaj;

-- oblicz średnią cenę towarów zamówionych (zamow) i nie zamówionych

SELECT
    zamow,
    ROUND(AVG(cena))
FROM towar
GROUP BY zamow;

-- oblicz średnią cenę towarów wyprodukowanych w 1999 roku  dla poszczególnych rodzajów towaru

SELECT
    rodzaj,
    ROUND(AVG(cena),2) AS sr_cena
FROM towar
WHERE data_prod LIKE '1999%'
GROUP BY rodzaj;