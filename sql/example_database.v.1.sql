-- --------------------------------------------------------
-- Host:                         192.168.11.12
-- Server version:               5.7.12-0ubuntu1.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table vgym_app.exercise
CREATE TABLE IF NOT EXISTS `exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exercise_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table vgym_app.exercise: ~7 rows (approximately)
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` (`id`, `exercise_name`) VALUES
	(1, 'Crunch'),
	(2, 'Air squat'),
	(3, 'Windmill'),
	(4, 'Push-up'),
	(5, 'Rowing Machine'),
	(6, 'Walking'),
	(7, 'Running');
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;


-- Dumping structure for table vgym_app.exercise_instances
CREATE TABLE IF NOT EXISTS `exercise_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exercise_id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL COMMENT 'optional, filled when this is part of a trainingplan (day)',
  `exercise_duration` int(11) NOT NULL DEFAULT '0' COMMENT 'duration in seconds',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table vgym_app.exercise_instances: ~7 rows (approximately)
/*!40000 ALTER TABLE `exercise_instances` DISABLE KEYS */;
INSERT INTO `exercise_instances` (`id`, `exercise_id`, `day_id`, `exercise_duration`, `created_at`, `updated_at`, `order`) VALUES
	(1, 5, 1, 300, 0, 0, 1),
	(2, 6, 1, 900, 0, 0, 3),
	(3, 7, 1, 900, 0, 0, 2),
	(4, 1, 2, 150, 0, 0, 1),
	(5, 2, 2, 300, 0, 0, 2),
	(6, 3, 2, 300, 0, 0, 3),
	(7, 4, 2, 500, 0, 0, 4);
/*!40000 ALTER TABLE `exercise_instances` ENABLE KEYS */;


-- Dumping structure for table vgym_app.plan
CREATE TABLE IF NOT EXISTS `plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(150) NOT NULL COMMENT 'contains plan name',
  `plan_description` text NOT NULL COMMENT 'contains plan description (optional)',
  `plan_difficulty` int(1) NOT NULL DEFAULT '1' COMMENT '1=beginner,2=intermediate,3=expert',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COMMENT='contains basic plan data';

-- Dumping data for table vgym_app.plan: ~2 rows (approximately)
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` (`id`, `plan_name`, `plan_description`, `plan_difficulty`, `updated_at`, `created_at`) VALUES
	(1, 'My first plan', 'Just a dummy :-)', 1, NULL, NULL),
	(14, 'Ertil\'s Plan', 'All you get is this text and a mostly barebones HTML document.', 1, '2016-10-09 18:40:58', '2016-10-09 18:40:58');
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;


-- Dumping structure for table vgym_app.plan_days
CREATE TABLE IF NOT EXISTS `plan_days` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL COMMENT 'id from plan table',
  `day_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'name for this day, optional',
  `order` int(11) NOT NULL DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table vgym_app.plan_days: ~3 rows (approximately)
/*!40000 ALTER TABLE `plan_days` DISABLE KEYS */;
INSERT INTO `plan_days` (`id`, `plan_id`, `day_name`, `order`, `updated_at`, `created_at`) VALUES
	(1, 1, 'Day 1 - Cardio', 1, '2016-10-09 23:04:21', '2016-10-09 23:04:23'),
	(2, 1, 'Day 2 - Other exercises', 2, '2016-10-09 23:04:19', '2016-10-09 23:04:25'),
	(3, 14, 'Day 1 - Gani exercises', 2, '2016-10-09 23:04:12', '2016-10-09 23:04:15');
/*!40000 ALTER TABLE `plan_days` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
