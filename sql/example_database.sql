-- phpMyAdmin SQL Dump
-- version 4.3.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Gegenereerd op: 12 feb 2015 om 08:50
-- Serverversie: 10.0.15-MariaDB
-- PHP-versie: 5.5.20

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exercise`
--

CREATE TABLE IF NOT EXISTS `exercise` (
  `id` int(11) NOT NULL,
  `exercise_name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Gegevens worden ge�xporteerd voor tabel `exercise`
--

INSERT INTO `exercise` (`id`, `exercise_name`) VALUES
(1, 'Crunch'),
(2, 'Air squat'),
(3, 'Windmill'),
(4, 'Push-up'),
(5, 'Rowing Machine'),
(6, 'Walking'),
(7, 'Running');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `exercise_instances`
--

CREATE TABLE IF NOT EXISTS `exercise_instances` (
  `id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL COMMENT 'optional, filled when this is part of a trainingplan (day)',
  `exercise_duration` int(11) NOT NULL DEFAULT '0' COMMENT 'duration in seconds',
  `order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Gegevens worden ge�xporteerd voor tabel `exercise_instances`
--

INSERT INTO `exercise_instances` (`id`, `exercise_id`, `day_id`, `exercise_duration`, `order`) VALUES
(1, 5, 1, 300, 1),
(2, 6, 1, 900, 3),
(3, 7, 1, 900, 2),
(4, 1, 2, 150, 1),
(5, 2, 2, 300, 2),
(6, 3, 2, 300, 3),
(7, 4, 2, 500, 4);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `plan`
--

CREATE TABLE IF NOT EXISTS `plan` (
  `id` int(11) NOT NULL,
  `plan_name` varchar(150) NOT NULL COMMENT 'contains plan name',
  `plan_description` text NOT NULL COMMENT 'contains plan description (optional)',
  `plan_difficulty` int(1) NOT NULL DEFAULT '1' COMMENT '1=beginner,2=intermediate,3=expert'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='contains basic plan data';

--
-- Gegevens worden ge�xporteerd voor tabel `plan`
--

INSERT INTO `plan` (`id`, `plan_name`, `plan_description`, `plan_difficulty`) VALUES
(1, 'My first plan', 'Just a dummy :-)', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `plan_days`
--

CREATE TABLE IF NOT EXISTS `plan_days` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL COMMENT 'id from plan table',
  `day_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'name for this day, optional',
  `order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Gegevens worden ge�xporteerd voor tabel `plan_days`
--

INSERT INTO `plan_days` (`id`, `plan_id`, `day_name`, `order`) VALUES
(1, 1, 'Day 1 - Cardio', 1),
(2, 1, 'Day 2 - Other exercises', 2);

--
-- Indexen voor ge�xporteerde tabellen
--

--
-- Indexen voor tabel `exercise`
--
ALTER TABLE `exercise`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `exercise_instances`
--
ALTER TABLE `exercise_instances`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `plan_days`
--
ALTER TABLE `plan_days`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor ge�xporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `exercise`
--
ALTER TABLE `exercise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT voor een tabel `exercise_instances`
--
ALTER TABLE `exercise_instances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT voor een tabel `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `plan_days`
--
ALTER TABLE `plan_days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;