-- 1.Imię i nazwisko pracownika oraz region, w którym pracuje. Dane wybierz z tabel: Pracownicy oraz Oddziałl

SELECT
    imie,
    nazwisko,
    region
FROM pracownicy
    INNER JOIN oddzialy ON pracownicy.NrRozliczOddz = oddzialy.NrRozlicz;

--  2.Imię i nazwisko pracownika, nazwa i ilość sprzedanych produktów. Dane wybierz z tabel  Pracownicy i Sprzedaż. 

SELECT
    imie,
    nazwisko,
    nazwaproduktu,
    Ilosc
FROM pracownicy
    INNER JOIN sprzedaz ON sprzedaz.NrPracownika = pracownicy.Nr;

--  3.Imię i nazwisko pracownika, nazwa i punktacja produktu oraz ilość sprzedanych produktów. Pracownicy, Sprzedaz i Produkty

SELECT
    imie,
    nazwisko,
    nazwaproduktu,
    punktacja,
    Ilosc
FROM pracownicy
    INNER JOIN sprzedaz ON sprzedaz.NrPracownika = pracownicy.Nr
    INNER JOIN produkty ON sprzedaz.nazwaproduktu = produkty.nazwa;

-- 4.Imię i nazwisko pracownika, nazwa i wartość punktów ze sprzedaży produktu. Wartość obliczysz mnożąc Ilosc i Punktacje.  Potrzebne tabele to Pracownicy,  Sprzedaż i Produkty. 
SELECT
    imie,
    nazwisko,
    nazwaproduktu,
    ilosc*punktacja as Wartosc
FROM pracownicy
    INNER JOIN sprzedaz ON sprzedaz.NrPracownika = pracownicy.Nr
    INNER JOIN produkty ON sprzedaz.nazwaproduktu = produkty.nazwa;

-- 5.Imię i nazwisko pracownika, nazwa i wartość punktów ze sprzedaży produktu – tylko dla pracowników z oddziału w Warszawie. Potrzebne tabele to Pracownicy,  Sprzedaż, Produkty, Oddzialy

SELECT
    imie,
    nazwisko,
    nazwaproduktu,
    ilosc*punktacja as Wartosc
FROM pracownicy
    INNER JOIN sprzedaz ON sprzedaz.NrPracownika = pracownicy.Nr
    INNER JOIN produkty ON sprzedaz.nazwaproduktu = produkty.nazwa
    INNER JOIN oddzialy ON Pracownicy.NrRozliczOddz = oddzialy.NrRozlicz
WHERE miejscowosc = 'warszawa';

-- 6.Imiona, nazwiska i numery pracowników wyróżnionych w zeszłym okresie. 
SELECT
    imie,
    nazwisko,
    NrPracownika
FROM pracownicy 
    INNER JOIN wyroznieni On pracownicy.Nr = wyroznieni.NrPracownika;

