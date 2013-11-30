ALTER TABLE character_glyphs CHANGE glyph1 glyph1 smallint(5) unsigned DEFAULT '0';
ALTER TABLE `gm_tickets`
    ADD COLUMN `response` text NOT NULL AFTER `comment`,
    ADD COLUMN `haveTicket` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `viewed`;
CREATE TABLE IF NOT EXISTS `guild_member_withdraw` (
  `guid` int(10) unsigned NOT NULL,
  `tab0` int(10) unsigned NOT NULL DEFAULT '0',
  `tab1` int(10) unsigned NOT NULL DEFAULT '0',
  `tab2` int(10) unsigned NOT NULL DEFAULT '0',
  `tab3` int(10) unsigned NOT NULL DEFAULT '0',
  `tab4` int(10) unsigned NOT NULL DEFAULT '0',
  `tab5` int(10) unsigned NOT NULL DEFAULT '0',
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild Member Daily Withdraws';

ALTER TABLE `guild_member` DROP COLUMN `BankRemMoney`;
ALTER TABLE `guild_member` DROP COLUMN `BankRemSlotsTab0`;
ALTER TABLE `guild_member` DROP COLUMN `BankRemSlotsTab1`;
ALTER TABLE `guild_member` DROP COLUMN `BankRemSlotsTab2`;
ALTER TABLE `guild_member` DROP COLUMN `BankRemSlotsTab3`;
ALTER TABLE `guild_member` DROP COLUMN `BankRemSlotsTab4`;
ALTER TABLE `guild_member` DROP COLUMN `BankRemSlotsTab5`;
ALTER TABLE `guild_member` DROP COLUMN `BankResetTimeMoney`;
ALTER TABLE `guild_member` DROP COLUMN `BankResetTimeTab0`;
ALTER TABLE `guild_member` DROP COLUMN `BankResetTimeTab1`;
ALTER TABLE `guild_member` DROP COLUMN `BankResetTimeTab2`;
ALTER TABLE `guild_member` DROP COLUMN `BankResetTimeTab3`;
ALTER TABLE `guild_member` DROP COLUMN `BankResetTimeTab4`;
ALTER TABLE `guild_member` DROP COLUMN `BankResetTimeTab5`;

DELETE FROM `worldstates` WHERE `entry`=20006;
INSERT INTO `worldstates` (`entry`,`value`,`comment`) VALUES (20006,0, 'Guild daily reset');
DROP TABLE IF EXISTS `calendar_events`;
CREATE TABLE IF NOT EXISTS `calendar_events` (
  `id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `creator` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '4',
  `dungeon` int(10) NOT NULL DEFAULT '-1',
  `eventtime` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `time2` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `calendar_invites`;
CREATE TABLE IF NOT EXISTS `calendar_invites` (
  `id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `event` bigint(20) unsigned NOT NULL DEFAULT '0',
  `invitee` int(10) unsigned NOT NULL DEFAULT '0',
  `sender` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `statustime` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `text` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `character_queststatus_monthly`;

CREATE TABLE IF NOT EXISTS `character_queststatus_monthly` (
  `guid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='Player System';
DELETE FROM `worldstates` WHERE `entry` IN (20004,20007);
INSERT INTO `worldstates` (`entry`, `value`, `comment`) VALUES
(20004,0,'CleaningFlags'),
(20007,0,'NextMonthlyQuestResetTime');
/*
SQLyog Ultimate v9.63 
MySQL - 5.5.21 : Database - characters
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `item_loot_items`
--

DROP TABLE IF EXISTS `item_loot_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_loot_items` (
  `container_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'guid of container (item_instance.guid)',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'loot item entry (item_instance.itemEntry)',
  `item_count` int(10) NOT NULL DEFAULT '0' COMMENT 'stack size',
  `follow_rules` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'follow loot rules',
  `ffa` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'free-for-all',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  `counted` tinyint(1) NOT NULL DEFAULT '0',
  `under_threshold` tinyint(1) NOT NULL DEFAULT '0',
  `needs_quest` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'quest drop',
  `rnd_prop` int(10) NOT NULL DEFAULT '0' COMMENT 'random enchantment added when originally rolled',
  `rnd_suffix` int(10) NOT NULL DEFAULT '0' COMMENT 'random suffix added when originally rolled'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_loot_money`
--

DROP TABLE IF EXISTS `item_loot_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_loot_money` (
  `container_id` int(10) NOT NULL DEFAULT '0' COMMENT 'guid of container (item_instance.guid)',
  `money` int(10) NOT NULL DEFAULT '0' COMMENT 'money loot (in copper)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
