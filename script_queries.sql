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
SELECT bestellung.kundennr, SUM(zutat.kalorien * rezept_zutat.menge * bestellung_rezept.menge) as kalorien,
       /*AVG(kalorien),*/
       SUM(zutat.kohlenhydrate * rezept_zutat.menge * bestellung_rezept.menge) as kohlenhydrate,
       SUM(zutat.protein * rezept_zutat.menge * bestellung_rezept.menge) as protein
FROM bestellung
         JOIN bestellung_rezept ON bestellung.bestellnr = bestellung_rezept.bestellnr
         JOIN rezept ON rezept.rezeptnr = bestellung_rezept.rezeptnr
         JOIN rezept_zutat ON rezept.rezeptnr = rezept_zutat.rezeptnr
         JOIN zutat ON rezept_zutat.zutatennr = zutat.zutatennr
where bestellung.kundennr = 2001
group by bestellung.kundennr;

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