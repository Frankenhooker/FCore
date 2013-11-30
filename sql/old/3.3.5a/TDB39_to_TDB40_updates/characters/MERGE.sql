-- Update arena_team table
ALTER TABLE `arena_team`
CHANGE `arenateamid` `arenaTeamId` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `captainguid` `captainGuid` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `BackgroundColor` `backgroundColor` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `EmblemStyle` `emblemStyle` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `EmblemColor` `emblemColor` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `BorderStyle` `borderStyle` TINYINT(3) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `BorderColor` `borderColor` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
ADD COLUMN `rating` SMALLINT(5) UNSIGNED NOT NULL AFTER `type`,
ADD COLUMN `seasonGames` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL AFTER `rating`,
ADD COLUMN `seasonWins` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL AFTER `seasonGames`,
ADD COLUMN `weekGames` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL AFTER `seasonWins`,
ADD COLUMN `weekWins` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL AFTER `weekGames`,
ADD COLUMN `rank` INT(10) UNSIGNED NOT NULL AFTER `weekWins`;

-- Move data from arena_team_stats to new columns in arena_team
UPDATE `arena_team` a, `arena_team_stats` s SET
`a`.`rating` = `s`.`rating`,
`a`.`seasonGames` = `s`.`played`,
`a`.`seasonWins` = `s`.`wins2`,
`a`.`weekGames` = `s`.`games`,
`a`.`weekWins` = `s`.`wins`,
`a`.`rank` = `s`.`rank`
WHERE `a`.`arenaTeamId` = `s`.`arenateamid`;

-- Remove arena_team_stats table
DROP TABLE `arena_team_stats`;

-- Update arena_team_member table
ALTER TABLE `arena_team_member`
CHANGE `arenateamid` `arenaTeamId` INT(10) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `played_week` `weekGames` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `wons_week` `weekWins` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `played_season` `seasonGames` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
CHANGE `wons_season` `seasonWins` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL,
ADD COLUMN `personalRating` SMALLINT(5) UNSIGNED DEFAULT '0' NOT NULL AFTER `seasonWins`;

-- Update character_arena_stats table
ALTER TABLE `character_arena_stats`
CHANGE `personal_rating` `personalRating` SMALLINT(5) NOT NULL,
CHANGE `matchmaker_rating` `matchMakerRating` SMALLINT(5) NOT NULL;
-- Update arena_team_member table
ALTER TABLE `arena_team_member`
DROP COLUMN `personalRating`;
ALTER TABLE `character_battleground_data`
    CHANGE `instance_id` `instanceId` int(10) unsigned NOT NULL COMMENT 'Instance Identifier',
    CHANGE `join_map` `joinMapId` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
    CHANGE `join_x` `joinX` float NOT NULL DEFAULT '0',
    CHANGE `join_y` `joinY` float NOT NULL DEFAULT '0',
    CHANGE `join_z` `joinZ` float NOT NULL DEFAULT '0',
    CHANGE `join_o` `joinO` float NOT NULL DEFAULT '0',
    CHANGE `taxi_start` `taxiStart` int(10) unsigned NOT NULL DEFAULT '0',
    CHANGE `taxi_end` `taxiEnd` int(10) unsigned NOT NULL DEFAULT '0',
    CHANGE `mount_spell` `mountSpell` mediumint(8) unsigned NOT NULL DEFAULT '0';
ALTER TABLE `character_homebind`
    CHANGE `map` `mapId` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
    CHANGE `zone` `zoneId` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
    CHANGE `position_x` `posX` float NOT NULL DEFAULT '0',
    CHANGE `position_y` `posY` float NOT NULL DEFAULT '0',
    CHANGE `position_z` `posZ` float NOT NULL DEFAULT '0';
ALTER TABLE `arena_team`
CHANGE `rating` `rating` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
CHANGE `rank` `rank` INT(10) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `arena_team_member`
ADD COLUMN `personalRating` SMALLINT(5) NOT NULL DEFAULT '0' AFTER guid;

UPDATE arena_team_member
INNER JOIN character_arena_stats ON arena_team_member.guid = character_arena_stats.guid
INNER JOIN arena_team ON arena_team.arenaTeamId = arena_team_member.arenaTeamId AND (slot = 0 AND TYPE = 2 OR slot = 1 AND TYPE = 3 OR slot = 2 AND TYPE = 5)
SET arena_team_member.personalRating = character_arena_stats.personalRating;

