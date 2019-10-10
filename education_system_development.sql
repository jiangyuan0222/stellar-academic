-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Sep 20, 2019 at 08:27 AM
-- Server version: 5.7.26-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `education_system_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `type` enum('credit','nonCredit') DEFAULT 'credit',
  `text_book` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `status` enum('active','banned') DEFAULT 'active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `category`, `type`, `text_book`, `desc`, `status`, `created_at`, `updated_at`) VALUES
('C156468700526909UG', 'ESL (ENGLISH 2ND LANGUAGE)', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052690A0J', 'MUSIC - BAND', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052690I0W', 'ANATOMY & PHYSIOLOGY W/LAB', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052690TX4', 'ANATOMY & PHYSIOLOGY', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052690VK1', 'HEBREW', 'BIBLE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052690ZZW', 'LIFE SKILLS', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052691FZ1', 'CREATIVE WRITING', 'ENGLISH – OTHER', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052691QE9', 'EQUINE SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052691TS1', 'U.S. HISTORY', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052691ZJ3', 'WORK EXPERIENCE', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269279N', 'PE-FENCING', 'PHYSICAL EDUCATION', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052692NW1', 'SPEECH', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052692RJ5', 'CONSUMER MATH II', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C156468700526930J4', 'PE-BASEBALL', 'PHYSICAL EDUCATION', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C156468700526935JL', 'ACT PREPARATION', 'COLLEGE PREP', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052693816', 'BUSINESS COMMUNICATIONS', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C156468700526939XO', 'U.S. HISTORY II', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052693A5O', 'INTEGRATED MATHEMATICS III', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052693DEJ', 'COMPUTER GRAPHICS', 'COMPUTER', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052693IHF', 'CHEMISTRY', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052693MUM', 'GEOMETRY', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052693OWN', 'APPLIED MATH', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052693V65', 'MUSIC HISTORY', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C156468700526944I9', 'EARTH SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052694FYS', 'BIBLE-OLD TEST. SURVEY', 'BIBLE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052694OQX', 'LIFE SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C156468700526959T2', 'BIOLOGY II', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052695CMU', 'MATH TECH II', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052695DIC', 'FOUNDATIONS I', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052695F3P', 'ACCOUNTING II', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052695M3K', 'HOME ECONOMICS', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052695UOP', 'SPANISH II', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C156468700526960BN', 'ACCOUNTING III', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C156468700526961K8', 'LOGIC', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C156468700526968N1', 'APPLIED MATH II', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C156468700526969Q4', 'JOURNALISM', 'ENGLISH – OTHER', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052696NT2', 'MEDIEVAL HISTORY', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052696WD0', 'FRENCH', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269706S', 'FOOD SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052697CXV', 'LATIN II', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052697DTG', 'BIOLOGY W/LAB', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052697EO0', 'ITALIAN', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052697FPD', 'ETYMOLOGY', 'ENGLISH – OTHER', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052697IJU', 'BIBLE IV', 'BIBLE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052697IS6', 'COMPETENCY MATHEMATICS', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052697S4J', 'MACROECONOMICS', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052697UYZ', 'ACCOUNTING', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052698AJL', 'GRAPHIC DESIGN', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052698C0Q', 'ENGLISH 09', 'ENGLISH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052698EW2', 'SAT PREPARATION', 'COLLEGE PREP', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052698GP6', 'PHILOSOPHY', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052698IYY', 'LATIN IV', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052698NDE', 'CHEMISTRY II', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052698PH1', 'COMPOSITION II', 'ENGLISH – OTHER', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052698RCP', 'LITERARY ANALYSIS & INTERPRETATION', 'ENGLISH – OTHER', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052699SN9', 'GERMAN', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269A0JG', 'PHYSICS W/LAB', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269A3NF', 'FOUNDATIONS II', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269A4U7', 'WORLD GEOGRAPHY', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269ALDU', 'CONTEMPORARY ISSUES', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269AN94', 'RELIGION II', 'BIBLE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269B5ZM', 'ENVIRONMENTAL SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269B910', 'ITALIAN II', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269BPFH', 'PHYSICS', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269BU52', 'FORENSIC SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269BWKT', 'LATIN', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269C421', 'CHINESE', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269C4GF', 'INTEGRATED MATHEMATICS II', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269C65V', 'CARPENTRY', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269C6DE', 'ECOLOGY', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269CAVL', 'WESTERN CIVILIZATIONS II', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269CBR6', 'RELIGION I', 'BIBLE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269CKQ6', 'AMERICAN HISTORY', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269CM45', 'CIVIL AIR PATROL', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269CP5O', 'DRAMA', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269CT80', 'AGRICULTURAL SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269CXQD', 'GREEK', 'BIBLE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269E198', 'FILM MAKING', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269E1TF', 'ART - GRAPHIC', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269E8QW', 'WELLNESS', 'HEALTH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269EIC1', 'INTRODUCTION TO WORLD RELIGIONS', 'BIBLE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269EIJB', 'SPANISH III', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269EMFD', 'APOLOGETICS', 'BIBLE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269ERPI', 'MUSIC', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269EXI8', 'CHEMISTRY W/LAB', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269F64S', 'MUSIC THEORY', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269FDP3', 'PE-FOOTBALL', 'PHYSICAL EDUCATION', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269FIDS', 'COMPUTER PROGRAMMING', 'COMPUTER', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269FPL4', 'PERSONAL FINANCE', 'PERSONAL FINANCE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269FVR5', 'HEALTH', 'HEALTH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269G9K4', 'BIBLE HISTORY', 'BIBLE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269GCVB', 'SOCIOLOGY', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269GEKX', 'BIBLE', 'BIBLE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269GJ88', 'CHRISTIAN WORLDVIEW', 'BIBLE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269GSQX', 'CHILD DEVELOPMENT', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269GWHS', 'ASTRONOMY', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269H38V', 'PRE-CALCULUS', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269H6VE', 'ECOLOGY W/LAB', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269HGMY', 'COMPUTER TECHNOLOGY', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269HIN6', 'AUTO MECHANICS', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269I396', 'PE-SOCCER', 'PHYSICAL EDUCATION', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269IJQB', 'DRAFTING', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269IN9B', 'FRENCH II', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269J2S0', 'WESTERN CIVILIZATIONS I', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269J6J3', 'GEOLOGY W/LAB', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269JDOM', 'COMPUTER LITERACY', 'COMPUTER', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269JLL7', 'BRITISH LITERATURE', 'ENGLISH – OTHER', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269JNC3', 'ECONOMICS', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269JQJE', 'AMERICAN LITERATURE', 'ENGLISH – OTHER', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269JTFZ', 'BIOLOGY', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269KG6I', 'PHYSICAL SCIENCE W/LAB', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269KGTA', 'AMERICAN SIGN LANGUAGE II', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269KHY6', 'SPANISH', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269KKCS', 'DRIVERS EDUCATION', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269KMCS', 'ALGEBRA I', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269KPWQ', 'BUSINESS MANAGEMENT', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269KQBU', 'ENGLISH 12', 'ENGLISH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269KX3Z', 'ART', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269L36T', 'EUROPEAN HISTORY', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269L59F', 'CIVICS', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269LGFO', 'COMMUNITY SERVICE', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269M77Z', 'PRE-ALGEBRA', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269ME6J', 'NUTRITION SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269MGSI', 'BUSINESS MATH', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269N1OZ', 'NUTRITION', 'HEALTH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269N48T', 'ART APPRECIATION', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269N5BJ', 'TRIGONOMETRY', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269NE54', 'ADVANCED ALGEBRA & TRIGONOMETRY', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269NIIH', 'MARINE BIOLOGY', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269NLLU', 'HOME ECONOMICS - SEWING', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269NMY5', 'WORLD HISTORY', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269NP9Q', 'COMPUTER TECHNOLOGY', 'COMPUTER', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269NR0X', 'LATIN III', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269NVTY', 'COMPOSITION I', 'ENGLISH – OTHER', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269NX6G', 'CANCE - BALLET', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269NYBG', 'DANCE', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269O133', 'THEOLOGY', 'BIBLE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269O265', 'ENGLISH 10', 'ENGLISH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269OIMP', 'U.S. GOVERNMENT', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269P64Z', 'GEOLOGY', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269PDHR', 'COLLEGE PLANNING', 'COLLEGE PREP', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269Q038', 'PE-BASKETBALL', 'PHYSICAL EDUCATION', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269Q22S', 'AMERICAN SIGN LANGUAGE', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269Q7WA', 'MUSIC - GUITAR', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269QABB', 'CALCULUS', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269QBSU', 'CHINESE II', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269QF6C', 'PE-HOCKEY', 'PHYSICAL EDUCATION', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269QJJY', 'PE-GOLF', 'PHYSICAL EDUCATION', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269QME7', 'INTEGRATED MATHEMATICS', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269R2US', 'PE-SWIMMING', 'PHYSICAL EDUCATION', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269RN6W', 'MUSIC - PIANO', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269RO4R', 'MUSIC - PERFORMANCE', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269RU45', 'PE-TENNIS', 'PHYSICAL EDUCATION', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269T0FH', 'BIBLE-NEW TEST. SURVEY', 'BIBLE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269T13Y', 'COLLEGE ALGEBRA', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269TEEU', 'MUSIC APPRECIATION', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269TEH3', 'LIFE OF CHRIST', 'BIBLE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269TXXR', 'PE-WEIGHTLIFTING', 'PHYSICAL EDUCATION', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269TZ0C', 'PHYSICS', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269U4QL', 'BIBLE III', 'BIBLE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269U4SN', 'ALGEBRA II', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269U6L8', 'ART - DRAWING', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269UBYB', 'PHYSICAL SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269UCD5', 'MUSIC - CHOIR', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269UMB3', 'AFRICAN AMERICAN HISTORY', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269UUJV', 'GEOGRAPHY', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269V0S0', 'WOODWORKING', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269V10I', 'CONSUMER MATH', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269V1M1', 'HOME ECONOMICS - COOKING', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269V4V3', 'ART - PAINTING', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269V9OY', 'ANCIENT HISTORY', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269VA9I', 'ADVANCED BIOLOGY', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269W1SR', 'MATH TECH I', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269W484', 'FINITE MATH', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269W6YR', 'PHYSICAL EDUCATION', 'PHYSICAL EDUCATION', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269WEQC', 'FAMILY & CONSUMER SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269WNRC', 'ART - TEXTILE', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269WYO9', 'HORTICULTURE', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269X08F', 'ANIMAL SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269X5JX', 'MICROECONOMICS', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269XAZK', 'STATISTICS', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269XERH', 'INTRODUCTION TO COMPUTERS', 'COMPUTER', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269XHF7', 'DISCRETE MATHEMATICS', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269XN5V', 'TECHNICAL WRITING', 'ENGLISH – OTHER', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269XTPP', 'PSYCHOLOGY', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269XUKW', 'FRENCH III', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269XWL6', 'ADVANCED COMMUNICATIONS', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269XYP3', 'ADVANCED MATH', 'MATH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269XZQJ', 'MUSIC - PERCUSSION', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269Y4RQ', 'MODERN HISTORY', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269Y56U', 'ENGLISH 11', 'ENGLISH', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269ZA3L', 'BIBLE II', 'BIBLE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269ZE47', 'GERMAN II', 'FOREIGN LANGUAGE', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269ZGDZ', 'AFRICAN AMERICAN LITERATURE', 'ENGLISH – OTHER', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269ZIIB', 'KEYBOARDING/TYPING', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269ZKFI', 'ART HISTORY', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269ZMJV', 'SPEED READING', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269ZOQV', 'POLITICAL SCIENCE', 'SOCIAL STUDIES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005269ZQ5Y', 'STUDY SKILLS', 'ELECTIVES', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052704YF7', 'THEATRE ARTS', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052707QQI', 'PHOTOGRAPHY', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C15646870052709NTT', 'VISUAL ARTS', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005270AYIH', 'VIDEOGRAPHY', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005270CNVH', 'MUSIC - VIOLIN', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005270D1L5', 'PERFORMING ARTS', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005270I89B', 'VIDEO EDITING', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005270LXB5', 'VOCAL MUSIC', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C1564687005270V41F', 'MUSIC - VOICE', 'VISUAL/PERFORMING ARTS', 'credit', 'desc', 'desc', 'active', '2019-08-01 19:16:45', '2019-08-01 19:16:45'),
('C156510775342103W5', 'GERMAN', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534210D1K', 'COMPUTER LITERACY', 'COMPUTER', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534210DS2', 'ETYMOLOGY', 'ENGLISH – OTHER', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534211E2J', 'ITALIAN', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534212KY4', 'BUSINESS MANAGEMENT', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534212MAB', 'BIBLE-OLD TEST. SURVEY', 'BIBLE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421311T', 'SPEECH', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C156510775342133OL', 'SPANISH II', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421379C', 'BIBLE-NEW TEST. SURVEY', 'BIBLE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C156510775342141U8', 'APPLIED MATH II', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C156510775342154FD', 'AFRICAN AMERICAN LITERATURE', 'ENGLISH – OTHER', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534215VR1', 'CARPENTRY', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534215VUP', 'COMPUTER PROGRAMMING', 'COMPUTER', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534216505', 'ADVANCED COMMUNICATIONS', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534216WKW', 'THEOLOGY', 'BIBLE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421762J', 'ENGLISH 11', 'ENGLISH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534217TFG', 'CHRISTIAN WORLDVIEW', 'BIBLE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534217W7G', 'BUSINESS MATH', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C156510775342189R9', 'KEYBOARDING/TYPING', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534218SO2', 'LITERARY ANALYSIS & INTERPRETATION', 'ENGLISH – OTHER', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534218V4P', 'HOME ECONOMICS', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534219AEE', 'NUTRITION', 'HEALTH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534219HTD', 'RELIGION II', 'BIBLE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534219VBM', 'SAT PREPARATION', 'COLLEGE PREP', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421A0MC', 'BUSINESS COMMUNICATIONS', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421A4ZO', 'COMPOSITION I', 'ENGLISH – OTHER', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421AI09', 'RELIGION I', 'BIBLE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421AX8M', 'JOURNALISM', 'ENGLISH – OTHER', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421BCUK', 'SPANISH', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421BO81', 'DRIVERS EDUCATION', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421DYDB', 'CHINESE', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421E31O', 'COMPOSITION II', 'ENGLISH – OTHER', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421FWI3', 'APPLIED MATH', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421FXZI', 'WOODWORKING', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421GVD9', 'ENGLISH 10', 'ENGLISH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421HTI3', 'FRENCH III', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421IO10', 'SPANISH III', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421JIN0', 'HOME ECONOMICS - SEWING', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421K7MC', 'INTRODUCTION TO COMPUTERS', 'COMPUTER', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421KUQ9', 'BIBLE HISTORY', 'BIBLE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421MKGJ', 'FRENCH II', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421MKNM', 'COMMUNITY SERVICE', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421MP3G', 'CREATIVE WRITING', 'ENGLISH – OTHER', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421MTO4', 'DRAFTING', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421N391', 'BIBLE III', 'BIBLE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421NEDG', 'LATIN', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421NFUP', 'TECHNICAL WRITING', 'ENGLISH – OTHER', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421NNLF', 'LATIN III', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421NSDB', 'ADVANCED ALGEBRA & TRIGONOMETRY', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421OHH1', 'ADVANCED MATH', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421OZ7X', 'AMERICAN SIGN LANGUAGE', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421P68X', 'ENGLISH 09', 'ENGLISH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421PJ6O', 'CIVIL AIR PATROL', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421PO8Y', 'GERMAN II', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421Q3V8', 'ACCOUNTING II', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421QFLO', 'ACCOUNTING', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421QGOO', 'COMPUTER TECHNOLOGY', 'COMPUTER', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421QQZ0', 'LATIN II', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421QS9P', 'AUTO MECHANICS', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421QVM5', 'HEBREW', 'BIBLE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421QVO5', 'COLLEGE PLANNING', 'COLLEGE PREP', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421R7BL', 'WORK EXPERIENCE', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421S2MN', 'BRITISH LITERATURE', 'ENGLISH – OTHER', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421S5AK', 'ACT PREPARATION', 'COLLEGE PREP', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421SBHB', 'COMPUTER GRAPHICS', 'COMPUTER', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421SBIO', 'SPEED READING', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421T1LC', 'APOLOGETICS', 'BIBLE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421TBYD', 'FRENCH', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421TTQ1', 'CHINESE II', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421U4QL', 'STUDY SKILLS', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421UIVS', 'LATIN IV', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421UKCN', 'HEALTH', 'HEALTH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421UOUZ', 'AMERICAN SIGN LANGUAGE II', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421VJ3U', 'PHILOSOPHY', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421VL0T', 'INTRODUCTION TO WORLD RELIGIONS', 'BIBLE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421VYKN', 'ALGEBRA II', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421WTAI', 'GREEK', 'BIBLE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421XF70', 'AMERICAN LITERATURE', 'ENGLISH – OTHER', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421XZW1', 'ESL (ENGLISH 2ND LANGUAGE)', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421Y6Y2', 'WELLNESS', 'HEALTH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421YB9Q', 'ACCOUNTING III', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421YGGW', 'ALGEBRA I', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421YWRC', 'ENGLISH 12', 'ENGLISH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421Z318', 'ITALIAN II', 'FOREIGN LANGUAGE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421Z4O5', 'BIBLE IV', 'BIBLE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421ZD00', 'CHILD DEVELOPMENT', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421ZKTV', 'LIFE OF CHRIST', 'BIBLE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421ZTQP', 'BIBLE II', 'BIBLE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421ZWFH', 'LIFE SKILLS', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421ZWNZ', 'HOME ECONOMICS - COOKING', 'ELECTIVES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753421ZX45', 'BIBLE', 'BIBLE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C156510775342201NE', 'STATISTICS', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C156510775342207WL', 'PE-SWIMMING', 'PHYSICAL EDUCATION', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534220PH2', 'EUROPEAN HISTORY', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534221ECB', 'ART - GRAPHIC', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C156510775342223Z1', 'FINITE MATH', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C156510775342228GJ', 'CONSUMER MATH II', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534222Q5J', 'MUSIC - GUITAR', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422334S', 'WESTERN CIVILIZATIONS I', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534223MBP', 'COMPUTER TECHNOLOGY', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534224GB2', 'NUTRITION SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534224I1R', 'DISCRETE MATHEMATICS', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534224LA0', 'CIVICS', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422509G', 'MATH TECH II', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534225HRM', 'INTEGRATED MATHEMATICS II', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534225O2N', 'HORTICULTURE', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C156510775342267MY', 'ART - DRAWING', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534226BAJ', 'PE-WEIGHTLIFTING', 'PHYSICAL EDUCATION', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534226T3M', 'WORLD HISTORY', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534226UGQ', 'ENVIRONMENTAL SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534226UXN', 'MATH TECH I', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C156510775342277BK', 'CANCE - BALLET', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534227GOO', 'PE-FENCING', 'PHYSICAL EDUCATION', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534227GZO', 'PHYSICS', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534227MMX', 'VISUAL ARTS', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534227S7J', 'MICROECONOMICS', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C156510775342283QG', 'ASTRONOMY', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534228N0F', 'PHYSICAL SCIENCE W/LAB', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534228SQF', 'GEOMETRY', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C156510775342297YW', 'GRAPHIC DESIGN', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534229C2R', 'MUSIC - PERCUSSION', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534229DEQ', 'FORENSIC SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534229E93', 'PSYCHOLOGY', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C15651077534229KIC', 'CHEMISTRY II', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422A3DR', 'WORLD GEOGRAPHY', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422ATBM', 'ANIMAL SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422B804', 'CONSUMER MATH', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422BNGZ', 'U.S. HISTORY', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422C05I', 'LIFE SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422CCV8', 'GEOLOGY W/LAB', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422CRSX', 'GEOLOGY', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422DICY', 'PE-BASEBALL', 'PHYSICAL EDUCATION', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422DME4', 'VIDEOGRAPHY', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422DXS8', 'MEDIEVAL HISTORY', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422E06Z', 'ART - TEXTILE', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422E9U6', 'PE-TENNIS', 'PHYSICAL EDUCATION', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422EZB1', 'CHEMISTRY W/LAB', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422F3SR', 'MUSIC', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422FK3P', 'VIDEO EDITING', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422G22L', 'INTEGRATED MATHEMATICS', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422G7WT', 'FOOD SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422GHHM', 'PE-FOOTBALL', 'PHYSICAL EDUCATION', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422GINO', 'MUSIC - VIOLIN', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422GOSN', 'EARTH SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422GQOH', 'ART - PAINTING', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422GWEN', 'DANCE', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13');
INSERT INTO `courses` (`id`, `name`, `category`, `type`, `text_book`, `desc`, `status`, `created_at`, `updated_at`) VALUES
('C1565107753422GXKL', 'PHOTOGRAPHY', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422H280', 'ANATOMY & PHYSIOLOGY', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422HC2G', 'MODERN HISTORY', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422HKGO', 'PRE-CALCULUS', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422HS7E', 'PE-BASKETBALL', 'PHYSICAL EDUCATION', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422HWTL', 'PERSONAL FINANCE', 'PERSONAL FINANCE', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422I38I', 'VOCAL MUSIC', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422ICVK', 'PRE-ALGEBRA', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422JB1O', 'FOUNDATIONS II', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422KBIJ', 'MUSIC - CHOIR', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422KYZL', 'CONTEMPORARY ISSUES', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422LD3R', 'FAMILY & CONSUMER SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422LR42', 'AMERICAN HISTORY', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422MEYB', 'ANATOMY & PHYSIOLOGY W/LAB', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422MJ94', 'ECOLOGY W/LAB', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422NBJD', 'ART HISTORY', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422NFF9', 'MUSIC - BAND', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422NSCJ', 'TRIGONOMETRY', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422NXBF', 'FILM MAKING', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422O7O9', 'WESTERN CIVILIZATIONS II', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422OK0G', 'LOGIC', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422OQ8I', 'MUSIC THEORY', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422OZLY', 'ECONOMICS', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422P0L0', 'MUSIC - PERFORMANCE', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422P389', 'ADVANCED BIOLOGY', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422POOI', 'BIOLOGY', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422Q8DK', 'COMPETENCY MATHEMATICS', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422QTI2', 'ANCIENT HISTORY', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422QTO5', 'ART', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422QU6I', 'PHYSICAL SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422R0MA', 'DRAMA', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422RKHP', 'COLLEGE ALGEBRA', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422RM6X', 'THEATRE ARTS', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422RV66', 'ECOLOGY', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422S4IR', 'MUSIC HISTORY', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422SEXM', 'MARINE BIOLOGY', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422SR0Y', 'MUSIC - VOICE', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422T2KB', 'AGRICULTURAL SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422T6C7', 'U.S. HISTORY II', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422UJ53', 'BIOLOGY W/LAB', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422USYD', 'PHYSICAL EDUCATION', 'PHYSICAL EDUCATION', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422UYZ2', 'BIOLOGY II', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422VQHN', 'CALCULUS', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422W6K2', 'FOUNDATIONS I', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422WAOJ', 'U.S. GOVERNMENT', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422WGA1', 'EQUINE SCIENCE', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422XG4Y', 'POLITICAL SCIENCE', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422XLDK', 'MUSIC APPRECIATION', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422XM9I', 'PHYSICS', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422XMGP', 'PE-HOCKEY', 'PHYSICAL EDUCATION', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422XU1U', 'PE-GOLF', 'PHYSICAL EDUCATION', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422XZ14', 'CHEMISTRY', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422Y5F6', 'PHYSICS W/LAB', 'NATURAL / PHYSICAL SCIENCES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422YDIA', 'ART APPRECIATION', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422YFZ0', 'MUSIC - PIANO', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422YKGO', 'PERFORMING ARTS', 'VISUAL/PERFORMING ARTS', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422YLNL', 'PE-SOCCER', 'PHYSICAL EDUCATION', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422YTDA', 'SOCIOLOGY', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422YTN2', 'INTEGRATED MATHEMATICS III', 'MATH', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422ZGAS', 'AFRICAN AMERICAN HISTORY', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422ZU3J', 'GEOGRAPHY', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13'),
('C1565107753422ZY7A', 'MACROECONOMICS', 'SOCIAL STUDIES', 'nonCredit', 'desc', 'desc', 'active', '2019-08-06 16:09:13', '2019-08-06 16:09:13');

-- --------------------------------------------------------

--
-- Table structure for table `document_answers`
--

CREATE TABLE `document_answers` (
  `id` varchar(255) NOT NULL,
  `question_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `document_questions`
