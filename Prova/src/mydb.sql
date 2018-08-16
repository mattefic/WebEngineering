-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ago 16, 2018 alle 02:50
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
  `partitaIVACodiceFiscale` int(16) UNSIGNED NOT NULL,
  `ragioneSocialeNome` varchar(30) NOT NULL,
  `indirizzo` varchar(45) NOT NULL,
  `nomeLegale` varchar(20) NOT NULL,
  `cognomeLegale` varchar(30) NOT NULL,
  `foro` varchar(30) NOT NULL,
  `nomeRespTirocinio` varchar(20) NOT NULL,
  `cognomeRespTirocinio` varchar(30) NOT NULL,
  `telefonoRespTirocinio` int(16) UNSIGNED NOT NULL,
  `emailRespTirocinio` varchar(45) NOT NULL,
  `orario` varchar(100) DEFAULT NULL,
  `convenzionata` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `azienda`
--

INSERT INTO `azienda` (`partitaIVACodiceFiscale`, `ragioneSocialeNome`, `indirizzo`, `nomeLegale`, `cognomeLegale`, `foro`, `nomeRespTirocinio`, `cognomeRespTirocinio`, `telefonoRespTirocinio`, `emailRespTirocinio`, `orario`, `convenzionata`) VALUES
(10, 'Nome1', 'Indirizzo1', 'Legal1', 'Cognome1', 'Rieti', 'nome1', 'nome2', 10101010, 'email@email', '10000-1000', b'1111111111111111111111111111111'),
(1234567890, 'Giostra S.R.L', 'Via Roma 202', 'Marco', 'Natale', 'Ascoli Piceno', 'Valerio', 'Rossi', 346598753, 'vRossi@gmail.com', NULL, b'1111111111111111111111111111111'),
(1234567899, 'blabla', 'Via bleble 10', 'tizio', 'caio', 'Roma', 'sempronio', 'sesterzio', 3466958761, 'cesare@gmail.com', NULL, b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Struttura della tabella `canditatura`
--

CREATE TABLE `canditatura` (
  `Offerta_idOfferta` int(11) NOT NULL,
  `Offerta_Azienda_partitaIVA/CodiceFiscale` int(10) UNSIGNED NOT NULL,
  `Utente_codiceFiscale` char(16) NOT NULL,
  `Tutore_Universitario_idTutore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `contratto`
--

CREATE TABLE `contratto` (
  `Tutore_Aziendale_Azienda_partitaIVA/CodiceFiscale` int(11) NOT NULL,
  `Canditatura_Offerta_idOfferta` int(11) NOT NULL,
  `Canditatura_Offerta_Azienda_partitaIVA/CodiceFiscale` int(10) UNSIGNED NOT NULL,
  `Canditatura_Utente_codiceFiscale` char(16) NOT NULL,
  `Canditatura_Tutore_Universitario_idTutore` int(11) NOT NULL
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
  `Azienda_partitaIVA/CodiceFiscale` int(10) UNSIGNED NOT NULL,
  `rimborsiFacilitazioni` varchar(255) DEFAULT NULL,
  `Azienda_partitaIvaCodiceFiscale` varchar(255) DEFAULT NULL,
  `aziendaPartitaIvaCodiceFiscale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `offerta`
--

INSERT INTO `offerta` (`idOfferta`, `luogo`, `orario`, `mesi`, `ore`, `obiettivi`, `modalità`, `rimborsi/facilitazioni`, `visibile`, `Azienda_partitaIVA/CodiceFiscale`, `rimborsiFacilitazioni`, `Azienda_partitaIvaCodiceFiscale`, `aziendaPartitaIvaCodiceFiscale`) VALUES
(1, 'rieti', '10-10', 5, 60, 'EHEHEHEHEH', 'BElle', 'NOOO', 1, 10, 'NONONONONO', '10', NULL),
(2, 'rieti', '10-10', 5, 60, 'EHEHEHEHEH', 'BElle', 'NOOO', 1, 10, 'NONONONONO', '10', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `tutore_aziendale`
--

CREATE TABLE `tutore_aziendale` (
  `Azienda_partitaIVA/CodiceFiscale` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `telefono` int(10) UNSIGNED NOT NULL,
  `id_tutore_aziendale` int(11) NOT NULL,
  `azienda_partitaIvaCodiceFiscale` varchar(255) DEFAULT NULL
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
  `codiceFiscale` char(16) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `dataNascita` date NOT NULL,
  `luogoNascita` varchar(30) NOT NULL,
  `residenza` varchar(30) NOT NULL,
  `telefono` int(16) NOT NULL,
  `corsoLaurea` varchar(45) NOT NULL,
  `handicap` tinyint(4) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`codiceFiscale`, `nome`, `cognome`, `dataNascita`, `luogoNascita`, `residenza`, `telefono`, `corsoLaurea`, `handicap`, `email`) VALUES
('GSTFNC95P02H769D', 'Francesco', 'Giostra', '1995-09-02', 'San Benedetto del Tronto', 'Via delle Querce 10', 346631889, 'Informatica', 0, 'france.1995@hotmail.it');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `azienda`
--
ALTER TABLE `azienda`
  ADD PRIMARY KEY (`partitaIVACodiceFiscale`);

--
-- Indici per le tabelle `canditatura`
--
ALTER TABLE `canditatura`
  ADD PRIMARY KEY (`Offerta_idOfferta`,`Offerta_Azienda_partitaIVA/CodiceFiscale`,`Utente_codiceFiscale`,`Tutore_Universitario_idTutore`),
  ADD KEY `fk_Canditatura_Utente1_idx` (`Utente_codiceFiscale`),
  ADD KEY `fk_Canditatura_Tutore_Universitario1_idx` (`Tutore_Universitario_idTutore`);

--
-- Indici per le tabelle `contratto`
--
ALTER TABLE `contratto`
  ADD PRIMARY KEY (`Tutore_Aziendale_Azienda_partitaIVA/CodiceFiscale`,`Canditatura_Offerta_idOfferta`,`Canditatura_Offerta_Azienda_partitaIVA/CodiceFiscale`,`Canditatura_Utente_codiceFiscale`,`Canditatura_Tutore_Universitario_idTutore`),
  ADD KEY `fk_Contratto_Tutore_Aziendale1_idx` (`Tutore_Aziendale_Azienda_partitaIVA/CodiceFiscale`),
  ADD KEY `fk_Contratto_Canditatura1_idx` (`Canditatura_Offerta_idOfferta`,`Canditatura_Offerta_Azienda_partitaIVA/CodiceFiscale`,`Canditatura_Utente_codiceFiscale`,`Canditatura_Tutore_Universitario_idTutore`);

--
-- Indici per le tabelle `offerta`
--
ALTER TABLE `offerta`
  ADD PRIMARY KEY (`idOfferta`,`Azienda_partitaIVA/CodiceFiscale`),
  ADD KEY `fk_Offerta_Azienda_idx` (`Azienda_partitaIVA/CodiceFiscale`);

--
-- Indici per le tabelle `tutore_aziendale`
--
ALTER TABLE `tutore_aziendale`
  ADD PRIMARY KEY (`Azienda_partitaIVA/CodiceFiscale`);

--
-- Indici per le tabelle `tutore_universitario`
--
ALTER TABLE `tutore_universitario`
  ADD PRIMARY KEY (`idTutore`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`codiceFiscale`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `offerta`
--
ALTER TABLE `offerta`
  MODIFY `idOfferta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
