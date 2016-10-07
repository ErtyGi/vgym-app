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

-- Dumping structure for table vgym-app.exercise
CREATE TABLE IF NOT EXISTS `exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exercise_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table vgym-app.exercise: ~7 rows (approximately)
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


-- Dumping structure for table vgym-app.exercise_instances
CREATE TABLE IF NOT EXISTS `exercise_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exercise_id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL COMMENT 'optional, filled when this is part of a trainingplan (day)',
  `exercise_duration` int(11) NOT NULL DEFAULT '0' COMMENT 'duration in seconds',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table vgym-app.exercise_instances: ~7 rows (approximately)
/*!40000 ALTER TABLE `exercise_instances` DISABLE KEYS */;
INSERT INTO `exercise_instances` (`id`, `exercise_id`, `day_id`, `exercise_duration`, `order`) VALUES
	(1, 5, 1, 300, 1),
	(2, 6, 1, 900, 3),
	(3, 7, 1, 900, 2),
	(4, 1, 2, 150, 1),
	(5, 2, 2, 300, 2),
	(6, 3, 2, 300, 3),
	(7, 4, 2, 500, 4);
/*!40000 ALTER TABLE `exercise_instances` ENABLE KEYS */;


-- Dumping structure for table vgym-app.plan
CREATE TABLE IF NOT EXISTS `plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(150) NOT NULL COMMENT 'contains plan name',
  `plan_description` text NOT NULL COMMENT 'contains plan description (optional)',
  `plan_difficulty` int(1) NOT NULL DEFAULT '1' COMMENT '1=beginner,2=intermediate,3=expert',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COMMENT='contains basic plan data';

-- Dumping data for table vgym-app.plan: ~3 rows (approximately)
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` (`id`, `plan_name`, `plan_description`, `plan_difficulty`, `updated_at`, `created_at`) VALUES
	(1, 'My first plan', 'Just a dummy :-)', 1, NULL, NULL),
	(2, 'Test', 'this is updated', 1, '2016-10-06 21:47:19', NULL),
	(9, 'test 5', 'test', 1, '2016-10-06 22:24:33', '2016-10-06 22:24:33'),
	(10, 'Test', 'Test', 1, '2016-10-06 23:36:15', '2016-10-06 23:36:15');
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;


-- Dumping structure for table vgym-app.plan_days
CREATE TABLE IF NOT EXISTS `plan_days` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL COMMENT 'id from plan table',
  `day_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'name for this day, optional',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table vgym-app.plan_days: ~2 rows (approximately)
/*!40000 ALTER TABLE `plan_days` DISABLE KEYS */;
INSERT INTO `plan_days` (`id`, `plan_id`, `day_name`, `order`) VALUES
	(1, 1, 'Day 1 - Cardio', 1),
	(2, 1, 'Day 2 - Other exercises', 2);
/*!40000 ALTER TABLE `plan_days` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
