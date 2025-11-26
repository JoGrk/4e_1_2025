-- a) Zwrócenie tytułów filmów, dla których gatunek to SF,

SELECT tytul 
FROM filmy
WHERE gatunek = 'SF';

-- b) Zwrócenie wszystkich tytułów filmów wraz z nazwiskami reżyserów,

SELECT tytul, nazwisko
FROM filmy JOIN rezyserzy ON filmy.RezyserID = rezyserzy.IDRezyser;

-- c) Zwrócenie filmów, dla których ocena w recenzji jest równa 4, 

SELECT tytul, gatunek, tresc
FROM filmy JOIN recenzje ON filmy.RecenzjaID = recenzje.idrecenzja
WHERE ocena = '4';