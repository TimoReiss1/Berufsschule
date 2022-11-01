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