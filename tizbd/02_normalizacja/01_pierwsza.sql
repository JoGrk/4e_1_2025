-- 1. Utwórz bazę 4e_1_firma

-- 2. Utwórz tabelę Pracownicy

CREATE TABLE Pracownicy(
    idpracownik int,
    imie_nazwisko varchar(100),
    jezyk varchar(100),
    adres varchar(100)
);

-- idpracownik
-- imię nazwisko
-- język
-- adres

-- 3. wpisz dane:
INSERT INTO Pracownicy
VALUES
(1, 'Jan Kowalski', 'PHP', 'os. Wł. Łokietka 3/4 Naklo nad Notecia'),
(2, 'Antoni Malinowski', 'HTML CSS PHP' , 'Chrzastowo 1'),
(3, 'Jan Malinowski', 'Java  HTML', 'ul. Ogrodowa 2, Nowa Wies Wielka'),
(4, 'Andrzej Ziemianski', 'JavaScript CSS HTML','ul. Sowia 5, Nowa Wies');

-- 4. Wykonaj zapytania

-- A. Wypisz pracowników, którzy znają język PHP
SELECT * FROM Pracownicy
WHERE jezyk like '%PHP%';
-- B. Wypisz pracowników, którzy znają język Java
SELECT * FROM Pracownicy
WHERE jezyk LIKE '%Java%';
-- C. Wypisz pracowników mieszkających w Nakle nad Notecią
SELECT * FROM Pracownicy
WHERE adres LIKE '%Naklo nad Notecia%';
-- D. Wypisz pracowników mieszkających w Nowej Wsi
SELECT * FROM Pracownicy
WHERE adres LIKE '%Nowa Wies%';
-- E. Wypisz wszystkie nazwy miejscowości pracowników
SELECT * FROM Pracownicy
WHERE adres LIKE '%%';

-- C. Wypisz imiona i nazwiska pracowników posortowane według nazwisk (ORDER BY)
-- 5. Jeśli masz problemy z wykonaniem zapytań, popraw strukturę tabeli i wpisz na nowo dane - tak, aby tych problemów już nie mieć

DROP TABLE Pracownicy;

CREATE TABLE Pracownicy(
    id_pracownika int,
    imie varchar(100),
    nazwisko varchar(100),
    jezyk varchar(100),
    miejscowosc varchar(100),
    numer_domu varchar(100),
    ulica varchar(100)
);

INSERT INTO Pracownicy
(id_pracownika, imie, nazwisko, jezyk, ulica, numer_domu, miejscowosc)
VALUES
(1, 'Jan', 'Kowalski', 'PHP', 'os. Wł. Łokietka', '3/4', 'Naklo nad Notecia'),
(2, 'Antoni', 'Malinowski', 'HTML' ,'', '1','Chrzastowo'),
(2, 'Antoni', 'Malinowski', 'CSS' ,'', '1','Chrzastowo'),
(2, 'Antoni', 'Malinowski', 'PHP' ,'', '1','Chrzastowo'),
(3, 'Jan', 'Malinowski', 'Java', 'ul. Ogrodowa', '2', 'Nowa Wies Wielka'),
(3, 'Jan', 'Malinowski', 'HTML', 'ul. Ogrodowa', '2', 'Nowa Wies Wielka'),
(4, 'Andrzej', 'Ziemianski', 'JavaScript','ul. Sowia', '5', 'Nowa Wies'),
(4, 'Andrzej', 'Ziemianski', 'CSS','ul. Sowia', '5', 'Nowa Wies'),
(4, 'Andrzej', 'Ziemianski', 'HTML','ul. Sowia', '5', 'Nowa Wies');


-- B. Wypisz pracowników, którzy znają język Java
SELECT * FROM Pracownicy
WHERE jezyk='Java';

-- D. Wypisz pracowników mieszkających w Nowej Wsi
SELECT * FROM Pracownicy
WHERE miejscowosc ='Nowa Wies';
-- E. Wypisz wszystkie nazwy miejscowości pracowników
SELECT DISTINCT miejscowosc 
FROM Pracownicy
ORDER BY miejscowosc;
-- C. Wypisz imiona i nazwiska pracowników posortowane według nazwisk (ORDER BY)

SELECT DISTINCT imie, nazwisko
FROM Pracownicy
ORDER BY nazwisko;

-- 1. Każda porządna tabela powinna posiadać klucz, dodaj pole jeśli trzeba. 



-- 2. Jan Malinowski poznał nowy język (CSS) - dopisz do tabeli.

-- 3. Antoni Malinowski poznał nowy język - JavaScript i zmienił adres na Naklo nad Notecia, Staszica 1 - dopisz nowy wiersz do tabeli

-- 4. Usuwamy informację o znajomości PHP (bo tak)

-- 5. Popraw strukturę tabeli tak, aby nie było tych problemów (redundacja, anomalia wstawiania, aktualizacji, usuwania)