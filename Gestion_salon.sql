-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 08, 2025 at 01:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Gestion_salon`
--

-- --------------------------------------------------------

--
-- Table structure for table `activite`
--

CREATE TABLE `activite` (
  `idActivite` int(11) NOT NULL,
  `idCoiffeuse` int(11) NOT NULL,
  `idService` int(11) NOT NULL,
  `idrdv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `idAdmin` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `idPersonne` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `choix`
--

CREATE TABLE `choix` (
  `idChoix` int(11) NOT NULL,
  `optionservice` varchar(50) NOT NULL,
  `idClient` int(11) NOT NULL,
  `idService` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Client`
--

CREATE TABLE `Client` (
  `idClient` int(11) NOT NULL,
  `mdp` varchar(10) NOT NULL,
  `idPersonne` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coiffeuse`
--

CREATE TABLE `coiffeuse` (
  `idCoif` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `userneme` varchar(20) NOT NULL,
  `idPersonne` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mode`
--

CREATE TABLE `mode` (
  `idMode` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `descripton` varchar(100) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `prix` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `idpayment` int(11) NOT NULL,
  `mode_payment` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personne`
--

CREATE TABLE `personne` (
  `idPersonne` bigint(20) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `num` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Prospect`
--

CREATE TABLE `Prospect` (
  `idProspect` int(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  `idPersonne` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rdv`
--

CREATE TABLE `rdv` (
  `idrdv` int(11) NOT NULL,
  `heure` timestamp NOT NULL DEFAULT current_timestamp(),
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `dure` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  `idPayment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `idservice` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `prix` int(7) NOT NULL,
  `dure` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stat`
--

CREATE TABLE `stat` (
  `idStat` int(11) NOT NULL,
  `idrdv` int(11) NOT NULL,
  `idProspect` int(11) NOT NULL,
  `idCoiffeuse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`idActivite`),
  ADD KEY `fk_coiffeuse_activite` (`idCoiffeuse`),
  ADD KEY `fk_service_activite` (`idService`),
  ADD KEY `fk_rdv_activite` (`idrdv`);

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`idAdmin`),
  ADD KEY `idPersonne` (`idPersonne`);

--
-- Indexes for table `choix`
--
ALTER TABLE `choix`
  ADD PRIMARY KEY (`idChoix`),
  ADD KEY `idService` (`idService`),
  ADD KEY `fk_clent_choix` (`idClient`);

--
-- Indexes for table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`idClient`),
  ADD KEY `idPersonne` (`idPersonne`);

--
-- Indexes for table `coiffeuse`
--
ALTER TABLE `coiffeuse`
  ADD PRIMARY KEY (`idCoif`),
  ADD KEY `idPersonne` (`idPersonne`);

--
-- Indexes for table `mode`
--
ALTER TABLE `mode`
  ADD PRIMARY KEY (`idMode`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`idpayment`);

--
-- Indexes for table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`idPersonne`);

--
-- Indexes for table `Prospect`
--
ALTER TABLE `Prospect`
  ADD PRIMARY KEY (`idProspect`),
  ADD KEY `idPersonne` (`idPersonne`);

--
-- Indexes for table `rdv`
--
ALTER TABLE `rdv`
  ADD PRIMARY KEY (`idrdv`),
  ADD KEY `fk_client_rdv` (`idClient`),
  ADD KEY `fk_paymeny_rdv` (`idPayment`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`idservice`);

--
-- Indexes for table `stat`
--
ALTER TABLE `stat`
  ADD PRIMARY KEY (`idStat`),
  ADD KEY `fk_rdv_stat` (`idrdv`),
  ADD KEY `fk_coiffeuse_stat` (`idCoiffeuse`),
  ADD KEY `fk_prospect_stat` (`idProspect`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activite`
--
ALTER TABLE `activite`
  MODIFY `idActivite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Admin`
--
ALTER TABLE `Admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `choix`
--
ALTER TABLE `choix`
  MODIFY `idChoix` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Client`
--
ALTER TABLE `Client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coiffeuse`
--
ALTER TABLE `coiffeuse`
  MODIFY `idCoif` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mode`
--
ALTER TABLE `mode`
  MODIFY `idMode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `idpayment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personne`
--
ALTER TABLE `personne`
  MODIFY `idPersonne` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Prospect`
--
ALTER TABLE `Prospect`
  MODIFY `idProspect` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rdv`
--
ALTER TABLE `rdv`
  MODIFY `idrdv` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `idservice` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat`
--
ALTER TABLE `stat`
  MODIFY `idStat` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activite`
--
ALTER TABLE `activite`
  ADD CONSTRAINT `fk_coiffeuse_activite` FOREIGN KEY (`idCoiffeuse`) REFERENCES `coiffeuse` (`idCoif`),
  ADD CONSTRAINT `fk_rdv_activite` FOREIGN KEY (`idrdv`) REFERENCES `rdv` (`idrdv`),
  ADD CONSTRAINT `fk_service_activite` FOREIGN KEY (`idService`) REFERENCES `service` (`idservice`);

--
-- Constraints for table `Admin`
--
ALTER TABLE `Admin`
  ADD CONSTRAINT `fk_admin_personne` FOREIGN KEY (`idPersonne`) REFERENCES `personne` (`idPersonne`);

--
-- Constraints for table `choix`
--
ALTER TABLE `choix`
  ADD CONSTRAINT `fk_clent_choix` FOREIGN KEY (`idClient`) REFERENCES `Client` (`idClient`),
  ADD CONSTRAINT `fk_service_choix` FOREIGN KEY (`idService`) REFERENCES `service` (`idservice`);

--
-- Constraints for table `Client`
--
ALTER TABLE `Client`
  ADD CONSTRAINT `fk_client_personne` FOREIGN KEY (`idPersonne`) REFERENCES `personne` (`idPersonne`);

--
-- Constraints for table `coiffeuse`
--
ALTER TABLE `coiffeuse`
  ADD CONSTRAINT `fk_coiffeuse_personne` FOREIGN KEY (`idPersonne`) REFERENCES `personne` (`idPersonne`);

--
-- Constraints for table `Prospect`
--
ALTER TABLE `Prospect`
  ADD CONSTRAINT `fk_prospect_personne` FOREIGN KEY (`idPersonne`) REFERENCES `personne` (`idPersonne`);

--
-- Constraints for table `rdv`
--
ALTER TABLE `rdv`
  ADD CONSTRAINT `fk_client_rdv` FOREIGN KEY (`idClient`) REFERENCES `Client` (`idClient`),
  ADD CONSTRAINT `fk_paymeny_rdv` FOREIGN KEY (`idPayment`) REFERENCES `payment` (`idpayment`);

--
-- Constraints for table `stat`
--
ALTER TABLE `stat`
  ADD CONSTRAINT `fk_coiffeuse_stat` FOREIGN KEY (`idCoiffeuse`) REFERENCES `coiffeuse` (`idCoif`),
  ADD CONSTRAINT `fk_prospect_stat` FOREIGN KEY (`idProspect`) REFERENCES `Prospect` (`idProspect`),
  ADD CONSTRAINT `fk_rdv_stat` FOREIGN KEY (`idrdv`) REFERENCES `rdv` (`idrdv`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
