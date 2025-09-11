-- Utwórz bazę wizyty i użyj jej
CREATE DATABASE 4e_1_wizyty;
USE 4e_1_wizyty;
-- Dodaj do bazy tabelę (tabele), w których będziesz zapisywać informacje o wizytach: kto (imię i nazwisko, telefon), kiedy wizyta, czego dotyczy (leczenie, profilaktyka, kontrola)
CREATE TABLE wizyty(
    imie varchar(200),
    nazwisko varchar(200),
    telefon varchar(200),
    data date,
    typ varchar(200)
);
-- Wpisz dane do tabel. Jeden klient był dwa razy (leczenie, profilaktyka), drugi raz (kontrola) 
INSERT INTO wizyty
VALUES
('Jan','Kowalski','123456789','2000-12-9','Leczenie');
-- Usuń wizytę drugiego klienta (dane klienta powinny pozostać w bazie)

-- Dodaj wizytę pierwszego klienta, jeszcze raz profilaktyka - ale to trudne słowo i zrób w nim literówkę

-- Wyświetl wszystkie wizyty profilaktyczne

-- Popraw strukturę tabel bazy wizyty

