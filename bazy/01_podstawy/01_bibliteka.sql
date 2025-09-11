-- start
show databases;
mysql -u root
CREATE DATABASE 4e_1_biblioteka;
SHOW DATABASES;
USE 4e_1_biblioteka
CREATE TABLE ksiazka(
    tytul varchar(255),
    autor varchar(255),
    cena int
);
SHOW TABLES;
DESC ksiazka;
INSERT INTO ksiazka
VALUES
('Harry Potter','J.K. Rowling',25);
SELECT * FROM ksiazka;


INSERT INTO ksiazka
VALUES
('Lalka','B. Prus',45);

DELETE FROM ksiazka
WHERE tytul = 'Harry Potter';

ALTER TABLE ksiazka
ADD id int primary key
AUTO_INCREMENT;


