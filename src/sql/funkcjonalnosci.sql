/* 1.1 Wyswietl receptę */

SELECT `pacjent`.`Imie`, `pacjent`.`Nazwisko`, `wizyta`.`ID_pacjenta`,
`recepta`.`Nazwa_lekarstwa`, `recepta`.`Sposob_podania`
FROM `pacjent`  LEFT JOIN `wizyta` ON `wizyta`.`ID_pacjenta` = `pacjent`.`ID_pacjenta`
INNER JOIN `recepta` ON `recepta`.`ID_wizyty` = `wizyta`.`ID_wizyty`
WHERE `pacjent`.`Imie` = '%s' AND `pacjent`.`Nazwisko` = '%s';

/* 1.2 Wypisz lekarzy na urlopie/nie na urlopie */

SELECT pracownik.Imie, pracownik.Nazwisko, lekarz.Urlop
FROM pracownik  INNER JOIN lekarz ON lekarz.ID_pracownika = pracownik.ID_pracownika
WHERE lekarz.Urlop = '%s'
ORDER BY Pracownik.Nazwisko ASC, Pracownik.Imie ASC;

/* 1.3 Wyświetl dane kontaktowe */

SELECT Imie, Nazwisko, Telefon, Mail FROM %s;

SELECT Imie, Nazwisko, Telefon, Mail FROM %s
WHERE Imie = '%s' AND Nazwisko = '%s';

/* 1.4 Wyświetl godziny przyjęć lekarzy */

SELECT pracownik.Imie, pracownik.Nazwisko, lekarz.ID_pracownika, gabinet.Godzina_rozpoczecia, gabinet.Godzina_zakonczenia
FROM pracownik  INNER JOIN lekarz ON lekarz.ID_pracownika = pracownik.ID_pracownika
INNER JOIN gabinet ON gabinet.ID_pracownika = lekarz.ID_pracownika
ORDER BY Pracownik.Nazwisko ASC, Pracownik.Imie ASC;

SELECT pracownik.Imie, pracownik.Nazwisko, lekarz.Specjalizacja, gabinet.Nr_gabinetu, gabinet.Pietro, gabinet.Godzina_rozpoczecia, gabinet.Godzina_zakonczenia
FROM pracownik  INNER JOIN lekarz ON lekarz.ID_pracownika = pracownik.ID_pracownika
INNER JOIN gabinet ON gabinet.ID_pracownika = lekarz.ID_pracownika
WHERE pracownik.Imie = '%s' AND pracownik.Nazwisko = '%s';

/* 1.5 Wyświetl wizyty */

SELECT pracownik.Imie, pracownik.Nazwisko, wizyta.Data_wizyty, wizyta.Godzina_wizyty, gabinet.Nr_gabinetu
FROM pracownik  INNER JOIN wizyta ON wizyta.ID_pracownika = pracownik.ID_pracownika
INNER JOIN gabinet ON wizyta.ID_gabinetu = gabinet.ID_gabinetu
ORDER BY wizyta.data_wizyty ASC, wizyta.godzina_wizyty ASC;

SELECT pracownik.Imie, pracownik.Nazwisko, wizyta.Data_wizyty, wizyta.Godzina_wizyty
FROM pracownik  INNER JOIN wizyta ON wizyta.ID_pracownika = pracownik.ID_pracownika
WHERE pracownik.Imie = '%s' AND pracownik.Nazwisko = '%s' AND wizyta.Data_wizyty = '%s'
ORDER BY wizyta.Godzina_wizyty ASC;

SELECT `pracownik`.`Imie`, `pracownik`.`Nazwisko`, `lekarz`.`Specjalizacja`, `wizyta`.`Data_wizyty`, `wizyta`.`Godzina_wizyty`, `pacjent`.`Imie`, `pacjent`.`Nazwisko`
FROM `pracownik`
LEFT JOIN `lekarz` ON `lekarz`.`ID_pracownika` = `pracownik`.`ID_pracownika`
LEFT JOIN `wizyta` ON `wizyta`.`ID_pracownika` = `pracownik`.`ID_pracownika`
LEFT JOIN `gabinet` ON `wizyta`.`ID_gabinetu` = `gabinet`.`ID_gabinetu`
LEFT JOIN `pacjent` ON `wizyta`.`ID_pacjenta` = `pacjent`.`ID_pacjenta`
WHERE `gabinet`.`Nr_gabinetu` = '11';

SELECT Data_wizyty, COUNT(Data_wizyty) AS ‘Ilość’ FROM wizyta
WHERE Data_wizyty BETWEEN '%s' AND '%s'
GROUP BY Data_wizyty ORDER BY Data_wizyty ASC;

SELECT COUNT(*) FROM wizyta WHERE Data_wizyty BETWEEN '%s' AND '%s';

