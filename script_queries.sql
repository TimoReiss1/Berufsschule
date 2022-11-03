/*Auswahl aller Zutaten eines Rezeptes nach Rezeptname*/
/* e.g. */
SELECT rezept.rezeptnr, rezept.rezeptname, rezept_zutat.zutatennr, rezept_zutat.menge, zutat.bezeichnung, zutat.nettopreis
FROM rezept
JOIN rezept_zutat ON rezept.rezeptnr = rezept_zutat.rezeptnr
JOIN zutat ON rezept_zutat.zutatennr = zutat.zutatennr
WHERE rezept.rezeptname = 'Thueringer Kloesse';

/*Auswahl aller Rezepte einer bestimmten Ernährungskategorie*/
/* e.g. */
SELECT rezept.rezeptnr, rezept.rezeptname, kategorie.kategoriename
FROM rezept
JOIN rezept_kategorie ON rezept.rezeptnr = rezept_kategorie.rezeptnr
JOIN kategorie ON rezept_kategorie.kategorienr = kategorie.kategorienr
WHERE kategorie.kategoriename = 'VEGETARISCH';

/*Auswahl aller Rezepte, die eine gewisse Zutat enthalten*/
/* e.g. */
SELECT rezept.rezeptnr, rezept.rezeptname, rezept_zutat.zutatennr, zutat.bezeichnung as zutat
FROM rezept
JOIN rezept_zutat ON rezept.rezeptnr = rezept_zutat.rezeptnr
JOIN zutat ON rezept_zutat.zutatennr = zutat.zutatennr
WHERE zutat.bezeichnung = 'Ei';

/*Berechnung der durchschnittlichen Nährwerte aller Bestellungen eines Kunden*/
/*e.g.*/
SELECT 2001 as kundennr, ROUND(avg(kalorien_per_bestellnr), 2) AS kalorien, ROUND(avg(kohlenhydrate_per_bestellnr), 2) AS kohlenhydrate, ROUND(avg(protein_per_bestellnr), 2) AS protein
FROM (
    SELECT SUM(zutat.kalorien * rezept_zutat.menge * bestellung_rezept.menge) AS kalorien_per_bestellnr,
           SUM(zutat.kohlenhydrate * rezept_zutat.menge * bestellung_rezept.menge) as kohlenhydrate_per_bestellnr,
           SUM(zutat.protein * rezept_zutat.menge * bestellung_rezept.menge) as protein_per_bestellnr
    FROM bestellung
        JOIN bestellung_rezept ON bestellung.bestellnr = bestellung_rezept.bestellnr
        JOIN rezept ON rezept.rezeptnr = bestellung_rezept.rezeptnr
        JOIN rezept_zutat ON rezept.rezeptnr = rezept_zutat.rezeptnr
        JOIN zutat ON rezept_zutat.zutatennr = zutat.zutatennr
    WHERE bestellung.kundennr = 2001
    GROUP BY bestellung.bestellnr )
as x;


/*Auswahl aller Zutaten, die bisher keinem Rezept zugeordnet sind*/





/* join bestellung and bestellung rezept */
SELECT bestellung.bestellnr, bestellung_rezept.rezeptnr, bestellung_rezept.menge, bestellung.kundennr, bestellung.bestelldatum, bestellung.rechnungsbetrag
FROM bestellung JOIN bestellung_rezept ON bestellung.bestellnr = bestellung_rezept.bestellnr;

/* join rezept and rezept_zutat */
SELECT rezept.rezeptnr, rezept.rezeptname, rezept_zutat.zutatennr, rezept_zutat.menge
FROM rezept JOIN rezept_zutat ON rezept.rezeptnr = rezept_zutat.rezeptnr;

/* join rezept, rezept_zutat and zutat */
SELECT rezept.rezeptnr, rezept.rezeptname, rezept_zutat.zutatennr, rezept_zutat.menge, zutat.bezeichnung, zutat.nettopreis
FROM rezept
JOIN rezept_zutat ON rezept.rezeptnr = rezept_zutat.rezeptnr
JOIN zutat ON rezept_zutat.zutatennr = zutat.zutatennr;

/* select rezepte with protein, kalorien and kohlenhydrate */
SELECT rezept.rezeptnr, rezept.rezeptname, SUM(zutat.kalorien * rezept_zutat.menge) as kalorien,
       SUM(zutat.kohlenhydrate * rezept_zutat.menge) as kohlenhydrate,
       SUM(zutat.protein * rezept_zutat.menge) as protein
FROM rezept
         JOIN rezept_zutat ON rezept.rezeptnr = rezept_zutat.rezeptnr
         JOIN zutat ON rezept_zutat.zutatennr = zutat.zutatennr
group by rezept.rezeptnr;

/*sum of nährwerte of bestellung of a kunde*/
SELECT bestellung.kundennr, bestellung.bestellnr, SUM(zutat.kalorien * rezept_zutat.menge * bestellung_rezept.menge) as kalorien,
       SUM(zutat.kohlenhydrate * rezept_zutat.menge * bestellung_rezept.menge) as kohlenhydrate,
       SUM(zutat.protein * rezept_zutat.menge * bestellung_rezept.menge) as protein
FROM bestellung
         JOIN bestellung_rezept ON bestellung.bestellnr = bestellung_rezept.bestellnr
         JOIN rezept ON rezept.rezeptnr = bestellung_rezept.rezeptnr
         JOIN rezept_zutat ON rezept.rezeptnr = rezept_zutat.rezeptnr
         JOIN zutat ON rezept_zutat.zutatennr = zutat.zutatennr
where bestellung.kundennr = 2001
group by bestellung.kundennr, bestellung.bestellnr;


/* number of bestellungen of a kunde */
SELECT
    COUNT(b.kundennr)
FROM
    bestellung as b
WHERE
    b.kundennr = 2001;

SELECT bestellung.kundennr, COUNT(*)
FROM bestellung
         JOIN bestellung_rezept ON bestellung.bestellnr = bestellung_rezept.bestellnr
         JOIN rezept ON rezept.rezeptnr = bestellung_rezept.rezeptnr
         JOIN rezept_zutat ON rezept.rezeptnr = rezept_zutat.rezeptnr
         JOIN zutat ON rezept_zutat.zutatennr = zutat.zutatennr
where bestellung.kundennr = 2001
group by bestellung.kundennr;