DROP SCHEMA IF EXISTS filmeDatenbank;
CREATE SCHEMA filmeDatenbank;
USE filmeDatenbank;
CREATE TABLE dvd_sammlung (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    film VARCHAR(255) NOT NULL,
    nummer INT(11) NOT NULL,
    laenge_minuten INT(11) NOT NULL,
    regisseur VARCHAR(255) NOT NULL
);
 

INSERT INTO dvd_sammlung VALUES (NULL, 'Meine Großmutter lacht nie', 1, 119, 'Quentin Tarantino'), 
(NULL, 'Angst', 2, 92, 'Steven Spielberg'),
(NULL, 'Wenn ich nur könnte', 3, 89, 'Quentin Tarantino'),
(NULL, 'Men and Mice', 4, 88, 'Cohen'),
(NULL, 'Grün ist die Farbe der Liebe', 5, 201, 'Quentin Tarantino'),
(NULL, 'Frühstück in Sibirien', 6, 72, 'Steven Spielberg'),
(NULL, 'Das große Rennen', 8, 83, 'Cohen'),
(NULL, 'Das große Rennen, Teil 2', 9, 85, 'Cohen'),
(NULL, 'Adlatus', 7, 131, 'Quentin Tarantino'),
(NULL, 'Angriff auf Rom', 10, 138, 'Steven Burghofer');

DELETE FROM dvd_sammlung WHERE id = 2;

UPDATE dvd_sammlung SET film = 'Geänderter Filmname' WHERE id = 1;

/* WHERE */
SELECT * FROM dvd_sammlung WHERE regisseur = 'Quentin Tarantino';
SELECT * FROM dvd_sammlung WHERE film = 'Angriff auf Rom';
SELECT * FROM dvd_sammlung WHERE nummer < 10;
SELECT * FROM dvd_sammlung WHERE laenge_minuten > 120 ;
/* LIKE */
SELECT * FROM dvd_sammlung WHERE film LIKE 'd%';
SELECT * FROM dvd_sammlung WHERE regisseur LIKE '%berg';
SELECT * FROM dvd_sammlung WHERE regisseur LIKE '%u%';
SELECT * FROM dvd_sammlung WHERE film LIKE '%Sibirien%';
SELECT * FROM dvd_sammlung WHERE film LIKE 'Das große Rennen%';
SELECT * FROM dvd_sammlung WHERE film LIKE 'm%e';
/* 5 Verknüpfungen mit OR und AND */
SELECT * FROM dvd_sammlung WHERE regisseur = 'Steven Spielberg' AND laenge_minuten > 80;
SELECT * FROM dvd_sammlung WHERE regisseur IN ('Quentin Tarantino', 'Steven Spielberg');
SELECT * FROM dvd_sammlung WHERE laenge_minuten > 200 OR laenge_minuten < 80;
/* ORDER BY */
SELECT * FROM dvd_sammlung ORDER BY film ;
SELECT * FROM dvd_sammlung ORDER BY regisseur ASC;
SELECT * FROM dvd_sammlung ORDER BY nummer DESC;
SELECT * FROM dvd_sammlung ORDER BY regisseur ASC, film ASC;
SELECT * FROM dvd_sammlung WHERE film LIKE 'M%' ORDER BY nummer ASC;
SELECT * FROM dvd_sammlung WHERE regisseur = 'Quentin Tarantino' AND (film LIKE '%o%' OR film LIKE '%a%') ORDER BY laenge_minuten ASC;
/* LIMIT */
SELECT * FROM dvd_sammlung LIMIT 3;

SELECT id, film, laenge_minuten, regisseur FROM dvd_sammlung
WHERE
(film LIKE 'a%' OR film LIKE 'd%')
AND
id != 2
AND
laenge_minuten > 80
ORDER BY regisseur, laenge_minuten DESC;

SELECT * FROM dvd_sammlung;