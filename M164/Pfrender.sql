-- 1

create database if not exists freifaecher;
use freifaecher;

-- 2

INSERT INTO `tbl_schülerin` (`Vorname`, `Nachname`, `FK_Klasse`)
VALUES ('Calvin', 'Pfrender', 10);

-- 3

INSERT INTO `tt_teilnahme` (`Tag`, `Zimmer`, `FK_Freifach`, `FK_SchülerIn`)
VALUES ('Fr', '118', 6, (
  SELECT `ID_SchülerIn`
  FROM `tbl_schülerin`
  WHERE `Vorname` = 'Calvin' AND `Nachname` = 'Pfrender'
));

-- 4

SELECT 
  s.Nachname AS 'SchülerIn Nachname',
  s.Vorname AS 'SchülerIn Vorname',
  k.Klasse,
  lk.Nachname AS 'LehrerIn Klasse Nachname',
  lk.Vorname AS 'LehrerIn Klasse Vorname',
  f.Freifach,
  t.Tag,
  t.Zimmer
FROM 
  tbl_schülerin s
  INNER JOIN tbl_klasse k ON s.FK_Klasse = k.ID_Klasse
  INNER JOIN tbl_lehrerin lk ON k.FK_KlassenLehrerIn = lk.ID_LehrerIn
  INNER JOIN tt_teilnahme t ON s.ID_SchülerIn = t.FK_SchülerIn
  INNER JOIN tbl_freifach f ON t.FK_Freifach = f.ID_Freifach;

-- 5

SELECT COUNT(*) AS AnzahlTeilnehmer
FROM `tt_teilnahme`
JOIN `tbl_freifach` ON `tt_teilnahme`.`FK_Freifach` = `tbl_freifach`.`ID_Freifach`
JOIN `tbl_lehrerin` ON `tbl_freifach`.`FK_FF_LehrerIn` = `tbl_lehrerin`.`ID_LehrerIn`
WHERE `tbl_lehrerin`.`Nachname` LIKE '%Sommer';

-- 6

SELECT `tbl_klasse`.`Klasse`, COUNT(`tbl_schülerin`.`ID_SchülerIn`) AS AnzahlSchülerInnen
FROM `tbl_klasse`
LEFT JOIN `tbl_schülerin` ON `tbl_klasse`.`ID_Klasse` = `tbl_schülerin`.`FK_Klasse`
GROUP BY `tbl_klasse`.`ID_Klasse`
ORDER BY `tbl_klasse`.`Klasse`;

-- 7

SELECT `tbl_klasse`.`Klasse`, `tbl_lehrerin`.`Vorname`, `tbl_lehrerin`.`Nachname`, `tbl_lehrerin`.`Pensum`
FROM `tbl_klasse`
JOIN `tbl_lehrerin` ON `tbl_klasse`.`FK_KlassenLehrerIn` = `tbl_lehrerin`.`ID_LehrerIn`
ORDER BY `tbl_lehrerin`.`Pensum` ASC;

-- 8

SELECT `tbl_schülerin`.`Vorname`, `tbl_schülerin`.`Nachname`
FROM `tbl_schülerin`
WHERE `tbl_schülerin`.`ID_SchülerIn` IN (
    SELECT `tt_teilnahme`.`FK_SchülerIn`
    FROM `tt_teilnahme`
    INNER JOIN `tbl_freifach` ON `tt_teilnahme`.`FK_Freifach` = `tbl_freifach`.`ID_Freifach`
    WHERE `tbl_freifach`.`Freifach` LIKE '%Tanz%' OR `tbl_freifach`.`Freifach` LIKE '%Mathe%'
);
