SELECT *
FROM rezyserzy;

INSERT INTO rezyserzy
(imie, nazwisko)
VALUES
    ('Marek', 'Nowak');

SELECT *
FROM filmy;

UPDATE filmy
SET Tytul = 'Indiana Jones'
WHERE idfilm = 3;