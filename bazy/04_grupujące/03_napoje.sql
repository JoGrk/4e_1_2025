USE 4e_1_group;
-- 1. Wyświetl średnią, najwyższą i najniższą kaloryczność napojów. Zmień nazwy kolumn na (odpowiednio) srednia_kalorycznosc, maksymalna_kalorycznosc, minimalna_kalorycznosc.
 
SELECT MIN(kalorie), MAX(Kalorie), AVG(kalorie)
FROM drinki_informacje;

-- 2. wyświetl średnią kaloryczność poszczególnych kolorów napojów. Zmień nazwę kolumny ze średnią na srednia_kalorycznosc. Dane posortuj według średniej kaloryczności.
 
-- 3. Wyświetl średnią cenę drinków z lodem i drinków bez lodu (w jednym zapytaniu). zmień nazwę kolumny srednia_cena.
 
-- 4. Wyświetl ilość napojów z poszczególnych kolorów. Zmodyfikuj zapytanie tak, aby były wyświetlane tylko te kolory, w których są co najmniej dwa drinki
 
-- 5. Ile jest napojów w poszczególnych kolorach. Do zapytania wybierz tylko drinki z lodem. 
 
-- 6. Wyświetl średnią kaloryczność napojów z lodem i bez lodu (w jednym zapytaniu). - do zapytania wybierz tylko drinki rozpoczynające się literą S lub B. Posortuj według średniej kaloryczności.
 
-- 7. Wyświetl maksymalną ilość węglowodanów w poszczególnych kolorach. Wyświetl tylko te wiersze, w których maksymalna ilość węglowodanów jest większa od 5. Dane posortuj malejąco według maksymalnej ilości kalorii. 
