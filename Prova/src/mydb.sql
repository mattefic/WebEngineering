-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ago 21, 2018 alle 11:07
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
  `idAzienda` int(16) NOT NULL,
  `partitaIVACodiceFiscale` char(11) NOT NULL,
  `ragioneSocialeNome` varchar(30) NOT NULL,
  `indirizzo` varchar(45) NOT NULL,
  `nomeLegale` varchar(20) NOT NULL,
  `cognomeLegale` varchar(30) NOT NULL,
  `foro` varchar(30) NOT NULL,
  `nomeRespTirocinio` varchar(20) NOT NULL,
  `cognomeRespTirocinio` varchar(30) NOT NULL,
  `telefonoRespTirocinio` varchar(13) NOT NULL,
  `emailRespTirocinio` varchar(45) NOT NULL,
  `orario` varchar(100) DEFAULT NULL,
  `convenzionata` tinyint(4) DEFAULT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `azienda`
--

INSERT INTO `azienda` (`idAzienda`, `partitaIVACodiceFiscale`, `ragioneSocialeNome`, `indirizzo`, `nomeLegale`, `cognomeLegale`, `foro`, `nomeRespTirocinio`, `cognomeRespTirocinio`, `telefonoRespTirocinio`, `emailRespTirocinio`, `orario`, `convenzionata`, `email`, `password`) VALUES
(1, '12345678912', 'MGM Service', 'Via delle Querce, 10', 'Francesco', 'Giostra', 'Castel di Lama', 'Maurizio', 'Giostra', '3466318898', 'mg@gmail.com', NULL, 0, 'mgmservice@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Struttura della tabella `canditatura`
--

CREATE TABLE `canditatura` (
  `idCandidatura` int(11) NOT NULL,
  `idOfferta` int(11) NOT NULL,
  `idUtente` int(16) NOT NULL,
  `idTutore` int(11) NOT NULL,
  `stato` varchar(16) NOT NULL,
  `dataCandidatura` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `contratto`
--

CREATE TABLE `contratto` (
  `idContratto` int(11) NOT NULL,
  `idTutoreAziendale` int(11) NOT NULL,
  `idOfferta` int(11) NOT NULL,
  `idUtente` int(11) NOT NULL,
  `idTutoreUniversitario` int(11) NOT NULL,
  `dataAccettazione` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `offerta`
--

CREATE TABLE `offerta` (
  `idOfferta` int(10) UNSIGNED NOT NULL,
  `luogo` varchar(30) NOT NULL,
  `orario` varchar(100) NOT NULL,
  `mesi` int(10) UNSIGNED NOT NULL,
  `ore` int(10) UNSIGNED NOT NULL,
  `obiettivi` varchar(300) NOT NULL,
  `modalità` varchar(200) NOT NULL,
  `rimborsi/facilitazioni` varchar(200) NOT NULL,
  `visibile` tinyint(4) NOT NULL,
  `idAzienda` int(11) UNSIGNED NOT NULL,
  `rimborsiFacilitazioni` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `offerta`
--

INSERT INTO `offerta` (`idOfferta`, `luogo`, `orario`, `mesi`, `ore`, `obiettivi`, `modalità`, `rimborsi/facilitazioni`, `visibile`, `idAzienda`, `rimborsiFacilitazioni`) VALUES
(1, 'rieti', '10-10', 5, 60, 'EHEHEHEHEH', 'BElle', 'NOOO', 1, 10, 'NONONONONO'),
(2, 'rieti', '10-10', 5, 60, 'EHEHEHEHEH', 'BElle', 'NOOO', 1, 10, 'NONONONONO');

-- --------------------------------------------------------

--
-- Struttura della tabella `tutore_aziendale`
--

CREATE TABLE `tutore_aziendale` (
  `idTutore` int(11) NOT NULL,
  `idAzienda` int(11) UNSIGNED NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tutore_universitario`
--

CREATE TABLE `tutore_universitario` (
  `idTutore` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
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
  `telefono` varchar(13) NOT NULL,
  `corsoLaurea` varchar(45) NOT NULL,
  `handicap` tinyint(4) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(18) NOT NULL,
  `tipo` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`idUtente`, `codiceFiscale`, `nome`, `cognome`, `dataNascita`, `luogoNascita`, `residenza`, `telefono`, `corsoLaurea`, `handicap`, `email`, `password`, `tipo`) VALUES
(1, 'GSTFNC95P02H769D', 'Francesco', 'Giostra', '1995-09-02', 'San Benedetto del Tronto', 'Via delle Querce 10', '3466318898', 'Informatica', 0, 'france.1995@hotmail.it', '1234', 'utente');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `azienda`
--
ALTER TABLE `azienda`
  ADD PRIMARY KEY (`partitaIVACodiceFiscale`),
  ADD KEY `IdAzienda` (`idAzienda`);

--
-- Indici per le tabelle `canditatura`
--
ALTER TABLE `canditatura`
  ADD PRIMARY KEY (`idOfferta`,`idUtente`,`idTutore`),
  ADD KEY `idCandidatura` (`idCandidatura`);

--
-- Indici per le tabelle `contratto`
--
ALTER TABLE `contratto`
  ADD PRIMARY KEY (`idTutoreAziendale`,`idOfferta`,`idUtente`,`idTutoreUniversitario`),
  ADD KEY `fk_Contratto_Tutore_Aziendale1_idx` (`idTutoreAziendale`),
  ADD KEY `fk_Contratto_Canditatura1_idx` (`idOfferta`,`idUtente`,`idTutoreUniversitario`),
  ADD KEY `idContratto` (`idContratto`);

--
-- Indici per le tabelle `offerta`
--
ALTER TABLE `offerta`
  ADD PRIMARY KEY (`idOfferta`,`idAzienda`),
  ADD KEY `fk_Offerta_Azienda_idx` (`idAzienda`);

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
  ADD PRIMARY KEY (`idTutore`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`codiceFiscale`),
  ADD KEY `idUtente` (`idUtente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `azienda`
--
ALTER TABLE `azienda`
  MODIFY `idAzienda` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `canditatura`
--
ALTER TABLE `canditatura`
  MODIFY `idCandidatura` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `contratto`
--
ALTER TABLE `contratto`
  MODIFY `idContratto` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `offerta`
--
ALTER TABLE `offerta`
  MODIFY `idOfferta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `tutore_aziendale`
--
ALTER TABLE `tutore_aziendale`
  MODIFY `idTutore` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `idUtente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
