-- Utwórz zapytania, które wyświetlą:

--  1.Sumę wartości wszystkich zamówień (suma pola wartosc z tabeli zamowienia)
SELECT SUM(wartosc)
FROM zamowienia;

-- 2.  Średnią wartość wszystkich zamówień
SELECT AVG(wartosc)
FROM zamowienia;

-- 3. Ilość sprzedawców w bazie (tabela sprzedawcy)
SELECT COUNT(*)
FROM sprzedawcy;
-- 4. Największą wartość zamówienia

SELECT MAX(wartosc)
FROM zamowienia;

-- GROUP BY 

-- 5.  tabela klienci; pogrupuj według miast i dla każdego miasta podaj najwyższą ocenę ( jaka jest najwyższa ocena w każdym z tych miast)

-- 6. tabela zamówienia: pogrupuj według idsprzedawcy i dla każdego z nich podaj najwyższą wartość zamówienia

-- WHERE

-- 7. tabela zamowienia: pogrupuj według idsprzedawcy i dla każdego z nich podaj najwyższą wartość zamówienia, ale wybierz tylko daty zamówienia z lipca, sierpnia i września 2012 (..........WHERE date beteen '2012-07-01' AND .........)

-- HAVING

-- 8. tabela zamowienia: pogrupuj według idKlienta, oblicz najwyższą wartość, wyświetl tylko te dane, w których ta największa wartość jest większa od 2000 (......... HAVING max(wartosc) > 2000 ............)

-- 9.  tabela zamowienia: pogrupuj według idKlienta, oblicz najwyższą wartość, wyświetl tylko te dane, w których ta największa wartość jest z przedziału od 2000 do 6000

-- WHERE i HAVING

-- 10. tabela zamowienia: pogrupuj według idKlienta, oblicz najwyższą wartość, ale do zamówienia wybierz tylko klientów o ID z zakresu od 3002 do 3007 (..... WHERE IDKlienta BETWEEN .... AND ....  ......... )

-- 11.  tabela zamowienia: pogrupuj według idKlienta, oblicz najwyższą wartość, do zamówienia wybierz tylko klientów o ID z zakresu od 3002 do 3007 (WHERE) , a następnie wyświetl tylko te wiersze, w których ta najwyższa wartość jest większa od 1000

-- 12. tabela zamowienia: pogrupuj według IDSprzedawcy, oblicz najwyższą wartość zmówienia, ale tylko dla sprzedawców o ID z zakresu od 5003 do 5008

-- 13. tabela zamówienia: oblicz ile było zamówień z datą '2012-08-17' (WHERE, bez group by)

-- 14. tabela sprzedawcy: ilu jest sprzedawców, dla których podane jest miasto? (WHERE, not null, bez group by)

-- 15.tabela zamówienia: policz ile było zamówień dokonanych w poszczególnych dniach (pogrupuj według daty, policz idzamówienia)