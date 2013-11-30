ALTER TABLE `account_data`
CHANGE `account` `account` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `type` `type` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `time` `time` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `data` `data` BLOB NOT NULL;ALTER TABLE `addons`
ROW_FORMAT=DEFAULT,
CHANGE `crc` `crc` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `arena_team`
CHANGE `name` `name` VARCHAR(24) NOT NULL,
CHANGE `EmblemStyle` `EmblemStyle` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `BorderStyle` `BorderStyle` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `auctionhouse`
CHANGE `id` `id` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `auctioneerguid` `auctioneerguid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `itemguid` `itemguid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `itemowner` `itemowner` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `buyoutprice` `buyoutprice` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `time` `time` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `buyguid` `buyguid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `lastbid` `lastbid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `startbid` `startbid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `deposit` `deposit` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `bugreport`
ROW_FORMAT=DEFAULT,
CHANGE `id` `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifier';ALTER TABLE `channels`
ROW_FORMAT=DEFAULT,
CHANGE `BannedList` `BannedList` TEXT,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`m_name`, `m_team`);ALTER TABLE `characters`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier',
CHANGE `account` `account` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Account Identifier',
CHANGE `map` `map` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Map Identifier',
CHANGE `instance_id` `instance_id` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `instance_mode_mask` `instance_mode_mask` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `taximask` `taximask` TEXT NOT NULL,
CHANGE `totaltime` `totaltime` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `leveltime` `leveltime` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `logout_time` `logout_time` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `resettalents_cost` `resettalents_cost` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `resettalents_time` `resettalents_time` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `transguid` `transguid` MEDIUMINT(8) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `extra_flags` `extra_flags` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `stable_slots` `stable_slots` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `at_login` `at_login` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `zone` `zone` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `death_expire_time` `death_expire_time` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `watchedFaction` `watchedFaction` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `latency` `latency` MEDIUMINT(8) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `deleteInfos_Account` `deleteInfos_Account` INT(10) UNSIGNED NULL ,
CHANGE `deleteDate` `deleteDate` INT(10) UNSIGNED NULL ;ALTER TABLE `character_account_data`
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `type` `type` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `time` `time` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `data` `data` BLOB NOT NULL;ALTER TABLE `character_achievement`
CHANGE `guid` `guid` INT(10) UNSIGNED NOT NULL,
CHANGE `achievement` `achievement` SMALLINT(5) UNSIGNED NOT NULL,
CHANGE `date` `date` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `character_achievement_progress`
CHANGE `guid` `guid` INT(10) UNSIGNED NOT NULL,
CHANGE `criteria` `criteria` SMALLINT(5) UNSIGNED NOT NULL,
CHANGE `counter` `counter` INT(10) UNSIGNED NOT NULL,
CHANGE `date` `date` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `character_action`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `action` `action` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `character_arena_stats`
ENGINE=InnoDB,
CHANGE `slot` `slot` TINYINT(3) NOT NULL;ALTER TABLE `character_aura`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier',
CHANGE `spell` `spell` MEDIUMINT(8) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `character_banned`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Account id',
CHANGE `bandate` `bandate` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `unbandate` `unbandate` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `active` `active` TINYINT(3) UNSIGNED DEFAULT '1' NOT NULL;ALTER TABLE `character_battleground_data`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier',
CHANGE `instance_id` `instance_id` INT(10) UNSIGNED NOT NULL,
CHANGE `team` `team` SMALLINT(5) UNSIGNED NOT NULL,
CHANGE `join_map` `join_map` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `taxi_start` `taxi_start` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `taxi_end` `taxi_end` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `mount_spell` `mount_spell` MEDIUMINT(8) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `character_battleground_random`
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `character_declinedname`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier';ALTER TABLE `character_equipmentsets`
CHANGE `guid` `guid` INT(10) DEFAULT '0' NOT NULL,
CHANGE `setindex` `setindex` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `name` `name` VARCHAR(31) NOT NULL,
CHANGE `item0` `item0` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item1` `item1` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item2` `item2` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item3` `item3` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item4` `item4` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item5` `item5` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item6` `item6` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item7` `item7` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item8` `item8` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item9` `item9` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item10` `item10` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item11` `item11` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item12` `item12` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item13` `item13` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item14` `item14` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item15` `item15` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item16` `item16` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item17` `item17` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `item18` `item18` INT(10) UNSIGNED NOT NULL DEFAULT '0';ALTER TABLE `character_gifts`
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `item_guid` `item_guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `entry` `entry` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `flags` `flags` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `character_glyphs`
CHANGE `guid` `guid` INT(10) UNSIGNED NOT NULL,
CHANGE `glyph1` `glyph1` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `glyph2` `glyph2` SMALLINT(5) UNSIGNED DEFAULT '0' NULL ,
CHANGE `glyph3` `glyph3` SMALLINT(5) UNSIGNED DEFAULT '0' NULL ,
CHANGE `glyph4` `glyph4` SMALLINT(5) UNSIGNED DEFAULT '0' NULL ,
CHANGE `glyph5` `glyph5` SMALLINT(5) UNSIGNED DEFAULT '0' NULL ,
CHANGE `glyph6` `glyph6` SMALLINT(5) UNSIGNED DEFAULT '0' NULL ;ALTER TABLE `character_homebind`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier',
CHANGE `map` `map` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Map Identifier',
CHANGE `zone` `zone` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Zone Identifier';ALTER TABLE `character_instance`
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `instance` `instance` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `permanent` `permanent` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `character_inventory`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier',
CHANGE `bag` `bag` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `item` `item` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Item Global Unique Identifier';ALTER TABLE `character_pet`
ROW_FORMAT=DEFAULT,
CHANGE `id` `id` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `entry` `entry` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `owner` `owner` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `modelid` `modelid` INT(10) UNSIGNED DEFAULT '0' NULL ,
CHANGE `CreatedBySpell` `CreatedBySpell` MEDIUMINT(8) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `level` `level` SMALLINT(5) UNSIGNED DEFAULT '1' NOT NULL,
CHANGE `exp` `exp` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `Reactstate` `Reactstate` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `name` `name` VARCHAR(21) DEFAULT 'Pet' NOT NULL,
CHANGE `renamed` `renamed` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `slot` `slot` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `curhealth` `curhealth` INT(10) UNSIGNED DEFAULT '1' NOT NULL,
CHANGE `curmana` `curmana` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `curhappiness` `curhappiness` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `savetime` `savetime` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `resettalents_cost` `resettalents_cost` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `resettalents_time` `resettalents_time` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `abdata` `abdata` TEXT NULL;ALTER TABLE `character_pet_declinedname`
ROW_FORMAT=DEFAULT,
CHANGE `id` `id` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `owner` `owner` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `character_queststatus`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier',
CHANGE `quest` `quest` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Quest Identifier',
CHANGE `status` `status` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `explored` `explored` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `timer` `timer` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `mobcount1` `mobcount1` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `mobcount2` `mobcount2` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `mobcount3` `mobcount3` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `mobcount4` `mobcount4` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `itemcount1` `itemcount1` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `itemcount2` `itemcount2` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `itemcount3` `itemcount3` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `itemcount4` `itemcount4` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `character_queststatus_daily`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier',
CHANGE `quest` `quest` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Quest Identifier',
CHANGE `time` `time` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `character_queststatus_weekly`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier',
CHANGE `quest` `quest` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Quest Identifier';ALTER TABLE `character_reputation`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier',
CHANGE `faction` `faction` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `flags` `flags` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `character_skills`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED NOT NULL COMMENT 'Global Unique Identifier',
CHANGE `skill` `skill` SMALLINT(5) UNSIGNED NOT NULL,
CHANGE `value` `value` SMALLINT(5) UNSIGNED NOT NULL,
CHANGE `max` `max` SMALLINT(5) UNSIGNED NOT NULL;ALTER TABLE `character_social`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Character Global Unique Identifier',
CHANGE `friend` `friend` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Friend Global Unique Identifier',
CHANGE `flags` `flags` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Friend Flags',
DROP INDEX `guid`,
DROP INDEX `guid_flags`,
DROP INDEX `friend_flags`;ALTER TABLE `character_spell`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier',
CHANGE `spell` `spell` MEDIUMINT(8) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Spell Identifier';ALTER TABLE `character_spell_cooldown`
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier, Low part',
CHANGE `spell` `spell` MEDIUMINT(8) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Spell Identifier',
CHANGE `item` `item` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Item Identifier',
CHANGE `time` `time` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `character_stats`
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier, Low part';ALTER TABLE `character_talent`
CHANGE `guid` `guid` INT(10) UNSIGNED NOT NULL,
CHANGE `spell` `spell` MEDIUMINT(8) UNSIGNED NOT NULL;ALTER TABLE `character_tutorial`
ROW_FORMAT=DEFAULT,
CHANGE `account` `account` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Account Identifier',
DROP PRIMARY KEY,
ADD PRIMARY KEY (`account`),
DROP `realmid`,
CHANGE `tut0` `tut0` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `tut1` `tut1` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `tut2` `tut2` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `tut3` `tut3` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `tut4` `tut4` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `tut5` `tut5` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `tut6` `tut6` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `tut7` `tut7` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
DROP KEY `acc_key`;ALTER TABLE `corpse`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier',
CHANGE `player` `player` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Character Global Unique Identifier',
DROP COLUMN `zone`,
CHANGE `map` `map` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Map Identifier',
CHANGE `phaseMask` `phaseMask` TINYINT(3) UNSIGNED DEFAULT '1' NOT NULL,
CHANGE `flags` `flags` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `dynFlags` `dynFlags` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `time` `time` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `instance` `instance` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `creature_respawn`
CHANGE `respawntime` `respawntime` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `instance` `instance` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `game_event_condition_save`
CHANGE `event_id` `event_id` SMALLINT(5) UNSIGNED NOT NULL,
CHANGE `condition_id` `condition_id` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `gameobject_respawn`
CHANGE `respawntime` `respawntime` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `instance` `instance` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `game_event_save`
CHANGE `event_id` `event_id` SMALLINT(5) UNSIGNED NOT NULL,
CHANGE `next_start` `next_start` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `gm_subsurveys`
ROW_FORMAT=DEFAULT,
CHANGE `surveyid` `surveyid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
CHANGE `subsurveyid` `subsurveyid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `rank` `rank` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `comment` `comment` TEXT NOT NULL;ALTER TABLE `gm_surveys`
ROW_FORMAT=DEFAULT,
CHANGE `surveyid` `surveyid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
CHANGE `player` `player` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `mainSurvey` `mainSurvey` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `timestamp` `timestamp` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `gm_tickets`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
CHANGE `playerGuid` `playerGuid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `name` `name` VARCHAR(12) NOT NULL,
CHANGE `createtime` `createtime` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `map` `map` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `timestamp` `timestamp` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `closed` `closed` INT(11) DEFAULT '0' NOT NULL,
CHANGE `assignedto` `assignedto` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `completed` `completed` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `escalated` `escalated` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `viewed` `viewed` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `groups`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED NOT NULL,
CHANGE `leaderGuid` `leaderGuid` INT(10) UNSIGNED NOT NULL,
CHANGE `lootMethod` `lootMethod` TINYINT(3) UNSIGNED NOT NULL,
CHANGE `looterGuid` `looterGuid` INT(10) UNSIGNED NOT NULL,
CHANGE `lootThreshold` `lootThreshold` TINYINT(3) UNSIGNED NOT NULL,
CHANGE `icon1` `icon1` INT(10) UNSIGNED NOT NULL,
CHANGE `icon2` `icon2` INT(10) UNSIGNED NOT NULL,
CHANGE `icon3` `icon3` INT(10) UNSIGNED NOT NULL,
CHANGE `icon4` `icon4` INT(10) UNSIGNED NOT NULL,
CHANGE `icon5` `icon5` INT(10) UNSIGNED NOT NULL,
CHANGE `icon6` `icon6` INT(10) UNSIGNED NOT NULL,
CHANGE `icon7` `icon7` INT(10) UNSIGNED NOT NULL,
CHANGE `icon8` `icon8` INT(10) UNSIGNED NOT NULL,
CHANGE `groupType` `groupType` TINYINT(3) UNSIGNED NOT NULL,
CHANGE `raiddifficulty` `raiddifficulty` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `group_instance`
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `instance` `instance` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `permanent` `permanent` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `group_member`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED NOT NULL,
CHANGE `memberGuid` `memberGuid` INT(10) UNSIGNED NOT NULL;ALTER TABLE `guild`
ROW_FORMAT=DEFAULT,
CHANGE `guildid` `guildid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `name` `name` VARCHAR(24) DEFAULT '' NOT NULL,
CHANGE `leaderguid` `leaderguid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `EmblemStyle` `EmblemStyle` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `EmblemColor` `EmblemColor` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `BorderStyle` `BorderStyle` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `BorderColor` `BorderColor` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `BackgroundColor` `BackgroundColor` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `motd` `motd` VARCHAR(128) DEFAULT '' NOT NULL,
CHANGE `createdate` `createdate` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `BankMoney` `BankMoney` BIGINT(20) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `guild_bank_eventlog`
CHANGE `guildid` `guildid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Guild Identificator',
CHANGE `LogGuid` `LogGuid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Log record identificator - auxiliary column',
CHANGE `PlayerGuid` `PlayerGuid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `ItemOrMoney` `ItemOrMoney` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `ItemStackCount` `ItemStackCount` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `DestTabId` `DestTabId` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Destination Tab Id',
CHANGE `TimeStamp` `TimeStamp` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Event UNIX time';ALTER TABLE `guild_bank_item`
CHANGE `guildid` `guildid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `TabId` `TabId` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `item_guid` `item_guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `guild_bank_right`
CHANGE `guildid` `guildid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `TabId` `TabId` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `rid` `rid` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `SlotPerDay` `SlotPerDay` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `guild_bank_tab`
CHANGE `guildid` `guildid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `TabId` `TabId` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `TabName` `TabName` VARCHAR(16) DEFAULT '' NOT NULL,
CHANGE `TabText` `TabText` VARCHAR(500) NULL;ALTER TABLE `guild_eventlog`
CHANGE `guildid` `guildid` INT(10) UNSIGNED NOT NULL COMMENT 'Guild Identificator',
CHANGE `LogGuid` `LogGuid` INT(10) UNSIGNED NOT NULL COMMENT 'Log record identificator - auxiliary column',
CHANGE `EventType` `EventType` TINYINT(3) UNSIGNED NOT NULL COMMENT 'Event type',
CHANGE `PlayerGuid1` `PlayerGuid1` INT(10) UNSIGNED NOT NULL COMMENT 'Player 1',
CHANGE `PlayerGuid2` `PlayerGuid2` INT(10) UNSIGNED NOT NULL COMMENT 'Player 2',
CHANGE `NewRank` `NewRank` TINYINT(3) UNSIGNED NOT NULL COMMENT 'New rank(in case promotion/demotion)',
CHANGE `TimeStamp` `TimeStamp` INT(10) UNSIGNED NOT NULL COMMENT 'Event UNIX time';ALTER TABLE `guild_member`
ROW_FORMAT=DEFAULT,
CHANGE `guildid` `guildid` INT(10) UNSIGNED NOT NULL COMMENT 'Guild Identificator',
CHANGE `guid` `guid` INT(10) UNSIGNED NOT NULL,
CHANGE `rank` `rank` TINYINT(3) UNSIGNED NOT NULL,
CHANGE `pnote` `pnote` varchar(31) NOT NULL DEFAULT '',
CHANGE `offnote` `offnote` varchar(31) NOT NULL DEFAULT '',
CHANGE `BankResetTimeMoney` `BankResetTimeMoney` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `BankRemMoney` `BankRemMoney` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `BankResetTimeTab0` `BankResetTimeTab0` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `BankRemSlotsTab0` `BankRemSlotsTab0` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `BankResetTimeTab1` `BankResetTimeTab1` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `BankRemSlotsTab1` `BankRemSlotsTab1` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `BankResetTimeTab2` `BankResetTimeTab2` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `BankRemSlotsTab2` `BankRemSlotsTab2` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `BankResetTimeTab3` `BankResetTimeTab3` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `BankRemSlotsTab3` `BankRemSlotsTab3` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `BankResetTimeTab4` `BankResetTimeTab4` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `BankRemSlotsTab4` `BankRemSlotsTab4` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `BankResetTimeTab5` `BankResetTimeTab5` INT(10) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `BankRemSlotsTab5` `BankRemSlotsTab5` INT(10) UNSIGNED NOT NULL DEFAULT '0';ALTER TABLE `guild_rank`
ROW_FORMAT=DEFAULT,
CHANGE `guildid` `guildid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `rid` `rid` TINYINT(3) UNSIGNED NOT NULL,
CHANGE `rname` `rname` VARCHAR(15) DEFAULT '' NOT NULL,
CHANGE `rights` `rights` MEDIUMINT(8) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `BankMoneyPerDay` `BankMoneyPerDay` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `instance`
CHANGE `id` `id` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `map` `map` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `resettime` `resettime` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `difficulty` `difficulty` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `data` `data` TINYTEXT NOT NULL;ALTER TABLE `instance_reset`
CHANGE `mapid` `mapid` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `difficulty` `difficulty` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `resettime` `resettime` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `item_instance`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `owner_guid` `owner_guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `charges` `charges` TINYTEXT,
CHANGE `duration` `duration` INT(10) DEFAULT '0' NOT NULL,
CHANGE `flags` `flags` MEDIUMINT(8) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `randomPropertyId` `randomPropertyId` SMALLINT(5) DEFAULT '0' NOT NULL,
CHANGE `durability` `durability` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `text` `text` TEXT NULL;
ALTER TABLE `item_refund_instance`
ROW_FORMAT=DEFAULT,
CHANGE `item_guid` `item_guid` INT(10) UNSIGNED NOT NULL COMMENT 'Item GUID',
CHANGE `player_guid` `player_guid` INT(10) UNSIGNED NOT NULL COMMENT 'Player GUID',
CHANGE `paidMoney` `paidMoney` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `paidExtendedCost` `paidExtendedCost` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `item_soulbound_trade_data`
ROW_FORMAT=DEFAULT,
CHANGE `itemGuid` `itemGuid` INT(10) UNSIGNED NOT NULL COMMENT 'Item GUID';ALTER TABLE `lag_reports`
ROW_FORMAT=DEFAULT,
CHANGE `report_id` `report_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
CHANGE `player` `player` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `lag_type` `lag_type` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `map` `map` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `mail`
ROW_FORMAT=DEFAULT,
CHANGE `id` `id` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Identifier',
CHANGE `mailTemplateId` `mailTemplateId` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `sender` `sender` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Character Global Unique Identifier',
CHANGE `receiver` `receiver` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Character Global Unique Identifier',
CHANGE `expire_time` `expire_time` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `deliver_time` `deliver_time` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `money` `money` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `cod` `cod` INT(10) UNSIGNED DEFAULT '0' NOT NULL;

