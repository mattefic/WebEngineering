-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Creato il: Ago 20, 2018 alle 08:29
-- Versione del server: 5.7.21
-- Versione PHP: 5.6.35

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

DROP TABLE IF EXISTS `azienda`;
CREATE TABLE IF NOT EXISTS `azienda` (
  `idAzienda` int(16) NOT NULL AUTO_INCREMENT,
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
  `password` varchar(18) NOT NULL,
  `tipo` varchar(16) NOT NULL,
  PRIMARY KEY (`partitaIVACodiceFiscale`),
  KEY `IdAzienda` (`idAzienda`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `azienda`
--

INSERT INTO `azienda` (`idAzienda`, `partitaIVACodiceFiscale`, `ragioneSocialeNome`, `indirizzo`, `nomeLegale`, `cognomeLegale`, `foro`, `nomeRespTirocinio`, `cognomeRespTirocinio`, `telefonoRespTirocinio`, `emailRespTirocinio`, `orario`, `convenzionata`, `email`, `password`, `tipo`) VALUES
(1, '12345678912', 'MGM Service', 'Via delle Querce, 10', 'Francesco', 'Giostra', 'Castel di Lama', 'Maurizio', 'Giostra', '3466318898', 'mg@gmail.com', NULL, 0, 'mgmservice@gmail.com', '1234', 'azienda');

-- --------------------------------------------------------

--
-- Struttura della tabella `canditatura`
--

DROP TABLE IF EXISTS `canditatura`;
CREATE TABLE IF NOT EXISTS `canditatura` (
  `idCandidatura` int(11) NOT NULL AUTO_INCREMENT,
  `idOfferta` int(11) NOT NULL,
  `idUtente` int(16) NOT NULL,
  `idTutore` int(11) NOT NULL,
  `stato` varchar(16) NOT NULL,
  `dataCandidatura` date NOT NULL,
  PRIMARY KEY (`idOfferta`,`idUtente`,`idTutore`),
  KEY `idCandidatura` (`idCandidatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `contratto`
--

DROP TABLE IF EXISTS `contratto`;
CREATE TABLE IF NOT EXISTS `contratto` (
  `idContratto` int(11) NOT NULL AUTO_INCREMENT,
  `idTutoreAziendale` int(11) NOT NULL,
  `idOfferta` int(11) NOT NULL,
  `idUtente` int(11) NOT NULL,
  `idTutoreUniversitario` int(11) NOT NULL,
  `dataAccettazione` date NOT NULL,
  PRIMARY KEY (`idTutoreAziendale`,`idOfferta`,`idUtente`,`idTutoreUniversitario`),
  KEY `fk_Contratto_Tutore_Aziendale1_idx` (`idTutoreAziendale`),
  KEY `fk_Contratto_Canditatura1_idx` (`idOfferta`,`idUtente`,`idTutoreUniversitario`),
  KEY `idContratto` (`idContratto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `offerta`
--

DROP TABLE IF EXISTS `offerta`;
CREATE TABLE IF NOT EXISTS `offerta` (
  `idOfferta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `luogo` varchar(30) NOT NULL,
  `orario` varchar(100) NOT NULL,
  `mesi` int(10) UNSIGNED NOT NULL,
  `ore` int(10) UNSIGNED NOT NULL,
  `obiettivi` varchar(300) NOT NULL,
  `modalità` varchar(200) NOT NULL,
  `rimborsi/facilitazioni` varchar(200) NOT NULL,
  `visibile` tinyint(4) NOT NULL,
  `idAzienda` int(11) UNSIGNED NOT NULL,
  `rimborsiFacilitazioni` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idOfferta`,`idAzienda`),
  KEY `fk_Offerta_Azienda_idx` (`idAzienda`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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

DROP TABLE IF EXISTS `tutore_aziendale`;
CREATE TABLE IF NOT EXISTS `tutore_aziendale` (
  `idTutore` int(11) NOT NULL AUTO_INCREMENT,
  `idAzienda` int(11) UNSIGNED NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`idAzienda`),
  KEY `idTutore` (`idTutore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tutore_universitario`
--

DROP TABLE IF EXISTS `tutore_universitario`;
CREATE TABLE IF NOT EXISTS `tutore_universitario` (
  `idTutore` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `numRichieste` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTutore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

DROP TABLE IF EXISTS `utente`;
CREATE TABLE IF NOT EXISTS `utente` (
  `idUtente` int(11) NOT NULL AUTO_INCREMENT,
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
  `tipo` varchar(16) NOT NULL,
  PRIMARY KEY (`codiceFiscale`),
  KEY `idUtente` (`idUtente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`idUtente`, `codiceFiscale`, `nome`, `cognome`, `dataNascita`, `luogoNascita`, `residenza`, `telefono`, `corsoLaurea`, `handicap`, `email`, `password`, `tipo`) VALUES
(1, 'GSTFNC95P02H769D', 'Francesco', 'Giostra', '1995-09-02', 'San Benedetto del Tronto', 'Via delle Querce 10', '3466318898', 'Informatica', 0, 'france.1995@hotmail.it', '1234', 'utente');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
