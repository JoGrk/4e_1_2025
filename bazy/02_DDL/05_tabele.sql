CREATE DATABASE 4e_1_tabele;
USE 4e_1_tabele;

-- Utwórz tabelę projekty z polami:
--  id_projektu, liczba, autonumerowanie, klucz podstawowy
--  nazwa_projektu tekst do 255 znaków, pole nie może być puste
-- start_projektu data
-- koniec_projektu data
-- koszt dokładne wartości liczbowe, do 500000, z dokładnością do dwóch miejsc po przecinku
-- utworzony stempel czasowy (data i czas), wartością domyślną jest current_timestamp

CREATE TABLE projekty(
    id_projektu int auto_increment primary key,
    nazwa_projektu varchar(255) NOT NULL,
    start_projektu date,
    koniec_projektu date,
    koszt dec(8,2),
    utworzony timestamp default current_timestamp
)




-- Utwórz tabelę etapy_projektu
-- id_etapu liczba z zakresu od 0 do 255
-- id_projektu liczba
-- opis_etapu tekst do 255 znaków, nie może być pusty
-- numer_etapu liczba z zakresu od 0 do 255
-- ukonczony wartość logiczna (prawda, fałsz)
-- klucz podstawowy na pola id_etapu i id_projektu
-- klucz obcy na polu id_projektu odwołujący się do tabeli projekty
CREATE TABLE etapy_projektu(
    id_etapu tinyint unsigned,
    id_projektu int,
    opis_etapu varchar(255) NOT NULL,
    numer_etapu tinyint unsigned,
    ukonczony boolean,
    primary key(id_etapu,id_projektu),
    foreign key(id_projektu) references projekty(id_projektu)

)


-- ------------------------------------------------------------------------------------------------------------

-- utwórz tabelę autorzy
-- id_autora liczba, autonymerowanie, klucz podstawowy
-- nazwisko tekst do 255, nie puste
-- pozycja - typ wyliczeniowy, wartości beginer, silver, gold
-- wiek - liczba od 0 do 255
-- data_od data, domyślnie aktualna data

CREATE TABLE autorzy(
    id_autora int auto_increment primary key,
    nazwisko varchar(255) NOT NULL,
    pozycja enum('beginer', 'silver', 'gold'),
    wiek tinyint unsigned,
    data_od date default current_date
);


-- utwórz tabelę posty
-- id_postu liczba, autonumerowanie, klucz podstawowy 
-- tresc - duże ilości danych binarnych (tekst, zdjęcia)
-- kategoria - typ wyliczeniowy z wartościami : rozrywka, nauka, sport
-- utworzony - data i czas utworzenia, domyślne aktualna

CREATE TABLE posty(
    id_postu int auto_increment primary key,
    tresc blob,
    kategoria enum('rozrywka','nauka','sport'),
    utworzony datetime default current_date
);

-- utwórz tabelę autorzy_postow
-- pola id_postu,  
-- klucz podstawowy na polach id_postu i id_autora
-- klucz obcy na polu id_postu odwołujacy się do klucza podstawowego tabeli posty
-- klucz obcy na polu id_postu odwołujący się do klucza podstawowego tabeli autorzy


CREATE TABLE autorzy_postow(
    id_postu int,
    id_autora int,
    primary key(id_postu, id_autora),
    foreign key (id_postu) references posty(id_postu),
    foreign key (id_autora) references autorzy(id_autora)
);