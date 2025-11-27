-- − Zapytanie 1: wybierające jedynie kod, nazwę i cenę kursów posortowane rosnąco według ceny

SELECT
    kod,
    nazwa,
    cena
FROM kursy
ORDER BY CENA ASC;

-- − Zapytanie 2: wybierające imiona i nazwiska uczestników z tabeli uczestnicy oraz odpowiadające im daty z tabeli kursy_uczestnicy. Należy posłużyć się relacją.

SELECT
    imie,
    nazwisko,
    data
FROM uczestnicy
    INNER JOIN kursy_uczestnicy ON uczestnicy.id_uczestnika=kursy_uczestnicy.id_uczestnika;

-- − Zapytanie 3: wybierające jedynie nazwy wszystkich kursów z tabeli kursy oraz odpowiadające im daty z tabeli kursy_uczestnicy. Należy posłużyć się relacją.

SELECT nazwa, data
FROM kursy
    INNER JOIN kursy_uczestnicy ON kursy.kod = kursy_uczestnicy.kod_kursu;

-- − Zapytanie 4: tworzące zestawienie, na którym widoczne są nazwy wszystkich kursów oraz liczby osób zapisanych na te kursy. Nazwa kolumny z liczbą osób (alias): „Zapisanych”

SELECT nazwa, COUNT(*)
FROM kursy
    INNER JOIN kursy_uczestnicy ON kursy.kod = kursy_uczestnicy.kod_kursu
GROUP BY nazwa;

-- − Zapytanie 5 : wybierające imiona i nazwiska uczestników z tabeli uczestnicy, daty z tabeli kursy_uczestnicy oraz nazwy kursów z tabeli kursy. Należy posłużyć się relacją.