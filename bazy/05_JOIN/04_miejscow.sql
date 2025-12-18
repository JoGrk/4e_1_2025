-- 1. Wyświetl nazwisko i imię oraz adres osób które:
-- A. płacą mniej niż 50;

SELECT imie, nazwisko, adres
FROM osoba
    INNER JOIN dom ON osoba.Nrtel = dom.Nrtel
WHERE oplaty < 50;

-- B. mieszkają w miejscowości o numerze 1, 2, 3;

SELECT imie, nazwisko, adres
FROM osoba
    INNER JOIN dom ON osoba.Nrtel = dom.Nrtel
    where nrmiejscow in (1,2,3);

-- C. są głównymi abonentami;

SELECT imie, nazwisko, adres
FROM osoba
    INNER JOIN dom ON osoba.Nrtel = dom.Nrtel
WHERE czy_glowny = 'PRAWDA';

-- 2. Wyświetl nazwisko, imię i zawód osób, które:
-- A. płacą za telefon między 40 a 80;
SELECT imie, nazwisko, zawod, adres
FROM osoba
    INNER JOIN dom ON osoba.Nrtel = dom.Nrtel
    INNER JOIN praca ON osoba.SYMBZATR = praca.SYMBZATR
WHERE oplaty BETWEEN 40 and 80;

-- B. mieszkają w miejscowości, której nazwa zaczyna się na ' P' lub na 'K';
SELECT
    imie, 
    nazwisko,
    zawod,
    nazwa
FROM osoba
    INNER JOIN praca ON osoba.symbzatr = praca.symbzatr
    INNER JOIN dom ON osoba.nrtel = dom.nrtel
    INNER JOIN miejscow ON dom.nrmiejscow = miejscow.nrmiejscow
WHERE nazwa LIKE 'K%' OR nazwa LIKE 'P%';

-- C. w numerze telefonu występuje cyfra 3 na trzecim miejscu;

SELECT
    imie, 
    nazwisko,
    zawod,
    nrtel
FROM osoba
    INNER JOIN praca ON osoba.symbzatr = praca.symbzatr
WHERE nrtel LIKE '__3%';
-- 3.Wyświetl nr telefonu, nazwisko, miejscowość adres i zawód osoby, która:
-- A. pracują w miejscu, gdzie w polu NAZWA znajduje się litera 'u';

SELECT
    osoba.nrtel,
    nazwisko,
    nazwa,
    adres,
    zawod
FROM osoba
    INNER JOIN praca ON osoba.symbzatr = praca.symbzatr
    INNER JOIN dom ON osoba.nrtel = dom.nrtel
    INNER JOIN miejscow ON dom.nrmiejscow = miejscow.nrmiejscow
WHERE nazwa LIKE '%u%';


-- B. mieszka w miejscowości, w której serwis prowadzi firma, której nazwa kończy się na 'A' (lub 'a') i w polu ADRES ma literę 'o';

SELECT
    osoba.nrtel,
    nazwisko,
    nazwa,
    adres,
    zawod
FROM osoba
    INNER JOIN praca ON osoba.symbzatr = praca.symbzatr
    INNER JOIN dom ON osoba.nrtel = dom.nrtel
    INNER JOIN miejscow ON dom.nrmiejscow = miejscow.nrmiejscow
WHERE adres LIKE '%o%'
    AND serwis LIKE '%a';

-- C. pole SYMBZATR kończy się dużą lub małą literą 'm' lub 'k' ;

SELECT
    osoba.nrtel,
    nazwisko,
    nazwa,
    adres,
    zawod
FROM osoba
    INNER JOIN praca USING (symbzatr)
    INNER JOIN dom USING (nrtel)
    INNER JOIN miejscow USING (nrmiejscow)
WHERE SYMBZATR like '%k' or SYMBZATR like '%m';
