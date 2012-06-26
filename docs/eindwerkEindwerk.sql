-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 26 Jun 2012 om 21:31
-- Serverversie: 5.5.9
-- PHP-Versie: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `eindwerk`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `page`
--

DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `pageID` int(11) NOT NULL AUTO_INCREMENT,
  `menu` enum('ja','nee') NOT NULL DEFAULT 'ja',
  `status` enum('online','offline') NOT NULL DEFAULT 'offline',
  PRIMARY KEY (`pageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Gegevens worden uitgevoerd voor tabel `page`
--

INSERT INTO `page` (`pageID`, `menu`, `status`) VALUES(1, 'ja', 'online');
INSERT INTO `page` (`pageID`, `menu`, `status`) VALUES(2, 'nee', 'online');
INSERT INTO `page` (`pageID`, `menu`, `status`) VALUES(3, 'ja', 'offline');
INSERT INTO `page` (`pageID`, `menu`, `status`) VALUES(4, 'nee', 'offline');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pageLocal`
--

DROP TABLE IF EXISTS `pageLocal`;
CREATE TABLE `pageLocal` (
  `pageLocalID` int(11) NOT NULL AUTO_INCREMENT,
  `pageID` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `titleURL` varchar(255) DEFAULT NULL,
  `description` text,
  `local` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`pageLocalID`),
  KEY `fk_pageLocal_page` (`pageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Gegevens worden uitgevoerd voor tabel `pageLocal`
--

INSERT INTO `pageLocal` (`pageLocalID`, `pageID`, `title`, `titleURL`, `description`, `local`) VALUES(1, 1, 'Home', 'home', 'Dit is de home page', 'nl_BE');
INSERT INTO `pageLocal` (`pageLocalID`, `pageID`, `title`, `titleURL`, `description`, `local`) VALUES(2, 1, 'Home', 'home', 'Dit is de home in het frans', 'fr_BE');
INSERT INTO `pageLocal` (`pageLocalID`, `pageID`, `title`, `titleURL`, `description`, `local`) VALUES(3, 1, 'Services', 'services', 'Dit is de service page', 'nl_BE');
INSERT INTO `pageLocal` (`pageLocalID`, `pageID`, `title`, `titleURL`, `description`, `local`) VALUES(4, 1, 'Services', 'services', 'Dit is de service in het frans', 'fr_BE');
INSERT INTO `pageLocal` (`pageLocalID`, `pageID`, `title`, `titleURL`, `description`, `local`) VALUES(5, 1, 'Admin', 'admin', 'Dit is de admin page ', 'nl_BE');
INSERT INTO `pageLocal` (`pageLocalID`, `pageID`, `title`, `titleURL`, `description`, `local`) VALUES(6, 1, 'Admin', 'admin', 'Dit is de admin page in het frans', 'fr_BE');
INSERT INTO `pageLocal` (`pageLocalID`, `pageID`, `title`, `titleURL`, `description`, `local`) VALUES(7, 1, 'Contact', 'contact', 'Dit is de contact page', 'nl_BE');
INSERT INTO `pageLocal` (`pageLocalID`, `pageID`, `title`, `titleURL`, `description`, `local`) VALUES(8, 1, 'Contact', 'contact', 'Dit is de contact page in het frans', 'fr_BE');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `translate`
--

DROP TABLE IF EXISTS `translate`;
CREATE TABLE `translate` (
  `translateID` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(45) DEFAULT NULL,
  `translation` text,
  `translated` tinyint(1) DEFAULT '0',
  `local` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`translateID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Gegevens worden uitgevoerd voor tabel `translate`
--

INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(1, 'text.header', 'Dit is de headertxt...\r\n', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(3, 'text.footer', '&copy; 2012 - PSDTemplate.com. All rights reserved - Joeri Lambert', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(4, 'home.teaserTitle', 'Welcome', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(6, 'home.teaserSubtitle', 'This is my final work', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(7, 'home.teaserTxt', 'This is my final work for webmaster-advanced. This project is made with ZendFramework. This text has nothing to say and is just for making sure there is text in the teaser div.', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(8, 'home.title', 'Welcome to my site', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(9, 'home.txt', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lectus. Donec pharetra molestie nunc. Sed mattis, erat sit amet vehicula consectetur, purus pede consectetur quam, non tempor orci ligula ac mauris. Vestibulum lacus erat, egestas vel, posuere sit amet, molestie eget, ipsum. Cras diam nibh, placerat sit amet, dictum eget, varius a, nisi. Suspendisse ac tellus.</br>\r\n\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lectus. Donec pharetra molestie nunc. Sed mattis, erat sit amet vehicula consectetur, purus pede consectetur quam, non tempor orci ligula ac mauris. Vestibulum lacus erat, egestas vel, posuere sit amet, molestie eget, ipsum. Cras diam nibh, placerat sit amet, dictum eget, varius a, nisi. Suspendisse ac tellus.', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(10, 'home.teaserPicUrl', '/img/bgteaser.png', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(11, 'home.teaserPicAlt', 'teaserPic', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(12, 'services.teaserTitle', 'SERVICE', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(21, 'label.title', 'Page Title', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(22, 'label.titleUrl', 'page Url', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(23, 'label.description', 'page description', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(24, 'label.menu', 'Visible in menu', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(25, 'label.status', 'Page status', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(26, 'label.country', 'Language', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(27, 'label.teaserTitle', 'Title of the teaser', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(28, 'label.teaserSubtitle', 'Subtitle of the teaser', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(29, 'label.teaserTxt', 'Text of the teaser', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(30, 'label.txt', 'Main text on the page', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(31, 'label.teaserPicUrl', 'Url of the teaser picture', 1, 'nl_BE');
INSERT INTO `translate` (`translateID`, `tag`, `translation`, `translated`, `local`) VALUES(32, 'label.teaserPicAlt', 'The alt text of the teaser picture', 1, 'nl_BE');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `usersID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`usersID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Gegevens worden uitgevoerd voor tabel `users`
--

INSERT INTO `users` (`usersID`, `username`, `password`) VALUES(1, 'joeri', '098f6bcd4621d373cade4e832627b4f6');

--
-- Beperkingen voor gedumpte tabellen
--

--
-- Beperkingen voor tabel `pageLocal`
--
ALTER TABLE `pageLocal`
  ADD CONSTRAINT `fk_pageLocal_page` FOREIGN KEY (`pageID`) REFERENCES `page` (`pageID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