--

CREATE TABLE `document_questions` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `status` enum('active','expired') DEFAULT 'active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_questions`
--

INSERT INTO `document_questions` (`id`, `user_id`, `question`, `desc`, `status`, `created_at`, `updated_at`) VALUES
('DQ15663224277540JGW', 'U1564691033253L3VHW', '[{"question":"test","answer":""}]', '-', 'active', '2019-08-20 17:33:47', '2019-08-20 17:33:47'),
('DQ1567179800990IGWP', 'U1564691033253L3VHW', '[{"question":"hiii","answer":""}]', 'test', 'active', '2019-08-30 15:43:20', '2019-08-30 15:43:20');

-- --------------------------------------------------------

--
-- Table structure for table `families`
--

CREATE TABLE `families` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `m_first_name` varchar(255) DEFAULT NULL,
  `m_last_name` varchar(255) DEFAULT NULL,
  `m_middle_initial` varchar(255) DEFAULT NULL,
  `f_first_name` varchar(255) DEFAULT NULL,
  `f_last_name` varchar(255) DEFAULT NULL,
  `f_middle_initial` varchar(255) DEFAULT NULL,
  `status` enum('Active','Banned','graduated','withdrawn','pending_approval','pending_re_enrollment') DEFAULT 'pending_approval',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `m_address` varchar(255) DEFAULT NULL,
  `m_apt_unit` varchar(255) DEFAULT NULL,
  `m_city` varchar(255) DEFAULT NULL,
  `m_state` varchar(255) DEFAULT NULL,
  `m_zip_code` varchar(255) DEFAULT NULL,
  `m_phone` varchar(255) DEFAULT NULL,
  `m_email` varchar(255) DEFAULT NULL,
  `f_address` varchar(255) DEFAULT NULL,
  `f_apt_unit` varchar(255) DEFAULT NULL,
  `f_city` varchar(255) DEFAULT NULL,
  `f_state` varchar(255) DEFAULT NULL,
  `f_zip_code` varchar(255) DEFAULT NULL,
  `f_phone` varchar(255) DEFAULT NULL,
  `f_email` varchar(255) DEFAULT NULL,
  `school_id` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `families`
--

