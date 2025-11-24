
-- 1. Utwórz bazę danych inicjały_raporty i wykonaj w niej plik baza.sql 
-- 2. Wyświetl wszystkie nazwy dań (pole nazwa, tabela dania), każdy jako osobny element listy numerowanej

SELECT nazwa
FROM dania;

-- 3. Wyświetl imiona i nazwiska pracowników w postaci listy wypunktowanej w formacie: "[imię] [nazwisko]"  (pola imie, nazwisko z tabeli pracownicy)

SELECT imie, nazwisko 
FROM pracownicy;

-- 4. wyświetl markę model, kolor i stan samochodów w postaci listy wypunktowanej w formacie: "[kolor] [marka] [model], stan [stan]" (pola marka, model, kolor, stan z tabeli samochody)

SELECT kolor, marka, model, stan
FROM samochody;