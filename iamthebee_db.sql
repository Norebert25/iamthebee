-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2019 at 01:50 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `film`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Username` varchar(32) COLLATE latin2_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ertekel`
--

CREATE TABLE `ertekel` (
  `Felhasznalo` varchar(32) COLLATE latin2_hungarian_ci NOT NULL,
  `Film_id` int(8) NOT NULL,
  `Ertekeles` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `Username` varchar(32) COLLATE latin2_hungarian_ci NOT NULL,
  `Jelszo` varchar(32) COLLATE latin2_hungarian_ci NOT NULL,
  `Email` varchar(64) COLLATE latin2_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

--
-- Dumping data for table `felhasznalo`
--

INSERT INTO `felhasznalo` (`Username`, `Jelszo`, `Email`) VALUES
('asd', 'asd', 'asd@asd.com'),
('asdf', 'asd', 'asd@asd.com'),
('asdff', 'asd', 'asd@asd.com'),
('san1111', 'asd', 'barathsandorgergo@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `Id` int(8) NOT NULL,
  `Ertekelesek_Szama` int(8) NOT NULL,
  `Korhatar` varchar(8) COLLATE latin2_hungarian_ci NOT NULL,
  `Leiras` varchar(255) COLLATE latin2_hungarian_ci NOT NULL,
  `Megjelenes_eve` int(4) NOT NULL,
  `Cim` varchar(32) COLLATE latin2_hungarian_ci NOT NULL,
  `Bevetel` int(9) NOT NULL,
  `Forgalmaz` varchar(32) COLLATE latin2_hungarian_ci NOT NULL,
  `Boritokep` varchar(255) COLLATE latin2_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`Id`, `Ertekelesek_Szama`, `Korhatar`, `Leiras`, `Megjelenes_eve`, `Cim`, `Bevetel`, `Forgalmaz`, `Boritokep`) VALUES
(1, 0, '18', 'Jó film', 2019, 'Joker', 832, 'Warner Bros. Pictures', 'https://images-na.ssl-images-amazon.com/images/I/31J8gN3sRPL.jpg'),
(2, 0, '12', 'Hosszú és jó', 2019, 'Bosszúállók - Végjáték', 3000, 'Disney', 'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `filmstudio`
--

CREATE TABLE `filmstudio` (
  `Nev` varchar(32) COLLATE latin2_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

--
-- Dumping data for table `filmstudio`
--

INSERT INTO `filmstudio` (`Nev`) VALUES
('Disney'),
('Warner Bros. Pictures');

-- --------------------------------------------------------

--
-- Table structure for table `hozzaszolas`
--

CREATE TABLE `hozzaszolas` (
  `Spoiler` bit(1) DEFAULT b'0',
  `HID` int(8) NOT NULL,
  `Szoveg` varchar(255) COLLATE latin2_hungarian_ci NOT NULL,
  `Film_id` int(8) NOT NULL,
  `Felhasznalo` varchar(32) COLLATE latin2_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

--
-- Dumping data for table `hozzaszolas`
--

INSERT INTO `hozzaszolas` (`Spoiler`, `HID`, `Szoveg`, `Film_id`, `Felhasznalo`) VALUES
(b'0', 1, 'asd', 1, 'asdf'),
(b'0', 2, 'asdfg', 1, 'asdf'),
(b'1', 3, 'kek', 1, 'asdf'),
(b'1', 4, 'noice', 1, 'asdf'),
(b'0', 5, 'test', 1, 'asdf'),
(b'0', 6, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 'asdf'),
(b'0', 7, 'asd', 1, 'asdf'),
(b'0', 8, 'asdf kommentje', 2, 'asdf'),
(b'1', 9, 'asdf spoilere', 2, 'asdf'),
(b'0', 10, 'harmadik', 2, 'asdf'),
(b'0', 11, 'negyedik', 2, 'asdf'),
(b'0', 12, 'teszt', 1, 'asdf');

-- --------------------------------------------------------

--
-- Table structure for table `jelent`
--

CREATE TABLE `jelent` (
  `Jelento` varchar(32) COLLATE latin2_hungarian_ci NOT NULL,
  `Kommentelo` varchar(32) COLLATE latin2_hungarian_ci NOT NULL,
  `Film_id` int(8) NOT NULL,
  `HID` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kozremukodik`
--

CREATE TABLE `kozremukodik` (
  `Stabtag_id` int(8) NOT NULL,
  `Film_id` int(8) NOT NULL,
  `Szerepkor` varchar(32) COLLATE latin2_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `moderator`
--

CREATE TABLE `moderator` (
  `Username` varchar(32) COLLATE latin2_hungarian_ci NOT NULL,
  `Kijelolte` varchar(32) COLLATE latin2_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mufaj`
--

CREATE TABLE `mufaj` (
  `Mufaj` varchar(32) COLLATE latin2_hungarian_ci NOT NULL,
  `Film_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stabtag`
--

CREATE TABLE `stabtag` (
  `Id` int(8) NOT NULL,
  `Nev` varchar(32) COLLATE latin2_hungarian_ci NOT NULL,
  `Szuletett` date NOT NULL,
  `Bio` varchar(255) COLLATE latin2_hungarian_ci NOT NULL,
  `Nemzetiseg` varchar(32) COLLATE latin2_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `torol`
--

CREATE TABLE `torol` (
  `Moderator` varchar(32) COLLATE latin2_hungarian_ci NOT NULL,
  `HID` int(8) NOT NULL,
  `Film_id` int(8) NOT NULL,
  `Felhasznalo` varchar(32) COLLATE latin2_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD KEY `Username` (`Username`);

--
-- Indexes for table `ertekel`
--
ALTER TABLE `ertekel`
  ADD KEY `Felhasznalo` (`Felhasznalo`),
  ADD KEY `Film_id` (`Film_id`);

--
-- Indexes for table `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Forgalmaz` (`Forgalmaz`);

--
-- Indexes for table `filmstudio`
--
ALTER TABLE `filmstudio`
  ADD PRIMARY KEY (`Nev`);

--
-- Indexes for table `hozzaszolas`
--
ALTER TABLE `hozzaszolas`
  ADD UNIQUE KEY `HID` (`HID`),
  ADD KEY `Felhasznalo` (`Felhasznalo`),
  ADD KEY `Film_id` (`Film_id`);

--
-- Indexes for table `jelent`
--
ALTER TABLE `jelent`
  ADD KEY `Jelento` (`Jelento`),
  ADD KEY `Kommentelo` (`Kommentelo`),
  ADD KEY `Film_id` (`Film_id`),
  ADD KEY `HID` (`HID`);

--
-- Indexes for table `kozremukodik`
--
ALTER TABLE `kozremukodik`
  ADD KEY `Stabtag_id` (`Stabtag_id`),
  ADD KEY `Film_id` (`Film_id`);

--
-- Indexes for table `moderator`
--
ALTER TABLE `moderator`
  ADD KEY `Username` (`Username`),
  ADD KEY `Kijelolte` (`Kijelolte`);

--
-- Indexes for table `mufaj`
--
ALTER TABLE `mufaj`
  ADD KEY `Film_id` (`Film_id`);

--
-- Indexes for table `stabtag`
--
ALTER TABLE `stabtag`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `torol`
--
ALTER TABLE `torol`
  ADD KEY `Moderator` (`Moderator`),
  ADD KEY `HID` (`HID`),
  ADD KEY `Film_id` (`Film_id`),
  ADD KEY `Felhasznalo` (`Felhasznalo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `Id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stabtag`
--
ALTER TABLE `stabtag`
  MODIFY `Id` int(8) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `felhasznalo` (`Username`);

--
-- Constraints for table `ertekel`
--
ALTER TABLE `ertekel`
  ADD CONSTRAINT `ertekel_ibfk_1` FOREIGN KEY (`Felhasznalo`) REFERENCES `felhasznalo` (`Username`),
  ADD CONSTRAINT `ertekel_ibfk_2` FOREIGN KEY (`Film_id`) REFERENCES `film` (`Id`);

--
-- Constraints for table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`Forgalmaz`) REFERENCES `filmstudio` (`Nev`);

--
-- Constraints for table `hozzaszolas`
--
ALTER TABLE `hozzaszolas`
  ADD CONSTRAINT `hozzaszolas_ibfk_1` FOREIGN KEY (`Felhasznalo`) REFERENCES `felhasznalo` (`Username`),
  ADD CONSTRAINT `hozzaszolas_ibfk_2` FOREIGN KEY (`Film_id`) REFERENCES `film` (`Id`);

--
-- Constraints for table `jelent`
--
ALTER TABLE `jelent`
  ADD CONSTRAINT `jelent_ibfk_1` FOREIGN KEY (`Jelento`) REFERENCES `felhasznalo` (`Username`),
  ADD CONSTRAINT `jelent_ibfk_2` FOREIGN KEY (`Kommentelo`) REFERENCES `felhasznalo` (`Username`),
  ADD CONSTRAINT `jelent_ibfk_3` FOREIGN KEY (`Film_id`) REFERENCES `film` (`Id`),
  ADD CONSTRAINT `jelent_ibfk_4` FOREIGN KEY (`HID`) REFERENCES `hozzaszolas` (`HID`);

--
-- Constraints for table `kozremukodik`
--
ALTER TABLE `kozremukodik`
  ADD CONSTRAINT `kozremukodik_ibfk_1` FOREIGN KEY (`Stabtag_id`) REFERENCES `stabtag` (`Id`),
  ADD CONSTRAINT `kozremukodik_ibfk_2` FOREIGN KEY (`Film_id`) REFERENCES `film` (`Id`);

--
-- Constraints for table `moderator`
--
ALTER TABLE `moderator`
  ADD CONSTRAINT `moderator_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `felhasznalo` (`Username`),
  ADD CONSTRAINT `moderator_ibfk_2` FOREIGN KEY (`Kijelolte`) REFERENCES `admin` (`Username`);

--
-- Constraints for table `mufaj`
--
ALTER TABLE `mufaj`
  ADD CONSTRAINT `mufaj_ibfk_1` FOREIGN KEY (`Film_id`) REFERENCES `film` (`Id`);

--
-- Constraints for table `torol`
--
ALTER TABLE `torol`
  ADD CONSTRAINT `torol_ibfk_1` FOREIGN KEY (`Moderator`) REFERENCES `moderator` (`Username`),
  ADD CONSTRAINT `torol_ibfk_2` FOREIGN KEY (`HID`) REFERENCES `hozzaszolas` (`HID`),
  ADD CONSTRAINT `torol_ibfk_3` FOREIGN KEY (`Film_id`) REFERENCES `film` (`Id`),
  ADD CONSTRAINT `torol_ibfk_4` FOREIGN KEY (`Felhasznalo`) REFERENCES `felhasznalo` (`Username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
