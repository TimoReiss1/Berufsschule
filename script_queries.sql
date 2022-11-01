/* join bestellung and bestellung rezept */
SELECT bestellung.bestellnr, bestellung_rezept.rezeptnr, bestellung_rezept.menge, bestellung.kundennr, bestellung.bestelldatum, bestellung.rechnungsbetrag
FROM bestellung JOIN bestellung_rezept ON bestellung.bestellnr = bestellung_rezept.bestellnr;