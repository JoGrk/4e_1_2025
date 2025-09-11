
-- -- znaczenie klucza podstawowego
-- Do tabeli książka z poprzedniego zadania dodaj pole id z autoinkrementacją

-- Usuń jedną z lektur
DELETE FROM ksiazka
WHERE id=1
-- Utwórz tabelę Gatunki  z polami:
-- id liczba, klucz, autoinkrementacja
-- nazwa tekst
CREATE TABLE gatunki(
    id int primary key AUTO_INCREMENT, 
    nazwa varchar(100)
);
-- Dodaj do tabeli ksiazka pole gatunek 
ALTER TABLE ksiazka 
ADD gatunek int;

-- Wpisz dowolne dwa gatunki książek
INSERT INTO gatunki
(nazwa)
VALUES
('Dramat'),
('Komedia');

-- Wpisz dowolną książkę z dowolnego gatunku. Jaki sens ma korzystanie z tabeliGatunek zamiast bezpośredniego wpisywania?

INSERT INTO ksiazka
(tytul,autor,gatunek)
VALUES
('Harry Potter','J.K. Rowling',3);