INSERT INTO `families` (`id`, `user_id`, `m_first_name`, `m_last_name`, `m_middle_initial`, `f_first_name`, `f_last_name`, `f_middle_initial`, `status`, `created_at`, `updated_at`, `m_address`, `m_apt_unit`, `m_city`, `m_state`, `m_zip_code`, `m_phone`, `m_email`, `f_address`, `f_apt_unit`, `f_city`, `f_state`, `f_zip_code`, `f_phone`, `f_email`, `school_id`, `tag`) VALUES
('F1563946396570KMAV2', 'U1563946300382TNR7K', 'father first', 'last', 'middle ', 'mother first', 'mother last', 'mother middle', 'Active', '2019-07-24 05:33:16', '2019-07-24 05:33:16', 'address', 'fdh', 'surat', 'gujarat', '789456', '9856235623', 'father@gmail.com', 'address', 'fhjks', 'Surat', 'Gujarat', '895623', '123256893645', 'mother@gmail.com', 'Ufhksk57389', ''),
('F1564687248586BBDAT', 'U15646872252951V3J3', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '2019-08-01 19:20:48', '2019-08-01 19:20:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'U1564553785117DDF5M', ''),
('F1564687600873MSJCX', 'U1564687600868OQ8K3', 'jihkj', ';kjlh', 'lkjh', ';jlkujh', '', ';kljhg', 'Active', '2019-08-01 19:26:40', '2019-08-01 19:26:40', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', 'Ufhksk57389', 'Default'),
('F15647023649113S5F2', 'U156470236490865FV8', 'Bobby', 'Sanders', '', '', '', '', 'Active', '2019-08-01 23:32:44', '2019-08-01 23:32:44', '225 Briarcliff Rd', '', 'Sweetwater', 'TN', '37874', '3366151407', 'bobby@stellaracademic.com', '', '', '', '', NULL, '', '', 'U1564635026885U156Q', 'Default'),
('F1564802010846397QQ', 'U1562648024906BEQRM', 'Test', 'Test', 'Test', 'Hsjj', 'Juhh', 'Hhhhh', 'Active', '2019-08-03 03:13:30', '2019-08-03 03:13:30', 'Hshhs', '12', 'Hshsh', 'Ghh', '7887', '61727727', 'Nsnsjsjns@gmail.com', 'Bhh', 'Bbb', 'Hggg', 'Hhhh', '7867', '786789876', 'Hdhhdhdhhdh@gmail.com', NULL, ''),
('F1564936612581H2P1A', 'U1564936612575ZZB8K', 'Bobby', 'Sanders', '', '', '', '', 'Active', '2019-08-04 16:36:52', '2019-08-04 16:36:52', '225 Briarcliff Rd', '', 'Sweetwater', 'TN', '37874', '', '', '', '', '', '', NULL, '', '', 'U1564691033253L3VHW', 'Default'),
('F1565257931549ANGED', 'U1563550437349RD9W4', 'Bobby', 'Sanders', NULL, NULL, NULL, NULL, 'Active', '2019-08-08 09:52:11', '2019-08-08 09:54:00', '225 Briarcliff Rd', NULL, 'Sweetwater', 'TN', '37874', '8652449445', 'bobby@innovativeea.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
('F15654290316492EKZ4', 'U1565429031642O1UVZ', 'milan', 'Bhikadiya', 't', '', '', '', 'Active', '2019-08-10 09:23:51', '2019-08-10 09:23:51', 'B-34 Prabhudarshan soc', 'Punagam Road Surat', 'surat', 'Gujarat', '395010', '', '', '', '', '', '', NULL, '', '', 'U1564691033253L3VHW', 'Default'),
('F1565723274761J3GLT', 'U1565723274570H4PTX', 'Bob', 'Smith', '', '', '', '', 'Active', '2019-08-13 19:07:54', '2019-08-30 22:53:45', '123 Wallaby Way', '', 'Knoxville', 'Tennessee', '37912', '(258) 358-2517', '', '', '', '', '', NULL, '', '', 'U1564691033253L3VHW', 'Default'),
('F1565974696269DRI75', 'U1565974696264P8D2V', 'ljkhjgf', 'lkjhgf', 'lkjhgf', 'Test', ';ilhjgh', 'olukjhg', 'Active', '2019-08-16 16:58:16', '2019-08-20 10:13:23', 'lkjhg', 'kjlhg', '', '', '', '', '', '', '', '', '', NULL, '', '', 'U1564691033253L3VHW', 'Default'),
('F1566030343915970AB', 'U1566030343904U3H8H', 'Diana', 'Smith', 'T', '', '', '', 'Active', '2019-08-17 08:25:43', '2019-08-17 08:25:43', '125 Test St', '102', 'Knoxville', 'TN', '37922', '9584582411', 'diana@beyondexpectationspm.com', '', '', '', '', NULL, '', '', 'U1565979055462PNQK4', 'Default'),
('F1566290820878K9WP3', 'U15662908208705PJ6Y', 'Bobby', 'Smith', '', '', '', '', 'Active', '2019-08-20 08:47:00', '2019-08-20 08:47:00', '125 Test Rd', '110', 'Knoxville', 'TN', '37922', '3365148574', 'bsedge111@hotmail.com', '', '', '', '', NULL, '', '', 'U1565979055462PNQK4', 'Default'),
('F15667157483545YUPT', 'U1566715748349ZNN1N', 'k;;jlh', 'ljklg', 'kljh', 'iolhj', 'kj,hm', ';kljhmg', 'Active', '2019-08-25 06:49:08', '2019-08-25 06:49:08', '', '', '', '', '', '', '', 'hkgj', '', '', '', NULL, '', '', NULL, 'Default'),
('F156671580275086T9H', 'U156671580274520GND', 'jljhgf', 'hjg', 'lukjhgfg', 'ilukjfhgdb', 'kjhg', 'lkjhgn', 'Active', '2019-08-25 06:50:02', '2019-08-25 06:50:02', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', NULL, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `family_notes`
--

CREATE TABLE `family_notes` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `family_notes`
--

INSERT INTO `family_notes` (`id`, `user_id`, `title`, `note`, `created_at`, `updated_at`) VALUES
('FN1567189795284LZFW', 'U1564691033253L3VHW', 'kjlgh', 'okulhjgkj', '2019-08-30 18:29:55', '2019-08-30 18:29:55'),
('FN1567190077372EF8I', 'U1565974696264P8D2V', '[\'pi;ogkhfh', 'kl;jlhkgj', '2019-08-30 18:34:37', '2019-08-30 18:34:37'),
('FN15671900895944XN5', 'U1565974696264P8D2V', 'oi;ulyktu', 'i;ulkyhj', '2019-08-30 18:34:49', '2019-08-30 18:34:49');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `type` enum('New Student Task','New File','New User Request','New Resource','New Transaction','New User Order') DEFAULT NULL,
  `object_id` varchar(255) DEFAULT NULL,
  `object_type` enum('user','student task','resource','user request','transaction','user order') DEFAULT NULL,
  `status` enum('pending','viewed') DEFAULT 'pending',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `object_id`, `object_type`, `status`, `created_at`, `updated_at`) VALUES
('N1565998466938GPTU5', 'U1564691033253L3VHW', 'New User Request', 'UR1565998466931XKPN', 'user request', 'pending', '2019-08-16 23:34:26', '2019-08-16 23:34:26'),
('N15660350257536FNPU', 'U1564936612575ZZB8K', 'New Student Task', 'ST15660350257448JQL', 'student task', 'pending', '2019-08-17 09:43:45', '2019-08-17 09:43:45'),
('N1566232719795WEHHT', 'U1565974696264P8D2V', 'New Student Task', 'ST15662327197445L74', 'student task', 'pending', '2019-08-19 16:38:39', '2019-08-19 16:38:39'),
('N156623965253306QII', 'U1565974696264P8D2V', 'New Student Task', 'ST15662396525269Q8U', 'student task', 'pending', '2019-08-19 18:34:12', '2019-08-19 18:34:12'),
('N1566239880291KNJK0', 'U1565974696264P8D2V', 'New Student Task', 'ST1566239880276SVCP', 'student task', 'pending', '2019-08-19 18:38:00', '2019-08-19 18:38:00'),
('N1566240135908KQ5QY', 'U1565974696264P8D2V', 'New Student Task', 'ST1566240135896JGRC', 'student task', 'pending', '2019-08-19 18:42:15', '2019-08-19 18:42:15'),
('N15662401526554H6HK', 'U1565974696264P8D2V', 'New Student Task', 'ST15662401526527AYC', 'student task', 'pending', '2019-08-19 18:42:32', '2019-08-19 18:42:32'),
('N156624031916670TLG', 'U1565974696264P8D2V', 'New Student Task', 'ST1566240319103GSOU', 'student task', 'pending', '2019-08-19 18:45:19', '2019-08-19 18:45:19'),
('N1566295958652BOTV8', 'U1564691033253L3VHW', 'New User Request', 'UR1566295958640A7CE', 'user request', 'pending', '2019-08-20 10:12:38', '2019-08-20 10:12:38'),
('N1566308875714Z1A63', 'U1565974696264P8D2V', 'New Student Task', 'ST1566308875708Q50A', 'student task', 'pending', '2019-08-20 13:47:55', '2019-08-20 13:47:55'),
('N1566308892136LIHJJ', 'U1564936612575ZZB8K', 'New Student Task', 'ST1566308892133ICGK', 'student task', 'pending', '2019-08-20 13:48:12', '2019-08-20 13:48:12'),
('N15663089125180JX6V', 'U1564936612575ZZB8K', 'New Student Task', 'ST15663089124891O2Y', 'student task', 'pending', '2019-08-20 13:48:32', '2019-08-20 13:48:32'),
('N15663089125188ZW86', 'U1564936612575ZZB8K', 'New Student Task', 'ST15663089124891UFX', 'student task', 'pending', '2019-08-20 13:48:32', '2019-08-20 13:48:32'),
('N1566308912518DY1H6', 'U1565974696264P8D2V', 'New Student Task', 'ST1566308912489W8H2', 'student task', 'pending', '2019-08-20 13:48:32', '2019-08-20 13:48:32'),
('N156638729233907W4B', 'U1565974696264P8D2V', 'New Student Task', 'ST1566387292330ERX4', 'student task', 'pending', '2019-08-21 11:34:52', '2019-08-21 11:34:52'),
('N1566388899501D0WSS', 'U1565974696264P8D2V', 'New Student Task', 'ST1566388899486YINP', 'student task', 'pending', '2019-08-21 12:01:39', '2019-08-21 12:01:39'),
('N1566457283635ZAID2', 'U1565974696264P8D2V', 'New Student Task', 'ST1566457283629XW14', 'student task', 'pending', '2019-08-22 07:01:23', '2019-08-22 07:01:23'),
('N15666445777829N7XQ', 'U1566641796512OM3FI', 'New Transaction', 'T1566644577378YY18X', 'transaction', 'pending', '2019-08-24 11:02:57', '2019-08-24 11:02:57'),
('N1566649057474FB0FR', 'U156664885285749NP4', 'New Transaction', 'T1566649057456J4Y1E', 'transaction', 'pending', '2019-08-24 12:17:37', '2019-08-24 12:17:37'),
('N15667159961137A4DP', 'U1566715748349ZNN1N', 'New Transaction', 'T1566715996095NQPPY', 'transaction', 'pending', '2019-08-25 06:53:16', '2019-08-25 06:53:16'),
('N1566715996324W0RZ7', 'U1566715748349ZNN1N', 'New Transaction', 'T1566715996316SDMM1', 'transaction', 'pending', '2019-08-25 06:53:16', '2019-08-25 06:53:16'),
('N1566810886825WZJVQ', 'U1565974696264P8D2V', 'New Student Task', 'ST156681088675808AR', 'student task', 'pending', '2019-08-26 09:14:46', '2019-08-26 09:14:46'),
('N1566810887240YQPL9', 'U1565974696264P8D2V', 'New Student Task', 'ST1566810887232NBKT', 'student task', 'pending', '2019-08-26 09:14:47', '2019-08-26 09:14:47'),
('N1566898359472A5NZR', 'U1564936612575ZZB8K', 'New User Order', 'UO1566898359464R7E0', 'user order', 'pending', '2019-08-27 09:32:39', '2019-08-27 09:32:39'),
('N1566898364363YSPLI', 'U1564936612575ZZB8K', 'New User Order', 'UO1566898363986M637', 'user order', 'pending', '2019-08-27 09:32:44', '2019-08-27 09:32:44'),
('N15668983653718KNOV', 'U1564936612575ZZB8K', 'New User Order', 'UO1566898365292E7BQ', 'user order', 'pending', '2019-08-27 09:32:45', '2019-08-27 09:32:45'),
('N1566898366131P95RU', 'U1564936612575ZZB8K', 'New User Order', 'UO1566898365453UQW5', 'user order', 'pending', '2019-08-27 09:32:46', '2019-08-27 09:32:46'),
('N1566898366234L3UOX', 'U1564936612575ZZB8K', 'New User Order', 'UO1566898365687UMZU', 'user order', 'pending', '2019-08-27 09:32:46', '2019-08-27 09:32:46'),
('N1566898366235JALCI', 'U1564936612575ZZB8K', 'New User Order', 'UO1566898365869Z5WD', 'user order', 'pending', '2019-08-27 09:32:46', '2019-08-27 09:32:46'),
('N15668984796219XQWB', 'U1564936612575ZZB8K', 'New User Order', 'UO1566898479616NW64', 'user order', 'pending', '2019-08-27 09:34:39', '2019-08-27 09:34:39'),
('N1566898484082RNM9T', 'U1564936612575ZZB8K', 'New User Order', 'UO15668984840754W1W', 'user order', 'pending', '2019-08-27 09:34:44', '2019-08-27 09:34:44'),
('N15668984855789CYHB', 'U1564936612575ZZB8K', 'New User Order', 'UO1566898485568Y5KE', 'user order', 'pending', '2019-08-27 09:34:45', '2019-08-27 09:34:45'),
('N15668984855912LD9Q', 'U1564936612575ZZB8K', 'New User Order', 'UO1566898485587JD3O', 'user order', 'pending', '2019-08-27 09:34:45', '2019-08-27 09:34:45'),
('N1566898605734XI4RP', 'U1564936612575ZZB8K', 'New User Order', 'UO1566898605727WLVV', 'user order', 'pending', '2019-08-27 09:36:45', '2019-08-27 09:36:45'),
('N15668986057369Y5AJ', 'U1564936612575ZZB8K', 'New User Order', 'UO15668986057316MFJ', 'user order', 'pending', '2019-08-27 09:36:45', '2019-08-27 09:36:45'),
('N1567155315639I35LB', 'U1564936612575ZZB8K', 'New User Order', 'UO1567155315523307B', 'user order', 'pending', '2019-08-30 08:55:15', '2019-08-30 08:55:15'),
('N1567155317557IY3NU', 'U1564936612575ZZB8K', 'New User Order', 'UO1567155317421UCYQ', 'user order', 'pending', '2019-08-30 08:55:17', '2019-08-30 08:55:17'),
('N15671553214531MZCO', 'U1564936612575ZZB8K', 'New User Order', 'UO15671553213859XOS', 'user order', 'pending', '2019-08-30 08:55:21', '2019-08-30 08:55:21'),
('N156715532145387WX2', 'U1564936612575ZZB8K', 'New User Order', 'UO1567155321385R7PC', 'user order', 'pending', '2019-08-30 08:55:21', '2019-08-30 08:55:21'),
('N1567155321479WTPIU', 'U1564936612575ZZB8K', 'New User Order', 'UO156715532140308YI', 'user order', 'pending', '2019-08-30 08:55:21', '2019-08-30 08:55:21'),
('N1567155321487WP5GE', 'U1564936612575ZZB8K', 'New User Order', 'UO1567155321406LMW1', 'user order', 'pending', '2019-08-30 08:55:21', '2019-08-30 08:55:21'),
('N15671620696145JCS3', 'U1565974696264P8D2V', 'New User Order', 'UO1567162068363ZQBR', 'user order', 'pending', '2019-08-30 10:47:49', '2019-08-30 10:47:49'),
('N1567162188892MB3EO', 'U1565974696264P8D2V', 'New User Order', 'UO15671621888803R9L', 'user order', 'pending', '2019-08-30 10:49:48', '2019-08-30 10:49:48'),
('N1567162561378A35K7', 'U1565974696264P8D2V', 'New User Order', 'UO1567162561356BGOO', 'user order', 'pending', '2019-08-30 10:56:01', '2019-08-30 10:56:01'),
('N1567186576430BPWJO', 'U1565974696264P8D2V', 'New User Request', 'UR1567186576421Y68I', 'user request', 'pending', '2019-08-30 17:36:16', '2019-08-30 17:36:16'),
('N1567206376304PKIYQ', 'U1564936612575ZZB8K', 'New User Order', 'UO1567206375837EC0N', 'user order', 'pending', '2019-08-30 23:06:16', '2019-08-30 23:06:16'),
('N1567207073981KN0HZ', 'U1565974696264P8D2V', 'New User Request', 'UR15672070739631MCJ', 'user request', 'pending', '2019-08-30 23:17:53', '2019-08-30 23:17:53'),
('N1568793455327YM4S7', 'U1564691033253L3VHW', 'New User Request', 'UR1568793455315J7HA', 'user request', 'pending', '2019-09-18 07:57:35', '2019-09-18 07:57:35'),
('N156881215022776MHQ', 'U1564936612575ZZB8K', 'New Student Task', 'ST15688121501894B3B', 'student task', 'pending', '2019-09-18 13:09:10', '2019-09-18 13:09:10'),
('N1568812150227JO6FV', 'U1565974696264P8D2V', 'New Student Task', 'ST1568812150189F1KE', 'student task', 'pending', '2019-09-18 13:09:10', '2019-09-18 13:09:10'),
('N1568812150227R1BE1', 'U1565974696264P8D2V', 'New Student Task', 'ST1568812150189A56A', 'student task', 'pending', '2019-09-18 13:09:10', '2019-09-18 13:09:10'),
('N1568812150227V025C', 'U1564936612575ZZB8K', 'New Student Task', 'ST1568812150189ROUH', 'student task', 'pending', '2019-09-18 13:09:10', '2019-09-18 13:09:10');

-- --------------------------------------------------------

--
-- Table structure for table `pre_student_tasks`
--

CREATE TABLE `pre_student_tasks` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_student_tasks`
--

INSERT INTO `pre_student_tasks` (`id`, `user_id`, `activity`, `title`, `desc`, `created_at`, `updated_at`) VALUES
('PST15688120145299A7', 'U1564691033253L3VHW', 'test1', 'testing', 'testing', '2019-09-18 13:06:54', '2019-09-18 13:06:54'),
('PST1568812104360FKK', 'U1564691033253L3VHW', 'testing2', 'testing2', 'testing2', '2019-09-18 13:08:24', '2019-09-18 13:08:24');

-- --------------------------------------------------------

--
-- Table structure for table `pre_user_requests`
--

CREATE TABLE `pre_user_requests` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_user_requests`
--

INSERT INTO `pre_user_requests` (`id`, `user_id`, `type`, `comment`, `created_at`, `updated_at`) VALUES
('PUR1567186461973ZVL', 'U1564691033253L3VHW', 'test', 'test', '2019-08-30 17:34:21', '2019-08-30 17:34:21');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `status` enum('active','banned') DEFAULT 'active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `name`, `code`, `desc`, `status`, `created_at`, `updated_at`) VALUES
('P156264691436335P71', 'Nautilus homeschool program', 'CODE', 'desc', 'active', '2019-07-09 04:35:14', '2019-07-09 04:35:14'),
('P1562646914363L5OE0', 'Compass homeschool program', 'CODE', 'desc', 'active', '2019-07-09 04:35:14', '2019-07-09 04:35:14');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` varchar(255) NOT NULL,
  `object_id` varchar(255) DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`id`, `name`, `source`, `desc`, `created_at`, `updated_at`, `created_by`) VALUES
('S1564836364879ADI6S', 'my resource', 'https://www.google.co.in/', 'resource description', '2019-08-03 12:46:04', '2019-08-03 12:46:04', NULL),
('S156483643621340GYP', 'gffgds', 'gsdffd', 'gdfgdf', '2019-08-03 12:47:16', '2019-08-03 12:47:16', NULL),
('S15652800205684CWSM', 'test by pradip', 'pradipTest', 'This is just test', '2019-08-08 16:00:20', '2019-08-08 16:00:20', NULL),
('S15654291908602DRC7', 'uiggi11', 'google.com', 'kljhgf', '2019-08-10 09:26:30', '2019-08-10 09:26:30', NULL),
('S1566029128435HY2FS', 'IXL Math', 'https://www.ixl.com/math/', 'Good resource for Math', '2019-08-17 08:05:28', '2019-08-17 08:05:28', 'U1564691033253L3VHW'),
('S156623598488156F7U', 'yrgdf', 'hdfghd', 'fshdsgdf', '2019-08-19 17:33:04', '2019-08-19 17:33:04', 'U1564691033253L3VHW'),
('S1566236888276CO3DL', 'kl;jhgfh', 'https://chililay.com', 'hjkgj', '2019-08-19 17:48:08', '2019-08-19 17:48:08', 'U1564691033253L3VHW'),
('S1566236943909K2TMY', 'l;kjlgfhf', 'https://chililay.com', 'kvb', '2019-08-19 17:49:03', '2019-08-19 17:49:03', 'Ufhksk57389'),
('S1566292445186DHMC1', 'test', 'https://chililay.com', 'test', '2019-08-20 09:14:05', '2019-08-20 09:14:05', 'U1565979055462PNQK4');

-- --------------------------------------------------------

--
-- Table structure for table `school_subscription_plans`
--

CREATE TABLE `school_subscription_plans` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` enum('monthly','yearly') DEFAULT NULL,
  `price` float DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school_subscription_plans`
--

INSERT INTO `school_subscription_plans` (`id`, `name`, `type`, `price`, `desc`, `created_at`, `updated_at`) VALUES
('SSP1565716642273O9Y', 'Yearly Subscription', 'yearly', 45, 'desc', '2019-08-13 17:17:22', '2019-08-13 17:17:22'),
('SSP1565716642273YR6', 'Monthly Subscription', 'monthly', 5, 'desc', '2019-08-13 17:17:22', '2019-08-13 17:17:22');

-- --------------------------------------------------------

--
-- Table structure for table `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('20170308131539-create-user.js'),
('201906202315-create-family.js'),
('201906291338-create-session.js'),
('201907012245-create-program.js'),
('201907012341-create-student.js'),
('201907061106-update-family.js'),
('201907061148-update-family.js'),
('201907061402-create-course.js'),
('201907061541-create-student_year.js'),
('201907062156-create-student_course.js'),
('201907082234-create-student_attendance.js'),
('201907112122-create-user-request.js'),
('201907121032-create-user-file.js'),
('201907121845-update-user-file.js'),
('201907141253-update-session.js'),
('201907152333-update-student-course.js'),
('201907161630-update-student-course.js'),
('201907191726-update-family.js'),
('201907201029-create-student-task.js'),
('201907201317-create-report.js'),
('201907201707-update-student-task.js'),
('201907211144-update-user.js'),
('201907211208-update-user.js'),
('201907211732-update-user.js'),
('201907212022-update-user.js'),
('201907271157-create-user-order.js'),
('201907301527-create-tag.js'),
('201907301616-update-tag.js'),
('201907301632-update-family.js'),
('201907301637-create-resource.js'),
('201907302115-update-user.js'),
('201907302141-create-document-question.js'),
('201907302142-create-document-answer.js'),
('201907310947-update-student.js'),
('201907310948-update-student-year.js'),
('201907312358-update-student.js'),
('201908010023-update-student-course.js'),
('201908021013-create-student-award.js'),
('201908031027-update-student-award.js'),
('201908031131-update-student-task.js'),
('201908032159-create-notification.js'),
('201908041608-update-notification.js'),
('201908111459-update-user.js'),
('201908111538-update-user.js'),
('201908111707-create-transaction.js'),
('201908132115-update-user.js'),
('201908132319-update-resource.js'),
('201908162231-update-user-request.js'),
('201908162241-update-student-task.js'),
('201908192109-update-student.js'),
('201908192110-update-student-year.js'),
('201908192124-update-user-file.js'),
('201908212234-create-pre-student-task.js'),
('201908232144-update-user.js'),
('201908232222-update-user-order.js'),
('201908232238-update-user.js'),
('201908232259-update-user-order.js'),
('201908241048-update-transaction.js'),
('201908241101-update-transaction.js'),
('201908241129-update-notification.js'),
('201908241151-update-user-order.js'),
('201908241808-update-user-order.js'),
('201908251243-update-user.js'),
('201908251507-update-user-order.js'),
('201908261749-update-notification.js'),
('201908292136-update-user.js'),
('201908302202-update-family.js'),
('201908302227-create-pre-user-request.js'),
('201908302303-create-family-notes.js'),
('201911081402-create-school-subscription-plan.js');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `user_type` enum('family','school_admin','super_admin') DEFAULT 'family',
  `language` varchar(255) DEFAULT 'en',
  `device` enum('Android','IOS','Web') DEFAULT NULL,
  `app_version` varchar(255) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `device_token` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `push_channel` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `user_type`, `language`, `device`, `app_version`, `device_id`, `device_token`, `ip`, `token`, `push_channel`, `created_at`, `updated_at`) VALUES
(1, 'U1562647511626TTK18', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '3730', 'U1562647511626TTK18', '2019-07-09 04:45:11', '2019-07-09 04:45:11'),
(2, 'U1562647511626TTK18', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '9867', 'U1562647511626TTK18', '2019-07-09 04:46:29', '2019-07-09 04:46:29'),
(3, 'U1562648024906BEQRM', 'family', 'en', 'Web', 'app_version', 'device_id', 'device_token', '::ffff:123.201.6.140', '3600', 'U1562648024906BEQRM', '2019-07-09 04:53:45', '2019-07-09 04:53:45'),
(4, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.236.3', '3797', 'U1562648024906BEQRM', '2019-07-09 15:38:00', '2019-07-09 15:38:00'),
(5, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.236.3', '2162', 'U1562648024906BEQRM', '2019-07-09 15:39:15', '2019-07-09 15:39:15'),
(6, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.236.3', '6807', 'U1562648024906BEQRM', '2019-07-09 15:39:55', '2019-07-09 15:39:55'),
(7, 'U1562647511626TTK18', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '5376', 'U1562647511626TTK18', '2019-07-18 09:38:27', '2019-07-18 09:38:27'),
(8, 'U1563447543532W2MGC', 'family', 'en', 'Web', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '7819', 'U1563447543532W2MGC', '2019-07-18 10:59:03', '2019-07-18 10:59:03'),
(9, 'U1563447543532W2MGC', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '2039', 'U1563447543532W2MGC', '2019-07-18 11:11:31', '2019-07-18 11:11:31'),
(10, 'U1563448796805UMUVV', 'family', 'en', 'Web', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '9985', 'U1563448796805UMUVV', '2019-07-18 11:19:56', '2019-07-18 11:19:56'),
(11, 'U1563448910304GPW70', 'family', 'en', 'Web', 'app_version', 'device_id', 'device_token', '::ffff:43.248.38.199', '3042', 'U1563448910304GPW70', '2019-07-18 11:21:50', '2019-07-18 11:21:50'),
(12, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '5687', 'U1563448796805UMUVV', '2019-07-18 11:26:03', '2019-07-18 11:26:03'),
(13, 'U1563448910304GPW70', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '3282', 'U1563448910304GPW70', '2019-07-18 11:28:34', '2019-07-18 11:28:34'),
(14, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '3548', 'U1563448796805UMUVV', '2019-07-18 11:35:24', '2019-07-18 11:35:24'),
(15, 'U1563448910304GPW70', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '3651', 'U1563448910304GPW70', '2019-07-18 12:01:16', '2019-07-18 12:01:16'),
(16, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '6724', 'U1563448796805UMUVV', '2019-07-18 12:01:36', '2019-07-18 12:01:36'),
(17, 'U1563447543532W2MGC', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '6599', 'U1563447543532W2MGC', '2019-07-18 12:15:27', '2019-07-18 12:15:27'),
(18, 'U1563550437349RD9W4', 'family', 'en', 'Web', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3391', 'U1563550437349RD9W4', '2019-07-19 15:33:57', '2019-07-19 15:33:57'),
(19, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:43.248.39.99', '6727', 'U1563448796805UMUVV', '2019-07-20 04:47:44', '2019-07-20 04:47:44'),
(20, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '8344', 'U1563550437349RD9W4', '2019-07-20 10:24:25', '2019-07-20 10:24:25'),
(21, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '6470', 'U1563448796805UMUVV', '2019-07-23 11:30:02', '2019-07-23 11:30:02'),
(22, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '6057', 'U1563448796805UMUVV', '2019-07-23 11:30:49', '2019-07-23 11:30:49'),
(23, 'U1563448910304GPW70', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.147.49', '8156', 'U1563448910304GPW70', '2019-07-23 11:54:06', '2019-07-23 11:54:06'),
(24, 'U1563448910304GPW70', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.147.49', '2655', 'U1563448910304GPW70', '2019-07-23 12:14:07', '2019-07-23 12:14:07'),
(25, 'U1563946300382TNR7K', 'family', 'en', 'Web', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '4042', 'U1563946300382TNR7K', '2019-07-24 05:31:40', '2019-07-24 05:31:40'),
(26, 'U1563448910304GPW70', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:103.17.82.112', '2759', 'U1563448910304GPW70', '2019-07-24 07:46:02', '2019-07-24 07:46:02'),
(27, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3785', 'U1563550437349RD9W4', '2019-07-24 09:58:43', '2019-07-24 09:58:43'),
(28, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '5346', 'U1563550437349RD9W4', '2019-07-24 13:57:45', '2019-07-24 13:57:45'),
(29, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.146.178', '2920', 'U1563448796805UMUVV', '2019-07-24 16:16:32', '2019-07-24 16:16:32'),
(30, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.25', '8248', 'U1562648024906BEQRM', '2019-07-24 16:33:45', '2019-07-24 16:33:45'),
(31, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.25', '5531', 'U1562648024906BEQRM', '2019-07-24 16:42:23', '2019-07-24 16:42:23'),
(32, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '4878', 'U1563448796805UMUVV', '2019-07-25 04:50:11', '2019-07-25 04:50:11'),
(33, 'Ufhksk57389', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.237.42', '7011', 'Ufhksk57389', '2019-07-25 17:10:38', '2019-07-25 17:10:38'),
(34, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.118', '9765', 'U1562648024906BEQRM', '2019-07-26 16:26:16', '2019-07-26 16:26:16'),
(35, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '6982', 'U1563448796805UMUVV', '2019-07-27 05:06:32', '2019-07-27 05:06:32'),
(36, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:103.37.183.165', '8375', 'U1563448796805UMUVV', '2019-07-27 15:34:17', '2019-07-27 15:34:17'),
(37, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.228.34', '9888', 'U1563946300382TN', '2019-07-27 17:37:01', '2019-07-27 17:37:01'),
(38, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:103.17.81.140', '2547', 'U1563448796805UMUVV', '2019-07-28 06:51:11', '2019-07-28 06:51:11'),
(39, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:42.108.205.61', '8368', 'U1563448796805UMUVV', '2019-07-28 07:17:13', '2019-07-28 07:17:13'),
(40, 'U1564298994766IOKEV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:42.108.205.61', '2658', 'U1564298994766IOKEV', '2019-07-28 07:29:54', '2019-07-28 07:29:54'),
(41, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:42.108.205.61', '9311', 'U1563448796805UMUVV', '2019-07-28 07:34:03', '2019-07-28 07:34:03'),
(42, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:42.108.205.61', '4195', 'U1563448796805UMUVV', '2019-07-28 07:38:21', '2019-07-28 07:38:21'),
(43, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:42.108.200.201', '7960', 'U1563448796805UMUVV', '2019-07-28 07:41:51', '2019-07-28 07:41:51'),
(44, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.159', '2002', 'U1563946300382TN', '2019-07-28 08:08:18', '2019-07-28 08:08:18'),
(45, 'U15643013763824GI17', 'family', 'en', 'Web', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.159', '3486', 'U15643013763824GI17', '2019-07-28 08:09:36', '2019-07-28 08:09:36'),
(46, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9125', 'U1563946300382TN', '2019-07-28 10:26:52', '2019-07-28 10:26:52'),
(47, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:43.248.38.184', '3035', 'U1563448796805UMUVV', '2019-07-28 10:36:45', '2019-07-28 10:36:45'),
(48, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:103.37.182.59', '5872', 'U1563448796805UMUVV', '2019-07-28 17:00:00', '2019-07-28 17:00:00'),
(49, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:103.37.183.178', '6150', 'U1563448796805UMUVV', '2019-07-29 16:12:55', '2019-07-29 16:12:55'),
(50, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:103.37.183.178', '7178', 'U1563448796805UMUVV', '2019-07-29 16:13:26', '2019-07-29 16:13:26'),
(51, 'U1564419272377S234U', 'family', 'en', 'Web', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.51', '6909', 'U1564419272377S234U', '2019-07-29 16:54:32', '2019-07-29 16:54:32'),
(52, 'U15644369303790ONDL', 'family', 'en', 'Web', 'app_version', 'device_id', 'device_token', '::ffff:108.238.190.107', '7798', 'U15644369303790ONDL', '2019-07-29 21:48:50', '2019-07-29 21:48:50'),
(53, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:42.108.205.92', '3540', 'U1563448796805UMUVV', '2019-07-30 04:14:54', '2019-07-30 04:14:54'),
(54, 'U1563448910304GPW70', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:43.248.39.69', '2041', 'U1563448910304GPW70', '2019-07-30 04:15:07', '2019-07-30 04:15:07'),
(55, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:42.108.221.212', '7238', 'U1563448796805UMUVV', '2019-07-30 05:05:30', '2019-07-30 05:05:30'),
(56, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '5573', 'U1563448796805UMUVV', '2019-07-30 07:29:36', '2019-07-30 07:29:36'),
(57, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '5142', 'U1563550437349RD9W4', '2019-07-30 09:00:31', '2019-07-30 09:00:31'),
(58, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '5483', 'U1563550437349RD9W4', '2019-07-30 09:07:01', '2019-07-30 09:07:01'),
(59, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:103.17.83.163', '1690', 'U1563448796805UMUVV', '2019-07-30 16:39:22', '2019-07-30 16:39:22'),
(60, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:157.32.194.18', '5284', 'U1563946300382TN', '2019-07-30 18:56:06', '2019-07-30 18:56:06'),
(61, 'Ufhksk57389', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:157.32.194.18', '7866', 'Ufhksk57389', '2019-07-30 18:57:02', '2019-07-30 18:57:02'),
(62, 'U1563448910304GPW70', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:139.5.22.62', '8416', 'U1563448910304GPW70', '2019-07-31 04:54:19', '2019-07-31 04:54:19'),
(63, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:139.5.22.62', '7026', 'U1563946300382TN', '2019-07-31 05:08:28', '2019-07-31 05:08:28'),
(64, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.6.140', '9556', 'U1563946300382TN', '2019-07-31 05:54:32', '2019-07-31 05:54:32'),
(65, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:139.5.22.62', '2060', 'U1563946300382TN', '2019-07-31 06:07:36', '2019-07-31 06:07:36'),
(66, 'U1564553785117DDF5M', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:139.5.22.62', '1721', 'U1564553785117DDF5M', '2019-07-31 06:16:46', '2019-07-31 06:16:46'),
(67, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:139.5.22.62', '7571', 'U1563946300382TN', '2019-07-31 07:30:25', '2019-07-31 07:30:25'),
(68, 'U1563448910304GPW70', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:139.5.22.62', '1008', 'U1563448910304GPW70', '2019-07-31 07:30:43', '2019-07-31 07:30:43'),
(69, 'U1564553785117DDF5M', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '8157', 'U1564553785117DDF5M', '2019-07-31 07:34:22', '2019-07-31 07:34:22'),
(70, 'U1564553785117DDF5M', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:139.5.22.62', '7618', 'U1564553785117DDF5M', '2019-07-31 09:03:00', '2019-07-31 09:03:00'),
(71, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:139.5.22.62', '2418', 'U1563946300382TN', '2019-07-31 09:38:15', '2019-07-31 09:38:15'),
(72, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.65.209', '4003', 'U1562648024906BEQRM', '2019-07-31 15:30:27', '2019-07-31 15:30:27'),
(73, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.65.209', '6988', 'U1562648024906BEQRM', '2019-07-31 15:44:53', '2019-07-31 15:44:53'),
(74, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.65.209', '2715', 'U1563946300382TN', '2019-07-31 16:23:17', '2019-07-31 16:23:17'),
(75, 'Ufhksk57389', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.65.209', '5188', 'Ufhksk57389', '2019-07-31 16:34:30', '2019-07-31 16:34:30'),
(76, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.65.209', '3721', 'U1562648024906BEQRM', '2019-07-31 16:55:02', '2019-07-31 16:55:02'),
(77, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.150.134', '3787', 'U1562648024906BEQRM', '2019-07-31 19:31:29', '2019-07-31 19:31:29'),
(78, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.144.173', '1890', 'U1563946300382TN', '2019-08-01 04:22:06', '2019-08-01 04:22:06'),
(79, 'U1564553785117DDF5M', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.144.173', '4763', 'U1564553785117DDF5M', '2019-08-01 04:25:01', '2019-08-01 04:25:01'),
(80, 'U1563448910304GPW70', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.144.173', '5169', 'U1563448910304GPW70', '2019-08-01 04:33:46', '2019-08-01 04:33:46'),
(81, 'U1564553785117DDF5M', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.144.173', '7455', 'U1564553785117DDF5M', '2019-08-01 04:37:37', '2019-08-01 04:37:37'),
(82, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.144.173', '9564', 'U1563946300382TN', '2019-08-01 04:47:57', '2019-08-01 04:47:57'),
(83, 'U1564635026885U156Q', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.144.173', '1608', 'U1564635026885U156Q', '2019-08-01 04:52:23', '2019-08-01 04:52:23'),
(84, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.6.140', '5314', 'U1563946300382TN', '2019-08-01 05:04:27', '2019-08-01 05:04:27'),
(85, 'U1564635026885U156Q', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.144.173', '2087', 'U1564635026885U156Q', '2019-08-01 05:40:52', '2019-08-01 05:40:52'),
(86, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.144.173', '3083', 'U1563946300382TN', '2019-08-01 05:41:19', '2019-08-01 05:41:19'),
(87, 'U1564635026885U156Q', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '2103', 'U1564635026885U156Q', '2019-08-01 05:42:30', '2019-08-01 05:42:30'),
(88, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.6.140', '1168', 'U1562648024906BEQRM', '2019-08-01 07:18:12', '2019-08-01 07:18:12'),
(89, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.6.140', '6680', 'U1562648024906BEQRM', '2019-08-01 07:21:17', '2019-08-01 07:21:17'),
(90, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.114.91', '9704', 'U1563448796805UMUVV', '2019-08-01 07:31:46', '2019-08-01 07:31:46'),
(91, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.144.173', '1597', 'U1563946300382TN', '2019-08-01 07:35:18', '2019-08-01 07:35:18'),
(92, 'U1563448910304GPW70', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.144.173', '7148', 'U1563448910304GPW70', '2019-08-01 07:35:31', '2019-08-01 07:35:31'),
(93, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.114.91', '5331', 'U1563448796805UMUVV', '2019-08-01 07:37:15', '2019-08-01 07:37:15'),
(94, 'U1564635026885U156Q', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.144.173', '7606', 'U1564635026885U156Q', '2019-08-01 07:41:01', '2019-08-01 07:41:01'),
(95, 'U1563448910304GPW70', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.144.173', '3294', 'U1563448910304GPW70', '2019-08-01 07:44:28', '2019-08-01 07:44:28'),
(96, 'U1563448796805UMUVV', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.114.91', '7630', 'U1563448796805UMUVV', '2019-08-01 07:44:49', '2019-08-01 07:44:49'),
(97, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.114.91', '6145', 'U1562648024906BEQRM', '2019-08-01 07:45:51', '2019-08-01 07:45:51'),
(98, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.114.91', '5097', 'U1562648024906BEQRM', '2019-08-01 07:46:45', '2019-08-01 07:46:45'),
(99, 'U1564635026885U156Q', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.144.173', '6081', 'U1564635026885U156Q', '2019-08-01 07:58:15', '2019-08-01 07:58:15'),
(100, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3668', 'U1563550437349RD9W4', '2019-08-01 08:00:49', '2019-08-01 08:00:49'),
(101, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.147.140', '9393', 'U1562648024906BEQRM', '2019-08-01 16:46:58', '2019-08-01 16:46:58'),
(102, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.204', '1313', 'U1562648024906BEQRM', '2019-08-01 16:57:08', '2019-08-01 16:57:08'),
(103, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.204', '2225', 'U1562648024906BEQRM', '2019-08-01 17:06:16', '2019-08-01 17:06:16'),
(104, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.204', '7736', 'U1562648024906BEQRM', '2019-08-01 17:13:25', '2019-08-01 17:13:25'),
(105, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.147.140', '3854', 'U1562648024906BEQRM', '2019-08-01 17:20:32', '2019-08-01 17:20:32'),
(106, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.147.140', '8813', 'U1562648024906BEQRM', '2019-08-01 17:20:58', '2019-08-01 17:20:58'),
(107, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.147.140', '2387', 'U1562648024906BEQRM', '2019-08-01 17:46:47', '2019-08-01 17:46:47'),
(108, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.147.140', '3301', 'U1564552533719ZVO7L', '2019-08-01 18:51:37', '2019-08-01 18:51:37'),
(109, 'Ufhksk57389', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.90.243', '6573', 'Ufhksk57389', '2019-08-01 19:07:55', '2019-08-01 19:07:55'),
(110, 'U15646872252951V3J3', 'family', 'en', 'Web', 'app_version', 'device_id', 'device_token', '::ffff:45.126.145.191', '1278', 'U15646872252951V3J3', '2019-08-01 19:20:25', '2019-08-01 19:20:25'),
(111, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3986', 'U1563550437349RD9W4', '2019-08-01 19:31:38', '2019-08-01 19:31:38'),
(112, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.145.191', '2779', 'U1562648024906BEQRM', '2019-08-01 19:43:46', '2019-08-01 19:43:46'),
(113, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:157.32.37.177', '7101', 'U1562648024906BEQRM', '2019-08-01 19:44:07', '2019-08-01 19:44:07'),
(114, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6232', 'U1563550437349RD9W4', '2019-08-01 20:14:55', '2019-08-01 20:14:55'),
(115, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '1140', 'U1563550437349RD9W4', '2019-08-01 20:20:52', '2019-08-01 20:20:52'),
(116, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.75.161', '1191', 'U1563946300382TN', '2019-08-01 20:21:36', '2019-08-01 20:21:36'),
(117, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.75.161', '9415', 'U1564691033253L3VHW', '2019-08-01 20:25:29', '2019-08-01 20:25:29'),
(118, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:75.3.253.72', '3165', 'U1564691033253L3VHW', '2019-08-01 20:27:23', '2019-08-01 20:27:23'),
(119, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7569', 'U1564691033253L3VHW', '2019-08-01 20:29:17', '2019-08-01 20:29:17'),
(120, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '1604', 'U1563550437349RD9W4', '2019-08-01 20:47:09', '2019-08-01 20:47:09'),
(121, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3870', 'U1563550437349RD9W4', '2019-08-01 20:47:32', '2019-08-01 20:47:32'),
(122, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '2212', 'U1564691033253L3VHW', '2019-08-01 21:07:17', '2019-08-01 21:07:17'),
(123, 'U1564635026885U156Q', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7034', 'U1564635026885U156Q', '2019-08-01 23:31:15', '2019-08-01 23:31:15'),
(124, 'U156470236490865FV8', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3950', 'U156470236490865FV8', '2019-08-01 23:34:16', '2019-08-01 23:34:16'),
(125, 'U1563448910304GPW70', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.147.182', '6647', 'U1563448910304GPW70', '2019-08-02 04:15:51', '2019-08-02 04:15:51'),
(126, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.147.182', '4124', 'U1563946300382TN', '2019-08-02 04:16:50', '2019-08-02 04:16:50'),
(127, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3174', 'U1563550437349RD9W4', '2019-08-02 06:52:20', '2019-08-02 06:52:20'),
(128, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.6.140', '7665', 'U1562648024906BEQRM', '2019-08-02 07:46:47', '2019-08-02 07:46:47'),
(129, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.6.140', '7704', 'U1562648024906BEQRM', '2019-08-02 07:49:07', '2019-08-02 07:49:07'),
(130, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.191', '9101', 'U1562648024906BEQRM', '2019-08-02 15:57:23', '2019-08-02 15:57:23'),
(131, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.79.218.138', '3545', 'U1562648024906BEQRM', '2019-08-03 03:10:30', '2019-08-03 03:10:30'),
(132, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.146.45', '6196', 'U1563946300382TN', '2019-08-03 04:28:00', '2019-08-03 04:28:00'),
(133, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.83', '3993', 'U1562648024906BEQRM', '2019-08-03 04:41:47', '2019-08-03 04:41:47'),
(134, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.83', '5892', 'U1562648024906BEQRM', '2019-08-03 04:44:02', '2019-08-03 04:44:02'),
(135, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.83', '4571', 'U1562648024906BEQRM', '2019-08-03 04:48:35', '2019-08-03 04:48:35'),
(136, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7192', 'U1564691033253L3VHW', '2019-08-03 06:25:48', '2019-08-03 06:25:48'),
(137, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '5415', 'U1563550437349RD9W4', '2019-08-03 06:31:37', '2019-08-03 06:31:37'),
(138, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '1706', 'U1563550437349RD9W4', '2019-08-03 06:32:20', '2019-08-03 06:32:20'),
(139, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.108', '2161', 'U1562648024906BEQRM', '2019-08-03 09:51:02', '2019-08-03 09:51:02'),
(140, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.108', '4452', 'U1564552533719ZVO7L', '2019-08-03 09:53:34', '2019-08-03 09:53:34'),
(141, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3211', 'U1563550437349RD9W4', '2019-08-04 09:48:04', '2019-08-04 09:48:04'),
(142, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '8262', 'U1563550437349RD9W4', '2019-08-04 15:27:13', '2019-08-04 15:27:13'),
(143, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7554', 'U1564691033253L3VHW', '2019-08-04 16:16:21', '2019-08-04 16:16:21'),
(144, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6054', 'U1563550437349RD9W4', '2019-08-05 15:52:26', '2019-08-05 15:52:26'),
(145, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.236.234', '2448', 'U1562648024906BEQRM', '2019-08-05 15:55:14', '2019-08-05 15:55:14'),
(146, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.236.234', '6627', 'U1562648024906BEQRM', '2019-08-05 16:12:17', '2019-08-05 16:12:17'),
(147, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.202', '1435', 'U1564552533719ZVO7L', '2019-08-05 17:15:21', '2019-08-05 17:15:21'),
(148, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.202', '8606', 'U1562648024906BEQRM', '2019-08-05 17:15:34', '2019-08-05 17:15:34'),
(149, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '5227', 'U1563550437349RD9W4', '2019-08-05 19:37:50', '2019-08-05 19:37:50'),
(150, 'U1564553785117DDF5M', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '1884', 'U1564553785117DDF5M', '2019-08-06 10:19:59', '2019-08-06 10:19:59'),
(151, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7846', 'U1564691033253L3VHW', '2019-08-06 10:21:17', '2019-08-06 10:21:17'),
(152, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.144.146', '1388', 'U1564691033253L3VHW', '2019-08-06 11:53:54', '2019-08-06 11:53:54'),
(153, 'U1563448910304GPW70', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:43.248.36.105', '5315', 'U1563448910304GPW70', '2019-08-06 12:06:04', '2019-08-06 12:06:04'),
(154, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:43.248.36.105', '5838', 'U1563946300382TN', '2019-08-06 12:06:30', '2019-08-06 12:06:30'),
(155, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.227.100', '4792', 'U1562648024906BEQRM', '2019-08-06 17:56:17', '2019-08-06 17:56:17'),
(156, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:108.64.100.187', '2479', 'U1563550437349RD9W4', '2019-08-06 19:16:33', '2019-08-06 19:16:33'),
(157, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '7644', 'U1562648024906BEQRM', '2019-08-07 05:38:36', '2019-08-07 05:38:36'),
(158, 'U1564553785117DDF5M', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6690', 'U1564553785117DDF5M', '2019-08-07 07:48:51', '2019-08-07 07:48:51'),
(159, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9340', 'U1564691033253L3VHW', '2019-08-07 07:52:18', '2019-08-07 07:52:18'),
(160, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '8006', 'U1564691033253L3VHW', '2019-08-07 07:53:09', '2019-08-07 07:53:09'),
(161, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3066', 'U1563550437349RD9W4', '2019-08-07 11:52:59', '2019-08-07 11:52:59'),
(162, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '9627', 'U1562648024906BEQRM', '2019-08-07 12:03:11', '2019-08-07 12:03:11'),
(163, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '2102', 'U1562648024906BEQRM', '2019-08-07 12:03:59', '2019-08-07 12:03:59'),
(164, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:139.5.22.132', '3344', 'U1563550437349RD9W4', '2019-08-07 16:28:52', '2019-08-07 16:28:52'),
(165, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7056', 'U1563550437349RD9W4', '2019-08-08 08:58:45', '2019-08-08 08:58:45'),
(166, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9518', 'U1563550437349RD9W4', '2019-08-08 09:07:49', '2019-08-08 09:07:49'),
(167, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '3925', 'U1563550437349RD9W4', '2019-08-08 09:35:32', '2019-08-08 09:35:32'),
(168, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6793', 'U1563550437349RD9W4', '2019-08-08 09:48:00', '2019-08-08 09:48:00'),
(169, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7232', 'U1563550437349RD9W4', '2019-08-08 09:51:15', '2019-08-08 09:51:15'),
(170, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '5370', 'U1563550437349RD9W4', '2019-08-08 09:51:15', '2019-08-08 09:51:15'),
(171, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6669', 'U1563550437349RD9W4', '2019-08-08 09:53:53', '2019-08-08 09:53:53'),
(172, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9122', 'U1563550437349RD9W4', '2019-08-08 09:56:38', '2019-08-08 09:56:38'),
(173, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.70.170', '5245', 'U1563550437349RD9W4', '2019-08-08 09:57:01', '2019-08-08 09:57:01'),
(174, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '1069', 'U1564691033253L3VHW', '2019-08-08 10:16:43', '2019-08-08 10:16:43'),
(175, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7964', 'U1563550437349RD9W4', '2019-08-08 15:51:21', '2019-08-08 15:51:21'),
(176, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:139.5.21.253', '6097', 'U1564691033253L3VHW', '2019-08-08 15:59:41', '2019-08-08 15:59:41'),
(177, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.253', '8160', 'U1562648024906BEQRM', '2019-08-08 16:01:15', '2019-08-08 16:01:15'),
(178, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:139.5.21.253', '6870', 'U1563550437349RD9W4', '2019-08-08 16:01:25', '2019-08-08 16:01:25'),
(179, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:139.5.21.253', '3383', 'U1563550437349RD9W4', '2019-08-08 16:53:33', '2019-08-08 16:53:33'),
(180, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.253', '8869', 'U1563946300382TN', '2019-08-08 17:08:15', '2019-08-08 17:08:15'),
(181, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.253', '4187', 'U1564691033253L3VHW', '2019-08-08 17:09:37', '2019-08-08 17:09:37'),
(182, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:73.108.225.85', '7770', 'U1564691033253L3VHW', '2019-08-08 19:54:24', '2019-08-08 19:54:24'),
(183, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9407', 'U1563550437349RD9W4', '2019-08-08 20:29:06', '2019-08-08 20:29:06'),
(184, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '1509', 'U1563550437349RD9W4', '2019-08-09 09:36:25', '2019-08-09 09:36:25'),
(185, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '2554', 'U1563550437349RD9W4', '2019-08-09 15:38:34', '2019-08-09 15:38:34'),
(186, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.155.127', '8151', 'U1562648024906BEQRM', '2019-08-09 16:09:20', '2019-08-09 16:09:20'),
(187, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '4102', 'U1563550437349RD9W4', '2019-08-09 20:30:23', '2019-08-09 20:30:23'),
(188, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '2405', 'U1564691033253L3VHW', '2019-08-10 00:26:47', '2019-08-10 00:26:47'),
(189, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7469', 'U1563550437349RD9W4', '2019-08-10 00:44:21', '2019-08-10 00:44:21'),
(190, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.227.70', '9456', 'U1564552533719ZVO7L', '2019-08-10 04:55:42', '2019-08-10 04:55:42'),
(191, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:49.34.72.243', '9578', 'U1564552533719ZVO7L', '2019-08-10 09:16:33', '2019-08-10 09:16:33'),
(192, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:49.34.72.243', '2653', 'U1563550437349RD9W4', '2019-08-10 09:17:32', '2019-08-10 09:17:32'),
(193, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:49.34.72.243', '4022', 'U1564552533719ZVO7L', '2019-08-10 09:19:42', '2019-08-10 09:19:42'),
(194, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:49.34.72.243', '6775', 'U1564691033253L3VHW', '2019-08-10 09:22:47', '2019-08-10 09:22:47'),
(195, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:49.34.72.243', '4986', 'U1564552533719ZVO7L', '2019-08-10 11:21:32', '2019-08-10 11:21:32'),
(196, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:49.34.72.243', '1742', 'U1563550437349RD9W4', '2019-08-10 11:22:12', '2019-08-10 11:22:12'),
(197, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:49.34.72.243', '3774', 'U1563550437349RD9W4', '2019-08-10 11:23:06', '2019-08-10 11:23:06'),
(198, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:49.34.72.243', '3274', 'U1564552533719ZVO7L', '2019-08-10 11:23:39', '2019-08-10 11:23:39'),
(199, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:49.34.72.243', '4190', 'U1563550437349RD9W4', '2019-08-10 11:32:33', '2019-08-10 11:32:33'),
(200, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:49.34.72.243', '3429', 'U1564552533719ZVO7L', '2019-08-10 11:36:58', '2019-08-10 11:36:58'),
(201, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6012', 'U1563550437349RD9W4', '2019-08-10 16:48:42', '2019-08-10 16:48:42'),
(202, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6914', 'U1563550437349RD9W4', '2019-08-10 16:49:50', '2019-08-10 16:49:50'),
(203, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '4743', 'U1563550437349RD9W4', '2019-08-10 16:50:15', '2019-08-10 16:50:15'),
(204, 'U156470236490865FV8', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6863', 'U156470236490865FV8', '2019-08-10 16:51:47', '2019-08-10 16:51:47'),
(205, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.79.217.253', '4352', 'U1562648024906BEQRM', '2019-08-11 06:28:29', '2019-08-11 06:28:29'),
(206, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.137.6', '3241', 'U1564552533719ZVO7L', '2019-08-11 06:29:52', '2019-08-11 06:29:52'),
(207, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.137.6', '8553', 'U1564552533719ZVO7L', '2019-08-11 06:33:03', '2019-08-11 06:33:03'),
(208, 'U156470236490865FV8', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6118', 'U156470236490865FV8', '2019-08-11 09:34:33', '2019-08-11 09:34:33'),
(209, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.154.213', '1699', 'U1562648024906BEQRM', '2019-08-11 10:51:09', '2019-08-11 10:51:09'),
(210, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3943', 'U1563550437349RD9W4', '2019-08-12 07:55:38', '2019-08-12 07:55:38'),
(211, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.141', '5209', 'U1562648024906BEQRM', '2019-08-13 15:30:35', '2019-08-13 15:30:35'),
(212, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.141', '8259', 'U1563946300382TN', '2019-08-13 16:12:14', '2019-08-13 16:12:14'),
(213, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:73.108.225.85', '7604', 'U1564691033253L3VHW', '2019-08-13 19:05:30', '2019-08-13 19:05:30'),
(214, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:73.108.225.85', '3587', 'U1563550437349RD9W4', '2019-08-13 19:55:25', '2019-08-13 19:55:25'),
(215, 'U1563550437349RD9W4', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:73.113.19.60', '9464', 'U1563550437349RD9W4', '2019-08-14 00:43:15', '2019-08-14 00:43:15'),
(216, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.99', '6500', 'U1563946300382TN', '2019-08-16 16:56:38', '2019-08-16 16:56:38'),
(217, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.99', '2673', 'U1564691033253L3VHW', '2019-08-16 16:57:14', '2019-08-16 16:57:14'),
(218, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.99', '4422', 'U1564552533719ZVO7L', '2019-08-16 17:31:14', '2019-08-16 17:31:14'),
(219, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.99', '9196', 'U1562648024906BEQRM', '2019-08-16 17:32:38', '2019-08-16 17:32:38'),
(220, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.99', '9413', 'U1564552533719ZVO7L', '2019-08-16 17:33:24', '2019-08-16 17:33:24'),
(221, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.79.215.250', '4418', 'U1563946300382TN', '2019-08-16 18:05:50', '2019-08-16 18:05:50'),
(222, 'U1565979055462PNQK4', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.79.215.250', '5073', 'U1565979055462PNQK4', '2019-08-16 18:14:56', '2019-08-16 18:14:56'),
(223, 'U1565979055462PNQK4', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.79.215.250', '5625', 'U1565979055462PNQK4', '2019-08-16 18:14:57', '2019-08-16 18:14:57'),
(224, 'U1565979055462PNQK4', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.79.215.250', '9523', 'U1565979055462PNQK4', '2019-08-16 18:14:58', '2019-08-16 18:14:58'),
(225, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.79.215.250', '4079', 'U1563946300382TN', '2019-08-16 18:18:23', '2019-08-16 18:18:23'),
(226, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:73.108.225.85', '3996', 'U1564691033253L3VHW', '2019-08-16 18:26:42', '2019-08-16 18:26:42'),
(227, 'U156598050016762F3P', 'family', 'en', 'Web', 'app_version', 'device_id', 'device_token', '::ffff:73.108.225.85', '9952', 'U156598050016762F3P', '2019-08-16 18:35:00', '2019-08-16 18:35:00'),
(228, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9298', 'U1564691033253L3VHW', '2019-08-16 23:19:48', '2019-08-16 23:19:48'),
(229, 'U1564936612575ZZB8K', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6864', 'U1564936612575ZZB8K', '2019-08-16 23:31:33', '2019-08-16 23:31:33'),
(230, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.70.27', '9535', 'U1562648024906BEQRM', '2019-08-17 02:34:05', '2019-08-17 02:34:05'),
(231, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '2792', 'U1562648024906BEQRM', '2019-08-17 03:57:15', '2019-08-17 03:57:15'),
(232, 'U1564936612575ZZB8K', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7992', 'U1564936612575ZZB8K', '2019-08-17 06:59:46', '2019-08-17 06:59:46'),
(233, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6817', 'U1564691033253L3VHW', '2019-08-17 08:04:30', '2019-08-17 08:04:30'),
(234, 'U1565979055462PNQK4', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9352', 'U1565979055462PNQK4', '2019-08-17 08:21:04', '2019-08-17 08:21:04'),
(235, 'U1565979055462PNQK4', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '5163', 'U1565979055462PNQK4', '2019-08-17 09:12:46', '2019-08-17 09:12:46'),
(236, 'U1564936612575ZZB8K', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3010', 'U1564936612575ZZB8K', '2019-08-17 09:40:25', '2019-08-17 09:40:25'),
(237, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '1876', 'U1564691033253L3VHW', '2019-08-17 09:42:58', '2019-08-17 09:42:58'),
(238, 'U1564936612575ZZB8K', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7730', 'U1564936612575ZZB8K', '2019-08-17 09:46:06', '2019-08-17 09:46:06'),
(239, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.227.113', '9557', 'U1563946300382TN', '2019-08-18 06:56:52', '2019-08-18 06:56:52'),
(240, 'Ufhksk57389', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.227.113', '2315', 'Ufhksk57389', '2019-08-18 06:58:06', '2019-08-18 06:58:06'),
(241, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.102', '6851', 'U1562648024906BEQRM', '2019-08-18 13:08:36', '2019-08-18 13:08:36'),
(242, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.102', '1794', 'U1562648024906BEQRM', '2019-08-18 13:09:16', '2019-08-18 13:09:16'),
(243, 'U15643013763824GI17', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.102', '6572', 'U15643013763824GI17', '2019-08-18 13:25:40', '2019-08-18 13:25:40'),
(244, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.102', '7783', 'U1563946300382TN', '2019-08-18 13:26:27', '2019-08-18 13:26:27'),
(245, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.102', '4868', 'U1563946300382TN', '2019-08-18 13:27:37', '2019-08-18 13:27:37'),
(246, 'Ufhksk57389', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.102', '6304', 'Ufhksk57389', '2019-08-18 13:28:26', '2019-08-18 13:28:26'),
(247, 'U1564687600868OQ8K3', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.102', '5188', 'U1564687600868OQ8K3', '2019-08-18 13:29:07', '2019-08-18 13:29:07'),
(248, 'U1564687600868OQ8K3', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.102', '6047', 'U1564687600868OQ8K3', '2019-08-18 13:43:24', '2019-08-18 13:43:24');
INSERT INTO `sessions` (`id`, `user_id`, `user_type`, `language`, `device`, `app_version`, `device_id`, `device_token`, `ip`, `token`, `push_channel`, `created_at`, `updated_at`) VALUES
(249, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.102', '5690', 'U1563946300382TN', '2019-08-18 13:59:21', '2019-08-18 13:59:21'),
(250, 'U1565979055462PNQK4', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9012', 'U1565979055462PNQK4', '2019-08-18 14:11:15', '2019-08-18 14:11:15'),
(251, 'U1564936612575ZZB8K', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3004', 'U1564936612575ZZB8K', '2019-08-18 16:53:09', '2019-08-18 16:53:09'),
(252, 'U1565979055462PNQK4', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '1611', 'U1565979055462PNQK4', '2019-08-18 16:57:31', '2019-08-18 16:57:31'),
(253, 'U1564936612575ZZB8K', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3485', 'U1564936612575ZZB8K', '2019-08-18 17:20:26', '2019-08-18 17:20:26'),
(254, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.126.242', '2205', 'U1562648024906BEQRM', '2019-08-18 17:56:03', '2019-08-18 17:56:03'),
(255, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.6.140', '4202', 'U1564552533719ZVO7L', '2019-08-19 04:01:49', '2019-08-19 04:01:49'),
(256, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.6.140', '1156', 'U1562648024906BEQRM', '2019-08-19 04:02:04', '2019-08-19 04:02:04'),
(257, 'U1564936612575ZZB8K', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '1254', 'U1564936612575ZZB8K', '2019-08-19 08:35:40', '2019-08-19 08:35:40'),
(258, 'U1565979055462PNQK4', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '4189', 'U1565979055462PNQK4', '2019-08-19 09:13:15', '2019-08-19 09:13:15'),
(259, 'U1564936612575ZZB8K', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '8769', 'U1564936612575ZZB8K', '2019-08-19 09:14:37', '2019-08-19 09:14:37'),
(260, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '2784', 'U1563946300382TN', '2019-08-19 10:50:00', '2019-08-19 10:50:00'),
(261, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '3173', 'U1562648024906BEQRM', '2019-08-19 10:50:22', '2019-08-19 10:50:22'),
(262, 'U1564687600868OQ8K3', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '9866', 'U1564687600868OQ8K3', '2019-08-19 10:59:58', '2019-08-19 10:59:58'),
(263, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '2601', 'U1562648024906BEQRM', '2019-08-19 15:36:52', '2019-08-19 15:36:52'),
(264, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '7855', 'U1562648024906BEQRM', '2019-08-19 16:01:24', '2019-08-19 16:01:24'),
(265, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '8732', 'U1564552533719ZVO7L', '2019-08-19 16:16:54', '2019-08-19 16:16:54'),
(266, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '5423', 'U1564552533719ZVO7L', '2019-08-19 16:20:01', '2019-08-19 16:20:01'),
(267, 'U1564552533719ZVO7L', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '9269', 'U1564552533719ZVO7L', '2019-08-19 16:20:18', '2019-08-19 16:20:18'),
(268, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '1864', 'U1562648024906BEQRM', '2019-08-19 16:21:15', '2019-08-19 16:21:15'),
(269, 'U15643013763824GI17', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '2465', 'U15643013763824GI17', '2019-08-19 16:21:57', '2019-08-19 16:21:57'),
(270, 'U1562648024906BEQRM', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '2702', 'U1562648024906BEQRM', '2019-08-19 16:22:22', '2019-08-19 16:22:22'),
(271, 'U1564687600868OQ8K3', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '1092', 'U1564687600868OQ8K3', '2019-08-19 16:22:40', '2019-08-19 16:22:40'),
(272, 'Ufhksk57389', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '7111', 'Ufhksk57389', '2019-08-19 16:23:32', '2019-08-19 16:23:32'),
(273, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '5181', 'U1564691033253L3VHW', '2019-08-19 16:28:52', '2019-08-19 16:28:52'),
(274, 'U1566232391042N6VDJ', 'family', 'en', 'Web', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '5784', 'U1566232391042N6VDJ', '2019-08-19 16:33:11', '2019-08-19 16:33:11'),
(275, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '5745', 'U1564691033253L3VHW', '2019-08-19 16:35:13', '2019-08-19 16:35:13'),
(276, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '4204', 'U1564691033253L3VHW', '2019-08-19 16:36:02', '2019-08-19 16:36:02'),
(277, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '7075', 'U1565974696264P8D2V', '2019-08-19 16:37:48', '2019-08-19 16:37:48'),
(278, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '8522', 'U1565974696264P8D2V', '2019-08-19 16:40:28', '2019-08-19 16:40:28'),
(279, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '6443', 'U1564691033253L3VHW', '2019-08-19 16:42:08', '2019-08-19 16:42:08'),
(280, 'Ufhksk57389', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '7792', 'Ufhksk57389', '2019-08-19 17:48:45', '2019-08-19 17:48:45'),
(281, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '6416', 'U1565974696264P8D2V', '2019-08-19 18:20:07', '2019-08-19 18:20:07'),
(282, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '6606', 'U1565974696264P8D2V', '2019-08-19 18:31:26', '2019-08-19 18:31:26'),
(283, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '2259', 'U1564691033253L3VHW', '2019-08-19 18:32:34', '2019-08-19 18:32:34'),
(284, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.30', '6653', 'U1565974696264P8D2V', '2019-08-19 18:37:42', '2019-08-19 18:37:42'),
(285, 'U1565979055462PNQK4', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '4650', 'U1565979055462PNQK4', '2019-08-19 23:57:23', '2019-08-19 23:57:23'),
(286, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '7138', 'U1565974696264P8D2V', '2019-08-20 04:19:30', '2019-08-20 04:19:30'),
(287, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '7528', 'U1564691033253L3VHW', '2019-08-20 04:32:30', '2019-08-20 04:32:30'),
(288, 'U1565979055462PNQK4', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '4156', 'U1565979055462PNQK4', '2019-08-20 08:04:46', '2019-08-20 08:04:46'),
(289, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3253', 'U1565974696264P8D2V', '2019-08-20 08:49:38', '2019-08-20 08:49:38'),
(290, 'U1565979055462PNQK4', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '9572', 'U1565979055462PNQK4', '2019-08-20 09:13:31', '2019-08-20 09:13:31'),
(291, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '2264', 'U1565974696264P8D2V', '2019-08-20 09:51:24', '2019-08-20 09:51:24'),
(292, 'U1565979055462PNQK4', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '1503', 'U1565979055462PNQK4', '2019-08-20 10:14:41', '2019-08-20 10:14:41'),
(293, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '3092', 'U1565974696264P8D2V', '2019-08-20 10:30:36', '2019-08-20 10:30:36'),
(294, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9450', 'U1565974696264P8D2V', '2019-08-20 10:55:13', '2019-08-20 10:55:13'),
(295, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.6.140', '6238', 'U1564691033253L3VHW', '2019-08-20 13:23:54', '2019-08-20 13:23:54'),
(296, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '4088', 'U1564691033253L3VHW', '2019-08-20 13:47:21', '2019-08-20 13:47:21'),
(297, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '2722', 'U1565974696264P8D2V', '2019-08-20 14:01:46', '2019-08-20 14:01:46'),
(298, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.122', '2026', 'U1564691033253L3VHW', '2019-08-20 17:30:40', '2019-08-20 17:30:40'),
(299, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.122', '9322', 'U1565974696264P8D2V', '2019-08-20 18:38:24', '2019-08-20 18:38:24'),
(300, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '8673', 'U1565974696264P8D2V', '2019-08-20 20:00:36', '2019-08-20 20:00:36'),
(301, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:73.121.97.85', '4132', 'U1565974696264P8D2V', '2019-08-20 20:41:53', '2019-08-20 20:41:53'),
(302, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '3918', 'U1564691033253L3VHW', '2019-08-21 04:45:40', '2019-08-21 04:45:40'),
(303, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '2844', 'U1564691033253L3VHW', '2019-08-21 05:32:19', '2019-08-21 05:32:19'),
(304, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '5694', 'U1564691033253L3VHW', '2019-08-21 06:15:19', '2019-08-21 06:15:19'),
(305, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '5129', 'U1564691033253L3VHW', '2019-08-21 07:28:38', '2019-08-21 07:28:38'),
(306, 'U15663860761764PPPB', 'family', 'en', 'Web', 'app_version', 'device_id', 'device_token', '::ffff:123.201.6.140', '9631', 'U15663860761764PPPB', '2019-08-21 11:14:36', '2019-08-21 11:14:36'),
(307, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.79.214.203', '1162', 'U1565974696264P8D2V', '2019-08-21 11:30:10', '2019-08-21 11:30:10'),
(308, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.79.214.203', '8177', 'U1565974696264P8D2V', '2019-08-21 11:31:35', '2019-08-21 11:31:35'),
(309, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.79.214.203', '2361', 'U1565974696264P8D2V', '2019-08-21 11:33:02', '2019-08-21 11:33:02'),
(310, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.79.214.203', '8590', 'U1564691033253L3VHW', '2019-08-21 11:33:48', '2019-08-21 11:33:48'),
(311, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.79.214.203', '2068', 'U1564691033253L3VHW', '2019-08-21 11:34:10', '2019-08-21 11:34:10'),
(312, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:73.108.225.85', '4992', 'U1565974696264P8D2V', '2019-08-21 13:09:00', '2019-08-21 13:09:00'),
(313, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:73.108.225.85', '9629', 'U1565974696264P8D2V', '2019-08-21 19:19:18', '2019-08-21 19:19:18'),
(314, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '2538', 'U1565974696264P8D2V', '2019-08-21 22:38:00', '2019-08-21 22:38:00'),
(315, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '5281', 'U1563946300382TN', '2019-08-22 04:35:45', '2019-08-22 04:35:45'),
(316, 'U1566448595016L1OPF', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '4035', 'U1566448595016L1OPF', '2019-08-22 04:39:22', '2019-08-22 04:39:22'),
(317, 'U1566448595016L1OPF', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '2731', 'U1566448595016L1OPF', '2019-08-22 04:42:25', '2019-08-22 04:42:25'),
(318, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '6754', 'U1565974696264P8D2V', '2019-08-22 06:38:20', '2019-08-22 06:38:20'),
(319, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '3661', 'U1564691033253L3VHW', '2019-08-22 07:00:38', '2019-08-22 07:00:38'),
(320, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9942', 'U1565974696264P8D2V', '2019-08-22 12:19:31', '2019-08-22 12:19:31'),
(321, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '5242', 'U1564691033253L3VHW', '2019-08-22 13:11:23', '2019-08-22 13:11:23'),
(322, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '8313', 'U1565974696264P8D2V', '2019-08-22 13:37:56', '2019-08-22 13:37:56'),
(323, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.122', '6755', 'U1564691033253L3VHW', '2019-08-22 15:52:05', '2019-08-22 15:52:05'),
(324, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.122', '1956', 'U1564691033253L3VHW', '2019-08-22 16:59:26', '2019-08-22 16:59:26'),
(325, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.122', '4624', 'U1564691033253L3VHW', '2019-08-22 17:00:28', '2019-08-22 17:00:28'),
(326, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.122', '4686', 'U1564691033253L3VHW', '2019-08-22 17:14:12', '2019-08-22 17:14:12'),
(327, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.122', '9097', 'U1565974696264P8D2V', '2019-08-22 17:14:46', '2019-08-22 17:14:46'),
(328, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:108.238.190.107', '7841', 'U1564691033253L3VHW', '2019-08-22 19:22:10', '2019-08-22 19:22:10'),
(329, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:108.238.190.107', '6277', 'U1565974696264P8D2V', '2019-08-23 01:14:32', '2019-08-23 01:14:32'),
(330, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:108.238.190.107', '2681', 'U1565974696264P8D2V', '2019-08-23 01:39:21', '2019-08-23 01:39:21'),
(331, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:73.113.19.60', '4606', 'U1565974696264P8D2V', '2019-08-23 04:31:04', '2019-08-23 04:31:04'),
(332, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.6.140', '9790', 'U1564691033253L3VHW', '2019-08-23 06:22:12', '2019-08-23 06:22:12'),
(333, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6663', 'U1564691033253L3VHW', '2019-08-23 06:50:53', '2019-08-23 06:50:53'),
(334, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9547', 'U1565974696264P8D2V', '2019-08-23 06:56:03', '2019-08-23 06:56:03'),
(335, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '4306', 'U1565974696264P8D2V', '2019-08-23 07:47:17', '2019-08-23 07:47:17'),
(336, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '2275', 'U1565974696264P8D2V', '2019-08-23 09:24:47', '2019-08-23 09:24:47'),
(337, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '8805', 'U1563946300382TN', '2019-08-23 09:27:25', '2019-08-23 09:27:25'),
(338, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '5228', 'U1565974696264P8D2V', '2019-08-23 09:29:12', '2019-08-23 09:29:12'),
(339, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '4009', 'U1564691033253L3VHW', '2019-08-23 09:29:29', '2019-08-23 09:29:29'),
(340, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '8746', 'U1565974696264P8D2V', '2019-08-23 09:30:13', '2019-08-23 09:30:13'),
(341, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '7758', 'U1564691033253L3VHW', '2019-08-23 09:30:53', '2019-08-23 09:30:53'),
(342, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:73.113.19.60', '4682', 'U1565974696264P8D2V', '2019-08-23 14:08:07', '2019-08-23 14:08:07'),
(343, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7269', 'U1565974696264P8D2V', '2019-08-23 14:23:19', '2019-08-23 14:23:19'),
(344, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '4015', 'U1565974696264P8D2V', '2019-08-23 14:24:58', '2019-08-23 14:24:58'),
(345, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9765', 'U1564691033253L3VHW', '2019-08-23 14:26:27', '2019-08-23 14:26:27'),
(346, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '1612', 'U1564691033253L3VHW', '2019-08-23 14:27:10', '2019-08-23 14:27:10'),
(347, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:73.108.225.85', '8751', 'U1565974696264P8D2V', '2019-08-23 17:18:56', '2019-08-23 17:18:56'),
(348, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:73.108.225.85', '5192', 'U1565974696264P8D2V', '2019-08-23 18:05:16', '2019-08-23 18:05:16'),
(349, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:73.108.225.85', '9708', 'U1564691033253L3VHW', '2019-08-23 19:09:39', '2019-08-23 19:09:39'),
(350, 'U1566611248404RXP9R', 'family', 'en', 'Web', 'app_version', 'device_id', 'device_token', '::ffff:73.121.18.66', '9701', 'U1566611248404RXP9R', '2019-08-24 01:47:28', '2019-08-24 01:47:28'),
(351, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.58', '3147', 'U1563946300382TN', '2019-08-24 10:13:43', '2019-08-24 10:13:43'),
(352, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.58', '5381', 'U1563946300382TN', '2019-08-24 10:14:05', '2019-08-24 10:14:05'),
(353, 'U1566641796512OM3FI', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.58', '1273', 'U1566641796512OM3FI', '2019-08-24 10:17:28', '2019-08-24 10:17:28'),
(354, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.58', '2395', 'U1563946300382TN', '2019-08-24 10:50:12', '2019-08-24 10:50:12'),
(355, 'U1566641796512OM3FI', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.58', '2826', 'U1566641796512OM3FI', '2019-08-24 10:52:29', '2019-08-24 10:52:29'),
(356, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.58', '5246', 'U1563946300382TN', '2019-08-24 11:05:36', '2019-08-24 11:05:36'),
(357, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.58', '6358', 'U1563946300382TN', '2019-08-24 11:14:08', '2019-08-24 11:14:08'),
(358, 'U1566645337030Y6GTU', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.58', '9613', 'U1566645337030Y6GTU', '2019-08-24 11:16:26', '2019-08-24 11:16:26'),
(359, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.58', '7034', 'U1565974696264P8D2V', '2019-08-24 11:30:12', '2019-08-24 11:30:12'),
(360, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.58', '3891', 'U1563946300382TN', '2019-08-24 11:48:09', '2019-08-24 11:48:09'),
(361, 'U156664885285749NP4', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.58', '8800', 'U156664885285749NP4', '2019-08-24 12:15:05', '2019-08-24 12:15:05'),
(362, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.58', '8875', 'U1563946300382TN', '2019-08-24 12:23:25', '2019-08-24 12:23:25'),
(363, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6679', 'U1564691033253L3VHW', '2019-08-25 06:45:51', '2019-08-25 06:45:51'),
(364, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:112.110.74.71', '7657', 'U1563946300382TN', '2019-08-25 06:47:57', '2019-08-25 06:47:57'),
(365, 'U1566715748349ZNN1N', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:112.110.74.71', '8274', 'U1566715748349ZNN1N', '2019-08-25 06:50:59', '2019-08-25 06:50:59'),
(366, 'U156671580274520GND', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:112.110.74.71', '3426', 'U156671580274520GND', '2019-08-25 06:55:01', '2019-08-25 06:55:01'),
(367, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '8984', 'U1565974696264P8D2V', '2019-08-25 06:58:41', '2019-08-25 06:58:41'),
(368, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.19', '5727', 'U1565974696264P8D2V', '2019-08-25 08:56:43', '2019-08-25 08:56:43'),
(369, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.19', '3898', 'U1565974696264P8D2V', '2019-08-25 08:57:33', '2019-08-25 08:57:33'),
(370, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '8334', 'U1564691033253L3VHW', '2019-08-25 09:18:42', '2019-08-25 09:18:42'),
(371, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.19', '9778', 'U1564691033253L3VHW', '2019-08-25 09:33:21', '2019-08-25 09:33:21'),
(372, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3731', 'U1565974696264P8D2V', '2019-08-25 09:34:15', '2019-08-25 09:34:15'),
(373, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9211', 'U1565974696264P8D2V', '2019-08-25 10:30:52', '2019-08-25 10:30:52'),
(374, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.19', '8129', 'U1563946300382TN', '2019-08-25 12:20:06', '2019-08-25 12:20:06'),
(375, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3633', 'U1565974696264P8D2V', '2019-08-25 12:53:56', '2019-08-25 12:53:56'),
(376, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6978', 'U1565974696264P8D2V', '2019-08-25 13:38:03', '2019-08-25 13:38:03'),
(377, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '5733', 'U1564691033253L3VHW', '2019-08-25 14:42:21', '2019-08-25 14:42:21'),
(378, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '5940', 'U1565974696264P8D2V', '2019-08-26 04:34:58', '2019-08-26 04:34:58'),
(379, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '5108', 'U1565974696264P8D2V', '2019-08-26 05:31:08', '2019-08-26 05:31:08'),
(380, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '9568', 'U1565974696264P8D2V', '2019-08-26 06:00:21', '2019-08-26 06:00:21'),
(381, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '9284', 'U1565974696264P8D2V', '2019-08-26 07:38:49', '2019-08-26 07:38:49'),
(382, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '5542', 'U1564691033253L3VHW', '2019-08-26 07:40:19', '2019-08-26 07:40:19'),
(383, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '6045', 'U1564691033253L3VHW', '2019-08-26 09:45:08', '2019-08-26 09:45:08'),
(384, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7738', 'U1563946300382TN', '2019-08-26 15:21:08', '2019-08-26 15:21:08'),
(385, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:197.43.195.162', '8580', 'U1565974696264P8D2V', '2019-08-26 15:45:21', '2019-08-26 15:45:21'),
(386, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:197.43.195.162', '5979', 'U1565974696264P8D2V', '2019-08-26 15:45:27', '2019-08-26 15:45:27'),
(387, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.27', '3705', 'U1564691033253L3VHW', '2019-08-26 16:37:28', '2019-08-26 16:37:28'),
(388, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.27', '1440', 'U1564691033253L3VHW', '2019-08-26 16:37:58', '2019-08-26 16:37:58'),
(389, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.27', '3620', 'U1565974696264P8D2V', '2019-08-26 16:38:08', '2019-08-26 16:38:08'),
(390, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.27', '1515', 'U1564691033253L3VHW', '2019-08-26 16:38:28', '2019-08-26 16:38:28'),
(391, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.27', '5878', 'U1564691033253L3VHW', '2019-08-26 16:39:16', '2019-08-26 16:39:16'),
(392, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:73.108.225.85', '1625', 'U1565974696264P8D2V', '2019-08-26 16:40:02', '2019-08-26 16:40:02'),
(393, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '3411', 'U1563946300382TN', '2019-08-27 05:02:05', '2019-08-27 05:02:05'),
(394, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '4544', 'U1565974696264P8D2V', '2019-08-27 07:10:58', '2019-08-27 07:10:58'),
(395, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6213', 'U1565974696264P8D2V', '2019-08-27 08:04:00', '2019-08-27 08:04:00'),
(396, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7085', 'U1564691033253L3VHW', '2019-08-27 08:13:12', '2019-08-27 08:13:12'),
(397, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7452', 'U1564691033253L3VHW', '2019-08-27 10:13:42', '2019-08-27 10:13:42'),
(398, 'U1564936612575ZZB8K', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3829', 'U1564936612575ZZB8K', '2019-08-27 10:14:48', '2019-08-27 10:14:48'),
(399, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:45.126.144.163', '1749', 'U1564691033253L3VHW', '2019-08-27 16:11:28', '2019-08-27 16:11:28'),
(400, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '4009', 'U1564691033253L3VHW', '2019-08-27 23:38:38', '2019-08-27 23:38:38'),
(401, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '5205', 'U1565974696264P8D2V', '2019-08-27 23:52:46', '2019-08-27 23:52:46'),
(402, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3116', 'U1564691033253L3VHW', '2019-08-28 00:02:37', '2019-08-28 00:02:37'),
(403, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '8320', 'U1563946300382TN', '2019-08-28 04:09:14', '2019-08-28 04:09:14'),
(404, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '8740', 'U1564691033253L3VHW', '2019-08-28 07:43:49', '2019-08-28 07:43:49'),
(405, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7909', 'U1565974696264P8D2V', '2019-08-28 09:13:01', '2019-08-28 09:13:01'),
(406, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.239.249', '7465', 'U1564691033253L3VHW', '2019-08-28 17:29:47', '2019-08-28 17:29:47'),
(407, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '4592', 'U1565974696264P8D2V', '2019-08-28 21:29:56', '2019-08-28 21:29:56'),
(408, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6384', 'U1564691033253L3VHW', '2019-08-28 21:39:05', '2019-08-28 21:39:05'),
(409, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '2758', 'U1564691033253L3VHW', '2019-08-29 06:13:14', '2019-08-29 06:13:14'),
(410, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '7072', 'U1565974696264P8D2V', '2019-08-29 10:26:20', '2019-08-29 10:26:20'),
(411, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.227.112', '5253', 'U1565974696264P8D2V', '2019-08-29 15:12:50', '2019-08-29 15:12:50'),
(412, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:71.69.78.180', '8793', 'U1565974696264P8D2V', '2019-08-29 16:11:24', '2019-08-29 16:11:24'),
(413, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.227.112', '7328', 'U1565974696264P8D2V', '2019-08-29 16:23:18', '2019-08-29 16:23:18'),
(414, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:71.69.78.180', '5062', 'U1564691033253L3VHW', '2019-08-29 16:27:28', '2019-08-29 16:27:28'),
(415, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.227.112', '4811', 'U1564691033253L3VHW', '2019-08-29 17:02:43', '2019-08-29 17:02:43'),
(416, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.76.85.133', '2943', 'U1565974696264P8D2V', '2019-08-29 19:15:24', '2019-08-29 19:15:24'),
(417, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '9387', 'U1565974696264P8D2V', '2019-08-30 04:21:19', '2019-08-30 04:21:19'),
(418, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '5163', 'U1565974696264P8D2V', '2019-08-30 07:18:19', '2019-08-30 07:18:19'),
(419, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '2144', 'U1564691033253L3VHW', '2019-08-30 08:10:22', '2019-08-30 08:10:22'),
(420, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '4202', 'U1564691033253L3VHW', '2019-08-30 08:45:56', '2019-08-30 08:45:56'),
(421, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '4663', 'U1564691033253L3VHW', '2019-08-30 10:42:56', '2019-08-30 10:42:56'),
(422, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '7855', 'U1565974696264P8D2V', '2019-08-30 11:28:38', '2019-08-30 11:28:38'),
(423, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.203', '3883', 'U1565974696264P8D2V', '2019-08-30 15:23:52', '2019-08-30 15:23:52'),
(424, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.203', '2972', 'U1564691033253L3VHW', '2019-08-30 15:34:24', '2019-08-30 15:34:24'),
(425, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.203', '8485', 'U1565974696264P8D2V', '2019-08-30 17:24:53', '2019-08-30 17:24:53'),
(426, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.226.203', '6790', 'U1564691033253L3VHW', '2019-08-30 17:25:39', '2019-08-30 17:25:39'),
(427, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:49.34.103.39', '2527', 'U1565974696264P8D2V', '2019-08-30 19:08:20', '2019-08-30 19:08:20'),
(428, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:49.34.103.39', '4958', 'U1565974696264P8D2V', '2019-08-30 19:09:25', '2019-08-30 19:09:25'),
(429, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '5246', 'U1564691033253L3VHW', '2019-08-30 22:47:16', '2019-08-30 22:47:16'),
(430, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.189', '2082', 'U1564691033253L3VHW', '2019-08-31 05:37:29', '2019-08-31 05:37:29'),
(431, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.189', '2932', 'U1564691033253L3VHW', '2019-08-31 05:38:19', '2019-08-31 05:38:19'),
(432, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.189', '1895', 'U1565974696264P8D2V', '2019-08-31 05:38:37', '2019-08-31 05:38:37'),
(433, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.189', '5520', 'U1565974696264P8D2V', '2019-08-31 05:39:45', '2019-08-31 05:39:45'),
(434, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.189', '1267', 'U1565974696264P8D2V', '2019-08-31 05:40:27', '2019-08-31 05:40:27'),
(435, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.189', '1247', 'U1564691033253L3VHW', '2019-08-31 05:40:43', '2019-08-31 05:40:43'),
(436, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.189', '5256', 'U1564691033253L3VHW', '2019-08-31 06:12:31', '2019-08-31 06:12:31'),
(437, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3084', 'U1564691033253L3VHW', '2019-08-31 09:03:58', '2019-08-31 09:03:58'),
(438, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '4592', 'U1565974696264P8D2V', '2019-08-31 09:13:55', '2019-08-31 09:13:55'),
(439, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:219.91.238.189', '1681', 'U1565974696264P8D2V', '2019-08-31 11:18:41', '2019-08-31 11:18:41'),
(440, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.138.250', '5945', 'U1565974696264P8D2V', '2019-08-31 18:22:31', '2019-08-31 18:22:31'),
(441, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.138.250', '1769', 'U1565974696264P8D2V', '2019-08-31 18:26:22', '2019-08-31 18:26:22'),
(442, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.77.138.250', '6194', 'U1565974696264P8D2V', '2019-08-31 18:30:43', '2019-08-31 18:30:43'),
(443, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.225.25', '8356', 'U1565974696264P8D2V', '2019-09-01 06:19:50', '2019-09-01 06:19:50'),
(444, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9773', 'U1564691033253L3VHW', '2019-09-01 09:24:05', '2019-09-01 09:24:05'),
(445, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.228.7', '5239', 'U1565974696264P8D2V', '2019-09-01 16:29:13', '2019-09-01 16:29:13'),
(446, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.228.7', '6743', 'U1565974696264P8D2V', '2019-09-01 16:35:20', '2019-09-01 16:35:20'),
(447, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:106.79.220.4', '7030', 'U1565974696264P8D2V', '2019-09-01 16:45:58', '2019-09-01 16:45:58'),
(448, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '4674', 'U1565974696264P8D2V', '2019-09-02 05:44:52', '2019-09-02 05:44:52'),
(449, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '8516', 'U1565974696264P8D2V', '2019-09-02 06:47:14', '2019-09-02 06:47:14'),
(450, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6542', 'U1563946300382TN', '2019-09-02 08:45:28', '2019-09-02 08:45:28'),
(451, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '6870', 'U1564691033253L3VHW', '2019-09-02 10:37:00', '2019-09-02 10:37:00'),
(452, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '7376', 'U1565974696264P8D2V', '2019-09-03 04:52:55', '2019-09-03 04:52:55'),
(453, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '5717', 'U1563946300382TN', '2019-09-03 06:47:47', '2019-09-03 06:47:47'),
(454, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '2662', 'U1565974696264P8D2V', '2019-09-03 09:00:36', '2019-09-03 09:00:36'),
(455, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '5514', 'U1564691033253L3VHW', '2019-09-03 09:58:42', '2019-09-03 09:58:42'),
(456, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:172.56.7.186', '9824', 'U1565974696264P8D2V', '2019-09-03 14:06:31', '2019-09-03 14:06:31'),
(457, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:172.56.7.186', '2115', 'U1565974696264P8D2V', '2019-09-03 14:06:31', '2019-09-03 14:06:31'),
(458, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:123.201.227.0', '8044', 'U1565974696264P8D2V', '2019-09-03 15:55:54', '2019-09-03 15:55:54'),
(459, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '8597', 'U1565974696264P8D2V', '2019-09-03 18:11:42', '2019-09-03 18:11:42'),
(460, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:75.3.253.72', '2016', 'U1565974696264P8D2V', '2019-09-03 20:26:18', '2019-09-03 20:26:18'),
(461, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '6287', 'U1565974696264P8D2V', '2019-09-04 09:33:35', '2019-09-04 09:33:35'),
(462, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '9272', 'U1565974696264P8D2V', '2019-09-04 10:30:26', '2019-09-04 10:30:26'),
(463, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:1.22.54.75', '4091', 'U1565974696264P8D2V', '2019-09-05 05:47:32', '2019-09-05 05:47:32'),
(464, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:73.121.117.8', '1068', 'U1564691033253L3VHW', '2019-09-08 13:27:20', '2019-09-08 13:27:20'),
(465, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:73.121.117.8', '7772', 'U1565974696264P8D2V', '2019-09-08 13:45:46', '2019-09-08 13:45:46'),
(466, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:43.248.36.203', '2470', 'U1565974696264P8D2V', '2019-09-15 05:47:22', '2019-09-15 05:47:22'),
(467, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:43.248.36.203', '8713', 'U1564691033253L3VHW', '2019-09-15 05:48:48', '2019-09-15 05:48:48'),
(468, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9717', 'U1563946300382TN', '2019-09-17 14:42:18', '2019-09-17 14:42:18'),
(469, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '1381', 'U1563946300382TN', '2019-09-17 14:42:18', '2019-09-17 14:42:18'),
(470, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9294', 'U1563946300382TN', '2019-09-17 14:42:19', '2019-09-17 14:42:19'),
(471, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '2972', 'U1563946300382TN', '2019-09-17 14:43:14', '2019-09-17 14:43:14'),
(472, 'U1563946300382TN', 'super_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7628', 'U1563946300382TN', '2019-09-17 14:44:04', '2019-09-17 14:44:04'),
(473, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '3499', 'U1565974696264P8D2V', '2019-09-17 14:55:12', '2019-09-17 14:55:12'),
(474, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:49.36.156.117', '5974', 'U1565974696264P8D2V', '2019-09-17 14:56:49', '2019-09-17 14:56:49'),
(475, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9634', 'U1564691033253L3VHW', '2019-09-17 14:57:36', '2019-09-17 14:57:36'),
(476, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:122.161.192.65', '1449', 'U1565974696264P8D2V', '2019-09-18 05:29:28', '2019-09-18 05:29:28'),
(477, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:122.161.192.65', '1643', 'U1565974696264P8D2V', '2019-09-18 07:56:33', '2019-09-18 07:56:33'),
(478, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '9446', 'U1564691033253L3VHW', '2019-09-18 09:27:52', '2019-09-18 09:27:52'),
(479, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '5061', 'U1565974696264P8D2V', '2019-09-18 09:32:01', '2019-09-18 09:32:01'),
(480, 'U1565979055462PNQK4', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '5336', 'U1565979055462PNQK4', '2019-09-18 09:32:54', '2019-09-18 09:32:54'),
(481, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '6734', 'U1565974696264P8D2V', '2019-09-18 09:33:30', '2019-09-18 09:33:30'),
(482, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '8109', 'U1565974696264P8D2V', '2019-09-18 09:34:02', '2019-09-18 09:34:02'),
(483, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:35.132.248.56', '7735', 'U1564691033253L3VHW', '2019-09-18 09:34:13', '2019-09-18 09:34:13'),
(484, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:61.246.139.249', '4655', 'U1564691033253L3VHW', '2019-09-18 12:55:59', '2019-09-18 12:55:59'),
(485, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:61.246.139.249', '9925', 'U1564691033253L3VHW', '2019-09-18 13:01:55', '2019-09-18 13:01:55'),
(486, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:114.241.68.37', '4001', 'U1564691033253L3VHW', '2019-09-18 17:26:09', '2019-09-18 17:26:09'),
(487, 'U1565974696264P8D2V', 'family', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:114.241.68.37', '4033', 'U1565974696264P8D2V', '2019-09-18 17:30:19', '2019-09-18 17:30:19'),
(488, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:46.244.29.241', '3437', 'U1564691033253L3VHW', '2019-09-18 17:39:36', '2019-09-18 17:39:36'),
(489, 'U1564691033253L3VHW', 'school_admin', 'en', 'Android', 'app_version', 'device_id', 'device_token', '::ffff:46.244.29.241', '9572', 'U1564691033253L3VHW', '2019-09-19 08:54:46', '2019-09-19 08:54:46');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT 'Male',
  `birth_date` datetime DEFAULT NULL,
  `grade_level` enum('1st Grade','2nd Grade','3rd Grade','4th Grade','5th Grade','6th Grade','7th Grade','8th Grade','9th Grade','10th Grade','11th Grade','12th Grade','Kindergarten','Adult','1 Year Of College','2 Years Of College','3 Years Of College','4 Years Of College') DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `school_info` text,
  `status` enum('active','banned') DEFAULT 'active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tag` varchar(255) DEFAULT '',
  `school_address` varchar(255) DEFAULT NULL,
  `school_phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `first_name`, `last_name`, `middle_name`, `gender`, `birth_date`, `grade_level`, `program`, `school_info`, `status`, `created_at`, `updated_at`, `tag`, `school_address`, `school_phone`) VALUES
('S1563450361836I1USP', 'U1563447543532W2MGC', 'sdf', 'sdf', 'sdf', 'Female', '2019-07-18 18:30:00', '3rd Grade', 'P1562646914363L5OE0', 'dsfsdf', 'active', '2019-07-18 11:46:01', '2019-07-18 11:46:01', '', NULL, NULL),
('S1563598144203KQ8A7', 'U1563448796805UMUVV', 'milan b', 'bhikadiya', 'G', 'Male', '2009-07-14 18:30:00', '10th Grade', 'P156264691436335P71', 'school info', 'active', '2019-07-20 04:49:04', '2019-07-29 16:13:20', '', NULL, NULL),
('S1563884405465A13PK', 'U1563448910304GPW70', 'Chetan', 'Nakum', 'D', 'Male', '1992-07-19 18:30:00', '1st Grade', 'P156264691436335P71', 'Test', 'active', '2019-07-23 12:20:05', '2019-07-23 12:20:05', '', NULL, NULL),
('S1564301419592L76BV', 'U15643013763824GI17', 'jkjhg', 'klhjh', 'kljh', 'Male', '2019-07-18 18:30:00', '10th Grade', 'P1562646914363L5OE0', 'okojikh', 'active', '2019-07-28 08:10:19', '2019-07-28 08:10:19', '', NULL, NULL),
('S1564416871786370NM', 'U1563448796805UMUVV', 'kiran gahdiya', 'sdfbf', 'bfd', 'Male', '2019-07-09 18:30:00', '9th Grade', 'P156264691436335P71', 'hfgdfhgdf', 'active', '2019-07-29 16:14:31', '2019-07-29 16:14:31', '', NULL, NULL),
('S1564478142804EJF4R', 'U1563550437349RD9W4', 'Ian', 'Smith', 'S', 'Male', '2012-07-04 04:00:00', '2nd Grade', 'P156264691436335P71', 'ABC', 'active', '2019-07-30 09:15:42', '2019-07-30 09:15:42', '', NULL, NULL),
('S1564644980055V3RUO', 'U1563448910304GPW70', 'Kishan', 'Kothari', 'D', 'Male', '2019-07-31 18:30:00', 'Kindergarten', NULL, 'Kl school', 'active', '2019-08-01 07:36:20', '2019-08-01 07:36:20', 'Default', 'Surat', '9898989898'),
('S1564645670221P6UJN', 'U1562648024906BEQRM', 'Vishal', 'Thummar', 'Middle name', 'Male', '2012-08-15 18:30:00', 'Kindergarten', NULL, 'School info', 'active', '2019-08-01 07:47:50', '2019-08-01 07:47:50', 'Test123', 'Address is address', 'My mobile number'),
('S15646456704661YDVR', 'U1562648024906BEQRM', 'Vishal', 'Thummar', 'Middle name', 'Male', '2012-08-15 18:30:00', 'Kindergarten', NULL, 'School info', 'active', '2019-08-01 07:47:50', '2019-08-01 07:47:50', 'Test123', 'Address is address', 'My mobile number'),
('S1565158437721JKXJY', 'U1562648024906BEQRM', 'sdfds', 'sdf', 'sdf', 'Female', '2019-08-22 18:30:00', '2nd Grade', NULL, 'dsf', 'active', '2019-08-07 06:13:57', '2019-08-07 06:13:57', 'Default', 'sdf', 'sdf'),
('S1565256707447XH0X3', 'U1563550437349RD9W4', 'Renee', 'Smith', 'S', 'Female', '2009-08-11 04:00:00', '5th Grade', NULL, 'XYZ', 'active', '2019-08-08 09:31:47', '2019-08-08 09:31:47', 'Default', 'XYZ', 'XYZ'),
('S15652963233851AEKW', 'U1563550437349RD9W4', 'Victoria', 'smith', 's', 'Female', '2005-01-12 05:00:00', '4th Grade', NULL, 'School', 'active', '2019-08-08 20:32:03', '2019-08-08 20:32:03', 'Default', '311 Bowie St, Unit 2314', '3458150707'),
('S1565998932563JSG9X', 'U1564936612575ZZB8K', 'Ian', 'Smith', 'S', 'Male', '2006-02-22 05:00:00', '8th Grade', NULL, 'Test', 'active', '2019-08-16 23:42:12', '2019-08-16 23:42:12', 'Default', 'Test', 'Tewst'),
('S1566206116812HRCQ1', 'U1564936612575ZZB8K', 'Renee', 'Smith', 'S', 'Female', '2009-08-10 04:00:00', '5th Grade', NULL, 'Test', 'active', '2019-08-19 09:15:16', '2019-08-19 09:15:16', 'Default', 'Test', 'Test'),
('S15662376717438STAS', 'U1565974696264P8D2V', 'test', 'kjlhkghbnh', 'kl;jlghj', 'Male', '1990-01-04 18:30:00', 'Adult', 'P156264691436335P71', NULL, 'active', '2019-08-19 18:01:11', '2019-08-31 12:47:16', 'Default', NULL, NULL),
('S15674495116486D4Y8', 'U1565974696264P8D2V', 'Gy', 'Gg', 'Tfg', 'Male', '2019-09-04 18:30:00', '6th Grade', NULL, NULL, 'active', '2019-09-02 18:38:31', '2019-09-02 18:38:31', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_attendances`
--

CREATE TABLE `student_attendances` (
  `id` varchar(255) NOT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `student_year_id` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `attendance` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_attendances`
--

INSERT INTO `student_attendances` (`id`, `student_id`, `student_year_id`, `year`, `month`, `attendance`, `created_at`, `updated_at`) VALUES
('SA1563450426202OMFJ', 'S1563450361836I1USP', 'SY1563450378701T2NO', '2019', '07', '[{"date":1,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.200Z","updated_at":"2019-07-18T11:47:06.200Z"},{"date":2,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.200Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":3,"student_status":"P","status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":4,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":5,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":6,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":7,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":8,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":9,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":10,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":11,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":12,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":13,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":14,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":15,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":16,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":17,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":18,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":19,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":20,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":21,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":22,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":23,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":24,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":25,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":26,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":27,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":28,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":29,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":30,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"},{"date":31,"student_status":null,"status":"Pending","created_at":"2019-07-18T11:47:06.201Z","updated_at":"2019-07-18T11:47:06.201Z"}]', '2019-07-18 11:47:06', '2019-07-18 11:47:06'),
('SA15644800646360VB1', 'S1564478142804EJF4R', 'SY1564478161974EUXE', '2019', '08', '[{"date":1,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:47:44.632Z","updated_at":"2019-07-30T09:47:44.632Z"},{"date":2,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-06T07:48:04.506Z"},{"date":3,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-10T00:45:23.824Z"},{"date":4,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-10T00:45:44.791Z"},{"date":5,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-07-30T09:47:44.633Z"},{"date":6,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-10T00:45:33.229Z"},{"date":7,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-07-30T09:47:44.633Z"},{"date":8,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-07-30T09:47:44.633Z"},{"date":9,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-10T00:45:54.325Z"},{"date":10,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-10T00:46:32.344Z"},{"date":11,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-10T00:47:36.238Z"},{"date":12,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-10T00:47:53.510Z"},{"date":13,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-10T00:45:28.524Z"},{"date":14,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-07-30T09:47:44.633Z"},{"date":15,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-07-30T09:47:44.633Z"},{"date":16,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-05T15:52:53.451Z"},{"date":17,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-05T15:52:50.275Z"},{"date":18,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-10T00:46:27.898Z"},{"date":19,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-08T09:22:35.729Z"},{"date":20,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-08T09:22:36.342Z"},{"date":21,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-07-30T09:47:44.633Z"},{"date":22,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-07-30T09:47:44.633Z"},{"date":23,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-08T09:22:51.695Z"},{"date":24,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-08T09:22:51.370Z"},{"date":25,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-08T09:22:39.342Z"},{"date":26,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-08T09:22:37.123Z"},{"date":27,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-08-08T09:22:36.755Z"},{"date":28,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-07-30T09:47:44.633Z"},{"date":29,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-07-30T09:47:44.633Z"},{"date":30,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-07-30T09:47:44.633Z"},{"date":31,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:47:44.633Z","updated_at":"2019-07-30T09:47:44.633Z"}]', '2019-07-30 09:47:44', '2019-08-10 00:47:53'),
('SA1564480089489MZ6Z', 'S1564478142804EJF4R', 'SY1564478161974EUXE', '2019', '10', '[{"date":1,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":2,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":3,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":4,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":5,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":6,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":7,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":8,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":9,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":10,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":11,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":12,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":13,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":14,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":15,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":16,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":17,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":18,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":19,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":20,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":21,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":22,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.488Z","updated_at":"2019-07-30T09:48:09.488Z"},{"date":23,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.489Z","updated_at":"2019-07-30T09:48:09.489Z"},{"date":24,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.489Z","updated_at":"2019-07-30T09:48:09.489Z"},{"date":25,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.489Z","updated_at":"2019-07-30T09:48:09.489Z"},{"date":26,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.489Z","updated_at":"2019-07-30T09:48:09.489Z"},{"date":27,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.489Z","updated_at":"2019-07-30T09:48:09.489Z"},{"date":28,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.489Z","updated_at":"2019-07-30T09:48:09.489Z"},{"date":29,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.489Z","updated_at":"2019-07-30T09:48:09.489Z"},{"date":30,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.489Z","updated_at":"2019-07-30T09:48:09.489Z"},{"date":31,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:48:09.489Z","updated_at":"2019-07-30T09:48:09.489Z"}]', '2019-07-30 09:48:09', '2019-07-30 09:48:09'),
('SA15644803196542F2K', 'S1564478142804EJF4R', 'SY1564478161974EUXE', '2019', '11', '[{"date":1,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":2,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":3,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":4,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":5,"student_status":"P","status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":6,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":7,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":8,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":9,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":10,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":11,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":12,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":13,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":14,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":15,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":16,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":17,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":18,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":19,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":20,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":21,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":22,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":23,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":24,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":25,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":26,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":27,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":28,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":29,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"},{"date":30,"student_status":null,"status":"Pending","created_at":"2019-07-30T09:51:59.653Z","updated_at":"2019-07-30T09:51:59.653Z"}]', '2019-07-30 09:51:59', '2019-07-30 09:51:59'),
('SA1564678070164H8Y8', 'S1564645670221P6UJN', 'SY1564645690277OO5Y', '2019', '06', '[{"date":1,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.154Z","updated_at":"2019-08-01T16:47:50.154Z"},{"date":2,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.154Z","updated_at":"2019-08-01T16:47:50.154Z"},{"date":3,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.154Z","updated_at":"2019-08-01T16:47:50.154Z"},{"date":4,"student_status":"P","status":"Pending","created_at":"2019-08-01T16:47:50.154Z","updated_at":"2019-08-05T15:55:32.963Z"},{"date":5,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.154Z","updated_at":"2019-08-01T16:47:50.154Z"},{"date":6,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.154Z","updated_at":"2019-08-01T16:47:50.154Z"},{"date":7,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.154Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":8,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":9,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":10,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":11,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":12,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":13,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":14,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":15,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":16,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":17,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":18,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":19,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":20,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":21,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":22,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":23,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":24,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":25,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"},{"date":26,"student_status":"A","status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T17:05:01.406Z"},{"date":27,"student_status":"P","status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:52:09.551Z"},{"date":28,"student_status":"A","status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T17:05:10.285Z"},{"date":29,"student_status":"A","status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:52:54.438Z"},{"date":30,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:47:50.155Z","updated_at":"2019-08-01T16:47:50.155Z"}]', '2019-08-01 16:47:50', '2019-08-05 15:55:32'),
('SA1564678497879BQFW', 'S1564645670221P6UJN', 'SY1564645690277OO5Y', '2019', '03', '[{"date":1,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":2,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":3,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":4,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":5,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":6,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":7,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":8,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":9,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":10,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":11,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":12,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":13,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":14,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":15,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":16,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":17,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":18,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":19,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":20,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":21,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":22,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":23,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":24,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":25,"student_status":"A","status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:57:54.888Z"},{"date":26,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":27,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":28,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":29,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":30,"student_status":null,"status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"},{"date":31,"student_status":"P","status":"Pending","created_at":"2019-08-01T16:54:57.876Z","updated_at":"2019-08-01T16:54:57.876Z"}]', '2019-08-01 16:54:57', '2019-08-01 16:57:54'),
('SA1564691175256SSCH', 'S1564478142804EJF4R', 'SY1564478161974EUXE', '2019', '09', '[{"date":1,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.252Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":2,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":3,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":4,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":5,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":6,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":7,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":8,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":9,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":10,"student_status":"P","status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":11,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":12,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":13,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":14,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":15,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":16,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":17,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":18,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":19,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":20,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":21,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":22,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":23,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":24,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":25,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":26,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":27,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":28,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.253Z"},{"date":29,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.253Z","updated_at":"2019-08-01T20:26:15.254Z"},{"date":30,"student_status":null,"status":"Pending","created_at":"2019-08-01T20:26:15.254Z","updated_at":"2019-08-01T20:26:15.254Z"}]', '2019-08-01 20:26:15', '2019-08-01 20:26:15'),
('SA1566036332040KJZK', 'S1565998932563JSG9X', 'SY1565998942661FAZ4', '2019', '08', '[{"date":1,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":2,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":3,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":4,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":5,"student_status":"P","status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":6,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":7,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":8,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":9,"student_status":"P","status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:58.786Z"},{"date":10,"student_status":"P","status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-31T10:16:36.793Z"},{"date":11,"student_status":"A","status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-31T10:17:04.628Z"},{"date":12,"student_status":"A","status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-31T10:16:56.418Z"},{"date":13,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":14,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":15,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":16,"student_status":"P","status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-18T17:22:08.787Z"},{"date":17,"student_status":"P","status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-18T17:22:09.276Z"},{"date":18,"student_status":"P","status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:06:00.583Z"},{"date":19,"student_status":"P","status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:06:00.161Z"},{"date":20,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":21,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":22,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":23,"student_status":"P","status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:06:01.924Z"},{"date":24,"student_status":"P","status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:06:01.537Z"},{"date":25,"student_status":"P","status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-18T17:22:09.824Z"},{"date":26,"student_status":"P","status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-18T17:22:10.411Z"},{"date":27,"student_status":"P","status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-18T17:22:11.040Z"},{"date":28,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":29,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":30,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"},{"date":31,"student_status":null,"status":"Pending","created_at":"2019-08-17T10:05:32.038Z","updated_at":"2019-08-17T10:05:32.038Z"}]', '2019-08-17 10:05:32', '2019-08-31 10:17:04'),
('SA1566295219851S3AX', 'S1566232602720HJ500', 'SY1566295061551V5VA', '2019', '08', '[{"date":1,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.847Z","updated_at":"2019-08-20T10:00:19.847Z"},{"date":2,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.847Z","updated_at":"2019-08-20T10:00:19.847Z"},{"date":3,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.847Z","updated_at":"2019-08-20T10:00:19.847Z"},{"date":4,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.847Z","updated_at":"2019-08-20T10:00:19.847Z"},{"date":5,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.848Z","updated_at":"2019-08-20T10:00:19.848Z"},{"date":6,"student_status":"P","status":"Pending","created_at":"2019-08-20T10:00:19.848Z","updated_at":"2019-08-20T10:00:19.848Z"},{"date":7,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.848Z","updated_at":"2019-08-20T10:00:19.848Z"},{"date":8,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"},{"date":9,"student_status":"P","status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:42.551Z"},{"date":10,"student_status":"P","status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:41.974Z"},{"date":11,"student_status":"P","status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:41.204Z"},{"date":12,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"},{"date":13,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"},{"date":14,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"},{"date":15,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"},{"date":16,"student_status":"P","status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:40.278Z"},{"date":17,"student_status":"P","status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:43.063Z"},{"date":18,"student_status":"P","status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:43.463Z"},{"date":19,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"},{"date":20,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"},{"date":21,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"},{"date":22,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"},{"date":23,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"},{"date":24,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"},{"date":25,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"},{"date":26,"student_status":"P","status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:44.093Z"},{"date":27,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"},{"date":28,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"},{"date":29,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"},{"date":30,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"},{"date":31,"student_status":null,"status":"Pending","created_at":"2019-08-20T10:00:19.849Z","updated_at":"2019-08-20T10:00:19.849Z"}]', '2019-08-20 10:00:19', '2019-08-20 10:00:44'),
('SA1566334019167YR4N', 'S1566232602720HJ500', 'SY1566295061551V5VA', '2019', '09', '[{"date":1,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:46:59.164Z","updated_at":"2019-08-20T20:48:50.931Z"},{"date":2,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:46:59.164Z","updated_at":"2019-08-20T20:46:59.164Z"},{"date":3,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:46:59.164Z","updated_at":"2019-08-20T20:46:59.164Z"},{"date":4,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:46:59.164Z","updated_at":"2019-08-20T20:48:07.442Z"},{"date":5,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:46:59.164Z","updated_at":"2019-08-20T20:46:59.165Z"},{"date":6,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:48:15.775Z"},{"date":7,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:46:59.165Z"},{"date":8,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:48:08.410Z"},{"date":9,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:46:59.165Z"},{"date":10,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:46:59.165Z"},{"date":11,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:46:59.165Z"},{"date":12,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:46:59.165Z"},{"date":13,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:46:59.165Z"},{"date":14,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:48:16.691Z"},{"date":15,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:47:32.973Z"},{"date":16,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:47:33.605Z"},{"date":17,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:47:34.109Z"},{"date":18,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:47:34.632Z"},{"date":19,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:46:59.165Z"},{"date":20,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:46:59.165Z"},{"date":21,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:48:17.129Z"},{"date":22,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:47:39.275Z"},{"date":23,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:47:38.796Z"},{"date":24,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:48:12.923Z"},{"date":25,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:47:42.499Z"},{"date":26,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:46:59.165Z"},{"date":27,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:46:59.165Z"},{"date":28,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:46:59.165Z"},{"date":29,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:48:09.430Z"},{"date":30,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:46:59.165Z","updated_at":"2019-08-20T20:46:59.165Z"}]', '2019-08-20 20:46:59', '2019-08-20 20:48:50'),
('SA1566334027555ZZAP', 'S1566232602720HJ500', 'SY1566295061551V5VA', '2019', '10', '[{"date":1,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-20T20:47:07.553Z"},{"date":2,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-20T20:47:07.553Z"},{"date":3,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-20T20:47:07.553Z"},{"date":4,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:34:49.363Z"},{"date":5,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:34:52.449Z"},{"date":6,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:34:52.000Z"},{"date":7,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:34:51.559Z"},{"date":8,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-20T20:47:07.553Z"},{"date":9,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-20T20:47:07.553Z"},{"date":10,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-20T20:47:07.553Z"},{"date":11,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:34:49.492Z"},{"date":12,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:34:49.880Z"},{"date":13,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:34:50.268Z"},{"date":14,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:34:51.198Z"},{"date":15,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-20T20:47:07.553Z"},{"date":16,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-20T20:47:07.553Z"},{"date":17,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-20T20:47:07.553Z"},{"date":18,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:34:54.633Z"},{"date":19,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:34:53.982Z"},{"date":20,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:34:55.686Z"},{"date":21,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:34:56.235Z"},{"date":22,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:34:56.659Z"},{"date":23,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-20T20:47:07.553Z"},{"date":24,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-20T20:47:07.553Z"},{"date":25,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:34:59.093Z"},{"date":26,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:34:59.534Z"},{"date":27,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:34:55.241Z"},{"date":28,"student_status":"P","status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-23T18:35:00.645Z"},{"date":29,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:47:07.553Z","updated_at":"2019-08-20T20:47:07.553Z"},{"date":30,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:47:07.554Z","updated_at":"2019-08-20T20:47:07.554Z"},{"date":31,"student_status":null,"status":"Pending","created_at":"2019-08-20T20:47:07.554Z","updated_at":"2019-08-20T20:47:07.554Z"}]', '2019-08-20 20:47:07', '2019-08-23 18:35:00');
INSERT INTO `student_attendances` (`id`, `student_id`, `student_year_id`, `year`, `month`, `attendance`, `created_at`, `updated_at`) VALUES
('SA15673459950640QYM', 'S15662376717438STAS', 'SY156725565241238OH', '2017', '08', '[{"date":1,"student_status":"P","status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.060Z"},{"date":2,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.060Z"},{"date":3,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.060Z"},{"date":4,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.060Z"},{"date":5,"student_status":"P","status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-03T19:29:22.156Z"},{"date":6,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.060Z"},{"date":7,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.060Z"},{"date":8,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.060Z"},{"date":9,"student_status":"P","status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T16:46:18.044Z"},{"date":10,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.060Z"},{"date":11,"student_status":"P","status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-08T13:50:29.201Z"},{"date":12,"student_status":"P","status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-08T13:50:28.509Z"},{"date":13,"student_status":"P","status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-08T13:50:28.149Z"},{"date":14,"student_status":"P","status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T16:46:19.329Z"},{"date":15,"student_status":"P","status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-03T19:29:13.205Z"},{"date":16,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.060Z"},{"date":17,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.060Z"},{"date":18,"student_status":"P","status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-03T19:29:14.019Z"},{"date":19,"student_status":"P","status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-03T19:29:13.758Z"},{"date":20,"student_status":"P","status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-03T19:29:11.301Z"},{"date":21,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.060Z"},{"date":22,"student_status":"P","status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-03T19:29:12.758Z"},{"date":23,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.060Z"},{"date":24,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.060Z"},{"date":25,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.060Z"},{"date":26,"student_status":"P","status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-03T19:29:11.822Z"},{"date":27,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.060Z"},{"date":28,"student_status":"P","status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-03T19:29:12.161Z"},{"date":29,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.060Z"},{"date":30,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.060Z","updated_at":"2019-09-01T13:53:15.061Z"},{"date":31,"student_status":null,"status":"Pending","created_at":"2019-09-01T13:53:15.061Z","updated_at":"2019-09-01T13:53:15.061Z"}]', '2019-09-01 13:53:15', '2019-09-08 13:50:29');

-- --------------------------------------------------------

--
-- Table structure for table `student_awards`
--

CREATE TABLE `student_awards` (
  `id` varchar(255) NOT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Active','Expired') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_awards`
--

INSERT INTO `student_awards` (`id`, `student_id`, `activity`, `title`, `desc`, `start_date`, `end_date`, `created_at`, `updated_at`, `user_id`, `status`) VALUES
('SA15649332657151IQ1', 'S1564478142804EJF4R', 'Academic', 'Dean\'s List', 'Dean\'s List', '2019-08-04 04:00:00', '2019-08-10 04:00:00', '2019-08-04 15:41:05', '2019-08-17 10:14:33', 'U1563550437349RD9W4', 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `student_courses`
--

CREATE TABLE `student_courses` (
  `id` varchar(255) NOT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `student_year_id` varchar(255) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `credit` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `course_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_courses`
--

INSERT INTO `student_courses` (`id`, `student_id`, `student_year_id`, `course_id`, `semester`, `grade`, `credit`, `created_at`, `updated_at`, `resource`, `course_type`) VALUES
('SC1563610458501YP3F', 'S1563598144203KQ8A7', 'SY1563610430973BRWH', 'C1562646914373JWPZ', 'FALL', 'B-', '0.25', '2019-07-20 08:14:18', '2019-07-20 08:14:18', NULL, NULL),
('SC1564645741857ESXP', 'S1564645670221P6UJN', 'SY1564645690277OO5Y', 'C1562646914373LWWH', 'SPRING', 'B+', '1.00', '2019-08-01 07:49:01', '2019-08-01 07:49:01', 'Resources', 'Honors'),
('SC1565256976930YK1M', 'S1564478142804EJF4R', 'SY1564478161974EUXE', 'C15646870052690I0W', 'FALL', 'A-', '1.00', '2019-08-08 09:36:16', '2019-08-08 09:36:16', 'Testbook', 'AP Course'),
('SC1566203824131SXXV', 'S1565998932563JSG9X', 'SY1565998942661FAZ4', 'C1565107753421QVO5', 'FALL', 'A', NULL, '2019-08-19 08:37:04', '2019-08-19 08:37:04', 'Other', 'None'),
('SC1566295082803F022', 'S1566232602720HJ500', 'SY1566295061551V5VA', 'C15651077534216505', 'FALL', 'A', NULL, '2019-08-20 09:58:02', '2019-08-27 07:58:41', 'Other', 'Honors'),
('SC15663342584433IZ1', 'S1566232602720HJ500', 'SY1566295061551V5VA', 'C1564687005269A3NF', 'FULL YEAR', 'B', '1.00', '2019-08-20 20:50:58', '2019-08-20 20:50:58', 'Saxon Algebra 1/2', 'None'),
('SC1566583991817LEWW', 'S1566232602720HJ500', 'SY1566295061551V5VA', 'C156468700526935JL', 'FALL', 'A', '1.00', '2019-08-23 18:13:11', '2019-08-23 18:13:11', 'yuio', 'AP Course'),
('SC1566799280979TFOC', 'S1566232602720HJ500', 'SY1566295061551V5VA', 'C15646870052698EW2', 'SPRING', 'B+', '0.25', '2019-08-26 06:01:20', '2019-08-26 06:01:36', 'lk;', 'Credit by Exam'),
('SC1566892776300126V', 'S1566232602720HJ500', 'SY1566295061551V5VA', 'C1564687005269KQBU', 'SUMMER', 'IP', '1.00', '2019-08-27 07:59:36', '2019-08-30 07:22:27', NULL, 'None'),
('SC1567950606991CK6Q', 'S15662376717438STAS', 'SY156725565241238OH', 'C1565107753421MP3G', 'SPRING', 'C', NULL, '2019-09-08 13:50:06', '2019-09-08 13:50:06', NULL, 'AP Course');

-- --------------------------------------------------------

--
-- Table structure for table `student_tasks`
--

CREATE TABLE `student_tasks` (
  `id` varchar(255) NOT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Active','Completed','Expired') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_tasks`
--

INSERT INTO `student_tasks` (`id`, `student_id`, `activity`, `title`, `desc`, `due_date`, `created_at`, `updated_at`, `user_id`, `status`) VALUES
('ST1563884433032E1UM', 'S1563884405465A13PK', 'Test', 'Test', 'Test', '2019-07-30 18:30:00', '2019-07-23 12:20:33', '2019-07-30 18:57:08', 'U1563448910304GPW70', 'Expired'),
('ST15660350257448JQL', 'S1565998932563JSG9X', 'Need Photo', 'Photo', 'Please send picture of student', '2019-08-21 04:00:00', '2019-08-17 09:43:45', '2019-08-17 09:43:45', 'U1564936612575ZZB8K', 'Active'),
('ST1566457283629XW14', 'S15662376717438STAS', 'fghfgdsfgvd', 'fghfdfgdaf', 'fghgdfg', '2019-08-10 04:00:00', '2019-08-22 07:01:23', '2019-08-23 19:27:09', 'U1565974696264P8D2V', 'Active'),
('ST15688121501894B3B', 'S1565998932563JSG9X', 'test1', 'testing', 'testing', '2019-09-19 18:30:00', '2019-09-18 13:09:10', '2019-09-18 13:09:10', 'U1564936612575ZZB8K', 'Active'),
('ST1568812150189A56A', 'S15662376717438STAS', 'test1', 'testing', 'testing', '2019-09-19 18:30:00', '2019-09-18 13:09:10', '2019-09-18 13:09:10', 'U1565974696264P8D2V', 'Active'),
('ST1568812150189F1KE', 'S15674495116486D4Y8', 'test1', 'testing', 'testing', '2019-09-19 18:30:00', '2019-09-18 13:09:10', '2019-09-18 13:09:10', 'U1565974696264P8D2V', 'Active'),
('ST1568812150189ROUH', 'S1566206116812HRCQ1', 'test1', 'testing', 'testing', '2019-09-19 18:30:00', '2019-09-18 13:09:10', '2019-09-18 13:09:10', 'U1564936612575ZZB8K', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `student_years`
--

CREATE TABLE `student_years` (
  `id` varchar(255) NOT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `school_year` varchar(255) DEFAULT NULL,
  `school_grade` enum('1st Grade','2nd Grade','3rd Grade','4th Grade','5th Grade','6th Grade','7th Grade','8th Grade','9th Grade','10th Grade','11th Grade','12th Grade','Kindergarten','Adult','1 Year Of College','2 Years Of College','3 Years Of College','4 Years Of College') DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_years`
--

INSERT INTO `student_years` (`id`, `student_id`, `school_year`, `school_grade`, `created_at`, `updated_at`) VALUES
('SY1563449008092KH7W', 'S1563448988517XMLZF', '2017/19', '5th Grade', '2019-07-18 11:23:28', '2019-07-18 11:23:28'),
('SY1563450378701T2NO', 'S1563450361836I1USP', '2019/20', '3rd Grade', '2019-07-18 11:46:18', '2019-07-18 11:46:18'),
('SY1563610358545OYEE', 'S1563448988517XMLZF', '2020/21', '9th Grade', '2019-07-20 08:12:38', '2019-07-20 08:12:38'),
('SY1563610430973BRWH', 'S1563598144203KQ8A7', '2017/18', '4th Grade', '2019-07-20 08:13:50', '2019-07-20 08:13:50'),
('SY1564478161974EUXE', 'S1564478142804EJF4R', '2019/20', '2nd Grade', '2019-07-30 09:16:01', '2019-07-30 09:16:01'),
('SY1564645690277OO5Y', 'S1564645670221P6UJN', '2017/18', '6th Grade', '2019-08-01 07:48:10', '2019-08-01 07:48:10'),
('SY1565998942661FAZ4', 'S1565998932563JSG9X', '2019/20', '8th Grade', '2019-08-16 23:42:22', '2019-08-16 23:42:22'),
('SY1566009321235247Y', 'S15646456704661YDVR', '2019/20', '4th Grade', '2019-08-17 02:35:21', '2019-08-17 02:35:21'),
('SY1566151294620LJW8', 'S1565158437721JKXJY', '2020/21', '8th Grade', '2019-08-18 18:01:34', '2019-08-18 18:01:34'),
('SY1566295061551V5VA', 'S1566232602720HJ500', '2019/20', '2nd Grade', '2019-08-20 09:57:41', '2019-08-20 09:57:41'),
('SY156725565241238OH', 'S15662376717438STAS', '2017/18', '1st Grade', '2019-08-31 12:47:32', '2019-08-31 12:47:32');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
('T1564645273274NQQMT', 'TEst', '2019-08-01 07:41:13', '2019-08-01 07:41:13'),
('T15646452864928DF6K', 'Test123', '2019-08-01 07:41:26', '2019-08-01 07:41:26'),
('T1565397273852UI6A4', 'RED FLAG', '2019-08-10 00:34:33', '2019-08-10 00:34:33'),
('T1565397304620ZXS1N', 'New Enrollment', '2019-08-10 00:35:04', '2019-08-10 00:35:04'),
('T1566899614946J6ISU', 'New Student', '2019-08-27 09:53:34', '2019-08-27 09:53:34');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `plan_type` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` enum('success','fail') DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `subscription_id` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `ba_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `transaction_id`, `type`, `plan_name`, `plan_type`, `amount`, `status`, `created_at`, `updated_at`, `subscription_id`, `token`, `ba_token`) VALUES
('T1566644577378YY18X', 'U1566641796512OM3FI', NULL, 'paypal', NULL, NULL, 45, 'success', '2019-08-24 11:02:57', '2019-08-24 11:02:57', 'I-ECPGMP0HC188', NULL, NULL),
('T1566649057456J4Y1E', 'U156664885285749NP4', NULL, 'paypal', NULL, NULL, 5, 'success', '2019-08-24 12:17:37', '2019-08-24 12:17:37', 'I-UT6JDN37TNEM', NULL, NULL),
('T15667152283837PR15', 'U156671052551483PXZ', NULL, 'paypal', NULL, NULL, 5, 'success', '2019-08-25 06:40:28', '2019-08-25 06:40:28', 'I-7GDA9VMARYAD', NULL, NULL),
('T1566715996095NQPPY', 'U1566715748349ZNN1N', NULL, 'paypal', NULL, NULL, 5, 'success', '2019-08-25 06:53:16', '2019-08-25 06:53:16', 'I-8DR442KVKDST', NULL, NULL),
('T1566715996316SDMM1', 'U1566715748349ZNN1N', NULL, 'paypal', NULL, NULL, 5, 'success', '2019-08-25 06:53:16', '2019-08-25 06:53:16', 'I-8DR442KVKDST', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `password` text NOT NULL,
  `user_type` enum('family','school_admin','super_admin') DEFAULT 'family',
  `status` enum('active','banned') DEFAULT 'active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT '',
  `logo` varchar(255) DEFAULT '',
  `subscription_plan_id` varchar(255) DEFAULT NULL,
  `subscription_start_date` datetime DEFAULT NULL,
  `subscription_end_date` datetime DEFAULT NULL,
  `payment_due_date` datetime DEFAULT NULL,
  `is_payment_completed` tinyint(1) DEFAULT '0',
  `paypal_client_id` varchar(255) DEFAULT NULL,
  `paypal_client_secret` varchar(255) DEFAULT NULL,
  `registration_fee` varchar(255) DEFAULT NULL,
  `enrollment_fee` varchar(255) DEFAULT NULL,
  `graduation_fee` varchar(255) DEFAULT NULL,
  `late_fee` varchar(255) DEFAULT NULL,
  `other_standard` varchar(255) DEFAULT NULL,
  `terms_days` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `country_code`, `address`, `city`, `country`, `zip_code`, `password`, `user_type`, `status`, `created_at`, `updated_at`, `user_id`, `username`, `name`, `logo`, `subscription_plan_id`, `subscription_start_date`, `subscription_end_date`, `payment_due_date`, `is_payment_completed`, `paypal_client_id`, `paypal_client_secret`, `registration_fee`, `enrollment_fee`, `graduation_fee`, `late_fee`, `other_standard`, `terms_days`, `state`, `county`) VALUES
('U1562647511626TTK18', 'pradip', 'bhuvani', 'pradib25@gmail.com', '7405106880', '+91', 'address', 'surat', 'india', 395010, '$2b$12$RPQYNoQVyZzT1z7BANHAm.QT.GV3aOmLSm5m8MXZVqegAt1Ax93dK', 'family', 'active', '2019-07-09 04:45:11', '2019-07-09 04:45:11', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1562648024906BEQRM', 'milan', 'Bhikadiya', 'milanbhikadiya22@gmail.com', '7359634846', '+91', 'B-34 Prabhudarshan soc', 'surat', 'india', 395010, '$2b$12$HR2QdSmhm4pASMy6t2gKL./AATdh69S6DdG5kBLXhF0hlRj9wiDn.', 'family', 'active', '2019-07-09 04:53:44', '2019-07-09 04:53:44', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1563425642882KQP1V', 'pradip', 'bhuvani', 'pradib255@gmail.com', '7405116810', '+91', 'address', 'surat', 'india', 395010, '$2b$12$Rwk90fK05NR3lbmoQrUs1u277gsQNrXwNldopstvYiIRkXAmRBmOC', 'family', 'active', '2019-07-18 04:54:02', '2019-07-18 04:54:02', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1563447543532W2MGC', 'milan', 'milan', 'milan22@gmail.com', '7359634822', '+91', 'test', 'surat', 'india', 369852, '$2b$12$wmMlHCNWx31dOiBdHQ9qrec3zzM56aVJpfA3dsIIicB3EEj/v5LyK', 'family', 'active', '2019-07-18 10:59:03', '2019-07-18 10:59:03', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1563448796805UMUVV', 'pradip', 'bhuvani', 'pradipb255@gmail.com', '+917405116810', '+91', 'address', 'surat', 'india', 395010, '$2b$12$H/uirsnUoDx/F5qA8e6ONuE7XGQwvxsIjMg6ur2bQqELXV8FmMak6', 'family', 'active', '2019-07-18 11:19:56', '2019-07-18 11:19:56', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1563448910304GPW70', 'Chetan', 'Nakum', 'nakumchetan8000@gmail.com', '+918690055919', '+91', 'Gujarat', 'Surat', 'india', 395010, '$2b$12$KYPRXoVI.P0w6MvyO8MYDO/Uas8ui4WVQiDmLlcraEzbpkPUlyh8u', 'family', 'active', '2019-07-18 11:21:50', '2019-07-18 11:21:50', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1563550437349RD9W4', 'Brenda', 'Murphy', 'bobby@innovativeea.com', '8652449445', '+91', '10700 Virginia Pine Way, Suite 201', 'Knoxville', 'usa', 37932, '$2b$12$tXE5X7r.kbhJivGf1utmIuxg5c2NOVF0pCwuI7XKlXaA1cYqv8nXe', 'family', 'active', '2019-07-19 15:33:57', '2019-08-08 09:51:06', NULL, NULL, 'Sailaway Learning & Academy', 'public/2ce165f8390dee7602eb2955e7531220.jpg', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1563946300382TN', 'admin', 'admin', 'admin@gmail.com', '7878454556', '+91', 'address', 'Surat', 'India', 565656, '$2b$12$Rwk90fK05NR3lbmoQrUs1u277gsQNrXwNldopstvYiIRkXAmRBmOC', 'super_admin', 'active', '2019-07-27 00:00:00', '2019-07-27 00:00:00', NULL, 'myadmin', '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1563946300382TNR7K', 'ashish', 'poonia', 'ashish@gmail.com', '8956234556', '+91', 'address', 'Surat', 'india', 963269, '$2b$12$BXYkPJ3FXYiPnI.uZfxZCehdayckv3WprLd7.GoJs7bsVOhHaOhDO', 'family', 'active', '2019-07-24 05:31:40', '2019-07-24 05:31:40', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1564298994766IOKEV', 'dfdf', 'dfnfn', 'dffndf@gmail.com', '742', '+91', 'gsdgsd', 'ghsd', 'fbdfbh', 4275237, '$2b$12$GRL.Y.1PR3ihlL1kGhcyuu1X5nFimUeeSHmr9qhAHmpzyQniTsSIi', 'family', 'active', '2019-07-28 07:29:54', '2019-07-28 07:29:54', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U15643013763824GI17', 'test', 'test', 'ttt@gmail.com', '4562589631', '+91', 'hj,hh', 'jkhkjh', 'india', 454545, '$2b$12$Cg0SPiC9nyYxeakjk7hP6Ot74NRqaOYdu3qqE217nllLVhjau03a6', 'family', 'active', '2019-07-28 08:09:36', '2019-07-28 08:09:36', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1564419272377S234U', 'first name ', 'last name', 'myemail@gmail.com', '8956235680', '+91', 'address', 'surat', 'india', 562356, '$2b$12$0bPUgrtk6PSoSJCxy9glk.jOE5AelCSEET8kJZ.ynlmZOp0szdBrm', 'family', 'active', '2019-07-29 16:54:32', '2019-07-29 16:54:32', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U15644369303790ONDL', 'Carol', 'Willborn', 'cwillborn@sailawaylearning.com', '865.456.0454', '+91', '8305 Burchfield dr.', 'Oak Ridge', 'usa', 37830, '$2b$12$G07fvd65vwJanlXHdUHJ.Oj3cd5o524qxFS0JnX377LnSZJVXL5j.', 'family', 'active', '2019-07-29 21:48:50', '2019-07-29 21:48:50', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1564552533719ZVO7L', 'vdfssd', 'sdfsd', 'teschool@gmail.com', '752148963', '+91', 'dd', 'sdsd', 'usa', 4522, '$2b$12$umtk6wgEmu6e71IXJ75KneJzsq96MMwplXKdTL5grUDht3Png1FUy', 'school_admin', 'active', '2019-07-31 05:55:33', '2019-07-31 05:55:33', NULL, NULL, 'dfxdsgdfg', 'public/98f7da22bd74c8e0ab73fe8536a1a003.jpg', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1564553785117DDF5M', 'Chetan', 'Nakum', 'chetan@dmail.com', '8690055919', '+91', 'D-1, Sudarshan City Homes, Nr SBI Bank', 'Surat', 'india', 39500, '$2b$12$xJIq8hE55vgkvMUhHnR0WOaCkeRghFZtF1VY3ZvvOPlyqVXW/b06a', 'school_admin', 'active', '2019-07-31 06:16:25', '2019-07-31 06:16:25', NULL, NULL, 'School1', 'public/0400b0b7b081ad49bbd32d675e5f7201.png', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1564635026885U156Q', 'Chetan', 'Nakum', 'chetan@chetan.com', '8690055911', '+91', 'D-1, Sudarshan City Homes, Nr SBI Bank', 'SURAT', 'india', 395010, '$2b$12$2zq3f8h.7/PVWtIq6iwlVei3zFX1GuX7k05Pd4CQGix8t9B98iWYi', 'school_admin', 'active', '2019-08-01 04:50:26', '2019-08-01 04:50:26', NULL, 'Test96203', 'Test', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U15646872252951V3J3', 'pradip', 'bhuvani', 'pradipbhuvani@gmail.com', '7845787878', '+91', 'address', 'surat', 'usa', 895623, '$2b$12$j/BxCFcM.hDu7biNW44DVO2WUsPkUSztmraX.rEzH0dTDXrrAorAe', 'family', 'active', '2019-08-01 19:20:25', '2019-08-01 19:20:25', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1564687600868OQ8K3', '', '', 'mmmm@gmail.com', '1212121212', '+91', '', '', '', NULL, '$2b$12$3cRAxFP2DQghy/A9obCMB.0AS3FIk4xnvaWKs2MgnqybQO48NSqtq', 'family', 'active', '2019-08-01 19:26:40', '2019-08-01 19:26:40', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1564691033253L3VHW', 'Brenda', 'Murphy', 'milan221213@gmail.com', '7788998877', '+91', '125 Test Rd', 'Knoxville', 'usa', 37922, '$2b$12$s2xQ/yEtJGHsTDWL5DLt/OgNwblCseImkwg/SeCOqBzyzVtVxitgu', 'school_admin', 'active', '2019-08-01 20:23:53', '2019-09-18 13:46:17', NULL, 'Milan08018', 'Sailaway Learning6', 'public/3473d1663d6eac8eae1025c01332fecd.jpg', NULL, NULL, NULL, NULL, 0, NULL, NULL, '5', '', '', '', '', '', 'Tennessee', NULL),
('U156470236490865FV8', '', '', 'bobby@stellaracademic.com', '3366151407', '+91', '', '', '', NULL, '$2b$12$9xQGvoXjadNmJHVwIMuQEOQIu8wHw2YrzOTwEsGT9LB5jn2zAye0C', 'family', 'active', '2019-08-01 23:32:44', '2019-08-01 23:32:44', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1564936612575ZZB8K', '', '', 'bsedge111@hotmail.com', '9524572771', '+91', '', '', '', NULL, '$2b$12$KI8fbTKhLSAkZeUMpOXjzeJDcWmOwcDM.qbPYkAxc6RdJnqdxb7aW', 'family', 'active', '2019-08-04 16:36:52', '2019-08-27 10:14:31', NULL, 'bsanders111', '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1565429031642O1UVZ', '', '', 'test1t@gmail.com', '6655441122', '+91', '', '', '', NULL, '$2b$12$jkKWXnA.nlGXC4DUIcnc5.361ZyUv8z6y7z91Jvql.M7/FO2aW8Wi', 'family', 'active', '2019-08-10 09:23:51', '2019-08-10 09:23:51', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1565723274570H4PTX', '', '', 'fake@gmail.com', '865-555-5555', '+91', '', '', '', NULL, '$2b$12$Tf.9JhXUWUnGCJatw.Ri1eBfVPUux/rUN986Tp5mfCUy5X.QVHOUW', 'family', 'active', '2019-08-13 19:07:54', '2019-08-13 19:07:54', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1565974696264P8D2V', '', '', 'abc@gmail.com', '1234562254', '+91', '', '', '', NULL, '$2b$12$ca20q49UUksvkVTobifswOJM4UqQgBo8U7IDCqis0xFwA0mtsxVZ.', 'family', 'active', '2019-08-16 16:58:16', '2019-08-16 16:58:16', NULL, 'abc123', '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1565979055462PNQK4', 'sailaway learning', 'academy', 'sailawayacademy@gmail.com', '9856235689', '+91', 'address', 'Surat', 'india', 963236, '$2b$12$FIQKlM4Iq1dcPAQA7UEEo.OvbF/hq6km1q37Bes4DuBK93npZrhYW', 'school_admin', 'active', '2019-08-16 18:10:55', '2019-08-20 08:43:34', NULL, 'sailawayacademy', ' Sailaway Learning & Academy', 'public/1d5e69ecf5c0fa95813adf1b9e383eb3.png', 'SSP1565716642273YR6', '2019-08-02 00:00:00', '2019-08-31 23:59:59', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U156598050016762F3P', 'idnas', 'rennurb', 'sbrunner@sailawaylearning.com', '865-376-7005', '+91', '106 Armour Road', 'Kingston', 'usa', 37763, '$2b$12$RYLBBJBBYEYMd1.pcTjTrOHlzZ9hNngRNiwr9x5VNpX6mpXTHpQOS', 'family', 'active', '2019-08-16 18:35:00', '2019-08-16 18:35:00', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1566030343904U3H8H', '', '', 'diana@beyondexpectationspm.com', '9584582411', '+91', '', '', '', NULL, '$2b$12$9IoU1QcV3vd1trvkDv1A3.36yzkJoFkmqU58Mm9JeG2W4YxaGks9q', 'family', 'active', '2019-08-17 08:25:43', '2019-08-17 08:25:43', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1566232391042N6VDJ', 'test', 'test', 'tttt@gmail.com', '735962154', '+91', 'd', 'd', 'india', 201212, '$2b$12$xY.Lc4vn2qI4xoKYieOM6Oqt6N7kWQbztfXO97xN9frhXgHy3zBEi', 'family', 'active', '2019-08-19 16:33:11', '2019-08-19 16:33:11', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U15662908208705PJ6Y', '', '', 'bsedge111@gmail.com', '3365148571', '+91', '', '', '', NULL, '$2b$12$qCHLfm7itZ8MM7zZlV/lkuimqr3rMTBaRLa/bENJvifsFcqifMAZq', 'family', 'active', '2019-08-20 08:47:00', '2019-08-20 08:47:00', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U15663860761764PPPB', 'pradip', 'bhuvani', 'kirangadhiya.ibl@gmail.com', '7405116811', '+91', 'address', 'Surat', 'india', 395632, '$2b$12$vGRCGoLlFZslZMdtLm12FONhNbYqJZLT.taPg2PIAS1jmbhfRoU8q', 'family', 'active', '2019-08-21 11:14:36', '2019-08-21 11:14:36', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1566448595016L1OPF', 'test', 'sdf', 'milanbhikadiya@yahoo.com', '7359632222', '+91', 'B-34 Prabhudarshan soc, Punagam Road Surat', 'surat', 'india', 395010, '$2b$12$EC6EQN8yUlXIVYIFzUlhTest4ouWs76qI4EjyCBlFnkdID7JrQkC.', 'school_admin', 'active', '2019-08-22 04:36:35', '2019-08-22 04:36:35', NULL, 'TestSchool', 'test school', '', 'SSP1565716642273YR6', '2019-08-02 00:00:00', '2019-08-31 23:59:59', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1566611248404RXP9R', 'Jackie', 'Moreno', 'jesusmyfreedom@yahoo.com', '8652563769', '+91', 'Wwe', 'Qwer', 'usa', 37830, '$2b$12$UtS4qrDAzgYKKpVxF9fxCeffot0lHm1SqwoiBvvaGCts77BwqtNPu', 'family', 'active', '2019-08-24 01:47:28', '2019-08-24 01:47:28', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1566641796512OM3FI', 'test', 'test', 'testschool22@gmail.com', '125896347', '+91', 'test', 'test', 'india', 123456, '$2b$12$Auw.mxH1hYeqJUmHnqRhxuPKGefTcC7gvZyyU.I1FWgGVn9j4LXj.', 'school_admin', 'active', '2019-08-24 10:16:36', '2019-08-24 11:02:57', NULL, 'testschool22', 'test', '', 'I-ECPGMP0HC188', '2019-09-01 00:00:00', '2020-07-31 00:00:00', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1566645337030Y6GTU', 'test', 'test', 'monthschool@gmail.com', '4561237891', '+91', 'test', 'test', 'india', 123456, '$2b$12$zUYpEYf6a5SlAzWkasp8Lu3k7uRrN9K3dVjwpU0kF2OSA6SijBkRa', 'school_admin', 'active', '2019-08-24 11:15:37', '2019-08-24 11:15:37', NULL, 'monthschool', 'monthly', '', 'SSP1565716642273YR6', '2019-08-01 00:00:00', '2019-08-31 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U15666473591671AW0E', 'bhuvani', 'bhuvani', 'bhuvani@gmail.com', '7531598523', '+91', 'test', 'test', 'india', 75623, '$2b$12$HX7oTtLwPoXF/Bn5haEzMOKrg3u7bSDdJrKSB6tbOgi3o0sBpGl1O', 'school_admin', 'active', '2019-08-24 11:49:19', '2019-08-24 11:49:19', NULL, 'bhuvani', 'bhuvani', '', 'SSP1565716642273YR6', '2019-08-01 00:00:00', '2019-08-31 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1566648795558GDEVR', 'test', 'test', 't@gmail.com', '741258963', '+91', ',l', 'jkn,', 'india', 544654, '$2b$12$Y3g.7Fhnnes9Ht/ilL9TneyARylG/WAapX6rCzcNhzVHutN3W1tXC', 'school_admin', 'active', '2019-08-24 12:13:15', '2019-08-24 12:13:15', NULL, 'testtest', 'test', '', 'SSP1565716642273O9Y', '2019-09-01 00:00:00', '2020-07-31 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U156664885285749NP4', 'test', 'test', 'tt@gmail.com', '45623178', '+91', 'fd', 'kjhjk', 'india', 456564, '$2b$12$Z4f3FmziGlQP9m731t8s3eV22M0elLimFGtJ1RibF1r210IgkPCBC', 'school_admin', 'active', '2019-08-24 12:14:12', '2019-08-24 12:17:37', NULL, 'testtesttest', 'test', '', 'I-UT6JDN37TNEM', '2019-09-01 00:00:00', '2019-09-30 00:00:00', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U1566715748349ZNN1N', 'test', 'test', 'testmonthly@gmail.com', '4574123985', '+91', 'jlkhgn', 'kljhghcb', 'india', 45455, '$2b$12$0nvak.Le8XcQE/arI3a77ugOpBlZM6CClyxHBMz12uoFtBIh1PpKG', 'family', 'active', '2019-08-25 06:49:08', '2019-08-25 06:53:16', NULL, 'testmonthly', '', '', 'I-8DR442KVKDST', '2019-09-01 00:00:00', '2019-09-30 00:00:00', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('U156671580274520GND', 'test', 'test', 'testyearly@gmail.com', '454566644', '+91', 'khg', 'kj', 'india', 45464, '$2b$12$OX0Su94tPBeWA0rAzi6xtuLblFE6UM7lKrmxG4cFzyzIP7GY50jxq', 'family', 'active', '2019-08-25 06:50:02', '2019-08-25 06:50:02', NULL, 'testyearly', '', '', 'SSP1565716642273O9Y', '2019-09-01 00:00:00', '2020-07-31 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Ufhksk57310', 'academy', 'academy', 'academy@gmail.com', '5689784512', '+91', 'address', 'Surat', 'India', 123458, '$2b$12$Rwk90fK05NR3lbmoQrUs1u277gsQNrXwNldopstvYiIRkXAmRBmOC', 'school_admin', 'active', '2019-07-24 00:00:00', '2019-07-24 00:00:00', NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Ufhksk57389', 'stellar', 'education', 'school@gmail.com', '8956235689', '+91', 'adderess', 'Surat', 'india', 895623, '$2b$12$Rwk90fK05NR3lbmoQrUs1u277gsQNrXwNldopstvYiIRkXAmRBmOC', 'school_admin', 'active', '2019-07-24 00:00:00', '2019-08-18 06:58:44', NULL, NULL, 'jjj', 'public/4ae1db0fd5b436b68d255aaa290c6d99.png', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_files`
--

CREATE TABLE `user_files` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `status` enum('pending') DEFAULT 'pending',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `desc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_files`
--

INSERT INTO `user_files` (`id`, `user_id`, `name`, `student_id`, `status`, `created_at`, `updated_at`, `desc`) VALUES
('UF1564679620746VCNF', 'U1562648024906BEQRM', 'public/46db51626faec642eaaeb8ea07ea701d.jpeg', 'S15646456704661YDVR', 'pending', '2019-08-01 17:13:40', '2019-08-01 17:13:40', NULL),
('UF15646816822945KL5', 'U1562648024906BEQRM', 'public/ccc67bcdc659330cc7356f7d1922c963.jks', 'S1564645670221P6UJN', 'pending', '2019-08-01 17:48:02', '2019-08-01 17:48:02', NULL),
('UF1564681690381PX8T', 'U1562648024906BEQRM', 'public/ccc67bcdc659330cc7356f7d1922c963.jks', 'S1564645670221P6UJN', 'pending', '2019-08-01 17:48:10', '2019-08-01 17:48:10', NULL),
('UF15646817658538XN0', 'U1562648024906BEQRM', 'public/ccc67bcdc659330cc7356f7d1922c963.jks', 'S1564645670221P6UJN', 'pending', '2019-08-01 17:49:25', '2019-08-01 17:49:25', NULL),
('UF1564681833834HN6H', 'U1562648024906BEQRM', 'public/af891e722244ca3c4e26012329dd4436.exe', 'S1564645670221P6UJN', 'pending', '2019-08-01 17:50:33', '2019-08-01 17:50:33', NULL),
('UF1564681959880AQ1L', 'U1562648024906BEQRM', 'public/bbadb0c5898c04971410a43ba2e78bf1.exe', 'S1564645670221P6UJN', 'pending', '2019-08-01 17:52:39', '2019-08-01 17:52:39', NULL),
('UF1564935180848COYM', 'U1563550437349RD9W4', 'public/f58d365d806891b93f179d4add23bc06.docx', 'S1564478142804EJF4R', 'pending', '2019-08-04 16:13:00', '2019-08-04 16:13:00', NULL),
('UF15660369133860ZHS', 'U1564936612575ZZB8K', 'public/0a0be5bf9ac27391be3e28d7f9a5d873.jpg', 'S1565998932563JSG9X', 'pending', '2019-08-17 10:15:13', '2019-08-17 10:15:13', NULL),
('UF1566235691328EFX8', 'U1564936612575ZZB8K', 'public/0a0be5bf9ac27391be3e28d7f9a5d873.jpg', NULL, 'pending', '2019-08-19 17:28:11', '2019-08-19 17:28:11', 'jklghjkj'),
('UF1566309185962SSOJ', 'U1565429031642O1UVZ', 'public/2d8dd40638f2706d55b6636e4d89268b.jpg', NULL, 'pending', '2019-08-20 13:53:05', '2019-08-20 13:53:05', NULL),
('UF15664764156484DGX', 'U1565974696264P8D2V', 'public/5bf5dbf79f96c55c5bb32b19f0ad5226.jpg', 'S1566331488451SS2P4', 'pending', '2019-08-22 12:20:15', '2019-08-22 12:20:15', NULL),
('UF1566646239747NKOO', 'U1565974696264P8D2V', 'public/07613c0b8fd91771627b36c968bf7c8a.gif', 'S1566232602720HJ500', 'pending', '2019-08-24 11:30:39', '2019-08-24 11:30:39', NULL),
('UF1566646264556YW8J', 'U1565974696264P8D2V', 'public/47704bbf8792adccedf2067be8884a98.gif', 'S1566232602720HJ500', 'pending', '2019-08-24 11:31:04', '2019-08-24 11:31:04', NULL),
('UF1567179346159DURH', 'U1564936612575ZZB8K', 'public/5bf5dbf79f96c55c5bb32b19f0ad5226.jpg', NULL, 'pending', '2019-08-30 15:35:46', '2019-08-30 15:35:46', 'test'),
('UF1567241824242R9V3', 'U1565429031642O1UVZ', 'public/0a0be5bf9ac27391be3e28d7f9a5d873.jpg', NULL, 'pending', '2019-08-31 08:57:04', '2019-08-31 08:57:04', 'fasdf');

-- --------------------------------------------------------

--
-- Table structure for table `user_orders`
--

CREATE TABLE `user_orders` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `fees_type` enum('registration_fee','enrollment_fee','graduation_fee','late_fee','other_standard') DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `status` enum('pending','processing','completed') DEFAULT 'pending',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `type` enum('','CC or ACH','Cash or Check') DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_orders`
--

INSERT INTO `user_orders` (`id`, `user_id`, `fees_type`, `desc`, `total`, `status`, `created_at`, `updated_at`, `student_id`, `transaction_id`, `type`) VALUES
('UO1566898359464R7E0', 'U1564936612575ZZB8K', 'registration_fee', 'Test', 5, 'pending', '2019-08-27 09:32:39', '2019-08-27 09:32:39', 'S1565998932563JSG9X', NULL, ''),
('UO15671553213859XOS', 'U1564936612575ZZB8K', 'enrollment_fee', NULL, 5, 'pending', '2019-08-30 08:55:21', '2019-08-30 08:55:21', 'S1565998932563JSG9X', NULL, ''),
('UO1567162068363ZQBR', 'U1565974696264P8D2V', 'enrollment_fee', 'test', 5, 'pending', '2019-08-30 10:47:48', '2019-08-30 10:47:48', 'S15662376717438STAS', NULL, ''),
('UO15671621888803R9L', 'U1565974696264P8D2V', 'enrollment_fee', 'test', 5, 'pending', '2019-08-30 10:49:48', '2019-08-30 10:49:48', 'S15662376717438STAS', NULL, ''),
('UO1567162561356BGOO', 'U1565974696264P8D2V', 'late_fee', 'sad', 5, 'pending', '2019-08-30 10:56:01', '2019-08-30 10:56:01', 'S15662376717438STAS', NULL, ''),
('UO1567206375837EC0N', 'U1564936612575ZZB8K', 'enrollment_fee', NULL, 5, 'pending', '2019-08-30 23:06:15', '2019-08-30 23:06:15', 'S1565998932563JSG9X', NULL, ''),
('UO1567449511643NSSW', 'U1565974696264P8D2V', 'enrollment_fee', 'test', 5, 'pending', '2019-09-02 18:38:31', '2019-09-02 18:38:31', 'S15662376717438STAS', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `user_requests`
--

CREATE TABLE `user_requests` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `status` enum('pending','completed') DEFAULT 'pending',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `due_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_requests`
--

INSERT INTO `user_requests` (`id`, `user_id`, `type`, `comment`, `status`, `created_at`, `updated_at`, `due_date`) VALUES
('UR1564301747481WOVT', 'U15643013763824GI17', 'Id Proof', 'l', 'pending', '2019-07-28 08:15:47', '2019-07-28 08:15:47', NULL),
('UR15644169498837KGU', 'U1563448796805UMUVV', 'Driving License', 'sdfgsdg', 'pending', '2019-07-29 16:15:49', '2019-07-29 16:15:49', NULL),
('UR1564933394348HP8G', 'U1563550437349RD9W4', 'Driving License', 'I need a form', 'pending', '2019-08-04 15:43:14', '2019-08-04 15:43:14', NULL),
('UR1564933399214WXEZ', 'U1563550437349RD9W4', 'Driving License', 'I need a form', 'pending', '2019-08-04 15:43:19', '2019-08-04 15:43:19', NULL),
('UR1564933410430PHBD', 'U1563550437349RD9W4', 'Driving License', 'I need a form', 'pending', '2019-08-04 15:43:30', '2019-08-04 15:43:30', NULL),
('UR1564933429872UIQN', 'U1563550437349RD9W4', 'Driving License', 'I need a form', 'pending', '2019-08-04 15:43:49', '2019-08-04 15:43:49', NULL),
('UR1565021977815XEZ1', 'U1562648024906BEQRM', 'Driving License', 'DFSDF', 'pending', '2019-08-05 16:19:37', '2019-08-05 16:19:37', NULL),
('UR1565025360134QLHS', 'U1562648024906BEQRM', 'Id Proof', 'gsafgf', 'pending', '2019-08-05 17:16:00', '2019-08-05 17:16:00', NULL),
('UR1565025411131UPSV', 'U1562648024906BEQRM', 'Id Proof', 'gsdrf', 'pending', '2019-08-05 17:16:51', '2019-08-05 17:16:51', NULL),
('UR15650254172468P5V', 'U1562648024906BEQRM', 'Driving License', 'fasdfd', 'pending', '2019-08-05 17:16:57', '2019-08-05 17:16:57', NULL),
('UR1565034171215KBDP', 'U1563550437349RD9W4', 'Id Proof', 'Test', 'pending', '2019-08-05 19:42:51', '2019-08-05 19:42:51', NULL),
('UR1565034173341XG2U', 'U1563550437349RD9W4', 'Id Proof', 'Test', 'pending', '2019-08-05 19:42:53', '2019-08-05 19:42:53', NULL),
('UR1565034173540NO2N', 'U1563550437349RD9W4', 'Id Proof', 'Test', 'pending', '2019-08-05 19:42:53', '2019-08-05 19:42:53', NULL),
('UR1565034173774H76N', 'U1563550437349RD9W4', 'Id Proof', 'Test', 'pending', '2019-08-05 19:42:53', '2019-08-05 19:42:53', NULL),
('UR15650341758584N7N', 'U1563550437349RD9W4', 'Id Proof', 'Test', 'pending', '2019-08-05 19:42:55', '2019-08-05 19:42:55', NULL),
('UR1565034176317HDYV', 'U1563550437349RD9W4', 'Id Proof', 'Test', 'pending', '2019-08-05 19:42:56', '2019-08-05 19:42:56', NULL),
('UR15651954219455RPM', 'U1563550437349RD9W4', 'Id Proof', 'Test By pradip', 'pending', '2019-08-07 16:30:21', '2019-08-07 16:30:21', NULL),
('UR1565195433412KUBX', 'U1563550437349RD9W4', 'Id Proof', 'Test By pradip', 'pending', '2019-08-07 16:30:33', '2019-08-07 16:30:33', NULL),
('UR1565195443954RIK6', 'U1563550437349RD9W4', 'Id Proof', 'Test By pradip', 'pending', '2019-08-07 16:30:43', '2019-08-07 16:30:43', NULL),
('UR15651954709429JB1', 'U1563550437349RD9W4', 'Id Proof', 'Test By pradip', 'pending', '2019-08-07 16:31:10', '2019-08-07 16:31:10', NULL),
('UR15651955423792DJV', 'U1563550437349RD9W4', 'Id Proof', 'Test By pradip', 'pending', '2019-08-07 16:32:22', '2019-08-07 16:32:22', NULL),
('UR15651955539258KOY', 'U1563550437349RD9W4', 'Id Proof', 'Test By pradip', 'pending', '2019-08-07 16:32:33', '2019-08-07 16:32:33', NULL),
('UR1565195564464VOVS', 'U1563550437349RD9W4', 'Id Proof', 'Test By pradip', 'pending', '2019-08-07 16:32:44', '2019-08-07 16:32:44', NULL),
('UR1565195591415WHUY', 'U1563550437349RD9W4', 'Id Proof', 'Test By pradip', 'pending', '2019-08-07 16:33:11', '2019-08-07 16:33:11', NULL),
('UR1565195614727DBK3', 'U1563550437349RD9W4', 'Id Proof', 'Test By pradip', 'pending', '2019-08-07 16:33:34', '2019-08-07 16:33:34', NULL),
('UR1565195641809DY8H', 'U1563550437349RD9W4', 'Driving License', 'test by pradip', 'pending', '2019-08-07 16:34:01', '2019-08-07 16:34:01', NULL),
('UR15652565509048OEL', 'U1563550437349RD9W4', 'Driving License', 'Test', 'pending', '2019-08-08 09:29:10', '2019-08-08 09:29:10', NULL),
('UR1565428749232LXAG', 'U1563550437349RD9W4', 'Driving License', 'firebase testing request', 'pending', '2019-08-10 09:19:09', '2019-08-10 09:19:09', NULL),
('UR1565436155979C5T1', 'U1563550437349RD9W4', 'Id Proof', 'test by pradip bhuvani', 'pending', '2019-08-10 11:22:35', '2019-08-10 11:22:35', NULL),
('UR1565998466931XKPN', 'U1564936612575ZZB8K', 'Driving License', 'Need Test', 'pending', '2019-08-16 23:34:26', '2019-08-16 23:34:26', '2019-08-24 04:00:00'),
('UR15662366913683R8J', 'U1565723274570H4PTX', 'Id Proof', 'kjlh', 'pending', '2019-08-19 17:44:51', '2019-08-19 17:44:51', '2019-08-15 18:30:00'),
('UR1566236691368JXZZ', 'U1565974696264P8D2V', 'Id Proof', 'kjlh', 'pending', '2019-08-19 17:44:51', '2019-08-19 17:44:51', '2019-08-15 18:30:00'),
('UR1566236691368NPPD', 'U1564936612575ZZB8K', 'Id Proof', 'kjlh', 'pending', '2019-08-19 17:44:51', '2019-08-19 17:44:51', '2019-08-15 18:30:00'),
('UR1566236691368P2F1', 'U1565429031642O1UVZ', 'Id Proof', 'kjlh', 'pending', '2019-08-19 17:44:51', '2019-08-19 17:44:51', '2019-08-15 18:30:00'),
('UR1566278391388Z9A0', 'U1565723274570H4PTX', 'Id Proof', 'dfsg', 'pending', '2019-08-20 05:19:51', '2019-08-20 05:19:51', '2019-08-06 18:30:00'),
('UR1566278391389L2YB', 'U1564936612575ZZB8K', 'Id Proof', 'dfsg', 'pending', '2019-08-20 05:19:51', '2019-08-20 05:19:51', '2019-08-06 18:30:00'),
('UR1566295958640A7CE', 'U1565974696264P8D2V', 'Driving License', 'Test', 'pending', '2019-08-20 10:12:38', '2019-08-20 10:12:38', '2019-08-31 04:00:00'),
('UR1567181166143DQ98', 'U1565723274570H4PTX', 'Driving License', 's', 'pending', '2019-08-30 16:06:06', '2019-08-30 16:06:06', '2019-08-29 18:30:00'),
('UR1567181286554SWSV', 'U1565723274570H4PTX', 'Driving License', 's', 'pending', '2019-08-30 16:08:06', '2019-08-30 16:08:06', '2019-08-29 18:30:00'),
('UR15671822532039KRT', 'U1565974696264P8D2V', 'Driving License', 'lkjfg', 'pending', '2019-08-30 16:24:13', '2019-08-30 16:24:13', '2019-08-30 18:30:00'),
('UR156718237359744ZP', 'U1565974696264P8D2V', 'Driving License', 'lkjfg', 'pending', '2019-08-30 16:26:13', '2019-08-30 16:26:13', '2019-08-30 18:30:00'),
('UR1567186576421Y68I', 'U1565974696264P8D2V', 'test', 'test', 'pending', '2019-08-30 17:36:16', '2019-08-30 17:36:16', '2019-08-15 18:30:00'),
('UR15672070739631MCJ', 'U1565974696264P8D2V', 'test', 'test', 'pending', '2019-08-30 23:17:53', '2019-08-30 23:17:53', '2019-08-31 04:00:00'),
('UR1568793455315J7HA', 'U1565974696264P8D2V', 'Driving License', 'DL required', 'pending', '2019-09-18 07:57:35', '2019-09-18 07:57:35', '2019-09-18 18:30:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_answers`
--
ALTER TABLE `document_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_questions`
--
ALTER TABLE `document_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `families`
--
ALTER TABLE `families`
  ADD PRIMARY KEY (`id`),
  ADD KEY `families_school_id_foreign_idx` (`school_id`);

--
-- Indexes for table `family_notes`
--
ALTER TABLE `family_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pre_student_tasks`
--
ALTER TABLE `pre_student_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_user_requests`
--
ALTER TABLE `pre_user_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_subscription_plans`
--
ALTER TABLE `school_subscription_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `SequelizeMeta_name_unique` (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_attendances`
--
ALTER TABLE `student_attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_awards`
--
ALTER TABLE `student_awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_tasks`
--
ALTER TABLE `student_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_years`
--
ALTER TABLE `student_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_files`
--
ALTER TABLE `user_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_requests`
--
ALTER TABLE `user_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=490;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `families`
--
ALTER TABLE `families`
  ADD CONSTRAINT `families_school_id_foreign_idx` FOREIGN KEY (`school_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `family_notes`
--
ALTER TABLE `family_notes`
  ADD CONSTRAINT `family_notes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `student_awards`
--
ALTER TABLE `student_awards`
  ADD CONSTRAINT `student_awards_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `student_tasks`
--
ALTER TABLE `student_tasks`
  ADD CONSTRAINT `student_tasks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD CONSTRAINT `user_orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