SELECT Data_wizyty, COUNT(Data_wizyty) AS ‘Ilość’ FROM wizyta
WHERE Data_wizyty LIKE '%s%s'
GROUP BY Data_wizyty ORDER BY Data_wizyty ASC;

SELECT COUNT(*) FROM wizyta WHERE Data_wizyty LIKE '%s%s';

/* 1.6 Wyświetl historię wizyt pacjenta */

SELECT pacjent.Imie, pacjent.Nazwisko, wizyta.Data_wizyty, wizyta.Godzina_wizyty FROM pacjent
INNER JOIN wizyta ON wizyta.ID_pacjenta = pacjent.ID_pacjenta
WHERE pacjent.Imie = '%s' AND pacjent.Nazwisko = '%s'
ORDER BY Wizyta.Data_wizyty ASC, Wizyta.Godzina_wizyty ASC;

SELECT pacjent.Imie, pacjent.Nazwisko, wizyta.Data_wizyty, wizyta.Godzina_wizyty FROM pacjent
INNER JOIN wizyta ON wizyta.ID_pacjenta = pacjent.ID_pacjenta
WHERE pacjent.Imie = '%s' AND pacjent.Nazwisko = '%s' AND Data_wizyty BETWEEN '%s' AND '%s'
ORDER BY Wizyta.Data_wizyty ASC, Wizyta.Godzina_wizyty ASC;

/* 1.7 Wyświetl wszystkie skierowania danego pacjenta */

SELECT pacjent.Imie, pacjent.Nazwisko, wizyta.ID_pacjenta, skierowanie.ID_skierowania, skierowanie.Typ
FROM pacjent
INNER JOIN wizyta ON wizyta.ID_pacjenta = pacjent.ID_pacjenta
INNER JOIN skierowanie ON skierowanie.ID_wizyty = wizyta.ID_wizyty
WHERE pacjent.Imie = '%s' AND pacjent.Nazwisko = '%s';

/* 1.8 Wyświetl zaplanowane szczepienia */

SELECT wizyta.Typ, pacjent.Imie, pacjent.Nazwisko, wizyta.Data_wizyty, wizyta.Godzina_wizyty, gabinet.Nr_gabinetu
FROM wizyta
INNER JOIN pacjent ON wizyta.ID_pacjenta = pacjent.ID_pacjenta
INNER JOIN gabinet ON wizyta.ID_gabinetu = gabinet.ID_gabinetu
WHERE wizyta.Typ = 'szczepienie'
ORDER BY Wizyta.Data_wizyty ASC, Wizyta.Godzina_wizyty ASC;

SELECT wizyta.Typ, pacjent.Imie, pacjent.Nazwisko, wizyta.Data_wizyty, wizyta.Godzina_wizyty, gabinet.Nr_gabinetu
FROM wizyta
INNER JOIN pacjent ON wizyta.ID_pacjenta = pacjent.ID_pacjenta
INNER JOIN gabinet ON wizyta.ID_gabinetu = gabinet.ID_gabinetu
WHERE wizyta.Typ = 'szczepienie' AND pacjent.Imie = '%s' AND pacjent.Nazwisko = '%s'
ORDER BY Wizyta.Data_wizyty ASC, Wizyta.Godzina_wizyty ASC;

/* 1.9 Wyświetl wszystkich lekarzy na stażu lub na pełnym etacie */

SELECT pracownik.Imie, pracownik.Nazwisko, lekarz.Etat FROM pracownik
INNER JOIN lekarz ON lekarz.ID_pracownika = pracownik.ID_pracownika WHERE lekarz.Etat = '%s';

/* 1.10 Wyświetl wszystkie osoby w bazie */

SELECT Imie, Nazwisko, Data_urodzenia
FROM Pacjent
UNION SELECT Imie, Nazwisko, Data_urodzenia
FROM Pracownik
ORDER BY Data_urodzenia;

/* 1.11 Wyszukaj pesel i datę urodzenia danego pacjenta */

SELECT pacjent.Imie, pacjent.Nazwisko, pacjent.Data_urodzenia, pacjent.Pesel
FROM pacjent
WHERE pacjent.Imie = '%s' AND pacjent.Nazwisko = '%s';

/* 1.12 Zlicz pracowników o danej funkcji */

SELECT Pracownik.Funkcja AS 'Zawod pracownika',
COUNT(Pracownik.funkcja) AS 'Ilosc pracownikow'
FROM Pracownik
GROUP BY Pracownik.Funkcja
ORDER BY Pracownik.Funkcja ASC;

/* 1.13 Zlicz lekarzy danej specjalizacji */

SELECT Lekarz.Specjalizacja, COUNT(Lekarz.Specjalizacja) AS 'Ilość'
FROM Lekarz
GROUP BY Lekarz.Specjalizacja
ORDER BY Lekarz.Specjalizacja ASC;

