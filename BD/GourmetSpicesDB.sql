DROP DATABASE IF EXISTS GourmetSpicesDB;
CREATE DATABASE GourmetSpicesDB;

USE GourmetSpicesDB;

-- Elimina le tabelle se esistono gi� nell'ordine corretto per rispettare le chiavi esterne
DROP TABLE IF EXISTS Spedizione;
DROP TABLE IF EXISTS Contenente;
DROP TABLE IF EXISTS Carrello;
DROP TABLE IF EXISTS Contenente_Carrello;
DROP TABLE IF EXISTS Ordine;
DROP TABLE IF EXISTS Metodo_Di_Pagamento;
DROP TABLE IF EXISTS Prodotto;
DROP TABLE IF EXISTS Utente;
DROP TABLE IF EXISTS Immagine_Prodotto;

-- Creazione della tabella Utente
CREATE TABLE Utente (
    email VARCHAR(50) PRIMARY KEY NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(200) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    Tipo_utente VARCHAR(16) NOT NULL DEFAULT 'USER'
);

-- Creazione della tabella Metodo_Di_Pagamento
CREATE TABLE Metodo_Di_Pagamento (
    email VARCHAR(50) NOT NULL,
    NCarta VARCHAR(16) PRIMARY KEY NOT NULL,
    CVV VARCHAR(50) NOT NULL,
    data DATE NOT NULL,
    FOREIGN KEY (email) REFERENCES Utente(email)
);

-- Creazione della tabella Prodotto
CREATE TABLE Prodotto (
    ID_prodotto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    prezzo INT NOT NULL,
    valido INT NOT NULL DEFAULT 1,
    nome VARCHAR(50) NOT NULL,
    descrizione VARCHAR(50) NOT NULL,
    In_Evidenza INT NOT NULL DEFAULT 0
);

-- Creazione della tabella Immagine_Prodotto
CREATE TABLE Immagine_Prodotto (
    ID_prodotto INT NOT NULL,
    ID_immagine INT NOT NULL AUTO_INCREMENT,
    Immagine VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID_immagine),
    FOREIGN KEY (ID_prodotto) REFERENCES Prodotto(ID_prodotto)
);

-- Creazione della tabella Carrello
CREATE TABLE Carrello (
    ID_carrello INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID_carrello),
    FOREIGN KEY (email) REFERENCES Utente(email)
);

-- Creazione della tabella Contenente_Carrello
CREATE TABLE Contenente_Carrello (
    ID_carrello INT NOT NULL,
    ID_prodotto INT NOT NULL,
    quantita INT NOT NULL,
    FOREIGN KEY (ID_carrello) REFERENCES Carrello(ID_carrello),
    FOREIGN KEY (ID_prodotto) REFERENCES Prodotto(ID_prodotto),
    PRIMARY KEY (ID_carrello, ID_prodotto)
);

-- Creazione della tabella Ordine
CREATE TABLE Ordine (
    ID_ordine INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NCarta VARCHAR(16) NOT NULL,
    email VARCHAR(50) NOT NULL,
    data DATE NOT NULL,
    spesa FLOAT NOT NULL,
    indirizzo VARCHAR(50) NOT NULL,
    FOREIGN KEY (email) REFERENCES Utente(email),
    FOREIGN KEY (NCarta) REFERENCES Metodo_Di_Pagamento(NCarta)
);

-- Creazione della tabella Contenente
CREATE TABLE Contenente (
    ID_prodotto INT NOT NULL,
    ID_ordine INT NOT NULL,
    prezzo_all_acquisto FLOAT NOT NULL,
    quantita INT NOT NULL,
    PRIMARY KEY (ID_prodotto, ID_ordine),
    FOREIGN KEY (ID_prodotto) REFERENCES Prodotto(ID_prodotto),
    FOREIGN KEY (ID_ordine) REFERENCES Ordine(ID_ordine)
);

