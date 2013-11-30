ALTER TABLE `group_member` ADD `roles` smallint(6) unsigned NOT NULL default '0';
ALTER TABLE `guild_bank_eventlog` CHANGE `ItemStackCount` `ItemStackCount` SMALLINT(4) UNSIGNED DEFAULT '0' NOT NULL;
DROP TABLE IF EXISTS `pool_quest_save`;
CREATE TABLE `pool_quest_save` (
  `pool_id` int(10) unsigned NOT NULL DEFAULT '0',
  `quest_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pool_id`,`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `character_banned`;
CREATE TABLE `character_banned` (
  `guid` int(11) NOT NULL default '0' COMMENT 'Account id',
  `bandate` bigint(40) NOT NULL default '0',
  `unbandate` bigint(40) NOT NULL default '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`guid`,`bandate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Ban List';
DROP TABLE IF EXISTS `item_soulbound_trade_data`;
CREATE TABLE `item_soulbound_trade_data` (
  `itemGuid` int(11) unsigned NOT NULL COMMENT 'Item GUID',
  `allowedPlayers` text NOT NULL COMMENT 'Space separated GUID list of players who can receive this item in trade',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Item Refund System';
UPDATE `character_queststatus` SET `itemcount1` = 0 WHERE `itemcount1` > 65535;
UPDATE `character_queststatus` SET `itemcount2` = 0 WHERE `itemcount2` > 65535;
UPDATE `character_queststatus` SET `itemcount3` = 0 WHERE `itemcount3` > 65535;
UPDATE `character_queststatus` SET `itemcount4` = 0 WHERE `itemcount4` > 65535;

ALTER TABLE `character_queststatus` CHANGE `status` `status` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT 0,
CHANGE `mobcount1` `mobcount1` SMALLINT( 3 ) UNSIGNED NOT NULL DEFAULT 0,
CHANGE `mobcount2` `mobcount2` SMALLINT( 3 ) UNSIGNED NOT NULL DEFAULT 0,
CHANGE `mobcount3` `mobcount3` SMALLINT( 3 ) UNSIGNED NOT NULL DEFAULT 0,
CHANGE `mobcount4` `mobcount4` SMALLINT( 3 ) UNSIGNED NOT NULL DEFAULT 0,
CHANGE `itemcount1` `itemcount1` SMALLINT( 3 ) UNSIGNED NOT NULL DEFAULT 0,
CHANGE `itemcount2` `itemcount2` SMALLINT( 3 ) UNSIGNED NOT NULL DEFAULT 0,
CHANGE `itemcount3` `itemcount3` SMALLINT( 3 ) UNSIGNED NOT NULL DEFAULT 0,
CHANGE `itemcount4` `itemcount4` SMALLINT( 3 ) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE guild_rank CHANGE COLUMN rid rid TINYINT(1) UNSIGNED NOT NULL;
ALTER TABLE guild_bank_right CHANGE COLUMN rid rid TINYINT(1) UNSIGNED NOT NULL DEFAULT 0;