SELECT Lekarz.Specjalizacja, COUNT(Lekarz.Specjalizacja) AS 'Ilość'
FROM Lekarz
WHERE Lekarz.Specjalizacja = '%s'
GROUP BY Lekarz.Specjalizacja;

/* 2.1 Zarejestruj pacjenta */

SELECT ubezpieczenie , ID_pacjenta FROM Pacjent WHERE Imie='%s' AND Nazwisko='%s';

SELECT `lekarz`.`Urlop`, `gabinet`.`ID_pracownika`, `gabinet`.`ID_gabinetu` FROM `pracownik`
INNER JOIN `lekarz` ON `lekarz`.`ID_pracownika` = `pracownik`.`ID_pracownika`
INNER JOIN `gabinet` ON `gabinet`.`ID_pracownika` = `lekarz`.`ID_pracownika`
WHERE `pracownik`.`Imie` = '%s' AND `pracownik`.`Nazwisko` = '%s';

SELECT COUNT(`wizyta`.`ID_pracownika`) FROM `wizyta`
WHERE `wizyta`.`ID_pracownika` = '%s' AND `wizyta`.`Godzina_wizyty` = '%s' AND
`wizyta`.`Data_wizyty` = '%s';

SELECT COUNT(ID_wizyty) FROM Wizyta;

INSERT INTO `wizyta` VALUES(%s, '%s', %s, %s, %s, '%s', '%s');

/* 2.2 Dodaj osobę do bazy */

SELECT COUNT(*) FROM %s;

INSERT INTO `pacjent` (`ID_pacjenta`, `Imie`, `Nazwisko`, `Data_urodzenia`, `Pesel`, `Miejsce_zamieszkania`,
`Telefon`, `Mail`, `Ubezpieczenie`) VALUES(%s, '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s');

INSERT INTO `pracownik` (`ID_pracownika`, `Imie`, `Nazwisko`, `Data_urodzenia`, `Pesel`,
`Miejsce_zamieszkania`, `Telefon`, `Mail`, `Funkcja`)
VALUES (%s, '%s', '%s', '%s', '%s', '%s', %s, '%s', '%s');

INSERT INTO `lekarz` (`ID_pracownika`, `Specjalizacja`, `Staz_pracy`, `Etat`, `Urlop`)
VALUES(%s, '%s', %s, '%s', 0);

/* 2.3 Modyfikuj dane kontaktowe */

UPDATE %s SET %s = '%s' WHERE Imie = '%s' AND Nazwisko = '%s';

/* 2.4 Usuń wizytę z bazy */

SELECT ID_wizyty FROM wizyta WHERE id_pacjenta = (SELECT ID_pacjenta FROM pacjent
WHERE Imie = '%s' AND Nazwisko = '%s') AND Data_wizyty = '%s' AND Godzina_wizyty = '%s';

DELETE FROM Skierowanie WHERE ID_wizyty = '%s';

/* 2.5 Wpisz lekarzowi urlop */

UPDATE Lekarz SET Lekarz.urlop = 1 WHERE (SELECT ID_pracownika from Pracownik
WHERE Pracownik.Imie = '%s' AND Pracownik.Nazwisko = '%s') = ID_pracownika;

/* 2.6 Dodaj skierowanie */

SELECT ID_wizyty FROM wizyta WHERE id_pacjenta = (SELECT ID_pacjenta FROM pacjent
WHERE Imie = '%s' AND Nazwisko = '%s') AND Data_wizyty = '%s' AND Godzina_wizyty = '%s';

SELECT COUNT(*) FROM Skierowanie;

INSERT INTO `skierowanie` (`ID_skierowania`, `ID_wizyty`, `Typ`) VALUES(%s, %s, '%s');

/* 2.7 Dodaj receptę */

SELECT ID_wizyty FROM wizyta WHERE id_pacjenta = (SELECT ID_pacjenta FROM pacjent
WHERE Imie = '%s' AND Nazwisko = '%s') AND Data_wizyty = '%s' AND Godzina_wizyty = '%s';

SELECT COUNT(*) FROM Recepta;

INSERT INTO `recepta` (`ID_recepty`, `Nazwa_lekarstwa`, `Sposob_podania`, `ID_wizyty`)
VALUES(%s, '%s', '%s', %s);

/* 2.8 Modyfikuj ubezpieczenie */

SELECT Ubezpieczenie FROM Pacjent WHERE Imie = '%s' AND Nazwisko = '%s';

UPDATE Pacjent SET Ubezpieczenie = 1 WHERE Imie = '%s' AND Nazwisko = '%s';

UPDATE Pacjent SET Ubezpieczenie = 0 WHERE Imie = '%s' AND Nazwisko = '%s';
