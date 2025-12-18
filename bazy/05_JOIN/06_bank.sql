USE 4e_1_bank;
ODDZIAŁY
NrRozlicz (klucz)
Miejscowo

PRACOWNICY
Nr (klucz)
Nazwisko
Imi

PRODUKTY
Nazwa (klucz)
Punktacja

WYRÓŻNIENI
Nr (klucz)
-- Funkcje agregacyjne: SUM(), AVG(), MAX(), MIN(), COUNT(*)
-- 1.Łączna liczba sprzedanych produktów.
SELECT SUM(Ilosc) as liczba_sprzedanych_produktow
FROM sprzedaz;
-- 2.Minimalna (niezerowa), maksymalna i średnia liczba punktów przypadających na jednego pracownika banku.
SELECT MIN(Punktacja), MAX(Punktacja), Round(AVG(Punktacja),2)
FROM produkty;
-- 3.Liczba pracowników banku.
SELECT COUNT(*) AS liczba_pracownikow
FROM pracownicy;
-- 4.Liczba pracowników regionu 'Północ'.
SELECT COUNT(*) AS liczba_pracownikow
FROM pracownicy
    INNER JOIN oddzialy ON pracownicy.NrRozliczOddz = oddzialy.NrRozlicz
WHERE Region = 'P??noc';
-- GROUP BY i HAVING
-- 1.Nr oddziału, miejscowo ść oraz liczba pracowników w oddziale.

-- 2.Nr oddziału, miejscowość oraz liczba pracowników w oddziale (tylko dla miejscowości 'Wrocław').

-- 3.Nazwa regionu i liczba pracowników w regionie.

-- 4.Imię, nazwisko, suma punktów przypadających na pracownika.

-- 5.Nazwa produktu, liczba sprzedanych produktów (tylko jeśli przekracza 5).

-- 6.Imiona i nazwiska pracowników, którzy sprzedali większą liczbę rachunków firmowych niż wynosi średnia sprzedaż tych rachunków przypadająca na jednego pracownika.