ALTER TABLE `character_arena_stats`
DROP COLUMN `personalRating`;
ALTER TABLE `corpse`
    CHANGE `guid` `corpseGuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
    CHANGE `player` `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
    CHANGE `map` `mapId` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
    CHANGE `position_x` `posX` float NOT NULL DEFAULT '0',
    CHANGE `position_y` `posY` float NOT NULL DEFAULT '0',
    CHANGE `position_z` `posZ` float NOT NULL DEFAULT '0',
    CHANGE `guild` `guildId` int(10) unsigned NOT NULL DEFAULT '0',
    CHANGE `corpse_type` `corpseType` tinyint(3) unsigned NOT NULL DEFAULT '0',
    CHANGE `instance` `instanceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Identifier';
ALTER TABLE `creature_respawn`
    CHANGE `respawntime` `respawnTime` int(10) unsigned NOT NULL DEFAULT '0',
    CHANGE `instance` `instanceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Identifier';
ALTER TABLE `gameobject_respawn`
    CHANGE `respawntime` `respawnTime` int(10) unsigned NOT NULL DEFAULT '0',
    CHANGE `instance` `instanceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Identifier';
ALTER TABLE corpse
    DROP PRIMARY KEY,
    DROP KEY `idx_type`,
    DROP KEY `instance`,
    DROP KEY `Idx_player`,
    DROP KEY `Idx_time`;

ALTER TABLE corpse
    ADD PRIMARY KEY (`corpseGuid`),
    ADD KEY `idx_type`(`corpseType`),
    ADD KEY `idx_instance`(`instanceId`),
    ADD KEY `idx_player`(`guid`),
    ADD KEY `idx_time`(`time`);

ALTER TABLE creature_respawn
    DROP PRIMARY KEY,
    DROP KEY `instance`;

ALTER TABLE creature_respawn
    ADD PRIMARY KEY (`guid`, `instanceId`),
    ADD KEY `idx_instance`(`instanceId`);

ALTER TABLE gameobject_respawn
    DROP PRIMARY KEY,
    DROP KEY `instance`;

ALTER TABLE gameobject_respawn
    ADD PRIMARY KEY (`guid`, `instanceId`),
    ADD KEY `idx_instance`(`instanceId`);
-- append extra zeros, only if the string is properly formatted (has 38 tokens)
UPDATE `characters` SET `equipmentCache`=CONCAT(`equipmentCache`,"0 0 0 0 0 0 0 0 ") WHERE (CHAR_LENGTH(`equipmentCache`) - CHAR_LENGTH(REPLACE(`equipmentCache`, ' ', ''))) = 38;
ALTER TABLE gm_subsurveys
    CHANGE `surveyid` `surveyId` int(10) unsigned NOT NULL AUTO_INCREMENT,
    CHANGE `subsurveyid` `subsurveyId` int(10) unsigned NOT NULL DEFAULT '0';

ALTER TABLE gm_subsurveys
    DROP PRIMARY KEY,
    ADD PRIMARY KEY(`surveyId`,`subsurveyId`);

ALTER TABLE gm_surveys
    CHANGE `surveyid` `surveyId` int(10) unsigned NOT NULL AUTO_INCREMENT,
    CHANGE `player` `guid` int(10) unsigned NOT NULL DEFAULT '0',
    CHANGE `overall_comment` `overallComment` longtext NOT NULL,
    CHANGE `timestamp` `createTime` int(10) unsigned NOT NULL DEFAULT '0';

ALTER TABLE gm_surveys
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`surveyId`);

ALTER TABLE gm_tickets
    CHANGE `guid` `ticketId` int(10) unsigned NOT NULL AUTO_INCREMENT,
    CHANGE `playerGuid` `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier of ticket creator',
    CHANGE `name` `name` varchar(12) NOT NULL COMMENT 'Name of ticket creator',
    CHANGE `createtime` `createTime` int(10) unsigned NOT NULL DEFAULT '0',
    CHANGE `map` `mapId` smallint(5) unsigned NOT NULL DEFAULT '0',
    CHANGE `timestamp` `lastModifiedTime` int(10) unsigned NOT NULL DEFAULT '0',
    CHANGE `closed` `closedBy` int(10) NOT NULL DEFAULT '0',
    CHANGE `assignedto` `assignedTo` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned';

ALTER TABLE gm_tickets
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`ticketId`);

ALTER TABLE lag_reports
    CHANGE `report_id` `reportId` int(10) unsigned NOT NULL AUTO_INCREMENT,
    CHANGE `player` `guid` int(10) unsigned NOT NULL DEFAULT '0',
    CHANGE `lag_type` `lagType` tinyint(3) unsigned NOT NULL DEFAULT '0',
    CHANGE `map` `mapId` smallint(5) unsigned NOT NULL DEFAULT '0';

ALTER TABLE lag_reports
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`reportId`);
ALTER TABLE `corpse` CHANGE COLUMN `phaseMask` `phaseMask` smallint(5) unsigned NOT NULL DEFAULT '1';
ALTER TABLE `character_banned` CHANGE COLUMN `guid` `guid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier';
ALTER TABLE `guild_rank` CHANGE `rname` `rname` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' NOT NULL;
ALTER TABLE `character_stats` ADD `resilience` INT UNSIGNED NOT NULL DEFAULT 0;
