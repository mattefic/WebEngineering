-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Set 03, 2018 alle 15:04
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
  `orario` varchar(100) DEFAULT NULL,
  `convenzionata` tinyint(4) DEFAULT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(300) NOT NULL,
  `valutazione` decimal(2,1) DEFAULT NULL,
  `numTirocinanti` int(11) DEFAULT NULL,
  `numVoti` int(11) NOT NULL DEFAULT '0',
  `fileConvenzione` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `azienda`
--

INSERT INTO `azienda` (`idAzienda`, `partitaIVACodiceFiscale`, `ragioneSocialeNome`, `indirizzo`, `nomeLegale`, `cognomeLegale`, `foro`, `nomeRespTirocinio`, `cognomeRespTirocinio`, `telefonoRespTirocinio`, `emailRespTirocinio`, `orario`, `convenzionata`, `email`, `password`, `valutazione`, `numTirocinanti`, `numVoti`, `fileConvenzione`) VALUES
(1, '12345678912', 'Pippo', 'Via delle Querce, 10', 'Francesco', 'Giostra', 'Castel di Lama', 'Matteo', 'Ficorilli', '3339876543', 'MF@gmail.com', NULL, 1, 'pippo@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0.0', 0, 0, NULL),
(2, '12345678931', 'Pluto', 'Via Pluto 35', 'Paolino', 'Paperino', 'Roma', 'Mickey', 'Mouse', '3336459789', 'Disney@gmail.com', NULL, 1, 'pluto@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0.0', 0, 0, NULL),
(3, '12345678921', 'Topolino', 'Via Topolino 22', 'Mickey', 'Mouse', 'Genova', 'Mickey', 'Mouse', '3333333333', 'MM@gmail.com', NULL, 1, 'topolino@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0.0', 0, 0, NULL);

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
  `idTutoreAziendale` int(11) NOT NULL,
  `stato` varchar(16) NOT NULL,
  `dataCandidatura` date NOT NULL,
  `cfu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `candidatura`
--

INSERT INTO `candidatura` (`idCandidatura`, `idAzienda`, `idOfferta`, `idUtente`, `idTutoreUniversitario`, `idTutoreAziendale`, `stato`, `dataCandidatura`, `cfu`) VALUES
(1, 1, 1, 2, 0, 0, 'accettata', '2018-08-30', 12);

-- --------------------------------------------------------

--
-- Struttura della tabella `contratto`
--

CREATE TABLE `contratto` (
  `idContratto` int(11) NOT NULL,
  `idAzienda` int(11) NOT NULL,
  `idTutoreAziendale` int(11) NOT NULL,
  `idOfferta` int(11) NOT NULL,
  `idUtente` int(11) NOT NULL,
  `idTutoreUniversitario` int(11) NOT NULL,
  `dataAccettazione` date NOT NULL,
  `dataInizio` date DEFAULT NULL,
  `dataFine` date DEFAULT NULL,
  `cfu` int(11) NOT NULL,
  `votato` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `contratto`
--

INSERT INTO `contratto` (`idContratto`, `idAzienda`, `idTutoreAziendale`, `idOfferta`, `idUtente`, `idTutoreUniversitario`, `dataAccettazione`, `dataInizio`, `dataFine`, `cfu`, `votato`) VALUES
(1, 1, 0, 1, 2, 0, '2018-09-01', '2018-11-01', '2019-03-31', 12, 0);

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
  `obiettivi` varchar(300) NOT NULL,
  `modalita` varchar(200) NOT NULL,
  `visibile` tinyint(4) NOT NULL,
  `idAzienda` int(11) UNSIGNED NOT NULL,
  `rimborsiFacilitazioni` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `offerta`
--

INSERT INTO `offerta` (`idOfferta`, `data`, `titolo`, `settore`, `descrizione`, `luogo`, `orario`, `mesi`, `ore`, `obiettivi`, `modalita`, `visibile`, `idAzienda`, `rimborsiFacilitazioni`) VALUES
(1, '2018-08-30', 'Lavoro MGM Service', 'Industriale', 'Possibilità  di lavorare in un industria di montaggio/smontaggio macchine industriali e successiva programmazione', 'Ascoli Piceno', '9:00 - 13:00', 6, 180, 'Istruire una figura professionale nel settore montaggio/smontaggio/programmazione macchinari industriali', '3 settimane al mese, si lavora il LunedÃ¬, il MartedÃ¬ e il MercoledÃ¬ mattina', 1, 1, 'Rimborso spese'),
(2, '2018-08-30', 'Tirocinio sceneggiatura', 'Intrattenimento', 'Ti schiavizziamo', 'DisneyWorld', '0:00 - 23:59', 12, 867, 'Schiavizzarti', 'Schiavizzati divertendoti', 1, 2, 'Sei uno schiavo negro'),
(3, '2018-08-30', 'Tirocinio Manutenzione', 'Intrattenimento', 'Ti schiavizziamo', 'DisneyWorld', '0:00 - 23:59', 12, 500, 'Schiavizzarti', 'Schiavizzati divertendoti', 1, 2, 'Sei uno schiavo negro');

-- --------------------------------------------------------

--
-- Struttura della tabella `tutore_aziendale`
--

CREATE TABLE `tutore_aziendale` (
  `idTutore` int(11) NOT NULL,
  `idAzienda` int(11) UNSIGNED NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `telefono` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tutore_universitario`
--

CREATE TABLE `tutore_universitario` (
  `idTutore` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `numRichieste` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(2, 'PLNPPR89D23H769B', 'Paolina', 'Paperina', '1989-08-17', 'DisneyWorld', 'Città  di Mezzo', '3485286945', 'Economia', 0, 'PP@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'utente'),
(3, 'MRIRSS28P05H678B', 'Mario', 'Rossi', '1928-01-01', 'TommorowLand', 'TomorrowLand', '3465987555', 'Ingegneria', 0, 'MR@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'utente');

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
  ADD PRIMARY KEY (`idTutoreAziendale`,`idOfferta`,`idUtente`,`idTutoreUniversitario`),
  ADD KEY `fk_Contratto_Tutore_Aziendale1_idx` (`idTutoreAziendale`),
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
-- Indici per le tabelle `tutore_aziendale`
--
ALTER TABLE `tutore_aziendale`
  ADD PRIMARY KEY (`idAzienda`),
  ADD KEY `idTutore` (`idTutore`);

--
-- Indici per le tabelle `tutore_universitario`
--
ALTER TABLE `tutore_universitario`
  ADD PRIMARY KEY (`idTutore`),
  ADD UNIQUE KEY `telefono` (`telefono`);

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
  MODIFY `idAzienda` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT per la tabella `candidatura`
--
ALTER TABLE `candidatura`
  MODIFY `idCandidatura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `contratto`
--
ALTER TABLE `contratto`
  MODIFY `idContratto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `offerta`
--
ALTER TABLE `offerta`
  MODIFY `idOfferta` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT per la tabella `tutore_aziendale`
--
ALTER TABLE `tutore_aziendale`
  MODIFY `idTutore` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `idUtente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
