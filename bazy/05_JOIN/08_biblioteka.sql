use use 4e_1_biblioteka_pg
-- 1. Biblioteka potrzebuje informacji o wypożyczeniach książek. Proszę podać autorów, tytuły książek i oraz daty ich wypożyczeń. 

SELECT autor_nazwisko, autor_imie, tytul, Data_wypozyczenia
FROM ksiazka 
    INNER JOIN wypozyczenia ON ksiazka.sygnatura = wypozyczenia.ksiazka_sygnatura;

-- 2. Dodaj nową książkę, aby mieć pewność, że są takie, które nigdy nie były wypożyczone. Wyświetl książki, które nigdy nie zostały wypożyczone.

SELECT autor_nazwisko, autor_imie, tytul, Data_wypozyczenia
FROM ksiazka 
    LEFT JOIN wypozyczenia ON ksiazka.sygnatura = wypozyczenia.ksiazka_sygnatura
WHERE Data_wypozyczenia IS NULL;

-- 3. Utwórz zestawienie pokazujące ile razy zostały wypożyczone książki (tytuł, autor, ilość wypożyczeń). W zestawieniu uwzględnij także te książki, które nigdy nie były wypożyczone.

SELECT tytul, autor_nazwisko, COUNT(Data_wypozyczenia)
FROM ksiazka 
    LEFT JOIN wypozyczenia ON ksiazka.sygnatura = wypozyczenia.ksiazka_sygnatura
GROUP BY Sygnatura;

-- 4. Które osoby figurujące w bazie jako czytelnicy, nie wypożyczyły ani razu choćby jednej książki?

SELECT Czytelnik_Nazwisko
FROM czytelnik
    LEFT JOIN wypozyczenia ON czytelnik.ID = wypozyczenia.czytelnik_id
WHERE Data_wypozyczenia IS NULL;

-- 5.  Jacy czytelnicy nie są przypisani do żadnego wydziału

SELECT
    Czytelnik_Imie,
    Czytelnik_Nazwisko,
    wydzial.wydzial,
    czytelnik.wydzial
FROM czytelnik LEFT JOIN wydzial ON czytelnik.wydzial = wydzial.ID
WHERE wydzial.wydzial IS NULL;

SELECT
    Czytelnik_Imie,
    Czytelnik_Nazwisko
FROM czytelnik
WHERE wydzial = '';

-- 6. Wyświetl ranking czytelników pokazujący wszystkich z informacja, ile razy wypożyczyli cokolwiek (lista ma zawierać wszystkich czytelników – nawet tych, którzy nic nie wypożyczyli)

SELECT
    Czytelnik_Imie,
    Czytelnik_Nazwisko,
    COUNT(Data_wypozyczenia) AS wypozyczenia
FROM czytelnik
    LEFT JOIN wypozyczenia ON wypozyczenia.czytelnik_id = czytelnik.id
GROUP BY czytelnik.id
ORDER BY wypozyczenia DESC;