ALTER TABLE `mail_items`
CHANGE `mail_id` `mail_id` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `item_guid` `item_guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `receiver` `receiver` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Character Global Unique Identifier';ALTER TABLE `petition`
ROW_FORMAT=DEFAULT,
CHANGE `name` `name` VARCHAR(24) NOT NULL,
CHANGE `type` `type` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `petition_sign`
ROW_FORMAT=DEFAULT,
CHANGE `petitionguid` `petitionguid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `playerguid` `playerguid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `player_account` `player_account` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `type` `type` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `pet_aura`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier',
CHANGE `spell` `spell` MEDIUMINT(8) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `amount0` `amount0` MEDIUMINT(8) NOT NULL,
CHANGE `amount1` `amount1` MEDIUMINT(8) NOT NULL,
CHANGE `amount2` `amount2` MEDIUMINT(8) NOT NULL,
CHANGE `base_amount0` `base_amount0` MEDIUMINT(8) NOT NULL,
CHANGE `base_amount1` `base_amount1` MEDIUMINT(8) NOT NULL,
CHANGE `base_amount2` `base_amount2` MEDIUMINT(8) NOT NULL;ALTER TABLE `pet_spell`
ROW_FORMAT=DEFAULT,
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier',
CHANGE `spell` `spell` MEDIUMINT(8) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Spell Identifier',
CHANGE `active` `active` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `pet_spell_cooldown`
CHANGE `guid` `guid` INT(10) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Global Unique Identifier, Low part',
CHANGE `spell` `spell` MEDIUMINT(8) UNSIGNED DEFAULT '0' NOT NULL COMMENT 'Spell Identifier',
CHANGE `time` `time` INT(10) UNSIGNED DEFAULT '0' NOT NULL;ALTER TABLE `worldstates`
ROW_FORMAT=DEFAULT,
CHANGE `entry` `entry` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `value` `value` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `comment` `comment` TINYTEXT;
ALTER TABLE `character_inventory`
ADD UNIQUE KEY (`guid`,`bag`,`slot`);
--
-- Table structure for table `account_instance_times`
--
DROP TABLE IF EXISTS `account_instance_times`;
CREATE TABLE `account_instance_times` (
  `accountId` int(10) unsigned NOT NULL,
  `instanceId` int(10) unsigned NOT NULL DEFAULT '0',
  `releaseTime` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`,`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `instance` ADD COLUMN `completedEncounters` int(10) unsigned NOT NULL DEFAULT '0' AFTER `difficulty`;
ALTER TABLE `account_data` CHANGE COLUMN `account` `accountId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier';
RENAME TABLE `character_tutorial` TO `account_tutorial`;
ALTER TABLE `account_tutorial` CHANGE COLUMN `account` `accountId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier';
ALTER TABLE `channels` CHANGE COLUMN `m_name` `name` varchar(128) NOT NULL,
  CHANGE COLUMN `m_team` `team` int(10) unsigned NOT NULL,
  CHANGE COLUMN `m_announce` `announce` tinyint(3) unsigned NOT NULL DEFAULT '1',
  CHANGE COLUMN `m_ownership` `ownership` tinyint(3) unsigned NOT NULL DEFAULT '1',
  CHANGE COLUMN `m_password` `password` varchar(32) DEFAULT NULL,
  CHANGE COLUMN `BannedList` `bannedList` text,
  CHANGE COLUMN `last_used` `lastUsed` int(10) unsigned NOT NULL;
ALTER TABLE `corpse` CHANGE COLUMN `phaseMask` `phaseMask` smallint(5) unsigned NOT NULL DEFAULT '1';
-- Create temporary table that holds the entry conversion data. (See corresponding world db update)
CREATE TABLE `game_event_temp` (
  `entryOld` TINYINT(3) UNSIGNED NOT NULL,
  `entryNew` TINYINT(3) UNSIGNED NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- Renumbered entry data
INSERT INTO `game_event_temp` (`entryOld`,`entryNew`) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),
(23,23),(26,24),(27,25),(28,26),(29,27),(30,28),(31,29),(32,30),(33,31),(34,32),(35,33),(36,34),(37,35),(38,36),(39,37),(40,38),(41,39),(42,40),(43,41),(44,42),
(45,43),(46,44),(47,45),(48,46),(49,47),(50,48),(51,49),(52,50),(53,51),(54,52),(124,53),(125,54),(126,55),(127,56),(128,57),(129,58),(130,59),(131,60);

-- Update game_event_save
UPDATE `game_event_save`, `game_event_temp` SET `game_event_save`.`event_id` = `game_event_temp`.`entryNew` WHERE `game_event_save`.`event_id` = `game_event_temp`.`entryOld`;
ALTER TABLE `game_event_save` CHANGE `event_id` `eventEntry` TINYINT(3) UNSIGNED NOT NULL;

-- Update game_event_condition_save
UPDATE `game_event_condition_save`, `game_event_temp` SET `game_event_condition_save`.`event_id` = `game_event_temp`.`entryNew` WHERE `game_event_condition_save`.`event_id` = `game_event_temp`.`entryOld`;
ALTER TABLE `game_event_condition_save` CHANGE `event_id` `eventEntry` TINYINT(3) UNSIGNED NOT NULL;
-- Remove temporary table
DROP TABLE `game_event_temp`;