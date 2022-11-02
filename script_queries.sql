/*Auswahl aller Zutaten eines Rezeptes nach Rezeptname*/
/* e.g. */
SELECT rezept.rezeptnr, rezept.rezeptname, rezept_zutat.zutatennr, rezept_zutat.menge, zutat.bezeichnung, zutat.nettopreis
FROM rezept
JOIN rezept_zutat ON rezept.rezeptnr = rezept_zutat.rezeptnr
JOIN zutat ON rezept_zutat.zutatennr = zutat.zutatennr
WHERE rezept.rezeptname = 'Thueringer Kloesse';

/*Auswahl aller Rezepte einer bestimmten Ernährungskategorie*/
/*SELECT * FROM rezept WHERE Ernährungskategorie = true;*/
/* e.g. */
SELECT * FROM rezept WHERE vegetarisch = true;

/*Auswahl aller Rezepte, die eine gewisse Zutat enthalten*/

/*Berechnung der durchschnittlichen Nährwerte aller Bestellungen eines Kunden*/
/*ROUND()*/

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