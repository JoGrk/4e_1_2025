CREATE DATABASE 4e_1_zainteresowania;
USE 4e_1_zainteresowania;
CREATE TABLE dane(
    imie varchar(255),
    nazwisko varchar(255),
    zainteresowania varchar(255)
);

INSERT INTO dane
VALUES
('Jan', 'Kowalski','bieganie, granie'),
('Marek', 'Nowak', 'serfowanie'),
('Stefan', 'Woźniak', 'granie, zwiedzanie, bieganie, łowienie ryb');

desc dane;

select * from dane;

SELECT * 
FROM dane
WHERE zainteresowania = 'serfowanie';

SELECT *
FROM dane 
WHERE zainteresowania = 'granie'

------------------------------------
DROP TABLE dane;

CREATE TABLE dane(
    id int primary key AUTO_INCREMENT,
    imie varchar(255),
    nazwisko varchar(255)
);

CREATE TABLE zainteresowania(
    id int primary key AUTO_INCREMENT,
    nazwa varchar(255)
);

CREATE TABLE dane_zainteresowania(
    id_dane int,
    id_zainteresowania int,
    primary key(id_dane, id_zainteresowania),
    foreign key(id_dane) references dane(id),
    foreign key(id_zainteresowania) references zainteresowania(id)
);

INSERT INTO dane(
    imie, nazwisko
)
VALUES
('Jan', 'Kowalski'),
('Marek', 'Nowak'),
('Stefan', 'Woźniak');

INSERT INTO zainteresowania(
    nazwa
)
VALUES
('bieganie'),
('granie'),
('serfowanie'),
('zwiedzanie'),
('łowienie ryb');

INSERT INTO dane_zainteresowania(
    id_dane, id_zainteresowania
)
VALUES
(1,1),
(1,2),
(2,3),
(3,2),
(3,4),
(3,5),
(3,1);


SELECT imie, nazwisko, nazwa
FROM dane 
        JOIN dane_zainteresowania ON dane.id=dane_zainteresowania.id_dane
        JOIN zainteresowania ON zainteresowania.id = dane_zainteresowania.id_zainteresowania
WHERE nazwa = 'granie';        