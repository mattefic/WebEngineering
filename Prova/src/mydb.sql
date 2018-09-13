-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Set 13, 2018 alle 09:42
-- Versione del server: 10.1.25-MariaDB
-- Versione PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `azienda`
--

CREATE TABLE `azienda` (
  `idAzienda` int(11) UNSIGNED NOT NULL,
  `partitaIVACodiceFiscale` char(11) NOT NULL,
  `ragioneSocialeNome` varchar(30) NOT NULL,
  `indirizzo` varchar(45) NOT NULL,
  `nomeLegale` varchar(20) NOT NULL,
  `cognomeLegale` varchar(30) NOT NULL,
  `foro` varchar(30) NOT NULL,
  `nomeRespTirocinio` varchar(20) NOT NULL,
  `cognomeRespTirocinio` varchar(30) NOT NULL,
  `telefonoRespTirocinio` varchar(14) NOT NULL,
  `emailRespTirocinio` varchar(45) NOT NULL,
  `convenzionata` tinyint(4) DEFAULT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(300) NOT NULL,
  `valutazione` decimal(2,1) DEFAULT NULL,
  `numTirocinanti` int(11) DEFAULT NULL,
  `numVoti` int(11) NOT NULL DEFAULT '0',
  `fileConvenzione` varchar(200) DEFAULT 'assente',
  `orario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `azienda`
--

INSERT INTO `azienda` (`idAzienda`, `partitaIVACodiceFiscale`, `ragioneSocialeNome`, `indirizzo`, `nomeLegale`, `cognomeLegale`, `foro`, `nomeRespTirocinio`, `cognomeRespTirocinio`, `telefonoRespTirocinio`, `emailRespTirocinio`, `convenzionata`, `email`, `password`, `valutazione`, `numTirocinanti`, `numVoti`, `fileConvenzione`, `orario`) VALUES
(1, '12345678912', 'Pippo', 'Via delle Querce, 10', 'Francesco', 'Giostra', 'Castel di Lama', 'Matteo', 'Ficorilli', '3339876543', 'MF@gmail.com', 1, 'pippo@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0.0', 1, 0, 'FileProgetto/Convenzioni/1.pdf', NULL),
(2, '12345678931', 'Pluto', 'Via Pluto 35', 'Paolino', 'Paperino', 'Roma', 'Mickey', 'Mouse', '3336459789', 'Disney@gmail.com', 1, 'pluto@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '3.0', 3, 1, 'assente', NULL),
(3, '12345678921', 'Topolino', 'Via Topolino 22', 'Mickey', 'Mouse', 'Genova', 'Mickey', 'Mouse', '3333333333', 'MM@gmail.com', 1, 'topolino@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0.0', 0, 0, 'assente', NULL),
(4, '12345678936', 'Topolina', 'Via delle Querce, 10', 'Minnie', 'Mouse', 'Castel di Lama', 'Mickey', 'Mouse', '3334568741', 'MM2@gmail.com', 0, 'topolina@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0.0', 0, 0, 'assente', NULL),
(5, '98765432156', 'Titti', 'Via Silvestro 12', 'Titti', 'Pulcino', 'Warner City', 'Silvestro', 'Silvester', '3331234568', 'SS@gmail.com', 0, 'titti@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0.0', 0, 0, 'assente', NULL),
(6, '15975345621', 'Fainplast', 'Via Caduti del Lavoro 10', 'Marco', 'Antonietti', 'Ascoli Piceno', 'Franco', 'Pierfranceschi', '3487659123', 'FP@gmail.com', 1, 'Fainplast@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0.0', 0, 0, 'assente', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `candidatura`
--

CREATE TABLE `candidatura` (
  `idCandidatura` int(11) NOT NULL,
  `idAzienda` int(11) NOT NULL,
  `idOfferta` int(11) UNSIGNED NOT NULL,
  `idUtente` int(11) NOT NULL,
  `idTutoreUniversitario` int(11) NOT NULL,
  `stato` varchar(16) NOT NULL,
  `dataCandidatura` date NOT NULL,
  `cfu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `candidatura`
--

INSERT INTO `candidatura` (`idCandidatura`, `idAzienda`, `idOfferta`, `idUtente`, `idTutoreUniversitario`, `stato`, `dataCandidatura`, `cfu`) VALUES
(1, 1, 1, 2, 1, 'accettata', '2018-09-06', 12),
(2, 2, 2, 3, 1, 'accettata', '2018-09-06', 3),
(3, 2, 3, 3, 1, 'rifiutata', '2018-09-06', 12),
(4, 2, 2, 4, 1, 'accettata', '2018-09-10', 9),
(5, 2, 3, 4, 1, 'accettata', '2018-09-10', 12),
(6, 2, 2, 5, 1, 'accettata', '2018-09-10', 14),
(7, 1, 1, 5, 1, 'rifiutata', '2018-09-10', 9),
(8, 1, 4, 5, 1, 'rifiutata', '2018-09-10', 4),
(9, 2, 3, 5, 2, 'rifiutata', '2018-09-10', 9),
(10, 1, 1, 6, 1, 'attesa', '2018-09-12', 12),
(11, 2, 2, 6, 1, 'attesa', '2018-09-12', 12);

-- --------------------------------------------------------

--
-- Struttura della tabella `contratto`
--

CREATE TABLE `contratto` (
  `idContratto` int(11) NOT NULL,
  `idAzienda` int(11) NOT NULL,
  `idOfferta` int(11) NOT NULL,
  `idUtente` int(11) NOT NULL,
  `idTutoreUniversitario` int(11) NOT NULL,
  `dataAccettazione` date NOT NULL,
  `dataInizio` date DEFAULT NULL,
  `dataFine` date DEFAULT NULL,
  `cfu` int(11) NOT NULL,
  `votato` tinyint(4) NOT NULL DEFAULT '0',
  `percorso` varchar(200) DEFAULT NULL,
  `statoFile` varchar(20) NOT NULL DEFAULT 'precompilato'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `contratto`
--

INSERT INTO `contratto` (`idContratto`, `idAzienda`, `idOfferta`, `idUtente`, `idTutoreUniversitario`, `dataAccettazione`, `dataInizio`, `dataFine`, `cfu`, `votato`, `percorso`, `statoFile`) VALUES
(1, 1, 1, 2, 1, '2018-09-07', '2018-09-10', '2018-09-30', 12, 0, 'FileProgetto/ProgettiFormativi/1.pdf', 'caricato'),
(2, 2, 2, 3, 1, '2018-09-10', '2018-09-24', '2018-12-24', 3, 1, 'FileProgetto/ProgettiFormativi/2.pdf', 'caricato'),
(4, 2, 2, 5, 1, '2018-09-10', '2018-09-17', '2019-02-18', 14, 0, 'FileProgetto/ProgettiFormativi/4.pdf', 'precompilato'),
(3, 2, 3, 4, 1, '2018-09-10', '2018-09-17', '2019-03-17', 12, 0, 'FileProgetto/ProgettiFormativi/3.pdf', 'compilato');

-- --------------------------------------------------------

--
-- Struttura della tabella `offerta`
--

CREATE TABLE `offerta` (
  `idOfferta` int(11) UNSIGNED NOT NULL,
  `data` date NOT NULL,
  `titolo` varchar(100) NOT NULL,
  `settore` varchar(100) NOT NULL,
  `descrizione` varchar(500) NOT NULL,
  `luogo` varchar(30) NOT NULL,
  `orario` varchar(100) NOT NULL,
  `mesi` int(10) UNSIGNED NOT NULL,
  `ore` int(10) UNSIGNED NOT NULL,
  `obiettivi` varchar(500) NOT NULL,
  `modalita` varchar(500) NOT NULL,
  `visibile` tinyint(4) NOT NULL,
  `idAzienda` int(11) UNSIGNED NOT NULL,
  `rimborsiFacilitazioni` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `offerta`
--

INSERT INTO `offerta` (`idOfferta`, `data`, `titolo`, `settore`, `descrizione`, `luogo`, `orario`, `mesi`, `ore`, `obiettivi`, `modalita`, `visibile`, `idAzienda`, `rimborsiFacilitazioni`) VALUES
(1, '2018-08-30', 'Lavoro MGM Service', 'Industriale', 'Possibilità  di lavorare in un industria di montaggio/smontaggio macchine industriali e successiva programmazione', 'Ascoli Piceno', '9:00 - 13:00', 6, 180, 'Istruire una figura professionale nel settore montaggio/smontaggio/programmazione macchinari industriali', '3 settimane al mese, si lavora il Lunedì, il Martedì e il Mercoledì mattina', 1, 1, 'Rimborso spese'),
(2, '2018-08-30', 'Tirocinio sceneggiatura', 'Intrattenimento', 'Ti schiavizziamo', 'DisneyWorld', '0:00 - 23:59', 12, 867, 'Schiavizzarti', 'Schiavizzati divertendoti', 1, 2, 'Sei uno schiavo negro'),
(3, '2018-08-30', 'Tirocinio Manutenzione', 'Intrattenimento', 'Ti schiavizziamo', 'DisneyWorld', '0:00 - 23:59', 12, 500, 'Schiavizzarti', 'Schiavizzati divertendoti', 1, 2, 'Sei uno schiavo negro'),
(4, '2018-09-06', 'blable', 'industriale', 'asdvsd', 'roma', '9:00 - 13:00', 6, 120, 'dsavsvsav', 'vasdvsdavsd', 1, 1, 'jancabsdvkabsdyovafsdav');

-- --------------------------------------------------------

--
-- Struttura della tabella `tutore_universitario`
--

CREATE TABLE `tutore_universitario` (
  `idTutore` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `email` varchar(200) NOT NULL,
  `numRichieste` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `tutore_universitario`
--

INSERT INTO `tutore_universitario` (`idTutore`, `nome`, `cognome`, `email`, `numRichieste`) VALUES
(1, 'Francesco', 'Giostra', 'franz@gmail.com', 10),
(2, 'Romano', 'Patrizi', 'patrizi@gmail.com', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `idUtente` int(11) NOT NULL,
  `codiceFiscale` char(16) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `dataNascita` date NOT NULL,
  `luogoNascita` varchar(30) NOT NULL,
  `residenza` varchar(30) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `corsoLaurea` varchar(45) NOT NULL,
  `handicap` tinyint(4) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `tipo` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`idUtente`, `codiceFiscale`, `nome`, `cognome`, `dataNascita`, `luogoNascita`, `residenza`, `telefono`, `corsoLaurea`, `handicap`, `email`, `password`, `tipo`) VALUES
(1, 'GSTFNC95P02H769D', 'Francesco', 'Giostra', '1995-09-02', 'San Benedetto del Tronto', 'Via delle Querce, 10', '3466318898', 'Informatica', 0, 'france.1995@hotmail.it', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'admin'),
(2, 'PLNPPR89D23H769B', 'Paolina', 'Paperina', '1989-08-17', 'DisneyWorld', 'Città  di Mezzo', '3485286945', 'Economia', 0, 'PP@gmail.com', '4f11e29d58bbabcde408f33023dee661be94107a0d7d9e5f0b9c9946a1da1135', 'utente'),
(3, 'MRIRSS28P05H678B', 'Mario', 'Rossi', '1928-01-01', 'TommorowLand', 'TomorrowLand', '3465987555', 'Ingegneria', 0, 'MR@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'utente'),
(4, 'GRGGGI94P34H754D', 'Gigi', 'Giorgi', '1994-01-22', 'Roma', 'Roma', '3214587965', 'Informatica', 0, 'Gigi@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'utente'),
(5, 'MTLGCM92S22Q123P', 'Giacomo', 'Mattioli', '1992-06-18', 'Milano', 'Milano', '3465986789', 'Lettere', 0, 'Mattioz@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'utente'),
(6, 'CRLCRL22D45S654Q', 'Carlo', 'Carletti', '1992-08-06', 'Castel di Lama', 'Roma', '3465978123', 'Informatica', 0, 'Carlo@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'utente');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `azienda`
--
ALTER TABLE `azienda`
  ADD PRIMARY KEY (`idAzienda`) USING BTREE;

--
-- Indici per le tabelle `candidatura`
--
ALTER TABLE `candidatura`
  ADD PRIMARY KEY (`idCandidatura`) USING BTREE,
  ADD KEY `FKr6qi386sf4higxiwdd26pwbtc` (`idUtente`),
  ADD KEY `FK6c7e7h8akx33rp7kbejn5am7f` (`idOfferta`);

--
-- Indici per le tabelle `contratto`
--
ALTER TABLE `contratto`
  ADD PRIMARY KEY (`idOfferta`,`idUtente`,`idTutoreUniversitario`),
  ADD KEY `fk_Contratto_Canditatura1_idx` (`idOfferta`,`idUtente`,`idTutoreUniversitario`),
  ADD KEY `idContratto` (`idContratto`),
  ADD KEY `FKgfwklpjqbta4rgrod138km59g` (`idUtente`);

--
-- Indici per le tabelle `offerta`
--
ALTER TABLE `offerta`
  ADD PRIMARY KEY (`idOfferta`) USING BTREE,
  ADD KEY `FKnr1ximr4wh8aae2sf481wskpl` (`idAzienda`);

--
-- Indici per le tabelle `tutore_universitario`
--
ALTER TABLE `tutore_universitario`
  ADD PRIMARY KEY (`idTutore`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`idUtente`) USING BTREE;

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `azienda`
--
ALTER TABLE `azienda`
  MODIFY `idAzienda` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT per la tabella `candidatura`
--
ALTER TABLE `candidatura`
  MODIFY `idCandidatura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT per la tabella `contratto`
--
ALTER TABLE `contratto`
  MODIFY `idContratto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT per la tabella `offerta`
--
ALTER TABLE `offerta`
  MODIFY `idOfferta` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT per la tabella `tutore_universitario`
--
ALTER TABLE `tutore_universitario`
  MODIFY `idTutore` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `idUtente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `candidatura`
--
ALTER TABLE `candidatura`
  ADD CONSTRAINT `FK6c7e7h8akx33rp7kbejn5am7f` FOREIGN KEY (`idOfferta`) REFERENCES `offerta` (`idOfferta`),
  ADD CONSTRAINT `FKr6qi386sf4higxiwdd26pwbtc` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`);

--
-- Limiti per la tabella `contratto`
--
ALTER TABLE `contratto`
  ADD CONSTRAINT `FKgfwklpjqbta4rgrod138km59g` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`);

--
-- Limiti per la tabella `offerta`
--
ALTER TABLE `offerta`
  ADD CONSTRAINT `FKnr1ximr4wh8aae2sf481wskpl` FOREIGN KEY (`idAzienda`) REFERENCES `azienda` (`idAzienda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
