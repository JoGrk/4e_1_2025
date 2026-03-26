-- A. dodające nowego czytelnika Zuzannę Kowalską, kod pusty ( '' )

INSERT INTO czytelnicy
(imie,nazwisko,kod)
VALUES
('Zuzanna','Kowalska','');

-- B. wyświetlające id książki, tytuł, imię i nazwisko autora
SELECT ksiazki.id, tytul, imie, nazwisko
FROM Autorzy
    INNER JOIN ksiazki ON autorzy.id = ksiazki.id_autor;

-- C. usuwające książkę o id równym 37

DELETE FROM ksiazki
WHERE id =37;

-- D. wyświetlającą wypożyczenia: id, tytuł ksiązki, nazwisko czytelnika i datę oddania

SELECT 
    wypozyczenia.id,
    tytul,
    nazwisko,
    data_oddania
FROM wypozyczenia
    INNER JOIN ksiazki ON wypozyczenia.id_ksiazka = ksiazki.id
    INNER JOIN czytelnicy ON wypozyczenia.id_czytelnik = czytelnicy.id;

-- E. zmieniającą datę oddania wypożyczenia o id równym 2 na dzisiejszą  (CURRENT_DATE)

UPDATE wypozyczenia
SET data_oddania = CURRENT_DATE
WHERE id = 2;

-- F. wyświetla id czytelnika, imię i nazwisko
SELECT id, imie, nazwisko
FROM czytelnicy;
-- G. doda nowe wypozyczenie, czytelnik o id 1 oraz ksiązki o id 2, ustawiając datę wypozyczenia na bieżącą datę
INSERT INTO wypozyczenia
(id_czytelnik, id_ksiazka, data_wypozyczenia)
VALUES
(1, 2, CURRENT_DATE);

