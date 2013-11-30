ALTER TABLE character_banned ENGINE = InnoDB;
DROP TABLE IF EXISTS `creature_respawn`;
CREATE TABLE `creature_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawntime` int(10) unsigned NOT NULL DEFAULT '0',
  `instance` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grid Loading System';

DROP TABLE IF EXISTS `gameobject_respawn`;
CREATE TABLE `gameobject_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawntime` int(10) unsigned NOT NULL DEFAULT '0',
  `instance` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grid Loading System';

DROP TABLE IF EXISTS `reserved_name`;
CREATE TABLE `reserved_name` (
  `name` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player Reserved Names';

ALTER TABLE `group_member`
CHANGE `guid` `guid` INT(11) UNSIGNED NOT NULL,
CHANGE `memberGuid` `memberGuid` INT(11) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `memberFlags` `memberFlags` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `subgroup` `subgroup` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `roles` `roles` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `channels`
DROP COLUMN `m_moderate`,
CHANGE `m_name` `m_name` VARCHAR(128) NOT NULL,
CHANGE `m_announce` `m_announce` TINYINT(3) UNSIGNED DEFAULT '1' NOT NULL,
CHANGE `m_public` `m_ownership` TINYINT(3) UNSIGNED DEFAULT '1' NOT NULL,
CHANGE `m_password` `m_password` VARCHAR(32) NULL,
ADD COLUMN `last_used` INT(10) UNSIGNED NOT NULL AFTER `BannedList`;
-- Set already existing/current channels to use current timestamp (saves them from being unneccesarily cleaned up)
UPDATE `channels` SET last_used = UNIX_TIMESTAMP();
-- Add new column to item_instance table
ALTER TABLE `item_instance` ADD COLUMN `itemEntry` mediumint(8) unsigned NOT NULL DEFAULT '0' AFTER `guid`;

-- Set values for new column from corresponding columns in other tables
UPDATE item_instance ii, auctionhouse ah
SET ii.itemEntry = ah.item_template
WHERE ii.guid = ah.itemguid;

UPDATE item_instance ii, character_inventory ci
SET ii.itemEntry = ci.item_template
WHERE ii.guid = ci.item;

UPDATE item_instance ii, guild_bank_item gbi
SET ii.itemEntry = gbi.item_entry
WHERE ii.guid = gbi.item_guid;

UPDATE item_instance ii, mail_items mi
SET ii.itemEntry = mi.item_template
WHERE ii.guid = mi.item_guid;

-- Remove unnecessary columns
ALTER TABLE `auctionhouse` DROP COLUMN `item_template`;
ALTER TABLE `character_inventory` DROP COLUMN `item_template`;
ALTER TABLE `guild_bank_item` DROP COLUMN `item_entry`;
ALTER TABLE `mail_items` DROP COLUMN `item_template`;

-- Delete orphan records (use at your own risk)
-- DELETE FROM item_instance WHERE itemEntry = 0;
ALTER TABLE `character_aura`
  ADD COLUMN `item_guid`  bigint(20) UNSIGNED NOT NULL DEFAULT '0' AFTER `caster_guid`,
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (`guid`,`caster_guid`,`item_guid`,`spell`,`effect_mask`);
ALTER TABLE `creature_respawn` CHANGE COLUMN `respawntime` `respawntime` bigint(20) unsigned NOT NULL DEFAULT 0;
ALTER TABLE `gameobject_respawn` CHANGE COLUMN `respawntime` `respawntime` bigint(20) unsigned NOT NULL DEFAULT 0;
