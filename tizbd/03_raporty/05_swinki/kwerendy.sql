use 4e_1_hodowla2;
-- ‒ Zapytanie 1: wybierające jedynie pola imie i miot z tabeli swinki dla świnek morskich urodzonych w lipcu
SELECT imie, miot
FROM swinki
WHERE data_ur LIKE '%-07-%';
 -- ‒ Zapytanie 2: wybierające niepowtarzające się wiersze z datą urodzenia i miotem z tabeli
-- swinki oraz odpowiadającą im nazwą rasy z tabeli rasy dla id rasy równego 1. Należy posłużyć
-- się relacją

SELECT
    DISTINCT data_ur,
    miot,
    rasa
FROM swinki
    INNER JOIN rasy ON swinki.rasy_id = rasy.id 
WHERE rasy_id = 1;

-- ‒ Zapytanie 3: wybierające jedynie imię, cenę i opis świnek morskich, których id rasy jest
-- równe 1

SELECT imie, cena, opis
FROM swinki
WHERE rasy_id = 1;

-- ‒ Zapytanie 4: wybierające jedynie rasę z tabeli rasy
SELECT rasa
FROM rasy;