-- Inserimento degli utenti
INSERT INTO Utente (email, username, password, nome, cognome, Tipo_utente)
VALUES
('giulia.fiori@email.com', 'giuliaFiori', 'c2FsYXRpbm/tmVKSSq+IgCOVraDwsetxEwbPQgWhaX2YuPaDpnkGzA==', 'Giulia', 'Fiori', 'USER'),
('antonio.verdi@email.com', 'antonioVerdi', 'c2FsYXRpbm/tmVKSSq+IgCOVraDwsetxEwbPQgWhaX2YuPaDpnkGzA==', 'Antonio', 'Verdi', 'USER'),
('sofia.viola@email.com', 'sofiaViola', 'c2FsYXRpbm/tmVKSSq+IgCOVraDwsetxEwbPQgWhaX2YuPaDpnkGzA==', 'Sofia', 'Viola', 'USER'),
('marco.azzurri@email.com', 'marcoAzzurri', 'c2FsYXRpbm/tmVKSSq+IgCOVraDwsetxEwbPQgWhaX2YuPaDpnkGzA==', 'Marco', 'Azzurri', 'USER'),
('laura.gialli@email.com', 'lauraGialli', 'c2FsYXRpbm/tmVKSSq+IgCOVraDwsetxEwbPQgWhaX2YuPaDpnkGzA==', 'Laura', 'Gialli', 'USER'),
('francesco.rossi@email.com', 'francescoRossi', 'c2FsYXRpbm/tmVKSSq+IgCOVraDwsetxEwbPQgWhaX2YuPaDpnkGzA==', 'Francesco', 'Rossi', 'USER'),
('admin@email.com', 'admin', 'c2FsYXRpbm9IS/2gld3f28WW5kC9phK5hntWSGZ00Oo83HeBwbeW7Q==', 'admin', 'admin', 'ADMIN');

-- Inserimento dei prodotti che sono spezie
INSERT INTO Prodotto (prezzo, nome, descrizione, In_Evidenza)
VALUES
(3, 'Pepe Nero', 'Pepe nero in polvere (50g)', 1),
(6, 'Zenzero', 'Zenzero in polvere (50g)', 1),
(8, 'Cannella', 'Cannella in polvere (50g)', 1),
(9, 'Chiodi di Garofano', 'Chiodi di garofano in polvere (50g)', 0),
(4, 'Noce Moscata', 'Noce moscata in polvere (50g)', 0),
(5, 'Cumino', 'Cumino in semi (50g)', 0),
(4, 'Coriandolo', 'Coriandolo in polvere (50g)', 0);

-- Inserimento dei metodi di pagamento
INSERT INTO Metodo_Di_Pagamento (email, NCarta, CVV, data)
VALUES
('giulia.fiori@email.com', '1234567890123456', '123', '2024-12-31'),
('antonio.verdi@email.com', '9876543210987654', '456', '2025-06-30');

-- Inserimento degli ordini
INSERT INTO Ordine (NCarta, email, data, spesa, indirizzo)
VALUES
('1234567890123456', 'giulia.fiori@email.com', '2024-06-05', 10.00, 'Via Roma 1'),
('9876543210987654', 'antonio.verdi@email.com', '2024-06-05', 7.00, 'Via Milano 2');


-- Inserimento dei prodotti nei vari ordini (Contenente)
INSERT INTO Contenente (ID_prodotto, ID_ordine, prezzo_all_acquisto, quantita)
VALUES
(1, 1, 3.00, 2),
(2, 2, 6.00, 1),
(3, 2, 8.00, 1),
(4, 1, 9.00, 2),
(5, 1, 4.00, 3);

-- Inserimento dei carrelli per ogni utente
INSERT INTO Carrello (email)
SELECT email FROM Utente;

-- Inserimento dei prodotti nei vari carrelli (Contenente_Carrello)
INSERT INTO Contenente_Carrello (ID_carrello, ID_prodotto, quantita)
VALUES
(1, 1, 2),
(1, 2, 1),
(1, 3, 1),
(2, 4, 2),
(2, 5, 3),
(2, 6, 1);

-- Inserimento di un'immagine nella tabella Immagine_Prodotto
INSERT INTO Immagine_Prodotto (ID_prodotto, Immagine)
VALUES 
(1, 'pepe-nero.jpg'),
(2, 'zenzero.png'),
(3, 'cannella.jpg'),
(4, 'cloves.jpg'),
(5, 'nutmeg.jpg'),
(6, 'cumino.jpg'),
(7, 'coriandolo.jpg');
