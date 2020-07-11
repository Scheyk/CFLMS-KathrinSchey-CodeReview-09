-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 11. Jul 2020 um 14:28
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_schey_kathrin_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_schey_kathrin_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_schey_kathrin_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `adress_costumer`
--

CREATE TABLE `adress_costumer` (
  `ID` int(11) NOT NULL,
  `fk_name` varchar(30) DEFAULT NULL,
  `street` varchar(30) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `adress_costumer`
--

INSERT INTO `adress_costumer` (`ID`, `fk_name`, `street`, `zip`) VALUES
(1, 'Bank Perfekt', 'Siegermundgasse 3', 1120),
(2, 'Tierbedarf Hans', 'Sesamstrasse 9', 1010),
(3, 'Büro Müller', 'Hansgasse 67', 1200),
(4, 'Tierbedarf Hans', 'Gurkgasse 4', 1150),
(5, 'Büro Müller', 'Siebensterngasse 45', 1010);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `adress_location`
--

CREATE TABLE `adress_location` (
  `ID` int(11) NOT NULL,
  `fk_name` varchar(30) DEFAULT NULL,
  `street` varchar(30) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `adress_location`
--

INSERT INTO `adress_location` (`ID`, `fk_name`, `street`, `zip`) VALUES
(1, 'Friseur Kurti', 'Alfons-Platz 5', 1140),
(2, 'Museum Hanna', 'Dorfplatz 7', 1150),
(3, 'Zum goldenen Hirsch', 'Bürger Gasse 9', 1010),
(4, 'Museum Hanna', 'Siegfried Strasse 78', 1200),
(5, 'Zum goldenen Hirsch', 'Maiereistrasse 55', 1160),
(6, 'Museum Hanna', 'Siegerstrasse 9', 1120);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `costumer_deliveries`
--

CREATE TABLE `costumer_deliveries` (
  `ID` int(11) NOT NULL,
  `fk_name` varchar(30) DEFAULT NULL,
  `fk_adress` int(11) DEFAULT NULL,
  `deposit` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `costumer_deliveries`
--

INSERT INTO `costumer_deliveries` (`ID`, `fk_name`, `fk_adress`, `deposit`) VALUES
(1, 'Büro Müller', 1, '2020-07-11'),
(2, 'Bank Perfekt', 2, '2020-07-10'),
(3, 'Tierbedarf Hans', 3, '2020-06-30');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deliverys`
--

CREATE TABLE `deliverys` (
  `ID` int(11) NOT NULL,
  `fk_costumer` int(11) DEFAULT NULL,
  `fk_location` int(11) DEFAULT NULL,
  `fk_employee` int(11) DEFAULT NULL,
  `fk_recipient` int(11) DEFAULT NULL,
  `fk_zip` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `deliverys`
--

INSERT INTO `deliverys` (`ID`, `fk_costumer`, `fk_location`, `fk_employee`, `fk_recipient`, `fk_zip`) VALUES
(1, NULL, 1, 1, 1, 1140),
(2, 1, NULL, 2, 2, 1120),
(3, 2, NULL, 3, 3, 1120),
(4, NULL, 2, 1, 4, 1150),
(5, 3, NULL, 1, 5, 1010),
(6, NULL, 3, 3, NULL, 1010);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `ID` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `D_o_B` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`ID`, `first_name`, `last_name`, `D_o_B`) VALUES
(1, 'Hans', 'Franz', '1985-10-01'),
(2, 'Susi', 'Kanns', '1980-12-10'),
(3, 'Hermine', 'Fröhlich', '1990-12-24');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location_deliveries`
--

CREATE TABLE `location_deliveries` (
  `ID` int(11) NOT NULL,
  `fk_name` varchar(30) DEFAULT NULL,
  `fk_adress` int(11) DEFAULT NULL,
  `pick_up` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `location_deliveries`
--

INSERT INTO `location_deliveries` (`ID`, `fk_name`, `fk_adress`, `pick_up`) VALUES
(1, 'Friseur Kurti', 1, '2020-07-11'),
(2, 'Museum Hanna', 2, '2020-06-12'),
(3, 'Zum goldenen Hirsch', 3, '2020-06-11');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `name_costumer`
--

CREATE TABLE `name_costumer` (
  `ID` int(11) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `name_costumer`
--

INSERT INTO `name_costumer` (`ID`, `name`, `first_name`, `last_name`) VALUES
(2, 'Bank Perfekt', 'Susi', 'Perfekt'),
(1, 'Büro Müller', 'Theodora', 'Müller'),
(3, 'Tierbedarf Hans', 'Franz', 'Hans');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `name_location`
--

CREATE TABLE `name_location` (
  `ID` int(11) DEFAULT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `name_location`
--

INSERT INTO `name_location` (`ID`, `name`) VALUES
(2, 'Friseur Kurti'),
(3, 'Museum Hanna'),
(1, 'Zum goldenen Hirsch');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipient`
--

CREATE TABLE `recipient` (
  `ID` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `received` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `recipient`
--

INSERT INTO `recipient` (`ID`, `first_name`, `last_name`, `received`) VALUES
(1, 'Susi', 'Franz', '2020-07-11'),
(2, 'Hansi', 'Hinterseer', '2020-07-10'),
(3, 'Herman', 'Princ', '2020-07-05'),
(4, 'Monika', 'Mara', '2020-06-30'),
(5, 'Caroline', 'Wein', '2020-06-20');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zip`
--

CREATE TABLE `zip` (
  `zip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `zip`
--

INSERT INTO `zip` (`zip`) VALUES
(1010),
(1020),
(1030),
(1040),
(1050),
(1060),
(1070),
(1080),
(1090),
(1100),
(1110),
(1120),
(1130),
(1140),
(1150),
(1160),
(1170),
(1180),
(1190),
(1200),
(1210),
(1220),
(1230);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `adress_costumer`
--
ALTER TABLE `adress_costumer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_name` (`fk_name`);

--
-- Indizes für die Tabelle `adress_location`
--
ALTER TABLE `adress_location`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_name` (`fk_name`);

--
-- Indizes für die Tabelle `costumer_deliveries`
--
ALTER TABLE `costumer_deliveries`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_name` (`fk_name`),
  ADD KEY `fk_adress` (`fk_adress`);

--
-- Indizes für die Tabelle `deliverys`
--
ALTER TABLE `deliverys`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_costumer` (`fk_costumer`),
  ADD KEY `fk_location` (`fk_location`),
  ADD KEY `fk_employee` (`fk_employee`),
  ADD KEY `fk_recipient` (`fk_recipient`),
  ADD KEY `fk_zip` (`fk_zip`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `location_deliveries`
--
ALTER TABLE `location_deliveries`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_name` (`fk_name`),
  ADD KEY `fk_adress` (`fk_adress`);

--
-- Indizes für die Tabelle `name_costumer`
--
ALTER TABLE `name_costumer`
  ADD PRIMARY KEY (`name`);

--
-- Indizes für die Tabelle `name_location`
--
ALTER TABLE `name_location`
  ADD PRIMARY KEY (`name`);

--
-- Indizes für die Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `zip`
--
ALTER TABLE `zip`
  ADD PRIMARY KEY (`zip`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `adress_costumer`
--
ALTER TABLE `adress_costumer`
  ADD CONSTRAINT `adress_costumer_ibfk_1` FOREIGN KEY (`fk_name`) REFERENCES `name_costumer` (`name`);

--
-- Constraints der Tabelle `adress_location`
--
ALTER TABLE `adress_location`
  ADD CONSTRAINT `adress_location_ibfk_1` FOREIGN KEY (`fk_name`) REFERENCES `name_location` (`name`);

--
-- Constraints der Tabelle `costumer_deliveries`
--
ALTER TABLE `costumer_deliveries`
  ADD CONSTRAINT `costumer_deliveries_ibfk_1` FOREIGN KEY (`fk_name`) REFERENCES `name_costumer` (`name`),
  ADD CONSTRAINT `costumer_deliveries_ibfk_2` FOREIGN KEY (`fk_adress`) REFERENCES `adress_costumer` (`ID`);

--
-- Constraints der Tabelle `deliverys`
--
ALTER TABLE `deliverys`
  ADD CONSTRAINT `deliverys_ibfk_1` FOREIGN KEY (`fk_costumer`) REFERENCES `costumer_deliveries` (`ID`),
  ADD CONSTRAINT `deliverys_ibfk_2` FOREIGN KEY (`fk_location`) REFERENCES `location_deliveries` (`ID`),
  ADD CONSTRAINT `deliverys_ibfk_3` FOREIGN KEY (`fk_employee`) REFERENCES `employee` (`ID`),
  ADD CONSTRAINT `deliverys_ibfk_4` FOREIGN KEY (`fk_recipient`) REFERENCES `recipient` (`ID`),
  ADD CONSTRAINT `deliverys_ibfk_5` FOREIGN KEY (`fk_zip`) REFERENCES `zip` (`zip`);

--
-- Constraints der Tabelle `location_deliveries`
--
ALTER TABLE `location_deliveries`
  ADD CONSTRAINT `location_deliveries_ibfk_1` FOREIGN KEY (`fk_name`) REFERENCES `name_location` (`name`),
  ADD CONSTRAINT `location_deliveries_ibfk_2` FOREIGN KEY (`fk_adress`) REFERENCES `adress_location` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
