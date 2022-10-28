\c postgres
DROP DATABASE krautundrueben;
CREATE DATABASE krautundrueben;
\c krautundrueben


CREATE TABLE KUNDE (
                       KUNDENNR        INTEGER PRIMARY KEY NOT NULL,
                       NACHNAME        VARCHAR(50),
                       VORNAME         VARCHAR(50),
                       GEBURTSDATUM    DATE,
                       STRASSE         VARCHAR(50),
                       HAUSNR	    VARCHAR(6),
                       PLZ             VARCHAR(5),
                       ORT             VARCHAR(50),
                       TELEFON         VARCHAR(25),
                       EMAIL           VARCHAR(50)
);

CREATE TABLE ZUTAT(
                      ZUTATENNR           INTEGER NOT NULL,
                      BEZEICHNUNG         VARCHAR(50),
                      EINHEIT        	VARCHAR (25),
                      NETTOPREIS	        DECIMAL(10,2),
                      BESTAND             INTEGER,
                      LIEFERANT           INTEGER,
                      KALORIEN            INTEGER,
                      KOHLENHYDRATE       DECIMAL (10,2),
                      PROTEIN             DECIMAL(10,2),
                      PRIMARY KEY         (ZUTATENNR)
);

CREATE TABLE REZEPT(
                       REZEPTNR       SERIAL PRIMARY KEY NOT NULL,
                       REZEPTNAME     VARCHAR(20),
                       ZUTATENNR      INTEGER NOT NULL,
                       VEGETARISCH    BOOLEAN,
                       VEGAN          BOOLEAN,
                       NUESSE         BOOLEAN,
                       FRUTARISCH     BOOLEAN,
                       LOWCARB        BOOLEAN
);

CREATE TABLE BESTELLUNG (
                            BESTELLNR        SERIAL NOT NULL,
                            REZEPTNR         INTEGER,
                            KUNDENNR         INTEGER,
                            BESTELLDATUM     DATE,
                            RECHNUNGSBETRAG  DECIMAL(10,2),
                            PRIMARY KEY     (BESTELLNR)
);


CREATE TABLE REZEPT_ZUTAT(
                            REZEPTNR        INTEGER NOT NULL,
                            ZUTATENNR       INTEGER NOT NULL,
                            MENGE           INTEGER,
                            PRIMARY KEY     (REZEPTNR, ZUTATENNR)
);

CREATE TABLE BESTELLUNG_REZEPT (
                                 BESTELLNR       INTEGER NOT NULL,
                                 REZEPTNR        INTEGER,
                                 MENGE           INTEGER,
                                 PRIMARY KEY (BESTELLNR, REZEPTNR)
);

CREATE TABLE LIEFERANT (
                           LIEFERANTENNR   INTEGER PRIMARY KEY NOT NULL,
                           LIEFERANTENNAME VARCHAR(50),
                           STRASSE         VARCHAR(50),
                           HAUSNR          VARCHAR(6),
                           PLZ             VARCHAR(5),
                           ORT             VARCHAR(50),
                           TELEFON         VARCHAR(25),
                           EMAIL           VARCHAR(50)
);

/******************************************************************************/
/***                              Primary Keys                              ***/
/******************************************************************************/



/******************************************************************************/
/***                              Foreign Keys                              ***/
/******************************************************************************/

ALTER TABLE ZUTAT ADD FOREIGN KEY (LIEFERANT) REFERENCES LIEFERANT (LIEFERANTENNR);
ALTER TABLE BESTELLUNG_REZEPT ADD FOREIGN KEY (BESTELLNR) REFERENCES BESTELLUNG (BESTELLNR);
ALTER TABLE BESTELLUNG_REZEPT ADD FOREIGN KEY (REZEPTNR) REFERENCES REZEPT (REZEPTNR);
ALTER TABLE BESTELLUNG ADD FOREIGN KEY (KUNDENNR) REFERENCES KUNDE (KUNDENNR);
ALTER TABLE REZEPT_ZUTAT ADD FOREIGN KEY (REZEPTNR) REFERENCES REZEPT (REZEPTNR);
ALTER TABLE REZEPT_ZUTAT ADD FOREIGN KEY (ZUTATENNR) REFERENCES ZUTAT (ZUTATENNR);
ALTER TABLE BESTELLUNG ADD FOREIGN KEY (REZEPTNR) REFERENCES REZEPT(REZEPTNR);