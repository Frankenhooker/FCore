UPDATE `version` SET `db_version`='TDB 335.52', `cache_id`=52 LIMIT 1;
-- Gossip Menu Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup`=21;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,21,518,0,0,27,0,10,3,0,0,'','Gossip text requires level 10 or higher'),
(14,21,519,0,0,27,0,10,2,0,0,'','Gossip text requires lower than level 10');
-- Gossip Options Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=21;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,21,0,0,0,27,0,10,3,0,0,'','Gossip Option requires level 10 or higher'),
(15,21,1,0,0,9,0,6981,0,0,0,'','Gossip Option requires quest not complete');
-- Add SAI for Royal Historian Archesonus Quest 3702
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry`=8879;
DELETE FROM `smart_scripts` WHERE `entryorguid`=8879 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(8879, 0, 0, 1, 62, 0, 100, 0, 1563, 0, 0, 0, 15, 3702, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Royal Historian Archesonus - Gossip Option 0 - Complete quest 3702'),
(8879, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Royal Historian Archesonus - Gossip Option 0 - Close Gossip');
-- Gossip Menu
DELETE FROM `gossip_menu` WHERE `entry` IN (1562,1563,1564,1565);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(1562,2238), (1563,2239), (1564,2237), (1565,2236);
-- Gossip Options
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (1561,1562,1563,1564,1565);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`) VALUES
(1561,0,0, 'I am ready, Historian Archesonus.',1,1,1565),
(1562,0,0, 'Unbelievable! How dare they??',1,1,1563),
(1563,0,0, 'Of course I will help!',1,1,0),
(1564,0,0, 'Interesting, continue please.',1,1,1562),
(1565,0,0, 'That is tragic. How did this happen?',1,1,1564);
-- Gossip Options Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=1561;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,1561,0,0,0,9,0,3702,0,0,0,'','Gossip Option requires quest taken');
-- Captain Vanessa Beltis
UPDATE `creature_template` SET `gossip_menu_id`=1641 WHERE `entry`=8380;
-- Gossip Menu
DELETE FROM `gossip_menu` WHERE `entry` IN (1641);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (1641,2293);

-- Franclorn Forgewright 8888
-- Gossip Menu
DELETE FROM `gossip_menu` WHERE `entry` IN (1664,1665,1666);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(1664,2316), (1665,2317), (1666,2318);
-- Gossip Options
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (1663,1664,1665);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`) VALUES
(1663,0,0, 'Amazing! I''ve never spoken to a ghost. I wish to learn!',1,1,1664),
(1664,0,0, 'Continue please.',1,1,1665),
(1665,0,0, 'Fascinating. Please, tell me more.',1,1,1666);

-- Ribbly Screwspigot
UPDATE `creature_template` SET `gossip_menu_id`=1970 WHERE `entry`=9543;
-- Gossip Menu
DELETE FROM `gossip_menu` WHERE `entry` IN (1970);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (1970,2643);

-- Arei "npc has two text, possible scripting required"
UPDATE `creature_template` SET `gossip_menu_id`=2063 WHERE `entry`=9598;
-- Gossip Menu
DELETE FROM `gossip_menu` WHERE `entry` IN (2063);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2063,2726), (2063,2809);

-- Add SAI for Un'Goro Crystal Pylon Quests 4285, 4287, 4288
UPDATE `gameobject_template` SET `AIName`= 'SmartGameObjectAI',`ScriptName`= '' WHERE `entry` IN (164955,164957,164956);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (164955,164957,164956) AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(164955, 1, 0, 0, 62, 0, 100, 0, 2177, 0, 0, 0, 15, 4285, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Northern Crystal Pylon - Gossip Option 0 - Complete quest 4285'),
(164957, 1, 0, 0, 62, 0, 100, 0, 2178, 0, 0, 0, 15, 4287, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Eastern Crystal Pylon - Gossip Option 0 - Complete quest 4287'),
(164956, 1, 0, 0, 62, 0, 100, 0, 2179, 0, 0, 0, 15, 4288, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Western Crystal Pylon - Gossip Option 0 - Complete quest 4288');
-- Gossip Menu
DELETE FROM `gossip_menu` WHERE `entry` IN (2177,2178,2179,2180,2181,2182);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(2177,2810),(2177,2933),(2178,2810),(2178,2933),(2179,2810),(2179,2933),(2180,2811),(2181,2812),(2182,2813);
-- Gossip Options
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (2177,2178,2179);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`) VALUES
(2177,0,0, 'I want to examine this pylon.',1,1,2181),
(2178,0,0, 'I want to examine this pylon.',1,1,2180),
(2179,0,0, 'I want to examine this pylon.',1,1,2182);
-- Gossip Options Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (2177,2178,2179);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,2177,0,0,0,9,0,4285,0,0,0,'','Gossip Option requires quest not complete'),
(15,2178,0,0,0,9,0,4287,0,0,0,'','Gossip Option requires quest not complete'),
(15,2179,0,0,0,9,0,4288,0,0,0,'','Gossip Option requires quest not complete');
UPDATE `spell_script_names` SET `ScriptName`='spell_gen_clone' WHERE `ScriptName`='spell_generic_clone';
UPDATE `spell_script_names` SET `ScriptName`='spell_gen_clone_weapon' WHERE `ScriptName`='spell_generic_clone_weapon';
UPDATE `spell_script_names` SET `ScriptName`='spell_gen_30pct_count_pct_from_max_hp' WHERE `ScriptName`='spell_gen_touch_the_nightmare';
UPDATE `spell_script_names` SET `ScriptName`='spell_gen_creature_permanent_feign_death' WHERE `ScriptName`='spell_creature_permanent_feign_death';
-- Fix There's Something About the Squire
UPDATE `conditions` SET `ConditionTarget`=1 WHERE  `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=63126  AND `ConditionTypeOrReference`=9;
DELETE FROM `spell_script_names` WHERE `spell_id` IN (66725,68161,66808,68160,66765,67333,66809,67331);
INSERT INTO `spell_script_names` (`spell_id` ,`ScriptName`) VALUES
(66725, 'spell_koralon_meteor_fists'),
(68161, 'spell_koralon_meteor_fists'),
(66808, 'spell_flame_warder_meteor_fists'),
(68160, 'spell_flame_warder_meteor_fists'),
(66765, 'spell_koralon_meteor_fists_damage'),
(67333, 'spell_koralon_meteor_fists_damage'),
(66809, 'spell_koralon_meteor_fists_damage'),
(67331, 'spell_koralon_meteor_fists_damage');

DELETE FROM `spell_proc_event` WHERE `entry` IN (66808,68160);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`procFlags`,`procEx`,`ppmRate`,`CustomChance`,`Cooldown`) VALUES
(66808,0,0,0,0,0,0x4,0,0,0,0),
(68160,0,0,0,0,0,0x4,0,0,0,0);
DELETE FROM `spell_script_names` WHERE `spell_id` IN (69051,69023,69048);
INSERT INTO `spell_script_names` (`spell_id` ,`ScriptName`) VALUES
(69051, 'spell_devourer_of_souls_mirrored_soul'),
(69023, 'spell_devourer_of_souls_mirrored_soul_proc'),
(69048, 'spell_devourer_of_souls_mirrored_soul_target_selector');
-- TEXT INSERTS
DELETE FROM `creature_text` WHERE `entry` IN (31301, 31428, 31306);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(31301, 0, 0, "You dare to think you have thwarted my will? That you have broken my plans?", 12, 0, 100, 25, 0, 0, "LK SAY 1"),
(31301, 1, 0, "You have accomplished nothing!", 12, 0, 100, 22, 0, 0, "LK SAY 2"),
(31301, 2, 0, "Your feeble resistance has only hastened your doom.", 12, 0, 100, 25, 0, 0, "LK SAY 3"),
(31301, 3, 0, "So spout your platitudes and flail until you are spent. In the end, you will be mine, and Morbidus will be the harbinger of your death!", 12, 0, 100, 22, 0, 0, "LK SAY 4"),
(31301, 4, 0, "Morbidus, show them what happens to those who defy the will of their king!", 12, 0, 100, 25, 0, 0, "LK SAY 5"),
(31428, 0, 0, "You will pay for what you've done! For the Argent Crusade!", 12, 0, 100, 0, 0, 0, "OLAKIN SAY 1"),
(31306, 0, 0, "Knights of the Ebon Blade, prepare for battle!", 12, 0, 100, 1, 0, 0, 'DHAKAR SAY 1');

-- ScriptName Updates
UPDATE `creature_template` SET `ScriptName`='npc_margrave_dhakar' WHERE `entry`=31306;
UPDATE `creature_template` SET `ScriptName`='npc_morbidus' WHERE `entry`=30698;

-- Template updates
UPDATE `creature_template` SET `faction_A`=2102, `faction_H`=2102, `exp`=2, `minlevel`=80, `maxlevel`=80, `unit_flags`=`unit_flags`|832, `speed_run`=0.99206, `VehicleId`=271 WHERE `entry`=30698; -- Morbidus
UPDATE `creature_template` SET `faction_A`=1770, `faction_H`=1770, `npcflag`=`npcflag`|1, `gossip_menu_id`=10060 WHERE `entry`=31306; -- Margrave Dhakar

UPDATE `creature_model_info` SET `bounding_radius`=0.465,`combat_reach`=7.5,`gender`=0 WHERE `modelid`=31176; -- Morbidus
UPDATE `creature_model_info` SET `bounding_radius`=0.3825,`combat_reach`=1.875,`gender`=0 WHERE `modelid`=27558; -- Margrave Dhakar

DELETE FROM `creature_template_addon` WHERE `entry` IN (30698, 31306);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(30698,0,0,1,0, NULL), -- Morbidus
(31306,0,0,1,0, NULL); -- Margrave Dhakar
-- equipment for Margrave Dhakar
DELETE FROM `creature_equip_template` WHERE `entry` = 31306;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES 
(31306, 1, 41371, 0, 0);
ALTER TABLE `gameobject` CHANGE `phaseMask` `phaseMask` int(10) unsigned NOT NULL DEFAULT '1';
ALTER TABLE `creature` CHANGE `phaseMask` `phaseMask` int(10) unsigned NOT NULL DEFAULT '1';
-- DTK instance entrance portals
DELETE FROM `gameobject` WHERE `guid`=151225;
SET @OGUID  := 6120; -- (need 3)
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+2;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@OGUID+0,192585,571,1,1,4774.532,-2020.723,232.3105,-1.579522,0,0,0.9999905,0.004363241,120,255,1),
(@OGUID+1,192776,571,1,1,4774.532,-2020.723,232.3105,-1.579522,0,0,0.9999905,0.004363241,120,255,1),
(@OGUID+2,192775,571,1,1,4774.532,-2020.723,232.3105,-1.579522,0,0,0.9999905,0.004363241,120,255,1);

-- Gundrak south instance entrance portals
SET @OGUID  := 5287; -- (need 2)
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+1;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@OGUID+0,192635,571,1,1,6700.195,-4662.38,446.7864,3.909541,0,0,0.3746067,0.9271838,120,255,1),
(@OGUID+1,192170,571,1,1,6700.195,-4662.38,446.7864,3.909541,0,0,0.3746067,0.9271838,120,255,1);
/*
 # Collection of Feedback-PatchFixes / 20.07.2013
 #
 # Including sql codestyle updates and check for accuracy. (one by one)
 # by FireEmerald / Thx @DDuarte for the base pull request.
 #
 # Including:
 # DB/Spell: Update: Correct Spell Power Coefficient (107.43%) for Tranquility | by lendan (@6232)
 # DB/LOS: Add: Ignore LOS for Ignite Horde Siege Engine | by dr-j (@6718)
 # DB/SmartAI: Update: Correct casted spell by Defias Rogue Wizard | by Rochet2 (@9976)
 # DB/Quest: Fix: Bloody Imp-ossible! (10924) | by Kirkhammett (@10276)
 # DB/Quest: Fix: Mistcaller Yngvar (14102) / Add missing event script and conditions. | (@3563)
 # DB/SmartAI: Update: Give quest credit for The Ring of Blood: The Final Challenge (9977) | by JunkyBulgaria (@7724)
 # DB/Waypoints: Add: Missing waypoints for Mmmrrrggglll | by Hobbilis (@9602)
 # DB/Conditions: Add: Missing conditions for Displacing Temporal Rift | by FireEmerald
*/

-- DB/Spell: Update: Correct Spell Power Coefficient (107.43%) for Tranquility | by lendan (@6232)
SET @SPELL          := 44203; -- Tranquility

UPDATE `spell_bonus_data` SET `direct_bonus` = 1.0743 WHERE `entry` = @SPELL;

-- DB/Quest: Fix: A Dire Situation (10506) | by Rohlik & Exodius (@6283)
SET @WOLF           := 20058; -- Bloodmaul Dire Wolf
SET @SPELL_INVIS    := 18950; -- Invisibility and Stealth Detection
SET @WOLF_TRIGGER   := 21176; -- Bloodmaul Dire Wolf Trigger
SET @SPELL_POWDER   := 36310; -- Rina's Diminution Powder

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @WOLF;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = @WOLF;

DELETE FROM `smart_scripts` WHERE `entryorguid` = @WOLF AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@WOLF, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 75, @SPELL_INVIS, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmaul Dire Wolf - On spawn - Add Invisibility and Stealth Detection Aura on self');

DELETE FROM `event_scripts` WHERE `id` = 13584;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`) VALUES
(13584, 2, 8, @WOLF_TRIGGER);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = @SPELL_POWDER;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,@SPELL_POWDER,0,31,1,3,@WOLF,0,0,0,'', 'Rina''s Diminution Powder can be used only on Bloodmaul Dire Wolf');

-- DB/LOS: Add: Ignore LOS for Ignite Horde Siege Engine | by dr-j (@6718)
SET @IGNITE         := 32979; -- Ignite Horde Siege Engine

DELETE FROM `disables` WHERE `sourceType` = 0 AND `entry` = @IGNITE;
INSERT INTO `disables`(`sourceType`,`entry`,`flags`,`comment`) VALUES
(0,@IGNITE,64,'Ignore LOS on Ignite Horde Siege Engine');

-- DB/SmartAI: Update: Correct casted spell by Defias Rogue Wizard | by Rochet2 (@9976)
SET @WIZARD         :=   474; -- Rogue Wizard
SET @SPELL          := 13322; -- Frostbolt

UPDATE `smart_scripts` SET `action_param2`= @SPELL WHERE `entryorguid` = @WIZARD AND `source_type` = 0 AND `id` = 0 AND `link` = 0;

-- DB/Quest: Fix: Bloody Imp-ossible! (10924) | by Kirkhammett (@10276)
SET @CHASER         := 18884; -- Warp Chaser
SET @ZEPPIT         := 22484; -- Zeppit
SET @SPELL_INVIS    := 32942; -- Phasing Invisibility
SET @SPELL_CHARGE   := 37417; -- Warp Charge
SET @SPELL_BITE     := 32739; -- Venomous Bite
SET @SPELL_BLOOD    := 39244; -- Gather Warp Chaser Blood

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = @CHASER;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CHASER;

DELETE FROM `smart_scripts` WHERE `entryorguid` = @CHASER;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@CHASER,0,0,0,11,0,100,0,0,0,0,0,11,@SPELL_INVIS,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Warp Chaser - On Spawn - Cast Phasing Invisibility'),
(@CHASER,0,1,0,0,0,100,0,500,2000,7000,15000,11,@SPELL_CHARGE,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Warp Chaser - In Combat - Cast Charge'),
(@CHASER,0,2,0,0,0,100,0,3000,5000,10000,15000,11,@SPELL_BITE,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Warp Chaser - In Combat - Cast Venomous Bite'),
(@CHASER,0,3,0,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,@ZEPPIT,10,0,0,0,0,0, 'Warp Chaser - On Death - Set Data on Zeppit');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = @ZEPPIT;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @ZEPPIT;

DELETE FROM `smart_scripts` WHERE `entryorguid` = @ZEPPIT;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ZEPPIT,0,0,0,38,0,100,0,1,1,0,0,11,@SPELL_BLOOD,0,0,0,0,0,21,10,0,0,0,0,0,0, 'Zeppit - On Data Set - Cast on Master');

-- DB/Quest: Fix: Mistcaller Yngvar (14102) / Add missing event script and conditions. | (@3563)
SET @ENTRY          := 34965; -- Mistcaller Yngvar
SET @SPELL          := 66621; -- Summon the Mistcaller
SET @QUEST          := 14102; -- Mistcaller Yngvar (Quest)

DELETE FROM `event_scripts` WHERE `id` = 21997 AND `command` = 10;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(21997, 2, 10, @ENTRY, 120000, 0, 10181.96, 1183.417, 76.12115, 5.934119);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = @SPELL;
INSERT INTO `conditions` (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, comment ) VALUES
(17, 0, @SPELL, 0, 0, 29, @ENTRY, 40, 0, 1, 0, "Cant use Mistcallers Charm within 40 yards of Yngvar"),
(17, 0, @SPELL, 0, 0, 28, @QUEST, 0, 0, 1, 0, "Cant use Mistcallers Charm, if player has quest objective completed, but not yet rewarded.");

-- DB/SmartAI: Update: Give quest credit for The Ring of Blood: The Final Challenge (9977) | by JunkyBulgaria (@7724)
SET @MOGOR  := 18069; -- Mogor <Hero of the Warmaul>
SET @QUEST  :=  9977; -- The Ring of Blood: The Final Challenge

DELETE FROM `smart_scripts` WHERE `entryorguid` = @MOGOR AND `source_type` = 0 AND `id` = 14;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@MOGOR, 0, 14, 0, 6, 0, 100, 1, 0, 0, 0, 0, 15, @QUEST, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 'Mogor - On Death - Give Quest Credit');

-- DB/Waypoints: Add: Missing waypoints for Mmmrrrggglll | by Hobbilis (@9602)
SET @MURLOC         :=  15937; -- Mmmrrrggglll
SET @GUID           :=  41792;
SET @PATH           := 417920;

-- Set creature location
UPDATE `creature` SET `MovementType`=2,`position_x`=8869.872,`position_y`=-5775.960,`position_z`=0.405, `spawnDist`=0, `currentwaypoint`=1 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`, `path_id`, `bytes2`) VALUES (@GUID, @PATH, 1);

-- Waypoint Data
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH, 1, 8880.688, -5754.608, 0.25531, 0, 0, 0, 0, 100, 0),
(@PATH, 2, 8873.341, -5735.012, 0.43308, 0, 0, 0, 0, 100, 0),
(@PATH, 3, 8862.790, -5722.625, 0.42263, 0, 0, 0, 0, 100, 0),
(@PATH, 4, 8846.429, -5720.661, 0.49396, 0, 0, 0, 0, 100, 0),
(@PATH, 5, 8836.920, -5726.737, 0.83736, 0, 0, 0, 0, 100, 0),
(@PATH, 6, 8828.789, -5743.622, 0.82590, 0, 0, 0, 0, 100, 0),
(@PATH, 7, 8818.041, -5755.890, 0.64673, 0, 0, 0, 0, 100, 0),
(@PATH, 8, 8804.548, -5762.792, 0.51199, 0, 0, 0, 0, 100, 0),
(@PATH, 9, 8791.789, -5762.271, 0.45083, 0, 0, 0, 0, 100, 0),
(@PATH, 10, 8777.225, -5753.970, 0.55571, 0, 0, 0, 0, 100, 0),
(@PATH, 11, 8776.860, -5738.229, 0.61609, 0, 0, 0, 0, 100, 0),
(@PATH, 12, 8785.234, -5722.790, 0.75764, 0, 0, 0, 0, 100, 0),
(@PATH, 13, 8786.402, -5701.790, 0.67103, 0, 0, 0, 0, 100, 0),
(@PATH, 14, 8771.277, -5696.080, 0.67596, 0, 0, 0, 0, 100, 0),
(@PATH, 15, 8758.604, -5694.220, 0.55669, 0, 0, 0, 0, 100, 0),
(@PATH, 16, 8746.010, -5704.514, 0.50786, 0, 0, 0, 0, 100, 0),
(@PATH, 17, 8735.815, -5722.942, 0.94607, 0, 0, 0, 0, 100, 0),
(@PATH, 18, 8720.269, -5730.856, 0.89406, 0, 0, 0, 0, 100, 0),
(@PATH, 19, 8706.965, -5730.076, 0.77437, 0, 0, 0, 0, 100, 0),
(@PATH, 20, 8693.575, -5720.971, 0.86999, 0, 0, 0, 0, 100, 0),
(@PATH, 21, 8679.183, -5710.540, 1.10842, 0, 0, 0, 0, 100, 0),
(@PATH, 22, 8656.022, -5704.337, 1.80973, 0, 0, 0, 0, 100, 0),
(@PATH, 23, 8640.976, -5691.507, 0.47690, 0, 0, 0, 0, 100, 0),
(@PATH, 24, 8635.418, -5689.706, 0.53144, 0, 0, 0, 0, 100, 0),
(@PATH, 25, 8620.438, -5687.679, 0.86486, 0, 0, 0, 0, 100, 0),
(@PATH, 26, 8601.687, -5688.443, 0.49338, 1.930, 36000, 0, 0, 100, 0),
(@PATH, 27, 8619.985, -5679.970, 0.75128, 0, 0, 0, 0, 100, 0),
(@PATH, 28, 8635.668, -5671.577, 0.53144, 0, 0, 0, 0, 100, 0),
(@PATH, 29, 8648.297, -5670.150, 0.49488, 0, 0, 0, 0, 100, 0),
(@PATH, 30, 8664.989, -5679.421, 0.55752, 0, 0, 0, 0, 100, 0),
(@PATH, 31, 8679.183, -5710.540, 1.10842, 0, 0, 0, 0, 100, 0),
(@PATH, 32, 8693.575, -5720.971, 0.86999, 0, 0, 0, 0, 100, 0),
(@PATH, 33, 8706.965, -5730.076, 0.77437, 0, 0, 0, 0, 100, 0),
(@PATH, 34, 8721.716, -5745.012, 0.62278, 0, 0, 0, 0, 100, 0),
(@PATH, 35, 8735.529, -5753.923, 1.24721, 0, 0, 0, 0, 100, 0),
(@PATH, 36, 8767.193, -5758.179, 0.50536, 0, 0, 0, 0, 100, 0),
(@PATH, 37, 8791.789, -5762.271, 0.45083, 0, 0, 0, 0, 100, 0),
(@PATH, 38, 8804.548, -5762.792, 0.51199, 0, 0, 0, 0, 100, 0),
(@PATH, 39, 8818.041, -5755.890, 0.64673, 0, 0, 0, 0, 100, 0),
(@PATH, 40, 8828.789, -5743.622, 0.82590, 0, 0, 0, 0, 100, 0),
(@PATH, 41, 8836.920, -5726.737, 0.83736, 0, 0, 0, 0, 100, 0),
(@PATH, 42, 8846.429, -5720.661, 0.49396, 0, 0, 0, 0, 100, 0),
(@PATH, 43, 8873.341, -5735.012, 0.43308, 0, 0, 0, 0, 100, 0),
(@PATH, 44, 8880.688, -5754.608, 0.25531, 6.105, 60000, 0, 0, 100, 0);

-- DB/Conditions: Add: Missing conditions for Displacing Temporal Rift | by FireEmerald
SET @PARASITE       := 10717; -- Temporal Parasite
SET @SPELL          := 16613; -- Displacing Temporal Rift
SET @QUEST          :=  4971; -- A Matter of Time

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = @SPELL;
INSERT INTO `conditions` (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, comment ) VALUES
(17, 0, @SPELL, 0, 0, 29, @PARASITE, 100, 0, 1, 0, "Cant use Temporal Displacer within 100 yards of Temporal Parasite"),
(17, 0, @SPELL, 0, 0, 28, @QUEST, 0, 0, 1, 0, "Cant use Temporal Displacer, if player has quest objective completed, but not yet rewarded");
UPDATE `gameobject_template` SET `flags`=48, `ScriptName`='go_activation_crystal' WHERE `entry`=193611;

UPDATE `creature_template` SET `flags_extra`=130, `ScriptName`='npc_violet_hold_arcane_sphere' WHERE `entry`=30837;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=57930;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 57930, 0, 0, 32, 0, 16, 0, 0, 1, 0, 0, '', 'Spell Arcane Lightning hit players');
UPDATE `creature_template` SET `InhabitType` = 5 WHERE `entry` = 10184;
DELETE FROM `spell_script_names` WHERE `spell_id` IN (63310,50421,23780,33896,37594,37705,23551,23552,23572);
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES
(63310,'spell_warl_glyph_of_shadowflame'),
(50421,'spell_dk_scent_of_blood'),
(23780,'spell_item_aegis_of_preservation'),
(33896,'spell_item_desperate_defense'),
(37594,'spell_pri_item_greater_heal_refund'),
(37705,'spell_pal_item_healing_discount'),
(23551,'spell_sha_item_lightning_shield'),
(23552,'spell_sha_item_lightning_shield_trigger'),
(23572,'spell_sha_item_mana_surge');
DELETE FROM `spell_ranks` WHERE `first_spell_id` IN (
5923,
5952,
9452,
9453,
9799,
11069,
11070,
11071,
11078,
11083,
11094,
11095,
11100,
11103,
11108,
11115,
11119,
11124,
11151,
11160,
11170,
11175,
11180,
11185,
11189,
11190,
11207,
11210,
11213,
11222,
11232,
11237,
11242,
11247,
11252,
11255,
12163,
12281,
12282,
12284,
12285,
12286,
12287,
12289,
12290,
12295,
12297,
12298,
12299,
12300,
12301,
12308,
12311,
12312,
12313,
12317,
12318,
12319,
12320,
12321,
12322,
12324,
12329,
12700,
12797,
12834,
12862,
13705,
13706,
13709,
13712,
13713,
13715,
13732,
13733,
13741,
13742,
13743,
13754,
13958,
13960,
13975,
13976,
13981,
13983,
14057,
14076,
14079,
14082,
14113,
14128,
14138,
14144,
14156,
14158,
14162,
14165,
14168,
14171,
14174,
14179,
14186,
14520,
14521,
14522,
14523,
14531,
14747,
14748,
14749,
14750,
14889,
14892,
14898,
14901,
14908,
14909,
14910,
14911,
14912,
14913,
15058,
15257,
15259,
15260,
15270,
15273,
15274,
15275,
15318,
15337,
15392,
16035,
16038,
16039,
16040,
16043,
16086,
16089,
16173,
16176,
16178,
16179,
16180,
16181,
16182,
16184,
16187,
16194,
16252,
16254,
16255,
16256,
16258,
16259,
16261,
16262,
16266,
16462,
16487,
16493,
16513,
16538,
16578,
16757,
16814,
16819,
16821,
16833,
16836,
16845,
16850,
16858,
16880,
16896,
16909,
16929,
16934,
16940,
16942,
16947,
16966,
16972,
16998,
17002,
17003,
17050,
17056,
17063,
17069,
17074,
17104,
17106,
17111,
17118,
17123,
17322,
17485,
17778,
17783,
17788,
17793,
17804,
17810,
17815,
17917,
17927,
17954,
17959,
18094,
18096,
18119,
18126,
18135,
18174,
18179,
18182,
18213,
18218,
18271,
18427,
18459,
18462,
18530,
18551,
18692,
18694,
18697,
18703,
18705,
18709,
18731,
18754,
18767,
18769,
18827,
19159,
19168,
19184,
19255,
19286,
19290,
19295,
19370,
19376,
19407,
19416,
19421,
19426,
19454,
19461,
19464,
19485,
19498,
19507,
19549,
19552,
19559,
19572,
19578,
19583,
19590,
19598,
19609,
19616,
19621,
20042,
20049,
20060,
20096,
20101,
20111,
20117,
20127,
20138,
20143,
20174,
20177,
20196,
20205,
20210,
20224,
20234,
20237,
20244,
20254,
20257,
20262,
20335,
20359,
20468,
20487,
20500,
20502,
20504,
23584,
23785,
24443,
24968,
25956,
26022,
27789,
27811,
27839,
27900,
28574,
28996,
28999,
29062,
29074,
29082,
29140,
29187,
29192,
29206,
29438,
29441,
29447,
29590,
29593,
29598,
29721,
29723,
29759,
29787,
29834,
29836,
29888,
30054,
30060,
30143,
30160,
30242,
30288,
30293,
30299,
30319,
30664,
30672,
30675,
30802,
30812,
30816,
30864,
30867,
30872,
30881,
30892,
30894,
30902,
30919,
31122,
31124,
31130,
31208,
31211,
31216,
31221,
31226,
31228,
31234,
31244,
31380,
31569,
31571,
31574,
31579,
31584,
31638,
31641,
31656,
31667,
31670,
31674,
31679,
31682,
31785,
31822,
31825,
31828,
31833,
31837,
31844,
31848,
31850,
31858,
31866,
31871,
31876,
31879,
32043,
32381,
32385,
32477,
33142,
33150,
33158,
33167,
33186,
33191,
33201,
33213,
33221,
33589,
33592,
33597,
33600,
33603,
33851,
33853,
33859,
33872,
33879,
33881,
33886,
34151,
34293,
34297,
34453,
34455,
34462,
34466,
34475,
34482,
34485,
34491,
34494,
34497,
34500,
34506,
34753,
34908,
34935,
34948,
34950,
35029,
35100,
35104,
35363,
35446,
35541,
35578,
35691,
37116,
44378,
44394,
44397,
44400,
44404,
44442,
44445,
44449,
44543,
44546,
44557,
44566,
44745,
45234,
46854,
46859,
46865,
46867,
46908,
46910,
46913,
46945,
46951,
47195,
47198,
47201,
47220,
47230,
47236,
47245,
47258,
47266,
47294,
47507,
47509,
47516,
47535,
47558,
47562,
47569,
47573,
47580,
47586,
48384,
48389,
48409,
48411,
48432,
48483,
48488,
48492,
48496,
48506,
48516,
48532,
48535,
48539,
48962,
48963,
48965,
48977,
48978,
48979,
48985,
48987,
48988,
48997,
49004,
49006,
49013,
49015,
49018,
49023,
49024,
49027,
49032,
49036,
49042,
49137,
49140,
49145,
49146,
49149,
49175,
49182,
49186,
49188,
49189,
49200,
49202,
49208,
49217,
49219,
49220,
49223,
49224,
49226,
49455,
49467,
49471,
49588,
50040,
50117,
50187,
50365,
50384,
50391,
50685,
50880,
51099,
51123,
51179,
51459,
51466,
51468,
51474,
51480,
51483,
51521,
51523,
51525,
51528,
51554,
51556,
51560,
51562,
51625,
51627,
51632,
51634,
51664,
51672,
51682,
51685,
51692,
51698,
51708,
51745,
51883,
52234,
52783,
52795,
53137,
53175,
53178,
53180,
53182,
53186,
53203,
53215,
53221,
53228,
53234,
53241,
53252,
53256,
53262,
53290,
53295,
53298,
53302,
53375,
53379,
53380,
53409,
53427,
53450,
53481,
53483,
53486,
53501,
53511,
53514,
53527,
53551,
53554,
53556,
53569,
53583,
53590,
53620,
53660,
53671,
53695,
53709,
53754,
54037,
54117,
54347,
54639,
54747,
55061,
55091,
55107,
55129,
55620,
55666,
56314,
56333,
56339,
56342,
56636,
56927,
57470,
57810,
57849,
57873,
57878,
58414,
58872,
59088,
61154,
61216,
61680,
61682,
61686,
61689,
62097,
62758,
62759,
62764,
62905,
63117,
63156,
63349,
63370,
63373,
63410,
63504,
63534,
63625,
63646,
63730,
64127,
64353,
65661,
66799);
DELETE FROM `trinity_string` WHERE entry = 850;
INSERT INTO `trinity_string` (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES
(850, '├─ Rank: %s (ID: %u)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
ALTER TABLE `spell_proc_event`   
  CHANGE `entry` `entry` MEDIUMINT(8) DEFAULT 0  NOT NULL;

DELETE FROM `spell_proc_event` WHERE `entry` IN (
325,
905,
945,
8134,
8494,
8495,
10191,
10192,
10193,
10431,
10432,
11120,
12487,
12488,
12574,
12575,
12576,
12577,
12598,
12668,
12724,
12725,
12726,
12727,
12799,
12812,
12813,
12814,
12815,
12846,
12847,
12848,
12849,
12867,
12872,
12873,
12958,
12967,
12968,
12969,
12970,
12971,
12972,
12973,
12974,
13867,
14070,
14071,
14160,
14161,
14190,
14193,
14194,
14195,
14318,
14319,
14320,
14321,
14322,
14774,
15338,
15362,
15363,
16196,
16198,
16235,
16240,
16277,
16278,
16279,
16280,
16281,
16282,
16283,
16284,
16489,
16492,
16544,
16923,
16924,
16954,
16961,
17107,
17108,
17796,
17801,
17802,
17803,
18073,
18095,
18120,
19387,
19388,
19573,
20056,
20057,
20179,
20180,
20181,
20182,
20212,
20213,
20214,
20215,
20235,
20336,
20337,
20501,
20927,
20928,
23695,
24398,
25296,
25469,
25472,
25988,
27044,
27131,
27179,
27815,
27816,
28592,
28593,
29075,
29076,
29179,
29180,
29444,
29594,
29838,
30295,
30296,
30301,
30302,
30678,
30679,
30705,
30883,
30884,
30885,
30886,
31126,
31245,
31570,
31572,
31657,
31658,
31835,
31836,
31872,
31877,
31878,
32387,
32392,
32393,
32394,
32593,
32594,
33145,
33146,
33154,
33192,
33193,
33736,
33882,
33883,
34498,
34499,
34502,
34503,
34859,
34860,
34916,
34917,
34938,
34939,
34954,
35102,
35550,
35551,
35552,
35553,
43019,
43020,
44443,
44446,
44448,
44469,
44470,
44471,
44472,
44560,
44561,
45243,
45244,
46855,
46914,
46915,
46949,
47196,
47197,
47202,
47203,
47204,
47205,
47246,
47247,
47259,
47260,
47264,
47265,
47511,
47515,
47517,
47570,
47581,
47582,
48110,
48111,
48112,
48113,
48159,
48160,
48484,
48485,
48499,
48500,
48510,
48511,
48521,
48525,
48544,
48545,
48951,
48952,
49280,
49281,
49283,
49284,
49503,
49504,
49508,
49509,
49529,
49530,
49599,
49627,
49628,
49654,
49655,
50033,
50034,
50115,
50884,
50885,
50886,
50887,
51462,
51463,
51464,
51465,
51478,
51479,
51522,
51524,
51557,
51558,
51563,
51564,
51565,
51566,
51626,
51628,
51629,
51635,
51636,
51665,
51667,
51668,
51669,
51674,
51679,
51696,
51989,
52004,
52005,
52007,
52008,
52129,
52131,
52134,
52136,
52138,
52797,
52798,
52799,
52800,
53179,
53216,
53217,
53222,
53224,
53232,
53237,
53238,
53259,
53260,
53291,
53292,
53376,
53381,
53382,
53488,
53502,
53503,
53530,
53552,
53553,
53576,
53673,
53696,
53710,
53711,
54151,
54154,
54155,
54637,
54638,
54749,
55667,
56343,
56344,
56611,
56612,
56613,
56614,
56637,
56638,
56822,
56834,
56835,
57472,
57880,
57881,
57960,
58874,
59057,
59089,
61345,
61346,
61847,
62765,
63158,
63245,
63374,
63733,
63737,
64129,
66191,
66192,
66814,
66815,
66816,
66817);

DELETE FROM `spell_proc_event` WHERE `entry` IN (
324,
974,
1463,
5952,
9799,
11095,
11119,
11180,
11185,
11213,
11255,
12281,
12289,
12298,
12311,
12319,
12797,
12834,
12966,
13165,
13754,
13983,
14156,
14186,
14531,
14892,
15337,
16086,
16176,
16180,
16256,
16257,
16487,
16850,
16880,
16952,
16958,
17106,
17793,
18094,
18096,
18119,
19184,
19572,
20049,
20177,
20210,
20234,
20335,
20500,
20925,
27811,
29074,
29441,
29593,
29834,
30160,
30293,
30299,
30675,
30701,
30881,
31124,
31244,
31569,
31571,
31656,
31833,
31871,
31876,
32385,
33076,
33142,
33150,
33191,
33881,
34497,
34500,
34753,
34914,
34935,
34950,
35100,
35541,
41635,
44442,
44445,
44449,
44557,
45234,
46854,
46867,
46913,
46945,
47195,
47201,
47245,
47258,
47263,
47509,
47516,
47569,
47580,
48483,
48496,
48506,
48516,
48539,
48988,
49004,
49018,
49149,
49188,
49208,
49217,
49219,
49223,
49467,
50880,
51459,
51474,
51521,
51523,
51556,
51562,
51625,
51627,
51634,
51664,
51672,
51692,
51940,
52127,
52795,
53178,
53215,
53221,
53228,
53234,
53256,
53290,
53375,
53380,
53486,
53501,
53527,
53551,
53569,
53671,
53695,
53709,
54639,
54747,
55666,
56342,
56636,
57470,
57878,
58872,
59088,
61846,
62764,
63156,
63373,
63730,
64127,
65661,
66799,
-324,
-974,
-1463,
-5952,
-9799,
-11095,
-11119,
-11180,
-11185,
-11213,
-11255,
-12281,
-12289,
-12298,
-12311,
-12319,
-12797,
-12834,
-12966,
-13165,
-13754,
-13983,
-14156,
-14186,
-14531,
-14892,
-15337,
-16086,
-16176,
-16180,
-16256,
-16257,
-16487,
-16850,
-16880,
-16952,
-16958,
-17106,
-17793,
-18094,
-18096,
-18119,
-19184,
-19572,
-20049,
-20177,
-20210,
-20234,
-20335,
-20500,
-20925,
-27811,
-29074,
-29441,
-29593,
-29834,
-30160,
-30293,
-30299,
-30675,
-30701,
-30881,
-31124,
-31244,
-31569,
-31571,
-31656,
-31833,
-31871,
-31876,
-32385,
-33076,
-33142,
-33150,
-33191,
-33881,
-34497,
-34500,
-34753,
-34914,
-34935,
-34950,
-35100,
-35541,
-41635,
-44442,
-44445,
-44449,
-44557,
-45234,
-46854,
-46867,
-46913,
-46945,
-47195,
-47201,
-47245,
-47258,
-47263,
-47509,
-47516,
-47569,
-47580,
-48483,
-48496,
-48506,
-48516,
-48539,
-48988,
-49004,
-49018,
-49149,
-49188,
-49208,
-49217,
-49219,
-49223,
-49467,
-50880,
-51459,
-51474,
-51521,
-51523,
-51556,
-51562,
-51625,
-51627,
-51634,
-51664,
-51672,
-51692,
-51940,
-52127,
-52795,
-53178,
-53215,
-53221,
-53228,
-53234,
-53256,
-53290,
-53375,
-53380,
-53486,
-53501,
-53527,
-53551,
-53569,
-53671,
-53695,
-53709,
-54639,
-54747,
-55666,
-56342,
-56636,
-57470,
-57878,
-58872,
-59088,
-61846,
-62764,
-63156,
-63373,
-63730,
-64127,
-65661,
-66799);

INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
(-324,0,0,0,0,0,0,0,0,0,3),
(-974,0,0,0,0,0,139944,0,0,0,3),
(-1463,0,0,0,0,0,0,1024,0,0,0),
(-5952,0,8,0,1,0,0,0,0,0,0),
(-9799,0,0,0,0,0,0,2,0,0,0),
(-11095,0,3,16,0,0,0,0,0,0,0),
(-11119,4,3,0,0,0,0,2,0,0,0),
(-11180,16,3,0,0,0,0,0,0,0,0),
(-11185,0,3,128,0,0,327680,0,0,0,0),
(-11213,0,3,0,0,0,0,0,0,0,0),
(-11255,0,3,16384,0,0,0,0,0,0,0),
(-12281,0,4,2858419268,4194565,0,0,0,0,0,6),
(-12289,0,4,2,0,0,0,0,0,0,0),
(-12298,0,0,0,0,0,0,112,0,0,0),
(-12311,0,4,2048,1,0,0,0,0,0,0),
(-12319,0,0,0,0,0,0,2,0,0,0),
(-12797,0,4,1024,0,0,0,0,0,0,0),
(-12834,0,0,0,0,0,0,2,0,0,0),
(-12966,0,0,0,0,0,0,65536,0,0,0),
(-13165,0,0,0,0,0,64,0,0,0,0),
(-13754,0,8,16,0,0,0,0,0,0,0),
(-13983,0,0,0,0,0,0,24,0,0,0),
(-14156,0,8,4063232,8,0,0,0,0,0,0),
(-14186,0,8,1082131720,6,0,0,2,0,0,1),
(-14531,0,0,0,0,0,0,2,0,0,0),
(-14892,0,6,268443136,65540,0,0,2,0,0,0),
(-15337,0,6,8396800,2,0,0,2,0,0,0),
(-16086,4,11,0,262144,0,196608,0,0,0,0),
(-16176,0,11,448,0,16,0,2,0,0,0),
(-16180,0,11,448,0,16,0,2,0,100,0),
(-16256,0,0,0,0,0,0,2,0,0,0),
(-16257,0,0,0,0,0,0,65536,0,0,0),
(-16487,0,0,0,0,0,0,2,0,0,0),
(-16850,0,7,4,0,0,0,0,0,0,0),
(-16880,72,7,103,58720258,0,0,2,0,0,0),
(-16952,0,7,233472,1024,262144,0,2,0,0,0),
(-16958,0,0,0,0,0,0,2,0,0,0),
(-17106,0,7,524288,0,0,0,0,0,0,0),
(-17793,0,5,1,0,0,0,0,0,0,0),
(-18094,0,5,10,0,0,0,0,0,0,0),
(-18096,0,5,256,8388608,0,0,2,0,0,0),
(-18119,0,5,0,8388608,0,0,0,0,0,0),
(-19184,0,9,16,8192,0,0,0,0,0,0),
(-19572,0,9,8388608,0,0,16384,0,0,0,0),
(-20049,0,0,0,0,0,0,2,0,0,0),
(-20177,0,0,0,0,0,0,67,0,0,0),
(-20210,0,10,3221225472,65536,0,0,2,0,0,0),
(-20234,0,10,32768,0,0,0,0,0,0,0),
(-20335,0,10,8388608,0,8,16,0,0,100,0),
(-20500,0,4,268435456,0,0,0,0,0,0,0),
(-20925,0,0,0,0,0,0,64,0,0,0),
(-27811,0,0,0,0,0,0,2,0,0,0),
(-29074,20,3,0,0,0,0,2,0,0,0),
(-29441,0,0,0,0,0,0,8,0,0,1),
(-29593,0,0,0,0,0,0,112,0,0,0),
(-29834,0,0,0,0,0,0,65536,0,0,0),
(-30160,0,0,0,0,0,0,2,0,0,0),
(-30293,0,5,897,8519872,0,0,0,0,0,0),
(-30299,126,0,0,0,0,0,0,0,0,0),
(-30675,0,11,3,0,0,0,0,0,0,0),
(-30701,28,0,0,0,0,664232,0,0,100,0),
(-30881,0,0,0,0,0,0,0,0,0,30),
(-31124,0,8,16777222,0,0,0,0,0,0,0),
(-31244,0,8,4063232,9,0,0,52,0,0,0),
(-31569,0,3,65536,0,0,0,0,0,0,0),
(-31571,0,3,0,34,0,16384,0,0,0,0),
(-31656,4,3,134217728,0,0,0,0,0,0,0),
(-31833,0,10,2147483648,0,0,0,0,0,0,0),
(-31871,0,10,16,0,0,16384,0,0,0,0),
(-31876,0,10,8388608,0,0,0,262144,0,0,0),
(-32385,0,5,1,262144,0,0,0,0,0,0),
(-33076,0,0,0,0,0,664232,0,0,0,0),
(-33142,0,0,0,0,0,0,2,0,0,0),
(-33150,0,0,0,0,0,0,2,0,0,0),
(-33191,0,6,32768,1024,64,0,0,0,0,0),
(-33881,0,0,0,0,0,0,2,0,0,0),
(-34497,0,0,0,0,0,0,2,0,0,0),
(-34500,0,0,0,0,0,0,2,0,0,0),
(-34753,0,6,6144,4,4096,0,2,0,0,0),
(-34914,0,6,8192,0,0,0,0,0,0,0),
(-34935,0,0,0,0,0,0,0,0,0,8),
(-34950,0,0,0,0,0,0,2,0,0,0),
(-35100,0,9,4096,0,1,0,0,0,0,0),
(-35541,0,0,0,0,0,8388608,0,0,0,0),
(-41635,0,0,0,0,0,664232,0,0,0,0),
(-44442,0,3,8388608,64,0,0,65536,0,0,1),
(-44445,0,3,19,69632,0,0,0,0,0,0),
(-44449,0,3,551686775,102472,0,0,2,0,0,0),
(-44557,0,3,32,0,0,0,0,0,0,0),
(-45234,0,0,0,0,0,0,2,0,0,0),
(-46854,0,0,0,0,0,0,2,0,0,0),
(-46867,0,0,0,0,0,0,2,0,0,0),
(-46913,0,4,64,1028,0,0,262144,0,0,0),
(-46945,0,4,0,65536,0,0,0,0,0,0),
(-47195,0,5,2,0,0,0,0,0,0,0),
(-47201,0,5,16393,262144,0,0,0,0,0,0),
(-47245,0,5,2,0,0,0,1,0,0,0),
(-47258,0,5,0,8388608,0,0,65536,0,0,0),
(-47263,32,5,0,0,0,0,2,0,0,20),
(-47509,0,0,0,0,0,0,2,0,0,0),
(-47516,0,6,6144,65536,0,0,0,0,0,0),
(-47569,0,6,16384,0,0,16384,0,0,0,0),
(-47580,0,6,0,0,64,0,65536,0,0,0),
(-48483,0,7,34816,1088,0,0,0,0,0,0),
(-48496,0,7,96,33554434,0,0,2,0,0,0),
(-48506,0,7,5,0,0,0,0,0,0,0),
(-48516,0,7,5,0,0,0,2,0,0,30),
(-48539,0,7,16,67108864,0,262144,0,0,0,0),
(-48988,0,0,0,0,0,0,2,0,0,0),
(-49004,0,0,0,0,0,0,51,0,0,0),
(-49018,0,15,20971520,0,0,0,0,0,0,0),
(-49149,0,15,6,131074,0,0,0,0,0,0),
(-49188,0,15,0,131072,0,0,0,0,0,0),
(-49208,0,15,4194304,65536,0,0,0,0,0,0),
(-49217,0,15,0,0,2,0,0,0,0,1),
(-49219,0,0,0,0,0,4,0,0,0,0),
(-49223,0,15,17,134348800,0,0,0,0,0,0),
(-49467,0,15,16,131072,0,0,0,0,0,0),
(-50880,0,15,0,67108864,0,0,0,0,0,0),
(-51459,0,0,0,0,0,4,0,0,0,0),
(-51474,0,0,0,0,0,0,65536,0,0,0),
(-51521,0,11,0,16777216,0,0,0,0,0,0),
(-51523,0,11,0,1,0,65536,0,0,50,0),
(-51556,0,11,192,0,16,0,2,0,0,0),
(-51562,0,11,256,0,16,0,0,0,0,0),
(-51625,0,8,268476416,0,0,0,0,0,0,0),
(-51627,0,0,0,0,0,0,112,0,0,0),
(-51634,0,0,0,0,0,0,2,0,0,0),
(-51664,0,8,131072,8,0,0,0,0,0,0),
(-51672,0,0,0,0,0,0,16,0,0,1),
(-51692,0,8,516,0,0,0,0,0,0,0),
(-51940,0,0,0,0,0,0,0,0,20,0),
(-52127,0,0,0,0,0,0,0,0,0,3),
(-52795,0,6,1,0,0,0,0,0,0,0),
(-53178,0,9,0,268435456,0,65536,0,0,100,0),
(-53215,0,9,1,0,0,0,0,0,0,0),
(-53221,0,9,0,1,0,0,0,0,0,0),
(-53228,0,9,32,16777216,0,0,0,0,0,0),
(-53234,0,9,131072,1,1,0,2,0,0,0),
(-53256,0,9,2048,8388609,0,0,2,0,0,0),
(-53290,0,9,2048,1,512,0,2,0,0,0),
(-53375,0,10,0,8192,0,1024,0,0,0,6),
(-53380,0,10,8388608,163840,0,0,262146,0,0,0),
(-53486,0,10,8388608,163840,0,0,262146,0,0,0),
(-53501,0,0,0,0,0,0,2,0,0,0),
(-53527,1,10,0,0,4,1024,1,0,100,0),
(-53551,0,10,4096,0,0,0,0,0,0,0),
(-53569,0,10,1075838976,65536,0,0,0,0,0,0),
(-53671,0,10,8388608,0,0,0,0,0,0,0),
(-53695,0,10,8388608,0,8,16,0,0,0,0),
(-53709,2,10,16384,0,0,0,0,0,0,0),
(-54639,0,15,4194304,65536,0,0,0,0,0,0),
(-54747,0,0,0,0,0,0,65536,0,0,0),
(-55666,0,15,1,134217728,0,0,0,0,0,0),
(-56342,0,9,24,134217728,147456,0,0,0,0,22),
(-56636,0,4,32,0,0,0,262144,0,0,6),
(-57470,0,6,1,0,0,0,0,0,0,0),
(-57878,0,0,0,0,0,0,16,0,0,0),
(-58872,0,0,0,0,0,0,270403,0,0,0),
(-59088,0,4,0,2,0,1024,0,0,0,0),
(-61846,0,0,0,0,0,64,0,0,0,0),
(-62764,0,9,0,268435456,0,65536,0,0,100,0),
(-63156,0,5,1,192,0,0,0,0,0,0),
(-63373,0,11,2147483648,0,0,65536,0,0,0,0),
(-63730,0,6,2048,4,0,0,0,0,0,0),
(-64127,0,6,1,1,0,0,0,0,0,0),
(-65661,0,15,4194321,537001988,0,16,0,0,100,0),
(-66799,0,15,4194304,0,0,0,0,0,0,0);
DELETE FROM `spell_script_names` WHERE `ScriptName` IN (
'spell_warl_banish',
'spell_dru_enrage',
'spell_pri_mana_burn',
'spell_pri_guardian_spirit',
'spell_dk_improved_blood_presence',
'spell_dk_improved_frost_presence',
'spell_dk_improved_unholy_presence',
'spell_dk_presence'
);

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(-710,  'spell_warl_banish'),
(5229,  'spell_dru_enrage'),
(8129,  'spell_pri_mana_burn'),
(47788, 'spell_pri_guardian_spirit'),
(-50365,'spell_dk_improved_blood_presence'),
(-50384,'spell_dk_improved_frost_presence'),
(-50391,'spell_dk_improved_unholy_presence'),
(48266, 'spell_dk_presence'),
(48263, 'spell_dk_presence'),
(48265, 'spell_dk_presence');
-- Fix gossip condition for Bat Handler Camille <Bat Handler>
UPDATE `conditions` SET `ConditionTypeOrReference`=28 WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=8894 AND `SourceEntry`=0 AND `ConditionValue1`=11229;
DELETE FROM `spell_script_names` WHERE `spell_id` IN (31821,64364,-20254,-20138,31869,-53379,63510,63514,63531);
INSERT INTO `spell_script_names` (`spell_id` ,`ScriptName`) VALUES
(31821, 'spell_pal_aura_mastery'),
(64364, 'spell_pal_aura_mastery_immune'),
(-20254,'spell_pal_improved_concentraction_aura'),
(-20138,'spell_pal_improved_devotion_aura'),
(31869, 'spell_pal_sanctified_retribution'),
(-53379,'spell_pal_swift_retribution'),
(63510, 'spell_pal_improved_concentraction_aura_effect'),
(63514, 'spell_pal_improved_devotion_aura_effect'),
(63531, 'spell_pal_sanctified_retribution_effect');
SET @OGUID := 76732; -- Discarded Soul Crystal & Aura Trap Blue Short (cosmetic)

DELETE FROM `gameobject` WHERE `id` IN (195344, 195346, 193984);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID, 195344, 571, 1, 1, 7830.25, 2497.806, 402.5372, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: 0)
(@OGUID+1, 195346, 571, 1, 1, 7830.25, 2497.806, 402.5372, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: 0)
(@OGUID+2, 195344, 571, 1, 1, 7796.588, 2463.793, 393.2891, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: 0)
(@OGUID+3, 195346, 571, 1, 1, 7796.588, 2463.793, 393.2891, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: 0)
(@OGUID+4, 195344, 571, 1, 1, 7845.074, 2444.608, 400.5993, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: 0)
(@OGUID+5, 195346, 571, 1, 1, 7845.074, 2444.608, 400.5993, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: 0)
(@OGUID+6, 195344, 571, 1, 1, 7888.031, 2486.691, 412.1846, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: 0)
(@OGUID+7, 195346, 571, 1, 1, 7888.031, 2486.691, 412.1846, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: 0)
(@OGUID+8, 195344, 571, 1, 1, 7890.981, 2435.66, 407.6983, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: 0)
(@OGUID+9, 195346, 571, 1, 1, 7890.981, 2435.66, 407.6983, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: 0)
(@OGUID+10, 195344, 571, 1, 1, 7879.325, 2381.498, 395.9927, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+11, 195346, 571, 1, 1, 7879.325, 2381.498, 395.9927, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+12, 195344, 571, 1, 1, 7772.191, 2523.408, 397.5526, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+13, 195346, 571, 1, 1, 7772.191, 2523.408, 397.5526, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+14, 195344, 571, 1, 1, 7792.491, 2552.295, 404.7368, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+15, 195346, 571, 1, 1, 7792.491, 2552.295, 404.7368, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+16, 195344, 571, 1, 1, 7813.522, 2376.698, 383.7577, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+17, 195346, 571, 1, 1, 7813.522, 2376.698, 383.7577, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+18, 195344, 571, 1, 1, 7912.719, 2361.585, 403.3483, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+19, 195346, 571, 1, 1, 7912.719, 2361.585, 403.3483, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+20, 195344, 571, 1, 1, 7887.583, 2323.535, 389.2969, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+21, 195346, 571, 1, 1, 7887.583, 2323.535, 389.2969, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+22, 195344, 571, 1, 1, 7779.922, 2417.377, 384.4348, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+23, 195346, 571, 1, 1, 7779.922, 2417.377, 384.4348, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+24, 195344, 571, 1, 1, 7912.483, 2277.05, 387.8716, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+25, 195346, 571, 1, 1, 7912.483, 2277.05, 387.8716, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+26, 195344, 571, 1, 1, 7843.852, 2334.658, 382.3897, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+27, 195346, 571, 1, 1, 7843.852, 2334.658, 382.3897, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+28, 195344, 571, 1, 1, 7863.498, 2231.648, 375.1721, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+29, 195346, 571, 1, 1, 7863.498, 2231.648, 375.1721, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+30, 195344, 571, 1, 1, 7829.741, 2296.035, 378.0592, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+31, 195346, 571, 1, 1, 7829.741, 2296.035, 378.0592, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+32, 195344, 571, 1, 1, 7746.049, 2372.997, 376.3941, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+33, 195346, 571, 1, 1, 7746.049, 2372.997, 376.3941, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+34, 195344, 571, 1, 1, 7760.765, 2331.149, 374.8048, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+35, 195346, 571, 1, 1, 7760.765, 2331.149, 374.8048, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+36, 195344, 571, 1, 1, 7788.99, 2255.302, 371.7061, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+37, 195346, 571, 1, 1, 7788.99, 2255.302, 371.7061, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+38, 195344, 571, 1, 1, 7820.729, 2238.01, 372.7758, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+39, 195346, 571, 1, 1, 7820.729, 2238.01, 372.7758, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+40, 193984, 571, 1, 1, 7647.473, 2055.554, 599.3989, 6.003934, 0, 0, 0, 1, 120, 255, 1), -- Alliance Banner (Area: The Valley of Fallen Heroes)
(@OGUID+41, 195344, 571, 1, 1, 7745.684, 2289.906, 371.991, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+42, 195346, 571, 1, 1, 7745.684, 2289.906, 371.991, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+43, 195344, 571, 1, 1, 7696.855, 2372.087, 374.5795, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+44, 195346, 571, 1, 1, 7696.855, 2372.087, 374.5795, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+45, 195344, 571, 1, 1, 7710.979, 2338.505, 373.0223, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+46, 195346, 571, 1, 1, 7710.979, 2338.505, 373.0223, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+47, 195344, 571, 1, 1, 7750.775, 2420.458, 380.734, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+48, 195346, 571, 1, 1, 7750.775, 2420.458, 380.734, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+49, 195344, 571, 1, 1, 7651.209, 2394.108, 374.7194, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+50, 195346, 571, 1, 1, 7651.209, 2394.108, 374.7194, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+51, 195344, 571, 1, 1, 7694.101, 2306.049, 370.4156, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+52, 195346, 571, 1, 1, 7694.101, 2306.049, 370.4156, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+53, 195344, 571, 1, 1, 7603.735, 2402.665, 377.1989, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+54, 195346, 571, 1, 1, 7603.735, 2402.665, 377.1989, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+55, 195344, 571, 1, 1, 7632.563, 2369.054, 376.1918, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+56, 195346, 571, 1, 1, 7632.563, 2369.054, 376.1918, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+57, 195346, 571, 1, 1, 7568.995, 2373.521, 377.0721, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+58, 195344, 571, 1, 1, 7568.995, 2373.521, 377.0721, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+59, 195344, 571, 1, 1, 7628.762, 2434.55, 377.8682, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+60, 195346, 571, 1, 1, 7628.762, 2434.55, 377.8682, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+61, 195346, 571, 1, 1, 7569.211, 2434.028, 382.9506, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+62, 195344, 571, 1, 1, 7569.211, 2434.028, 382.9506, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+63, 195344, 571, 1, 1, 7590.309, 2308.01, 376.7488, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+64, 195346, 571, 1, 1, 7590.309, 2308.01, 376.7488, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+65, 195344, 571, 1, 1, 7542.194, 2323.882, 378.2228, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+66, 195346, 571, 1, 1, 7542.194, 2323.882, 378.2228, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+67, 195344, 571, 1, 1, 7505.332, 2363.399, 378.0511, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+68, 195346, 571, 1, 1, 7505.332, 2363.399, 378.0511, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+69, 195344, 571, 1, 1, 7453.913, 2355.877, 380.0355, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+70, 195346, 571, 1, 1, 7453.913, 2355.877, 380.0355, 0, 0, 0, 0, 1, 120, 255, 1); -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
-- Fix quest 14107: The Fate Of The Fallen
-- Add SmartAI for Fallen Hero's Spirit

SET @ENTRY := 32149;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE creature_id = @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ENTRY, 0, 0, 0, 8, 0, 100, 1, 66719, 0, 0, 0, 80, @ENTRY*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fallen Hero''s Spirit - On Spellhit Blessing of Peace - Run script'),
(@ENTRY*100, 9, 0, 0, 0, 0, 100, 0, 100, 100, 0, 0, 66, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Fallen Hero''s Spirit - Script - Turn to Invoker'),
(@ENTRY*100, 9, 1, 0, 0, 0, 100, 0, 100, 100, 0, 0, 33, 35055, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 'Fallen Hero''s Spirit - Script - Give Quest Credit'),
(@ENTRY*100, 9, 2, 0, 0, 0, 100, 0, 100, 100, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fallen Hero''s Spirit - Script - Set Faction'),
(@ENTRY*100, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fallen Hero''s Spirit - Script - Say 0'),
(@ENTRY*100, 9, 4, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fallen Hero''s Spirit - Script - Despawn');

-- Creature text for Fallen Hero's Spirit
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY, 0, 0, 'It was awful... I dreamt I was fighting against my friends.', 12, 0, 100, 1, 0, 0, 'Fallen Hero''s Spirit'),
(@ENTRY, 0, 1, 'I''m so tired. Just let me rest for a moment.',               12, 0, 100, 1, 0, 0, 'Fallen Hero''s Spirit'),
(@ENTRY, 0, 2, 'I can''t hear the screams anymore. Is this the end?',         12, 0, 100, 1, 0, 0, 'Fallen Hero''s Spirit'),
(@ENTRY, 0, 3, 'At last... now I can rest.',                                  12, 0, 100, 1, 0, 0, 'Fallen Hero''s Spirit'),
(@ENTRY, 0, 4, 'My nightmare, is it finally over?',                           12, 0, 100, 1, 0, 0, 'Fallen Hero''s Spirit');
UPDATE `instance_template` SET `script`="instance_drak_tharon_keep" WHERE `map`=600;
UPDATE `creature_template` SET `ScriptName`="boss_king_dred" WHERE `entry`=27483;
DELETE FROM `spelldifficulty_dbc` WHERE `id` = 48849;
INSERT INTO `spelldifficulty_dbc` (`id`, `spellid0`, `spellid1`) VALUES
(48849, 48849, 59422);
DELETE FROM `spell_script_names` WHERE `spell_id` IN (50341,50344);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(50341, 'spell_oculus_touch_the_nightmare'),
(50344, 'spell_oculus_dream_funnel');
-- Sergeant Kregga, Captain Kendall, Opportunity and Exploiting an Opening fix by nelegalno
-- http://www.wowhead.com/zone=210#comments:id=838363
-- http://www.wowhead.com/zone=210#comments:id=838364
SET @GUID=18; -- Set by TDB team
SET @ASPELL=59073;
SET @HSPELL=59087;
SET @AREA=4522;

-- Sergeant Kregga (31440)
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`exp`=2 WHERE `entry`=31440;
DELETE FROM `creature` WHERE `guid`=@GUID AND `id`=31440;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID,31440,571,1,8,0,0,5874.2,1948.5,516.1,2.8,300,0,0,32000,0,0,0,0,0);

-- Captain Kendall (31444)
UPDATE `creature` SET `phaseMask`=2 WHERE `id`=31444;

DELETE FROM `spell_area` WHERE `spell`=@HSPELL AND `area`=@AREA;
DELETE FROM `spell_area` WHERE `spell`=@ASPELL AND `area`=@AREA;
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`,`quest_start_status`,`quest_end_status`) VALUES
(@HSPELL,@AREA,12899,0,0, 690,2,1,64,43), -- Horde version
(@ASPELL,@AREA,12898,0,0,1101,2,1,64,43); -- Alliance version
-- The Nightmare Manifests/Hope Within the Emerald Nightmare/The Boon of Remulos/Walking Legend
SET @TYRANDE        := 15633;
SET @ERANIKUS       := 15491;
SET @REMULOS        := 11832;
SET @MALFURION      := 17949;
SET @PHANTASM       := 15629;
SET @E_REDEEM       := 15628;

DELETE FROM `creature_ai_scripts` WHERE creature_id=@ERANIKUS;
-- Tyrande
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='', `flags_extra`=0, `type_flags`=0, `unit_flags`=32768, `faction_H`=1254, `faction_A`=1254 WHERE `entry`=@TYRANDE;
-- Eranikus, Tyrant of the Dream
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='', `InhabitType`=7, `faction_A`=35, `faction_H`=35, `unit_flags`=0, `flags_extra`=2097152, `type_flags`=8, `dynamicflags`=128, `speed_walk`=2 WHERE `entry`=@ERANIKUS;
-- Keeper Remulos
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='', `speed_walk`=2.5, `speed_run`=3.75, `type_flags`=0, `unit_flags`=32768, `faction_H`=1254, `faction_A`=1254 WHERE `entry`=@REMULOS;
-- Malfurion
UPDATE `creature_template` SET `InhabitType`=4,`AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@MALFURION;
-- Not sure if these are set on stock DB, but I'll still add them just in case.
UPDATE `creature_template` SET `IconName`='Interact', `npcflag`=16777216 WHERE `entry` IN (32788,32790);
-- Wrong gameobject, no idea who spawned it there.
DELETE FROM `gameobject` WHERE  `guid`=99849;

-- NPC texts
DELETE FROM `creature_text` WHERE entry IN (@REMULOS,@ERANIKUS,@PHANTASM,@TYRANDE,@E_REDEEM,@MALFURION);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@REMULOS,0,0,'We will locate the origin of the Nightmare through the fragments you collected, $n. From there, we will pull Eranikus through a rift in the Dream. Steel yourself, $c. We are inviting the embodiment of the Nightmare into our world.',12,0,100,0,0,0,'Keeper Remulos Say 0'),
(@REMULOS,1,1,'The rift will be opened there, above the Lake Elun''ara. Prepare yourself, $n. Eranikus''s entry into our world will be wrought with chaos and strife.',12,0,100,0,0,0,'Keeper Remulos Say 1'),
(@REMULOS,2,2,'He will stop at nothing to get to Malfurion''s physical manifistation. That must not happen... We must keep the beast occupied long enough for Tyrande to arrive.',12,0,100,0,0,0,'Keeper Remulos Say 2'),
(@REMULOS,3,3,'Defend Nighthaven, hero...',12,0,100,0,0,0,'Keeper Remulos Say 3'),
(@REMULOS,4,4,'Fiend! Face the might of Cenarius!',14,0,100,0,0,0,'Keeper Remulos Say 4'),
(@REMULOS,5,5,'Who is the predictable one, beast? Surely you did not think that we would summon you on top of Malfurion? Your redemption comes, Eranikus. You will be cleansed of this madness - this corruption.',14,0,100,0,0,0,'Keeper Remulos Say 4'),
(@REMULOS,6,6,'Hurry, $N! We must find protective cover!',12,0,100,0,0,0,'Keeper Remulos Say 6'),
(@REMULOS,7,7,'Please, champion, protect our people.',12,0,100,0,0,0,'Keeper Remulos Say 7'),
(@REMULOS,8,8,'It will be done, Eranikus. Be well, ancient one.',12,0,100,0,0,0,'Keeper Remulos Say 8'),
(@REMULOS,9,9,'Let us leave Nighthaven, hero Seek me out at the grove.',12,0,100,0,0,0,'Keeper Remulos Say 9'),
--
(@REMULOS,10,10,'Come, $N. The lake is around the bend.',12,0,100,1,0,0,'Keeper Remulos - say Text 0'),
(@REMULOS,11,11,'Stand near me, $N. I will protect you should anything go wrong.',12,0,100,1,0,0,'Keeper Remulos - say Text 1'),
(@REMULOS,12,12,'Malfurion!',12,0,100,5,0,0,'Keeper Remulos - say Text 2'),
(@REMULOS,13,13,'It was shrouded in nightmares, Malfurion. What is happening in the Dream? What could cause such atrocities?',12,0,100,6,0,0,'Keeper Remulos - say Text 3'),
(@REMULOS,14,14,'I sensed as much, Malfurion. Dark days loom ahead.',12,0,100,1,0,0,'Keeper Remulos - say Text 4'),
(@REMULOS,15,15,'You have been gone too long, Malfurion. Peace between the Children of Azeroth has become tenuous at best. What of my father? Of your brother? Have you any news?',12,0,100,6,0,0,'Keeper Remulos - say Text 5'),
(@REMULOS,16,16,'Farewell, old friend... Farewell...',12,0,100,1,0,0,'Keeper Remulos - say Text 6'),
(@REMULOS,17,17,'Let us return to the grove, mortal.',12,0,100,1,0,0,'Keeper Remulos - say Text 7'),
--
(@ERANIKUS,0,0,'Pitful predictable mortals... You know not what you have done! The master''s will fulfilled. The Moonglade shall be destroyed and Malfurion along with it!',14,0,100,0,0,0,'Eranikus Say 0'),
(@ERANIKUS,1,1,'Eranikus, Tyrant of the Dream lets loose a sinister laugh.',16,0,100,0,0,0,'Eranikus Say 1'),
(@ERANIKUS,2,2,'You are certanly not your father, insect. Should it interest me, I would crush you with but a swipe of my claws. Turn Shan''do Stormrage over to me and your pitiful life will be spared along with the lives of your people.',14,0,100,0,0,0,'Eranikus Say 2'),
(@ERANIKUS,3,3,'My redemption? You are bold, little one. My redemption comes by the will of my god.',14,0,100,0,0,0,'Eranikus Say 3'),
(@ERANIKUS,4,4,'Eranikus, Tyrant of the Dream roars furiously',16,0,100,0,0,0,'Eranikus Say 4'),
(@ERANIKUS,5,5,'Rise, servants of the Nightmare! Rise and destroy this world! Let there be no survivors...',14,0,100,0,0,0,'Eranikus Say 5'),
(@ERANIKUS,6,6,'Where is your savior? How long can you hold out against my attacks?',14,0,100,0,0,0,'Eranikus Say 6'),
(@ERANIKUS,7,7,'Remulos, look how easy they fall before me? You can stop this, fool. Turn the druid over to me and it will all be over...',14,0,100,0,0,0,'Eranikus Say 7'),
(@ERANIKUS,8,8,'Defeated my minions? Then face me, mortals!',14,0,100,0,0,0,'Eranikus Say 8'),
(@ERANIKUS,9,9,'IT BURNS! THE PAIN.. SEARING...',14,0,100,0,0,0,'Eranikus Say 9'),
(@ERANIKUS,10,10,'WHY? Why did this happen to... to me? Where were you Tyrande? Where were you when I fell from the grace of Elune?',14,0,100,0,0,0,'Eranikus Say 10'),
(@ERANIKUS,11,11,'I... I feel... I feel the touch of Elune upon my being once more... She smiles upon me... Yes... I...',14,0,100,0,0,0,'Eranikus Say 11'),
(@ERANIKUS,12,12,'Tyrande falls to one knee.',16,0,100,0,0,0,'Eranikus Say 12'),
--
(@TYRANDE,0,0,'Seek absolution, Eranikus. All will be forgiven..',14,0,100,0,0,0,'Tyrande Say 0'),
(@TYRANDE,1,1,'You will be forgiven, Eranikus. Elune will always love you. Break free of the bonds that command you!',14,0,100,0,0,0,'Tyrande Say 0'),
(@TYRANDE,2,2,'The grasp of the Old Gods is unmoving. He is consumed by their dark thoughts... I... I... I cannot... cannot channel much longer... Elune aide me.',12,0,100,0,0,0,'Tyrande Say 0'),
--
(@E_REDEEM,0,0,'For so long, I was lost... The Nightmare''s corruption had consumed me... And now, you... all of you.. you have saved me. Released me from its grasp.',12,0,100,0,0,0,'Eranikus the Redeemed Say 0'),
(@E_REDEEM,1,1,'But... Malfurion, Cenarius, Ysera... They still fight. They need me. I must return to the Dream at once.',12,0,100,0,0,0,'Eranikus the Redeemed Say 0'),
(@E_REDEEM,2,2,'My lady, I am unworthy of your prayer. Truly, you are an angel of light. Please, assist me in returning to the barrow den so that I may return to the Dream. I like Malfurion, also have a love awaiting me... I must return to her... to protect her...',12,0,100,0,0,0,'Eranikus the Redeemed Say 0'),
(@E_REDEEM,3,3,'And heroes... I hold that which you seek. May it once more see the evil dissolved. Remulos, see to it that our champion receives the shard of the Green Flight.',12,0,100,0,0,0,'Eranikus the Redeemed Say 0'),
--
(@PHANTASM,0,0,'Nightmare Phantasm drinks in the suffering of the fallen.',16,0,100,0,0,0,'Nightmare Phantasm Say 0'),
--
(@MALFURION,0,0,'Remulos, old friend. It is good to see you once more. I knew the message would find its way to you; one way or another.',12,0,100,1,0,0,'Malfurion Stormrage - say Text 0'),
(@MALFURION,1,0,'I fear for the worst, old friend. Within the Dream we fight a new foe, born of an ancient evil. Ysera''s noble brood has fallen victim to the old whisperings. It seems as if the Nightmare has broken through the realm to find a new host on Azeroth.',12,0,100,1,0,0,'Malfurion Stormrage - say Text 1'),
(@MALFURION,2,0,'Aye Remulos, prepare the mortal races.',12,0,100,1,0,0,'Malfurion Stormrage - say Text 2'),
(@MALFURION,3,0,'Cenarius fights at my side. Illidan sits atop his throne in Outland; brooding. I''m afraid that the loss to Arthas proved to be his breaking point. Madness has embraced him, Remulos. He replays the events in his mind a thousand times per day, but in his mind, he is the victor and Arthas is utterly defeated. He is too far gone, old friend. I fear that the time may soon come that our bond is tested and it will not be as it was at the Well in Zin-Azshari.',12,0,100,1,0,0,'Malfurion Stormrage - say Text 3'),
(@MALFURION,4,0,'Remulos, I am being drawn back... Tyrande... send her my love... Tell her I am safe... Tell her... Tell her I will return... Farewell...',12,0,100,1,0,0,'Malfurion Stormrage - say Text 4');


-- Remulos SAI
DELETE FROM `smart_scripts` WHERE `source_type`IN (0,9) AND `entryorguid` IN (@REMULOS,@REMULOS*100,@REMULOS*100+1,@REMULOS*100+2);
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` = @MALFURION;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
-- Quests: Hope Within the Emerald Nightmare & The Boon of Remulos
(@REMULOS,0,0,0,62,0,100,0,10215,0,0,0,11,57413,1,0,0,0,0,7,0,0,0,0,0,0,0,'Keeper Remulos - On gossip option select - cast spell'),
(@REMULOS,0,1,2,62,0,100,0,10215,1,0,0,11,57670,1,0,0,0,0,7,0,0,0,0,0,0,0,'Keeper Remulos - On gossip option select - cast spell'),
(@REMULOS,0,2,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Keeper Remulos - On gossip option select - Close gossip'),
(@REMULOS,0,3,0,19,0,100,0,13074,0,0,0,11,57413,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Keeper Remulos - On Quest Accept - Cast Fitful Dream'),
-- The Nightmare Manifests
(@REMULOS,0,4,0,19,0,100,1,8736,0,0,0,1,0,15000,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On Quest Accept - Say 0'),
(@REMULOS,0,5,0,52,0,100,0,0,@REMULOS,0,0,53,0,@REMULOS,0,8736,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On Say 0 - Start WayPoint'),
(@REMULOS,0,6,0,52,0,100,0,0,@REMULOS,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On Quest Accept - Remove Npcflag'),
(@REMULOS,0,7,0,40,0,100,0,13,@REMULOS,0,0,54,95000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On WayPoint 13 - Pause WP'),
(@REMULOS,0,8,0,40,0,100,0,13,@REMULOS,0,0,1,1,10000,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On WayPoint 13 - Say 1'),
(@REMULOS,0,9,0,52,0,100,0,1,@REMULOS,0,0,1,2,10000,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On Say 1 - Say 2'),
(@REMULOS,0,10,0,52,0,100,0,2,@REMULOS,0,0,11,25813,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On Say 3 - Cast Conjure Dream Rift'),
(@REMULOS,0,11,0,52,0,100,0,2,@REMULOS,0,0,12,@ERANIKUS,3,3600000,0,0,0,8,0,0,0,7872.5888, -2664.55888, 497.139282,0.63583,'Keeper Remulos - On Say 3 - Summon Eranikus'),
(@REMULOS,0,12,0,52,0,100,0,2,@REMULOS,0,0,1,3,23000,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On Say 2 - Say 3'),
(@REMULOS,0,13,0,52,0,100,0,3,@REMULOS,0,0,1,4,31000,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On Say 3 - Say 4'),
(@REMULOS,0,14,0,52,0,100,0,4,@REMULOS,0,0,1,5,22000,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On Say 4 - Say 5'),
(@REMULOS,0,15,0,52,0,100,0,5,@REMULOS,0,0,1,6,10000,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On Say 5 - Say 6'),
(@REMULOS,0,16,0,40,0,100,0,20,@REMULOS,0,0,54,60000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On WayPoint 20 - Pause WP'),
(@REMULOS,0,17,0,40,0,100,0,20,@REMULOS,0,0,1,7,20000,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On WayPoint 20 - Say 7'),
(@REMULOS,0,18,0,52,0,100,0,7,@REMULOS,0,0,12,@PHANTASM,3,3600000,0,0,0,8,0,0,0,7829.066,-2562.347,489.299,5.234,'Keeper Remulos - On Say 7 - Summon Nightmare Phantasm'),
(@REMULOS,0,19,0,52,0,100,0,7,@REMULOS,0,0,12,@PHANTASM,3,3600000,0,0,0,8,0,0,0,7828.889,-2580.694,489.299,0.753,'Keeper Remulos - On Say 7 -Summon Nightmare Phantasm'),
(@REMULOS,0,20,0,52,0,100,0,7,@REMULOS,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On Say 7 - Set react state aggresive'),
(@REMULOS,0,21,0,52,0,100,0,7,@REMULOS,0,0,49,0,0,0,0,0,0,19,@PHANTASM,0,0,0,0,0,0,'Keeper Remulos - On Say 7 - Attack'),
(@REMULOS,0,22,0,0,0,100,0,7000,14000,6000,12000,11,20665,0,0,0,0,0,18,20,0,0,0,0,0,0,'Keeper Remulos - In Combat - Cast Regrowth'),
(@REMULOS,0,23,0,0,0,100,0,26000,52000,34000,46000,11,20664,0,0,0,0,0,18,20,0,0,0,0,0,0,'Keeper Remulos - In Combat - Cast Regrowth'),
(@REMULOS,0,24,0,0,0,100,0,25000,25000,25000,50000,11,23381,0,0,0,0,0,18,20,0,0,0,0,0,0,'Keeper Remulos - In Combat - Cast Healing Touch'),
(@REMULOS,0,25,0,0,0,100,0,10000,40000,40000,40000,11,25817,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - In Combat - Cast Tranquility'),
(@REMULOS,0,26,0,0,0,100,0,16000,21000,19000,25000,11,21668,0,0,0,0,0,2,0,0,0,0,0,0,0,'Keeper Remulos - In Combat - Cast Starfall'),
(@REMULOS,0,27,0,38,0,100,0,1,1,0,0,1,8,10000,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On Data Set - Say 8'),
(@REMULOS,0,28,0,52,0,100,0,8,@REMULOS,0,0,1,9,10000,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - Said 8 8 - Say 9'),
(@REMULOS,0,29,0,40,0,100,1,21,@REMULOS,0,0,49,0,0,0,0,0,0,11,@ERANIKUS,30,0,0,0,0,0,'Keeper Remulos - On Waypoint Reached - Attack Eranikus'),
(@REMULOS,0,30,0,6,0,100,0,0,0,0,0,6,8736,0,0,0,0,0,18,40,0,0,0,0,0,0,'Keeper Remulos - On Death - Fail Quest'),
(@REMULOS,0,31,0,40,0,100,1,23,@REMULOS,0,0,54,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On WayPoint 23 - Pause WP'),
(@REMULOS,0,32,0,40,0,100,1,23,@REMULOS,0,0,66,2.835,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On WayPoint 23 - Set Orientation'),
(@REMULOS,0,33,0,52,0,100,0,9,@REMULOS,0,0,53,1,@REMULOS*100+1,0,8736,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On Said 9 - Go Home'),
(@REMULOS,0,34,0,40,0,100,0,12,@REMULOS*100+1,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On WayPoint 12 - Set Npcflags'),
(@REMULOS,0,35,0,40,0,100,0,12,@REMULOS*100+1,0,0,66,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On WayPoint 12 - Set Orientation'),
(@REMULOS,0,36,0,40,0,100,0,24,@REMULOS,0,0,80,@REMULOS*100+1,0,1,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - On WayPoint 24 - Run Script only when OOC'),
-- Quest: Waking Legends
(@REMULOS,0,37,38,19,0,100,0,8447,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - on Quest Accept - Turn off Quest Giver & Gossip Flag'),
(@REMULOS,0,38,39,61,0,100,0,0,0,0,0,53,0,@REMULOS*100,0,8447,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - on Quest Accept - start WP'),
(@REMULOS,0,39,0,61,0,100,0,0,0,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - on Quest Accept - say Text 10'),
(@REMULOS,0,40,41,40,0,100,0,5,@REMULOS*100,0,0,54,83000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - reached WP 5 - pause WP'),
(@REMULOS,0,41,42,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.12180,'Keeper Remulos - reached WP5 - set orientation'),
(@REMULOS,0,42,0,61,0,100,0,0,0,0,0,80,@REMULOS*100+2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - reached WP 5 - run Script'),
(@REMULOS,0,43,0,40,0,100,0,10,@REMULOS*100,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - reached WP 10 - Turn on Quest Giver & Gossip Flag'),
(@REMULOS,0,44,0,40,0,100,0,10,@REMULOS*100,0,0,66,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - reached WP 10 - set orientation'),
-- Script
(@REMULOS*100+2,9,0,0,0,0,100,0,2000,2000,0,0,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - Say Text 1'),
(@REMULOS*100+2,9,1,0,0,0,100,0,3000,3000,0,0,11,25004,1,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - Cast Spell: Throw Nightmare Object to Position'),
(@REMULOS*100+2,9,2,0,0,0,100,0,5000,5000,0,0,12,@MALFURION,8,0,0,0,0,8,0,0,0,7730.5288,-2318.8596,453.8706,6.14985,'Keeper Remulos - Summon Malfurion Stormrage'),
(@REMULOS*100+2,9,3,0,0,0,100,0,2000,2000,0,0,1,12,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - Say Text 12'),
(@REMULOS*100+2,9,4,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Malfurion Stormrage - Say Text 0'),
(@REMULOS*100+2,9,5,0,0,0,100,0,6000,6000,0,0,1,13,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - Say Text 13'),
(@REMULOS*100+2,9,6,0,0,0,100,0,7000,7000,0,0,1,1,0,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Malfurion Stormrage - Say Text 1'),
(@REMULOS*100+2,9,7,0,0,0,100,0,11000,11000,0,0,1,14,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - Say Text 14'),
(@REMULOS*100+2,9,8,0,0,0,100,0,3500,3500,0,0,1,2,0,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Malfurion Stormrage - Say Text 2'),
(@REMULOS*100+2,9,9,0,0,0,100,0,4000,4000,0,0,1,15,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - Say Text 15'),
(@REMULOS*100+2,9,10,0,0,0,100,0,9000,9000,0,0,1,3,0,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Malfurion Stormrage - Say Text 3'),
(@REMULOS*100+2,9,11,0,0,0,100,0,19000,19000,0,0,1,4,0,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Malfurion Stormrage - Say Text 4'),
(@REMULOS*100+2,9,12,0,0,0,100,0,6000,6000,0,0,1,16,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - Say Text 16'),
(@REMULOS*100+2,9,13,0,0,0,100,0,2000,2000,0,0,1,17,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - Say Text 17'),
(@REMULOS*100+2,9,14,0,0,0,100,0,0,0,0,0,15,8447,0,0,0,0,0,7,0,0,0,0,0,0,0,'Keeper Remulos - Give Quest Credit'),
(@REMULOS*100+2,9,15,0,0,0,100,0,1000,1000,0,0,45,0,1,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Keeper Remulos - Set data 0 1 to Malfurion Stormrage'),
 --
(@MALFURION,0,0,0,54,0,100,0,0,0,0,0,11,52096,2,0,0,0,0,1,0,0,0,0,0,0,0,'Malfurion Stormrage - On summon - Cast Cosmetic Teleport Effect on self'),
(@MALFURION,0,1,0,38,0,100,0,0,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Malfurion Stormrage - On data set 0 1 - Despawn'),
 --
(@REMULOS*100+1,9,0,0,1,0,100,1,60000,60000,0,0,53,0,@REMULOS*100+1,0,8736,0,0,1,0,0,0,0,0,0,0,'On Script - OOC 1 Mintues - Go Home');

-- Eranikus, Tyrant of the Dream SAI
DELETE FROM `smart_scripts` WHERE entryorguid IN(@ERANIKUS,@ERANIKUS*100,@ERANIKUS*100+1);
INSERT INTO `smart_scripts` VALUES
(@ERANIKUS,0,0,0,1,0,100,1,13000,13000,13000,13000,1,0,15000,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - OOC 13 Sec - Say 0'),
(@ERANIKUS,0,1,0,52,0,100,0,0,@ERANIKUS,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - On Say 0 - Say 1'),
(@ERANIKUS,0,2,0,52,0,100,0,1,@ERANIKUS,0,0,1,2,34000,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - On Say 1 - Say 2'),
(@ERANIKUS,0,3,0,52,0,100,0,2,@ERANIKUS,0,0,1,3,3000,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - On Say 2 - Say 3'),
(@ERANIKUS,0,4,0,52,0,100,0,3,@ERANIKUS,0,0,1,4,3000,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - On Say 3 - Say 4'),
(@ERANIKUS,0,5,0,52,0,100,0,4,@ERANIKUS,0,0,53,0,@ERANIKUS,0,8736,0,0,1,0,0,0,0,0,0,0,'Eranikus - On Say 4 - Start WayPoint'),
(@ERANIKUS,0,6,0,40,0,100,0,3,@ERANIKUS,0,0,54,130000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - On WayPoint 3 - Pause'),
(@ERANIKUS,0,7,0,40,0,100,0,3,@ERANIKUS,0,0,1,5,10000,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - On WayPoint 3 - Say 5'),
(@ERANIKUS,0,8,0,52,0,100,0,5,@ERANIKUS,0,0,80,@ERANIKUS*100,0,2,0,0,0,1,0,0,0,0,0,0,0,'Eranikus -  On Say 5 - Start Script'),
(@ERANIKUS*100,9,0,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7865.966,-2554.104,486.967,5.492,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100,9,1,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7873.412,-2587.454,486.946,0.924,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100,9,2,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7901.544,-2581.989,487.178,2.059,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100,9,3,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7918.844,-2553.987,486.911,3.772,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100,9,4,0,0,0,100,0,5000,5000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7865.966,-2554.104,486.967,5.492,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100,9,5,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7873.412,-2587.454,486.946,0.924,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100,9,6,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7901.544,-2581.989,487.178,2.059,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100,9,7,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7918.844,-2553.987,486.911,3.772,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100,9,8,0,0,0,100,0,5000,5000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7865.966,-2554.104,486.967,5.492,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100,9,9,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7873.412,-2587.454,486.946,0.924,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100,9,10,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7901.544,-2581.989,487.178,2.059,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100,9,11,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7918.844,-2553.987,486.911,3.772,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100,9,12,0,0,0,100,0,5000,5000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7865.966,-2554.104,486.967,5.492,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100,9,13,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7873.412,-2587.454,486.946,0.924,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100,9,14,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7901.544,-2581.989,487.178,2.059,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100,9,15,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7918.844,-2553.987,486.911,3.772,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100,9,16,0,0,0,100,0,1000,1000,0,0,1,6,35000,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - On Script - Say 6'),
(@ERANIKUS,0,9,0,52,0,100,0,6,@ERANIKUS,0,0,80,@ERANIKUS*100+1,0,2,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - On Say 6 - Start Script'),
(@ERANIKUS*100+1,9,0,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7865.966,-2554.104,486.967,5.492,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100+1,9,1,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7873.412,-2587.454,486.946,0.924,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100+1,9,2,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7901.544,-2581.989,487.178,2.059,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100+1,9,3,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7918.844,-2553.987,486.911,3.772,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100+1,9,4,0,0,0,100,0,5000,5000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7865.966,-2554.104,486.967,5.492,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100+1,9,5,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7873.412,-2587.454,486.946,0.924,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100+1,9,6,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7901.544,-2581.989,487.178,2.059,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100+1,9,7,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7918.844,-2553.987,486.911,3.772,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100+1,9,8,0,0,0,100,0,5000,5000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7865.966,-2554.104,486.967,5.492,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100+1,9,9,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7873.412,-2587.454,486.946,0.924,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100+1,9,10,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7901.544,-2581.989,487.178,2.059,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100+1,9,11,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7918.844,-2553.987,486.911,3.772,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100+1,9,12,0,0,0,100,0,5000,5000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7865.966,-2554.104,486.967,5.492,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100+1,9,13,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7873.412,-2587.454,486.946,0.924,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100+1,9,14,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7901.544,-2581.989,487.178,2.059,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100+1,9,15,0,0,0,100,0,1000,1000,0,0,12,@PHANTASM,3,600000,0,0,0,8,0,0,0,7918.844,-2553.987,486.911,3.772,'Eranikus - On Script - Summon Nightmare Phantasm'),
(@ERANIKUS*100+1,9,16,0,0,0,100,0,1000,1000,0,0,1,7,33000,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - On Script - Say 7'),
(@ERANIKUS,0,10,0,40,0,100,0,4,@ERANIKUS,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - Waypont 4 reached - Set faction enemy'),
(@ERANIKUS,0,38,0,40,0,100,0,4,@ERANIKUS,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - Waypont 4 - Set react state aggresive'),
(@ERANIKUS,0,11,0,2,0,100,0,30,65,12000,35000,12,@PHANTASM,3,600000,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - In Combat - Summon Nightmare Phantasm'),
(@ERANIKUS,0,12,0,4,1,100,0,0,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - On aggro - Say 8'),
(@ERANIKUS,0,13,0,4,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - On aggro - Set react state aggresive'),  
(@ERANIKUS,0,14,0,4,0,100,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Eranikus - On aggro - Start Attack'),
(@ERANIKUS,0,15,0,0,0,100,0,2000,4000,55000,60000,11,24818,0,0,0,0,0,2,0,0,0,0,0,0,0,'Eranikus - In Combat - Cast Noxious Breath'),
(@ERANIKUS,0,16,0,0,0,100,0,9000,14000,50000,55000,11,24839,0,0,0,0,0,2,0,0,0,0,0,0,0,'Eranikus - In Combat - Cast Acid Spit'),
(@ERANIKUS,0,17,0,0,0,100,0,10000,20000,15000,25000,11,22878,0,0,0,0,0,2,0,0,0,0,0,0,0,'Eranikus - In Combat - Cast Shadow Bolt Volley'),
(@ERANIKUS,0,18,0,2,0,100,1,0,70,0,0,12,@TYRANDE,3,3600000,0,0,0,8,0,0,0,7900.216,-2572.621,488.176,2.330,'Eranikus - At 70% - Summon Tyrande'),
(@ERANIKUS,0,34,0,2,0,100,1,0,69,0,0,1,0,0,0,0,0,0,11,@TYRANDE,30,0,0,0,0,0,'Eranikus - At 69% - Tyrande Say 0'),
(@ERANIKUS,0,35,0,2,0,100,1,0,30,0,0,1,1,0,0,0,0,0,11,@TYRANDE,30,0,0,0,0,0,'Eranikus - At 30% - Tyrande Say 1'),
(@ERANIKUS,0,19,0,2,0,100,1,0,25,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - At 25% - Say 9'),
(@ERANIKUS,0,20,0,2,0,100,1,0,22,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - At 22% - Say 10'),
(@ERANIKUS,0,21,0,2,0,100,1,0,20,0,0,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - At 20% - Say 11'),
(@ERANIKUS,0,22,0,52,0,100,0,11,@ERANIKUS,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - On Say 2 - Set faction friendly'),
(@ERANIKUS,0,23,0,52,0,100,0,11,@ERANIKUS,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - On Say 2 - Set react state passive'),
(@ERANIKUS,0,24,0,52,0,100,0,11,@ERANIKUS,0,0,18,33555200,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - On Say 2 - Set unit flags'),
(@ERANIKUS,0,25,0,52,0,100,0,11,@ERANIKUS,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - On Say 2 - Stop AutoAttack'),
(@ERANIKUS,0,26,0,52,0,100,0,11,@ERANIKUS,0,0,1,12,3000,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - Say 11 - Say 12'),
(@ERANIKUS,0,27,0,52,0,100,0,12,@ERANIKUS,0,0,12,@E_REDEEM,3,60000,0,0,0,8,0,0,0,7904.248,-2564.867,488.156,5.116,'Eranikus - On Say 12 - Summon Eranikus the Redeemed'),  
(@ERANIKUS,0,28,0,52,0,100,0,12,@ERANIKUS,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - Say 12 - Kill'),
(@ERANIKUS,0,31,0,7,0,100,0,0,0,0,0,6,8736,0,0,0,0,0,18,40,0,0,0,0,0,0,'Eranikus - On Evade - Quest Fail'),
(@ERANIKUS,0,32,0,6,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus - On Death - Set invisibility'),
(@ERANIKUS,0,33,0,40,0,100,0,5,@ERANIKUS,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus  - On WayPoint 5 - Set invisibility'),
(@ERANIKUS,0,36,0,40,0,100,0,5,@ERANIKUS,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus  - On WayPoint 5 - Die'),
(@ERANIKUS,0,37,0,40,0,100,0,5,@ERANIKUS,0,0,6,8736,0,0,0,0,0,18,40,0,0,0,0,0,0,'Eranikus - On WayPoint 5 - Quest Fail');

-- Tyrande SAI
DELETE FROM `smart_scripts` WHERE entryorguid IN (@TYRANDE);
INSERT INTO `smart_scripts` VALUES
(@TYRANDE,0,0,0,54,0,100,1,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tyrande - On Summon - Set react state aggresive'),
(@TYRANDE,0,1,0,1,0,100,1,95000,95000,95000,95000,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tyrande - OOC 60 Sec - Set invisibility'),
(@TYRANDE,0,2,0,1,0,100,1,96000,96000,96000,96000,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tyrande - OOC 61 Sec - Kill'),
(@TYRANDE,0,3,0,0,0,100,0,1000,2000,2300,2500,11,21668,0,0,0,0,0,11,@ERANIKUS,20,0,0,0,0,0,'Tyrande - In Combat - Cast Starfall');

-- Eranikus the Redeemed SAI
UPDATE `creature_template` SET AIName='SmartAI', modelid1=6984 WHERE entry=@E_REDEEM;
DELETE FROM `smart_scripts` WHERE entryorguid IN(@E_REDEEM);
INSERT INTO `smart_scripts` VALUES
(@E_REDEEM,0,0,0,1,0,100,1,7000,7000,7000,7000,1,0,10000,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus the Redeemed - OOC 7 Secs - Say 0'),
(@E_REDEEM,0,1,0,52,0,100,0,0,@E_REDEEM,0,0,1,1,10000,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus the Redeemed - On Say 0 - Say 1'),
(@E_REDEEM,0,2,0,52,0,100,0,1,@E_REDEEM,0,0,1,2,10000,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus the Redeemed - On Say 1 - Say 2'),
(@E_REDEEM,0,3,0,52,0,100,0,2,@E_REDEEM,0,0,1,3,10000,0,0,0,0,1,0,0,0,0,0,0,0,'Eranikus the Redeemed - On Say 2 - Say 3'),
(@E_REDEEM,0,5,0,52,0,100,0,3,@E_REDEEM,0,0,15,8736,0,0,0,0,0,18,30,0,0,0,0,0,0,'Eranikus the Redeemed - On Say 3 - Credit'),
(@E_REDEEM,0,6,0,52,0,100,0,3,@E_REDEEM,0,0,45,1,1,0,0,0,0,11,@REMULOS,40,0,0,0,0,0,'Eranikus the Redeemed - On Say 3 - Set Data');

UPDATE `creature_template` SET AIName='SmartAI', Faction_A=14, Faction_H=14 WHERE entry=@PHANTASM;
DELETE FROM `smart_scripts` WHERE entryorguid IN(@PHANTASM);
INSERT INTO `smart_scripts` VALUES
(@PHANTASM,0,0,0,54,0,100,0,0,0,0,0,53,1,@PHANTASM,0,8736,0,0,1,0,0,0,0,0,0,0,'Nightmare Phantasm - Summon - Start WayPoint'),
(@PHANTASM,0,1,0,54,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nightmare Phantasm - Summon - Aggresive'),
(@PHANTASM,0,2,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,18,50,0,0,0,0,0,0,'Nightmare Phantasm - Summon - Attack Player'),
(@PHANTASM,0,3,0,6,0,75,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nightmare Phantasm - Death - Say 0'),
(@PHANTASM,0,4,0,40,0,100,0,4,@PHANTASM,0,0,53,1,@PHANTASM,0,8736,0,0,1,0,0,0,0,0,0,0,'Nightmare Phantasm - WayPoint 20 - Start Again'),
(@PHANTASM,0,5,0,1,0,100,1,60000,60000,60000,60000,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nightmare Phantasm - OOC 60 Secs - Unseen'),
(@PHANTASM,0,6,0,1,0,100,1,63000,63000,63000,63000,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Nightmare Phantasm - OOC 63 Secs - Despawn'),
(@PHANTASM,0,7,0,1,0,100,1,5000,5000,5000,5000,53,1,@PHANTASM,0,8736,0,0,1,0,0,0,0,0,0,0,'Nightmare Phantasm - OOC 5 Secs - Start WayPoint');

DELETE FROM `creature_template_addon` WHERE `entry`=@MALFURION;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@MALFURION,0,0,33554432,0,0,'24999'); -- Malfurion's Shade Aura & Hover Mode

DELETE FROM `creature_template_addon` WHERE `entry`=@ERANIKUS;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@ERANIKUS,0,0,33554432,0,0,'');

DELETE FROM `spell_target_position` WHERE `id`=25004;
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(25004,1,7730.5288,-2318.8596,451.34,0);

-- Waypoints
DELETE FROM `waypoints` WHERE entry=@REMULOS;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@REMULOS,1,7829.66,-2244.87,463.87,'Keeper Remulos'),
(@REMULOS,2,7817.25,-2306.20,456.00,'Keeper Remulos'),
(@REMULOS,3,7866.54,-2312.20,463.32,'Keeper Remulos'),
(@REMULOS,4,7908.488,-2309.086,467.677,'Keeper Remulos'),
(@REMULOS,5,7933.290,-2314.777,473.674,'Keeper Remulos'),
(@REMULOS,6,7942.543457,-2320.170654,476.770355,'Keeper Remulos'),
(@REMULOS,7,7953.036133,-2357.953613,486.379303,'Keeper Remulos'),
(@REMULOS,8,7962.706055,-2411.155518,488.955231,'Keeper Remulos'),
(@REMULOS,9,7976.860352,-2552.697998,490.081390,'Keeper Remulos'),
(@REMULOS,10,7949.307617,-2569.120361,489.716248,'Keeper Remulos'),
(@REMULOS,11,7950.945801,-2597.000000,489.765564,'Keeper Remulos'),
(@REMULOS,12,7948.758301,-2610.823486,492.368988,'Keeper Remulos'),
(@REMULOS,13,7928.785156,-2629.920654,492.524933,'Keeper Remulos'), ## stop
(@REMULOS,14,7948.697754,-2610.551758,492.363983,'Keeper Remulos'),
(@REMULOS,15,7952.019531,-2591.974609,490.081238,'Keeper Remulos'),
(@REMULOS,16,7940.567871,-2577.845703,488.946808,'Keeper Remulos'),
(@REMULOS,17,7908.662109,-2566.450439,488.634644,'Keeper Remulos'),
(@REMULOS,18,7873.132324,-2567.422363,486.946442,'Keeper Remulos'),
(@REMULOS,19,7839.844238,-2570.598877,489.286224,'Keeper Remulos'),
(@REMULOS,20,7830.678597,-2572.878974,489.286224,'Keeper Remulos'),
(@REMULOS,21,7890.504,-2567.259,487.306,'Keeper Remulos'),
(@REMULOS,22,7906.447,-2566.105,488.435,'Keeper Remulos'),
(@REMULOS,23,7925.861,-2573.601,489.642,'Keeper Remulos'),
(@REMULOS,24,7912.283,-2568.500,488.891,'Keeper Remulos');

DELETE FROM `waypoints` WHERE `entry`=@REMULOS*100;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@REMULOS*100,1,7828.5752,-2246.8354,463.5159,'Keeper Remulos - WP1'),
(@REMULOS*100,2,7824.6440,-2279.0273,459.3173,'Keeper Remulos - WP2'),
(@REMULOS*100,3,7814.1699,-2302.2565,456.2227,'Keeper Remulos - WP3'),
(@REMULOS*100,4,7787.4604,-2320.9807,454.5470,'Keeper Remulos - WP4'),
(@REMULOS*100,5,7753.7495,-2319.0832,454.7066,'Keeper Remulos - WP5'),
(@REMULOS*100,6,7787.4604,-2320.9807,454.5470,'Keeper Remulos - WP6'),
(@REMULOS*100,7,7814.1699,-2302.2565,456.2227,'Keeper Remulos - WP7'),
(@REMULOS*100,8,7824.6440,-2279.0273,459.3173,'Keeper Remulos - WP8'),
(@REMULOS*100,9,7828.5752,-2246.8354,463.5159,'Keeper Remulos - WP9'),
(@REMULOS*100,10,7848.3,-2216.35,470.888,'Keeper Remulos - WP10 (Home)');


-- Waypoints
DELETE FROM `waypoints` WHERE entry IN(@ERANIKUS);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ERANIKUS,1,7949.812,-2605.4748,513.591,'Eranikus'),
(@ERANIKUS,2,7931.3330,-2575.2097,489.6286,'Eranikus'),
(@ERANIKUS,3,7925.129,-2573.747,493.901,'Eranikus'),
(@ERANIKUS,4,7910.554,-2565.5534,488.616,'Eranikus'),
(@ERANIKUS,5,7867.442,-2567.334,486.946,'Eranikus');


-- Waypoints
DELETE FROM `waypoints` WHERE entry IN(@PHANTASM);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@PHANTASM,1,7891.990,-2566.737,487.385,'Phantasm'),
(@PHANTASM,2,7865.966,-2554.104,486.967,'Phantasm'),
(@PHANTASM,3,7901.544,-2581.989,487.178,'Phantasm'),
(@PHANTASM,4,7918.844,-2553.987,486.911,'Phantasm'),
(@PHANTASM,5,7873.412,-2587.454,486.946,'Phantasm');

-- Waypoints
DELETE FROM `waypoints` WHERE entry=@REMULOS*100+1;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@REMULOS*100+1,12,7847.066,-2217.571,470.403,'Keeper Remulos'),
(@REMULOS*100+1,11,7829.66,-2244.87,463.87,'Keeper Remulos'),
(@REMULOS*100+1,10,7817.25,-2306.20,456.00,'Keeper Remulos'),
(@REMULOS*100+1,9,7866.54,-2312.20,463.32,'Keeper Remulos'),
(@REMULOS*100+1,8,7908.488,-2309.086,467.677,'Keeper Remulos'),
(@REMULOS*100+1,7,7933.290,-2314.777,473.674,'Keeper Remulos'),
(@REMULOS*100+1,6,7942.543457,-2320.170654,476.770355,'Keeper Remulos'),
(@REMULOS*100+1,5,7953.036133,-2357.953613,486.379303,'Keeper Remulos'),
(@REMULOS*100+1,4,7962.706055,-2411.155518,488.955231,'Keeper Remulos'),
(@REMULOS*100+1,3,7976.860352,-2552.697998,490.081390,'Keeper Remulos'),
(@REMULOS*100+1,2,7949.307617,-2569.120361,489.716248,'Keeper Remulos'),
(@REMULOS*100+1,1,7940.567871,-2577.845703,488.946808,'Keeper Remulos');

-- Arch Druid Lilliandra
DELETE FROM `smart_scripts` WHERE entryorguid = 30630 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(30630, 0, 0, 1, 62, 0, 100, 0, 9991, 0, 0, 0, 85, 57536, 0, 0, 0, 0, 0, 19, 30630, 0, 0, 0, 0, 0, 0, 'Arch Druid Lilliandra - On gossip option select - Player Cast Forcecast Portal: Moonglade on Arch Druid Lilliandra');

-- Icecrown's Moonglade portal
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=32790;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
(32790,57654,1,0);

DELETE FROM `smart_scripts` WHERE entryorguid IN (32790) AND `source_type` IN (0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(32790, 0, 0, 1, 11, 0, 100, 0, 0, 0, 0, 0, 3, 0, 11686, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Moonglade Portal - On Respawn - Morph Into 0'),
(32790, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 61722, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Moonglade Portal - On Respawn - Cast Nature Portal State');

-- Moonglade's return portal
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=32788;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
(32788,57539,1,0);

DELETE FROM `smart_scripts` WHERE entryorguid IN (32788) AND `source_type` IN (0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(32788, 0, 0, 1, 11, 0, 100, 0, 0, 0, 0, 0, 3, 0, 11686, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Moonglade Return Portal - On Respawn - Morph Into 0'),
(32788, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 61722, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Moonglade Return Portal - On Respawn - Cast Nature Portal State');

-- Conditions for portals
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceEntry` IN (57654,57539);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 32790, 57654, 0, 0, 28, 0, 13073, 0, 0, 0, 0, 0, '', 'Required quest active for spellclick'),
(18, 32788, 57539, 0, 0, 28, 0, 13075, 0, 0, 0, 0, 0, '', 'Required quest active for spellclick');

DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9991,10215);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES 
(9991, 0, 0, 'It''s a pleasure to meet you as well, Arch Druid. I am on a task from Tirion and time is short, might I trouble you for a portal to Moonglade?', 1, 1, 9992, 0, 0, 0, ''),
(10215, 0, 0, 'Please send me into the Emerald Dream to recover the acorns. I know of the danger and I do not fear it.', 1, 1, 0, 0, 0, 0, ''),
(10215, 1, 0, 'I wish to return to Arch Druid Lilliandra. Can you send me back to her?', 1, 1, 0, 0, 0, 0, '');

-- Conditions for gossip
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (9991,10215);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 9991, 0, 0, 0, 28, 0, 13073, 0, 0, 0, 0, 0, '', 'Show gossip menu option only if player has quest 13073 complete'),
(15, 10215, 1, 0, 0, 28, 0, 13075, 0, 0, 0, 0, 0, '', 'Show gossip menu option only if player has quest 13075 complete'),
(15, 10215, 0, 0, 0, 9, 0, 13074, 0, 0, 0, 0, 0, '', 'Show gossip menu option only if player has quest 13074 taken');
SET @NPC := 7271;
DELETE FROM `creature_ai_scripts` WHERE creature_id=@NPC; 
UPDATE `creature_template` SET `AIName`='SmartAI', `unit_flags`=32768 WHERE `entry`=@NPC;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=@NPC AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC, 0, 0, 1, 10, 0, 100, 1, 0, 10, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum''rah - On OOC Los - Say Line 0'),
(@NPC, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 2, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum''rah - On Link - Remove PC immunity'),
(@NPC, 0, 3, 0, 0, 0, 100, 0, 1000, 3000, 6000, 10000, 11, 12739, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum''rah - IC - Cast Shadowbolt '),
(@NPC, 0, 4, 0, 2, 0, 100, 0, 30, 100, 30, 100, 23, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum''rah - On mana pct above 30% - Decrement Phase'),
(@NPC, 0, 5, 0, 0, 0, 100, 0, 15, 0, 15, 0, 23, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum''rah - On mana pct 15 - Decrement Phase'),
(@NPC, 0, 6, 0, 0, 0, 100, 0, 7000, 13000, 22000, 36000, 11, 15245, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum''rah - IC - Cast Shadowbolt Volley'),
(@NPC, 0, 7, 0, 0, 0, 100, 0, 8000, 15000, 26000, 39000, 11, 11086, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum''rah - IC - Cast Ward of Zum''rah '),
(@NPC, 0, 8, 0, 0, 0, 100, 0, 4000, 19000, 23000, 30000, 11, 12491, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum''rah - IC - Cast Healing Wave'),
(@NPC, 0, 9, 10, 6, 0, 100, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum''rah - On Death - Yell'),
(@NPC, 0, 10, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum''rah - On Death - Set Phase 0'),
(@NPC, 0, 11, 0, 7, 0, 100, 0, 0, 0, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum''rah - On Evade - Set Friendly');

DELETE FROM `creature_text` WHERE `entry` =@NPC;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(@NPC, 0, 0, 'How dare you enter my sanctum!', 12, 0, 100, 0, 0, 0, 'Witch Doctor Zum''rah'),
(@NPC, 1, 0, 'T''eif godehsi wha!', 14, 14, 100, 0, 0, 0, 'Witch Doctor Zum''rah');
-- Added missing gossip and text for Meridith the Mermaiden.Her gossip should now cast spell=25678 Siren's Song if player has Quest:Love_Song_for_Narain done, which will make players with quest Draconic for Dummies swim faster and not suffer from fatigue loss in waters.

-- Meridith the Mermaiden NPC id (15526)
-- http://www.youtube.com/watch?v=8lz_LbsEsBQ    Video of her giving spell on gossip select

SET @MERIDITH      := 15526;
SET @SPELL         := 25678; -- http://www.wowhead.com/spell=25678
SET @GOSSIP        := 6658;
SET @NPCTEXT       := 7916; 
SET @NPCTEXT1      := 7917;
SET @QUEST         := 8599;

UPDATE `creature_template` SET `gossip_menu_id`=@GOSSIP WHERE `entry`=@MERIDITH;

DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id` IN (@NPCTEXT,@NPCTEXT1);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(@GOSSIP,@NPCTEXT),
(@GOSSIP,@NPCTEXT1);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,0,0,"That would be wonderful! Thank you, Meridith.",1,1,0,0,0,0,'');

-- SAI for Meridith the Mermaiden
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@MERIDITH;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=15526 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@MERIDITH,0,0,1,62,0,100,0,@GOSSIP,0,0,0,11,@SPELL,0,0,0,0,0,7,0,0,0,0,0,0,0,'Meridith the Mermaiden - On gossip select - Spellcast'),
(@MERIDITH,0,1,2,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Meridith the Mermaiden - On gossip select - Close Gossip'),
(@MERIDITH,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Meridith the Mermaiden - On Gossip select - Say');

-- Conditions for Spellcast
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(14,@GOSSIP,@NPCTEXT,0,0,8,0,@QUEST,0,0,1,0,'','Show text if player doesn''t have quest rewarded' ),
(14,@GOSSIP,@NPCTEXT1,0,0,8,0,@QUEST,0,0,0,0,'','Show text if player has quest rewarded'),
(15,@GOSSIP,0,0,0,8,0,@QUEST,0,0,0,0,'','Show gossip only if player has quest done');


-- Creature text
DELETE FROM `npc_text` WHERE `ID` IN (@NPCTEXT,@NPCTEXT1);
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`) VALUES 
(@NPCTEXT, '', 'It''s so lovely to see you again, $N! I really can''t thank you enough for delivering that message to my dear little gnome.$B$BWould you like to hear a song? It will make traveling in the rough seas much easier!', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 11723),
(@NPCTEXT1, '', 'I find the ocean floor to be very peaceful.', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 11723);
-- Random comment

UPDATE `creature_template` SET AIName='SmartAI' WHERE entry IN (26417*100,26417);
DELETE FROM `smart_scripts` WHERE source_type=0 AND entryorguid = 26417;
DELETE FROM `smart_scripts` WHERE (`entryorguid`= 26417*100 AND `source_type`=9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(26417, 0, 0, 0, 8, 0, 25, 0, 47604, 0, 10000, 10000, 80, 2641700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Runed Giant - Start Script for Free At Last'),
(2641700, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Runed Giant - Change Faction'),
(2641700, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Runed Giant - Stop Attack'),
(2641700, 9, 2, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 33, 26783, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Runed Giant - Quest Credit'),
(2641700, 9, 3, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Runed Giant - Say Lines'),
(2641700, 9, 4, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Runed Giant - Despawn'),
(2641700, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Runed Giant - Reset Faction');

DELETE FROM `creature_text` WHERE `entry` =26417;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(26417, 0, 0, 'I thought I was doomed. Thank you for freeing me.', 12, 0, 100, 0, 0, 0, ''),
(26417, 0, 1, 'You have my gratitude.', 12, 0, 100, 0, 0, 0, ''),
(26417, 0, 2, 'I never thought I''d be free from that terrible spell!', 12, 0, 100, 0, 0, 0, ''),
(26417, 0, 3, 'Thank you, small one.', 12, 0, 100, 0, 0, 0, '');
DELETE FROM `trinity_string` WHERE `entry`=5037;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(5037, 'MechanicImmuneMask: %u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Fix Redridge Mystic
DELETE FROM `smart_scripts` WHERE `entryorguid`=430 AND `id`=12;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=430 AND `id`=11;
UPDATE `smart_scripts` SET `event_type`=2 WHERE  `entryorguid`=7271 AND `source_type`=0 AND `id`=5 AND `link`=0;
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='', `InhabitType`=7, `faction_A`=35, `faction_H`=35, `unit_flags`=0, `type_flags`=8, `dynamicflags`=128, `flags_extra`=0, `speed_walk`=2 WHERE `entry`= 15491;
DELETE FROM `trinity_string` WHERE `entry`=5038;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(5038, 'Unit Flags: %u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE `trinity_string` SET `content_default`=
'Unit Flags 2: %u.
Dynamic Flags: %u.
Faction Template: %u.' WHERE `entry`=542;
ALTER TABLE `creature_questrelation`       RENAME `creature_queststarter`;
ALTER TABLE `creature_involvedrelation`    RENAME `creature_questender`;
ALTER TABLE `gameobject_questrelation`     RENAME `gameobject_queststarter`;
ALTER TABLE `gameobject_involvedrelation`  RENAME `gameobject_questender`;

UPDATE `command` SET
    `name` = 'reload gameobject_queststarter',
    `help` = 'Syntax: .reload gameobject_queststarter\nReload gameobject_queststarter table.'
WHERE
    `name` = 'reload gameobject_questrelation';

UPDATE `command` SET
    `name` = 'reload gameobject_questender',
    `help` = 'Syntax: .reload gameobject_questender\nReload gameobject_questender table.'
WHERE
    `name` = 'reload gameobject_questrelation';

UPDATE `command` SET
    `name` = 'reload creature_queststarter',
    `help` = 'Syntax: .reload creature_queststarter\nReload creature_queststarter table.'
WHERE
    `name` = 'reload creature_questrelation';

UPDATE `command` SET
    `name` = 'reload creature_questender',
    `help` = 'Syntax: .reload creature_questender\nReload creature_questender table.'
WHERE
    `name` = 'reload creature_involvedrelation';
UPDATE `item_template` SET `spellcharges_1`=-1 WHERE `entry`=45008; -- confirmed in 4.x itemsparse
-- areatrigger for the shadow throne
DELETE FROM `areatrigger_scripts` WHERE `entry` = 5605;
INSERT INTO `areatrigger_scripts` (`entry`,`scriptname`) VALUES
(5605, 'at_shadow_throne');

-- jaina's equipment
DELETE FROM `creature_equip_template` WHERE `entry` = 36955 AND `id` = 1;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itementry1`, `itementry2`,`itementry3`) VALUES
(36955, 1, 2177, 12869, 0);

-- jaina's gossip menu (the same one FROM sylvanas)
UPDATE `creature_template` SET `gossip_menu_id` = 10909 WHERE `entry` = 36955;

-- jaina's scriptai part 2
UPDATE `creature_template` SET `ScriptName` = 'npc_jaina_or_sylvanas_escape_hor' WHERE `entry` in (36955, 37554);

-- Raging Ghoul scriptai
UPDATE `creature_template` SET `ScriptName` = 'npc_raging_ghoul' WHERE `entry` = 36940;

-- Risen Witch Doctor scriptai
UPDATE `creature_template` SET `ScriptName` = 'npc_risen_witch_doctor' WHERE `entry` = 36941;

-- LumberINg Abomination scriptai
UPDATE `creature_template` SET `ScriptName` = 'npc_lumbering_abomination' WHERE `entry` = 37069;
DELETE FROM `command` WHERE `name`='reload gameobject_questender';
INSERT INTO `command` (`name`, `security`, `help`) VALUES 
('reload gameobject_questender', 3, 'Syntax: .reload gameobject_questender\\nReload gameobject_questender table.');
SET @CGUID              := 120649;
SET @HULKING_HORROR     := 31411;
SET @HULKING_HORROR1    := 31413;
SET @KRENDELL           := 31444;
SET @V_COMMANDO         := 31414;
SET @UPPER_CUT          := 10966;
SET @INF_BITE           := 49861;
SET @COSMETIC_EXP       := 46225;
SET @FLAME_PATCH        := 42344;
SET @FC_PITFALL         := 59398;
SET @AURA_FALL          := 59396;
SET @ASPELL             := 59073;
SET @HSPELL             := 59087;
SET @AREA               := 4522;

-- Setting new spawns to appropriate phase, and older spawns to their own appropriate phase also.
UPDATE `creature_template` SET `minlevel`=79, `maxlevel`=80, `exp`=2, `faction_A`=2043, `faction_H`=2043, `speed_run`=1.28968, `mindmg`=422, `maxdmg`=586, `attackpower`=642, `minrangedmg`=345, `maxrangedmg`=509, `rangedattackpower`=103 WHERE  `entry`=31413;
UPDATE `creature_template` SET AIName = 'SmartAI' WHERE entry IN (@HULKING_HORROR,@HULKING_HORROR1);
UPDATE `creature` SET `phaseMask` = 2 WHERE id IN (@KRENDELL,@V_COMMANDO,@HULKING_HORROR);
UPDATE `creature` SET `phaseMask` = 8 WHERE id = @HULKING_HORROR1;
UPDATE `gameobject` SET `phaseMask` = 10 WHERE id IN (193401,193400);
UPDATE `creature` SET `phaseMask` = 10 WHERE id IN (31641, 31644);

-- Phasing zone to both Alliance and Horde sides so they don't collide with the npc's there.
DELETE FROM `spell_area` WHERE `spell` IN (@HSPELL,@ASPELL) AND `area`=@AREA;
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`,`quest_start_status`,`quest_end_status`) VALUES
(@HSPELL,@AREA,13258,13282,0, 690,2,1,66,43), -- Horde version
(@ASPELL,@AREA,13386,13392,0,1101,2,1,66,43); -- Alliance version

-- Missing Hulking Horrors
DELETE FROM `creature` WHERE guid BETWEEN @CGUID AND @CGUID+22; 
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(@CGUID, 31413, 571, 1, 8, 23681, 0, 5814.02, 1985.69, 503.881, 2.51188, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+1, 31413, 571, 1, 8, 23681, 0, 5816.86, 1943.29, 507.56, 3.40633, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+2, 31413, 571, 1, 8, 23681, 0, 5863.57, 1984, 507.648, 5.88321, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+3, 31413, 571, 1, 8, 23681, 0, 5778.56, 1957.5, 503.857, 3.27375, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+4, 31413, 571, 1, 8, 23681, 0, 5732.14, 1937.82, 506.014, 5.41257, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+5, 31413, 571, 1, 8, 23681, 0, 5706.3, 1977.47, 503.911, 4.05224, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+6, 31413, 571, 1, 8, 23681, 0, 5685.71, 1974.25, 503.863, 2.57831, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+7, 31413, 571, 1, 8, 23681, 0, 5673.84, 2094.37, 503.889, 5.52857, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+8, 31413, 571, 1, 8, 23681, 0, 5831.47, 2106.11, 503.89, 6.24962, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+9, 31413, 571, 1, 8, 23681, 0, 5826.33, 2149.32, 505.746, 2.48705, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+10, 31413, 571, 1, 8, 23681, 0, 5754.92, 2151.17, 503.91, 1.93734, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+11, 31413, 571, 1, 8, 23681, 0, 5775.43, 2193.86, 512.998, 0.776427, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+12, 31413, 571, 1, 8, 23681, 0, 5729.88, 2136.62, 503.894, 1.79434, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+13, 31413, 571, 1, 8, 23681, 0, 5782.62, 2140.68, 503.9, 0.783972, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+14, 31413, 571, 1, 8, 23681, 0, 5754.13, 2174.58, 506.181, 1.25723, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+15, 31413, 571, 1, 8, 23681, 0, 5650.03, 2055.57, 503.868, 0.939173, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+16, 31413, 571, 1, 8, 23681, 0, 5660.07, 2125.83, 505.943, 0.534949, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+17, 31413, 571, 1, 8, 23681, 0, 5700.89, 2148.91, 503.999, 5.77704, 300, 0, 0, 12175, 0, 0, 0, 0, 0),
(@CGUID+18, 31413, 571, 1, 8, 23681, 0, 5651.27, 2007.15, 504.97, 1.98891, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+19, 31413, 571, 1, 8, 23681, 0, 5858.93, 2108.63, 505.124, 2.30257, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+20, 31413, 571, 1, 8, 23681, 0, 5688.14, 2001.98, 503.924, 0.151243, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+21, 31413, 571, 1, 8, 23681, 0, 5845.64, 2080.43, 503.97, 2.90496, 300, 5, 0, 12175, 0, 1, 0, 0, 0),
(@CGUID+22, 31413, 571, 1, 8, 23681, 0, 5876.8, 2037.78, 506.147, 0.498635, 300, 0, 0, 12175, 0, 0, 0, 0, 0);

-- Conditions for Aura fall
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 and `SourceEntry` = @AURA_FALL;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, @AURA_FALL, 0, 0, 31, 0, 3, 31641, 0, 0, 0, 0, '', 'Aura fall hits only pitfall npc');

-- Saronite bomb should blow-up the player into the pit
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=193400;
DELETE FROM `smart_scripts` WHERE `source_type`=1 AND `entryorguid`=193400;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(193400, 1, 0, 0, 19, 0, 100, 0, 13389, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 10, 123287, 31644, 0, 0, 0, 0, 0, 'Saronite Bomb Stack - On quest accept - Set Data'),
(193400, 1, 1, 0, 19, 0, 100, 0, 13263, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 10, 123287, 31644, 0, 0, 0, 0, 0, 'Saronite Bomb Stack - On quest accept - Set Data');

-- Cosmetic Explosion bunny
UPDATE `creature_template` SET AIName = 'SmartAI' WHERE entry = 31644;
DELETE FROM `smart_scripts` WHERE `entryorguid`=31644 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(31644, 0, 0, 1, 38, 0, 100, 0, 1, 1, 0, 0, 11, @COSMETIC_EXP, 2, 0, 0, 0, 0, 9, 31644, 20, 40, 0, 0, 0, 0, 'Cosmetic Trigger - On Data set - Cosmetic Explosion'),
(31644, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, @FLAME_PATCH, 2, 0, 0, 0, 0, 9, 31644, 20, 40, 0, 0, 0, 0, 'Cosmetic Trigger - On Link - Cast flame patch on npc''s'),
(31644, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 12, 31641, 1, 0, 0, 0, 0, 21, 10, 0, 0, 0, 0, 0, 0, 'Saronite Bomb Stack - On Link - Summon Pitfall bunny');

-- "Fall" vehicle bunny
UPDATE `creature_template` SET AIName = 'SmartAI', `speed_walk`=20.1429, `speed_run`=20.1429 WHERE entry = 31641; 
DELETE FROM `smart_scripts` WHERE `entryorguid`=31641 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(31641, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 11, @FC_PITFALL, 2, 0, 0, 0, 0, 21, 100, 0, 0, 0, 0, 0, 0, 'Pitfall bunny - On respawn - Cast FC pitfall'),
(31641, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 5756.644, 2050.579, 480.6346, 0, 'Pitfall bunny - On Link - Go to PoS');

-- Hulking Horror phase 2
DELETE FROM `smart_scripts` WHERE `entryorguid`=@HULKING_HORROR AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@HULKING_HORROR,0,0,0,0,0,100,0,8000,16000,24000,32000,11,@INF_BITE,0,0,0,0,0,5,0,0,0,0,0,0,0,'Hulking Horror - In Combat - Cast Infected Bite'),
(@HULKING_HORROR,0,1,0,0,0,100,0,4000,9000,14000,19000,11,@UPPER_CUT,0,0,0,0,0,5,0,0,0,0,0,0,0,'Hulking Horror - In Combat - Cast Uppercut'),
(@HULKING_HORROR,0,2,0,6,0,100,0,0,0,0,0,33,31413,0,0,0,0,0,5,0,0,0,0,0,0,0,'Hulking Horror - On Death - Killcredit');

-- Hulking Horrors phase 8
DELETE FROM `smart_scripts` WHERE `entryorguid`=@HULKING_HORROR1 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@HULKING_HORROR1,0,0,0,0,0,100,0,8000,16000,24000,32000,11,@INF_BITE,0,0,0,0,0,5,0,0,0,0,0,0,0,'Hulking Horror - In Combat - Cast Infected Bite'),
(@HULKING_HORROR1,0,1,0,0,0,100,0,4000,9000,14000,19000,11,@UPPER_CUT,0,0,0,0,0,5,0,0,0,0,0,0,0,'Hulking Horror - In Combat - Cast Uppercut');
-- Into The Wild Green Yonder (13045)
SET @NPC_CAPTURED           := 30407; -- Captured Crusader
SET @NPC_SKYTALON           := 30500; -- Argent Skytalon (not the mount)
SET @NPC_SKYTALON_MOUNT     := 30228; -- Argent Skytalon (mount)

UPDATE `creature_template` SET `faction_A`=2070,`faction_H`=2070 WHERE `entry`=@NPC_SKYTALON;
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=@NPC_SKYTALON_MOUNT;

-- Re-vamped SAI script
UPDATE `creature_template` SET `npcflag`=0,`AIName`='SmartAI' WHERE `entry`=@NPC_CAPTURED;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@NPC_CAPTURED;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_CAPTURED,0,0,1,25,0,100,0,0,0,0,0,75,56726,0,0,0,0,0,1,0,0,0,0,0,0,0,'Apply aura on reset, linking to id 1'),
(@NPC_CAPTURED,0,1,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'set phasemask to 1'),
(@NPC_CAPTURED,0,2,0,1,1,100,0,4000,4000,4000,4000,10,70,22,0,0,0,0,1,0,0,0,0,0,0,0,'play emote OOC in phase 1'),
(@NPC_CAPTURED,0,3,4,8,1,100,0,56683,0,0,0,11,56687,0,0,0,0,0,7,0,0,0,0,0,0,0,'Mount proto drake on spell hit, linking to id 4'),
(@NPC_CAPTURED,0,4,5,61,1,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say text , linking to id 5'),
(@NPC_CAPTURED,0,5,0,61,1,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'set phasemask to 2'),
(@NPC_CAPTURED,0,6,0,1,2,100,0,8000,8000,8000,8000,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say text OOC in phase 2, starting with 8sec delay, then repeat every 8 secs'),
(@NPC_CAPTURED,0,7,8,23,2,100,0,56687,0,1000,1000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'say text if does not have ride aura(check every 1 sec), linking to id 8'),
(@NPC_CAPTURED,0,8,9,61,2,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,'set despawn timer for 5 secs, linking to id 9'),
(@NPC_CAPTURED,0,9,0,61,2,100,0,0,0,0,0,22,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'set phase to 4');
-- Re-vamped spellclick
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=@NPC_SKYTALON;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
-- Proper value
(@NPC_SKYTALON,56922,2,0);
-- rRe-vamped condition
DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId`=18 AND `SourceEntry`=56922) OR (`SourceTypeOrReferenceId`=17 AND `SourceEntry`=56684) OR (`SourceTypeOrReferenceId`=13 AND `SourceEntry`=56683);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,@NPC_SKYTALON,56922,0,0,8,0,13045,0,0,1,0,'','Forbidden rewarded quest for spellclick'),
(18,@NPC_SKYTALON,56922,0,0,9,0,13045,0,0,0,0,'','Required quest active for spellclick'),
(13,1,56683,0,0,31,0,3,@NPC_CAPTURED,0,0,0,'','Grab Captured Crusader targets Captured Crusader'),
(17,0,56684,0,0,30,0,192523,15,0,0,0,'','Spell focus for Drop Off Captured Crusader'),
(17,0,56684,0,0,29,0,@NPC_CAPTURED,10,0,0,0,'','Drop Off Captured Crusader requires a Captured Crusader');
-- The Last Line Of Defense (13086)
SET @NEXT := 142412;
SET @PATH := @NEXT * 10;

DELETE FROM `spell_script_names` WHERE `spell_id` IN (57412,57385);
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES
(57412,'spell_q13086_cannons_target'),
(57385,'spell_q13086_cannons_target');

-- Forgotten Depths Slayer SAI ID: 30593
UPDATE `creature_template` SET `speed_walk`=5,`movementtype`=1,`faction_A`=2068, `faction_H`=2068,`AIName`= 'SmartAI' WHERE `entry`= 30593;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=30593;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(30593,0,1,0,0,0,100,0,1000,5000,2500,6500,11,54185,0,0,0,0,0,2,0,0,0,0,0,0,0,'Combat - Claw Slash');

-- Adds 70 Forgotten Depths Slayers for phase 64 ID: 30593
DELETE FROM `creature` WHERE `id`=30593;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `MovementType`) VALUES
(@NEXT+1, 30593, 571, 1, 64, 6442.551758, 222.894867, 397.353943, 2.7317, 5, 60, 0, 1), 
(@NEXT+2, 30593, 571, 1, 64, 6437.940430, 215.351151, 397.798889, 0.929563, 5, 60, 0, 1), 
(@NEXT+3, 30593, 571, 1, 64, 6419.338379, 239.908859, 396.095978, 2.1122, 5, 60, 0, 1), 
(@NEXT+4, 30593, 571, 1, 64, 6428.831055, 239.908859, 396.763702, 3.5549, 5, 60, 0, 1), 
(@NEXT+5, 30593, 571, 1, 64, 6400.702148, 236.755035, 395.685333, 1.32629, 5, 60, 0, 1),
(@NEXT+6, 30593, 571, 1, 64, 6410.955078, 249.759094, 396.454742, 2.77181, 5, 60, 0, 1),
(@NEXT+7, 30593, 571, 1, 64, 6367.340820, 183.807068, 391.614655, 0.501217, 5, 60, 0, 1),
(@NEXT+8, 30593, 571, 1, 64, 6382.062500, 176.836975, 393.132507, 1.22528, 5, 60, 0, 1), 
(@NEXT+9, 30593, 571, 1, 64, 6357.964355, 158.979782, 391.124756, 2.99677, 5, 60, 0, 1),
(@NEXT+10, 30593, 571, 1, 64, 6373.327537, 146.681412, 392.788330, 3.35221, 5, 60, 0, 1),
(@NEXT+11, 30593, 571, 1, 64, 6343.335938, 173.300323, 389.862518, 4.18409, 5, 60, 0, 1),
(@NEXT+12, 30593, 571, 1, 64, 6335.788086, 148.828232, 389.702972, 3.19711, 5, 60, 0, 1),
(@NEXT+13, 30593, 571, 1, 64, 6347.954590, 129.882919, 3391.126984, 2.81552, 5, 60, 0, 1),
(@NEXT+14, 30593, 571, 1, 64, 6333.287109, 88.245689, 391.002228, 5.84132, 5, 60, 0, 1),
(@NEXT+15, 30593, 571, 1, 64, 6336.879395, 71.525627, 390.192871, 0.785398, 5, 60, 0, 1),
(@NEXT+16, 30593, 571, 1, 64, 6318.244629, 32.249405, 391.493988, 2.1325, 5, 60, 0, 1),
(@NEXT+17, 30593, 571, 1, 64, 6312.728320, 8.393217, 392.626587, 0.291176, 5, 60, 0, 1),
(@NEXT+18, 30593, 571, 1, 64, 6326.704590, 107.359123, 391.002045, 0.919091, 5, 60, 0, 1),
(@NEXT+19, 30593, 571, 1, 64, 6301.972656, 119.744209, 389.925903, 1.55615, 5, 60, 0, 1),
(@NEXT+20, 30593, 571, 1, 64, 6266.120117, 148.388809, 383.515961, 1.84373, 5, 60, 0, 1),
(@NEXT+21, 30593, 571, 1, 64, 6251.726074, 153.168182, 381.629669, 1.80125, 5, 60, 0, 1),
(@NEXT+22, 30593, 571, 1, 64, 6229.003418, 145.614822, 379.721741, 5.84095, 5, 60, 0, 1),
(@NEXT+23, 30593, 571, 1, 64, 6284.683082, 214.294250, 388.699188, 2.78648, 5, 60, 0, 1),
(@NEXT+24, 30593, 571, 1, 64, 6302.265625, 212.301346, 390.488556, 3.48219, 5, 60, 0, 1),
(@NEXT+25, 30593, 571, 1, 64, 6299.725098, 226.082626, 391.288788, 5.13205, 5, 60, 0, 1),
(@NEXT+26, 30593, 571, 1, 64, 6200.917969,  220.434753, 383.776184, 2.88047, 5, 60, 0, 1),
(@NEXT+27, 30593, 571, 1, 64, 6200.930664, 234.127823, 384.630798, 1.50529, 5, 60, 0, 1),
(@NEXT+28, 30593, 571, 1, 64, 6190.595703, 225.242371, 382.554016, 4.4761, 5, 60, 0, 1),
(@NEXT+29, 30593, 571, 1, 64, 6189.209961, 210.502823, 381.877960, 2.11574, 5, 60, 0, 1),
(@NEXT+30, 30593, 571, 1, 64, 6176.683594, 213.375336, 380.395172, 0.763302, 5, 60, 0, 1),
(@NEXT+31, 30593, 571, 1, 64, 6113.089844, 156.401672, 369.398804, 5.60417, 5, 60, 0, 1),
(@NEXT+32, 30593, 571, 1, 64, 6103.571289, 140.684174, 367.524414, 0.430917, 5, 60, 0, 1),
(@NEXT+33, 30593, 571, 1, 64, 6093.838867, 143.838867, 367.781097, 6.10437, 5, 60, 0, 1),
(@NEXT+34, 30593, 571, 1, 64, 6090.764160, 141.764160, 365.786255, 5.91518, 5, 60, 0, 1),
(@NEXT+35, 30593, 571, 1, 64, 6079.681641, 141.840958, 366.456573, 5.91108, 5, 60, 0, 1),
(@NEXT+36, 30593, 571, 1, 64, 6062.076660, 155.683197, 363.868896, 2.05191, 5, 60, 0, 1),
(@NEXT+37, 30593, 571, 1, 64, 6076.666016, 163.742477, 362.454651, 3.57468, 5, 60, 0, 1),
(@NEXT+38, 30593, 571, 1, 64, 6088.131348, 179.086304, 360.483307, 5.6035, 5, 60, 0, 1),
(@NEXT+39, 30593, 571, 1, 64, 6098.503418, 176.307312, 364.942688, 5.6035, 5, 60, 0, 1),
(@NEXT+40, 30593, 571, 1, 64, 6090.764160, 155.876968, 365.786255, 5.6035, 5, 60, 0, 1),
(@NEXT+41, 30593, 571, 1, 64, 6338.830566, 70.974663, 390.432343, 5.6035, 5, 60, 0, 1),
(@NEXT+42, 30593, 571, 1, 64, 6339.270508, 63.711479, 389.662994, 5.6035, 5, 60, 0, 1),
(@NEXT+43, 30593, 571, 1, 64, 6282.305176, 128.449188, 386.556244, 5.6035, 5, 60, 0, 1),
(@NEXT+44, 30593, 571, 1, 64, 6267.317383, 130.918854, 384.601959, 5.6035, 5, 60, 0, 1),
(@NEXT+45, 30593, 571, 1, 64, 6182.309082, 94.777863, 377.689959, 5.6035, 5, 60, 0, 1),
(@NEXT+46, 30593, 571, 1, 64, 6157.960383, 89.072354, 371.833959, 5.6035, 5, 60, 0, 1),
(@NEXT+47, 30593, 571, 1, 64, 6236.617383, 113.980854, 380.351959, 5.6035, 5, 60, 0, 1),
(@NEXT+48, 30593, 571, 1, 64, 6295.647383, 137.418854, 387.451959, 5.6035, 5, 60, 0, 1),
(@NEXT+49, 30593, 571, 1, 64, 6200.917969,  220.434753, 383.776184, 2.88047, 5, 60, 0, 1),
(@NEXT+50, 30593, 571, 1, 64, 6200.930664, 234.127823, 384.630798, 1.50529, 5, 60, 0, 1),
(@NEXT+51, 30593, 571, 1, 64, 6190.595703, 225.242371, 382.554016, 4.4761, 5, 60, 0, 1),
(@NEXT+52, 30593, 571, 1, 64, 6189.209961, 210.502823, 381.877960, 2.11574, 5, 60, 0, 1),
(@NEXT+53, 30593, 571, 1, 64, 6176.683594, 213.375336, 380.395172, 0.763302, 5, 60, 0, 1),
(@NEXT+54, 30593, 571, 1, 64, 6113.089844, 156.401672, 369.398804, 5.60417, 5, 60, 0, 1),
(@NEXT+55, 30593, 571, 1, 64, 6103.571289, 140.684174, 367.524414, 0.430917, 5, 60, 0, 1),
(@NEXT+56, 30593, 571, 1, 64, 6093.838867, 143.838867, 367.781097, 6.10437, 5, 60, 0, 1),
(@NEXT+57, 30593, 571, 1, 64, 6090.764160, 141.764160, 365.786255, 5.91518, 5, 60, 0, 1),
(@NEXT+58, 30593, 571, 1, 64, 6079.681641, 141.840958, 366.456573, 5.91108, 5, 60, 0, 1),
(@NEXT+59, 30593, 571, 1, 64, 6062.076660, 155.683197, 363.868896, 2.05191, 5, 60, 0, 1),
(@NEXT+60, 30593, 571, 1, 64, 6076.666016, 163.742477, 362.454651, 3.57468, 5, 60, 0, 1),
(@NEXT+61, 30593, 571, 1, 64, 6088.131348, 179.086304, 360.483307, 5.6035, 5, 60, 0, 1),
(@NEXT+62, 30593, 571, 1, 64, 6098.503418, 176.307312, 364.942688, 5.6035, 5, 60, 0, 1),
(@NEXT+63, 30593, 571, 1, 64, 6090.764160, 155.876968, 365.786255, 5.6035, 5, 60, 0, 1),
(@NEXT+64, 30593, 571, 1, 64, 6338.830566, 70.974663, 390.432343, 5.6035, 5, 60, 0, 1),
(@NEXT+65, 30593, 571, 1, 64, 6339.270508, 63.711479, 389.662994, 5.6035, 5, 60, 0, 1),
(@NEXT+66, 30593, 571, 1, 64, 6282.305176, 128.449188, 386.556244, 5.6035, 5, 60, 0, 1),
(@NEXT+67, 30593, 571, 1, 64, 6267.317383, 130.918854, 384.601959, 5.6035, 5, 60, 0, 1),
(@NEXT+68, 30593, 571, 1, 64, 6182.309082, 94.777863, 377.689959, 5.6035, 5, 60, 0, 1),
(@NEXT+69, 30593, 571, 1, 64, 6157.960383, 89.072354, 371.833959, 5.6035, 5, 60, 0, 1),
(@NEXT+70, 30593, 571, 1, 64, 6236.617383, 113.980854, 380.351959, 5.6035, 5, 60, 0, 1);

-- Frostbrood Destroyers 5
UPDATE `creature_template` SET `maxlevel`=80,`minlevel`=80,`exp`=2,`InhabitType`=7,`speed_walk`=3,`mindmg` = 1170,`dmg_multiplier` = 2,`attackpower` = 342,`maxdmg` = 3470,`movementtype`=1,`faction_A`=2068, `faction_H`=2068 WHERE `entry`= 30575;
DELETE FROM `creature` WHERE `id`=30575;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@NEXT+71, 30575,571,1,64,6097.870117, 58.331299, 380.506012, 0.138359, 75,20,1),
(@NEXT+72, 30575,571,1,64,6243.700195, 183.362000, 392.515015, 4.594332, 75,20,1),
(@NEXT+73, 30575,571,1,64,6313.589844, 154.557999, 397.022003, 4.739780, 75,20,1),
(@NEXT+74, 30575,571,1,64,6331.450195, 53.939301, 399.138000, 2.973792, 75,20,1),
(@NEXT+75, 30575,571,1,64,6187.290039, 131.792999, 386.451996, 3.173792, 75,20,1);

-- Hover mode for Frostbroods
DELETE FROM `creature_template_addon` WHERE `entry`=30575;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(30575,0,0,33554432,0,0,'');

-- Pathing
-- Slayers reinforcements left on main path
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+1;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+1;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES 
(@NEXT+1,@PATH+1,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+1;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+1,1,6442.551758, 222.894867, 397.353943,0,2,0,100,0),
(@PATH+1,2,6337.383789,113.591568,391.210876,6000,2,0,100,0),
(@PATH+1,3,6299.144531,126.174286,391.081909,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+2;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+2;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES 
(@NEXT+2,@PATH+2,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+2;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+2,1,6437.940430,215.351151,397.798889,0,2,0,100,0),
(@PATH+2,2,6327.383789,143.591568,391.210876,6000,2,0,100,0),
(@PATH+2,3,6296.544531,76.174286,391.081909,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+3;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+3;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES 
(@NEXT+3,@PATH+3,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+3;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+3,1,6419.338379,239.908859,396.095978,0,2,0,100,0),
(@PATH+3,2,6317.383789,115.591568,391.210876,6000,2,0,100,0),
(@PATH+3,3,6294.144531,126.174286,391.081909,6000,2,0,100,0);

-- Slayers reinforcements right on main path
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+4;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+4;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES 
(@NEXT+4,@PATH+4,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+4;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+4,1, 6428.831055, 239.908859, 396.763702,0,2,0,100,0),
(@PATH+4,2,6346.144531,126.174286,391.081909,6000,2,0,100,0),
(@PATH+4,3,6297.353789,80.591568,391.210876,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+5;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+5;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES 
(@NEXT+5,@PATH+5,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+5;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+5,1, 6400.702148, 236.755035, 395.685333,0,2,0,100,0),
(@PATH+5,2,6356.144531,106.174286,391.081909,6000,2,0,100,0),
(@PATH+5,3,6398.383789,70.591568,391.210876,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+6;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+6;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES 
(@NEXT+6,@PATH+6,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+6;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+6,1, 6410.955078, 249.759094, 396.454742,0,2,0,100,0),
(@PATH+6,2,6376.144531,116.174286,391.081909,6000,2,0,100,0),
(@PATH+6,3,6295.383789,65.591568,391.210876,6000,2,0,100,0);

-- Slayers reinforcements on the rear
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+31;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+31;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES 
(@NEXT+31,@PATH+7,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+7;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+7,1, 6113.089844, 156.401672, 369.398804,0,2,0,100,0),
(@PATH+7,2,6175.009766,125.577263,369.434753,6000,2,0,100,0),
(@PATH+7,3,6109.930176,49.710854,369.404419,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+32;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+32;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NEXT+32,@PATH+8,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+8;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+8,1, 6103.571289, 140.684174, 368.524414,0,2,0,100,0),
(@PATH+8,2,6165.009766,119.577263,369.434753,6000,2,0,100,0),
(@PATH+8,3,6118.930176,64.710854,369.404419,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+33;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+33;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NEXT+33,@PATH+9,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+9;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+9,1, 6093.838867, 143.838867, 368.781097,0,2,0,100,0),
(@PATH+9,2,6171.009766,114.577263,369.434753,6000,2,0,100,0),
(@PATH+9,3,6114.930176,61.710854,369.404419,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+34;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+34;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NEXT+34,@PATH+10,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+10;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+10,1, 6090.764160, 141.764160, 369.786255,0,2,0,100,0),
(@PATH+10,2,6183.009766,109.577263,369.434753,6000,2,0,100,0),
(@PATH+10,3,6109.930176,57.710854,369.404419,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+35;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+35;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NEXT+35,@PATH+11,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+11;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+11,1, 6079.681641, 141.840958, 369.456573,0,2,0,100,0),
(@PATH+11,2,6180.009766,121.577263,369.434753,6000,2,0,100,0),
(@PATH+11,3,6124.930176,70.710854,369.404419,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+36;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+36;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NEXT+36,@PATH+12,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+12;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+12,1, 6062.076660, 155.683197, 369.868896,0,2,0,100,0),
(@PATH+12,2,6114.930176,74.710854,368.404419,6000,2,0,100,0),
(@PATH+12,3,6187.009766,111.577263,369.434753,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+37;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+37;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NEXT+37,@PATH+13,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+13;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+13,1, 6076.666016, 163.742477, 369.454651,0,2,0,100,0),
(@PATH+13,2,6117.930176,55.710854,369.404419,6000,2,0,100,0),
(@PATH+13,3,6178.009766,112.577263,369.434753,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+38;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+38;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NEXT+38,@PATH+14,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+14;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+14,1, 6088.131348, 179.086304, 372.483307,0,2,0,100,0),
(@PATH+14,2,6115.930176,73.710854,369.404419,6000,2,0,100,0),
(@PATH+14,3,6185.009766,119.577263,369.434753,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+39;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+39;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NEXT+39,@PATH+15,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+15;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+15,1, 6098.503418, 176.307312, 369.942688,0,2,0,100,0),
(@PATH+15,2,6115.930176,51.710854,369.404419,6000,2,0,100,0),
(@PATH+15,3,6185.009766,110.577263,369.434753,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+40;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+40;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NEXT+40,@PATH+16,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+16;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+16,1, 6090.764160, 155.876968, 368.786255,0,2,0,100,0),
(@PATH+16,2,6112.930176,61.710854,369.404419,6000,2,0,100,0),
(@PATH+16,3,6176.009766,114.577263,370.434753,6000,2,0,100,0);

-- Slayers from West to both parts
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+26;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+26;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NEXT+26,@PATH+17,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+17;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+17,1, 6200.917969,  220.434753, 372.776184,0,2,0,100,0),
(@PATH+17,2,6346.144531,126.174286,372.081909,6000,2,0,100,0),
(@PATH+17,3,6287.383789,80.591568,372.210876,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+27;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+27;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NEXT+27,@PATH+19,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+19;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+19,1, 6200.917969,  220.434753, 372.776184,0,2,0,100,0),
(@PATH+19,2,6356.144531,106.174286,372.081909,6000,2,0,100,0),
(@PATH+19,3,6395.383789,70.591568,372.210876,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+28;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+28;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NEXT+28,@PATH+20,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+20;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+20,1, 6190.595703, 225.242371, 372.554016,0,2,0,100,0),
(@PATH+20,2,6175.009766,125.577263,372.434753,6000,2,0,100,0),
(@PATH+20,3,6104.930176,59.710854,372.404419,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+29;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+29;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES 
(@NEXT+29,@PATH+21,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+21;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+21,1, 6189.209961, 210.502823, 372.877960,0,2,0,100,0),
(@PATH+21,2,6171.009766,119.577263,372.434753,6000,2,0,100,0),
(@PATH+21,3,6118.930176,64.710854,372.404419,6000,2,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NEXT+29;
DELETE FROM `creature_addon` WHERE `guid`=@NEXT+29;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES 
(@NEXT+29,@PATH+22,1,0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH+22;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+22,1, 6176.683594, 213.375336, 372.395172,0,2,0,100,0),
(@PATH+22,2,6173.009766,117.577263,372.434753,6000,2,0,100,0),
(@PATH+22,3,6118.930176,63.710854,372.404419,6000,2,0,100,0);

-- Turrets
UPDATE `creature_template` SET `faction_A`=2231,`faction_H`=2231,`unit_flags`=16777220,`npcflag`=16777216,`vehicleid`=292 WHERE `entry`=30236;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=30236;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(30236,57573,1,0);
UPDATE `creature_template` SET `faction_A`=35,`faction_H`=35 WHERE `entry`=30236;
-- Move boss_lord_valthalak from EAI to CPP
UPDATE `creature_template` SET `AIName`= '', `ScriptName`= 'boss_lord_valthalak' WHERE `entry`=16042;
DELETE FROM creature_ai_scripts WHERE `creature_id`=16042;
DELETE FROM `creature_text` WHERE `entry`=16042 AND `groupid`=0;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(16042, 0, 0, '%s goes into a frenzy!', 16, 0, 100, 0, 0, 0, 'Lord Valthalak - Cast Frenzy');
-- Move Yor from EAI to CPP
UPDATE `creature_template` SET `AIName`= '', `ScriptName`= 'npc_yor' WHERE `entry`=22930;
DELETE FROM creature_ai_scripts WHERE `creature_id`=22930;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 and `SourceEntry` IN (49555,59807,49618,59809,49405,49380,59803);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,49555,0,0,31,0,3,27709,0,0,0,0,'','Trollgore - Corpse Explode'),
(13,1,49555,0,1,31,0,3,27753,0,0,0,0,'','Trollgore - Corpse Explode'),
(13,1,49555,0,2,31,0,3,27754,0,0,0,0,'','Trollgore - Corpse Explode'),

(13,1,59807,0,0,31,0,3,27709,0,0,0,0,'','Trollgore - Corpse Explode'),
(13,1,59807,0,1,31,0,3,27753,0,0,0,0,'','Trollgore - Corpse Explode'),
(13,1,59807,0,2,31,0,3,27754,0,0,0,0,'','Trollgore - Corpse Explode'),

(13,1,49618,0,0,31,0,3,27709,0,0,0,0,'','Trollgore - Corpse Explode Damage'),
(13,1,49618,0,1,31,0,3,27753,0,0,0,0,'','Trollgore - Corpse Explode Damage'),
(13,1,49618,0,2,31,0,3,27754,0,0,0,0,'','Trollgore - Corpse Explode Damage'),
(13,1,49618,0,3,31,0,4,0,0,0,0,0,'','Trollgore - Corpse Explode Damage'),

(13,1,59809,0,0,31,0,3,27709,0,0,0,0,'','Trollgore - Corpse Explode Damage'),
(13,1,59809,0,1,31,0,3,27753,0,0,0,0,'','Trollgore - Corpse Explode Damage'),
(13,1,59809,0,2,31,0,3,27754,0,0,0,0,'','Trollgore - Corpse Explode Damage'),
(13,1,59809,0,3,31,0,4,0,0,0,0,0,'','Trollgore - Corpse Explode Damage'),

(13,1,49405,0,0,31,0,3,26630,0,0,0,0,'','Trollgore - Invader Taunt Trigger'),

(13,3,49380,0,0,31,0,3,27709,0,0,0,0,'','Trollgore - Consume'),
(13,3,49380,0,1,31,0,3,27753,0,0,0,0,'','Trollgore - Consume'),
(13,3,49380,0,2,31,0,3,27754,0,0,0,0,'','Trollgore - Consume'),
(13,3,49380,0,3,31,0,4,0,0,0,0,0,'','Trollgore - Consume'),

(13,3,59803,0,0,31,0,3,27709,0,0,0,0,'','Trollgore - Consume'),
(13,3,59803,0,1,31,0,3,27753,0,0,0,0,'','Trollgore - Consume'),
(13,3,59803,0,2,31,0,3,27754,0,0,0,0,'','Trollgore - Consume'),
(13,3,59803,0,3,31,0,4,0,0,0,0,0,'','Trollgore - Consume');

DELETE FROM `spell_script_names` WHERE `spell_id` IN (49555,59807,49405,49380,59803,59910);
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES
(49555,'spell_trollgore_corpse_explode'),
(59807,'spell_trollgore_corpse_explode'),
(49405,'spell_trollgore_invader_taunt'),
(49380,'spell_trollgore_consume'),
(59803,'spell_trollgore_consume'),
(59910,'spell_novos_summon_minions');

DELETE FROM `creature_text` WHERE `entry`=26631 AND `groupid`=5;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(26631, 5, 0, '%s calls for assistance!', 41, 0, 100, 0, 0, 0, 'Novos the Summoner - EMOTE_SUMMONING_ADDS');

DELETE FROM `spelldifficulty_dbc` WHERE `id`=49618;
INSERT INTO `spelldifficulty_dbc` (`id`, `spellid0`, `spellid1`) VALUES
(49618, 49618, 59809);
-- Move boss_anzu from EAI to CPP
UPDATE `creature_template` SET `AIName`= '', `ScriptName`= 'boss_anzu' WHERE `entry`=23035;
DELETE FROM creature_ai_scripts WHERE `creature_id`=23035;
DELETE FROM `creature_text` WHERE `entry`=23035;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(23035, 0, 0, 'Awaken, my children and assist your master!', 14, 0, 100, 0, 0, 0, 'Anzu - Summon Brood'),
(23035, 1, 0, 'Your spells... ke-kaw... are weak magics... easy to turn against you...', 15, 0, 100, 0, 0, 0, 'Anzu - Spell Bomb'),
(23035, 1, 1, 'Yes... cast your precious little spells, ak-a-ak!', 15, 0, 100, 0, 0, 0, 'Anzu - Spell Bomb');
UPDATE `smart_scripts` SET `event_param2`=100, `event_param4`=100 WHERE  `entryorguid`=7271 AND `source_type`=0 AND `id`=5 AND `link`=0; -- Kirk
DELETE FROM `command` WHERE `name`='reload gameobject_involvedrelation'; -- Runico
DELETE FROM `spelldifficulty_dbc` WHERE `id` IN (49555, 49380, 49381);
INSERT INTO `spelldifficulty_dbc` (`id`, `spellid0`, `spellid1`) VALUES
(49555, 49555, 59807),
(49380, 49380, 59803),
(49381, 49381, 59805);

UPDATE `creature_template` SET `InhabitType`=5 WHERE `entry`=27724;

DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (27709,27753,27754));
INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(127478, 0, 0x0, 0x1, '31261'),
(127479, 0, 0x0, 0x1, '31261'),
(127517, 0, 0x0, 0x1, '31261'),
(127518, 0, 0x0, 0x1, '31261'),
(127519, 0, 0x0, 0x1, '31261'),
(127528, 0, 0x0, 0x1, '31261'),
(127539, 0, 0x0, 0x1, '31261');

DELETE FROM `creature` WHERE `guid` > 127479 AND `guid` < 127489;
DELETE FROM `creature` WHERE `guid` > 127519 AND `guid` < 127539 AND `guid` != 127528;

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id` IN (27709,27753,27754);

UPDATE `creature_template` SET `faction_A`=1693, `faction_H`=1693, `unit_flags`=768, `InhabitType`=5 WHERE `entry` IN (27709,27753,27754);
UPDATE `creature_template` SET `ScriptName` = 'npc_drakkari_invader' WHERE `entry` IN (27709,27753,27754);

DELETE FROM `creature_template_addon` WHERE `entry` IN (27709,27753,27754);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(27709, 26751, 0x0, 0x1, NULL),
(27753, 26751, 0x0, 0x1, NULL),
(27754, 26751, 0x0, 0x1, NULL);
-- Random comment
SET @IMMOLATION             := 58627; 
SET @CHECKTRIGGER           := 58594; 
SET @CHECK                  := 58593; 
SET @ABOMINATION            := 30689;
SET @CREDIT                 := 58599;
SET @EXPLOSION              := 58596;
SET @SKELETON               := 31048;
SET @KC                     := 30995;

-- Add SAI for Burning Skeleton
UPDATE `creature_template` SET AIName='SmartAI' WHERE `entry`=@SKELETON;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SKELETON;
INSERT INTO `smart_scripts` VALUES
(@SKELETON,0,0,1,25,0,100,0,0,0,0,0,11,@IMMOLATION,0,0,0,0,0,1,0,0,0,0,0,0,0,'Burning Skeleton - On spawn - Cast Immolation on self'),
(@SKELETON,0,1,0,61,0,100,0,0,0,0,0,11,@CHECKTRIGGER,0,0,0,0,0,1,0,0,0,0,0,0,0,'Burning Skeleton - Linked with event 0 - Cast Skeleton Check Master on self'),
(@SKELETON,0,2,3,31,0,100,0,@CHECK,0,0,0,33,@KC,0,0,0,0,0,23,0,0,0,0,0,0,0,'Burning Skeleton - On target hit by spell Check  - Cast Credit Trigger on self'),
(@SKELETON,0,3,4,61,0,100,0,0,0,0,0,28,@CHECKTRIGGER,0,0,0,0,0,1,0,0,0,0,0,0,0,'Burning Skeleton - Linked with event 2 - Remove auras from spell CheckTrigger'),
(@SKELETON,0,4,0,61,0,100,0,0,0,0,0,11,@EXPLOSION,0,0,0,0,0,1,0,0,0,0,0,0,0,'Burning Skeleton - Linked with event 3 - Cast explosion on self');

-- Add condition for Check to target only abominations /that are alive/
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=@CHECK;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition` ,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,@CHECK,0,0,31,0,3,@ABOMINATION,0,0,0,'','Check can target only chained abominations'),
(13,1,@CHECK,0,0,36,0,0,0,0,0,0,'','Check can target only target alive creatures');

-- Add conditions for Explosion effect 1
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=@EXPLOSION;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition` ,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,2,@EXPLOSION,0,0,31,0,3,@ABOMINATION,0,0,0,'','Explosion effect 1 can target only abomination');

SET @STALKER                := 23033;
SET @ABOMINATION            := 30689;
SET @RIGHT_HAND             := 57983; -- Reference to Nayd's wife
SET @LEFT_HAND              := 57980;
-- Using creature range as a targeting method; guid wise would be wiser but it has bugs out and targets the next living abomination (Not what we want)
UPDATE `creature_template` SET AIName='SmartAI',`InhabitType`=4  WHERE `entry`=@STALKER;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-124991,-124992,-124993,-124981,-124980,-124979);
INSERT INTO `smart_scripts` VALUES
(-124991,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-124992,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-124993,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-124981,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination'),
(-124980,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination'),
(-124979,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination');
-- Group 2
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-124982,-124983,-124984,-124969,-124968,-124967);
INSERT INTO `smart_scripts` VALUES
(-124982,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-124983,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-124984,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-124969,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination'),
(-124968,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination'),
(-124967,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination');
-- Group 3
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-125000,-125001,-125002,-124985,-124986,-124987);
INSERT INTO `smart_scripts` VALUES
(-125000,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-125001,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-125002,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-124985,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination'),
(-124986,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination'),
(-124987,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination');
-- Group 4
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-124973,-124974,-124975,-124976,-124977,-124978);
INSERT INTO `smart_scripts` VALUES
(-124973,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-124974,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-124975,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-124976,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination'),
(-124977,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination'),
(-124978,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination');
-- Group 5
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-124988,-124989,-124990,-124970,-124971,-124972);
INSERT INTO `smart_scripts` VALUES
(-124988,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-124989,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-124990,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-124970,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination'),
(-124971,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination'),
(-124972,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination');
-- Group 6
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-124998,-124999,-124997,-124996,-124995,-124994);
INSERT INTO `smart_scripts` VALUES
(-124997,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-124998,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-124999,0,0,0,60,0,100,0,0,1,20000,20000,11,@RIGHT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain right hand on abomination'),
(-124994,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination'),
(-124995,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination'),
(-124996,0,0,0,60,0,100,0,0,1,20000,20000,11,@LEFT_HAND,0,0,0,0,0,11,@ABOMINATION,5,0,0,0,0,0,'Stalker - OOC - Cast Chain left hand on abomination');

-- Add condition target for chains
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13  AND `SourceEntry` IN (@LEFT_HAND,@RIGHT_HAND);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,@LEFT_HAND,0,0,31,0,3,@ABOMINATION,0,0,0,'','Left Hand Chains only target Chained Abomination'),
(13,1,@RIGHT_HAND,0,0,31,0,3,@ABOMINATION,0,0,0,'','Right Hand Chains only target Chained Abomination');
DELETE FROM `creature_template_addon` WHERE `entry`=27003;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(27003, 270030, 0, 0, 1, 0, NULL);

UPDATE `creature` SET `currentwaypoint`=0,`MovementType`=2,`spawndist`=0 WHERE `guid`=107239;
DELETE FROM `waypoint_data` WHERE `id`=270030;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(270030, 1, 3671.979, -497.5903, 157.9536, 0, 0, 0, 0, 100, 0),
(270030, 2, 3693.592, -472.8958, 163.496, 0, 0, 0, 0, 100, 0),
(270030, 3, 3694.013, -466.6045, 160.7129, 0, 0, 0, 0, 100, 0),
(270030, 4, 3713.763, -454.1045, 159.2129, 0, 10000, 0, 0, 100, 0),
(270030, 5, 3717.158, -453.4165, 161.311, 0, 0, 0, 0, 100, 0),
(270030, 6, 3717.857, -415.6472, 151.0353, 0, 0, 0, 0, 100, 0),
(270030, 7, 3716.621, -404.0498, 152.4212, 0, 0, 0, 0, 100, 0),
(270030, 8, 3704.548, -388.2196, 162.9577, 0, 10000, 0, 0, 100, 0),
(270030, 9, 3717.158, -453.4165, 161.311, 0, 0, 0, 0, 100, 0),
(270030, 10, 3717.357, -443.3972, 160.0353, 0, 0, 0, 0, 100, 0),
(270030, 11, 3717.357, -440.3972, 159.2853, 0, 0, 0, 0, 100, 0),
(270030, 12, 3717.607, -438.3972, 158.7853, 0, 0, 0, 0, 100, 0),
(270030, 13, 3717.607, -436.3972, 158.0353, 0, 0, 0, 0, 100, 0),
(270030, 14, 3717.607, -434.3972, 157.2853, 0, 0, 0, 0, 100, 0),
(270030, 15, 3717.607, -432.6472, 156.2853, 0, 0, 0, 0, 100, 0),
(270030, 16, 3717.607, -430.6472, 155.5353, 0, 0, 0, 0, 100, 0),
(270030, 17, 3717.607, -428.6472, 154.5353, 0, 0, 0, 0, 100, 0),
(270030, 18, 3717.607, -426.6472, 153.7853, 0, 0, 0, 0, 100, 0),
(270030, 19, 3717.607, -424.6472, 153.0353, 0, 0, 0, 0, 100, 0),
(270030, 20, 3717.607, -422.6472, 152.2853, 0, 0, 0, 0, 100, 0),
(270030, 21, 3717.607, -418.6472, 151.5353, 0, 0, 0, 0, 100, 0),
(270030, 22, 3717.857, -415.6472, 151.0353, 0, 10000, 0, 0, 100, 0);
-- Fueling the Project (11715)
-- oh, and guess what! random comment
SET @NPC_OIL                := 25781; -- Oil Pool
SET @SPELL_OIL_COLLECTOR    := 45990; -- Collect Oil
SET @SPELL_SUMON_COLLECTOR  := 45991; -- Summon Oil Collector
SET @SPELL_OIL_COAT         := 46011; -- Oil Coat (small)
SET @SPELL_FD               := 35357; -- Spawn Feign Death

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@NPC_OIL;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@NPC_OIL;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@NPC_OIL;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_OIL,0,0,1,25,0,100,0,0,0,0,0,11,@SPELL_FD,0,0,0,0,0,1,0,0,0,0,0,0,0,'On reset - Cast Spawn Feign Death'),
(@NPC_OIL,0,1,0,61,0,100,0,0,0,0,0,11,@SPELL_OIL_COAT,0,0,0,0,0,1,0,0,0,0,0,0,0,'On link - Cast Oil Coat (small)'),
--
(@NPC_OIL,0,2,3,8,0,100,0,@SPELL_OIL_COLLECTOR,0,0,0,11,@SPELL_SUMON_COLLECTOR,0,0,0,0,0,7,0,0,0,0,0,0,0,'On spellhit - Cast Summon Oil Collector'),
(@NPC_OIL,0,3,4,61,0,100,0,0,0,0,0,33,@NPC_OIL,0,0,0,0,0,7,0,0,0,0,0,0,0,'On spellhit - Give killcredit'),
(@NPC_OIL,0,4,0,61,0,100,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,'On link - Despawn in 1 sec');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=@SPELL_OIL_COLLECTOR;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,@SPELL_OIL_COLLECTOR,0,0,31,0,3,@NPC_OIL,0,0,0,'','Collect Oil target Oil Pool');
-- Strengthen the Ancients (12092)
-- Woodlands Walker
SET @ENTRY := 26421;
UPDATE `creature_template` SET `npcflag`=1,`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100+0,@ENTRY*100+1);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,50,0,0,11,50994,0,0,0,0,0,1,0,0,0,0,0,0,0,'Woodlands Walker - Cast Toughen Hide - at 50% HP'),
(@ENTRY,0,1,2,64,0,100,1,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'On gossip hello - Close gossip - Invoker'),
(@ENTRY,0,2,0,61,0,100,1,0,0,0,0,88,@ENTRY*100+0,@ENTRY*100+1,0,0,0,0,1,0,0,0,0,0,0,0,'On link - Run random script - Self'),
--
(@ENTRY*100+0,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Woodlands Walker - Emote text - Self'),
(@ENTRY*100+0,9,1,0,0,0,100,0,1000,1000,0,0,2,16,0,0,0,0,0,1,0,0,0,0,0,0,0,'Woodlands Walker - Set faction monster - Self'),
--
(@ENTRY*100+1,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Woodlands Walker - Emote text - Self'),
(@ENTRY*100+1,9,1,0,0,0,100,0,1000,1000,0,0,11,47550,0,0,0,0,0,7,0,0,0,0,0,0,0,'Woodlands Walker - Cast Create Bark of the Walkers - Invoker'),
(@ENTRY*100+1,9,2,0,0,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Woodlands Walker - Despawn - Self');

DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"The %s is angered by your request and attacks!",16,0,100,0,0,0,"emote text"),
(@ENTRY,1,0,"Breaking off a piece of its bark, the %s hands it to you before departing.",16,0,100,0,0,0,"emote text");
-- See You on the Other Side (12121)
-- Jin'arrak's End (12152)

SET @ENTRY1         := 27199; -- Warlord Jinarrak
SET @ENTRY2         := 27200; -- Offering Bunny - Drakil'jin Exterior
SET @ENTRY3         := 26902; -- Essence of Warlord Jin'arrak
SET @ENTRY4         := 32742; -- Your Corpse
SET @ENTRY5         := 27201; -- Offering Target Bunny - Drakil'jin Exterior
SET @RAGE           := 47744; -- Rage of Jin'arrak
SET @OTOS           := 61611; -- On the Other Side
SET @BODY           := 61612; -- Summon Your Corpse
SET @OFFER          := 48059; -- Place Offering
SET @FEED           := 48060; -- Jin'arrak Feeds
SET @CREDIT         := 48194; -- Jin'arrak Kill Credit

-- Warlord Jinarrak
DELETE FROM `creature_template_addon` WHERE `entry`=@ENTRY1;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@ENTRY1,0,0,0,0,'17327 31951');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY1,@ENTRY1*100,@ENTRY1*100+1);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY1,0,0,0,54,0,100,1,0,0,0,0,44,3,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Warlord Jin''Arrak - Just summoned - Set phasemask 3 - Self'),
(@ENTRY1,0,1,2,38,0,100,0,0,2,0,0,80,@ENTRY1*100+1,0,2,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Warlord Jin''Arrak - On dataset 0 2 - Run script - Self'),
(@ENTRY1,0,2,0,61,0,100,0,0,0,0,0,5,15,0,0,0,0,0,1,0,0,0,0,0,0,0,'Warlord Jin''Arrak - Linked - Play emote roar'),
(@ENTRY1,0,3,4,38,0,100,0,0,1,0,0,80,@ENTRY1*100,0,2,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Warlord Jin''Arrak - On dataset 0 1 - Run script - Self'),
(@ENTRY1,0,4,0,61,0,100,0,0,0,0,0,5,15,0,0,0,0,0,1,0,0,0,0,0,0,0,'Warlord Jin''Arrak - Linked - Play emote roar'),
-- Scr 1
(@ENTRY1*100,9,0,0,0,0,100,1,0,0,0,0,11,47730,0,0,0,0,0,1,0,0,0,0,0,0,0,'Warlord Jin''Arrak - Script -  Gong Effect - Self'),
(@ENTRY1*100,9,1,0,0,0,100,1,10000,10000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Warlord Jin''Arrak - Script - Emote Text - Self'),
(@ENTRY1*100,9,2,0,0,0,100,1,0,0,0,0,11,@RAGE,0,0,0,0,0,18,20,0,0,0,0,0,0,'Warlord Jin''Arrak - Script - Cast Rage of Jin''arrak - Players in range'),
(@ENTRY1*100,9,3,0,0,0,100,1,10000,10000,0,0,33,@ENTRY3,0,0,0,0,0,18,20,0,0,0,0,0,0,'Warlord Jin''Arrak - Script- Kill credit - Players in range'),
-- Scr2
(@ENTRY1*100+1,9,0,0,0,0,100,0,1500,1500,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Warlord Jin''Arrak - Script - Say 0'),
(@ENTRY1*100+1,9,1,0,0,0,100,0,1000,1000,0,0,11,48060,0,0,0,0,0,19,@ENTRY5,0,0,0,0,0,0,'Warlord Jin''Arrak - Script - Cast feed'),
(@ENTRY1*100+1,9,2,0,0,0,100,0,7000,7000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Warlord Jin''Arrak - Script - Say 1'),
(@ENTRY1*100+1,9,3,0,0,0,100,0,3000,3000,0,0,17,64,0,0,0,0,0,1,0,0,0,0,0,0,0,'Warlord Jin''Arrak - Script - emotestate stun'),
(@ENTRY1*100+1,9,4,0,0,0,100,0,5000,5000,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Warlord Jin''Arrak - Script - emotestate none'),
(@ENTRY1*100+1,9,5,0,0,0,100,0,0,0,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'Warlord Jin''Arrak - Script - Set field_byte_1 to 7'),
(@ENTRY1*100+1,9,6,0,0,0,100,0,2000,2000,0,0,11,@CREDIT,0,0,0,0,0,18,20,0,0,0,0,0,0,'OOC - Cast credit - Players in range'),
(@ENTRY1*100+1,9,7,0,0,0,100,0,10000,10000,0,0,41,0,0,0,0,0,0,0,1,0,0,0,0,0,0,'OOC - Cast credit - Players in range');


DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (-@RAGE,@OTOS);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(-@RAGE,@OTOS,0,'Cast other side when curse expires'),
(@OTOS,@BODY,1,'Summon body when going to other side');


DELETE FROM `creature_text` WHERE `entry`=@ENTRY1;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY1,0,0,'Finally, a worthy offering!',41,0,0,0,0,0,'Warlord Jinarrak - Say Text'),
(@ENTRY1,1,0,'Ahhh! What be happenin'' to me, mon?',41,0,0,0,0,0,'Warlord Jinarrak - Say Text'),
(@ENTRY1,2,0,'How dare you summon me without an offering!',41,0,0,0,0,0,'Warlord Jinarrak - Say Text');

-- Offering Bunny - Drakil'jin Exterior
UPDATE `creature_template` SET `AIName`='SmartAI',`flags_extra`=128 WHERE `entry`=@ENTRY2;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY2,0,0,1,54,0,100,1,0,0,0,0,12,@ENTRY1,3,180000,0,0,0,8,0,0,0,4678.47,-4859.35,35.48,3.11,'Just summoned - Temp summon Warlord Jinarrak - Position'),
(@ENTRY2,0,1,0,61,0,100,1,0,0,0,0,11,@OFFER,0,0,0,0,0,1,0,0,0,0,0,0,0,'Link - Cast Place Offering - Self'),
(@ENTRY2,0,2,0,1,0,100,1,1000,1000,0,0,45,0,2,0,0,0,0,11,@ENTRY1,50,0,0,0,0,0,'OOC 2 sec later - Set data 0 2 - Warlord Jinarrak');

-- Essence of Warlord Jin'arrak
UPDATE `creature_template` SET `AIName`='SmartAI',`flags_extra`=128 WHERE `entry`=@ENTRY3;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY3;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY3,0,0,0,54,0,100,1,0,0,0,0,12,@ENTRY1,3,30000,0,0,0,8,0,0,0,4678.47,-4859.35,35.48,3.11,'Just summoned - Temp summon - Position'),
(@ENTRY3,0,1,0,1,0,100,1,1000,1000,0,0,45,0,1,0,0,0,0,11,@ENTRY1,50,0,0,0,0,0,'OOC 1 sec later - Set data 0 1 - Warlord Jinarrak');
UPDATE creature_template SET AIName = 'SmartAI' WHERE entry =@ENTRY1;
UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry`=@ENTRY5;
-- Your Corpse
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY4;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY4;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY4,0,0,1,54,0,100,1,0,0,0,0,85,60352,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Just summoned - Invoker cast Mirror Image - Invoker'),
(@ENTRY4,0,1,2,61,0,100,1,0,0,0,0,44,3,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Link - Set phasemask 3 - Self'),
(@ENTRY4,0,2,0,61,0,100,1,0,0,0,0,11,29266,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Link - Cast Permanent Feign Death - Self');
SET @Crystal=31131; -- Containment Crystal
SET @Watcher=31110; -- Eidolon Watcher

-- Update creature_templates and template_addons
UPDATE `creature_template` SET `exp`=2,`minlevel`=80,`maxlevel`=80,`unit_flags`=`unit_flags`|32776 WHERE `entry`=@Watcher; 
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33555200,`AIname`='SmartAI' WHERE `entry`=@Crystal;
DELETE FROM `creature_template_addon` WHERE `entry` IN (@Watcher,@Crystal);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@Watcher,0,0,1,0, NULL),
(@Crystal,0,0,1,0, NULL);
-- Delete old condition 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=1 AND `SourceEntry`=193058 AND `SourceId`=1;
-- Four quests need gains control of the Eidolon Watcher not only one
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=10028 AND `sourceEntry`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15,10028,0,0,0,9,0,13168,0,0,0,0,0,'','Show Gossip option only if player has quest active'),
(15,10028,0,0,1,9,0,13171,0,0,0,0,0,'','Show Gossip option only if player has quest active'),
(15,10028,0,0,2,9,0,13169,0,0,0,0,0,'','Show Gossip option only if player has quest active'),
(15,10028,0,0,3,9,0,13170,0,0,0,0,0,'','Show Gossip option only if player has quest active');
-- Conditions for Banish Scourge Crystal spell
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `sourceEntry`=58658;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13,1,58658,0,0,31,0,3,@Crystal,0,0,0,0,'','Banish Scourge Crystal Hits Only Containment Crystal');
-- Sai for Containment Crystal
DELETE FROM `smart_scripts` WHERE `entryorguid`=31131 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Crystal,0,0,1,8,0,100,0,58662,0,0,0,33,@Crystal,0,0,0,0,0,7,0,0,0,0,0,0,0,'Containment Crystal - On Spell Hit - Give Quest Credit'),
(@Crystal,0,1,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Containment Crystal - Link With Previous Event - Despawn');
UPDATE `smart_scripts` SET `action_param1`=1 WHERE `entryorguid`=2546000 AND `source_type`=9 AND `id`=1;
UPDATE `creature_template` SET `faction_A`=103, `faction_H`=103 WHERE `entry`=21264; -- Seeping Ooze
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=5353;

DELETE FROM `smart_scripts` WHERE `entryorguid`=5353 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(5353, 0, 0, 1,62, 0, 100, 0, 1364, 0, 0, 0, 85, 12578, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Itharius - On Gossip Select - Cast Create Oathstone of Yseras Dragonflight'),
(5353, 0, 1, 0,61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Itharius - Linked with Previous Event - Close Gossip');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=1341;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,1341,1,0,0,2,0,10455,1,1,0,0,'','Itharius show gossip only if player has Chained Essence of Eranikus'),
(15,1341,1,0,0,2,0,10589,1,1,1,0,'','Itharius show gossip only if player Does not have Oathstone of Yseras Dragonflight'),
(15,1341,1,0,0,8,0,3374,0,0,1,0,'','Itharius show gossip only if player has not completed The Essence of Eranikus q3374'),
(15,1341,1,0,0,8,0,3373,0,0,0,0,'','Itharius show gossip only if player has completed The Essence of Eranikus q3373');
UPDATE `creature_template` SET `AIName`='' WHERE `AIName`='0';
UPDATE `smart_scripts` SET `action_param3`=0 WHERE `entryorguid`=19055 AND `source_type`=0 AND `id`=0;
UPDATE `creature` SET `MovementType`=0 WHERE `guid`=107239;
UPDATE `creature_template` SET `MovementType`=2 WHERE `entry`=27003;
DELETE FROM `creature` WHERE `id`=27715;
UPDATE `creature_template` SET `faction_a`=14, `faction_h`=14, `AIName`='SmartAI' WHERE `entry` IN (27715, 27716, 27717, 27718);
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (27727, 27726);

DELETE FROM `creature_text` WHERE `entry` IN (27719, 27727, 27726);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(27719,0,0,"Ladies and gentlemen! Well... let's just say you don't want to miss this one!",14,0,100,0,0,0,'Grennix Shivwiggle - Quest Accepted'),
(27727,0,0,"You went behind my back. You neglected my orders. You will pay the price.",12,0,100,0,0,0,'Conqueror Krenna - Say 0'),
(27727,1,1,"Enough talk. By the time I'm though with you, not even the worgs will go near your corpse.",12,0,100,0,0,0,'Conqueror Krenna - Say 1'),
(27726,0,0,"I used good judgment when you showed non. I don't want to see you lead us into ruin, Krenna!",12,0,100,0,0,0,'Gorgonna - Say 0'),
(27726,1,1,"It doesn't have to end this way, you know?",12,0,100,0,0,0,'Gorgonna - Say 1'),
(27726,2,2,"We'll see about that",12,0,100,0,0,0,'Gorgonna - Say 2'),
(27726,3,3,"Why... why sister? Why did it have to come to this?",12,0,100,0,0,0,'Gorgonna - Say 3');

-- SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (27715,27716,27717,27718,27727,27719,27726);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (27715,27716,27717,27718,27727,27719,27726);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (27715,27716,27717,27718,27727,27719,27726);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(27715,0,0,0,9,0,100,0,8,25,17000,24000,11,32323,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Ironhide - Cast Charge'),
(27715,0,1,0,0,0,100,0,5000,7000,7000,9000,11,34298,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Ironhide - Cast Maul'),
(27715,0,2,0,9,0,100,0,0,5,7000,11000,11,31279,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Ironhide - Cast Swipe'),
(27715,0,3,0,7,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ironhide - Evade - Unseen'),
(27715,0,4,0,7,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ironhide - Evade - Despawn'),
(27715,0,5,0,6,0,100,0,0,0,0,0,15,12427,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Ironhide - Death - Credit'),
(27715,0,6,0,6,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ironhide - Death - Unseen'),
(27715,0,7,0,7,0,100,0,0,0,0,0,6,12427,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Ironhide - Evade - Quest Fail'),

-- Torgg Thundertotem 27716
(27716,0,0,0,0,0,100,0,1000,3000,6000,8000,11,16033,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Torgg Thundertotem - Cast Chain Lightning'),
(27716,0,1,0,0,0,100,0,10000,20000,5000,15000,11,15982,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Torgg Thundertotem - Cast Healing Wave'),
(27716,0,2,0,0,0,100,0,0,0,21000,21000,11,31991,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Torgg Thundertotem - Cast Corrupted Nova Totem'),
(27716,0,3,0,0,0,100,0,4000,4000,12000,12000,11,15501,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Torgg Thundertotem - Cast Earth Shock'),
(27716,0,4,0,7,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Torgg Thundertotem - Evade - Unseen'),
(27716,0,5,0,7,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Torgg Thundertotem - Evade - Despawn'),
(27716,0,6,0,6,0,100,0,0,0,0,0,15,12428,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Torgg Thundertotem - Credit'),
(27716,0,7,0,6,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Torgg Thundertotem - Death - Unseen'),
(27716,0,8,0,7,0,100,0,0,0,0,0,6,12428,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Torgg Thundertotem - Evade - Quest Fail'),

-- Rustblood 27717
(27717,0,0,0,0,0,100,0,5000,7000,5000,7000,11,42746,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Rustblood - Cast Cleave'),
(27717,0,1,0,9,0,100,0,0,5,22000,30000,11,49398,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Rustblood - Cast Knockback'),
(27717,0,2,0,0,0,100,0,12000,15000,18000,21000,11,14102,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Rustblood - Cast Head Smash'),
(27717,0,3,0,0,0,100,0,0,3000,12000,12000,11,61893,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Rustblood - Cast Lightning Bolt'),
(27717,0,4,0,7,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rustblood - Evade - Unseen'),
(27717,0,5,0,7,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rustblood - Evade - Despawn'),
(27717,0,6,0,6,0,100,0,0,0,0,0,15,12429,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Rustblood - Death - Credit'),
(27717,0,7,0,6,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rustblood  - Death - Unseen'),
(27717,0,8,0,7,0,100,0,0,0,0,0,6,12429,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Rustblood - Evade - Quest Fail'),

-- Horgrenn Hellcleave 27718
(27718,0,0,0,9,0,100,0,0,10,21000,29000,11,16508,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Horgrenn Hellcleave - Cast Intimidating Roar'),
(27718,0,1,0,0,0,100,0,3000,6000,8000,12000,11,15572,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Horgrenn Hellcleave - Cast Sunder Armor'),
(27718,0,2,0,0,0,100,0,9000,12000,12000,16000,11,39171,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Horgrenn Hellcleave - Cast Mortal Strike'),
(27718,0,3,0,0,0,100,0,13000,15000,13000,18000,11,38618,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Horgrenn Hellcleave - Cast Whirlwind'),
(27718,0,4,0,7,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Horgrenn Hellcleave - Evade - Unseen'),
(27718,0,5,0,7,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Horgrenn Hellcleave - Evade - Despawn'),
(27718,0,6,0,6,0,100,0,0,0,0,0,15,12430,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Horgrenn Hellcleave - Death - Credit'),
(27718,0,7,0,6,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Horgrenn Hellcleave - Death - Unseen'),
(27718,0,8,0,7,0,100,0,0,0,0,0,6,12430,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Horgrenn Hellcleave - Evade - Quest Fail'),

-- Conqueror Krenna 27727
(27727,0,0,0,9,0,100,0,0,5,7000,9000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Conqueror Krenna - Cast Cleave'),
(27727,0,1,0,0,0,100,0,9000,12000,12000,17000,11,11430,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Conqueror Krenna - Cast Slam'),
(27727,0,2,0,13,0,100,0,14000,17000,14000,17000,11,12555,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Conqueror Krenna - Cast Pummel'),
(27727,0,3,0,13,0,100,0,3000,6000,6000,11000,11,34719,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Conqueror Krenna - Cast Fixate'),
(27727,0,4,0,54,0,100,0,0,0,0,0,12,27726,3,75000,0,0,0,8,0,0,0,3244.50,-2340.56,92.14,6.27, 'Conqueror Krenna - Summon Gorgonna'),
(27727,0,5,0,54,0,100,0,0,0,0,0,1,0,18000,0,0,0,0,1,0,0,0,0,0,0,0, 'Conqueror Krenna - Summoned - Say 0'),
(27727,0,6,0,52,0,100,0,0,27727,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0, 'Conqueror Krenna - Say 0 - Say 1'),
(27727,0,7,0,1,0,100,1,35000,35000,1,1,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Conqueror Krenna - OOC 35 Sec - Enemy'),
(27727,0,8,0,6,0,100,0,0,0,0,0,15,12431,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Conqueror Krenna - Death - Credit'),
(27727,0,9,0,6,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Conqueror Krenna - Death - Unseen'),
(27727,0,10,0,7,0,100,0,0,0,0,0,6,12431,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Conqueror Krenna - Evade - Quest Fail'),

-- Gorgonna 27726
(27726,0,0,0,1,0,100,1,6000,6000,1,1,1,0,6000,0,0,0,0,1,0,0,0,0,0,0,0,'Gorgonna - OOC 6 Sec - Say 0'),
(27726,0,1,0,52,0,100,0,0,27726,0,0,1,1,18000,0,0,0,0,1,0,0,0,0,0,0,0,'Gorgonna - Say 0 - Say 1'),
(27726,0,2,0,52,0,100,0,1,27726,0,0,1,2,15000,0,0,0,0,1,0,0,0,0,0,0,0,'Gorgonna - Say 1 - Say 2'),
(27726,0,3,0,52,0,100,0,2,27726,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gorgonna - Say 2 - Say 3'),

-- Grennix Shivwiggle 27719
(27719, 0, 0, 0, 19, 0, 100, 0, 12427, 0, 0, 0, 12, 27715, 7, 0, 0, 0, 0, 8, 0, 0, 0, 3242.77, -2340.98, 92.34, 0.98, 'Grennix Shivwiggle - Accepted Quest - Summon 27715'),
(27719, 0, 1, 0, 19, 0, 100, 0, 12428, 0, 0, 0, 12, 27716, 7, 0, 0, 0, 0, 8, 0, 0, 0, 3242.77, -2340.98, 92.34, 0.98, 'Grennix Shivwiggle - Accepted Quest - Summon 27716'),
(27719, 0, 2, 0, 19, 0, 100, 0, 12429, 0, 0, 0, 12, 27717, 7, 0, 0, 0, 0, 8, 0, 0, 0, 3242.77, -2340.98, 92.34, 0.98, 'Grennix Shivwiggle - Accepted Quest - Summon 27717'),
(27719, 0, 3, 0, 19, 0, 100, 0, 12430, 0, 0, 0, 12, 27718, 7, 0, 0, 0, 0, 8, 0, 0, 0, 3242.77, -2340.98, 92.34, 0.98, 'Grennix Shivwiggle - Accepted Quest - Summon 27718'),
(27719, 0, 4, 0, 19, 0, 100, 0, 12431, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grennix Shivwiggle - Accepted Quest - Say 0'),
(27719, 0, 5, 0, 19, 0, 100, 0, 12431, 0, 0, 0, 12, 27727, 7, 0, 0, 0, 0, 8, 0, 0, 0, 3251.91, -2340.61, 91.86, 3.1, 'Grennix Shivwiggle - Accepted Quest - Summon 27727');
UPDATE `smart_scripts` SET `event_flags`=1 WHERE `entryorguid`=7664 AND `source_type`=0 AND `id`IN (3,5,7) AND `link` IN (4,6,8);
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `Id`=8280;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) and `SourceEntry`=8280;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(20, 0, 8280, 0, 0, 8, 0, 8275, 0, 0, 0, 0, 0, '', 'Securing the Supply Lines can be taken if Taking Back Silithus (Alliance) Complete'),
(19, 0, 8280, 0, 0, 8, 0, 8275, 0, 0, 0, 0, 0, '', 'Securing the Supply Lines can be taken if Taking Back Silithus (Alliance) Complete'),
(20, 0, 8280, 0, 1, 8, 0, 8276, 0, 0, 0, 0, 0, '', 'Securing the Supply Lines can be taken if Taking Back Silithus (Horde) Complete'),
(19, 0, 8280, 0, 1, 8, 0, 8276, 0, 0, 0, 0, 0, '', 'Securing the Supply Lines can be taken if Taking Back Silithus (Horde) Complete');
SET @RavenousJaws=29392;

UPDATE `creature_template` SET `ainame`='SmartAI' WHERE `entry`=@RavenousJaws;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=6509;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(17,0,6509,0,0,1,1,47172,0,0,0,0,0,0,'Cast Gore Bladder only if Cosmetic - Underwater Blood (no sound) aura is active');
DELETE FROM `smart_scripts` WHERE `entryorguid`=@RavenousJaws AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@RavenousJaws,0,0,0,0,0,100,0,2000,5000,4000,7000,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ravenous Jaws - In combat - cast Thrash'),
(@RavenousJaws,0,1,0,6,0,100,0,0,0,0,0,11,47172,2,0,0,0,0,1,0,0,0,0,0,0,0,'Ravenous Jaws - On death - cast Underwater Blood'),
(@RavenousJaws,0,2,3,8,0,100,0,6509,0,0,0,28,47172,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ravenous Jaws - On spell hit Gore Bladder - remove aura'),
(@RavenousJaws,0,3,0,61,0,100,0,0,0,0,0,33,29391,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ravenous Jaws - Link previous event - give quest credit');
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` =23162;

DELETE FROM `creature_ai_scripts` WHERE `creature_id` =23162;
DELETE FROM `smart_scripts` WHERE `entryorguid` =23162 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(23162, 0, 0,1,11,0, 100, 0, 0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Vakkiz the Windrager - On Spawn - Say Emote'),
(23162, 0, 1,2,61,0, 100, 0, 0,0,0,0,19,33088,0,0,0,0,0,1,0,0,0,0,0,0,0,'Vakkiz the Windrager - Linked with Previous Event - Set Unit Flags'),
(23162, 0, 2,0,61,0, 100, 0, 0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Vakkiz the Windrager - Linked with Previous Event - Set Phase 1'),
(23162, 0, 3,0, 0,1, 100, 0, 6500,9500,8500,11500,11,40420,0,0,0,0,0,2,0,0,0,0,0,0,0,'Vakkiz the Windrager - IC - Cast Lightning Breath (Phase 1)'),
(23162, 0, 4,5, 2,1, 100, 0, 0,40,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Vakkiz the Windrager - On 40% HP - Say Emote'),
(23162, 0, 5,6,61,1, 100, 0, 0,0,0,0,3,0,21296,0,0,0,0,1,0,0,0,0,0,0,0,'Vakkiz the Windrager - Linked with Previous Event - Change Model'),
(23162, 0, 6,0,61,1, 100, 0, 0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Vakkiz the Windrager - Linked with Previous Event - Set Phase 2'),
(23162, 0, 7,0, 0,2, 100, 0, 3000,7000,5000,9000,11,40419,0,0,0,0,0,1,0,0,0,0,0,0,0,'Vakkiz the Windrager - IC - Cast Bone Spray (Phase 2)'),
(23162, 0, 8,9, 7,0, 100, 0, 0,0,0,0,19,33088,0,0,0,0,0,1,0,0,0,0,0,0,0,'Vakkiz the Windrager - On Evade - Set Unit Flags'),
(23162, 0, 9,10,61,0, 100, 0, 0,0,0,0,3,0,20837,0,0,0,0,1,0,0,0,0,0,0,0,'Vakkiz the Windrager - Linked with Previous Event - Set Model'),
(23162, 0,10,0,61,0, 100, 0, 0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Vakkiz the Windrager - Linked with Previous Event - Set Phase 1');

DELETE FROM `creature_text` WHERE `entry` =23162;
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-234,-235);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(23162, 0, 0, 'Furious winds envelop Vakkiz as he writhes menacingly towards you.', 16, 0, 100, 0, 0, 0, 'Vakkiz the Windrager'),
(23162, 1, 0, '%s''s flesh shatters in an unearthly rage!', 16, 0, 100, 0, 0, 0, 'Vakkiz the Windrager');
SET @DIBear=30292; -- Dead Icemaw Bear
SET @LJBunny=30366; -- Lure Jormuttar Bunny

-- WTF?! Spell Carve Bear Flank have no triggered spell
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=56562;
-- Set Spell script
DELETE FROM `spell_script_names` WHERE `spell_id`=56565;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(56565,'spell_q13011_bear_flank_master');
-- Update Item's Target requirement
UPDATE `conditions` SET `ConditionTypeOrReference`=31 ,`ConditionTarget`=1 ,`ConditionValue1` =3,`ConditionValue2`=@DIBear WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=56562;
-- Update creature_templates to use SAI
UPDATE `creature_template` SET `ainame`='SmartAI' WHERE `entry` IN (@DIBear,@LJBunny);
-- Update Icy Crater phaseMask
UPDATE `gameobject` SET `phaseMask`=4 WHERE `guid`=99730;
-- Add Dead Icemaw Bear SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=30292 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@DIBear,0,0,1,8,0,100,0,56562,0,0,0,11,56565,0,0,0,0,0,7,0,0,0,0,0,0,0,'Dead Icemaw Bear - On Spell Hit - Cast Bear Flank Master'),
(@DIBear,0,1,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dead Icemaw Bear - Link With Previous Event - Despawn'),
(@DIBear,0,2,0,8,0,100,0,56569,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dead Icemaw Bear - On Spell Hit - Despawn');
-- Add Lure Jormuttar Bunny SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=@LJBunny AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@LJBunny,0,0,0,11,0,100,0,0,0,0,0,12,30340,2,120000,0,0,0,1,0,0,0,0,0,0,0,'Lure Jormuttar Bunny - On Spawn - Summon Jormuttar');
-- Add Dead Icemaw Bear creature_text
DELETE FROM `creature_text` WHERE `entry`=30292;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@DIBear,0,0,'This bear\'s flank is frozen solid... try again.',42,0,0,0,0,0,'');
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=29400; -- Corrupted Scarlet Onslaught (EAI)
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=29403; -- Onslaught Gryphon (SAI)
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=30210; -- Hodir's Helm KC Bunny (SAI)
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=30575; -- Frostbrood Destroyer (SAI)
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=30841; -- Death Gate (Mograine) (SAI)
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=30850; -- Death Gate (Munch) (SAI)
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=30852; -- Death Gate (Jayde) (SAI)
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=34885; -- Dame Evniki Kapsalis (SAI)
-- Random comment ™
-- Corrupted Scarlet Onslaught
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=29400;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 29400;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(29400,0,0,0,0,0,100,0,2000,15000,30000,45000,11,38056,2,0,0,0,0,2,0,0,0,0,0,0,0,'Corrupted Scarlet Onslaught - IC - Flesh Rip');

-- Onslaught Raven Bishop
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=29338;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=29338;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29338,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Raven Bishop - Set Phase 1 - On Aggro'),
(29338,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Raven Bishop - Stop Moving - On Aggro'),
(29338,0,2,0,4,1,100,1,0,0,0,0,11,50740,0,0,0,0,0,2,0,0,0,0,0,0,0,'Raven Bishop - Cast bolt on Aggro'),
(29338,0,3,0,9,1,100,0,0,40,3400,4700,11,50740,0,0,0,0,0,2,0,0,0,0,0,0,0,'Raven Bishop -  Cast Raven Flock'),
(29338,0,4,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Raven Bishop - Start Moving - When not in flock Range'),
(29338,0,5,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Raven Bishop - Stop Moving - 15 Yards'),
(29338,0,6,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Raven Bishop - Stop Moving - When in flock Range'),
(29338,0,7,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Raven Bishop - Set Phase 2 - 15% Mana'),
(29338,0,8,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Raven Bishop - Start Moving - 15% Mana'),
(29338,0,9,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Raven Bishop - Set Phase 1 - When Mana is above 30%'),
(29338,0,10,0,2,1,100,0,10,50,2000,8000,11,50750,0,0,0,0,0,2,0,0,0,0,0,0,0,'Raven Bishop - Health Pct - Cast Raven Heal');

-- Onslaught Paladin
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=29329;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 29329;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(29329,0,0,0,4,0,100,0,0,0,0,0,11,19131,2,0,0,0,0,2,0,0,0,0,0,0,0,'Onslaught Paladin - On Aggro - Cast Charge'),
(29329,0,1,0,0,0,100,0,2000,9000,17000,30000,11,32774,2,0,0,0,0,2,0,0,0,0,0,0,0,'Onslaught Paladin  - IC - Avenger''s Shield');

-- Onslaught Harbor Guard
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=29330;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=29330;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29330,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Harbor Guard - Set Phase 1 - On Aggro'),
(29330,0,1,0,4,1,100,1,0,0,0,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Harbor Guard - Cast Shoot - On Aggro'),
(29330,0,2,0,9,1,100,0,0,40,3400,4700,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Harbor Guard -  Cast Shoot'),
(29330,0,3,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Harbor Guard - Start Moving - When not in Shoot range'),
(29330,0,4,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Harbor Guard - Stop Moving - 15 Yards'),
(29330,0,5,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Harbor Guard - Stop Moving - When in bolt Range'),
(29330,0,6,0,0,1,100,0,8000,8000,12000,14000,11,50750,0,0,0,0,0,1,0,0,0,0,0,0,0,'Harbor Guard - IC - Cast Frost Shot');
UPDATE `creature_template` SET `ScriptName`='npc_pet_dk_ebon_gargoyle' WHERE `ScriptName`='npc_ebon_gargoyle';
UPDATE `creature_template` SET `ScriptName`='npc_pet_hunter_snake_trap' WHERE `ScriptName`='npc_snake_trap_serpents';
UPDATE `creature_template` SET `ScriptName`='npc_pet_mage_mirror_image' WHERE `ScriptName`='npc_mirror_image';
UPDATE `creature_template` SET `ScriptName`='npc_pet_pri_lightwell' WHERE `ScriptName`='npc_lightwell';
UPDATE `creature_template` SET `ScriptName`='npc_pet_pri_shadowfiend' WHERE `ScriptName`='npc_shadowfiend';
UPDATE `creature_template` SET `ScriptName`='npc_pet_shaman_earth_elemental' WHERE `ScriptName`='npc_earth_elemental';
UPDATE `creature_template` SET `ScriptName`='npc_pet_shaman_fire_elemental' WHERE `ScriptName`='npc_fire_elemental';
-- Change SpellFocus GO radius to 100y
UPDATE `gameobject_template` SET `data1`=100 WHERE `entry`=300209;
-- Archmage Pentarus SAI
SET @ENTRY := 28160; -- NPC entry
SET @SPELL := 50859;  -- Flight to Sholazar
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@ENTRY*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,10024,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Archmage Pentarus - On gossip option select  - run script'),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,11,@SPELL,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Archmage Pentarus - Script - Cast Flight to Sholazar on player'),
(@ENTRY*100,9,1,0,0,0,100,0,1000,1000,1000,1000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Archmage Pentarus - Script - say 0');
-- NPC talk text insert from sniff
DELETE FROM `creature_text` WHERE `entry`=28160 AND `groupid`=0;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(28160,0,0, 'I''ll send you on my flying machine. Keep your eyes peeled for clues about what might''ve happened to Hemet!',12,0,100,25,0,0, 'Archmage Pentarus');
-- Gossip conditions for Archmage Pentarus
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=10024;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,10024,0,0,28,12521,0,0,0,'','Show gossip option if player has quest Where in the World is Hemet Nesingwary?');
DELETE FROM `gossip_menu_option` WHERE `menu_id`=10024 AND `id`=1;

-- Add spell target position
DELETE FROM `spell_target_position` WHERE `id`=50987;
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(50987,571,5071.35,4642.54,72.164,0.878587);

-- Update Archmage Pentarus' Flying Machine
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=28192;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (16977,16978);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (16977,16978); -- clean old EAI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (16977, 16978) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(16977,0,0,0,25,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arch Mage Xintor - prevent combat movement on spawn'),
(16977,0,1,0,4,0,100,0,0,0,0,0,11,20823,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Arch Mage Xintor - cast fireball on aggro'),
(16977,0,2,0,4,0,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arch Mage Xintor - set phase 1 on aggro'),
(16977,0,3,0,9,1,100,0,0,40,2400,3800,11,20823,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Arch Mage Xintor - cast fireball'),
(16977,0,4,0,3,1,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arch Mage Xintor - start normal attack on 15% mana'),
(16977,0,5,0,3,1,100,0,0,15,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arch Mage Xintor - set phase 2 on 15% mana'),
(16977,0,6,0,9,1,100,0,35,80,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arch Mage Xintor - combatmovement'),
(16977,0,7,0,9,1,100,0,5,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arch Mage Xintor - combatmovement'),
(16977,0,8,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arch Mage Xintor - combatmovement'),
(16977,0,9,0,3,1,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arch Mage Xintor - set phase 1 on 30% mana'),
(16977,0,10,0,0,1,50,0,6000,8000,9000,12000,11,15735,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Arch Mage Xintor - cast arcane missles'),
(16977,0,11,0,2,0,100,0,0,50,0,0,11,33245,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arch Mage Xintor - 50% hp - cast ice barrier'),
(16977,0,12,0,2,0,100,0,0,50,0,0,11,29458,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Arch Mage Xintor - 50% hp - cast blizzard'),
(16977,0,13,0,2,0,100,0,0,15,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Arch Mage Xintor - flee on 15% hp'),
(16977,0,14,0,7,0,100,0,0,0,0,0,22,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Arch Mage Xintor - set phase 0 on evade'),
(16978,0,0,0,0,0,50,0,4000,4000,8000,8000,11,8242,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Lieutenant Commander Thalvos - Cast Shield Slam'),
(16978,0,1,0,0,0,50,0,5000,5000,10000,10000,11,20823,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Lieutenant Commander Thalvos - Cast Strike'),
(16978,0,2,0,25,0,100,0,0,0,0,0,11,27978,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lieutenant Commander Thalvos - Shroud of Death');
DELETE FROM `disables` WHERE `sourceType`=0 AND `entry` IN (38729,38736);
INSERT INTO `disables`(`sourceType`,`entry`,`flags`,`comment`) VALUES
(0,38729,64,'Ignore LOS on Rod of Purification'),
(0,38736,64,'Ignore LOS on Rod of Purification');
UPDATE `creature_ai_scripts` SET `action1_param1`=`action1_param1` + 1 WHERE `action1_type`=17;
UPDATE `creature_ai_scripts` SET `action2_param1`=`action2_param1` + 1 WHERE `action2_type`=17;
UPDATE `creature_ai_scripts` SET `action3_param1`=`action3_param1` + 1 WHERE `action3_type`=17;
UPDATE `creature_ai_scripts` SET `action1_param1`=25 WHERE `id`=1531201;
UPDATE `creature_template` SET `AIName` = 'NullAI' WHERE `entry` = 27490;
UPDATE `creature_template` SET `unit_flags` = 64 WHERE `entry` = 31339;
UPDATE `creature_template` SET `ScriptName` = '', AIName = 'SmartAI' WHERE `entry` = 26638;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 26638 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(26638, 0, 1, 0, 0, 0, 100, 6, 0, 0, 0, 0, 43, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Risen Drakkari Bat Rider - In Combat - Dismount"),
(26638, 0, 2, 0, 0, 0, 100, 6, 0, 0, 0, 0, 19, 0x02000000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Risen Drakkari Bat Rider - In Combat - Remove flag"),
(26638, 0, 3, 0, 9, 0, 100, 6, 5, 30, 9000, 12000, 11, 16001, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, "Risen Drakkari Bat Rider - At 5 - 30 Range - Cast Impale"),
(26638, 0, 4, 0, 0, 0, 100, 2, 3000, 6000, 9000, 12000, 11, 50414, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Risen Drakkari Bat Rider - In Combat - Cast Curse of Blood"),
(26638, 0, 5, 0, 0, 0, 100, 4, 3000, 6000, 9000, 12000, 11, 59009, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Risen Drakkari Bat Rider - In Combat - Cast Curse of Blood");

DELETE FROM `creature_addon` WHERE `guid` = 127448;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(127448, 0, 26751, 0, 1, 0, '');
DELETE FROM `spell_target_position` WHERE `id`=50859;
DELETE FROM `spell_target_position` WHERE `id`=50987;
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(50987,571,5832.892,482.8708,658.2753,0.9121326);
SET @NPC := 7271;
-- Move boss_zum_rah from SAI to CPP
UPDATE `creature_template` SET `AIName`= '', `ScriptName`= 'boss_zum_rah' WHERE `entry`=@NPC;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC;
DELETE FROM `creature_text` WHERE `entry` =@NPC;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@NPC, 0, 0, 'How dare you enter my sanctum!', 12, 0, 100, 0, 0, 0, 'Witch Doctor Zum''rah'),
(@NPC, 1, 1, 'T''eif godehsi wha!', 14, 14, 100, 0, 0, 0, 'Witch Doctor Zum''rah'),
(@NPC, 2, 2, 'Sands consume you!', 14, 0, 100, 0, 0, 0, 'Witch Doctor Zum''rah'),
(@NPC, 2, 3, 'Fall!', 14, 0, 100, 0, 0, 0, 'Witch Doctor Zum''rah');
DELETE FROM `spell_script_names` WHERE `spell_id`=66545;
INSERT INTO `spell_script_names` (`spell_id` ,`ScriptName`) VALUES
(66545, 'spell_paletress_summon_memory');
UPDATE `creature_ai_scripts` SET `action1_param1`=15 WHERE `id`=1730003; -- Call For Help radius from 0 to 15
UPDATE `creature_ai_scripts` SET `action1_type`=`action2_type`,`action2_type`=0,`action1_param1`=`action2_param1`,`action2_param1`=0 WHERE `id` IN (1772701,3547605); -- Action type gap
UPDATE `creature_ai_scripts` SET `action1_param1`=10255 WHERE `id`=1688002; -- Wrong quest credit (used npc id, should use quest id), fixes quest Testing the Antidote (or at least it should)
DELETE FROM `spell_script_names` WHERE `spell_id`=-19572;
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES
(-19572,'spell_hun_improved_mend_pet');

UPDATE `spell_proc_event` SET `procFlags`=0x40000 WHERE `entry` = -19572;
SET @ENTRY := 16880;

UPDATE `quest_template` SET `RequiredSpellCast1`=0 WHERE `Id`=10255;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;

DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 4, 0, 100, 1, 0, 0, 0, 0, 11, 33909, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hulking Helboar - On Aggro - Cast Hulk'),
(@ENTRY, 0, 1, 0, 8, 0, 100, 1, 34665, 0, 0, 0, 33, 16992, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Hulking Helboar - On Spellhit Administer Antidote - Quest Credit');
DELETE FROM `spell_proc_event` WHERE `entry`=56817;
INSERT INTO `spell_proc_event` (`entry`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`) VALUES
(56817, 15, 0x0, 0x20000000, 0x0);
SET @FrostLotus := 12009; 

DELETE FROM `reference_loot_template` WHERE `entry` = @FrostLotus;
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@FrostLotus,36908,100,1,0,1,1); -- Frost Lotus (trick)

DELETE FROM `gameobject_loot_template` WHERE `entry` IN (1414,1415,1416,1417,1418,1419,1420,1421,1424,1730,1731,1423,1732,1733,1734,2292,2512,2511,2513,2514,2515,2516,6142,6150,6151,6152,6312,6313,13945,13946,13947,13948,13949,13950,13965,13966,13967,13968,13969,13970,17201,17200,17204,17202,17203,18009,18111,18112,18113,18114,18115,18116,18117,18118,18119,19627,19628,19629,19630,22071,24093,24224,24225,24226,24227,25094,25096,25095,24228,25093,25089,34868);
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
-- -------------------
-- -- Classic Zones -- 
-- -------------------
-- Peacebloom
(1415,2447,100,1,0,1,3), -- Peacebloom
(2512,2447,100,1,0,2,2), -- Peacebloom
-- Silverleaf
(1414, 765,100,1,0,1,3), -- Silverleaf
(1414,5056,-40,1,0,1,1), -- Root Sample (Quest Item)
(2511,765,100,1,0,2,2), -- Silverleaf
-- Earthroot
(1416,2449,100,1,0,1,3), -- Earthroot
(2513,2449,100,1,0,2,2), -- Earthroot
-- Mageroyal
(1417,785,100,1,0,1,3), -- Mageroyal
(1417,2452,20,1,0,1,2), -- Swiftthistle
(2514,785,100,1,0,2,2), -- Mageroyal
-- Briarthorn
(1418,2450,100,1,0,1,3), -- Briarthorn
(1418,2452,40,1,0,1,2), -- Swiftthistle
(2515,2450,100,1,0,2,2), -- Briarthorn
-- Bruiseweed
(1419,2453,100,1,0,1,3), -- Bruiseweed
(2516,2453,100,1,0,2,2), -- Bruiseweed
-- Strangekelp
(1733,3820,100,1,0,1,3), -- Strangekelp
-- Grave Moss
(1424,3369,100,1,0,1,3), -- Grave Moss
-- Wild Steelbloom
(1420,3355,100,1,0,1,3), -- Wild Steelbloom
-- Kingsblood
(1421,3356,100,1,0,1,3), -- Kingsblood
-- Liferoot
(1730,3357,100,1,0,1,3), -- Liferoot
-- Fadeleaf
(1731,3818,100,1,0,1,3), -- Fadeleaf
-- Goldthorn
(1734,3821,100,1,0,1,3), -- Goldthorn
-- Khadgar's Whisker
(1423,3358,100,1,0,1,3), -- Khadgar's Whisker
-- Dragon's Teeth (WINTERSBITE rename only, ids are same) 
(1732,3819,100,1,0,1,3), -- Dragon's Teeth
-- Firebloom
(2292,4625,100,1,0,1,3), -- Firebloom
-- Purple Lotus
(6142,8831,100,1,0,1,3), -- Purple Lotus
(6142,8153, 10,1,0,1,1), -- Wildvine
-- Arthas' Tears
(6150,8836,100,1,0,1,3), -- Arthas' Tears
-- Sungrass
(6151,8838,100,1,0,1,3), -- Sungrass
-- Blindweed
(6152,8839,100,1,0,1,3), -- Blindweed
-- Ghost Mushroom
(6312,8845,100,1,0,1,3), -- Ghost Mushroom
-- Gromsblood
(6313,8846,100,1,0,1,3), -- Gromsblood (Default)
-- Golden Sansam
(13945,13464,100,1,0,1,3), -- Golden Sansam (Default)
-- Dreamfoil
(13946,13463,100,1,0,1,3), -- Dreamfoil (Default)
-- Mountain Silversage
(13947,13465,100,1,0,1,3), -- Mountain Silversage (Default)
-- Sorrowmoss (Plaguebloom)
(13948,13466,100,1,0,1,3), -- Sorrowmoss
-- Black Lotus
(13950,13468,100,1,0,1,3), -- Black Lotus
-- Icecap
(13949,13467,100,1,0,1,3), -- Icecap
-- -------------------------
-- -- The Burning Crusade -- 
-- -------------------------
-- Bloodthistle
(18009,22710,100,1,0,1,3), -- Bloodthistle
-- Felweed
(18111,22785,100,1,0,1,3), -- Felweed
(18111,22575, 15,1,0,1,2), -- Mote of life
(18111,22794,  2,1,0,1,1), -- Fel Lotus
-- Dreaming Glory
(18112,22786,100,1,0,1,3), -- Dreaming Glory
(18112,22575, 15,1,0,1,3), -- Mote of life
(18112,22794,  2,1,0,1,1), -- Fel Lotus
-- Ragveil
(18113,22787,100,1,0,1,3), -- Ragveil
(18113,22575, 15,1,0,1,3), -- Mote of life
(18113,22794,  2,1,0,1,1), -- Fel Lotus
-- Flame Cap
(18114,22788,100,1,0,1,3), -- Flame Cap
(18114,22794,  2,1,0,1,1), -- Fel Lotus
(18114,35229,-25,1,0,1,1), -- Nether Residue (Questitem)
-- Terocone
(18115,22789,100,1,0,1,3), -- Terocone
(18115,22575, 15,1,0,1,3), -- Mote of life
(18115,22794,  3,1,0,1,1), -- Fel Lotus
(18115,35229,-25,1,0,1,1), -- Nether Residue (Questitem)
-- Ancient Lichen
(18116,22790,100,1,0,1,3), -- Ancient Lichen
(18116,22794,  2,1,0,1,1), -- Fel Lotus
(18116,35229,-25,1,0,1,1), -- Nether Residue (Questitem)
-- Netherbloom
(18117,22791,100,1,0,1,3), -- Netherbloom
(18117,22576, 15,1,0,1,3), -- Mote of mana
(18117,22794,  3,1,0,1,1), -- Fel Lotus
(18117,35229,-25,1,0,1,1), -- Nether Residue (Questitem)
-- Nightmare Vine
(18118,22792,100,1,0,1,3), -- Nightmare Vine
(18118,22575, 10,1,0,1,3), -- Nightmare Seed
(18118,22794,  3,1,0,1,1), -- Fel Lotus
(18118,35229,-25,1,0,1,1), -- Nether Residue (Questitem)
-- Mana Thistle
(18119,22793,100,1,0,1,3), -- Mana Thistle
(18119,22575, 15,1,0,1,3), -- Mote of life
(18119,22794,  3,1,0,1,1), -- Fel Lotus
(18119,35229,-25,1,0,1,1), -- Nether Residue (Questitem)
-- Netherdust Bush
(22071,32468,100,1,0,1,3), -- Netherdust Pollen
(22071,22576,15,1,0,1,3), -- Mote of Mana
(22071,22794,  2,1,0,1,1), -- Fel Lotus
(22071,32506,  1,1,0,1,1), -- Netherwing Egg
-- ----------------------------------
-- -- Wrath of the Lich King Zones -- 
-- ----------------------------------
-- Goldclover
(24093,36901,100,1,0,1,3), -- GoldClover
(24093,37921, 35,1,0,1,3), -- Deadnettle
(24093,37704, 20,1,0,1,3), -- Crystallized Life
(24093,36908,  5,1,0,1,1), -- Frost Lotus
-- Firethorn
(25089,39969,50,1,1,2,3), -- Fire Seed
(25089,39970,50,1,1,2,3), -- Fire Leaf 
(25089,37704,25,1,0,1,3), -- Crystallized Life
(25089,36908, 5,1,0,1,1), -- Frost Lotus
-- Tiger Lily
(24224,36904,100,1,0,1,3), -- Tiger Lily
(24224,37921, 35,1,0,1,3), -- Deadnettle
(24224,37704, 20,1,0,1,3), -- Crystallized Life
(24224,36908,  5,1,0,1,1), -- Frost Lotus
-- Talandra's Rose
(24225,36907,100,1,0,1,3), -- Talandra's 
(24225,37921, 35,1,0,1,3), -- Deadnettle
(24225,37704, 20,1,0,1,3), -- Crystallized Life
(24225,36908,  5,1,0,1,1), -- Frost LotusRose
-- Frozen Herb
-- Dragonblight
(25094,36901,60,1,1,1,3), -- Goldclover
(25094,36904,20,1,1,1,3), -- Tiger Lily
(25094,36907,20,1,1,1,3), -- Talandra's Rose
-- Zul Drak & Wintergrasp
(25095,36901,60,1,1,1,4), -- Goldclover
(25095,36904,20,1,1,1,4), -- Tiger Lily
(25095,36907,20,1,1,1,4), -- Talandra's Rose
-- The Nexus
(25096,36901,60,1,1,2,6), -- Goldclover
(25096,36904,20,1,1,2,6), -- Tiger Lily
(25096,36907,20,1,1,2,6), -- Talandra's Rose
-- Adder's Tongue
(25093,36903,100,1,0,1,3), -- Adder's Tongue
(25093,37704, 25,1,0,1,3), -- Crystallized Life
(25093,36908,  5,1,0,1,1), -- Frost Lotus
-- Lichbloom
(24226,36905,100,1,0,1,3), -- Lichbloom
(24226,37704, 25,1,0,1,3), -- Crystallized Life
(24226,36908,  5,1,0,1,1), -- Frost Lotus
-- Icethorn
(24227,36906,100,1,0,1,3), -- Icethorn
(24227,37704, 25,1,0,1,3), -- Crystallized Life
(24227,36908,  5,1,0,1,3), -- Frost Lotus
-- Frost Lotus
(24228,36908,95,1,1,1,1), -- Frost Lotus (95% for 1)
(24228,1, 5,1,1,-@FrostLotus,1), -- Frost Lotus (5% for 2)
(24228,37921, 35,1,0,1,3), -- Deadnettle
(24228,37704, 25,1,0,1,3), -- Crystallized Life
-- --------------------------------
-- -- Felwood Fel Creep Specials --
-- --------------------------------
-- Sungrass
(13965, 8838,100,1,0,1,3), -- Sungrass
(13965,11514, 50,1,0,1,2), -- Fel Creep
-- Gromsblood
(13966, 8846,100,1,0,1,3), -- Gromsblood
(13966,11514, 50,1,0,1,2), -- Fel Creep
-- Golden Sansam
(13967,13464,100,1,0,1,3), -- Golden Sansam
(13967,11514, 50,1,0,1,2), -- Fel Creep
-- Dreamfoil
(13968,13463,100,1,0,1,3), -- Dreamfoil
(13968,11514, 50,1,0,1,2), -- Fel Creep
-- Mountain Silversage
(13969,13465,100,1,0,1,3), -- Mountain Silversage
(13969,11514, 10,1,0,1,2), -- Fel Creep
-- Arthas'Tears
(13970, 8836,100,1,0,1,3), -- Arthas' Tears
(13970,11514, 50,1,0,1,3), -- Fel Creep
-- ----------------------------------
-- -- Zul Gurub Bloodvine Specials --
-- ----------------------------------
-- Purple Lotus
(17200,8831,100,1,0,1,3), -- Purple Lotus
(17200, 8153, 10,1,0,1,1), -- Wildvine
(17200,19726,15,1,0,1,3), -- Bloodvine
-- Sungrass
(17201,8838,100,1,0,1,3), -- Sungrass
(17201,19726,15,1,0,1,3), -- Bloodvine
-- Golden Sansam
(17202,13464,100,1,0,1,3), -- Golden Sansam
(17202,19726, 15,1,0,1,3), -- Bloodvine
-- Dreamfoil
(17203,13463,100,1,0,1,3), -- Dreamfoil
(17203,19726, 15,1,0,1,3), -- Bloodvine
-- Mountain Silversage
(17204,13465,100,1,0,1,3), -- Mountain Silversage
(17204,19726, 15,1,0,1,3), -- Bloodvine
-- --------------------------
-- -- Zangermarsh Specials -- 
-- --------------------------
-- Ragveil
(19627,22787,100,1,0,1,3), -- Ragveil
(19627,22575, 15,1,0,1,3), -- Mote of life
(19627,22794,  2,1,0,1,1), -- Fel Lotus
(19627,24401, 10,1,0,1,3), -- Unidentified Plant Parts
-- Felweed
(19628,22785,100,1,0,1,3), -- Felweed
(19628,22575, 15,1,0,1,2), -- Mote of life
(19628,22794,  2,1,0,1,1), -- Fel Lotus
(19628,24401, 10,1,0,1,3), -- Unidentified Plant Parts
-- Dreaming Glory
(19629,22786,100,1,0,1,3), -- Dreaming Glory
(19629,22575, 15,1,0,1,3), -- Mote of life
(19629,22794,  2,1,0,1,1), -- Fel Lotus
(19629,24401, 10,1,0,1,3), -- Unidentified Plant Parts
-- Blindweed (Zangermarsh)
(19630, 8839,100,1,0,1,3), -- Blindweed
(19630,24401, 10,1,0,1,3); -- Unidentified Plant Parts

-- Cleanups
DELETE FROM `reference_loot_template` WHERE `entry` IN (12010,12011,12012,12013,12014,12015,12016,12017); 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 4 AND `SourceGroup` IN (6150,6313,13948) AND `SourceEntry`=11514;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=10 AND `SourceGroup` IN (12010,12012,12013,12014) AND `SourceEntry`=11514;
SET @OGUID          := 76803;

DELETE FROM `gameobject` WHERE `id` IN (188539,190353);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
 -- Coldwind Tree
(@OGUID,    188539, 571, 1, 1, 4845.311, 722.2529, 169.1704, 5.585054, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+1,  188539, 571, 1, 1, 4845.701, 676.941, 164.153, 1.780234, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+2,  188539, 571, 1, 1, 4822.568, 667.1375, 166.1218, 5.235988, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+3,  188539, 571, 1, 1, 4839.788, 809.9525, 162.1743, 4.450591, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+4,  188539, 571, 1, 1, 4891.104, 799.2133, 168.9825, 4.76475, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+5,  188539, 571, 1, 1, 4809.472, 874.1573, 163.8867, 6.19592, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+6,  188539, 571, 1, 1, 4896.817, 854.5087, 175.6376, 5.881761, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+7,  188539, 571, 1, 1, 4871.93, 718.883, 165.3885, 1.518436, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+8,  188539, 571, 1, 1, 4890.049, 970.9612, 209.2152, 3.787367, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+9,  188539, 571, 1, 1, 4945.856, 839.2049, 190.6546, 3.490667, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+10, 188539, 571, 1, 1, 4819.289, 791.7388, 166.832, 4.537859, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+11, 188539, 571, 1, 1, 4928.494, 726.8925, 178.0483, 2.722713, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+12, 188539, 571, 1, 1, 4822.72, 801.2385, 166.1128, 5.98648, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+13, 188539, 571, 1, 1, 4890.223, 789.971, 166.3956, 5.445428, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+14, 188539, 571, 1, 1, 4878.446, 770.7858, 163.0117, 5.183629, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+15, 188539, 571, 1, 1, 4893.438, 709.8468, 164.7574, 5.811947, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+16, 188539, 571, 1, 1, 4938.004, 853.88, 188.1079, 4.049168, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+17, 188539, 571, 1, 1, 4928.94, 976.3659, 213.8083, 3.455756, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+18, 188539, 571, 1, 1, 4902.952, 997.422, 217.0715, 4.171338, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+19, 188539, 571, 1, 1, 4909.807, 998.5203, 217.5305, 4.625124, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+20, 188539, 571, 1, 1, 4900.104, 1009.844, 221.0865, 1.710422, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+21, 188539, 571, 1, 1, 5122.282, 1034.124, 227.2998, 2.303831, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+22, 188539, 571, 1, 1, 5135.159, 1036.437, 225.7432, 5.340709, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+23, 188539, 571, 1, 1, 5122.978, 1091.059, 226.1329, 1.989672, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+24, 188539, 571, 1, 1, 5113.761, 1088.344, 227.6372, 3.752462, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+25, 188539, 571, 1, 1, 5107.944, 1096.339, 225.5093, 3.665196, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+26, 188539, 571, 1, 1, 5152.663, 1080.674, 223.8049, 5.026549, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+27, 188539, 571, 1, 1, 5189.047, 1086.043, 220.8354, 4.223697, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+28, 188539, 571, 1, 1, 5179.044, 1072.715, 221.8447, 3.351047, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+29, 188539, 571, 1, 1, 5222.162, 1092.083, 219.5214, 3.909541, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+30, 188539, 571, 1, 1, 5251.857, 1078.996, 220.9522, 0.087266, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+31, 188539, 571, 1, 1, 4842.251, 665.0809, 163.0047, 2.600535, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+32, 188539, 571, 1, 1, 4850.285, 659.3837, 162.0293, 2.583081, 0, 0, 0, 1, 120, 255, 1),
-- Poster Knife
(@OGUID+33, 190353, 571, 1, 1, 4845.379, 722.2457, 169.3926, 2.548179, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+34, 190353, 571, 1, 1, 4822.594, 667.0778, 166.3232, 2.18166, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+35, 190353, 571, 1, 1, 4819.184, 791.6855, 167.0265, 0.9424766, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+36, 190353, 571, 1, 1, 4822.843, 801.2508, 166.3003, 2.932139, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+37, 190353, 571, 1, 1, 4878.438, 770.6991, 163.227, 1.623156, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+38, 190353, 571, 1, 1, 4891.163, 799.1904, 169.2256, 2.129301, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+39, 190353, 571, 1, 1, 4809.532, 874.2202, 164.0672, 3.38594, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+40, 190353, 571, 1, 1, 4896.821, 854.4781, 175.846, 2.286379, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+41, 190353, 571, 1, 1, 4872.037, 718.7377, 165.5899, 1.902409, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+42, 190353, 571, 1, 1, 4890.018, 970.9833, 209.4513, 0, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+43, 190353, 571, 1, 1, 4839.718, 809.8333, 162.3687, 1.221729, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+44, 190353, 571, 1, 1, 4928.391, 726.8994, 178.2229, 5.969027, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+45, 190353, 571, 1, 1, 4893.49, 709.8345, 164.9516, 2.687807, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+46, 190353, 571, 1, 1, 4890.262, 789.9007, 166.38, 1.902409, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+47, 190353, 571, 1, 1, 4937.972, 853.8556, 188.2954, 1.204277, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+48, 190353, 571, 1, 1, 4928.847, 976.4125, 213.9889, 0, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+49, 190353, 571, 1, 1, 4902.885, 997.4144, 217.2868, 0.8377575, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+50, 190353, 571, 1, 1, 4909.735, 998.4642, 217.7249, 1.291542, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+51, 190353, 571, 1, 1, 4900.08, 1009.665, 221.2879, 1.553341, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+52, 190353, 571, 1, 1, 5122.176, 1034.082, 227.4803, 0, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+54, 190353, 571, 1, 1, 5135.044, 1036.4, 225.8995, 0, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+55, 190353, 571, 1, 1, 5122.983, 1091.042, 226.3065, 1.605702, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+56, 190353, 571, 1, 1, 5113.695, 1088.284, 227.8359, 0.7155849, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+57, 190353, 571, 1, 1, 5107.816, 1096.331, 225.7246, 0.3316107, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+58, 190353, 571, 1, 1, 5152.607, 1080.622, 224.0202, 1.850049, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+59, 190353, 571, 1, 1, 5189.124, 1085.911, 221.0087, 1.274088, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+60, 190353, 571, 1, 1, 5179.001, 1072.72, 222.0274, 0, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+61, 190353, 571, 1, 1, 5222.177, 1092.026, 219.7277, 1.274088, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+62, 190353, 571, 1, 1, 5251.752, 1079.047, 221.1224, 0, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+63, 190353, 571, 1, 1, 4945.764, 839.31, 190.6546, 0, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+64, 190353, 571, 1, 1, 4845.712, 676.88, 164.3336, 1.692969, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+65, 190353, 571, 1, 1, 4842.208, 665.113, 163.1968, 5.742135, 0, 0, 0, 1, 120, 255, 1),
(@OGUID+66, 190353, 571, 1, 1, 4850.357, 659.3613, 162.2515, 2.565632, 0, 0, 0, 1, 120, 255, 1);
SET @ThoriumGems := 12900;
SET @FelIronGems := 12901;
SET @RareGems := 12902;
SET @EpicGems := 12903;
SET @AdamantiteGems := 12904;
SET @WotlkGreenGems := 12905;
SET @WotlkBlueGems := 12906;

DELETE FROM `reference_loot_template` WHERE `entry` IN (@ThoriumGems,@FelIronGems,@RareGems,@AdamantiteGems,@WotlkGreenGems,@WotlkBlueGems);
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
-- ThoriumGems
(@ThoriumGems,12363,40,1,1,1,1), -- Arcane Crystal
(@ThoriumGems, 7910,12,1,1,1,1), -- Star Ruby
(@ThoriumGems,12800,12,1,1,1,1), -- Azerothian Diamond
(@ThoriumGems,12361,12,1,1,1,1), -- Blue Sapphire
(@ThoriumGems,12364,12,1,1,1,1), -- Huge Emerald
(@ThoriumGems,12799,12,1,1,1,1), -- Large Opal
-- Fel Iron Gems
(@FelIronGems,23112,0,1,1,1,1), -- Golden Draenite
(@FelIronGems,23077,0,1,1,1,1), -- Blood Garnet
(@FelIronGems,21929,0,1,1,1,1), -- Flame Spessarite
(@FelIronGems,23079,0,1,1,1,1), -- Deep Peridot
(@FelIronGems,23107,0,1,1,1,1), -- Shadow Draenite
(@FelIronGems,23117,0,1,1,1,1), -- Azure Moonstone
-- Rare Gems
(@RareGems,23437,0,1,1,1,1), -- Talasite
(@RareGems,23439,0,1,1,1,1), -- Noble Topaz
(@RareGems,23440,0,1,1,1,1), -- Dawnstone
(@RareGems,23436,0,1,1,1,1), -- Living Ruby
(@RareGems,23441,0,1,1,1,1), -- Nightseye
(@RareGems,23438,0,1,1,1,1), -- Star of Elune
-- Epic Gems
(@EpicGems,32227,0,1,1,1,2), -- Crimson Spinel
(@EpicGems,32228,0,1,1,1,2), -- Empyrean Sapphire
(@EpicGems,32229,0,1,1,1,2), -- Lionseye
(@EpicGems,32230,0,1,1,1,2), -- Shadowsong Amethyst
(@EpicGems,32231,0,1,1,1,2), -- Pyrestone
(@EpicGems,32249,0,1,1,1,2), -- Seaspray Emerald
-- Adamantite Gems
(@AdamantiteGems,23112,0,1,1,1,2), -- Golden Draenite
(@AdamantiteGems,23077,0,1,1,1,2), -- Blood Garnet
(@AdamantiteGems,21929,0,1,1,1,2), -- Flame Spessarite
(@AdamantiteGems,23079,0,1,1,1,2), -- Deep Peridot
(@AdamantiteGems,23107,0,1,1,1,2), -- Shadow Draenite
(@AdamantiteGems,23117,0,1,1,1,2), -- Azure Moonstone
-- WOTLK Green Gems
(@WotlkGreenGems,36917,0,1,1,1,1), -- Bloodstone
(@WotlkGreenGems,36920,0,1,1,1,1), -- Sun Crystal
(@WotlkGreenGems,36923,0,1,1,1,1), -- Chalcedony
(@WotlkGreenGems,36926,0,1,1,1,1), -- Shadow Crystal
(@WotlkGreenGems,36929,0,1,1,1,1), -- Huge Citrine
(@WotlkGreenGems,36932,0,1,1,1,1), -- Dark Jade
-- WOTLK Blue Gems
(@WotlkBlueGems,36918,0,1,1,1,1), -- Scarlet Ruby
(@WotlkBlueGems,36921,0,1,1,1,1), -- Autumn's Glow
(@WotlkBlueGems,36924,0,1,1,1,1), -- Sky Sapphire
(@WotlkBlueGems,36927,0,1,1,1,1), -- Twilight Opal
(@WotlkBlueGems,36930,0,1,1,1,1), -- Monarch Topaz
(@WotlkBlueGems,36933,0,1,1,1,1); -- Forest Emerald
-- --------------------------------------------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------
-- -- CLASSIC ZONES --
-- -------------------
SET @Copper := 1502;
SET @Tin := 1503;
SET @Silver := 1504;
SET @Iron := 1505;
SET @Gold :=1506;
SET @Mithril :=1742;
SET @Truesilver := 5045;
SET @DarkIron := 11213;
SET @SmallThorium := 9597;
SET @RichThorium := 12883;
SET @Incendicite := 1409; -- (OR 29574??) 
SET @Indurium := 3266; 

DELETE FROM `gameobject_loot_template` WHERE `entry` IN (@Copper,@Tin,@Silver,@Iron,@Gold,@Mithril,@Truesilver,@DarkIron,@SmallThorium,@RichThorium,17938,13960,17241,@Incendicite,@Indurium);
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
-- Copper Vein
(@Copper,2770,100,1,0,1,9), -- Copper Ore
(@Copper,2835, 25,1,0,1,11), -- Rough Stone
(@Copper,774 ,5,1,1,1,1), -- Malachite
(@Copper,1210,5,1,1,1,1), -- Shadowgem
(@Copper,818 ,5,1,1,1,1), -- Tigerseye
(@Copper,22634,-100,1,0,1,2), -- Underlight Ore (only on quest)
-- Tin Vein
(@Tin,2771,100,1,0,1,9), -- Tin Ore
(@Tin,2836,25,1,0,1,13), -- Coarse Stone
(@Tin,1206,5,1,1,1,1), -- Moss Agate
(@Tin,1705,5,1,1,1,1), -- Lesser Moonstone
(@Tin,1210,5,1,1,1,1), -- Shadowgem
(@Tin,1529,5,1,1,1,1), -- Jade
(@Tin,2798,-100,1,0,1,2), -- Rethban Ore (only on quest)
(@Tin,22634,-100,1,0,1,2), -- Underlight Ore (only on quest)
-- Silver Vein & Ooze Covered Silver Vein
(@Silver,2775,100,1,0,2,4), -- Silver Ore
(@Silver,1206,5,1,1,1,1), -- Moss Agate
(@Silver,1705,5,1,1,1,1), -- Lesser Moonstone
(@Silver,1210,5,1,1,1,1), -- Shadowgem
-- Iron Deposit
(@Iron,2772,100,1,0,2,4), -- Iron Ore
(@Iron,2838,100,1,0,1,5), -- Heavy Stone
(@Iron,1529,5,1,1,1,1), -- Jade
(@Iron,3864,5,1,1,1,1), -- Citrine
(@Iron,1705,5,1,1,1,1), -- Lesser Moonstone
(@Iron,7909,5,1,1,1,1), -- Aquamarine
-- Gold Vein & Ooze Covered Gold Vein
(@Gold,2776,100,1,0,2,4), -- Gold Ore
(@Gold,3864,5,1,1,1,1), -- Citrine
(@Gold,1705,5,1,1,1,1), -- Lesser Moonstone
(@Gold,7909,5,1,1,1,1), -- Aquamarine
-- Mithril Deposit & Ooze Covered
(@Mithril,3858,100,1,0,2,4), -- Mithril Ore
(@Mithril,7912,80,1,0,1,8), -- Solid Stone
(@Mithril,7909,5,1,1,1,1), -- Aquamarine
(@Mithril,3864,5,1,1,1,1), -- Citrine
(@Mithril,7910,5,1,1,1,1), -- Star Ruby
(@Mithril,9262,5,1,1,1,1), -- Black Vitriol
-- Truesilver Deposit & Ooze Covered
(@Truesilver,7911,100,1,0,2,4), -- Truesilver Ore
(@Truesilver,7909,5,1,1,1,1), -- Aquamarine
(@Truesilver,3864,5,1,1,1,1), -- Citrine
(@Truesilver,7910,5,1,1,1,1), -- Star Ruby
-- Dark Iron Deposit
(@DarkIron,11370,100,1,0,2,4), -- Dark Iron Ore
(@DarkIron, 9262,5,1,1,1,1), -- Black Vitriol
(@DarkIron,11382,5,1,1,1,1), -- Blood of the Mountain
(@DarkIron,11754,5,1,1,1,1), -- Black Diamond
-- Small Thorium Vein Covered
(@SmallThorium,10620,100,1,0,2,3), -- Thorium Ore
(@SmallThorium,12365,100,1,0,1,5), -- Dense Stone
(@SmallThorium,1,15,1,0,-@ThoriumGems,1), -- One From Gems
-- Rich Thorium Vein & Ooze Covered
(@RichThorium,10620,100,1,0,3,5), -- Thorium Ore
(@RichThorium,12365,100,1,0,4,7), -- Dense Stone
(@RichThorium,1,25,1,0,-@ThoriumGems,1), -- One From Gems
-- Special Cases:
-- Truesilver Vein+Tainted Vitriol
(17938,7911,100,1,0,2,8), -- Truesilver Ore
(17938,7909,5,1,1,1,1), -- Aquamarine
(17938,3864,5,1,1,1,1), -- Citrine
(17938,7910,5,1,1,1,1), -- Star Ruby
(17938,11513,50,1,0,1,1), -- Tainted Vitriol
-- Small Thorium Vein+Tainted Vitriol
(13960,10620,100,1,0,1,8), -- Thorium Ore
(13960,12365,100,1,0,1,10), -- Dense Stone
(13960,1,15,1,0,-@ThoriumGems,1), -- One From Gems
(13960,11513,50,1,0,1,1), -- Tainted Vitriol 
-- Hakkari Thorium Vein
(17241,10620,100,1,0,1,8), -- Thorium Ore
(17241,12365,100,1,0,1,10), -- Dense Stone
(17241,1,15,1,0,-@ThoriumGems,1), -- One From Gems
(17241,19774,40,1,0,5,10), -- Souldarite
-- Incendicite Mineral Vein
(@Incendicite,3340,-100,1,0,1,2), -- Incendicite Ore (for quest) 
-- Indurium Mineral Vein
(@Indurium,5833,-100,1,0,2,4); -- Indurium Ore (for quest)
-- -------------------------------
-- -- The Burning Crusade Zones -- 
-- -------------------------------
SET @FelIron :=18359;
SET @Nethercite := 22070;
SET @Adamantite := 18361;
SET @RichAdamantite := 26861;
SET @Khorium := 18363;
SET @GemVein := 26862;
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (@FelIron,@Nethercite,@Adamantite,@RichAdamantite,@Khorium,@GemVein);
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
-- Fel Iron Deposit
(@FelIron,23424,100,1,0,2,4), -- Fel Iron Ore
(@FelIron,22573,10,1,0,1,2), -- Mote of Earth
(@FelIron,22574,10,1,0,1,2), -- Mote of Fire
(@FelIron,23427,5,1,0,1,2), -- Eternium Ore
(@FelIron,1,5,1,0,-@FelIronGems,1), -- One From Green Gems
-- Nethercite Deposit
(@Nethercite,32464,100,1,0,1,2), -- Nethercite Ore
(@Nethercite,22573,10,1,0,1,4), -- Mote of Earth
(@Nethercite,22574,10,1,0,1,4), -- Mote of Fire
(@Nethercite,1,5,1,0,-@FelIronGems,1), -- One From Green Gems
(@Nethercite,2,1,1,0,-@RareGems,1), -- One From Blue Gems
-- Adamantite Deposit
(@Adamantite,23425,100,1,0,2,4), -- Adamantite Ore
(@Adamantite,22573,10,1,0,1,8), -- Mote of Earth
(@Adamantite,23427,10,1,0,1,2), -- Eternium Ore
(@Adamantite,1,5,1,0,-@AdamantiteGems,1), -- One From Green Gems
(@Adamantite,2,1,1,0,-@RareGems,1), -- One From Blue Gems
-- Rich Adamantite Deposit
(@RichAdamantite,23425,100,1,0,5,7), -- Adamantite Ore
(@RichAdamantite,22573,10,1,0,4,8), -- Mote of Earth
(@RichAdamantite,23427,10,1,0,2,3), -- Eternium Ore
(@RichAdamantite,1,5,1,0,-@AdamantiteGems,1), -- One From Green Gems
(@RichAdamantite,2,1,1,0,-@RareGems,1), -- One From Blue Gems
-- Khorium Vein
(@Khorium,23426,100,1,0,2,4), -- Khorim Ore
(@Khorium,22573,35,1,0,2,5), -- Mote of Earth
(@Khorium,22574,10,1,0,2,5), -- Mote of Fire
(@Khorium,23427,10,1,0,1,3), -- Eternium Ore
(@khorium,1,5,1,0,-@FelIronGems,1), -- One From Gems
(@khorium,2,1,1,0,-@RareGems,1), -- One From Gems
-- Ancient Gem Vein
(@GemVein,34907,70,1,1,1,9), -- Shattered Gem Fragments
(@GemVein,1,20,1,1,-@EpicGems,1), -- Epic Gems
(@GemVein,2,10,1,1,-@FelIronGems,1); -- One From Gems
-- ----------------------------------
-- -- Wrath of the Lich King Zones -- 
-- ----------------------------------
SET @Cobalt :=24153;
SET @RichCobalt := 24154;
SET @Saronite := 24155;
SET @RichSaronite := 24156;
SET @Titanium := 24157;
SET @PureSaronite := 27244;
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (@Cobalt,@RichCobalt,@Saronite,@RichSaronite,@PureSaronite,@Titanium);
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
-- Cobalt Deposit
(@Cobalt,36909,100,1,0,2,4), -- Cobalt Ore
(@Cobalt,37701,30,1,0,1,2), -- Crystallized Earth
(@Cobalt,37705,30,1,0,1,2), -- Crystallized Water
(@Cobalt,1,5,1,0,-@WotlkGreenGems,1), -- One From Green Gems
-- Rich Cobalt Deposit
(@RichCobalt,36909,100,1,0,4,8), -- Cobalt Ore
(@RichCobalt,37701,30,1,0,1,2), -- Crystallized Earth
(@RichCobalt,37705,30,1,0,1,2), -- Crystallized Water
(@RichCobalt,1,5,1,0,-@WotlkGreenGems,1), -- One From Green Gems
(@RichCobalt,2,5,1,0,-@WotlkBlueGems,1), -- One From Blue Gems
-- Saronite Deposit
(@Saronite,36912,100,1,0,2,4), -- Saronite Ore
(@Saronite,37701,40,1,0,1,2), -- Crystallized Earth
(@Saronite,37703,40,1,0,1,2), -- Crystallized Shadow
(@Saronite,1,5,1,0,-@WotlkGreenGems,1), -- One From Green Gems
-- Rich Saronite Deposit
(@RichSaronite,36912,100,1,0,5,7), -- Saronite Ore
(@RichSaronite,37701,40,1,0,1,8), -- Crystallized Earth
(@RichSaronite,37703,40,1,0,1,8), -- Crystallized Shadow
(@RichSaronite,1,5,1,0,-@WotlkGreenGems,1), -- One From Green Gems
(@RichSaronite,2,5,1,0,-@WotlkBlueGems,1), -- One From Blue Gems
-- Titanium Vein
(@Titanium,36910,100,1,0,2,4), -- Titanium Ore
(@Titanium,37701,50,1,0,3,6), -- Crystallized Earth
(@Titanium,37705,50,1,0,3,6), -- Crystallized Water
(@Titanium,37702,50,1,0,3,6), -- Crystallized Fire
(@Titanium,37703,50,1,0,3,6), -- Crystallized Air
(@Titanium,1,25,1,0,-@WotlkGreenGems,1), -- One From Green Gems
(@Titanium,2,5,1,0,-@WotlkBlueGems,1), -- One From Blue Gems
-- Pure Saronite Deposit
(@PureSaronite,36912,100,1,0,22,38), -- Saronite Ore
(@PureSaronite,35627,60,1,0,2,4), -- Eternal Earth
(@PureSaronite,35624,60,1,0,2,4), -- Eternal Shadow
(@PureSaronite,1,35,1,0,-@WotlkGreenGems,1), -- One From Green Gems
(@PureSaronite,2,50,1,0,-@WotlkBlueGems,1); -- One From Blue Gems

DELETE FROM `reference_loot_template` WHERE `entry` IN (12909,12991,12992,12993,12994,12995,12996,12997,12998,12999);-- SELECT `entryorguid`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`comment` FROM `smart_scripts`  WHERE `event_type`=14;
UPDATE `smart_scripts` SET `event_type`=74,`event_param2`=`event_param1`,`event_param1`=0,`target_type`=9 WHERE `entryorguid`=20049 AND `id`=4;
UPDATE `smart_scripts` SET `event_type`=74,`event_param2`=`event_param1`,`event_param1`=0,`target_type`=9 WHERE `entryorguid`=9045 AND `id`=3;
UPDATE `smart_scripts` SET `event_type`=74,`target_type`=9 WHERE `event_type`=14 AND `event_param1`=0 AND `event_param2` > 0 AND `event_param2` < 100;
UPDATE `smart_scripts` SET `event_param1`=`event_param2`,`event_param2`=30 WHERE `event_type`=14 AND `event_param2` >= 100;
-- Random comment
SET @SHREDDER		:= 27061; -- Xink's Shredder
SET @XINK			:= 26660; -- Xink
SET @SPELL			:= 52872; -- Forceitem Xink's Shredder

UPDATE `creature_template` SET `npcflag`=16777216,`unit_flags`=32768,`spell1`=47938,`spell2`=47921,`spell3`=49857,`spell4`=47966, `spell6`=47939 ,`VehicleId`=42 WHERE `entry`=@SHREDDER;
-- Creature Gossip_menu_option ppdate from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9422) AND `id` IN (0);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9422,0,0, 'I seem to have misplaced your Shredder Control Device... might you have another?',1,1,0,0,0,0, '');
-- Gossip option conditions
DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId`=15 AND `SourceGroup`=9422);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,9422,0,1,9,12050,0,0,0,'','Show gossip only if Lumber Hack quest is taken'),
(15,9422,0,1,26,36734,0,0,0,'','Show gossip only if player does not have item Xink''s Shredder Control Device'),
(15,9422,0,2,26,36734,0,0,0,'','Show gossip option if player does not have item Xink''s Shredder Control Device'),
(15,9422,0,2,9,12052,0,0,0,'','Show gossip option if player has quest marked as taken');

DELETE FROM `conditions` WHERE `SourceEntry`=@SHREDDER;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`)VALUES
(16,0,@SHREDDER,0,23,4230,0,0,0,'',"Dismount player when not in intended zone - Coldwind Heights");

-- NPC talk text insert from sniff
DELETE FROM `creature_text` WHERE `entry` IN (26660,27061) AND `groupid` IN (0,1);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@XINK,0,0, 'About time!  Get that lumber and get moving.  The horde won''t be up there fighting forever, there''s money to be made!',12,0,100,25,1000,0, 'Xink'),
(@SHREDDER,0,0, 'Xink''s Shredder ready and available for woodland destruction.',16,0,100,0,0,0, 'Xink''s Shredder'),
(@SHREDDER,1,0, 'Xink''s Shredder security features activated.  Returning to base.',16,0,100,0,0,0, 'Xink''s Shredder');

-- SAI for Xink
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@XINK;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@XINK AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@XINK,0,0,0,19,0,100,0,12050,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Xink - On Quest Accept - say 0'),
(@XINK,0,1,2,62,0,100,0,9422,0,0,0,11,@SPELL,0,0,0,0,0,7,0,0,0,0,0,0,0,'Xink - On Gossip option select - Cast Forceitem Xink''s Shredder'),
(@XINK,0,2,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Xink - On Gossip option select - Close Gossip');

DELETE FROM `conditions` WHERE `SourceEntry`=47939;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 47939, 0, 0, 35, 0, 1, 5, 3, 0, 0, 0, '', 'Gather Lumber - limit GO targets to Coldwind Tree');

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=27061;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
(27061, 47920, 1, 0);
DELETE FROM `spell_proc_event` WHERE `entry`=46916;
INSERT INTO `spell_proc_event` (`entry`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`) VALUES
(46916,4,0x200000,0x0,0x0);
DELETE FROM `spelldifficulty_dbc` WHERE `id` IN (49527, 49518, 49528, 49544, 49537, 49548);
INSERT INTO `spelldifficulty_dbc` (`id`, `spellid0`, `spellid1`) VALUES
(49527, 49527, 59972),
(49518, 49518, 59971),
(49528, 49528, 59973),
(49544, 49544, 59965),
(49537, 49537, 59963),
(49548, 49548, 59969);

UPDATE `creature_template` SET `AIName` = 'NullAI' WHERE `entry` = 30413;

DELETE FROM `spell_script_names` WHERE `spell_id` = 53242;
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES
(53242, 'spell_tharon_ja_clear_gift_of_tharon_ja');
-- Digging Through Bones (10922)
SET @LETOLL       := 22458;
SET @RESEARCHER   := 22464;
SET @B_SIFTER     := 22466;
SET @SG_TRIGGER   := 22457;
SET @RESEARCHER1  := 78837;

-- Faulty spawn, it needs to be spawned by a script.
DELETE FROM `creature` WHERE `guid`=85488;

DELETE FROM `creature_text` WHERE `entry`=@LETOLL;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@LETOLL,0,0,"'Aright, listen up! Form a circle around me and move out!",12,0,100,0,0,0,''),
(@LETOLL,1,0,"Aright, $R, just keep us safe from harm while we work. We'll pay you when we return.",12,0,100,0,0,0,''),
(@LETOLL,2,0,"The dig site is just north of here.",12,0,100,0,0,0,''),
(@LETOLL,3,0,"We're here! Start diggin'!",12,0,100,0,0,0,''),
(@LETOLL,4,0,"I think there's somethin' buried here, beneath the sand!",12,0,100,396,0,0,''),
(@LETOLL,5,0,"Almost got it!",12,0,100,396,0,0,''),
(@LETOLL,6,0,"By Brann's brittle bananas! What is it?! It... It looks like a drum.",12,0,100,396,0,0,''),
(@LETOLL,7,0,"Have ye gone mad? You expect me to leave behind a drum without first beatin' on it? Not this son of Ironforge! No sir!",12,0,100,0,0,0,''),
(@LETOLL,8,0,"Shut yer yaps! I'm gonna bang on this drum and that's that!",12,0,100,0,0,0,''),
(@LETOLL,9,0,"IN YOUR FACE! I told you there was somethin' here!",12,0,100,0,0,0,''),
(@LETOLL,10,0,"Don't just stand there! Help him out!",12,0,100,0,0,0,''),
(@LETOLL,11,0,"You've been a tremendous help, $R! Let's get out of here before more of those things show up! I'll let Dwarfowitz know you did the job asked of ya' admirably.",12,0,100,0,0,0,'');

DELETE FROM `creature_text` WHERE `entry`=@RESEARCHER;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@RESEARCHER,0,0,"Wow... a drum.",12,0,100,0,0,0,''),
(@RESEARCHER,1,0,"This discovery will surely rock the foundation of modern archaeology.",12,0,100,0,0,0,''),
(@RESEARCHER,2,0,"Yea, great. Can we leave now? This desert is giving me hives.",12,0,100,0,0,0,''),
(@RESEARCHER,3,0,"This reminds me of that one time where you made us search Silithus for evidence of sand gnomes.",12,0,100,0,0,0,''),
(@RESEARCHER,4,0,"Or that time when you told us that you'd discovered the cure for the plague of the 20th century. What is that even? 20th century?",12,0,100,0,0,0,''),
(@RESEARCHER,5,0,"I don't think it can top the one time where he told us that he'd heard that Arthas's cousin's skeleton was frozen beneath a glacier in Winterspring. I'll never forgive you for that one, Letoll. I mean honestly... Arthas's cousin?",12,0,100,0,0,0,''),
(@RESEARCHER,6,0,"I dunno. It can't possibly beat the time he tried to convince us that we're all actually a figment of some being's imagination and that they only use us for their own personal amusement. That went over well during dinner with the family.",12,0,100,0,0,0,''),
(@RESEARCHER,7,0,"Say, do you guys hear that?",12,0,100,0,0,0,'');

DELETE FROM `waypoints` WHERE `entry` IN (@LETOLL,@RESEARCHER,@LETOLL*100);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@LETOLL,1,-3728.1,5385.5,-3.41,''),
(@LETOLL,2,-3735.9,5392.8,-4.8,''),
(@LETOLL,3,-3729.7,5381,-4.9,''),
(@LETOLL,4,-3704.6, 5372.74, -9.33,''),
(@LETOLL,5,-3704.8,5374.7,-8.9,''),
(@LETOLL,6,-3623.2,5403.2,-11.5,''),
(@LETOLL,7,-3554.6,5455.2,-11.3,''),
(@LETOLL,8,-3557.7,5468.9,-8.1,''),
(@LETOLL,9,-3548.9,5458.3,-12.3,''),
(@RESEARCHER,1,-3725.1,5381.9,-4.4,''),
(@RESEARCHER,2,-3735.7,5390.7,-5.7,''),
(@RESEARCHER,3,-3728.4,5384.1,-3.4,''),
(@RESEARCHER,4,-3703.1,5371.4,-10.1,''),
(@RESEARCHER,5,-3619.6,5400.8,-12.1,''),
(@RESEARCHER,6,-3554.2,5451.1,-11.8,''),
(@RESEARCHER,7,-3563.1,5462.8,-6.5,''),
(@RESEARCHER,8,-3551.1,5454,-11.9,'');


UPDATE `creature_template` SET `AIname`='SmartAI' WHERE `entry` IN (@LETOLL,@RESEARCHER,@B_SIFTER);
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@LETOLL,-@RESEARCHER1,@B_SIFTER);
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@LETOLL*100+2,@LETOLL*100+1,@LETOLL*100,@RESEARCHER*100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@LETOLL,0,0,1,19,0,100,0,10922,0,0,0,53,0,@LETOLL,0,0,0,0,1,0,0,0,0,0,0,0,'On quest accept - Start WP'),
(@LETOLL,0,1,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say line 0'),
(@LETOLL,0,2,3,40,0,100,0,1,@LETOLL,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,'On WP reached - Pause WP'),
(@LETOLL,0,3,10,61,0,100,0,0,0,0,0,80,@LETOLL*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'On WP reached - Start Timed Event'),
(@LETOLL,0,4,5,40,0,100,0,8,@LETOLL,0,0,17,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'On WP reached - Set emote digging'),
(@LETOLL,0,5,0,61,0,100,0,0,0,0,0,45,0,2,0,0,0,0,10,78837,@RESEARCHER,0,0,0,0,0,'On Link - Set Data'),
(@LETOLL,0,6,7,40,0,100,0,9,@LETOLL,0,0,17,467,0,0,0,0,0,1,0,0,0,0,0,0,0,'On WP reached - Set emote digging'),
(@LETOLL,0,7,8,61,0,100,0,0,0,0,0,45,0,3,0,0,0,0,10,78837,@RESEARCHER,0,0,0,0,0,'On Link - Set Data'),
(@LETOLL,0,8,0,61,0,100,0,0,0,0,0,80,@LETOLL*100+1,0,0,0,0,0,1,0,0,0,0,0,0,0,'On WP reached - Start Timed Event'),
(@LETOLL,0,9,0,40,0,100,0,7,@LETOLL,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'On WP reached - Say line 3'),
(@LETOLL,0,10,0,61,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set npc flag'),
(@LETOLL,0,11,0,40,0,100,0,7,@LETOLL,0,0,54,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,'On WP reached - Pause WP'),
--
(-@RESEARCHER1,0,0,0,38,0,100,0,0,1,0,0,53,0,@RESEARCHER,0,0,0,0,1,0,0,0,0,0,0,0,'On Data - Start WP'),
(-@RESEARCHER1,0,1,2,40,0,100,0,6,@RESEARCHER,0,0,54,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,' On Data - Start WP'),
(-@RESEARCHER1,0,2,0,61,0,100,0,0,0,0,0,17,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'On link - Start digging'),
(-@RESEARCHER1,0,3,4,40,0,100,0,7,@RESEARCHER,0,0,54,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Pause WP'),
(-@RESEARCHER1,0,4,0,61,0,100,0,0,0,0,0,17,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'On link - Start digging'),
(-@RESEARCHER1,0,5,6,40,0,100,0,8,@RESEARCHER,0,0,54,35500,0,0,0,0,0,1,0,0,0,0,0,0,0,'On WP reached - Pause WP'),
(-@RESEARCHER1,0,6,0,61,0,100,0,0,0,0,0,80,@RESEARCHER*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'ON WP reached - Start Timed Event'),
(-@RESEARCHER1,0,7,0,11,0,100,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Respawn - Set Emote State none'),
-- 
(@LETOLL*100,9,0,0,0,0,100,0,3000,3000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 1'),
(@LETOLL*100,9,1,0,0,0,100,0,7000,7000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 2'),
(@LETOLL*100,9,2,0,0,0,100,0,500,500,0,0,45,0,1,0,0,0,0,10,78837,@RESEARCHER,0,0,0,0,0,'On Script - Set Data'),
--
(@LETOLL*100+1,9,0,0,0,0,100,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 4'),
(@LETOLL*100+1,9,1,0,0,0,100,0,2000,2000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 5'),
(@LETOLL*100+1,9,2,0,0,0,100,0,5000,5000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 6'),
--
(@RESEARCHER*100,9,0,0,0,0,100,0,5000,5000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 0'),
(@RESEARCHER*100,9,1,0,0,0,100,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Set emote state none'),
(@RESEARCHER*100,9,2,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 1'),
(@RESEARCHER*100,9,3,0,0,0,100,0,7000,7000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 2'),
--
(@LETOLL*100+1,9,3,0,0,0,100,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Set emote state none'),
(@LETOLL*100+1,9,4,0,0,0,100,0,22000,22000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 7'),
--
(@RESEARCHER*100,9,4,0,0,0,100,0,12000,12000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 3'),
(@RESEARCHER*100,9,5,0,0,0,100,0,6000,6000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 4'),
(@RESEARCHER*100,9,6,0,0,0,100,0,6000,6000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 5'),
(@RESEARCHER*100,9,7,0,0,0,100,0,17000,17000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 6'),
--
(@LETOLL*100+1,9,5,0,0,0,100,0,34000,34000,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 8'),
--
(@RESEARCHER*100,9,8,0,0,0,100,0,6000,6000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 7'),
(@RESEARCHER*100,9,9,0,0,0,100,0,15000,15000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Despawn'),
--
(@LETOLL*100+1,9,6,0,0,0,100,0,7000,7000,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 9'),
(@LETOLL*100+1,9,7,0,0,0,100,0,500,500,0,0,12,@B_SIFTER,1,60000,0,0,0,8,0,0,0,-3550,5456.1,-12.3,0,'On Script - Summon worm'),
(@LETOLL*100+1,9,8,0,0,0,100,0,8000,8000,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 10'),
(@LETOLL*100+1,9,9,0,0,0,100,0,8000,8000,0,0,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Say line 11'),
(@LETOLL*100+1,9,10,0,0,0,100,0,6000,6000,0,0,15,10922,0,0,0,0,0,18,20,0,0,0,0,0,0,'On Script - Give quest credit'),
(@LETOLL*100+1,9,11,0,0,0,100,0,3000,3000,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Restore npcflags'),
(@LETOLL*100+1,9,12,0,0,0,100,0,1000,1000,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0,' On Script - Stop Script'),
(@LETOLL*100+1,9,13,0,0,0,100,0,16000,16000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Script - Despawn'),
--
(@B_SIFTER,0,0,0,0,0,100,0,2000,6000,12000,17000,11,31747,0,0,0,0,0,2,0,0,0,0,0,0,0,'- IC - Cast Poison'),
(@B_SIFTER,0,1,0,0,0,100,0,5000,25000,35000,40000,11,32738,0,0,0,0,0,2,0,0,0,0,0,0,0,'- IC - Cast Bore');
DELETE FROM `creature_addon` WHERE `guid` IN (127445, 127446, 127447);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(127445, 0, 26751, 0, 1, 0, ''),
(127446, 0, 26751, 0, 1, 0, ''),
(127447, 0, 26751, 0, 1, 0, '');
-- Unleash the Raptors (11147)
SET @EVENT         := 15363;
SET @RAPTOR        := 23741;
SET @QUEST_CREDIT  := 23727;

DELETE FROM `event_scripts` WHERE `id`= @EVENT;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(@EVENT,0,8,@QUEST_CREDIT,1,0,0,0,0,0),
(@EVENT,0,10,@RAPTOR,600000,0,-2617.885,-3277.134,31.93436,0.541052),
(@EVENT,0,10,@RAPTOR,600000,0,-2621.778,-3275.271,30.62537,0.296706),
(@EVENT,0,10,@RAPTOR,600000,0,-2620.451,-3279.923,31.8134,0.296706),
(@EVENT,0,10,@RAPTOR,600000,0,-2482.963,-3240.589,40.96778,2.495821),
(@EVENT,0,10,@RAPTOR,600000,0,-2481.632,-3245.017,43.09342,2.583087),
(@EVENT,0,10,@RAPTOR,600000,0,-2479.413,-3239.004,40.06413,2.530727),
(@EVENT,0,10,@RAPTOR,600000,0,-2524.415,-3128.137,29.7597,0.3316126),
(@EVENT,0,10,@RAPTOR,600000,0,-2527.19,-3125.763,29.5518,0.3839724),
(@EVENT,0,10,@RAPTOR,600000,0,-2526.191,-3131.122,29.00879,0.2792527);

UPDATE `creature_template` SET AIName='SmartAI' WHERE entry=@RAPTOR;
DELETE FROM `smart_scripts` WHERE entryorguid IN (@RAPTOR);
INSERT INTO `smart_scripts` VALUES
(@RAPTOR,0,0,0,54,0,100,0,0,0,0,0,53,1,@RAPTOR,0,0,0,0,1,0,0,0,0,0,0,0,'Captured Raptor - On Summon - Start WayPoint'),
(@RAPTOR,0,1,0,54,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Captured Raptor - Summon - Aggresive'),
(@RAPTOR,0,2,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,19,0,0,0,0,0,0,0,'Captured Raptor - Summon - Attack Random Hostile'),
(@RAPTOR,0,3,0,1,0,100,1,60000,60000,60000,60000,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Captured Raptor - OOC 60 Secs - Despawn'),
(@RAPTOR,0,4,0,1,0,100,1,25000,25000,25000,25000,53,1,@RAPTOR,0,0,0,0,1,0,0,0,0,0,0,0,'Captured Raptor - OOC 25 Secs - Start WayPoint');

DELETE FROM `waypoints` WHERE entry IN (@RAPTOR);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@RAPTOR,1,-2457.79, -3169.9, 35.109,'Captured Raptor'),
(@RAPTOR,2,-2446.18, -3176.67, 34.5238,'Captured Raptor'),
(@RAPTOR,3,-2436.55, -3170.93, 35.8081,'Captured Raptor'),
(@RAPTOR,4,-2428.23, -3146.74, 35.8573,'Captured Raptor'),
(@RAPTOR,5,-2444.57, -3138.12, 35.8598,'Captured Raptor'),
(@RAPTOR,6,-2457.32, -3146.25, 35.4215,'Captured Raptor'),
(@RAPTOR,7,-2468, -3161.3, 34.8617,'Captured Raptor');

-- Missing spell focus
DELETE FROM `gameobject` WHERE `id` = 124154;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(76870, 124154, 1, 1, 1, -2456.02, -3150.7, 35.8358, 4.69274, 0, 0, 0.714019, -0.700126, 300, 0, 1);

-- Missing gameobject template
DELETE FROM `gameobject_template` WHERE `entry`= 124154;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `WDBVerified`) VALUES 
(124154, 8, 1287, 'TEMP Blackhoof Village Windmill', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 1459, 10, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 1);
-- Hack field
UPDATE `quest_template` SET `RequiredSpellCast1`=0 WHERE `Id`=11147;
UPDATE `instance_template` SET `script`='instance_the_stockade' WHERE `map`=34;
-- Bazil Thredd should be the last boss in the instance, not Dextren Ward
UPDATE `instance_encounters` SET `lastEncounterDungeon`=12 WHERE `entry`=539;
UPDATE `instance_encounters` SET `lastEncounterDungeon`=0 WHERE `entry`=540;
UPDATE `instance_template` SET `script`='instance_ragefire_chasm' WHERE `map`=389;
-- Applicable id for made up GO template
UPDATE `gameobject_template` SET `entry`=300149 WHERE  `entry`=124154;
UPDATE `instance_template` SET `script`='instance_the_underbog' WHERE `map`=546;
UPDATE `instance_template` SET `script`='instance_the_slave_pens' WHERE `map`=547;
UPDATE `instance_template` SET `script`='instance_maraudon' WHERE `map`=349;
UPDATE `instance_template` SET `script`='instance_dire_maul' WHERE `map`=429;
UPDATE `gameobject` SET `id`=300149 WHERE `guid`=76870;
DELETE FROM `spell_script_names` WHERE `spell_id` = 60144;
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES
(60144, 'spell_hun_viper_attack_speed');
-- Rejek: First Blood (12734)
SET @SPELL        := 52992;
SET @WASP         := 28086;
SET @HARDKNUCKLE  := 28096;
SET @WARRIOR      := 28109;
SET @ORACLE       := 28110;
SET @CREDIT1      := 28040;
SET @CREDIT2      := 36189;
SET @CREDIT3      := 29043;
SET @FLIPATTACK   := 50533;
SET @CHARGE       := 49758;
SET @STING        := 34392;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@WASP;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@WASP;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@WASP;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@WASP,0,0,0,2,0,100,0,0,30,7000,9000,11,@STING,1,0,0,0,0,1,0,0,0,0,0,0,0,'Sapphire Hive Wasp - On HP 30% - Cast Stinger Rage'),
(@WASP,0,1,2,8,0,100,1,@SPELL,0,0,0,33,@CREDIT1,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sapphire Hive Wasp - On Spellhit - Give Quest Credit'),
(@WASP,0,2,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sapphire Hive Wasp - On Link - Despawn');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@HARDKNUCKLE;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@HARDKNUCKLE;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@HARDKNUCKLE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@HARDKNUCKLE,0,0,0,9,0,100,1,10,30,0,0,11,@CHARGE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hardknuckle Charger - On range - Cast Charge'),
(@HARDKNUCKLE,0,1,2,8,0,100,1,@SPELL,0,0,0,33,@CREDIT2,0,0,0,0,0,7,0,0,0,0,0,0,0,'Hardknuckle Charger - On Spellhit - Give Quest Credit'),
(@HARDKNUCKLE,0,2,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hardknuckle Charger - On Link - Despawn');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@WARRIOR;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@WARRIOR;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@WARRIOR;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@WARRIOR,0,0,0,0,0,100,0,2000,6000,4000,7000,11,@FLIPATTACK,1,0,0,0,0,2,0,0,0,0,0,0,0,'Mistwhisper Warrior - IC - Cast Flip Arrack'),
(@WARRIOR,0,1,2,8,0,100,1,@SPELL,0,0,0,33,@CREDIT3,0,0,0,0,0,7,0,0,0,0,0,0,0,'Mistwhisper Warrior - On Spellhit - Give Quest Credit'),
(@WARRIOR,0,2,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mistwhisper Warrior - On Link - Despawn');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ORACLE;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ORACLE;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ORACLE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ORACLE,0,0,0,0,0,100,0,4000,7000,11000,19000,11,54921,1,0,0,0,0,1,0,0,0,0,0,0,0,'Mistwhisper Oracle - IC - Cast Lightning Cloud'),
(@ORACLE,0,1,2,8,0,100,1,@SPELL,0,0,0,33,@CREDIT3,0,0,0,0,0,7,0,0,0,0,0,0,0,'Mistwhisper Oracle - On Spellhit - Give Quest Credit'),
(@ORACLE,0,2,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mistwhisper Oracle - On Link - Despawn');
DELETE FROM `creature_text` WHERE `entry` IN (27986, 28047, 28568);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(27986, 0, 0, 'Aye, I''ll try it.', 12, 0, 100, 273, 0, 0, 'Hemet Nesingwary'),
(27986, 1, 0, 'That''s exactly what I needed!', 12, 0, 100, 5, 0, 0, 'Hemet Nesingwary'),
(27986, 2, 0, 'It''s got my vote! That''ll put hair on your chest like nothing else will.', 12, 0, 100, 1, 0, 0, 'Hemet Nesingwary'),
(27986, 3, 0, 'What a fight you missed, Dorian! It was one for the ages!', 12, 0, 100, 5, 0, 0, 'Hemet Nesingwary'),
(27986, 4, 0, 'There we were, riding into battle at full speed on the back of Stampy...', 12, 0, 100, 5, 0, 0, 'Hemet Nesingwary'),

(27986, 5, 0, 'Well, lad, you can start by readin'' The Green Hills of Stranglethorn. Then, maybe you can join me on one of my safaris. What do you say?', 12, 0, 100, 0, 0, 0, 'Hemet Nesingwary'),

(28047, 0, 0, 'I''m always up for something of Grimbooze''s.', 12, 0, 100, 273, 0, 0, 'Hadrius Harlowe'),
(28047, 1, 0, 'Well, so far, it tastes like something my wife would drink...', 12, 0, 100, 5, 0, 0, 'Hadrius Harlowe'),
(28047, 2, 0, 'Now, there''s the kick I''ve come to expect from Grimbooze''s drinks! I like it!', 12, 0, 100, 5, 0, 0, 'Hadrius Harlowe'),

(28568, 0, 0, 'Sure!', 12, 0, 100, 273, 0, 0, 'Tamara Wobblesprocket'),
(28568, 1, 0, 'Oh my...', 12, 0, 100, 0, 0, 0, 'Tamara Wobblesprocket'),
(28568, 2, 0, 'Tastes like I''m drinking... engine degreaser!', 12, 0, 100, 1, 0, 0, 'Tamara Wobblesprocket');
-- To Rule The Skies (23061) & Onyx Scales
SET @OBSIDIA        := 23282;
SET @RIVENDARK      := 23061;
SET @FURYWING       := 23261;
SET @INSIDION       := 23281;
SET @APEXIS_SHARD   := 32569;
SET @OBSIDIA_EGG    := 185932;
SET @FURYWING_EGG   := 185937;
SET @INSIDION_EGG   := 185938;
SET @RIVENDARK_EGG  := 185936;

UPDATE `creature_template` SET `InhabitType`=7, `AIName`= 'SmartAI' WHERE `entry` IN (@OBSIDIA,@RIVENDARK,@FURYWING,@INSIDION);
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry` IN (@OBSIDIA_EGG,@FURYWING_EGG,@INSIDION_EGG,@RIVENDARK_EGG);
UPDATE `creature_template_addon` SET `bytes1`=33554432 WHERE `entry` IN (@OBSIDIA,@RIVENDARK,@FURYWING,@INSIDION);
DELETE FROM `smart_scripts` WHERE `entryorguid`=@OBSIDIA_EGG AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@OBSIDIA_EGG,1,0,1,62,0,100,0,8685,0,0,0,57,@APEXIS_SHARD,35,0,0,0,0,7,0,0,0,0,0,0,0,'On gossip select -Remove Item - Player'),
(@OBSIDIA_EGG,1,1,2,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'On gossip select - Link - Close gossip'),
(@OBSIDIA_EGG,1,2,0,61,0,100,0,0,0,0,0,12,@OBSIDIA,6,30000,0,0,0,8,0,0,0,2421.336, 6968.062, 391.037,0,'On Script - Summon Obsidia - Location');

DELETE FROM `smart_scripts` WHERE `entryorguid`=@FURYWING_EGG AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@FURYWING_EGG,1,0,1,62,0,100,0,8690,0,0,0,57,@APEXIS_SHARD,35,0,0,0,0,7,0,0,0,0,0,0,0,'On gossip select - Remove Item - Player'),
(@FURYWING_EGG,1,1,2,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'On gossip select - Link - Close gossip'),
(@FURYWING_EGG,1,2,0,61,0,100,0,0,0,0,0,12,@FURYWING,6,30000,0,0,0,8,0,0,0,3845.314, 5220.040, 295.412,0,'On Script - Summon Furywing - Location');

DELETE FROM `smart_scripts` WHERE `entryorguid`=@INSIDION_EGG AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@INSIDION_EGG,1,0,1,62,0,100,0,8691,0,0,0,57,@APEXIS_SHARD,35,0,0,0,0,7,0,0,0,0,0,0,0,'On gossip select - Remove Item - Player'),
(@INSIDION_EGG,1,1,2,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'On gossip select - Link - Close gossip'),
(@INSIDION_EGG,1,2,0,61,0,100,0,0,0,0,0,12,@INSIDION,6,30000,0,0,0,8,0,0,0,4176.496, 5452.214, 291.923,0,'On Script - Summon Insidion - Location');

DELETE FROM `smart_scripts` WHERE `entryorguid`=@RIVENDARK_EGG AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@RIVENDARK_EGG,1,0,1,62,0,100,0,8689,0,0,0,57,@APEXIS_SHARD,35,0,0,0,0,7,0,0,0,0,0,0,0,'On gossip select - Remove Item - Player'),
(@RIVENDARK_EGG,1,1,2,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'On gossip select - Link - Close gossip'),
(@RIVENDARK_EGG,1,2,0,61,0,100,0,0,0,0,0,12,@RIVENDARK,6,30000,0,0,0,8,0,0,0,2060.603, 7418.534, 391.098,0,'On Script - Summon Rivendark - Location');

-- Obsidia SPAWN:2421.336, 6968.062, 391.037 FLY: 2426.8,7001.64,367.572
DELETE FROM `smart_scripts` WHERE `entryorguid`IN (@OBSIDIA,@RIVENDARK,@FURYWING,@INSIDION) AND`source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`, `target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@OBSIDIA, 0, 0, 0, 0, 0, 100, 0, 3000, 9000, 3000, 9000, 11, 9573, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Obsidia - In combat - Cast Flame Breath'),
(@OBSIDIA, 0, 1, 0, 0, 0, 100, 0, 2000, 6000, 2000, 6000, 11, 40505, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Obsidia - In combat - Cast Cleave '),
(@OBSIDIA, 0, 2, 0, 0, 0, 100, 0, 15000, 16000, 15000, 16000, 11, 40717, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 'Obsidia - In combat - Cast Hellfire'),
(@OBSIDIA, 0, 3, 0, 0, 0, 100, 0, 13000, 13500, 13000, 13500, 11, 40032, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Obsidia - In combat - Cast Fiery Breath '),
(@OBSIDIA, 0, 4, 0, 0, 0, 100, 0, 18000, 19000, 18000, 19000, 11, 36922, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Obsidia - In combat - Cast Bellowing Roar'),
(@OBSIDIA, 0, 5, 0, 11, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 2426.8, 7001.64, 367.572, 0, 'Obsidia - On Spawn - Move to Pos');

-- Rivendark 2060.603, 7418.534, 391.098 FLY: 2064.69,7372.69,371.159
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`, `target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@RIVENDARK, 0, 0, 0, 0, 0, 100, 0, 3000, 9000, 3000, 9000, 11, 9573, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Rivendark - In combat - Cast Flame Breath'),
(@RIVENDARK, 0, 1, 0, 0, 0, 100, 0, 2000, 6000, 2000, 6000, 11, 40505, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Rivendark - In combat - Cast Cleave '),
(@RIVENDARK, 0, 2, 0, 0, 0, 100, 0, 7000, 12000, 7000, 12000, 11, 41988, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 'Rivendark - In combat - Cast Corruption'),
(@RIVENDARK, 0, 3, 0, 0, 0, 100, 0, 13000, 13500, 13000, 13500, 11, 40032, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Rivendark - In combat - Cast Fiery Breath '),
(@RIVENDARK, 0, 4, 0, 0, 0, 100, 0, 18000, 19000, 18000, 19000, 11, 36922, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Rivendark - In combat - Cast Bellowing Roar'),
(@RIVENDARK, 0, 5, 0, 0, 0, 100, 0, 5000, 6000, 5000, 6000, 11, 15847, 2, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Rivendark - In combat - Tail Swipe'),
(@RIVENDARK, 0, 6, 0, 11, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 2064.69, 7372.69, 371.159, 0, 'Rivendark- On Spawn - Move to Pos');
-- Furywing 3845.314, 5220.040, 295.412 FLY: 3891.27,5227.05,270.094
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`, `target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@FURYWING, 0, 0, 0, 0, 0, 100, 0, 3000, 9000, 3000, 9000, 11, 9573, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Furywing - In combat - Cast Flame Breath'),
(@FURYWING, 0, 1, 0, 0, 0, 100, 0, 2000, 6000, 2000, 6000, 11, 40505, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Furywing - In combat - Cast Cleave '),
(@FURYWING, 0, 2, 0, 0, 0, 100, 0, 10000, 16000, 10000, 16000, 11, 41572, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 'Furywing - In combat - Cast Wing Buffet'),
(@FURYWING, 0, 3, 0, 0, 0, 100, 0, 13000, 13500, 13000, 13500, 11, 40032, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Furywing - In combat - Cast Fiery Breath '),
(@FURYWING, 0, 4, 0, 0, 0, 100, 0, 18000, 19000, 18000, 19000, 11, 36922, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Furywing - In combat - Cast Bellowing Roar'),
(@FURYWING, 0, 5, 0, 0, 0, 100, 0, 5000, 6000, 5000, 6000, 11, 15847, 2, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Furywing - In combat - Tail Swipe'),
(@FURYWING, 0, 6, 0, 11, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 3891.27, 5227.05, 270.094, 0, 'Furywing - On Spawn - Move to Pos');
-- Insidion 4176.496, 5452.214, 291.923 FLY: 4143.16,5441.75,274.503
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`, `target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@INSIDION, 0, 0, 0, 0, 0, 100, 0, 3000, 9000, 3000, 9000, 11, 9573, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Insidion - In combat - Cast Flame Breath'),
(@INSIDION, 0, 1, 0, 0, 0, 100, 0, 2000, 6000, 2000, 6000, 11, 40505, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Insidion - In combat - Cast Cleave '),
(@INSIDION, 0, 2, 0, 0, 0, 100, 0, 10000, 16000, 10000, 16000, 11, 40719, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 'Insidion - In combat - Cast Flame Buffet'),
(@INSIDION, 0, 3, 0, 0, 0, 100, 0, 13000, 13500, 13000, 13500, 11, 40032, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Insidion - In combat - Cast Fiery Breath '),
(@INSIDION, 0, 4, 0, 0, 0, 100, 0, 18000, 19000, 18000, 19000, 11, 36922, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Insidion - In combat - Cast Bellowing Roar'),
(@INSIDION, 0, 5, 0, 11, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4143.16, 5441.75, 274.503, 0, 'Insidion - On Spawn - Move to Pos');
-- Vile Like Fire! (13071)

SET @NPC_DRAKE            := 30272; -- Njorndar Proto-Drake (not mount)
SET @NPC_DRAKE_MOUNT      := 30564; -- Njorndar Proto-Drake
SET @NPC_FIRE_BUNNY       := 30599; -- Vile Like Fire! Fire Bunny
SET @NPC_CREDIT           := 30576; -- Vile Like Fire! Kill Credit Bunny
SET @SPELL_MOUNT          := 57401; -- Njorndar Proto-Drake
SET @SPELL_STRAFE         := 7769; -- Strafe Jotunheim Building
SET @AURA_OUT_OF_AREA     := 57404; -- Out of Jotunheim! (mount out of area)
SET @SPELL_SPREAD_FIRE    := 57469; -- Vile Like Fire!: Spread the Fire
SET @SPELL_FIRE           := 7448; -- Vile Like Fire!: Fire

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=@NPC_DRAKE;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(@NPC_DRAKE,@SPELL_MOUNT,1,0);

UPDATE `creature_template` SET `npcflag`=16777216,`faction_A`=190,`faction_H`=190 WHERE `entry`=@NPC_DRAKE;
UPDATE `creature_template` SET `AIName`='SmartAI',`minlevel`=80,`maxlevel`=80,`exp`=2,`unit_flags`=8,`HoverHeight`=2.25,`InhabitType`=4,`spell1`=57493,`spell3`=7769 WHERE `entry`=@NPC_DRAKE_MOUNT;

DELETE FROM `creature_template_addon` WHERE `entry`=@NPC_DRAKE_MOUNT;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC_DRAKE_MOUNT,0,0,50331648,1,0,'57403'); -- 57403: Flight

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (@SPELL_STRAFE,@SPELL_SPREAD_FIRE);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,@SPELL_STRAFE,0,0,31,0,3,@NPC_CREDIT,0,0,0,'','Strafe Jotunheim Building targets Kill Credit Bunny'),
(13,1,@SPELL_SPREAD_FIRE,0,0,31,0,3,@NPC_CREDIT,0,0,0,'','Spread the Fire targets Kill Credit Bunny'),
(13,1,@SPELL_SPREAD_FIRE,0,1,31,0,3,@NPC_FIRE_BUNNY,0,0,0,'','Spread the Fire targets Kill Credit Bunny');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=@SPELL_SPREAD_FIRE;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(@SPELL_SPREAD_FIRE,@SPELL_FIRE,1,'Spread Fire triggers Fire');

UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry`=@NPC_FIRE_BUNNY;
UPDATE `creature_template` SET `AIName`='SmartAI',`flags_extra`=128 WHERE `entry`=@NPC_CREDIT;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@NPC_DRAKE_MOUNT;

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@NPC_CREDIT,@NPC_DRAKE_MOUNT);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_CREDIT,0,0,0,23,0,100,0,@SPELL_FIRE,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'On no aura - Set phase 1'),
(@NPC_CREDIT,0,1,2,8,1,100,0,@SPELL_STRAFE,0,0,0,11,@SPELL_SPREAD_FIRE,0,0,0,0,0,1,0,0,0,0,0,0,0,'On spellhit - Cast Spread Fire'),
(@NPC_CREDIT,0,2,3,61,1,100,0,0,0,0,0,45,0,1,0,0,0,0,7,0,0,0,0,0,0,0,'On link - Set data'),
(@NPC_CREDIT,0,3,0,61,1,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On link - Set phase 1'),
--
(@NPC_DRAKE_MOUNT,0,0,0,38,0,100,0,0,1,0,0,33,@NPC_CREDIT,0,0,0,0,0,23,0,0,0,0,0,0,0,'On Data - Give killcredit owner');

DELETE FROM `conditions` WHERE `SourceEntry` = 57402;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(17, 1, 57402, 0, 0, 23, 0, 4526, 0, 0, 0, 0, 0, '', 'Dismount player when not in intended zone');
-- Fix I've Got a Flying Machine
-- Steel Gate Chief Archaeologist SAI & Text & Condition
SET @ENTRY			 := 24399;
SET @ENTRY1			:= 24418;
SET @ENTRY2			:= 24439;
SET @ENTRY3			:= 24438;
SET @STALKER		 := 105997;
SET @CGUID			 := 142705;
SET @MENUID			:= 8954;
SET @OPTION			:= 0;

UPDATE `creature_template` SET  `unit_flags`=16777216, `InhabitType`=5, `spell1`=44009, `spell2`=43770, `spell3`=43799, `spell4`=43769, `spell5`=47769 WHERE `entry`=@ENTRY1;
DELETE FROM `creature` WHERE `id`=24439;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(@CGUID+0, 24439, 571, 1, 1, 24780, 0, 2088.714, -3263.196, 82.50323, 0.2792527, 120, 0, 0, 42, 0, 0, 0, 0, 0), -- Sack of Relics (Area: 0)
(@CGUID+1, 24439, 571, 1, 1, 24780, 0, 2047.712, -3236.201, 62.82506, 3.682645, 120, 0, 0, 42, 0, 0, 0, 0, 0), -- Sack of Relics (Area: Steel Gate)
(@CGUID+2, 24439, 571, 1, 1, 24780, 0, 2017.764, -3243.003, 74.95174, 3.246312, 120, 0, 0, 42, 0, 0, 0, 0, 0), -- Sack of Relics (Area: Steel Gate)
(@CGUID+3, 24439, 571, 1, 1, 24780, 0, 2068.706, -3318.71, 98.2312, 5.72468, 120, 0, 0, 42, 0, 0, 0, 0, 0), -- Sack of Relics (Area: Steel Gate)
(@CGUID+4, 24439, 571, 1, 1, 24780, 0, 1996.727, -3323.912, 99.77941, 5.532694, 120, 0, 0, 42, 0, 0, 0, 0, 0), -- Sack of Relics (Area: Steel Gate)
(@CGUID+5, 24439, 571, 1, 1, 24780, 0, 2068.706, -3318.71, 98.2312, 5.72468, 120, 0, 0, 42, 0, 0, 0, 0, 0); -- Sack of Relics (Area: 0)

DELETE FROM `creature_template_addon` WHERE `entry`=24418;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(24418, 0, 0, 0, 0x1, 0x1, '43775 43889'); -- Steel Gate Flying Machine - Flight Drop Off Buff

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY; 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,@MENUID,@OPTION,0,0,11,45973,1,0,0,0,0,7,0,0,0,0,0,0,0, 'Steel Gate Chief Archaeologist - On gossip option select - Cast spell'),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Steel Gate Chief Archaeologist - On Link - Close gossip'),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,11,43767,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Steel Gate Chief Archaeologist - On Link - Cast Invoker'),
(@ENTRY,0,3,4,19,0,100,1,11390,0,0,0,11,45973,1,0,0,0,0,7,0,0,0,0,0,0,0, 'Steel Gate Chief Archaeologist - On Quest Accept - Cast spell'),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,11,43767,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Steel Gate Chief Archaeologist - On Link - Cast Invoker'),
(@ENTRY,0,5,0,19,0,100,0,11390,0,0,0,12,@ENTRY3,3,120000,0,0,0,8,0,0,0,1972.773,-3265.381,134.719,0, 'Steel Gate Chief Archaeologist - On Link - Cast Invoker');

UPDATE `creature_template` SET `modelid1`=11686, `modelid2`=0, `AIName`= 'SmartAI', `type_flags`=1048576 WHERE `entry`=@ENTRY3;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY3; 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY3,0,0,0,54,0,100,0,0,0,0,0,11,43890,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grapple Target - Just Summoned - Cast Invisibility on self');


DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`= @ENTRY1;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
(@ENTRY1, 43768, 1, 0); 

DELETE FROM `gossip_menu_option` WHERE `menu_id`=@MENUID AND `id`=@OPTION;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(@MENUID,@OPTION,0,'Sir, I need another flying machine...',1,1,0,0,0,0,'');

-- Gossip conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@MENUID AND `SourceEntry`=@OPTION;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@MENUID,@OPTION,0,9,11390,0,0,0,'','Show gossip option 0 if player has quest I''ve got a Flying Machine');

DELETE FROM `conditions` WHERE `SourceEntry`=@ENTRY1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(16, 0, @ENTRY1, 0, 23, 3999, 0, 0, 0, '', 'Dismount player when not in intended zone');
-- Condition for Grappling Hook spell(43770)
DELETE FROM `conditions` WHERE `SourceEntry`=43770;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13, 1, 43770, 0, 31, 3, 24439, 0, 0, '', 'Spell 43770(Grappling Hook) targets npc 24439(Sack of Relics)');
-- Spell Conditions
DELETE FROM `conditions` WHERE `SourceEntry`IN (43891,43892,43789);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13, 1, 43892, 0, 31, 3, 24439, 0, 0, '', 'Spell 43892 targets npc 24439'),
(13, 1, 43891, 0, 29, @ENTRY2, 1, 0, 0, '', 'Spell 43892 targets npc 24439'),
(13, 1, 43789, 0, 31, 3, 24439, 0, 0, '', 'Spell 43892 targets npc 24439');

-- Sack of Relics SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY2 AND `source_type`=0;
UPDATE `creature_template` SET AIName='SmartAI' WHERE entry=@ENTRY2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY2,0,0,0,8,0,100,0,43770,0,0,0,11,46598,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,'Sack of Relics - On Link - Mount Sack to vehicle'),
(@ENTRY2,0,1,2,8,0,100,1,43892,0,0,0,11,46598,0,0,0,0,0,10,105997,15214,0,0.0,0.0,0.0,0.0,' Sack of Relics - Remove Vehicle - In range'),
(@ENTRY2,0,2,3,61,0,100,1,0,0,0,0,11,36553,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Sack of Relics - On Link - Cast pet stay(36553)'),
(@ENTRY2,0,3,4,61,0,100,1,0,0,0,0,33,24439,0,0,0,0,0,21,20,0,0,0.0,0.0,0.0,0.0,'Sack of Relics - On Link - Quest Credit'),
(@ENTRY2,0,4,0,61,0,100,1,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Sack of Relics - On Link - Despawn');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=43770;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(43770,43789,1,'Trigger grip beam');

DELETE FROM `smart_scripts` WHERE `entryorguid`=-@STALKER AND `source_type`=0;
UPDATE `creature_template` SET AIName='SmartAI' WHERE entry=15214;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(-@STALKER,0,0,0,1,0,100,0,0,0,0,0,11,43892,0,0,0,0,0,11,@ENTRY2,10,0,0.0,0.0,0.0,0.0,'Invisible Stalker - OOC - Cast Spell');
UPDATE `conditions` SET `SourceTypeOrReferenceId`=17, `SourceGroup`=0 WHERE  `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=43789 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=31 AND `ConditionTarget`=0 AND `ConditionValue1`=3 AND `ConditionValue2`=24439 AND `ConditionValue3`=0;
UPDATE `conditions` SET `SourceTypeOrReferenceId`=17, `SourceGroup`=0 WHERE  `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=43892 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=31 AND `ConditionTarget`=0 AND `ConditionValue1`=3 AND `ConditionValue2`=24439 AND `ConditionValue3`=0;
UPDATE `conditions` SET `SourceTypeOrReferenceId`=17 WHERE  `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=43891 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=29 AND `ConditionTarget`=0 AND `ConditionValue1`=24439 AND `ConditionValue2`=1 AND `ConditionValue3`=0;
UPDATE `conditions` SET `SourceGroup`=0 WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=57402;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry` IN (43891,43789);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=43892;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(17, 0, 43891, 0, 0, 29, 0, 24439, 1, 0, 0, 0, 0, '', 'Spell Drop-Off Periodic targets npc Sack of Relics'),
(17, 0, 43789, 0, 0, 31, 0, 3, 24439, 0, 0, 0, 0, '', 'Spell Grappling Beam targets npc Sack of Relics'),
(13, 1, 43892, 0, 0, 31, 0, 3, 24439, 0, 0, 0, 0, '', 'Spell Steel Gate Drop Off Check targets npc Sack of Relics');
-- Sleeping Giants A:11432 H:11433
SET @ENTRY    := 24669; -- Dormant Vrykul
SET @ITEM     := 34083; -- Awakening Rod

DELETE FROM `conditions` WHERE `SourceEntry`=@ITEM;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,0,@ITEM,0,24,1,@ENTRY,0,0,'','Awakening Rod target only Dormant Vrykul');

DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'Interference with the wakening ritual causes the vrykul to die.',16,0,100,0,0,0,'Dormant Vrykul emote text'),
(@ENTRY,0,1,'The vrykul dies from being awakened improperly.',16,0,100,0,0,0,'Dormant Vrykul emote text'),
(@ENTRY,0,2,'The incorrect application of the awakening rod causes the dormant vrykul to expire.',16,0,100,0,0,0,'Dormant Vrykul emote text');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100) AND `source_type` IN (0,9);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,44261,0,0,0,5,53,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Dormant Vrykul - On Spellhit - Emote visual - Self'),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,80,@ENTRY*100,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,' Dormant Vrykul - On Link - Start Action Script'),
--
(@ENTRY*100,9,0,0,0,0,100,0,300,300,300,300,1,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,' Dormant Vrykul - On Script - Emote text  Invoker'),
(@ENTRY*100,9,1,0,0,0,100,0,2000,2000,2000,2000,33,24669,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,' Dormant Vrykul - On Script - Kill credit Invoker'),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,' Dormant Vrykul - On Script - Die'),
(@ENTRY*100,9,3,0,0,0,100,0,0,0,0,0,41,4500,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Dormant Vrykul - On Script  Despawn');
-- Proper condition for spell
DELETE FROM `conditions` WHERE `SourceEntry`=34083; 
DELETE FROM `conditions` WHERE `SourceEntry`=50165; 
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(17, 0, 50165, 0, 0, 31, 1, 3, 24669, 0, 0, 173, 0, '', 'Awakening Rod target limit to Dormant Vrykul');
UPDATE `smart_scripts` SET `target_type`=23 WHERE `entryorguid`=30468 AND `source_type`=0 AND `id`=2 AND `link`=0;
-- Cannot Reproduce (13320,13355)
-- Retest Now (13321,13322,13356,13357)

SET @NPC_BLUE_KC      := 32242; -- Blue Sample KC Bunny
SET @NPC_GREEN_KC     := 32244; -- Green Sample KC Bunny
SET @NPC_DARK_KC      := 32245; -- Dark Sample KC Bunny
SET @SPELL_COLLECT    := 60256; -- Collect Sample
SET @SPELL_WRITHING   := 60310; -- Throw Writhing Mass
SET @NPC_MASS_KC      := 32266; -- Writhing Mass KC Bunny
SET @AURA_DISCERNMENT := 60311; -- Dark Discernment
SET @ITEM_ESSENCE     := 44301; -- Tainted Essence

UPDATE `creature_template` SET `AIName`='SmartAI',`flags_extra`=128 WHERE `entry` IN (@NPC_BLUE_KC,@NPC_GREEN_KC,@NPC_DARK_KC);
UPDATE `creature` SET `MovementType`=0 WHERE `id` IN (@NPC_BLUE_KC,@NPC_GREEN_KC,@NPC_DARK_KC);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_BLUE_KC,@NPC_GREEN_KC,@NPC_DARK_KC) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_BLUE_KC,0,0,0,8,0,100,0,@SPELL_COLLECT,0,0,0,33,@NPC_BLUE_KC,0,0,0,0,0,7,0,0,0,0,0,0,0,"Blue Sample KC Bunny - On spellhit - Killed moster credit"),
(@NPC_BLUE_KC,0,1,0,8,0,100,0,@SPELL_WRITHING,0,0,0,33,@NPC_MASS_KC,0,0,0,0,0,7,0,0,0,0,0,0,0,"Blue Sample KC Bunny - On spellhit - Killed moster credit"),
--
(@NPC_GREEN_KC,0,0,0,8,0,100,0,@SPELL_COLLECT,0,0,0,33,@NPC_GREEN_KC,0,0,0,0,0,7,0,0,0,0,0,0,0,"Green Sample KC Bunny - On spellhit - Killed moster credit"),
(@NPC_GREEN_KC,0,1,0,8,0,100,0,@SPELL_WRITHING,0,0,0,33,@NPC_MASS_KC,0,0,0,0,0,7,0,0,0,0,0,0,0,"Green Sample KC Bunny - On spellhit - Killed moster credit"),
--
(@NPC_DARK_KC,0,0,0,8,0,100,0,@SPELL_COLLECT,0,0,0,33,@NPC_DARK_KC,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dark Sample KC Bunny - On spellhit - Killed moster credit"),
(@NPC_DARK_KC,0,1,0,8,0,100,0,@SPELL_WRITHING,0,0,0,33,@NPC_MASS_KC,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dark Sample KC Bunny - On spellhit - Killed moster credit");

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (32290,32289);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (32290,32289) AND `source_type`= 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(32289, 0, 0, 0, 0, 0, 100, 0, 0, 0, 7000, 9000, 11, 34359, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Damned Apothecary - IC - Cast Fire Breath Potion (Self)'),
(32289, 0, 1, 0, 2, 0, 100, 0, 30, 50, 60000, 60000, 11, 17534, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Damned Apothecary - On between 30 and 50% HP - Cast Healing Potion (Self)'),
--
(32290, 0, 0, 0, 0, 0, 100, 0, 0, 2000, 3000, 10000, 11, 60846, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cultist Alchemist - IC - Cast Corrosive Vial');


DELETE FROM `conditions` WHERE `SourceEntry` IN (@SPELL_COLLECT,@SPELL_WRITHING) AND `SourceTypeOrReferenceId`=13;
DELETE FROM `conditions` WHERE `SourceEntry`=@ITEM_ESSENCE AND `SourceTypeOrReferenceId`=1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,@SPELL_COLLECT,0,0,31,0,3,@NPC_BLUE_KC,0,0,0,'','Spell target creature'),
(13,1,@SPELL_COLLECT,0,1,31,0,3,@NPC_GREEN_KC,0,0,0,'','Spell target creature'),
(13,1,@SPELL_COLLECT,0,2,31,0,3,@NPC_DARK_KC,0,0,0,'','Spell target creature'),
--
(13,1,@SPELL_WRITHING,0,0,31,0,3,@NPC_BLUE_KC,0,0,0,'','Spell target creature'),
(13,1,@SPELL_WRITHING,0,1,31,0,3,@NPC_GREEN_KC,0,0,0,'','Spell target creature'),
(13,1,@SPELL_WRITHING,0,2,31,0,3,@NPC_DARK_KC,0,0,0,'','Spell target creature'),

-- Tainted Essence drops only if player has aura
(1,32236,@ITEM_ESSENCE,0,0,1,0,@AURA_DISCERNMENT,0,0,0,0,'','Loot requires aura'),
(1,32259,@ITEM_ESSENCE,0,0,1,0,@AURA_DISCERNMENT,0,0,0,0,'','Loot requires aura'),
(1,32262,@ITEM_ESSENCE,0,0,1,0,@AURA_DISCERNMENT,0,0,0,0,'','Loot requires aura'),
(1,32268,@ITEM_ESSENCE,0,0,1,0,@AURA_DISCERNMENT,0,0,0,0,'','Loot requires aura'),
(1,32276,@ITEM_ESSENCE,0,0,1,0,@AURA_DISCERNMENT,0,0,0,0,'','Loot requires aura'),
(1,32279,@ITEM_ESSENCE,0,0,1,0,@AURA_DISCERNMENT,0,0,0,0,'','Loot requires aura'),
(1,32289,@ITEM_ESSENCE,0,0,1,0,@AURA_DISCERNMENT,0,0,0,0,'','Loot requires aura'),
(1,32290,@ITEM_ESSENCE,0,0,1,0,@AURA_DISCERNMENT,0,0,0,0,'','Loot requires aura'),
(1,32297,@ITEM_ESSENCE,0,0,1,0,@AURA_DISCERNMENT,0,0,0,0,'','Loot requires aura');
UPDATE `creature` SET `spawndist`=0 WHERE `id` IN (32242,32244,32245);
SET @NPC_BLUE_KC      := 32242; -- Blue Sample KC Bunny
SET @NPC_GREEN_KC     := 32244; -- Green Sample KC Bunny
SET @NPC_DARK_KC      := 32245; -- Dark Sample KC Bunny
SET @SPELL_COLLECT    := 60256; -- Collect Sample
SET @SPELL_WRITHING   := 60310; -- Throw Writhing Mass
SET @NPC_MASS_KC      := 32266; -- Writhing Mass KC Bunny
SET @ITEM_ESSENCE     := 44301; -- Tainted Essence

UPDATE `creature_template` SET `AIName`='SmartAI',`flags_extra`=128 WHERE `entry` IN (@NPC_BLUE_KC,@NPC_GREEN_KC,@NPC_DARK_KC);
UPDATE `creature` SET `MovementType`=0 WHERE `id` IN (@NPC_BLUE_KC,@NPC_GREEN_KC,@NPC_DARK_KC);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_BLUE_KC,@NPC_GREEN_KC,@NPC_DARK_KC) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_BLUE_KC,0,0,0,8,0,100,0,@SPELL_COLLECT,0,0,0,33,@NPC_BLUE_KC,0,0,0,0,0,7,0,0,0,0,0,0,0,"Blue Sample KC Bunny - On spellhit - Killed moster credit"),
(@NPC_BLUE_KC,0,1,2,8,0,100,0,@SPELL_WRITHING,0,0,0,33,@NPC_MASS_KC,0,0,0,0,0,7,0,0,0,0,0,0,0,"Blue Sample KC Bunny - On spellhit - Killed moster credit"),
(@NPC_BLUE_KC,0,2,0,61,0,100,0,0,0,0,0,11,60505,0,0,0,0,0,7,0,0,0,0,0,0,0,"Blue Sample KC Bunny - On Link - Cast Fury of the Fallen Cultist to Invoker"),
--
(@NPC_GREEN_KC,0,0,0,8,0,100,0,@SPELL_COLLECT,0,0,0,33,@NPC_GREEN_KC,0,0,0,0,0,7,0,0,0,0,0,0,0,"Green Sample KC Bunny - On spellhit - Killed moster credit"),
(@NPC_GREEN_KC,0,1,2,8,0,100,0,@SPELL_WRITHING,0,0,0,33,@NPC_MASS_KC,0,0,0,0,0,7,0,0,0,0,0,0,0,"Green Sample KC Bunny - On spellhit - Killed moster credit"),
(@NPC_GREEN_KC,0,2,0,61,0,100,0,0,0,0,0,11,60506,0,0,0,0,0,7,0,0,0,0,0,0,0,"Green Sample KC Bunny - On Link - Cast Blood of the Fallen Cultist to Invoker"),
--
(@NPC_DARK_KC,0,0,0,8,0,100,0,@SPELL_COLLECT,0,0,0,33,@NPC_DARK_KC,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dark Sample KC Bunny - On spellhit - Killed moster credit"),
(@NPC_DARK_KC,0,1,2,8,0,100,0,@SPELL_WRITHING,0,0,0,33,@NPC_MASS_KC,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dark Sample KC Bunny - On spellhit - Killed moster credit"),
(@NPC_DARK_KC,0,2,0,61,0,100,0,0,0,0,0,11,60504,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dark Sample KC Bunny - On Link - Cast Agony of the Fallen Cultist to Invoker");
-- Out of Body Experience (12327)
SET @CGUID                  = 142712;   -- 5 required
SET @ARUGAL                 = 27620;    -- Shade of Arugal
SET @VALANAR                = 27619;    -- Valanar
SET @THERALDIS              = 27624;    -- Theraldis
SET @KELESETH               = 27618;    -- Keleseth
SET @ATHERANN               = 27616;    -- Atherann
SET @SPELL_OOBE             = 49097;    -- Out of Body Experience Invisibility + Detection + Teleport Silverpine
SET @SPELL_TELEPORT_BACK    = 49098;    -- Grizzly Hills - Quest - Arugal Teleport Back
SET @SPELL_EVENT_CHANNEL    = 49128;    -- Arugal Event Channel
SET @SPELL_CREDIT           = 49131;    -- Out of Body Experience Quest Credit
SET @TRIGGER                =  4990;    -- Areatrigger

DELETE FROM `creature` WHERE `id` IN (@ARUGAL,@VALANAR,@THERALDIS,@KELESETH,@ATHERANN);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`,  `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@CGUID+0,@ARUGAL,0,1,1,0,0,-463.526,1499.51,20.4721,1.55035,300,0,0,10635,0,0,0,0,0),
(@CGUID+1,@ATHERANN,0,1,1,0,0,-458.712,1504.8,16.9815,3.93558,300,0,0,29820,0,0,0,0,0),
(@CGUID+2,@KELESETH,0,1,1,0,0,-471.433,1500.51,18.4603,0.024287,300,0,0,28830,0,0,0,0,0),
(@CGUID+3,@VALANAR,0,1,1,0,0,-462.81,1491.7,17.2292,1.65734,300,0,0,96100,3309,0,0,0,0),
(@CGUID+4,@THERALDIS,0,1,1,0,0,-472.925,1495.71,18.3354,0.577431,300,0,0,28830,0,0,0,0,0);

-- Also serves as a fail safe, if you accidently remove the aura you will be prompted to a credit.
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`= -@SPELL_OOBE;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(-@SPELL_OOBE,@SPELL_TELEPORT_BACK,0,'When Out of Body Experience expires cast Arugal Teleport Back');

DELETE FROM `spell_target_position` WHERE `id` IN (@SPELL_OOBE,@SPELL_TELEPORT_BACK);
INSERT INTO `spell_target_position` (`id`, `effIndex`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES 
(@SPELL_OOBE,1,0,-481.041992,1492.949951,19.932100,0), -- Silverpine Forrest
(@SPELL_TELEPORT_BACK,1,571,3842.16,-3428.43,293.105,1.8776);   -- Grizzly Hills

DELETE FROM `creature_text` WHERE `entry` IN (@VALANAR,@THERALDIS);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@VALANAR,0,0,'Rise, Arugal! The power of the Lich King commands you!',12,0,100,0,0,0,'Prince Valanar - Silverpine'),
(@THERALDIS,0,0,'Yes... he shall suit our needs perfectly. Have him sent to Solstice Village when you''re ready. Arthas will not be pleased if we fall behind schedule.',12,0,100,0,0,0,'Prince Theraldis - Silverpine');

-- Detection Auras
DELETE FROM `creature_template_addon` WHERE `entry` IN (@ARUGAL,@VALANAR,@THERALDIS,@KELESETH,@ATHERANN);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@ARUGAL,0,0,0,0,0,'49130'),
(@ATHERANN,0,0,0,0,0,'49130'),
(@KELESETH,0,0,0,0,0,'49130'),
(@VALANAR,0,0,0,0,0,'49130'),
(@THERALDIS,0,10721,0,0,0,'49130');

DELETE FROM `areatrigger_scripts` WHERE `entry`=@TRIGGER;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES (@TRIGGER,'SmartTrigger');

UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16, `AIName`='SmartAI' ,`unit_flags`=`unit_flags`|2, `InhabitType` = IF (`entry` =@ARUGAL, 4, `InhabitType`) WHERE `entry` IN (@ARUGAL,@VALANAR,@THERALDIS,@KELESETH,@ATHERANN);

DELETE FROM `smart_scripts` WHERE `source_type` = 2 AND `entryorguid`= @TRIGGER;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (@ARUGAL,@VALANAR,@THERALDIS,@KELESETH,@ATHERANN);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` =@ARUGAL*100;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@TRIGGER,2,0,0,46,0,100,0,@TRIGGER,0,0,0,45,0,1,0,0,0,0,10,@CGUID+0,0,0,0,0,0,0,'On Trigger - Set data 0 1 Shade of Arugal'),
--
(@ARUGAL,0,0,0,11,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shade of Arugal - on Spawn - React State Passive'),
(@ARUGAL,0,1,0,38,0,100,0,0,1,0,0,80,@ARUGAL*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shade of Arugal - on Data set 0 1 - Run script'),
--
(@VALANAR,0,0,0,11,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Valanar - on Spawn - react Passive'),
(@VALANAR,0,1,0,1,0,100,0,0,0,0,0,11,@SPELL_EVENT_CHANNEL,2,0,0,0,0,11,@ARUGAL,20,0,0,0,0,0,'Valanar - OOC - cast Arugal Event Channel'),
(@VALANAR,0,2,0,38,0,100,0,0,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Valanar - on Data set 0 1 - Say text'),
--
(@KELESETH,0,0,0,11,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keleseth - on Spawn - react Passive'),
(@KELESETH,0,1,0,1,0,100,0,0,0,0,0,11,@SPELL_EVENT_CHANNEL,2,0,0,0,0,11,@ARUGAL,20,0,0,0,0,0,'Keleseth - OOC - cast Arugal Event Channel'),
--
(@ATHERANN,0,0,0,11,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Atherann - on Spawn - react Passive'),
(@ATHERANN,0,1,0,1,0,100,0,0,0,0,0,11,@SPELL_EVENT_CHANNEL,2,0,0,0,0,11,@ARUGAL,20,0,0,0,0,0,'Atherann - OOC - cast Arugal Event Channel'),
--
(@THERALDIS,0,0,0,11,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Theraldis - on Spawn - react Passive'),
(@THERALDIS,0,1,0,38,0,100,0,0,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Theraldis - on Data set 0 1 - Say text'),
--
(@ARUGAL*100,9,0,0,0,0,100,1,5000,5000,0,0,45,0,1,0,0,0,0,19,@VALANAR,20,0,0,0,0,0,'On script - set Data 0 1 Prince Valanar'), -- prevent multiple events during an event
(@ARUGAL*100,9,1,0,0,0,100,0,8000,8000,0,0,45,0,1,0,0,0,0,19,@THERALDIS,20,0,0,0,0,0,'On script - set Data 0 1 Prince Theraldis'),
(@ARUGAL*100,9,2,0,0,0,100,0,0,0,0,0,11,@SPELL_CREDIT,2,0,0,0,0,17,0,30,0,0,0,0,0,'On script - cast Out of Body Experience Quest Credit'),
(@ARUGAL*100,9,3,0,0,0,100,0,0,0,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On script - call script reset');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=@SPELL_EVENT_CHANNEL;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=@TRIGGER;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13,1,@SPELL_EVENT_CHANNEL,0,0,31,0,3,@ARUGAL,0,0,0,'','Arugal Event Channel targets Shade of Arugal'),
(22,1,@TRIGGER,2,0,1,0,@SPELL_OOBE,0,0,0,0,'','SAI areatrigger 4990 triggers only if player has aura Out of Body Experience'),
(22,1,@TRIGGER,2,0,9,0,12327,0,0,0,0,'','SAI areatrigger 4990 triggers only if player has taken Quest Out of Body Experience');
-- Ribbly Screwspigot 9543
SET @GOSSIP			:= 1970;
SET @RIBBLY			:= 9543;
SET @CRONY			:= 10043;

DELETE FROM `creature_equip_template` WHERE `entry` =@RIBBLY;
INSERT INTO `creature_equip_template` (`entry`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(@RIBBLY, 5280, 0, 0); -- Ribbly Screwspigot

DELETE FROM `creature_template_addon` WHERE `entry` =@RIBBLY;
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(@RIBBLY, 0, 0x0, 0x1, ''); -- Ribbly Screwspigot

DELETE FROM `gossip_menu` WHERE `entry` =@GOSSIP;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(@GOSSIP, 2643);

DELETE FROM `gossip_menu_option` WHERE `menu_id` =@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(@GOSSIP,0,0, 'You''re good for nothing, Ribbly. It''s time to pay for your wickedness!.', 1, 1, 0, 0, 0, 0, '');

UPDATE `creature_template` SET `AIName`= 'SmartAI',`gossip_menu_id`=@GOSSIP ,`npcflag`=1, `speed_walk`=1.142857, `speed_run`=1, `rangeattacktime`=2000, `unit_flags`=32832, `dynamicflags`=0 WHERE `entry`=@RIBBLY;
DELETE FROM `smart_scripts` WHERE `entryorguid` =@RIBBLY;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@RIBBLY, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 2, 735, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ribbly Screwspigot - On Reset - Set Default Faction'),
(@RIBBLY, 0, 1, 2, 62, 0, 100, 0, @GOSSIP, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Ribbly Screwspigot - On Gossip Select - Close Menu'),
(@RIBBLY, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 2, 736, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ribbly Screwspigot - Linked with Previous Event - Set Hostile'),
(@RIBBLY, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 5000, 0, 0, 0, 11, @CRONY, 10, 100, 0, 0, 0, 0, 'Ribbly Screwspigot - Linked with Previous Event - Send Data 1 1 to Ribblys Cronies'),
(@RIBBLY, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Ribbly Screwspigot - Linked with Previous Event - Attack Invoker'),
(@RIBBLY, 0, 5, 0, 4 , 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ribbly Screwspigot - On Aggro - Say line 0'),
(@RIBBLY, 0, 6, 0, 0 , 0, 100, 0, 4000, 12000, 4000, 12000, 11, 12540, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Ribbly Screwspigot - IC - Cast Gouge'),
(@RIBBLY, 0, 7, 0, 0 , 0, 100, 0, 5000, 14000, 5000, 14000, 11, 9080 , 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Ribbly Screwspigot - IC - Cast Hamstring');

DELETE FROM `creature_text` WHERE `entry` =@RIBBLY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@RIBBLY, 0, 0, 'No! Get away from me! Help!', 12, 0, 100, 0, 0, 0, 'Ribbly Screwspigot');

UPDATE `creature_template` SET `AIName`= 'SmartAI',`unit_flags`=576 WHERE `entry`= @CRONY;
DELETE FROM `smart_scripts` WHERE `entryorguid` =@CRONY;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@CRONY, 0, 0, 0, 25,  0, 100, 0, 0, 0, 0, 0, 2, 735, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ribblys Crony - On Reset - Set Default Faction'),
(@CRONY, 0, 1, 2, 38,  0, 100, 0, 1, 1, 0, 0, 2, 736, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ribblys Crony - On Data Set 1 1 - Set Hostile'),
(@CRONY, 0, 2, 0, 61,  0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 18, 40, 0, 0, 0, 0, 0, 0, 'Ribblys Crony - Linked with Previous Event - Attack'),
(@CRONY, 0, 3, 0, 0,  0, 100, 0, 5000, 14000, 5000, 14000, 11, 15692, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Ribblys Crony - IC - Cast Eviscerate'),
(@CRONY, 0, 4, 0, 0,  0, 100, 0, 2000, 11000, 2000, 11000, 11, 15581, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Ribblys Crony - IC - Cast Sinister Strike'),
(@CRONY, 0, 5, 0, 0,  0, 100, 0, 8000, 18000, 8000, 18000, 11, 13298, 0, 0, 0, 0, 0, 2, 32, 0, 0, 0, 0, 0, 0, 'Ribblys Crony - IC - Cast Poison');
DELETE FROM `creature_equip_template` WHERE `entry` =9543;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES 
(9543, 1, 5280, 0, 0);
UPDATE `instance_template` SET `script`='instance_auchenai_crypts' WHERE `map`=558;
UPDATE `instance_template` SET `script`='instance_mana_tombs' WHERE `map`=557; 

DELETE FROM `spell_script_names` WHERE `spell_id` IN (33923, 38796, 33666, 38795, 39365);
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES
(33923, 'spell_murmur_sonic_boom'),
(38796, 'spell_murmur_sonic_boom'),
(33666, 'spell_murmur_sonic_boom_effect'),
(38795, 'spell_murmur_sonic_boom_effect'),
(39365, 'spell_murmur_thundering_storm');

DELETE FROM `creature_ai_scripts` WHERE `id`=1879605;
-- It Rolls Downhill (12673)
/*
-- Blight Geist
-- Emote ID: OneShotSpellCast (51)
-- Emote ID: OneShotAttack1H (36) -- WP 6174.282, -2017.246, 245.1156
*/
SET @TARGET         := 52247;   -- Target Crystal 
SET @CHARM          := 52252;   -- Charm Blight Geist
SET @CHARM_P        := 52244;   -- Charm Periodic
SET @EVIL_S         := 61456;   -- Evil Teleport
SET @GEIST          := 28750;   -- Blight Geist
SET @HARVEST        := 52245;   -- Harvest Blight Crystal
SET @CREDIT         := 52248;   -- Kill Credit - Blighted Geist
SET @BLIGHT1        := 190716;  -- Crystallized Blight
SET @BLIGHT2        := 190939;  -- Crystallized Blight
SET @BLIGHT3        := 190940;  -- Crystallized Blight
SET @RADIATION      := 52243;   -- Orange Radiation, Small

DELETE FROM `creature_text` WHERE `entry`=@GEIST;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@GEIST, 0, 1, 'Mphmm rmphhimm rrhumghph?', 12, 0, 100, 1, 0, 0, 'Blight Geist'),
(@GEIST, 0, 2, 'Mhrrumph rummrhum phurr!', 12, 0, 100, 1, 0, 0, 'Blight Geist');

DELETE FROM `creature_template_addon` WHERE `entry`=28750;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(28750,0,0,1,0, '');

UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=@HARVEST WHERE `entry`=@GEIST;
DELETE FROM `smart_scripts` WHERE `entryorguid`IN (@GEIST,@GEIST*100) AND `source_type`IN (0,9);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GEIST,0,0,1,8,0,100,0,@HARVEST,0,0,0,69,0,0,0,0,0,0,13,@BLIGHT1,5,30,0.0,0.0,0.0,0.0,'On Spellhit - Move to pos - Blight1'),
(@GEIST,0,1,0,61,0,100,0,0,0,0,0,80,@GEIST*100,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'On Spellhit - Move to pos - Blight1'),
--
(@GEIST,0,2,3,8,0,100,0,@HARVEST,0,0,0,69,0,0,0,0,0,0,13,@BLIGHT2,5,30,0.0,0.0,0.0,0.0,'On Spellhit - Move to pos - Blight1'),
(@GEIST,0,3,0,61,0,100,0,0,0,0,0,80,@GEIST*100,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'On Spellhit Move to pos - Blight2'),
--
(@GEIST,0,4,5,8,0,100,0,@HARVEST,0,0,0,69,0,0,0,0,0,0,13,@BLIGHT3,5,30,0.0,0.0,0.0,0.0,'On Spellhit - Move to pos - Blight1'),
(@GEIST,0,5,0,61,0,100,0,0,0,0,0,80,@GEIST*100,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'On Spellhit Move to pos - Blight3'),
--
(@GEIST*100,9,0,0,0,0,100,0,4000,4000,4000,4000,11,@TARGET,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,' - On Scrip - '),
(@GEIST*100,9,1,0,0,0,100,0,4000,4000,4000,4000,11,@EVIL_S,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,' - On Scrip - '),
(@GEIST*100,9,2,0,0,0,100,1,2000,2000,2000,2000,11,@CREDIT,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,' - On Scrip - '),
(@GEIST*100,9,3,0,0,0,100,0,1000,1000,1000,1000,69,0,0,0,0,0,0,1,0,0,0,6174.282, -2017.246, 245.1156,0.0,'On move inform 0 Cast credit'),
(@GEIST*100,9,4,0,0,0,100,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'On link - Despawn - Self'),
--
(@GEIST,0,6,0,8,0,100,0,@CHARM_P,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'On Spellhit - Say Random'),
(@GEIST,0,7,0,8,0,100,0,@CHARM,0,0,0,11,@RADIATION,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'On Spellhit - Say Random');
--
DELETE FROM `conditions` WHERE `SourceEntry`=@GEIST;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, @GEIST, 1, 0, 30, 1, @BLIGHT1, 1, 0, 1, 0, 0, '', 'Execute SAI 0 only if GObject is in range'),
(22, 3, @GEIST, 1, 0, 30, 1, @BLIGHT2, 1, 0, 1, 0, 0, '', 'Execute SAI 2 only if GObject is in range'),
(22, 4, @GEIST, 1, 0, 30, 1, @BLIGHT3, 1, 0, 1, 0, 0, '', 'Execute SAI 6 only if GObject is in range');
UPDATE `smart_scripts` SET `comment`='Blight Geist - On Spellhit - Go to PoS GO' WHERE  `entryorguid`=28750 AND `source_type`=0 AND `id`=0 AND `link`=1;
UPDATE `smart_scripts` SET `comment`='Blight Geist - On Link - Start Action Script' WHERE  `entryorguid`=28750 AND `source_type`=0 AND `id`=1 AND `link`=0;
UPDATE `smart_scripts` SET `comment`='Blight Geist - On Spellhit - Go to PoS GO' WHERE  `entryorguid`=28750 AND `source_type`=0 AND `id`=2 AND `link`=3;
UPDATE `smart_scripts` SET `comment`='Blight Geist - On Link - Start Action Script' WHERE  `entryorguid`=28750 AND `source_type`=0 AND `id`=3 AND `link`=0;
UPDATE `smart_scripts` SET `comment`='Blight Geist - On Spellhit - Go to PoS GO' WHERE  `entryorguid`=28750 AND `source_type`=0 AND `id`=4 AND `link`=5;
UPDATE `smart_scripts` SET `comment`='Blight Geist - On Link - Start Action Script' WHERE  `entryorguid`=28750 AND `source_type`=0 AND `id`=5 AND `link`=0;
UPDATE `smart_scripts` SET `comment`='Blight Geist  - On Spellhit - Say Random' WHERE  `entryorguid`=28750 AND `source_type`=0 AND `id`=6 AND `link`=0;
UPDATE `smart_scripts` SET `comment`='Blight Geist  - On Spellhit - Add Aura Self' WHERE  `entryorguid`=28750 AND `source_type`=0 AND `id`=7 AND `link`=0;
UPDATE `smart_scripts` SET `comment`='Blight Geist  - On Script - Cast Spell Target' WHERE  `entryorguid`=2875000 AND `source_type`=9 AND `id`=0 AND `link`=0;
UPDATE `smart_scripts` SET `comment`='Blight Geist  - On Script - Cast Spell Evil Teleport' WHERE  `entryorguid`=2875000 AND `source_type`=9 AND `id`=1 AND `link`=0;
UPDATE `smart_scripts` SET `comment`='Blight Geist  - On Script - Cast Credit' WHERE  `entryorguid`=2875000 AND `source_type`=9 AND `id`=2 AND `link`=0;
UPDATE `smart_scripts` SET `comment`='Blight Geist  - On Script - Go to Teleport Pad' WHERE  `entryorguid`=2875000 AND `source_type`=9 AND `id`=3 AND `link`=0;
UPDATE `smart_scripts` SET `comment`='Blight Geist  - On Script - Despawn' WHERE  `entryorguid`=2875000 AND `source_type`=9 AND `id`=4 AND `link`=0;
UPDATE `reference_loot_template` SET `groupid`=2 WHERE  `entry`=25019; -- Grand Warlock Nethekurse (Heroic)
UPDATE `reference_loot_template` SET `groupid`=2 WHERE  `entry`=25020; -- Warbringer O'mrogg (Heroic)

UPDATE `creature_loot_template` SET `groupid`=2 WHERE  `entry`=16809 AND `item`=25020;
UPDATE `creature_loot_template` SET `groupid`=2 WHERE  `entry`=16807 AND `item`=25019;

-- Zero Tolerance (12686) & Hazardous Materials, these are a 2 in 1 quest
SET @DARMUK    := 28793; -- Darmuk
SET @SERVANT   := 28802; -- Servant of Drakuru
SET @HAND      := 28805; -- Hand of Drakuru

/*
Reference to GO text 
-- Scourge Disguise Failing! Run for cover!
-- Scourge Disguise Failing! Find a safe place!
-- Scourge Disguise Failing! Hide quickly!
*/
-- Darmuk
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@DARMUK;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@DARMUK;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@DARMUK,0,0,0,0,0,100,0,7000,13000,12000,17000,11,54386,0,0,0,0,0,1,0,0,0,0,0,0,0,'Darmuk - IC - Cast Darmuk''s Vigilance'),
(@DARMUK,0,1,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Darmuk - On Aggro - Say1');

DELETE FROM `creature_text` WHERE `entry`=@DARMUK;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@DARMUK, 0, 1, 'Your disguise doesn''t fool me, fleshling! Your defeat will please Drakuru!', 12, 0, 100, 1, 0, 0, 'Darmuk');

-- Servant of Drakuru
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@SERVANT;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@SERVANT;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SERVANT,0,0,0,0,0,100,0,4000,4800,12000,14000,11,50361,0,0,0,0,0,2,0,0,0,0,0,0,0,'Servant of Drakuru - IC - Cast Rot Armor'),
(@SERVANT,0,1,0,29,0,100,1,0,0,0,0,36,@HAND,0,0,0,0,0,1,0,0,0,0,0,0,0,' Servant of Drakuru - On charm - Update entry Self');

-- Hand of Drakuru
UPDATE `creature_model_info` SET `bounding_radius`=1.24,`combat_reach`=4 WHERE `modelid`=26924;
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=52400,`spell2`=52401,`spell3`=52402, `minlevel`=75, `maxlevel`=75, `npcflag`=264, `mindmg`=194, `maxdmg`=283, `exp`=2, `attackpower`=432, `minrangedmg`=441, `maxrangedmg`=661 WHERE `entry`=@HAND;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@HAND;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@HAND,0,0,0,16,0,100,1,52390,1,2000,2000,36,@SERVANT,0,0,0,0,0,1,0,0,0,0,0,0,0,' Hand of Drakuru - On aura remove - Update entry');

-- Gameobject, relating to Hazardous Materials.
SET @OGUID = 9246;
DELETE FROM `gameobject` WHERE `id`=190720;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+0, 190720, 571, 1, 1, 6242.536, -1959.009, 417.684, 0.4712385, 0, 0, 0, 1, 120, 255, 1), -- Harvested Blight Crystal (Area: 0)
(@OGUID+1, 190720, 571, 1, 1, 6255.469, -1972.384, 417.7136, 0.3316107, 0, 0, 0, 1, 120, 255, 1), -- Harvested Blight Crystal (Area: Reliquary of Pain)
(@OGUID+2, 190720, 571, 1, 1, 6245.086, -2010.295, 417.5486, 4.450591, 0, 0, 0, 1, 120, 255, 1), -- Harvested Blight Crystal (Area: Reliquary of Pain)
(@OGUID+3, 190720, 571, 1, 1, 6208.02, -2098.342, 417.5984, 0.6981314, 0, 0, 0, 1, 120, 255, 1), -- Harvested Blight Crystal (Area: Reliquary of Pain)
(@OGUID+4, 190720, 571, 1, 1, 6182.603, -2088.755, 417.549, 2.530723, 0, 0, 0, 1, 120, 255, 1); -- Harvested Blight Crystal (Area: Reliquary of Pain)
-- Sabotage (12676)
SET @ENTRY      := 28780; -- Explosive Charges Bunny
SET @GOB        := 190731; -- Scourgewagon
SET @DETONATE   := 52322; -- Detonate Charges
SET @EX1        := 52325; -- Explode Scourgewagon:Roller
SET @EX2        := 52329; -- Explode Scourgewagon:Frame
SET @EX3        := 52330; -- Explode Scourgewagon:Grill
SET @EX4        := 52332; -- Explode Scourgewagon:Wheel
SET @CREDIT     := 52346; -- Credit

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=@DETONATE;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(@DETONATE,@EX1,1,'Explode Scourgewagon'),
(@DETONATE,@EX2,1,'Explode Scourgewagon'),
(@DETONATE,@EX3,1,'Explode Scourgewagon'),
(@DETONATE,@EX4,1,'Explode Scourgewagon');

-- Explosive Charges Bunny
SET @SOURCETYPE :=0;
UPDATE `creature_template` SET `AIName`='SmartAI',`flags_extra`=`flags_extra`|128 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,80,@ENTRY*100,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Explosive Charges Bunny - On just summoned - Run script'),
--
(@ENTRY*100,9,0,0,0,0,100,0,2000,2000,2000,2000,11,@DETONATE,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Explosive Charges Bunny - On Timed Script - Cast detonate'),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,11,@CREDIT,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,'Explosive Charges Bunny - On Timed Script - Cast credit ');
UPDATE `instance_template` SET `script`='instance_vault_of_archavon' WHERE `map`=624;
ALTER TABLE `reputation_reward_rate` ADD `quest_repeteable_rate` FLOAT NOT NULL DEFAULT '1' AFTER `quest_weekly_rate`;
UPDATE `reputation_reward_rate` SET `quest_repeteable_rate`=3 WHERE `faction`=970; -- Sporegar, 3x on repeteable quests
ALTER TABLE `reputation_reward_rate` CHANGE `quest_repeteable_rate` `quest_repeatable_rate` FLOAT NOT NULL DEFAULT '1';
DELETE FROM `creature_text` WHERE `entry` IN (24068, 23954, 23980);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(24068, 0, 0, 'Ingvar! Your pathetic failure will serve as a warning to all... you are damned! Arise and carry out the master''s will!', 14, 0, 100, 0, 0, 13754, 'Annhylde the Caller to Ingvar the Plunderer'),

(23954, 0, 0, 'I''ll paint my face with your blood!', 14, 0, 100, 0, 0, 13207, 'Ingvar the Plunderer - SAY_AGGRO_1'),
(23954, 1, 0, 'Mjul orm agn gjor!', 14, 0, 100, 0, 0, 13212, 'Ingvar the Plunderer - SAY_SLAY_1'),
(23954, 2, 0, 'My life for the... death god!', 14, 0, 100, 0, 0, 13213, 'Ingvar the Plunderer - SAY_DEATH_1'),

(23954, 3, 0, 'I return! A second chance to carve your skull!', 14, 0, 100, 0, 0, 13209, 'Ingvar the Plunderer - SAY_AGGRO_2'),
(23954, 4, 0, 'I am a warrior born!', 14, 0, 100, 0, 0, 13214, 'Ingvar the Plunderer - SAY_SLAY_2'),
(23954, 5, 0, 'No! I can do... better! I can...', 14, 0, 100, 0, 0, 13211, 'Ingvar the Plunderer - SAY_DEATH_2');

UPDATE `creature_template` SET `lootid`=`entry` WHERE entry IN (23954, 31673);
UPDATE `creature_template` SET `lootid`=0 WHERE entry IN (23980, 31674);

UPDATE `creature_loot_template` SET `entry`=23954 WHERE `entry`=23980;
UPDATE `creature_loot_template` SET `entry`=31673 WHERE `entry`=31674;
SET @CGUID := 53919; -- set by TDB team (8)

UPDATE `creature_template` SET `faction_A`=35, `faction_H`=35, `rangeattacktime`=2000, `unit_flags`=32768 WHERE `entry`=30755;

DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+7;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 30755, 571, 1, 1, 5844.797, 479.632, 657.6495, 3.351032, 120, 0, 0), -- Kor'kron Reaver (Area: 4395)
(@CGUID+1, 30755, 571, 1, 1, 5848.494, 480.568, 657.6278, 3.368485, 120, 0, 0), -- Kor'kron Reaver (Area: 4395)
(@CGUID+2, 30755, 571, 1, 1, 5845.834, 475.8459, 657.7172, 3.298672, 120, 0, 0), -- Kor'kron Reaver (Area: 4395)
(@CGUID+3, 30755, 571, 1, 1, 5849.62, 476.4291, 657.7032, 3.222836, 120, 0, 0), -- Kor'kron Reaver (Area: 4395)
(@CGUID+4, 30352, 571, 1, 1, 5803.514, 494.7659, 657.2115, 5.54129, 120, 0, 0), -- Skybreaker Marine (Area: 4395)
(@CGUID+5, 30352, 571, 1, 1, 5805.08, 492.9698, 657.2003, 5.584598, 120, 0, 0), -- Skybreaker Marine (Area: 4395)
(@CGUID+6, 30352, 571, 1, 1, 5801.245, 492.336, 657.3757, 5.602507, 120, 0, 0), -- Skybreaker Marine (Area: 4395)
(@CGUID+7, 30352, 571, 1, 1, 5802.888, 490.7988, 657.3538, 5.602507, 120, 0, 0); -- Skybreaker Marine (Area: 4395)
-- Prepping the Speech
UPDATE `quest_template` SET `Details` = 'High Tinker Mekkatorque asked me to write a speech that he could give before the battle starts, but I just can''t tell which draft is good and which ones just stink.$b$bCould you try some of them out on the local gnome residents? This device creates an image of Mekkatorque saying a few lines from each of my speech drafts.$b$bLet me know which one works, okay?', `RequestItemsText` = 'Let me know which one works, okay?', `OfferRewardText` = 'Oh my. Their reactions were that different?$b$bNot completely what I was expecting, but I think I have a speech that will do.$b$bJust let me find where I put it...' WHERE `id`=25283;
-- Fix Q I'm Not Dead Yet! (13229 / 13221) by Rohlik
UPDATE `creature_template` SET `AIName` = 'SmartAI', `InhabitType` = 1 WHERE `entry` = 31279;
UPDATE `quest_template` SET `SpecialFlags` = 2 WHERE `Id` IN (13221, 13229);

DELETE FROM `db_script_string` WHERE `entry` IN (2000000507,2000000508);
DELETE FROM `waypoint_data` where id=3127900; -- We delete old WP data from DB
DELETE FROM `waypoint_scripts` WHERE id=31279;

-- Text for NPC Father Kamaros
DELETE from `creature_text` where `entry`=31279 AND `groupid` IN (1, 2, 3, 4);
INSERT INTO `creature_text` (`entry`, `groupid`, `text`, `type`, `probability`, `comment`) VALUES
(31279, 1, 'The Light''s blessing be upon you for aiding me in my time of need, $n.', 12, 100, 'Father Kamaros'),
(31279, 2, 'I''ve had my fill of this place. Let us depart.', 12, 100, 'Father Kamaros'),
(31279, 3, 'You must tell my brothers that live.', 12, 100, 'Father Kamaros'),
(31279, 4, 'I have you to thank for my life. I will return to my comrades and spread word of your bravery. Fight the Scourge with all the strength you can muster, and we will be by your side.', 12, 100, 'Father Kamaros');

-- SAI
DELETE FROM `smart_scripts` WHERE (`entryorguid`=31279 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(31279, 0, 0, 0, 4, 0, 100, 1, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Set Phase 1 on Aggro'),
(31279, 0, 1, 0, 4, 1, 100, 1, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Stop Moving on Aggro'),
(31279, 0, 2, 0, 4, 1, 100, 1, 0, 0, 0, 0, 11, 25054, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cast bolt on Aggro'),
(31279, 0, 3, 0, 9, 1, 100, 0, 0, 40, 3400, 4700, 11, 25054, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cast bolt'),
(31279, 0, 4, 0, 9, 1, 100, 0, 40, 100, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Start Moving when not in bolt Range'),
(31279, 0, 5, 0, 9, 1, 100, 0, 10, 15, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Stop Moving at 15 Yards'),
(31279, 0, 6, 0, 9, 1, 100, 0, 0, 40, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Stop Moving when in bolt Range'),
(31279, 0, 7, 0, 3, 1, 100, 0, 0, 15, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Set Phase 2 at 15% Mana'),
(31279, 0, 8, 0, 3, 2, 100, 0, 0, 15, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Start Moving at 15% Mana'),
(31279, 0, 9, 0, 3, 2, 100, 0, 30, 100, 100, 100, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Set Phase 1 When Mana is above 30%'),
(31279, 0, 11, 0, 0, 1, 100, 0, 5000, 6200, 11700, 15600, 11, 17146, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Cast Shadow Word: Pain'),
(31279, 0, 12, 0, 2, 0, 100, 1, 0, 50, 0, 0, 11, 32595, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Cast Power Word: Shield at 50% HP'),
(31279, 0, 13, 14, 19, 0, 100, 0, 0, 0, 0, 0, 75, 58921, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Father Kamaros - On accept Q - Cast Power Word Fortitude'),
(31279, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 4000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Father Kamaros - On accept Q - Start talking'),
(31279, 0, 15, 0, 52, 0, 100, 0, 1, 31279, 0, 0, 1, 2, 1000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Father Kamaros - On accept Q - After 4 sec start talking again'),
(31279, 0, 16, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 2, 1000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Father Kamaros - On accept Q - After 4 sec start talking again'),
(31279, 0, 17, 0, 52, 0, 100, 0, 2, 31279, 0, 0, 53, 0, 31279, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 'Father Kamaros - After 5 sec - WP load'),
(31279, 0, 18, 0, 40, 0, 100, 0, 13, 0, 0, 0, 1, 3, 2900, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Father Kamaros - On last WP point - Say something'),
(31279, 0, 19, 0, 52, 0, 100, 0, 3, 31279, 0, 0, 1, 4, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Father Kamaros - On last WP point - Say something 2'),
(31279, 0, 20, 0, 52, 0, 100, 0, 4, 31279, 0, 0, 15, 13229, 0, 0, 0, 0, 0, 18, 30, 0, 0, 0, 0, 0, 0, 'Father Kamaros - On last WP point - Q complete(horde)'),
(31279, 0, 21, 0, 52, 0, 100, 0, 4, 31279, 0, 0, 15, 13221, 0, 0, 0, 0, 0, 18, 30, 0, 0, 0, 0, 0, 0, 'Father Kamaros - On last WP point - Q complete(ali)'),
(31279, 0, 22, 0, 52, 0, 100, 0, 4, 31279, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Father Kamaros - after final talking - despawn');

-- WP for NPC Father Kamaros
DELETE from `waypoints` where `entry`=31279;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(31279, 1,  6716.76, 3436.7,  682.197, 'Q I''m Not Dead Yet!'),
(31279, 2,  6724.09, 3433.56, 682.197, 'Q I''m Not Dead Yet!'),
(31279, 3,  6734.95, 3435.7,  681.87, 'Q I''m Not Dead Yet!'),
(31279, 4,  6766.36, 3464.42, 673.201, 'Q I''m Not Dead Yet!'),
(31279, 5,  6782.48, 3478.07, 674.097, 'Q I''m Not Dead Yet!'),
(31279, 6,  6789.64, 3484.14, 676.423, 'Q I''m Not Dead Yet!'),
(31279, 7,  6815.31, 3483.01, 685.829, 'Q I''m Not Dead Yet!'),
(31279, 9,  6875.41, 3479.14, 694.799, 'Q I''m Not Dead Yet!'),
(31279, 10, 6946.3,  3477.29, 708.832, 'Q I''m Not Dead Yet!'),
(31279, 11, 6980.65, 3468.12, 710.813, 'Q I''m Not Dead Yet!'),
(31279, 12, 7008.43, 3458.64, 696.751, 'Q I''m Not Dead Yet!'),
(31279, 13, 7042.92, 3438.07, 695.543, 'Q I''m Not Dead Yet!');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=1 AND `SourceGroup` IN (23980,31674,23954,31673);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(1,23954,43228,0,0,1,0,57940,0,0,0,0,0,'','Can loot Stone Keeper''s Shard only with aura Essence of Wintergrasp'),
(1,31673,43228,0,0,1,0,57940,0,0,0,0,0,'','Can loot Stone Keeper''s Shard only with aura Essence of Wintergrasp');
DELETE from `waypoints` where `entry`=31279;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(31279, 1,  6716.76, 3436.7,  682.197, 'Q I''m Not Dead Yet!'),
(31279, 2,  6724.09, 3433.56, 682.197, 'Q I''m Not Dead Yet!'),
(31279, 3,  6734.95, 3435.7,  681.87, 'Q I''m Not Dead Yet!'),
(31279, 4,  6766.36, 3464.42, 673.201, 'Q I''m Not Dead Yet!'),
(31279, 5,  6782.48, 3478.07, 674.097, 'Q I''m Not Dead Yet!'),
(31279, 6,  6789.64, 3484.14, 676.423, 'Q I''m Not Dead Yet!'),
(31279, 7,  6815.31, 3483.01, 685.829, 'Q I''m Not Dead Yet!'),
(31279, 8,  6875.41, 3479.14, 694.799, 'Q I''m Not Dead Yet!'),
(31279, 9, 6946.3,  3477.29, 708.832, 'Q I''m Not Dead Yet!'),
(31279, 10, 6980.65, 3468.12, 710.813, 'Q I''m Not Dead Yet!'),
(31279, 11, 7008.43, 3458.64, 696.751, 'Q I''m Not Dead Yet!'),
(31279, 12, 7042.92, 3438.07, 695.543, 'Q I''m Not Dead Yet!');
-- Fuel for the Fire (12690)
-- http://www.youtube.com/watch?v=3rC1yU1ytl8
SET @CREDIT             :=52590; -- Credit to Master
SET @CREDIT_MASTER      :=52587; -- Assign Kill Credit to Master
SET @TEXPLOSION         :=52565; -- Troll Explosion
SET @FFTF_EXPL          :=52575; -- Fuel for the Fire:Troll Explosion
SET @MEAT_EXPL          :=52578; -- Explode Troll:Meat
SET @BMEAT_EXPL         :=52580; -- Explode Troll:Bloody Meat
SET @SUICIDE_NL         :=51744; -- Suicide (No Log)
SET @DSC                :=28844; -- Drakkari Skullcrusher
SET @B_ABOM             :=28843; -- Bloated Abomination

DELETE FROM `spell_script_names` WHERE `spell_id`=52510;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(52510, 'spell_q12690_burst_at_the_seams');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@B_ABOM;
DELETE FROM `smart_scripts` WHERE entryorguid =@B_ABOM;

DELETE FROM `conditions` WHERE `SourceEntry`IN (52510);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 2, 52510, 0, 0, 31, 0, 3, 28844, 0, 0, 0, 0, '', 'Spell Burst at the Seams targets Drakkari Skullcrusher');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@DSC;
DELETE FROM `smart_scripts` WHERE `source_type`IN (0,9) AND `entryorguid`IN (@DSC,@DSC*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@DSC,0,0,0,8,0,100,0,52510,0,0,0,80,@DSC*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Drakkari Skullcrusher - On Spellhit - Start Timed Action Script'),
(@DSC*100,9,0,0,0,0,100,0,0,0,0,0,11,@TEXPLOSION,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakkari Skullcrusher - On Script - Cast Troll Explosion'),
(@DSC*100,9,1,0,0,0,100,0,0,0,0,0,11,@MEAT_EXPL,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakkari Skullcrusher - On Script - Cast Meat Explosion'),
(@DSC*100,9,2,0,0,0,100,0,0,0,0,0,11,@SUICIDE_NL,0,0,0,0,0,1,0,0,0,0,0,0,0,'Drakkari Skullcrusher - On Script - Cast Suicide');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`IN (@TEXPLOSION,@MEAT_EXPL);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(@TEXPLOSION,@FFTF_EXPL,1,'Trigger Troll Explosion with FFTF explosion'),
(@MEAT_EXPL,@BMEAT_EXPL,1,'Trigger Meat Explosion with Bloody Meat Explosion');
SET @MATT2          := 32404;  -- Matthias Lehner
SET @PLSP_FC        := 58989;  -- Prodigal Leader Force Cast
SET @L_CAPTAIN      := 32414;  -- Lordaeron Captain
SET @L_FOOTSOLDIER  := 31254;  -- Lordaeron Footsoldier 

DELETE FROM `smart_scripts` WHERE `entryorguid`=@MATT2 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@MATT2,0,0,0,19,0,100,0,13395,0,0,0,11,@PLSP_FC,0,0,0,0,0,7,0,0,0,0,0,0,0,'On Quest accept - Cast spell - Cast Invoker'),
(@MATT2,0,1,0,19,0,100,0,13236,0,0,0,11,@PLSP_FC,0,0,0,0,0,7,0,0,0,0,0,0,0,'On Quest accept - Cast spell - Cast  Invoker'),
(@MATT2,0,2,3,62,0,100,0,10226,0,0,0,11,@PLSP_FC,0,0,0,0,0,7,0,0,0,0,0,0,0,'On Gossip Select - Cast spell - Cast Invoker'),
(@MATT2,0,3,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'On Gossip Select - Close Gossip - Invoker');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=10226;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,10226,0,0,0,9,0,13395,0,0,0,0,0,'','Show Gossip Menu Option only when quest is active'),
(15,10226,0,0,1,9,0,13236,0,0,0,0,0,'','Show Gossip Menu Option only when quest is active');
UPDATE `quest_template` SET `requiredspellcast1`=0 WHERE `id` IN (10545,10512);



-- Escape from Silverbrook
SET @ENTRY          := 27499; -- Caged Prisoner
SET @PRISONER       := 27411; -- Freed Alliance Scout
SET @HORSE          := 27409; -- The Qorse (Reference to Machiavelli)
SET @SUMM_HORSE     := 48651; -- Summon Ducal's Horse
SET @SUMM_WORG      := 48681; -- Summon Worgen
SET @WORG           := 27417; -- Silverbrook Worgen

DELETE FROM `spell_script_names` WHERE `spell_id` IN (48682,48681);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(48682, 'spell_q12308_escape_from_silverbrook'),
(48681, 'spell_q12308_escape_from_silverbrook_summon_worgen'); 

UPDATE `creature_template` SET AIName='SmartAI' WHERE `entry` IN (@ENTRY,@PRISONER,@HORSE,@WORG);
DELETE FROM `smart_scripts` WHERE `entryorguid`IN (@ENTRY,@PRISONER,@PRISONER*100,@HORSE,@HORSE*100,@WORG) AND `source_type`IN (0,9);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (@ENTRY,@PRISONER,@HORSE,@WORG);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)VALUES
(@ENTRY,0,0,1,19,0,100,0,12308,0,0,0,11,48710,0,0,0,0,0,19,24042,10,0,0,0,0,0,'Caged Prisoner - on quest accepted - Summon Freed Alliance Scout'),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,9,0,0,0,0,0,0,15,188706,10,0,0,0,0,0,'Caged Prisoner - On Link - Activate Cage'),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0,0,0,0,'Caged Prisoner - On quest accepted - Summon Freed Alliance Scout'),
-- 
(@PRISONER,0,0,0,54,0,100,0,0,0,0,0,80,@PRISONER*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Freed Alliance Scout - On Respawn - Start Timed Action Script'),
(@PRISONER,0,1,2,40,0,100,1,6,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Freed Alliance Scout - On WP Reached - Say 3'),
(@PRISONER,0,2,3,61,0,100,0,0,0,0,0,11,@SUMM_HORSE,0,0,0,0,0,1,0,0,0,0,0,0,0,'Freed Alliance Scout - On Link - Summon Horse'),
(@PRISONER,0,3,0,61,0,100,0,0,0,0,0,11,46598,0,0,0,0,0,19,@HORSE,10,0,0,0,0,0,'Freed Alliance Scout - On Link - Mount Horse'),
(@PRISONER,0,4,0,38,0,100,0,1,1,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Freed Alliance Scout - On Link - Say'),
--
(@PRISONER*100,9,0,0,0,0,100,0,3000,3000,3000,3000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Freed Alliance Scout - On Script - Say 0'),
(@PRISONER*100,9,1,0,0,0,100,0,5000,5000,5000,5000,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Freed Alliance Scout - On Script - Say 1'),
(@PRISONER*100,9,2,0,0,0,100,0,4000,4000,4000,4000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Freed Alliance Scout - On Script - Say 2'),
(@PRISONER*100,9,3,0,0,0,100,0,9000,9000,9000,9000,53,1,@PRISONER,0,0,0,0,1,0,0,0,0,0,0,0,'Freed Alliance Scout - On Script - Start WP movement'),
--
(@HORSE,0,0,1,27,0,100,0,0,0,0,0,80,@HORSE*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ducal''s Horse - On Passanger Boarded - Start Timed Action Script'),
(@HORSE,0,1,0,61,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ducal''s Horse - On Link - Allow Combat Movement'),
(@HORSE,0,2,5,40,0,100,0,102,0,0,0,11,48678,0,0,0,0,0,21,10,0,0,0,0,0,0,'Ducal''s Horse - On WP Reached - Dismount Player'),
(@HORSE,0,3,0,40,0,100,0,36,0,0,0,97,25,10,0,0,0,0,1,0,0,0,4063.238525,-2261.991211,215.988922,0,'Ducal''s Horse - On WP Reached - Jump to PoS'),
(@HORSE,0,4,0,40,0,100,0,74,0,0,0,97,25,10,0,0,0,0,1,0,0,0,3900.396484,-2743.329346, 219.152481,0,'Ducal''s Horse - On WP Reached - Jump to PoS'),
(@HORSE,0,5,6,61,0,100,0,0,0,0,0,33,28019,0,0,0,0,0,21,10,0,0,0,0,0,0,'Ducal''s Horse - On WP Reached - Give Credit'),
(@HORSE,0,6,0,61,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ducal''s Horse - On WP Reached - Despawn'),
-- 48678
(@HORSE*100,9,0,0,0,0,100,0,5000,5000,5000,5000,53,1,@HORSE,0,12308,0,0,1,0,0,0,0,0,0,0,'Ducal''s Horse - Script - Start WP Movement'),
(@HORSE*100,9,1,0,0,0,100,0,1000,1000,1000,1000,45,1,1,0,0,0,0,19,@PRISONER,10,0,0,0,0,0,'Ducal''s Horse - Script - Start WP Movement'),
(@HORSE*100,9,2,0,0,0,100,0,0,0,0,0,11,48683,2,0,0,0,0,1,0,0,0,0,0,0,0,'Ducal''s Horse - Script - Cast On self'),
--
(@WORG,0,0,0,54,0,100,0,9,0,0,0,49,0,0,0,0,0,0,19,@HORSE,60,0,0,0,0,0,'Silverbrook Worgen - On Spawn - Attack Horse'),
(@WORG,0,1,0,4,0,100,0,9,0,0,0,11,36589,0,0,0,0,0,1,0,0,0,0,0,0,0,'Silverbrook Worgen - On Aggro - Cast Dash');

DELETE FROM `creature_text` WHERE entry = 27411;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(27411, 0, 0, 'Were you bitten?', 12, 0, 100, 6, 0, 0, 'Freed Alliance Scout Say1'),
(27411, 1, 1, 'Answer me! Were you bloody bitten?', 14, 0, 100, 22, 0, 0, 'Freed Alliance Scout Yell'),
(27411, 2, 2, 'You don''t even know, do you? The trappers? They''re not human... we have to get out of here! Come, quick!', 12, 0, 100, 0, 0, 0, 'Freed Alliance Scout Say2'),
(27411, 3, 3, 'Take Ducal''s horse, he''s one of them now!', 12, 0, 100, 0, 0, 0, 'Freed Alliance Scout Say3'),
(27411, 4, 4, 'There''s lamp oil in the back - make use of it. The fiends hate fire!', 12, 0, 100, 0, 0, 0, 'Freed Alliance Scout Say4');

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`= 27409;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
(27409, 48678, 1, 0); -- Mount Ducal's Horse (for player)

UPDATE `creature_template` SET `speed_walk`=1.142857, `speed_run`=1, `rangeattacktime`=2000, `dynamicflags`=0 WHERE `entry`=27499; -- Caged Prisoner
UPDATE `creature_template` SET `VehicleId` = 51, `IconName`= 'vehichleCursor', `npcflag` =16777216, `unit_flags`=0, `spell1` = 48677, `spell2` = 48768, `spell3` = 48783 WHERE `entry` = 27409;
UPDATE `creature_template` SET `faction_A`=1891,`faction_H`=1891,`baseattacktime`=1500,`unit_flags`=768 WHERE `entry`=27411;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE entry = 27417;

-- Ducal's Horse waypoints
DELETE FROM `waypoints` WHERE entry = 27409;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(27409, 0, 4431.638672, -2481.546143, 245.497971, ''),
(27409, 1, 4449.238281, -2471.332031, 242.360382, ''),
(27409, 2, 4461.925293, -2462.848145, 239.519882, ''),
(27409, 3, 4462.994141, -2448.238037, 237.881256, ''),
(27409, 4, 4479.575684, -2434.093506, 235.040390, ''),
(27409, 5, 4488.495605, -2420.688477, 233.043091, ''),
(27409, 6, 4494.654785, -2414.143066, 230.241013, ''),
(27409, 7, 4499.730469, -2414.861572, 230.952850, ''),
(27409, 8, 4510.846191, -2401.806641, 226.618698, ''),
(27409, 9, 4517.005371, -2388.016357, 220.151077, ''),
(27409, 10, 4520.017578, -2373.915283, 213.041779, ''),
(27409, 11, 4524.577637, -2355.400391, 202.208481, ''),
(27409, 12, 4520.500977, -2332.202148, 190.853638, ''),
(27409, 13, 4509.677734, -2314.525635, 182.408096, ''),
(27409, 14, 4488.281250, -2309.130127, 184.351913, ''),
(27409, 15, 4480.724609, -2311.419434, 185.420715, ''),
(27409, 16, 4470.293457, -2314.579346, 183.929382, ''),
(27409, 17, 4453.349121, -2318.290771, 189.487000, ''),
(27409, 18, 4442.953613, -2311.859375, 192.656219, ''),
(27409, 19, 4414.564941, -2297.739258, 191.105362, ''),
(27409, 20, 4396.023438, -2286.889648, 192.638016, ''),
(27409, 21, 4383.112305, -2278.546631, 188.321487, ''),
(27409, 22, 4369.118652, -2256.089844, 187.592911, ''),
(27409, 23, 4339.653320, -2250.217529, 188.636993, ''),
(27409, 24, 4299.784180, -2260.091309, 205.303589, ''),
(27409, 25, 4292.068848, -2261.806885, 209.099808, ''),
(27409, 26, 4258.068359, -2270.728027, 212.053543, ''),
(27409, 27, 4224.148926, -2276.497559, 214.878052, ''),
(27409, 28, 4210.618652, -2280.829346, 214.910553, ''),
(27409, 29, 4193.759766, -2285.936035, 219.885529, ''),
(27409, 30, 4168.561523, -2272.436279, 221.375009, ''),
(27409, 31, 4151.019531, -2269.352783, 223.433472, ''),
(27409, 32, 4131.847168, -2271.157715, 221.920700, ''),
(27409, 33, 4112.480469, -2276.041748, 219.916550, ''),
(27409, 34, 4103.597656, -2274.198730, 219.276031, ''),
(27409, 35, 4093.837158, -2276.393066, 219.042526, ''),
(27409, 36, 4084.734375, -2272.286133, 217.870331, ''), -- Jump PoS
(27409, 37, 4063.238525, -2261.991211, 215.988922, ''), -- Jump continuation
(27409, 38, 4059.935547, -2260.473145, 216.993256, ''),
(27409, 39, 4028.185791, -2252.874512, 218.258530, ''),
(27409, 40, 4020.977539, -2249.354004, 217.129837, ''),
(27409, 41, 4005.426025, -2256.105957, 218.451675, ''),
(27409, 42, 3988.108398, -2262.058350, 217.109756, ''),
(27409, 43, 3968.364014, -2267.235840, 215.268341, ''),
(27409, 44, 3953.139893, -2268.633057, 212.391113, ''),
(27409, 45, 3935.732422, -2276.518066, 209.669937, ''),
(27409, 46, 3922.170898, -2282.024414, 211.200699, ''),
(27409, 47, 3913.766846, -2300.279541, 209.620239, ''),
(27409, 48, 3914.160156, -2317.614990, 208.949615, ''),
(27409, 49, 3911.533936, -2330.580078, 207.751999, ''),
(27409, 50, 3907.095947, -2346.107422, 204.630707, ''),
(27409, 51, 3901.425537, -2362.481201, 206.197708, ''),
(27409, 52, 3885.374756, -2368.482178, 202.270737, ''),
(27409, 53, 3871.682617, -2371.436035, 196.694305, ''),
(27409, 54, 3858.806396, -2374.236816, 194.038589, ''),
(27409, 55, 3833.323975, -2390.121582, 187.584473, ''),
(27409, 56, 3818.713379, -2403.767090, 183.718597, ''),
(27409, 57, 3812.403564, -2425.267334, 185.086273, ''),
(27409, 58, 3812.611328, -2432.785400, 186.023727, ''),
(27409, 59, 3812.221680, -2453.928711, 188.508041, ''),
(27409, 60, 3815.669189, -2479.355957, 192.388458, ''),
(27409, 61, 3819.468262, -2503.677002, 195.024658, ''),
(27409, 62, 3822.264648, -2517.937256, 194.068130, ''),
(27409, 63, 3825.485107, -2534.361572, 196.379684, ''),
(27409, 64, 3829.201660, -2554.680664, 196.714203, ''),
(27409, 65, 3836.672119, -2578.528076, 196.706253, ''),
(27409, 66, 3847.536133, -2609.345459, 200.060410, ''),
(27409, 67, 3861.525879, -2624.756592, 202.314850, ''),
(27409, 68, 3882.063232, -2655.939209, 203.425415, ''),
(27409, 69, 3886.698975, -2663.550293, 208.091705, ''),
(27409, 70, 3900.575928, -2672.409912, 212.662750, ''),
(27409, 71, 3909.817383, -2687.583008, 217.098572, ''),
(27409, 72, 3911.782959, -2695.853027, 220.364487, ''),
(27409, 73, 3916.008301, -2703.185791, 221.175446, ''),
(27409, 74, 3912.544678, -2712.180420, 221.059509, ''), -- Jump location
(27409, 75, 3900.396484, -2743.329346, 219.152481, ''), -- Jump continue
(27409, 76, 3889.821777, -2751.587646, 221.798737, ''),
(27409, 77, 3883.421875, -2756.963379, 223.885544, ''),
(27409, 78, 3851.103027, -2769.906494, 227.460480, ''),
(27409, 79, 3837.903076, -2769.537842, 226.115402, ''),
(27409, 80, 3813.292725, -2770.593018, 220.927460, ''),
(27409, 81, 3801.162109, -2771.017578, 219.535080, ''),
(27409, 82, 3780.501709, -2772.391602, 213.905884, ''),
(27409, 83, 3767.551025, -2775.388672, 211.281708, ''),
(27409, 84, 3759.778320, -2782.290771, 209.165924, ''),
(27409, 85, 3752.759277, -2787.596436, 206.495926, ''),
(27409, 86, 3729.982422, -2803.813721, 210.023056, ''),
(27409, 87, 3723.949951, -2808.085693, 211.655594, ''),
(27409, 88, 3705.986328, -2819.675537, 215.066315, ''),
(27409, 89, 3685.556152, -2832.987549, 217.602127, ''),
(27409, 90, 3674.411377, -2843.797852, 217.875214, ''),
(27409, 91, 3662.455811, -2853.292480, 216.581512, ''),
(27409, 92, 3647.392822, -2857.280518, 213.150558, ''),
(27409, 93, 3630.625977, -2860.268555, 214.962250, ''),
(27409, 94, 3610.744141, -2858.618164, 208.903931, ''),
(27409, 95, 3587.919189, -2854.562500, 203.447754, ''),
(27409, 96, 3562.793213, -2842.607666, 197.044495, ''),
(27409, 97, 3534.265625, -2828.214600, 197.154617, ''),
(27409, 98, 3515.692871, -2829.376709, 201.276230, ''),
(27409, 99, 3487.658691, -2829.192871, 202.143524, ''),
(27409, 100, 3472.460693, -2821.599365, 201.429428, ''),
(27409, 101, 3460.582031, -2817.212402, 201.804962, ''),
(27409, 102, 3443.644531, -2811.332520, 202.097687, '');

-- Freed Alliance Scout waypoints
DELETE FROM `waypoints` WHERE entry = 27411;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(27411, 0, 4394.648438, -2502.304688, 252.802429, ''),
(27411, 1, 4389.777832, -2502.323242, 252.251602, ''),
(27411, 2, 4382.442383, -2501.507080, 246.809448, ''),
(27411, 3, 4381.006836, -2497.183838, 247.235260, ''),
(27411, 4, 4393.843750, -2484.841553, 248.717392, ''),
(27411, 5, 4416.043457, -2481.504150, 247.175400, ''),
(27411, 6, 4425.312500, -2486.656006, 246.555176, '');
UPDATE `conditions` SET `NegativeCondition`=0 WHERE `SourceTypeOrReferenceId`=1 AND `SourceGroup` IN (36597,39166,39167,39168) AND `SourceEntry`=51315 AND `ConditionTypeOrReference`=3;
--  Suppression (7583)
SET @NPC_DEMON  := 12396;

DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@NPC_DEMON;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@NPC_DEMON;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_DEMON);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_DEMON,0,0,0,0,0,100,0,5000,8000,18000,24000,11,16005,0,0,0,0,0,2,0,0,0,0,0,0,0,'Doomguard Commander - Cast Rain of Fire'),
(@NPC_DEMON,0,1,0,0,0,100,0,12000,15000,20000,25000,11,16727,0,0,0,0,0,2,0,0,0,0,0,0,0,'Doomguard Commander - Cast War Stomp'),
(@NPC_DEMON,0,2,0,0,0,100,0,2000,4000,25000,32000,11,20812,0,0,0,0,0,2,0,0,0,0,0,0,0,'Doomguard Commander - Cast Cripple'),
(@NPC_DEMON,0,3,0,0,0,100,0,7000,14000,17000,22000,11,15090,0,0,0,0,0,2,0,0,0,0,0,0,0,'Doomguard Commander - Cast Dispel Magic'),
--
(@NPC_DEMON,0,4,5,8,0,100,0,23019,0,0,0,56,18605,1,0,0,0,0,18,20,0,0,0,0,0,0,'Doomguard Commander - On spellhit - Add item Imprisoned Doomguard'),
(@NPC_DEMON,0,5,6,61,0,100,0,0,0,0,0,11,23020,0,0,0,0,0,1,0,0,0,0,0,0,0,'Doomguard Commander - On spellhit - Cast Crystal Imprisonment'),
(@NPC_DEMON,0,6,0,61,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Doomguard Commander - On spellhit - Despawn');

-- Conditions for Glowing Crystal Prison 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=23015;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,23015,0,0,31,1,3,12396,0,0,173,0,'','Glowing Crystal Prison target limit to Doomguard Commander');
ALTER TABLE `quest_template` DROP `RequiredSpellCast1`;
ALTER TABLE `quest_template` DROP `RequiredSpellCast2`;
ALTER TABLE `quest_template` DROP `RequiredSpellCast3`;
ALTER TABLE `quest_template` DROP `RequiredSpellCast4`;
-- Update sai to correlate with the pointid changes, otherwise we get a cluster of bad movement
UPDATE `smart_scripts` SET `event_param1`=7 WHERE  `entryorguid`=27411 AND `source_type`=0 AND `id`=1 AND `link`=2;
UPDATE `smart_scripts` SET `event_param1`=37 WHERE  `entryorguid`=27409 AND `source_type`=0 AND `id`=3 AND `link`=0;
UPDATE `smart_scripts` SET `event_param1`=75 WHERE  `entryorguid`=27409 AND `source_type`=0 AND `id`=4 AND `link`=0;
UPDATE `smart_scripts` SET `event_param1`=103 WHERE  `entryorguid`=27409 AND `source_type`=0 AND `id`=2 AND `link`=5;

DELETE FROM `waypoints` WHERE entry = 27409;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(27409, 1, 4431.638672, -2481.546143, 245.497971, ''),
(27409, 2, 4449.238281, -2471.332031, 242.360382, ''),
(27409, 3, 4461.925293, -2462.848145, 239.519882, ''),
(27409, 4, 4462.994141, -2448.238037, 237.881256, ''),
(27409, 5, 4479.575684, -2434.093506, 235.040390, ''),
(27409, 6, 4488.495605, -2420.688477, 233.043091, ''),
(27409, 7, 4494.654785, -2414.143066, 230.241013, ''),
(27409, 8, 4499.730469, -2414.861572, 230.952850, ''),
(27409, 9, 4510.846191, -2401.806641, 226.618698, ''),
(27409, 10, 4517.005371, -2388.016357, 220.151077, ''),
(27409, 11, 4520.017578, -2373.915283, 213.041779, ''),
(27409, 12, 4524.577637, -2355.400391, 202.208481, ''),
(27409, 13, 4520.500977, -2332.202148, 190.853638, ''),
(27409, 14, 4509.677734, -2314.525635, 182.408096, ''),
(27409, 15, 4488.281250, -2309.130127, 184.351913, ''),
(27409, 16, 4480.724609, -2311.419434, 185.420715, ''),
(27409, 17, 4470.293457, -2314.579346, 183.929382, ''),
(27409, 18, 4453.349121, -2318.290771, 189.487000, ''),
(27409, 19, 4442.953613, -2311.859375, 192.656219, ''),
(27409, 20, 4414.564941, -2297.739258, 191.105362, ''),
(27409, 21, 4396.023438, -2286.889648, 192.638016, ''),
(27409, 22, 4383.112305, -2278.546631, 188.321487, ''),
(27409, 23, 4369.118652, -2256.089844, 187.592911, ''),
(27409, 24, 4339.653320, -2250.217529, 188.636993, ''),
(27409, 25, 4299.784180, -2260.091309, 205.303589, ''),
(27409, 26, 4292.068848, -2261.806885, 209.099808, ''),
(27409, 27, 4258.068359, -2270.728027, 212.053543, ''),
(27409, 28, 4224.148926, -2276.497559, 214.878052, ''),
(27409, 29, 4210.618652, -2280.829346, 214.910553, ''),
(27409, 30, 4193.759766, -2285.936035, 219.885529, ''),
(27409, 31, 4168.561523, -2272.436279, 221.375009, ''),
(27409, 32, 4151.019531, -2269.352783, 223.433472, ''),
(27409, 33, 4131.847168, -2271.157715, 221.920700, ''),
(27409, 34, 4112.480469, -2276.041748, 219.916550, ''),
(27409, 35, 4103.597656, -2274.198730, 219.276031, ''),
(27409, 36, 4093.837158, -2276.393066, 219.042526, ''),
(27409, 37, 4084.734375, -2272.286133, 217.870331, ''), -- Jump PoS
(27409, 38, 4063.238525, -2261.991211, 215.988922, ''), -- Jump continuation
(27409, 39, 4059.935547, -2260.473145, 216.993256, ''),
(27409, 40, 4028.185791, -2252.874512, 218.258530, ''),
(27409, 41, 4020.977539, -2249.354004, 217.129837, ''),
(27409, 42, 4005.426025, -2256.105957, 218.451675, ''),
(27409, 43, 3988.108398, -2262.058350, 217.109756, ''),
(27409, 44, 3968.364014, -2267.235840, 215.268341, ''),
(27409, 45, 3953.139893, -2268.633057, 212.391113, ''),
(27409, 46, 3935.732422, -2276.518066, 209.669937, ''),
(27409, 47, 3922.170898, -2282.024414, 211.200699, ''),
(27409, 48, 3913.766846, -2300.279541, 209.620239, ''),
(27409, 49, 3914.160156, -2317.614990, 208.949615, ''),
(27409, 50, 3911.533936, -2330.580078, 207.751999, ''),
(27409, 51, 3907.095947, -2346.107422, 204.630707, ''),
(27409, 52, 3901.425537, -2362.481201, 206.197708, ''),
(27409, 53, 3885.374756, -2368.482178, 202.270737, ''),
(27409, 54, 3871.682617, -2371.436035, 196.694305, ''),
(27409, 55, 3858.806396, -2374.236816, 194.038589, ''),
(27409, 56, 3833.323975, -2390.121582, 187.584473, ''),
(27409, 57, 3818.713379, -2403.767090, 183.718597, ''),
(27409, 58, 3812.403564, -2425.267334, 185.086273, ''),
(27409, 59, 3812.611328, -2432.785400, 186.023727, ''),
(27409, 60, 3812.221680, -2453.928711, 188.508041, ''),
(27409, 61, 3815.669189, -2479.355957, 192.388458, ''),
(27409, 62, 3819.468262, -2503.677002, 195.024658, ''),
(27409, 63, 3822.264648, -2517.937256, 194.068130, ''),
(27409, 64, 3825.485107, -2534.361572, 196.379684, ''),
(27409, 65, 3829.201660, -2554.680664, 196.714203, ''),
(27409, 66, 3836.672119, -2578.528076, 196.706253, ''),
(27409, 67, 3847.536133, -2609.345459, 200.060410, ''),
(27409, 68, 3861.525879, -2624.756592, 202.314850, ''),
(27409, 69, 3882.063232, -2655.939209, 203.425415, ''),
(27409, 70, 3886.698975, -2663.550293, 208.091705, ''),
(27409, 71, 3900.575928, -2672.409912, 212.662750, ''),
(27409, 72, 3909.817383, -2687.583008, 217.098572, ''),
(27409, 73, 3911.782959, -2695.853027, 220.364487, ''),
(27409, 74, 3916.008301, -2703.185791, 221.175446, ''),
(27409, 75, 3912.544678, -2712.180420, 221.059509, ''), -- Jump location
(27409, 76, 3900.396484, -2743.329346, 219.152481, ''), -- Jump continue
(27409, 77, 3889.821777, -2751.587646, 221.798737, ''),
(27409, 78, 3883.421875, -2756.963379, 223.885544, ''),
(27409, 79, 3851.103027, -2769.906494, 227.460480, ''),
(27409, 80, 3837.903076, -2769.537842, 226.115402, ''),
(27409, 81, 3813.292725, -2770.593018, 220.927460, ''),
(27409, 82, 3801.162109, -2771.017578, 219.535080, ''),
(27409, 83, 3780.501709, -2772.391602, 213.905884, ''),
(27409, 84, 3767.551025, -2775.388672, 211.281708, ''),
(27409, 85, 3759.778320, -2782.290771, 209.165924, ''),
(27409, 86, 3752.759277, -2787.596436, 206.495926, ''),
(27409, 87, 3729.982422, -2803.813721, 210.023056, ''),
(27409, 88, 3723.949951, -2808.085693, 211.655594, ''),
(27409, 89, 3705.986328, -2819.675537, 215.066315, ''),
(27409, 90, 3685.556152, -2832.987549, 217.602127, ''),
(27409, 91, 3674.411377, -2843.797852, 217.875214, ''),
(27409, 92, 3662.455811, -2853.292480, 216.581512, ''),
(27409, 93, 3647.392822, -2857.280518, 213.150558, ''),
(27409, 94, 3630.625977, -2860.268555, 214.962250, ''),
(27409, 95, 3610.744141, -2858.618164, 208.903931, ''),
(27409, 96, 3587.919189, -2854.562500, 203.447754, ''),
(27409, 97, 3562.793213, -2842.607666, 197.044495, ''),
(27409, 98, 3534.265625, -2828.214600, 197.154617, ''),
(27409, 99, 3515.692871, -2829.376709, 201.276230, ''),
(27409, 100, 3487.658691, -2829.192871, 202.143524, ''),
(27409, 101, 3472.460693, -2821.599365, 201.429428, ''),
(27409, 102, 3460.582031, -2817.212402, 201.804962, ''),
(27409, 103, 3443.644531, -2811.332520, 202.097687, '');

-- Freed Alliance Scout waypoints
DELETE FROM `waypoints` WHERE entry = 27411;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(27411, 1, 4394.648438, -2502.304688, 252.802429, ''),
(27411, 2, 4389.777832, -2502.323242, 252.251602, ''),
(27411, 3, 4382.442383, -2501.507080, 246.809448, ''),
(27411, 4, 4381.006836, -2497.183838, 247.235260, ''),
(27411, 5, 4393.843750, -2484.841553, 248.717392, ''),
(27411, 6, 4416.043457, -2481.504150, 247.175400, ''),
(27411, 7, 4425.312500, -2486.656006, 246.555176, '');
UPDATE `gameobject_loot_template` SET `item`=37700 /* 33700 */ WHERE  `entry`=24157 AND `item`=37703;
ALTER TABLE `command` CHANGE `security` `permission` SMALLINT(5) UNSIGNED DEFAULT 0 NOT NULL;

-- Player commands
UPDATE `command` SET `permission` = 7 WHERE `permission` = 0;
-- Moderator commands
UPDATE `command` SET `permission` = 8 WHERE `permission` = 1;
-- GM commands
UPDATE `command` SET `permission` = 9 WHERE `permission` = 2;
-- administrator commands
UPDATE `command` SET `permission` = 10 WHERE `permission` = 3;
-- console commands
UPDATE `command` SET `permission` = 12 WHERE `permission` = 4;
-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = 201 WHERE `name` = 'rbac account';
UPDATE `command` SET `permission` = 202 WHERE `name` = 'rbac account group';
UPDATE `command` SET `permission` = 203 WHERE `name` = 'rbac account group add';
UPDATE `command` SET `permission` = 204 WHERE `name` = 'rbac account group remove';
UPDATE `command` SET `permission` = 205 WHERE `name` = 'rbac account role';
UPDATE `command` SET `permission` = 206 WHERE `name` = 'rbac account role grant';
UPDATE `command` SET `permission` = 207 WHERE `name` = 'rbac account role deny';
UPDATE `command` SET `permission` = 208 WHERE `name` = 'rbac account role revoke';
UPDATE `command` SET `permission` = 209 WHERE `name` = 'rbac account permission';
UPDATE `command` SET `permission` = 210 WHERE `name` = 'rbac account permission grant';
UPDATE `command` SET `permission` = 211 WHERE `name` = 'rbac account permission deny';
UPDATE `command` SET `permission` = 212 WHERE `name` = 'rbac account permission revoke';
UPDATE `command` SET `permission` = 214 WHERE `name` = 'rbac account list groups';
UPDATE `command` SET `permission` = 215 WHERE `name` = 'rbac account list roles';
UPDATE `command` SET `permission` = 216 WHERE `name` = 'rbac account list permissions';
UPDATE `command` SET `name` = 'rbac account' WHERE `name` = '.rbac account';
UPDATE `command` SET `name` = 'rbac account group' WHERE `name` = '.rbac account group';
UPDATE `command` SET `name` = 'rbac account group add' WHERE `name` = '.rbac account group add';
UPDATE `command` SET `name` = 'rbac account group remove' WHERE `name` = '.rbac account group remove';
UPDATE `command` SET `name` = 'rbac account role' WHERE `name` = '.rbac account role';
UPDATE `command` SET `name` = 'rbac account role grant' WHERE `name` = '.rbac account role grant';
UPDATE `command` SET `name` = 'rbac account role deny' WHERE `name` = '.rbac account role deny';
UPDATE `command` SET `name` = 'rbac account role revoke' WHERE `name` = '.rbac account role revoke';
UPDATE `command` SET `name` = 'rbac account permission' WHERE `name` = '.rbac account permission';
UPDATE `command` SET `name` = 'rbac account permission grant' WHERE `name` = '.rbac account permission grant';
UPDATE `command` SET `name` = 'rbac account permission deny' WHERE `name` = '.rbac account permission deny';
UPDATE `command` SET `name` = 'rbac account permission revoke' WHERE `name` = '.rbac account permission revoke';
UPDATE `command` SET `name` = 'rbac account list groups' WHERE `name` = '.rbac account list groups';
UPDATE `command` SET `name` = 'rbac account list roles' WHERE `name` = '.rbac account list roles';
UPDATE `command` SET `name` = 'rbac account list permissions' WHERE `name` = '.rbac account list permissions';
-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = 217 WHERE `name` = 'account';
UPDATE `command` SET `permission` = 218 WHERE `name` = 'account addon';
UPDATE `command` SET `permission` = 219 WHERE `name` = 'account create';
UPDATE `command` SET `permission` = 220 WHERE `name` = 'account delete';
UPDATE `command` SET `permission` = 221 WHERE `name` = 'account lock';
UPDATE `command` SET `permission` = 222 WHERE `name` = 'account lock country';
UPDATE `command` SET `permission` = 223 WHERE `name` = 'account lock ip';
UPDATE `command` SET `permission` = 224 WHERE `name` = 'account onlinelist';
UPDATE `command` SET `permission` = 225 WHERE `name` = 'account password';
UPDATE `command` SET `permission` = 226 WHERE `name` = 'account set';
UPDATE `command` SET `permission` = 227 WHERE `name` = 'account set addon';
UPDATE `command` SET `permission` = 228 WHERE `name` = 'account set gmlevel';
UPDATE `command` SET `permission` = 229 WHERE `name` = 'account set password';
-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = 230 WHERE `name` = 'achievement';
UPDATE `command` SET `permission` = 231 WHERE `name` = 'achievement add';
UPDATE `command` SET `permission` = 232 WHERE `name` = 'arena';
UPDATE `command` SET `permission` = 233 WHERE `name` = 'arena captain';
UPDATE `command` SET `permission` = 234 WHERE `name` = 'arena create';
UPDATE `command` SET `permission` = 235 WHERE `name` = 'arena disband';
UPDATE `command` SET `permission` = 236 WHERE `name` = 'arena info';
UPDATE `command` SET `permission` = 237 WHERE `name` = 'arena lookup';
UPDATE `command` SET `permission` = 238 WHERE `name` = 'arena rename';
-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = 239 WHERE `name` = 'ban';
UPDATE `command` SET `permission` = 240 WHERE `name` = 'ban account';
UPDATE `command` SET `permission` = 241 WHERE `name` = 'ban character';
UPDATE `command` SET `permission` = 242 WHERE `name` = 'ban ip';
UPDATE `command` SET `permission` = 243 WHERE `name` = 'ban playeraccount';
UPDATE `command` SET `permission` = 244 WHERE `name` = 'baninfo';
UPDATE `command` SET `permission` = 245 WHERE `name` = 'baninfo account';
UPDATE `command` SET `permission` = 246 WHERE `name` = 'baninfo character';
UPDATE `command` SET `permission` = 247 WHERE `name` = 'baninfo ip';
UPDATE `command` SET `permission` = 248 WHERE `name` = 'banlist';
UPDATE `command` SET `permission` = 249 WHERE `name` = 'banlist account';
UPDATE `command` SET `permission` = 250 WHERE `name` = 'banlist character';
UPDATE `command` SET `permission` = 251 WHERE `name` = 'banlist ip';
UPDATE `command` SET `permission` = 252 WHERE `name` = 'unban';
UPDATE `command` SET `permission` = 253 WHERE `name` = 'unban account';
UPDATE `command` SET `permission` = 254 WHERE `name` = 'unban character';
UPDATE `command` SET `permission` = 255 WHERE `name` = 'unban ip';
UPDATE `command` SET `permission` = 256 WHERE `name` = 'unban playeraccount';
DELETE FROM `creature_ai_scripts` WHERE `action1_type`=27;

-- INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
--   ('343001', '3430', '0', '0', '100', '0', '0', '0', '0', '0', '27', '5043', '17013', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Mangletooth - Cast Agamaggan''s Agility on Quest Complete'),
--   ('343002', '3430', '0', '0', '100', '0', '0', '0', '0', '0', '27', '5042', '16612', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Mangletooth - Cast Agamaggan''s Strength on Quest Complete'),
--   ('343003', '3430', '0', '0', '100', '0', '0', '0', '0', '0', '27', '5046', '16610', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Mangletooth - Cast Razorhide on Quest Complete'),
--   ('343004', '3430', '0', '0', '100', '0', '0', '0', '0', '0', '27', '5045', '10767', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Mangletooth - Cast Rising Spirit on Quest Complete'),
--   ('343005', '3430', '0', '0', '100', '0', '0', '0', '0', '0', '27', '889', '16618', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Mangletooth - Cast Spirit of the Wind on Quest Complete'),
--   ('343006', '3430', '0', '0', '100', '0', '0', '0', '0', '0', '27', '5044', '7764', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Mangletooth - Cast Wisdom of Agamaggan on Quest Complete');

UPDATE `smart_scripts` SET `action_type`=33, `action_param2`=0 WHERE `source_type`=0 AND `action_type`=27; -- by VM

-- all quests that used RequiredSpellCastX fields
UPDATE `quest_template` SET `SpecialFlags`=`SpecialFlags`|32 WHERE `Id` IN
(28,29,532,553,849,877,905,974,2118,2932,2994,3825,5096,5163,5165,5441,
6124,6129,6381,6395,6661,8346,8889,9066,9169,9193,9275,9294,9391,9440,
9444,9447,9489,9526,9600,9629,9667,9685,9720,9805,9824,9874,9910,10011,
10078,10087,10129,10144,10146,10182,10208,10233,10240,10305,10306,10307,
10313,10335,10345,10392,10426,10446,10447,10488,10545,10564,10598,10637,
10688,10714,10771,10792,10802,10808,10813,10833,10859,10866,10895,10913,
10923,10935,11055,11150,11205,11232,11245,11247,11258,11259,11285,11330,
11332,11421,11496,11515,11523,11542,11543,11547,11568,11576,11582,11610,
11617,11637,11656,11677,11684,11694,11713,11880,12092,12094,12096,12154,
12172,12173,12180,12213,12232,12267,12417,12449,12502,12588,12591,12598,
12641,12669,12728,12859,13110,13119,13211);
-- Deeprun Rat Roundup (6661)

SET @QUEST                 := 6661;  -- Random Comment
SET @NPC_RAT               := 13016; -- Deeprun Rat
SET @NPC_ENTHRALLED_RAT    := 13017; -- Enthralled Deeprun Rat
SET @NPC_MONTY             := 12997; -- Monty <Rat Extermination Specialist>
SET @SPELL_FLUTE           := 21050; -- Melodious Rapture
SET @SPELL_FLUTE_VISUAL    := 21051; -- Melodious Rapture Visual (DND)
SET @SPELL_BASH            := 21052; -- Monty Bashes Rats (DND)

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@NPC_RAT;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@NPC_ENTHRALLED_RAT;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@NPC_MONTY;

UPDATE `creature_model_info` SET `bounding_radius`=1,`combat_reach`=1,`gender`=2 WHERE `modelid`=1141; -- Deeprun Rat
-- Addon data for creature 13016 (Deeprun Rat)
DELETE FROM `creature_template_addon` WHERE `entry`=@NPC_RAT;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC_RAT,0,0,1,0, ''); -- Deeprun Rat

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_RAT,@NPC_ENTHRALLED_RAT,@NPC_MONTY);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_RAT,0,0,1,8,0,100,1,@SPELL_FLUTE,0,0,0,12,@NPC_ENTHRALLED_RAT,2,120000,0,0,0,1,0,0,0,0,0,0,0,'Deeprun Rat - On Spellhit - Summon Enthralled Rat'),
(@NPC_RAT,0,1,0,61,0,100,0,0,0,0,0,41,100,1,0,0,0,0,1,0,0,0,0,0,0,0,'Deeprun Rat - On link - Despawn'),
--
(@NPC_ENTHRALLED_RAT,0,0,1,54,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'Deeprun Rat - Just summoned - Update Faction'),
(@NPC_ENTHRALLED_RAT,0,1,2,61,0,100,0,0,0,0,0,33,@NPC_ENTHRALLED_RAT,0,0,0,0,0,21,5,0,0,0,0,0,0,'Deeprun Rat - On Link - Give Q credit'),
(@NPC_ENTHRALLED_RAT,0,2,3,61,0,100,0,0,0,0,0,11,@SPELL_FLUTE_VISUAL,0,0,0,0,0,1,0,0,0,0,0,0,0,'Deeprun Rat - On Link - Set Flute Visual'),
(@NPC_ENTHRALLED_RAT,0,3,4,61,0,100,0,0,0,0,0,29,0,0,0,0,0,0,21,5,0,0,0,0,0,0,'Deeprun Rat - On Link - Follow Player'),
(@NPC_ENTHRALLED_RAT,0,4,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Deeprun Rat - On LInk- Set Phase 1'),
(@NPC_ENTHRALLED_RAT,0,5,0,8,1,100,0,@SPELL_BASH,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Deeprun Rat - On Spellhit - Despawn'),
--
(@NPC_MONTY,0,0,1,20,0,100,0,@QUEST,0,0,0,11,@SPELL_BASH,0,0,0,0,0,1,0,0,0,0,0,0,0,'Monty - On Reward Quest - Cast Bash'),
(@NPC_MONTY,0,1,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Monty - On Reward Quest - Talk');

DELETE FROM `creature_text` WHERE `entry`=@NPC_MONTY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@NPC_MONTY,0,0,'Into the box me pretties! Thats it. One by one ye go.',12,0,0,0,0,0,'Monty');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=@SPELL_BASH;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,@SPELL_BASH,0,0,31,0,3,@NPC_ENTHRALLED_RAT,0,0,0,'','Spell Bash target rats');
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_rotface_vile_gas_trigger';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(72285, 'spell_rotface_vile_gas_trigger'),
(72288, 'spell_rotface_vile_gas_trigger');
ALTER TABLE `reputation_reward_rate` CHANGE `quest_repeatable_rate` `quest_repeatable_rate` FLOAT NOT NULL DEFAULT '1' AFTER `quest_monthly_rate`;
UPDATE `gameobject_loot_template` SET `item`=37700 WHERE  `entry`=24157 AND `item`=33700;
-- The Lost Mistwhisper Treasure (12575)
SET @TARTEK                     := 28105;
SET @ZEPTEK                     := 28399;
SET @HC_RIDE                    := 46598;
SET @TRIGGER                    := 5030;
SET @SPEARBORNBUNNY             := 28457;
-- REF 6710.741, 5154.322, -19.3981
-- REF 6712.461, 5136.462, -19.3981

-- Propper phasing 
DELETE FROM `spell_area` WHERE `spell` = 52217;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(52217, 4306, 12574, 0, 0, 0, 2, 1, 74, 64),
(52217, 4308, 12574, 0, 0, 0, 2, 1, 74, 64);

-- Needs one waypoint for passenger removal
DELETE FROM `waypoints` WHERE `entry`=@ZEPTEK;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ZEPTEK, 1, 6712.461, 5136.462, -19.3981, 'Zeptek the Destroyer');

-- Criteria linked with involved relation
DELETE FROM `areatrigger_involvedrelation` WHERE `id` = @TRIGGER;
INSERT INTO `areatrigger_involvedrelation` (`id`,`quest`) VALUES
(@TRIGGER,12575);

DELETE FROM `areatrigger_scripts` WHERE `entry` = @TRIGGER;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(@TRIGGER,'SmartTrigger');

DELETE FROM `smart_scripts` WHERE `entryorguid` =@TRIGGER AND `source_type`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@TRIGGER,2,0,0,46,0,100,0,@TRIGGER,0,0,0,45,1,1,0,0,0,0,10,99764,@SPEARBORNBUNNY,0,0,0,0,0,"On Trigger - Set Data");

DELETE FROM `smart_scripts` WHERE `entryorguid` =@SPEARBORNBUNNY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SPEARBORNBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,51642,2,0,0,0,0,7,0,0,0,0,0,0,0,'Spearborn Encampment Bunny - On update OOC - Spellcast Spearborn Encampment Aura'),
(@SPEARBORNBUNNY,0,1,2,38,0,100,0,1,1,300000,300000,45,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Spearborn Encampment Bunny - On Data Set - Set Data'),
(@SPEARBORNBUNNY,0,2,0,61,0,100,0,0,0,0,0,12,@TARTEK,1,300000,0,0,0,8,0,0,0,6709.02, 5169.21, -20.8878, 4.91029, 'Spearborn Encampment Bunny - Linked with Previous Event - Spawn Warlord Tartek');

DELETE FROM `creature` WHERE `id`=@TARTEK;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@TARTEK;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` =@TARTEK; 
DELETE FROM `smart_scripts` WHERE `entryorguid` =@TARTEK;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@TARTEK,0,0,1,11,0,100,0,0,0,0,0,2,2061,0,0,0,0,0,1,0,0,0,0,0,0,0,'Warlord Tartek - On Spawn - Set Faction'),
(@TARTEK,0,1,2,61,0,100,0,0,0,0,0,18,756,0,0,0,0,0,1,0,0,0,0,0,0,0,'Warlord Tartek - On Link - Set Unattackable Flags'),
(@TARTEK,0,2,3,61,0,100,0,0,0,0,0,12,@ZEPTEK,1,100000,0,0,0,1,0,0,0,0,0,0,0,'Warlord Tartek - On Link - Summon Zeptek'),
(@TARTEK,0,3,4,61,0,100,0,0,0,0,0,11,@HC_RIDE,2,0,0,0,0,11,@ZEPTEK,10,0,0,0,0,0,'Warlord Tartek - On Link - Ride Zeptek'),
(@TARTEK,0,4,5,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Warlord Tartek - On Link - Say 0'),
(@TARTEK,0,5,0,4,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Warlord Tartek - On Aggro - Say 1'),
(@TARTEK,0,6,0,8,0,100,0,@HC_RIDE,0,0,0,19,756,0,0,0,0,0,1,0,0,0,0,0,0,0,'Warlord Tartek - On Data set - Remove Unattackable Flags'),
-- Combat
(@TARTEK,0,7,0,9,0,100,0,5000,8000,5000,8000,11,29426,2,0,0,0,0,1,0,0,0,0,0,0,0,'Warlord Tartek - IC - Cast Heroic Strike'),
(@TARTEK,0,8,0,0,0,100,0,5000,15000,5000,15000,11,35429,2,0,0,0,0,1,0,0,0,0,0,0,0,'Warlord Tartek - IC - Cast Sweeping Strikes'),
(@TARTEK,0,9,0,0,0,100,0,6000,15000,6000,15000,11,15572,2,0,0,0,0,2,0,0,0,0,0,0,0,'Warlord Tartek - IC - Cast Sunder Armor'),
-- Credit
(@TARTEK,0,10,11,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,9,28121,0,50,0,0,0,0, 'Warlord Tartek - On Death - Set Data Jaloot'), -- If spawned by player, will say text.
(@TARTEK,0,11,0,61,0,100,0,0,0,0,0,15,12575,0,0,0,0,0,7,0,0,0,0,0,0,0,'Warlord Tartek - On Link - Call area explored or event happens');

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ZEPTEK;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` =@ZEPTEK; 
DELETE FROM `smart_scripts` WHERE `entryorguid` =@ZEPTEK;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ZEPTEK,0,0,1,11,0,100,0,0,0,0,0,2,2061,0,0,0,0,0,1,0,0,0,0,0,0,0,'Zeptik The Destroyer - On Spawn - Set Faction'),
(@ZEPTEK,0,1,0,61,0,100,0,0,0,0,0,53,1,@ZEPTEK,0,0,0,0,1,0,0,0,0,0,0,0,'Zeptik The Destroyer  - On Link - Start WP'),
(@ZEPTEK,0,2,3,40,0,100,0,1,0,0,0,11,@HC_RIDE,0,0,0,0,0,11,@TARTEK,20,0,0,0,0,0,'Zeptik The Destroyer - ON WP reached - Dismount Tartek'),
(@ZEPTEK,0,3,4,61,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Zeptik The Destroyer - OnLink - Summon New Zeptek'),
(@ZEPTEK,0,4,0,61,0,100,0,0,0,0,0,28,@HC_RIDE,0,0,0,0,0,1,0,0,0,0,0,0,0,'Zeptik The Destroyer - On LInk - Attack Closest Player');

DELETE FROM `creature_equip_template` WHERE `entry` =@TARTEK;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(@TARTEK, 1, 5305, 0, 0);

DELETE FROM `creature_text` WHERE `entry` =@TARTEK;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@TARTEK, 0, 0, 'My treasure! You no steal from Tartek, dumb big-tongue traitor thing.', 14, 0, 100, 0, 0, 0, 'Warlord Tartek'),
(@TARTEK, 1, 0, 'Tartek and nasty dragon going to kill you! You so dumb.', 14, 0, 100, 0, 0, 0, 'Warlord Tartek');
-- Needs special flags 2 for external event
UPDATE `quest_template` SET `SpecialFlags`=2 WHERE  `Id`=12575;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=@TRIGGER AND `SourceId`=2;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,1,@TRIGGER,2,0,9,0,12575,0,0,0,0,'','Trigger only activates if player is on the Lost Mistwhisper Treasure');
DELETE FROM `creature_text` WHERE `entry`=24480;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(24480, 0, 0, 'I thought you''d never ask!', 15, 0, 100, 0, 0, 0, 'Mojo'), 
(24480, 0, 1, 'I promise not to give you warts...', 15, 0, 100, 0, 0, 0, 'Mojo'), 
(24480, 0, 2, 'This won''t take long, did it?', 15, 0, 100, 0, 0, 0, 'Mojo'), 
(24480, 0, 3, 'Now that''s what I call froggy-style!', 15, 0, 100, 0, 0, 0, 'Mojo'), 
(24480, 0, 4, 'Listen, $n, I know of a little swamp not too far from here....', 15, 0, 100, 0, 0, 0, 'Mojo'), 
(24480, 0, 5, 'Your lily pad or mine?', 15, 0, 100, 0, 0, 0, 'Mojo'), 
(24480, 0, 6, 'Feelin'' a little froggy, are ya?', 15, 0, 100, 0, 0, 0, 'Mojo'),
(24480, 0, 7, 'There''s just never enough Mojo to go around...', 15, 0, 100, 0, 0, 0, 'Mojo');
DELETE FROM `spell_script_names` WHERE `spell_id`=51858;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(51858, 'spell_q12641_death_comes_from_on_high');
UPDATE `creature_template` SET `ScriptName`='npc_pet_gen_mojo' WHERE `ScriptName`='npc_mojo';
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (18110,18142,18143,18144) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(18110, 0, 0, 1, 8, 0, 100, 1, 31927, 0, 0, 0, 80, 1811000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Windyreed Quest Credit - On Spellhit - Run Script'),
(18110, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 18110, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Windyreed Quest Credit - On Spellhit (Link) - Quest Credit'),
(18142, 0, 0, 1, 8, 0, 100, 1, 31927, 0, 0, 0, 80, 1814200, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Windyreed Quest Credit - On Spellhit - Run Script'),
(18142, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 18142, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Windyreed Quest Credit - On Spellhit (Link) - Quest Credit'),
(18143, 0, 0, 1, 8, 0, 100, 1, 31927, 0, 0, 0, 80, 1814300, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Windyreed Quest Credit - On Spellhit - Run Script'),
(18143, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 18143, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Windyreed Quest Credit - On Spellhit (Link) - Quest Credit'),
(18144, 0, 0, 1, 8, 0, 100, 1, 31927, 0, 0, 0, 80, 1814400, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Windyreed Quest Credit - On Spellhit - Run Script'),
(18144, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 18144, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Windyreed Quest Credit - On Spellhit (Link) - Quest Credit');
UPDATE `creature` SET 
  `position_x`=1814.592,
  `position_y`=-5988.646,
  `position_z`=125.4968,
  `orientation`=3.228859
WHERE `id`=28525;

UPDATE `creature` SET
  `position_x`=1590.806,
  `position_y`=-5731.661,
  `position_z`=143.8694,
  `orientation`=0.9075712
WHERE `id`=28543;

UPDATE `creature` SET
  `position_x`= 1651.211,
  `position_y`=-5994.667,
  `position_z`=133.5836
WHERE `id`=28542;

UPDATE `creature` SET  `position_x`= 1385.928,
  `position_x`=1385.928,
  `position_y`= -5702.061,
  `position_z`= 146.3048,
  `orientation`=4.153883
WHERE `id`=28544;
/* cs_bf.cpp */

SET @id = 257;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'bf';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'bf start';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'bf stop';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'bf switch';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'bf timer';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'bf enabled';

DELETE FROM `spell_script_names` WHERE `spell_id` IN (63276,63278);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(63276,'spell_general_vezax_mark_of_the_faceless'),
(63278,'spell_general_vezax_mark_of_the_faceless_leech');
DELETE FROM `trinity_string` WHERE `entry` IN (453, 548, 549, 550, 714, 716, 749, 752, 843, 844, 845, 846, 847, 848, 849, 850, 851, 852, 853, 854, 871); 
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES
(453,'│Player %s %s (guid: %u)'),
(548,'│ GM Mode active, Phase: -1'),
(549,'├─ Banned: (Type: %s, Reason: %s, Time: %s, By: %s)'),
(550,'├─ Muted: (Reason: %s, Time: %s, By: %s)'),
(714,'│ Account: %s (ID: %u), GMLevel: %u'),
(716,'│ Last Login: %s (Failed Logins: %u)'),
(749,'│ OS: %s - Latency: %u ms - Mail: %s'),
(752,'│ Last IP: %s (Locked: %s)'),
(843,'│ Level: %u (%u/%u XP (%u XP left))'),
(844,'│ Race: %s %s, %s'),
(845,'│ Alive ?: %s'),
(846,'│ Phase: %u'),
(847,'│ Money: %ug%us%uc'),
(848,'│ Map: %s, Area: %s, Zone: %s'),
(849,'│ Guild: %s (ID: %u)'),
(850,'├─ Rank: %s'),
(851,'├─ Note: %s'),
(852,'├─ O. Note: %s'),
(853,'│ Played time: %s'),
(854,'└ Mails: %d Read/%u Total'),
(871,'│ Level: %u');
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (25510,25511,25512,25513);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (25510,25511,25512,25513) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(25510, 0, 0, 0, 8, 0, 100, 1, 45692, 0, 0, 0, 33, 25510, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '1st Kvaldir Vessel (The Serpent''s Maw) - On Spellhit "Use Tuskarr Torch" - Give Quest Credit'),
(25511, 0, 0, 0, 8, 0, 100, 1, 45692, 0, 0, 0, 33, 25511, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '2nd Kvaldir Vessel (The Kur Drakkar) - On Spellhit "Use Tuskarr Torch" - Give Quest Credit'),
(25512, 0, 0, 0, 8, 0, 100, 1, 45692, 0, 0, 0, 33, 25512, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '3rd Kvaldir Vessel (Bor''s Hammer) - On Spellhit "Use Tuskarr Torch" - Give Quest Credit'),
(25513, 0, 0, 0, 8, 0, 100, 1, 45692, 0, 0, 0, 33, 25513, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '4th Kvaldir Vessel (Bor''s Anvil) - On Spellhit "Use Tuskarr Torch" - Give Quest Credit');
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (19866,19867,19868);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (19866,19867,19868) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(19866, 0, 0, 0, 8, 0, 100, 1, 34646, 0, 0, 0, 33, 19866, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Invis East KV Rune - On Spellhit "Activate Kirin''Var Rune" - Give Quest Credit'),
(19867, 0, 0, 0, 8, 0, 100, 1, 34646, 0, 0, 0, 33, 19867, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Invis NE KV Rune - On Spellhit "Activate Kirin''Var Rune" - Give Quest Credit'),
(19868, 0, 0, 0, 8, 0, 100, 1, 34646, 0, 0, 0, 33, 19868, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Invis West KV Rune - On Spellhit "Activate Kirin''Var Rune" - Give Quest Credit');
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (19723,19724) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(19723, 0, 0, 1, 8, 0, 100, 1, 34526, 0, 0, 0, 80, 1972300, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Invis BE Ballista - On Spellhit - Run Script'),
(19723, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 19723, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Invis BE Ballista - On Spellhit (Link) - Quest Credit'),
(19724, 0, 0, 1, 8, 0, 100, 1, 34526, 0, 0, 0, 80, 1972400, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Invis BE Tent - On Spellhit - Run Script'),
(19724, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 19724, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Invis BE Tent - On Spellhit (Link) - Quest Credit');
-- --------------------------------------------------------------------------------------
-- -- Skinning Loot Revamp by ZxBiohazardZx
-- --------------------------------------------------------------------------------------
SET @var := 100000; -- Set this to the reference value, gap is 10 minimum, more ofc later (10<00X>)?
-- Delete old junk that isnt needed & assign new template to those creatures:
UPDATE `creature_template` SET `skinloot`=0 WHERE `entry`=534;
DELETE FROM `skinning_loot_template` WHERE `entry`=534;
UPDATE `creature_template` SET `skinloot`=@var WHERE `skinloot` IN (721,883,890,2098,2442,2620,4166,5951,17467,10780,12296,12297,12298);
DELETE FROM `skinning_loot_template` WHERE `entry` IN(721,883,890,2098,2442,2620,4166,5951,17467,10780,12296,12297,12298);
-- Var+1
UPDATE `creature_template` SET `skinloot`=@var+1 WHERE `skinloot`=100007;
DELETE FROM `skinning_loot_template` WHERE `entry`=100007;
-- Var+2
-- --------------------------------------------------------------------------------------
UPDATE `creature_template` SET `skinloot`=@var+2 WHERE `skinloot` IN (
 113, 118, 119, 330, 390, 524, 525, 822, 834,1125,1126,1127,1128,1131,1132,1133,1134,1135,
1137,1138,1190,1196,1199,1201,1547,1548,1549,1553,1554,1689,1765,1922,2033,2034,2042,2043,
2070,2175,2956,2957,2958,2959,2960,2972,2973,3035,3068,3099,3100,3110,3121,3122,3123,3125,
3126,3127,3130,3131,3225,3226,3227,3566,5807,6789,10105,10356,14430,15650,15651,15652,
16347,16353,17199,17200,17202,17203,17345,17372,17373);
DELETE FROM `skinning_loot_template` WHERE `entry` IN (
 113, 118, 119, 330, 390, 524, 525, 822, 834,1125,1126,1127,1128,1131,1132,1133,1134,1135,
1137,1138,1190,1196,1199,1201,1547,1548,1549,1553,1554,1689,1765,1922,2033,2034,2042,2043,
2070,2175,2956,2957,2958,2959,2960,2972,2973,3035,3068,3099,3100,3110,3121,3122,3123,3125,
3126,3127,3130,3131,3225,3226,3227,3566,5807,6789,10105,10356,14430,15650,15651,15652,
16347,16353,17199,17200,17202,17203,17345,17372,17373);
-- Var+3
-- --------------------------------------------------------------------------------------
UPDATE `creature_template` SET `skinloot`=@var+3 WHERE `skinloot` IN (
 157, 454, 833,1130,1186,1188,1191,1271,1388,1693,1766,1769,1770,1778,1779,1782,1797,1892,
1893,1896,1924,1961,1972,2069,2163,2164,2185,2321,2322,2974,3056,3058,3231,3234,3241,3242,
3243,3244,3246,3248,3254,3255,3415,3425,3461,3531,4127,4316,5829,5865,12431,12432,16348,
16354,17347,17525,17556);
DELETE FROM `skinning_loot_template` WHERE `entry` IN (
 157, 454, 833,1130,1186,1188,1191,1271,1388,1693,1766,1769,1770,1778,1779,1782,1797,1892,
1893,1896,1924,1961,1972,2069,2163,2164,2185,2321,2322,2974,3056,3058,3231,3234,3241,3242,
3243,3244,3246,3248,3254,3255,3415,3425,3461,3531,4127,4316,5829,5865,12431,12432,16348,
16354,17347,17525,17556);
-- Var+4 
-- --------------------------------------------------------------------------------------
UPDATE `creature_template` SET `skinloot`=@var+4 WHERE `skinloot` IN (
 213, 547, 565,1189,1192,1224,2071,2165,2172,2187,2237,2323,3236,3240,3245,3247,3256,3257,
3398,3416,3424,3426,3463,3466,3475,3721,3816,3823,4008,4009,4011,4129,5053,6788,10644,16349,
16355,17348,17527,17588,17589);
DELETE FROM `skinning_loot_template` WHERE `entry` IN (
 213, 547, 565,1189,1192,1224,2071,2165,2172,2187,2237,2323,3236,3240,3245,3247,3256,3257,
3398,3416,3424,3426,3463,3466,3475,3721,3816,3823,4008,4009,4011,4129,5053,6788,10644,16349,
16355,17348,17527,17588,17589);
-- Var+5 
-- --------------------------------------------------------------------------------------
UPDATE `creature_template` SET `skinloot`=@var+5 WHERE `skinloot` IN (
 335, 345, 521, 628, 819, 923,1015,1016,1017,1020,1021,1022,1258,1400,1417,1923,2089,2275,
2351,2354,2356,2384,2476,2529,3235,3237,3238,3239,3249,3250,3252,3472,3473,3474,3774,3809,
3810,3817,3824,4012,4013,4014,4015,4016,4018,4019,4031,4032,4042,4044,4067,4117,4126,4126,
4128,4250,5835,12678,12723,12940);
DELETE FROM `skinning_loot_template` WHERE `entry` IN (
 335, 345, 521, 628, 819, 923,1015,1016,1017,1020,1021,1022,1258,1400,1417,1923,2089,2275,
2351,2354,2356,2384,2476,2529,3235,3237,3238,3239,3249,3250,3252,3472,3473,3474,3774,3809,
3810,3817,3824,4012,4013,4014,4015,4016,4018,4019,4031,4032,4042,4044,4067,4117,4126,4126,
4128,4250,5835,12678,12723,12940);
-- Var+6 
-- --------------------------------------------------------------------------------------
UPDATE `creature_template` SET `skinloot`=@var+6 WHERE `skinloot` IN (1225,3653,3851,3853,3854,3855,3861,3862,3864,3865,3914,5058);
DELETE FROM `skinning_loot_template` WHERE `entry` IN (1225,3653,3851,3853,3854,3855,3861,3862,3864,3865,3914,5058);
-- Var+7 
-- --------------------------------------------------------------------------------------
UPDATE `creature_template` SET `skinloot`=@var+7 WHERE `skinloot` IN (3857,3859,3866,3868,3886,4279,4511,4514,4824,4827,4887,14357);
DELETE FROM `skinning_loot_template` WHERE `entry` IN (3857,3859,3866,3868,3886,4279,4511,4514,4824,4827,4887,14357);
-- Var+8
-- --------------------------------------------------------------------------------------
UPDATE `creature_template` SET `skinloot`=@var+8 WHERE `skinloot` IN (1042,1043,1069);
DELETE FROM `skinning_loot_template` WHERE `entry` IN (1042,1043,1069);
-- Var+9
-- --------------------------------------------------------------------------------------
UPDATE `creature_template` SET `skinloot`=@var+9 WHERE `skinloot` IN (3630,3631,3632,3633,3634,3636,3637,3641,5048,5056,5755,5756,5762,8886,20797);
DELETE FROM `skinning_loot_template` WHERE `entry` IN (3630,3631,3632,3633,3634,3636,3637,3641,5048,5056,5755,5756,5762,8886,20797);
-- Var+10
-- --------------------------------------------------------------------------------------
UPDATE `creature_template` SET `skinloot`=@var+10 WHERE `skinloot` IN (
 205, 206, 533, 681, 683, 855, 898, 920,1018,1019,1023,1150,1353,2248,2385,2408,2559,3476,
3789,3791,3811,3815,3818,3825,4017,4041,4107,4109,4110,4118,4119,4124,4142,4147,4248,4249,4548,
4688,5827,6071,6167,10116,10882,12677);
DELETE FROM `skinning_loot_template` WHERE `entry` IN (
 205, 206, 533, 681, 683, 855, 898, 920,1018,1019,1023,1150,1353,2248,2385,2408,2559,3476,
3789,3791,3811,3815,3818,3825,4017,4041,4107,4109,4110,4118,4119,4124,4142,4147,4248,4249,4548,
4688,5827,6071,6167,10116,10882,12677);
-- Var+11
-- --------------------------------------------------------------------------------------
UPDATE `creature_template` SET `skinloot`=@var+11 WHERE `skinloot` IN (
 507, 682, 685, 686, 688, 689, 736, 856,1084,1085,1108,1151,1152,2249,2250,2251,2406,
2407,2560,2727,4139,4140,4143,4144,4150,4151,4304,4341,4351,4689,4696,4697,4700,4726,
4728,10131,10992,12676);
DELETE FROM `skinning_loot_template` WHERE `entry` IN (
 507, 682, 685, 686, 688, 689, 736, 856,1084,1085,1108,1151,1152,2249,2250,2251,2406,
2407,2560,2727,4139,4140,4143,4144,4150,4151,4304,4341,4351,4689,4696,4697,4700,4726,
4728,10131,10992,12676);
-- Var+12
-- --------------------------------------------------------------------------------------
UPDATE `creature_template` SET `skinloot`=@var+12 WHERE `skinloot` IN (
3927,4274,4515,4538,4825,4829);
DELETE FROM `skinning_loot_template` WHERE `entry` IN (
3927,4274,4515,4538,4825,4829);
-- Var+13
UPDATE `creature_template` SET `skinloot`=@var+13 WHERE `skinloot` IN 
(687, 690, 728, 767, 772, 854, 874,1082,1114,1557,2473,2561,2728,2729,2731,2732,4342,4343,
4344,4345,4347,4348,4352,4355,4356,4357,4388,4662,4678,4681,4685,4690,4699,4701,4702,4727,
4729,10136,11785,13602,14227,14232,14233);
DELETE FROM `skinning_loot_template` WHERE `entry` IN
(687, 690, 728, 767, 772, 854, 874,1082,1114,1557,2473,2561,2728,2729,2731,2732,4342,4343,
4344,4345,4347,4348,4352,4355,4356,4357,4388,4662,4678,4681,4685,4690,4699,4701,4702,4727,
4729,10136,11785,13602,14227,14232,14233);

-- Var+14
UPDATE `creature_template` SET `skinloot`=@var+14 WHERE `skinloot` IN 
( 730,1087,1511,1514,1516,1550,1551,1558,2657,2658,2734,4389,4841,5224,5260,5268,5272,5300,
5304,5305,5307,5308,5419,5420,5425,5426,7268,11786,12741);
DELETE FROM `skinning_loot_template` WHERE `entry` IN
( 730,1087,1511,1514,1516,1550,1551,1558,2657,2658,2734,4389,4841,5224,5260,5268,5272,5300,
5304,5305,5307,5308,5419,5420,5425,5426,7268,11786,12741);

-- --------------------------------------------------------------------------------------
-- -- Add the new profiles
-- --------------------------------------------------------------------------------------
DELETE FROM `skinning_loot_template` WHERE `entry` BETWEEN @var AND @var+15;
INSERT INTO `skinning_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
-- Var (Light Leather)
(@var,2318,90,1,1,1,1), -- Ruined Leather Scraps
(@var,2934,10,1,1,1,1), -- Light Leather
-- Var+1 (Light Leather) -- 
(@var+1,2934,80,1,1,1,1), -- Light Leather
(@var+1, 783,20,1,1,1,1), -- Light Hide
-- Var+2 (Light Leather
(@var+2,2934,60,1,1,1,1), -- Ruined Leather Scraps
(@var+2,2318,40,1,1,1,1), -- Light Leather
-- Var+3 (Light Leather)
(@var+3,2318,60,1,1,1,1), -- Light Leather
(@var+3,2934,35,1,1,1,1), --  Ruined Leather Scraps
(@var+3, 783, 5,1,1,1,1), --  Light Hide
-- Var+4 (Light/Medium Leather
(@var+4,2318,72,1,1,1,2), -- Light Leather
(@var+4,2319,20,1,1,1,1), -- Medium Leather
(@var+4, 783, 5,1,1,1,1), -- Light Hide
(@var+4,4232, 3,1,1,1,1), -- Medium Hide
-- Var+5 (Light/Medium Leather
(@var+5,2319,50,1,1,1,1), -- Medium Leather
(@var+5,2318,42,1,1,1,2), -- Light Leather
(@var+5, 783, 5,1,1,1,1), -- Light Hide
(@var+5,4232, 3,1,1,1,1), -- Medium Hide
-- Var+6 (Light/Medium Leather2)
(@var+6,2318,65,1,1,1,2), -- Light Leather
(@var+6,2319,25,1,1,1,2), -- Medium Leather
(@var+6, 783, 7,1,1,1,1), -- Light Hide
(@var+6,4232, 3,1,1,1,1), -- Medium Hide
-- Var+7 (Light/Medium Leather2)
(@var+7,2318,55,1,1,1,2), -- Light Leather
(@var+7,2319,35,1,1,1,2), -- Medium Leather
(@var+7, 783, 7,1,1,1,1), -- Light Hide
(@var+7,4232, 3,1,1,1,1), -- Medium Hide
-- Var+8 (Red Whelp Scale Dragons)
(@var+8,2318,37,1,1,1,2), -- Light Leather
(@var+8,2319,45,1,1,1,1), -- Medium Leather
(@var+8, 783, 3,1,1,1,1), -- Light Hide
(@var+8,4232, 5,1,1,1,1), -- Medium Hide
(@var+8,7287,10,1,1,1,1), -- Red Whelp Scale
-- Var+9 (Deviate Scales)
(@var+9,2318,50,1,1,1,2), -- Light Leather
(@var+9,2319,25,1,1,1,2), -- Medium Leather
(@var+9,6470,10,1,1,1,1), -- Deviate Scale
(@var+9, 783, 7,1,1,1,1), -- Light Hide
(@var+9,6471, 5,1,1,1,1), -- Perfect Deviate Scale
(@var+9,4232, 3,1,1,1,1), -- Medium Hide
-- Var+10 (Medium Leather)
(@var+10,2319,73,1,1,1,1), -- Medium Leather
(@var+10,4234,20,1,1,1,1), -- Heavy Leather
(@var+10,4232, 5,1,1,1,1), -- Medium Hide
(@var+10,4235, 2,1,1,1,1), -- Heavy Hide
-- Var+11 (Medium Leather)
(@var+11,4234,51,1,1,1,1), -- Heavy Leather
(@var+11,2319,42,1,1,1,1), -- Medium Leather
(@var+11,4232, 4,1,1,1,1), -- Medium Hide
(@var+11,4235, 3,1,1,1,1), -- Heavy Hide
-- Var+12 (Medium Leather)
(@var+12,2319,64,1,1,1,2), -- Medium Leather
(@var+12,4234,27,1,1,1,2), -- Heavy Leather
(@var+12,4232, 6,1,1,1,1), -- Medium Hide
(@var+12,4235, 3,1,1,1,1), -- Heavy Hide
-- Var+13 (Heavy Leather)
(@var+13,4234,77,1,1,1,1), -- Heavy Leather
(@var+13,4304,20,1,1,1,1), -- Thick Leather
(@var+13,4235, 3,1,1,1,1), -- Heavy Hide
-- Var+14 (Heavy Leather)
(@var+14,4304,50,1,1,1,1), -- Thick Leather
(@var+14,4234,45,1,1,1,1), -- Heavy Leather
(@var+14,8169, 3,1,1,1,1), -- Thick Hide
(@var+14,4235, 2,1,1,1,1), -- Heavy Hide
-- Var+15 (Green Whelp Scale)
(@var+15,4234,40,1,1,1,1), -- Heavy Leather
(@var+15,2319,33,1,1,1,1), -- Medium Leather
(@var+15,7392,20,1,1,1,1), -- Green Whelp Scale
(@var+15,4232, 4,1,1,1,1), -- Medium Hide
(@var+15,4235, 3,1,1,1,1); -- Heavy Hide
DELETE FROM `creature_addon` WHERE `auras` LIKE '%46598%'; -- no need to specify GUID, these are unique
DELETE FROM `creature_addon` WHERE `auras` LIKE '%43671%'; -- no need to specify GUID, these are unique
DELETE FROM `creature_addon` WHERE `guid`=85236;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(85236,0,22471,0,1,0,'63500 64718');
DELETE FROM `creature_addon` WHERE `guid` IN (132681,128620);
DELETE FROM `trinity_string` WHERE `entry` IN (749, 872, 873, 874, 875, 876, 877, 878, 879, 880, 881);
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES
(749,'│ OS: %s - Latency: %u ms'),
(872, 'Entered email is not equal to registration email, check input'),
(873, 'The new emails do not match'),
(874, 'The email was changed'),
(875, 'Your email can''t be longer than 64 characters, email not changed!'),
(876, 'Email not changed (unknown error)!'),
(877, 'Email change unnecessary, new email is equal to old email'),
(878, 'Your email is: %s'),
(879, '│ Registration Email: %s - Email: %s'),
(880, 'Security Level: %s'),
(881, 'You require an email to change your password.');

UPDATE `command` SET `help` = 'Syntax: .account password $old_password $new_password $new_password [$email]\r\n\r\nChange your account password. You may need to check the actual security mode to see if email input is necessary.' WHERE name = 'account password';
UPDATE `command` SET `help` = 'Syntax: .account\r\n\r\nDisplay the access level of your account and the email adress if you possess the necessary permissions.' WHERE name = 'account';

DELETE FROM `command` WHERE `name` = 'account email';
DELETE FROM `command` WHERE `name` = 'account set sec email';
DELETE FROM `command` WHERE `name` = 'account set sec regmail';

INSERT INTO `command` (`name`, `permission`, `help`) VALUES
('account email', 263, 'Syntax: .account email $oldemail $currentpassword $newemail $newemailconfirmation\r\n\r\n Change your account email. You may need to check the actual security mode to see if email input is necessary for password change'),
('account set sec email', 265, 'Syntax: .account set sec email $accountname $email $emailconfirmation\r\n\r\nSet the email for entered player account.'),
('account set sec regmail', 266, 'Syntax: .account set sec regmail $account $regmail $regmailconfirmation\r\n\r\nSets the regmail for entered player account.');
UPDATE `smart_scripts` SET `target_type`=7 WHERE `entryorguid` IN (18818,21237,19009,21236) AND `source_type`=0 AND `id`=1;
/* cs_cheat.cpp */

SET @id = 291;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'cheat';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'cheat casttime';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'cheat cooldown';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'cheat explore';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'cheat god';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'cheat power';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'cheat status';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'cheat taxi';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'cheat waterwalk';
/* cs_debug.cpp */

SET @id = 300;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'debug';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'debug anim';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'debug areatriggers';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'debug arena';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'debug bg';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'debug entervehicle';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'debug getitemstate';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'debug getitemvalue';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'debug getvalue';
UPDATE `command` SET `permission` = @id+9 WHERE `name` = 'debug hostil';
UPDATE `command` SET `permission` = @id+10 WHERE `name` = 'debug itemexpire';
UPDATE `command` SET `permission` = @id+11 WHERE `name` = 'debug lootrecipient';
UPDATE `command` SET `permission` = @id+12 WHERE `name` = 'debug los';
UPDATE `command` SET `permission` = @id+13 WHERE `name` = 'debug mod32value';
UPDATE `command` SET `permission` = @id+14 WHERE `name` = 'debug moveflags';
UPDATE `command` SET `permission` = @id+15 WHERE `name` = 'debug play';
UPDATE `command` SET `permission` = @id+16 WHERE `name` = 'debug play cinematics';
UPDATE `command` SET `permission` = @id+17 WHERE `name` = 'debug play movie';
UPDATE `command` SET `permission` = @id+18 WHERE `name` = 'debug play sound';
UPDATE `command` SET `permission` = @id+19 WHERE `name` = 'debug send';
UPDATE `command` SET `permission` = @id+20 WHERE `name` = 'debug send buyerror';
UPDATE `command` SET `permission` = @id+21 WHERE `name` = 'debug send channelnotify';
UPDATE `command` SET `permission` = @id+22 WHERE `name` = 'debug send chatmessage';
UPDATE `command` SET `permission` = @id+23 WHERE `name` = 'debug send equiperror';
UPDATE `command` SET `permission` = @id+24 WHERE `name` = 'debug send largepacket';
UPDATE `command` SET `permission` = @id+25 WHERE `name` = 'debug send opcode';
UPDATE `command` SET `permission` = @id+26 WHERE `name` = 'debug send qinvalidmsg';
UPDATE `command` SET `permission` = @id+27 WHERE `name` = 'debug send qpartymsg';
UPDATE `command` SET `permission` = @id+28 WHERE `name` = 'debug send sellerror';
UPDATE `command` SET `permission` = @id+29 WHERE `name` = 'debug send setphaseshift';
UPDATE `command` SET `permission` = @id+30 WHERE `name` = 'debug send spellfail';
UPDATE `command` SET `permission` = @id+31 WHERE `name` = 'debug setaurastate';
UPDATE `command` SET `permission` = @id+32 WHERE `name` = 'debug setbit';
UPDATE `command` SET `permission` = @id+33 WHERE `name` = 'debug setitemvalue';
UPDATE `command` SET `permission` = @id+34 WHERE `name` = 'debug setvalue';
UPDATE `command` SET `permission` = @id+35 WHERE `name` = 'debug setvid';
UPDATE `command` SET `permission` = @id+36 WHERE `name` = 'debug spawnvehicle';
UPDATE `command` SET `permission` = @id+37 WHERE `name` = 'debug threat';
UPDATE `command` SET `permission` = @id+38 WHERE `name` = 'debug update';
UPDATE `command` SET `permission` = @id+39 WHERE `name` = 'debug uws';
UPDATE `command` SET `permission` = @id+40 WHERE `name` = 'wpgps';
/* cs_deserter.cpp */

SET @id = 341;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'deserter';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'deserter bg';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'deserter bg add';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'deserter bg remove';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'deserter instance';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'deserter instance add';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'deserter instance remove';
/* cs_disable.cpp */

SET @id = 348;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'disable';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'disable add';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'disable add achievement_criteria';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'disable add battleground';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'disable add map';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'disable add mmap';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'disable add outdoorpvp';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'disable add quest';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'disable add spell';
UPDATE `command` SET `permission` = @id+9 WHERE `name` = 'disable add vmap';
UPDATE `command` SET `permission` = @id+10 WHERE `name` = 'disable remove';
UPDATE `command` SET `permission` = @id+11 WHERE `name` = 'disable remove achievement_criteria';
UPDATE `command` SET `permission` = @id+12 WHERE `name` = 'disable remove battleground';
UPDATE `command` SET `permission` = @id+13 WHERE `name` = 'disable remove map';
UPDATE `command` SET `permission` = @id+14 WHERE `name` = 'disable remove mmap';
UPDATE `command` SET `permission` = @id+15 WHERE `name` = 'disable remove outdoorpvp';
UPDATE `command` SET `permission` = @id+16 WHERE `name` = 'disable remove quest';
UPDATE `command` SET `permission` = @id+17 WHERE `name` = 'disable remove spell';
UPDATE `command` SET `permission` = @id+18 WHERE `name` = 'disable remove vmap';
/* cs_event.cpp */

SET @id = 367;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'event';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'event activelist';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'event start';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'event stop';
/* cs_gm.cpp */

SET @id = 371;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'gm';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'gm chat';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'gm fly';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'gm ingame';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'gm list';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'gm visible';
/* cs_go.cpp */

SET @id = 371;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'go';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'go creature';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'go graveyard';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'go grid';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'go object';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'go taxinode';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'go ticket';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'go trigger';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'go xyz';
UPDATE `command` SET `permission` = @id+9 WHERE `name` = 'go zonexy';
/* cs_gobject.cpp */

SET @id = 371;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'gobject';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'gobject activate';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'gobject add';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'gobject add temp';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'gobject delete';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'gobject info';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'gobject move';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'gobject near';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'gobject set';
UPDATE `command` SET `permission` = @id+9 WHERE `name` = 'gobject set phase';
UPDATE `command` SET `permission` = @id+10 WHERE `name` = 'gobject set state';
UPDATE `command` SET `permission` = @id+11 WHERE `name` = 'gobject target';
UPDATE `command` SET `permission` = @id+12 WHERE `name` = 'gobject turn';
/* cs_guild.cpp */

SET @id = 401;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'guild';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'guild create';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'guild delete';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'guild invite';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'guild uninvite';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'guild rank';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'guild rename';
/* cs_honor.cpp */

SET @id = 408;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'honor';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'honor add';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'honor add kill';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'honor update';
/* cs_instance.cpp */

SET @id = 408;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'instance';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'instance listbinds';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'instance unbind';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'instance stats';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'instance savedata';
/* cs_learn.cpp */

SET @id = 417;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'learn';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'learn all';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'learn all my';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'learn all my class';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'learn all my pettalents';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'learn all my spells';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'learn all my talents';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'learn all gm';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'learn all crafts';
UPDATE `command` SET `permission` = @id+9 WHERE `name` = 'learn all default';
UPDATE `command` SET `permission` = @id+10 WHERE `name` = 'learn all lang';
UPDATE `command` SET `permission` = @id+11 WHERE `name` = 'learn all recipes';
UPDATE `command` SET `permission` = @id+12 WHERE `name` = 'unlearn';
/* cs_lfg.cpp */

SET @id = 430;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'lfg';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'lfg player';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'lfg group';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'lfg queue';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'lfg clean';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'lfg options';
/* cs_list.cpp */

SET @id = 436;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'list';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'list creature';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'list item';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'list object';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'list auras';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'list mail';
/* cs_lookup.cpp */

SET @id = 442;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'lookup';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'lookup area';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'lookup creature';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'lookup event';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'lookup faction';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'lookup item';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'lookup itemset';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'lookup object';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'lookup quest';
UPDATE `command` SET `permission` = @id+9 WHERE `name` = 'lookup player';
UPDATE `command` SET `permission` = @id+10 WHERE `name` = 'lookup player ip';
UPDATE `command` SET `permission` = @id+11 WHERE `name` = 'lookup player account';
UPDATE `command` SET `permission` = @id+12 WHERE `name` = 'lookup player email';
UPDATE `command` SET `permission` = @id+13 WHERE `name` = 'lookup skill';
UPDATE `command` SET `permission` = @id+14 WHERE `name` = 'lookup spell';
UPDATE `command` SET `permission` = @id+15 WHERE `name` = 'lookup spell id';
UPDATE `command` SET `permission` = @id+16 WHERE `name` = 'lookup taxinode';
UPDATE `command` SET `permission` = @id+17 WHERE `name` = 'lookup tele';
UPDATE `command` SET `permission` = @id+18 WHERE `name` = 'lookup title';
UPDATE `command` SET `permission` = @id+19 WHERE `name` = 'lookup map';
/* cs_message.cpp */

SET @id = 462;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'announce';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'channel';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'channel set';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'channel set ownership';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'gmannounce';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'gmnameannounce';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'gmnotify';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'nameannounce';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'notify';
UPDATE `command` SET `permission` = @id+9 WHERE `name` = 'whispers';
/* cs_cast.cpp */

SET @id = 263;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'cast';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'cast back';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'cast dist';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'cast self';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'cast target';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'cast dest';
/* cs_character.cpp */

SET @id = 273;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0  WHERE `name` = 'character';
UPDATE `command` SET `permission` = @id+1  WHERE `name` = 'character customize';
UPDATE `command` SET `permission` = @id+2  WHERE `name` = 'character changefaction';
UPDATE `command` SET `permission` = @id+3  WHERE `name` = 'character changerace';
UPDATE `command` SET `permission` = @id+4  WHERE `name` = 'character deleted';
UPDATE `command` SET `permission` = @id+5  WHERE `name` = 'character deleted delete';
UPDATE `command` SET `permission` = @id+6  WHERE `name` = 'character deleted list';
UPDATE `command` SET `permission` = @id+7  WHERE `name` = 'character deleted restore';
UPDATE `command` SET `permission` = @id+8  WHERE `name` = 'character deleted old';
UPDATE `command` SET `permission` = @id+9  WHERE `name` = 'character erase';
UPDATE `command` SET `permission` = @id+10 WHERE `name` = 'character level';
UPDATE `command` SET `permission` = @id+11 WHERE `name` = 'character rename';
UPDATE `command` SET `permission` = @id+12 WHERE `name` = 'character reputation';
UPDATE `command` SET `permission` = @id+13 WHERE `name` = 'character titles';
UPDATE `command` SET `permission` = @id+14 WHERE `name` = 'levelup';
UPDATE `command` SET `permission` = @id+15 WHERE `name` = 'pdump';
UPDATE `command` SET `permission` = @id+16 WHERE `name` = 'pdump load';
UPDATE `command` SET `permission` = @id+17 WHERE `name` = 'pdump write';
DELETE FROM `spelldifficulty_dbc` WHERE `id` IN (51849, 50840, 50834, 50830, 50831);
INSERT INTO `spelldifficulty_dbc`(`id`,`spellid0`,`spellid1`) VALUES
(51849, 51849, 59861),
(50840, 50840, 59848),
(50834, 50834, 59846),
(50830, 50830, 59844),
(50831, 50831, 59845);
-- Random comment
SET @QUEST              := 12470; -- Mystery of the Infinite (12470)
SET @NPC_HoE            := 27840; -- Hourglass of Eternity
SET @NPC_FU             := 27899; -- Future You
SET @NPC_ICM            := 27898; -- Infinite Chrono-Magus
SET @NPC_IA             := 27896; -- Infinite Assailant
SET @NPC_ID             := 27897; -- Infonite Destroyer
SET @NPC_IT             := 27900; -- Infinite Timerender
SET @SPELL_SUMMON_FU    := 49942; -- Mystery of the Infinite: Force Cast to Player of Summon Future You
SET @SPELL_CAST         := 49686; -- Mystery of the Infinite: Script Effect Player Cast Mirror Image
SET @SPELL_MIRROR       := 49889; -- Mystery of the Infinite: Future You's Mirror Image Aura
SET @SPELL_NEARBY       := 50867; -- Hourglass of Eternity Nearby
SET @AURA_VISUAL        := 50057; -- Mystery of the Infinite: Hourglass of Eternity Visual/Sound Aura
SET @AURA_CLASS         := 49925; -- Mystery of the Infinite: Future You's Mirror Class Aura
SET @FU_SAY_RAND        := 50037; -- Mystery of the Infinite: Future You's Whisper to Controller - Random
SET @FU_SAY_BYE         := 50023; -- Mystery of the Infinite: Future You's Whisper to Controller - Farewell
SET @FU_SAY_NOZD        := 50014; -- Mystery of the Infinite: Future You's Whisper to Controller - Nozdormu
SET @VIEW_INVISIBILITY  := 50020; -- Mystery of the Infinite: Hourglass cast See Invis on Master
SET @VIEW_INVISIBILITY1 := 50012; -- See Nozdormu Invisibility
SET @FU_DESPAWN_TIME    := 50022; -- Mystery of the Infinite: Future You's Despawn Timer
SET @SPELL_ASSAILANT    := 49900; -- Summon Infinite Assailant
SET @SPELL_DESTROYER    := 49901; -- Summon Infinite Destroyer
SET @SPELL_MAGUS        := 49902; -- Summon Infinite Chrono-Magus
SET @SPELL_TIMERENDER   := 49905; -- Summon Infinite Timerender

-- Hourglass of Eternity
UPDATE `creature` SET `orientation`=2.085232 WHERE `guid`=152260;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=27925;
UPDATE `creature_template` SET `AIName`='SmartAI',`RegenHealth`=0 WHERE `entry`=@NPC_HoE;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=@NPC_HoE AND `source_type`=0) OR (`entryorguid`IN (@NPC_HoE*100,@NPC_HoE*100+1) AND `source_type`=9);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_HoE,0,0,1,54,0,100,1,0,0,0,0,85,@SPELL_SUMMON_FU,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On spawn - Invoker Cast'),
(@NPC_HoE,0,1,2,61,0,100,0,0,0,0,0,11,@SPELL_NEARBY,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On link - Cast Spell'),
(@NPC_HoE,0,2,3,61,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - Set passive - Self'),
(@NPC_HoE,0,3,6,61,0,100,0,0,0,0,0,80,@NPC_HoE*100,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On link - Start timed script'),
(@NPC_HoE,0,4,0,6,0,100,0,0,0,0,0,6,@QUEST,0,0,0,0,0,16,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On Death - Fail Quest'),
(@NPC_HoE,0,5,0,38,0,100,0,2,1,0,0,80,@NPC_HoE*100+1,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On Data Set  - Start timed script two'),
(@NPC_HoE,0,6,0,61,0,100,0,0,0,0,0,11,@AURA_VISUAL,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On link - Cast Spell'),

-- Wave 1 + Random speech
(@NPC_HoE*100,9,0,0,0,0,100,1,5000,5000,0,0,45,1,1,0,0,0,0,19,@NPC_FU,20,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Set Data on Future You'),
(@NPC_HoE*100,9,1,0,0,0,100,1,5000,5000,0,0,45,1,2,0,0,0,0,19,@NPC_FU,20,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Set Data on Future You'),
(@NPC_HoE*100,9,2,0,0,0,100,1,5000,5000,0,0,11,@SPELL_MAGUS,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Cast Spell on self'),
(@NPC_HoE*100,9,3,0,0,0,100,1,0,0,0,0,11,@SPELL_ASSAILANT,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Cast Spell on self'),
-- Wave 2 + Random speech
(@NPC_HoE*100,9,4,0,0,0,100,1,5000,5000,0,0,45,1,3,0,0,0,0,19,@NPC_FU,20,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Set Data on Future You'),
(@NPC_HoE*100,9,5,0,0,0,100,1,6000,6000,0,0,45,1,4,0,0,0,0,19,@NPC_FU,20,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Set Data on Future You'),
(@NPC_HoE*100,9,6,0,0,0,100,1,19000,19000,0,0,11,@SPELL_MAGUS,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Cast Spell on self'),
(@NPC_HoE*100,9,7,0,0,0,100,1,0,0,0,0,11,@SPELL_MAGUS,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Cast Spell on self'),
-- Wave 3 + Random speech
(@NPC_HoE*100,9,8,0,0,0,100,1,5000,5000,0,0,45,1,5,0,0,0,0,19,@NPC_FU,20,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Set Data on Future You'),
(@NPC_HoE*100,9,9,0,0,0,100,1,6000,6000,0,0,45,1,6,0,0,0,0,19,@NPC_FU,20,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Set Data on Future You'),
(@NPC_HoE*100,9,10,0,0,0,100,1,5000,5000,0,0,45,1,7,0,0,0,0,19,@NPC_FU,20,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Set Data on Future You'),
(@NPC_HoE*100,9,11,0,0,0,100,1,14000,14000,0,0,11,@SPELL_MAGUS,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Cast Spell on self'),
(@NPC_HoE*100,9,12,0,0,0,100,1,0,0,0,0,11,@SPELL_ASSAILANT,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Cast Spell on self'),
(@NPC_HoE*100,9,13,0,0,0,100,1,0,0,0,0,11,@SPELL_DESTROYER,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Cast Spell on self'),
-- Wave 4 + Random speech 
(@NPC_HoE*100,9,14,0,0,0,100,1,5000,5000,0,0,45,1,8,0,0,0,0,19,@NPC_FU,20,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Set Data on Future You'),
(@NPC_HoE*100,9,15,0,0,0,100,1,9000,9000,0,0,45,1,9,0,0,0,0,19,@NPC_FU,20,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Set Data on Future You'),
(@NPC_HoE*100,9,16,0,0,0,100,1,7000,7000,0,0,45,1,10,0,0,0,0,19,@NPC_FU,20,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Set Data on Future You'),
(@NPC_HoE*100,9,17,0,0,0,100,1,9000,9000,0,0,11,@SPELL_MAGUS,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Set Data on Future You'),
(@NPC_HoE*100,9,18,0,0,0,100,1,0,0,0,0,11,@SPELL_ASSAILANT,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'OHourglass of Eternity - On update - Cast Spell on self'),
(@NPC_HoE*100,9,19,0,0,0,100,1,0,0,0,0,11,@SPELL_DESTROYER,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Cast Spell on self'),
-- Wave 5 final + Random speech
(@NPC_HoE*100,9,20,0,0,0,100,1,23000,23000,0,0,11,@SPELL_TIMERENDER,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Cast Spell on self'),
-- End Text Script
(@NPC_HoE*100+1,9,0,0,0,0,100,1,4000,4000,0,0,45,2,1,0,0,0,0,19,@NPC_FU,20,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Set Data on Future You'),
(@NPC_HoE*100+1,9,1,0,0,0,100,1,0,0,0,0,15,@QUEST,0,0,0,0,0,21,10,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Set Give Quest Credit'),
(@NPC_HoE*100+1,9,2,0,0,0,100,1,8000,8000,0,0,45,2,2,0,0,0,0,19,@NPC_FU,20,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update - Set Data on Future You'),
(@NPC_HoE*100+1,9,3,0,0,0,100,1,0,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Hourglass of Eternity - On update -Despawn after timer');

-- Future You
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC_FU AND `source_type`=0;
UPDATE `creature_template` SET `faction_A`=2141,`faction_H`=2141,`AIName`='SmartAI',`unit_flags`=0,`RegenHealth`=0 WHERE `entry`=@NPC_FU;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_FU,0,0,1,54,0,100,1,0,0,0,0,85,@SPELL_MIRROR,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On spawn - Invoker Cast Spell - Self'),
(@NPC_FU,0,1,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,11,@NPC_HoE,10,0,0.0,0.0,0.0,0.0,'Future You - On link - Set Orientation'),
(@NPC_FU,0,2,3,38,0,100,0,1,1,0,0,11,@FU_SAY_RAND,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On Data Set - Cast spell'),
(@NPC_FU,0,3,0,61,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On spellhit - Whisper 1'),
(@NPC_FU,0,4,5,38,0,100,0,1,2,0,0,11,@FU_SAY_RAND,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On Data Set - Cast spell'),
(@NPC_FU,0,5,0,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On spellhit - Whisper 2'),
(@NPC_FU,0,6,7,38,0,100,0,1,3,0,0,11,@FU_SAY_RAND,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On Data Set - Cast spell'),
(@NPC_FU,0,7,0,61,0,100,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On spellhit - Whisper 3'),
(@NPC_FU,0,8,9,38,0,100,0,1,4,0,0,11,@FU_SAY_RAND,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On Data Set - Cast spell'),
(@NPC_FU,0,9,0,61,0,100,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On spellhit - Whisper 4'),
(@NPC_FU,0,10,11,38,0,100,0,1,5,0,0,11,@FU_SAY_RAND,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On Data Set - Cast spell'),
(@NPC_FU,0,11,0,61,0,100,0,0,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On spellhit - Whisper 5'),
(@NPC_FU,0,12,13,38,0,100,0,1,6,0,0,11,@FU_SAY_RAND,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On Data Set - Cast spell'),
(@NPC_FU,0,13,0,61,0,100,0,0,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On spellhit - Whisper 6'),
(@NPC_FU,0,14,15,38,0,100,0,1,7,0,0,11,@FU_SAY_RAND,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On Data Set - Cast spell'),
(@NPC_FU,0,15,0,61,0,100,0,0,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On spellhit - Whisper 7'),
(@NPC_FU,0,16,17,38,0,100,0,1,8,0,0,11,@FU_SAY_RAND,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On Data Set - Cast spell'),
(@NPC_FU,0,17,0,61,0,100,0,0,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On spellhit - Whisper 8'),
(@NPC_FU,0,18,19,38,0,100,0,1,9,0,0,11,@FU_SAY_RAND,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On Data Set - Cast spell'),
(@NPC_FU,0,19,0,61,0,100,0,0,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On spellhit - Whisper 9'),
(@NPC_FU,0,20,21,38,0,100,0,1,10,0,0,11,@FU_SAY_RAND,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On Data Set - Cast spell'),
(@NPC_FU,0,21,0,61,0,100,0,0,0,0,0,1,10,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On spellhit - Whisper 10'),
(@NPC_FU,0,22,23,38,0,100,0,2,1,0,0,11,@FU_SAY_NOZD,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On Data Set - Cast spell'),
(@NPC_FU,0,23,0,61,0,100,0,0,0,0,0,1,11,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On spellhit - Whisper 11'),
(@NPC_FU,0,24,25,38,0,100,0,2,2,0,0,1,12,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On Data Set - Whisper 12'),
(@NPC_FU,0,25,0,61,0,100,0,0,0,0,0,41,3000,0,0,0,0,0,11,0,0,0,0.0,0.0,0.0,0.0,'Future You - On Link - Despawn after timer'),
(@NPC_FU,0,26,27,7,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On Evade - Despawn after timer'),
(@NPC_FU,0,27,0,61,0,100,0,0,0,0,0,85,@SPELL_SUMMON_FU,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,'Future You - On Link - Cast Summon Clone');

-- Clone invoker weapons
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=@SPELL_MIRROR;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(@SPELL_MIRROR,41055,1,'Copy main weapon'),
(@SPELL_MIRROR,45206,1,'Copy off weapon');

-- Spell Area to see Nozdormu invis
DELETE FROM `spell_area` WHERE spell = @VIEW_INVISIBILITY1;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(@VIEW_INVISIBILITY1, 4175, 12470, 0, 0, 0, 2, 1, 2, 11);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=@SPELL_MIRROR;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,7,@SPELL_MIRROR,0,0,31,0,3,@NPC_FU,0,0,0,'','Spell target Future You');

DELETE FROM `creature_template_addon` WHERE `entry` IN (@NPC_HoE,@NPC_FU);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`auras`) VALUES
(@NPC_HoE,0,0x0,0x1,''),
(@NPC_FU,0,0x0,0x1,'');

-- Future You's text
DELETE FROM `creature_text` WHERE `entry`=@NPC_FU;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NPC_FU,1,0,'Hey there, $N, don''t be alarmed. It''s me... you... from the future. I''m here to help.',15,0,100,396,0,0,'Future You'),
(@NPC_FU,2,0,'Head''s up... here they come. I''ll help as much as I can. Let''s just keep them off the hourglass!',15,0,100,396,0,0,'Future You'),
(@NPC_FU,3,0,'No matter what, you can''t die, because that would mean that I would cease to exist, right? I was here before when i was you. I''m so confused!',15,0,100,0,0,0,'Future You'),
(@NPC_FU,4,0,'I can''t believe that I used to wear that.',15,0,100,0,0,0,'Future You'),
(@NPC_FU,5,0,'Sorry, but Chromie said that I couldn''t reveal anything about your future to you. She said that if I did, I would cease to exist.',15,0,100,0,0,0,'Future You'),
(@NPC_FU,6,0,'Wow, I''d forgotten how inexperienced I used to be.',15,0,100,0,0,0,'Future You'),
(@NPC_FU,7,0,'Look at you fight; no wonder I turned to drinking.',15,0,100,0,0,0,'Future You'),
(@NPC_FU,8,0,'What? Am I here alone. We both have a stake at this, you know!',15,0,100,0,0,0,'Future You'),
(@NPC_FU,9,0,'Listen. I''m not supposed to tell you this, but there''s going to be this party that you''re invited to. Whatever you do, DO NOT DRINK THE PUNCH!',15,0,100,0,0,0,'Future You'),
(@NPC_FU,10,0,'Wish I could remember how many of the Infinite Dragonflight were going to try to stop you. This fight was so long ago.',15,0,100,0,0,0,'Future You'),
(@NPC_FU,11,0,'Look, $N, the hourglass has revealed Nozdormu!',15,0,100,25,0,0,'Future You'),
(@NPC_FU,12,0,'Farewell, $N, Keep us alive and get some better equipment!',15,0,100,0,0,0,'Future You');

DELETE FROM `creature_ai_scripts` WHERE creature_id IN (27898,27900);
UPDATE `creature_template` SET `AIName`='SmartAI',`faction_A`=2111,`faction_H`=2111,`unit_flags`=559104 WHERE `entry` IN (@NPC_ICM,@NPC_IA,@NPC_ID,@NPC_IT);
-- Infinite Chrono-Magus
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@NPC_ICM;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_ICM,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Infinite Chrono-Magus - Set Phase 1 - On Aggro'),
(@NPC_ICM,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Infinite Chrono-Magus - Stop Moving - On Aggro'),
(@NPC_ICM,0,2,0,4,1,100,1,0,0,0,0,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,'Infinite Chrono-Magus - Cast bolt on Aggro'),
(@NPC_ICM,0,3,0,9,1,100,0,0,40,3400,4700,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,'Infinite Chrono-Magus -  Cast Bolt'),
(@NPC_ICM,0,4,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Infinite Chrono-Magus - Start Moving - When not in bolt Range'),
(@NPC_ICM,0,5,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Infinite Chrono-Magus - Stop Moving - 15 Yards'),
(@NPC_ICM,0,6,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Infinite Chrono-Magus - Stop Moving - When in bolt Range'),
(@NPC_ICM,0,7,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Infinite Chrono-Magus - Set Phase 2 - 15% Mana'),
(@NPC_ICM,0,8,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Infinite Chrono-Magus - Start Moving - 15% Mana'),
(@NPC_ICM,0,9,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Infinite Chrono-Magus - Set Phase 1 - When Mana is above 30%'),
(@NPC_ICM,0,10,0,0,1,100,0,8000,8000,12000,14000,11,38085,0,0,0,0,0,2,0,0,0,0,0,0,0,'Infinite Chrono-Magus - IC -Cast Shadow Blast');

-- Infinite Timerender
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@NPC_IT;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_IT,0,0,0,0,0,100,0,5000,6000,12000,17000,11,51020,0,0,0,0,0,2,0,0,0,0,0,0,0,'Infinite Timerender - IC - Cast Time Lapse'),
(@NPC_IT,0,1,0,6,0,100,0,0,0,0,0,45,2,1,0,0,0,0,19,@NPC_HoE,20,0,0,0,0,0,'Infinite Timerender - On Death - Set Data on HoE');
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25310;

DELETE FROM `smart_scripts` WHERE `entryorguid`=25310 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(25310, 0, 0, 0, 8, 0, 100, 1, 45414, 0, 0, 0, 33, 25310, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Borean - Westrift Cleftcliff Anomaly - On Spellhit "Calculate Seismic Readings" - Give Quest Credit');
-- Delete 2 incorrectly spawned mobs
DELETE FROM `creature` WHERE `guid` IN (66177,84663) AND `map` = 530;
UPDATE `creature_template` SET `spell1`=52497, `spell2`=52510 WHERE  `entry`=28843;
-- Disclosure (12710)
SET @MALMORTIS      := 28948;  -- Malmortis
SET @TRIGG_BUNNY    := 28617;  -- Drakuramas Teleport Bunny 01
SET @LOW_TRIG_B     := 114831; -- Lower Trigger Bunny Guid
SET @TRIGGER1       := 5080;   -- Lower Teleport Trigger
SET @UP_TRIG_B      := 114829; -- Upper Trigger Bunny guid
SET @TRIGGER2       := 5061;   -- Upper Teleport Trigger
SET @SCEPT_AURA     := 52678;  -- Teleporter Scepter Aura
SET @ESCORT_A       := 52839;  -- Summon Escort Aura
SET @T_SCRIPT       := 52676;  -- Drakuramas Teleport Script 03
SET @TELEPORT3      := 52677;  -- Drakuramas Teleport 03
SET @SUM_MAL        := 52775;  -- Summon Malmortis
SET @HEARTBEAT      := 61707;  -- Malmortis Heartbeat
SET @KILLCREDIT     := 53101;  -- Kill Credit
SET @T_SCRIPT2      := 52089;  -- Drakuramas Teleport Script 01
SET @TELEPORT1      := 52091;  -- Drakuramas Teleport 01

-- Drakuramas Teleport 03 position
DELETE FROM `spell_target_position` WHERE `id`=@TELEPORT3;
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(@TELEPORT3,571,6252.58, -1965.86, 484.782, 3.7);

-- Drakuramas Teleport Script 01 position
DELETE FROM `spell_target_position` WHERE `id`=@TELEPORT1;
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(@TELEPORT1,571,6165.262, -2001.812, 408.167, 2.2);

DELETE FROM `areatrigger_scripts` WHERE `entry` = @TRIGGER1;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(@TRIGGER1,'SmartTrigger');

DELETE FROM `smart_scripts` WHERE `entryorguid` =@TRIGGER1 AND `source_type`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@TRIGGER1,2,0,0,46,0,100,0,@TRIGGER1,0,0,0,45,1,1,0,0,0,0,10,@LOW_TRIG_B,@TRIGG_BUNNY,0,0,0,0,0,'');

DELETE FROM `areatrigger_scripts` WHERE `entry` = @TRIGGER2;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(@TRIGGER2,'SmartTrigger');

DELETE FROM `smart_scripts` WHERE `entryorguid` =@TRIGGER2 AND `source_type`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@TRIGGER2,2,0,0,46,0,100,0,@TRIGGER2,0,0,0,45,1,1,0,0,0,0,10,@UP_TRIG_B,@TRIGG_BUNNY,0,0,0,0,0,'');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-@LOW_TRIG_B,-@UP_TRIG_B) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)VALUES
(-@LOW_TRIG_B,0,0,0,38,0,100,0,1,1,0,0,11,@T_SCRIPT2,0,0,0,0,0,21,5,0,0,0,0,0,0,'Drakuramas Teleport Bunny 01 - On Data Set - Tele Player'),
--
(-@UP_TRIG_B,0,0,0,38,0,100,0,1,1,0,0,11,@T_SCRIPT,0,0,0,0,0,21,5,0,0,0,0,0,0,'Drakuramas Teleport Bunny 01 - On Data Set - Tele Player');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (@T_SCRIPT,@T_SCRIPT2,@ESCORT_A);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(@ESCORT_A,@SUM_MAL,1,'Summon Malmortis'),
(@T_SCRIPT,@TELEPORT3,1,'Teleport'),
(@T_SCRIPT2,@TELEPORT1,1,'Teleport');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry` IN (@TRIGGER1,@TRIGGER2);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22,1,@TRIGGER1,2,0,1,0,@SCEPT_AURA,0,0,0,0,'','SAI areatrigger triggers only if player has aura Teleporter Scepter Aura'),
(22,1,@TRIGGER2,2,0,1,0,@SCEPT_AURA,0,0,0,0,'','SAI areatrigger triggers only if player has aura Teleporter Scepter Aura');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (@T_SCRIPT,@T_SCRIPT2);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, @T_SCRIPT, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', 'Spell only hits player'),
(13, 1, @T_SCRIPT2, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', 'Spell only hits player');

UPDATE `gameobject_template` SET `size`=2 WHERE `entry` IN (190948,190949); -- Musty Coffin
DELETE FROM `gameobject` WHERE `id` IN (190949,190948);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(9253, 190949, 571, 1, 1, 6260.489, -1960.045, 484.7818, 3.787367, 0, 0, 0, 1, 120, 255, 1), -- Musty Coffin (Area: Reliquary of Pain)
(9254, 190948, 571, 1, 1, 6260.482, -1960.039, 484.7818, 3.787367, 0, 0, 0, 1, 120, 255, 1); -- Musty Coffin (Area: Reliquary of Pain)

-- Template updates for creature 28948 (Malmortis)
UPDATE `creature_template` SET `minlevel`=85,`maxlevel`=85,`unit_flags`=`unit_flags`|264,`speed_walk`=2.4,`speed_run`=0 WHERE `entry`=@MALMORTIS; -- Malmortis
-- Model data 8055 (creature 28948 (Malmortis))
UPDATE `creature_model_info` SET `bounding_radius`=2,`combat_reach`=3,`gender`=0 WHERE `modelid`=8055; -- Malmortis
-- Addon data for creature 28948 (Malmortis)
DELETE FROM `creature_template_addon` WHERE `entry`=@MALMORTIS;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@MALMORTIS,0,0,1,0,''); -- Malmortis

UPDATE `creature_template` SET AIName='SmartAI' WHERE `entry` IN (@MALMORTIS,@TRIGGER1,@TRIGGER2,@TRIGG_BUNNY);
DELETE FROM `smart_scripts` WHERE `entryorguid`IN (@MALMORTIS,@MALMORTIS*100) AND `source_type`IN (0,9);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (@MALMORTIS);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)VALUES
(@MALMORTIS,0,0,1,54,0,100,0,0,0,0,0,80,@MALMORTIS*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On Respawn - Start Timed Action Script'),
(@MALMORTIS,0,1,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Malmortis - On Respawn - Set Orientation To Invoker'),
-- 47
(@MALMORTIS,0,2,0,40,0,100,1,8,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On WP Reached - Say 3'),
(@MALMORTIS,0,3,0,40,0,100,1,18,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On WP Reached- Say 4'),
(@MALMORTIS,0,4,5,40,0,100,1,47,0,0,0,1,5,7000,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On WP Reached - Say'),
(@MALMORTIS,0,5,0,61,0,100,0,0,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On Link - Pause WP'),
(@MALMORTIS,0,6,0,52,0,100,1,5,@MALMORTIS,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On Text Over 5 - Say 6'),
-- 121
(@MALMORTIS,0,6,7,40,0,100,1,80,0,0,0,1,7,0,0,0,0,0,1,0,10,0,0,0,0,0,'Malmortis - On WP Reached - Say 7'),
(@MALMORTIS,0,7,0,61,0,100,0,0,0,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On Link - Pause WP'),
(@MALMORTIS,0,8,9,40,0,100,1,81,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On WP Reached - Say 8'),
(@MALMORTIS,0,9,0,61,0,100,0,0,0,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On Link - Pause WP'),
-- 128
(@MALMORTIS,0,10,11,40,0,100,1,86,0,0,0,1,9,3000,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On WP Reached - Say 9'),
(@MALMORTIS,0,11,0,61,0,100,0,0,0,0,0,54,23000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On Link - Pause WP'),
(@MALMORTIS,0,12,0,52,0,100,1,9,@MALMORTIS,0,0,1,10,7000,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On Text Over 9 - Say 10'),
(@MALMORTIS,0,13,0,52,0,100,1,10,@MALMORTIS,0,0,1,11,7000,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On Text Over 10 - Say 11'),
(@MALMORTIS,0,14,0,52,0,100,1,11,@MALMORTIS,0,0,1,12,7000,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On Text Over 11 - Say 12'),
-- 137 
(@MALMORTIS,0,15,0,40,0,100,1,93,0,0,0,1,13,5000,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On WP Reached - Say 13'),
(@MALMORTIS,0,16,17,52,0,100,1,13,@MALMORTIS,0,0,1,14,7000,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On Text Over 13 - Say 14'),
(@MALMORTIS,0,17,18,61,0,100,0,0,0,0,0,11,@T_SCRIPT,2,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On Link - Cast on self'),
(@MALMORTIS,0,18,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On Link - Despawn'),
-- 
(@MALMORTIS*100,9,0,0,0,0,100,0,3000,3000,3000,3000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On Script - Say 0'),
(@MALMORTIS*100,9,1,0,0,0,100,0,5000,5000,5000,5000,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On Script - Say 1'),
(@MALMORTIS*100,9,2,0,0,0,100,0,5000,5000,5000,5000,53,0,@MALMORTIS,0,0,0,0,1,0,0,0,0,0,0,0,'Malmortis - On Script - Start WP movement'),
-- It's weird that credit is given here, but hey, we're Blizzard, we can do it wherever we want.
(@MALMORTIS*100,9,3,0,0,0,100,0,1000,1000,1000,1000,11,@KILLCREDIT,2,0,0,0,0,7,0,0,0,0,0,0,0,'Malmortis - On Script - Cast Q Credit to Invoker');


DELETE FROM `creature_text` WHERE `entry`=28948;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(28948, 0, 0, 'Ahh... there you are. The master told us you''d be arriving soon.', 12, 0, 100, 0, 0, 0, 'Malmortis say'),
(28948, 1, 0, 'Please, follow me, $N. There is much for you to see...', 12, 0, 100, 0, 0, 0, 'Malmortis say'),
(28948, 2, 0, 'Ever since his arrival from Drak''Tharon, the master has spoken of the time you would be joining him here.', 12, 0, 100, 0, 0, 0, 'Malmortis say'),
(28948, 3, 0, 'You should feel honored. You are the first of the master''s prospects to be shown our operation.', 12, 0, 100, 0, 0, 0, 'Malmortis say'),
(28948, 4, 0, 'The things I show you now must never be spoken of outside Voltarus. The world shall come to know our secret soon enough!', 12, 0, 100, 0, 0, 0, 'Malmortis say'),
(28948, 5, 0, 'Here lie our stores of blight crystal, without which our project would be impossible.', 12, 0, 100, 0, 0, 0, 'Malmortis say'),
(28948, 6, 0, 'I understand that you are to thank for the bulk of our supply.', 12, 0, 100, 0, 0, 0, 'Malmortis say'),
(28948, 7, 0, 'These trolls are among those you exposed on the battlefield. Masterfully done, indeed....', 12, 0, 100, 0, 0, 0, 'Malmortis say'),
(28948, 8, 0, 'We feel it best to position them here, where they might come in terms with their impending fate.', 12, 0, 100, 0, 0, 0, 'Malmortis say'),
(28948, 9, 0, 'This is their destiny....', 12, 0, 100, 0, 0, 0, 'Malmortis say'),
(28948, 10, 0, 'The blight slowly seeps into their bodies, gradually preparing them for their conversion.', 12, 0, 100, 0, 0, 0, 'Malmortis say'),
(28948, 11, 0, 'This special preparation grants them unique powers far greater than they would otherwise know.', 12, 0, 100, 0, 0, 0, 'Malmortis say'),
(28948, 12, 0, 'Soon, the master will grant them the dark gift, making them fit to server the Lich King for eternity!', 12, 0, 100, 0, 0, 0, 'Malmortis say'),
(28948, 13, 0, 'Stay for as long as you like, $N. Glory in the fruits of your labor!', 12, 0, 100, 0, 0, 0, 'Malmortis say'),
(28948, 14, 0, 'Your service has been invaluable in fulfilling the master''s plan. May you forever grow in power....', 12, 0, 100, 0, 0, 0, 'Malmortis say');


DELETE FROM `waypoints` WHERE entry = @MALMORTIS;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@MALMORTIS, 1,  6246.076, -1959.903, 484.7817, ''),
(@MALMORTIS, 2,  6239.468, -1963.94, 484.5479,  ''),
(@MALMORTIS, 3,  6235.218, -1964.69, 484.5479,  ''),
(@MALMORTIS, 4,  6232.341, -1965.397, 484.7817, ''),
(@MALMORTIS, 5,  6229.812, -1960.545, 484.832,  ''),
(@MALMORTIS, 6,  6229.805, -1960.542, 484.832,  ''),
(@MALMORTIS, 7,  6225.805, -1959.542, 484.832,  ''),
(@MALMORTIS, 8,  6218.658, -1962.031, 484.8823, ''), -- Say 3
(@MALMORTIS, 9,  6213.883, -1954.917, 484.6498, ''),
(@MALMORTIS, 10, 6211.883, -1951.667, 484.6498, ''),
(@MALMORTIS, 11, 6205.607, -1941.303, 484.9172, ''),
(@MALMORTIS, 12, 6192.572, -1931.705, 484.9854, ''),
(@MALMORTIS, 13, 6178.136, -1937.173, 484.6558, ''),
(@MALMORTIS, 14, 6175.831, -1938.89,  484.9104, ''),
(@MALMORTIS, 15, 6171.331, -1943.14,  484.6604, ''),
(@MALMORTIS, 16, 6163.581, -1951.14, 484.9104,  ''),
(@MALMORTIS, 17, 6157.331, -1952.89, 484.6604,  ''),
(@MALMORTIS, 18, 6156.749, -1953.028, 484.9022, ''), -- Say 4
(@MALMORTIS, 19, 6149.743, -1957.582, 484.655,  ''),
(@MALMORTIS, 20, 6147.993, -1958.832, 484.905,  ''),
(@MALMORTIS, 21, 6144.993, -1960.832, 484.905,  ''),
(@MALMORTIS, 22, 6140.993, -1963.332, 484.905,  ''),
(@MALMORTIS, 23, 6137.743, -1965.332, 484.905,  ''),
(@MALMORTIS, 24, 6132.743, -1968.582, 484.905,  ''), 
(@MALMORTIS, 25, 6128.993, -1970.832, 484.905,  ''), 
(@MALMORTIS, 26, 6125.993, -1972.832, 484.905,  ''),
(@MALMORTIS, 27, 6123.243, -1974.332, 484.655,  ''),
(@MALMORTIS, 28, 6119.237, -1976.635, 484.9079, ''),
(@MALMORTIS, 29, 6116.115, -1977.373, 484.6002,  ''),
(@MALMORTIS, 30, 6112.615, -1979.373, 484.6002,  ''),
(@MALMORTIS, 31, 6103.115, -1984.623, 484.6002,  ''),
(@MALMORTIS, 32, 6096.115, -1989.123, 484.6002,  ''),
(@MALMORTIS, 33, 6094.615, -1990.123, 484.8502,  ''),
(@MALMORTIS, 34, 6093.954, -1990.445, 484.918,  ''),
(@MALMORTIS, 35, 6089.347, -2014.297, 484.8763, ''),
(@MALMORTIS, 36, 6099.82, -2021.594, 484.9467,  ''),
(@MALMORTIS, 37, 6102.82, -2024.344, 484.9467,  ''),
(@MALMORTIS, 38, 6105.32, -2027.094, 484.9467,  ''),
(@MALMORTIS, 39, 6114.07, -2034.844, 484.9467,  ''),
(@MALMORTIS, 40, 6113.57, -2037.844, 484.9467,  ''),
(@MALMORTIS, 41, 6112.82, -2040.594, 484.6967,  ''),
(@MALMORTIS, 42, 6113.093, -2041.11, 484.8785,  ''),
(@MALMORTIS, 43, 6103.914, -2049.32, 484.8252,  ''),
(@MALMORTIS, 44, 6103.414, -2052.07, 484.8252,  ''),
(@MALMORTIS, 45, 6102.664, -2054.57, 484.5752,  ''),
(@MALMORTIS, 46, 6103.664, -2055.57, 484.5752,  ''),
(@MALMORTIS, 47, 6108.405, -2060.931, 484.7817, ''), -- say 5 & say 6
(@MALMORTIS, 48, 6111.582, -2063.279, 484.5828, ''),
(@MALMORTIS, 49, 6117.082, -2066.779, 484.5828, ''),
(@MALMORTIS, 50, 6118.082, -2067.279, 484.8328, ''),
(@MALMORTIS, 51, 6122.082, -2069.779, 484.8328, ''),
(@MALMORTIS, 52, 6127.582, -2073.529, 484.8328, ''), 
(@MALMORTIS, 53, 6129.582, -2074.779, 484.8328, ''), 
(@MALMORTIS, 54, 6136.759, -2078.627, 484.8839, ''),
(@MALMORTIS, 55, 6135.021, -2082.232, 484.9813, ''),
(@MALMORTIS, 56, 6137.021, -2085.232, 484.7313, ''),
(@MALMORTIS, 57, 6143.271, -2093.232, 484.9813, ''),
(@MALMORTIS, 58, 6145.771, -2097.232, 484.9813, ''),
(@MALMORTIS, 59, 6149.521, -2102.232, 484.9813, ''),
(@MALMORTIS, 60, 6152.771, -2104.482, 484.9813, ''),
(@MALMORTIS, 61, 6157.708, -2107.487, 485.1209, ''),
(@MALMORTIS, 62, 6152.734, -2117.464, 484.878, ''),
(@MALMORTIS, 63, 6155.484, -2121.714, 485.1281, ''),
(@MALMORTIS, 64, 6146.211, -2124.778, 485.1514, ''),
(@MALMORTIS, 65, 6145.211, -2124.778, 485.1514, ''),
(@MALMORTIS, 66, 6140.628, -2128.341, 485.3621, ''),
(@MALMORTIS, 67, 6126.711, -2123.778, 473.1514, ''),
(@MALMORTIS, 68, 6125.211, -2123.778, 473.1514, ''),
(@MALMORTIS, 69, 6119.711, -2123.278, 473.4014,  ''),
(@MALMORTIS, 70, 6118.48, -2123.076, 473.5551, ''),
(@MALMORTIS, 71, 6120.804, -2116.018, 473.4532, ''),
(@MALMORTIS, 72, 6121.228, -2108.079, 473.5628, ''),
(@MALMORTIS, 73, 6123.12, -2108.537, 473.5413, ''),
(@MALMORTIS, 74, 6124.12, -2108.537, 473.5413, ''),
(@MALMORTIS, 75, 6128.12, -2108.787, 473.2913, ''),
(@MALMORTIS, 76, 6137.730, -2111.003, 465.857, ''),
(@MALMORTIS, 77, 6143.918, -2112.493, 461.311, ''),
(@MALMORTIS, 78, 6152.609, -2110.294, 461.309, ''),
(@MALMORTIS, 79, 6156.999, -2110.611, 461.3106, ''),
(@MALMORTIS, 80, 6157.26, -2087.746, 461.0578,  ''), -- Say 7
(@MALMORTIS, 81, 6148.678, -2072.781, 461.3044, ''), -- Say 8 
(@MALMORTIS, 82, 6154.87, -2058.052, 461.2998,  ''),
(@MALMORTIS, 83, 6146.364, -2056.77, 460.8798,  ''),
(@MALMORTIS, 84, 6145.364, -2055.52, 460.8798,  ''),
(@MALMORTIS, 85, 6141.864, -2051.27, 460.8798,  ''),
(@MALMORTIS, 86, 6139.778, -2046.457, 461.3102, ''), -- say 9 & say 10 & say 11 & say 12
(@MALMORTIS, 87, 6143.079, -2043.717, 461.6264, ''),
(@MALMORTIS, 88, 6150.579, -2037.467, 461.6264, ''),
(@MALMORTIS, 89, 6156.329, -2032.717, 459.6264, ''),
(@MALMORTIS, 90, 6158.579, -2031.217, 458.8764, ''),
(@MALMORTIS, 91, 6161.379, -2028.978, 458.9426, ''),
(@MALMORTIS, 92, 6168.36, -2022.986, 454.9367,  ''),
(@MALMORTIS, 93, 6172.36, -2019.708, 455.1223,  ''); -- Say 13 & 14
DELETE FROM `smart_scripts` WHERE `entryorguid`= 24189 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(24189, 0, 0, 0, 19, 0, 100, 0, 11288, 0, 0, 0, 85, 43202, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Ares - On target quest accepted 11288 - Cast spell Shining Light'),
(24189, 0, 1, 0, 19, 0, 100, 0, 11289, 0, 0, 0, 85, 43228, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Ares - On target quest accepted 11289 - Cast Guided by the Oathbound QC');
-- Putting Olakin Back Together Again (13220)
SET @QUEST               := 13220;
SET @NPC_OLAKIN          := 31235;  -- Crusader Olakin Sainrith
SET @GO_CLEAVER          := 193092; -- The Doctor's Cleaver
SET @GO_SPOOL            := 193091; -- Spool of Thread
SET @EVENT_SCRIPT        := 20269;  -- Event from 58856 Reanimate Crusader Olakin
SET @SPELL_FD            := 35356;  -- Feign Death
SET @SPELL_FAKE_BLOOD    := 37692;  -- Fake Blood Spurt
SET @SPELL_RESURRECTION  := 58854;  -- Resurrection

DELETE FROM `gameobject` WHERE `id` IN (@GO_CLEAVER,@GO_SPOOL);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(16974,@GO_SPOOL,571,1,1,6668.17,3268.54,669.539,2.54818,0,0,0.956304,0.292373,120,255, 1),
(16976,@GO_CLEAVER,571,1,1,6601.1,3147.78,666.916,-2.77507,0,0,-0.983254,0.182238,120,255,1);

DELETE FROM `event_scripts` WHERE `id`=@EVENT_SCRIPT;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(@EVENT_SCRIPT,0,10,@NPC_OLAKIN,60000,0,6636.792,3211.102,668.6439,0.8901179);

DELETE FROM `creature_template_addon` WHERE `entry`=@NPC_OLAKIN;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`auras`) VALUES
(@NPC_OLAKIN,0,0x0,0x1,'35356'); -- 31235 - 35356

DELETE FROM `creature_text` WHERE `entry`=@NPC_OLAKIN;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NPC_OLAKIN,0,0,'Thank the Light for granting me another chance. And thank you, $N.',12,0,100,1,0,0,'Crusader Olakin Sainrith'),
(@NPC_OLAKIN,1,0,'Without your help, I would''ve been doomed to a life of undeath among the Lich King''s gruesome creations.', 12,0,100,1,0,0,'Crusader Olakin Sainrith'),
(@NPC_OLAKIN,2,0,'There will be time for a proper thanks later, but there is still a battle to be fought!', 12,0,100,25,0,0,'Crusader Olakin Sainrith');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@NPC_OLAKIN;
DELETE FROM `smart_scripts` WHERE (`source_type`=0 AND `entryorguid`=@NPC_OLAKIN) OR (`source_type`=9 AND `entryorguid`=@NPC_OLAKIN*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_OLAKIN,0,0,0,54,0,100,0,0,0,0,0,80,@NPC_OLAKIN*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Crusader Olakin Sainrith - On Just summoned - Run Script'),
(@NPC_OLAKIN,0,1,0,40,0,100,0,3,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Crusader Olakin Sainrith - On WP Reached - Despawn'),
-- 17,26
(@NPC_OLAKIN*100,9,0,0,0,0,100,0,2000,2000,0,0,11,@SPELL_FAKE_BLOOD,0,0,0,0,0,1,0,0,0,0,0,0,0,'Crusader Olakin Sainrith - On Script - Cast Spell'),
(@NPC_OLAKIN*100,9,1,0,0,0,100,0,2000,2000,0,0,11,@SPELL_RESURRECTION,0,0,0,0,0,1,0,0,0,0,0,0,0,'Crusader Olakin Sainrith - On Script - Cast Spell'),
(@NPC_OLAKIN*100,9,2,0,0,0,100,0,0,0,0,0,28,@SPELL_FD,0,0,0,0,0,1,0,0,0,0,0,0,0,'Crusader Olakin Sainrith - On Script - Remove Aura'),
(@NPC_OLAKIN*100,9,3,0,0,0,100,0,0,0,0,0,96,32,0,0,0,0,0,1,0,0,0,0,0,0,0,'Crusader Olakin Sainrith - On Script - Remove dynamic flag'),
(@NPC_OLAKIN*100,9,4,0,0,0,100,0,1000,1000,0,0,19,1,1,0,0,0,0,1,0,0,0,0,0,0,0,'Crusader Olakin Sainrith - On Script - Remove Unit Flag_2 1 {dead)'),
(@NPC_OLAKIN*100,9,5,0,0,0,100,0,4000,4000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Crusader Olakin Sainrith - On Script - Say 0'),
(@NPC_OLAKIN*100,9,6,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Crusader Olakin Sainrith - On Script - Say 1'),
(@NPC_OLAKIN*100,9,7,0,0,0,100,0,4000,4000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Crusader Olakin Sainrith - On Script - Say 2'),
(@NPC_OLAKIN*100,9,8,0,0,0,100,0,3000,3000,0,0,33,@NPC_OLAKIN,0,0,0,0,0,17,0,30,0,0,0,0,0,'Crusader Olakin Sainrith - On Script - Quest Credit'),
(@NPC_OLAKIN*100,9,9,0,0,0,100,0,0,0,0,0,53,1,@NPC_OLAKIN,0,0,0,0,1,0,0,0,0,0,0,0,'Crusader Olakin Sainrith - On Script -Start WP movement');

DELETE FROM `waypoints` WHERE entry =@NPC_OLAKIN;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@NPC_OLAKIN, 1, 6632.227, 3223.6350, 666.7750,'Olakin'),
(@NPC_OLAKIN, 2, 6624.2558, 3230.2343, 666.857, 'Olakin'),
(@NPC_OLAKIN, 3, 6608.985, 3234.5588, 668.779, 'Olakin');

-- A Cleansing Song (12735)
SET @KOOSU        := 29034;
SET @HA_KHALAN    := 29018;
SET @ATHA         := 29033;

-- Spirit of Koosu
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@KOOSU;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@KOOSU;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@KOOSU;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@KOOSU,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Koosu - Set Phase 1 - on Aggro'),
(@KOOSU,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Koosu -  Stop Moving - on Aggro'),
(@KOOSU,0,2,0,4,1,100,1,0,0,0,0,11,21971,0,0,0,0,0,2,0,0,0,0,0,0,0,'Spirit of Koosu - Cast bolt - on Aggro'),
(@KOOSU,0,3,0,9,1,100,0,5,30,3500,4100,11,21971,0,0,0,0,0,2,0,0,0,0,0,0,0,'Spirit of Koosu - Cast bolt - In Range'),
(@KOOSU,0,4,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Koosu -  Start Moving - When not in bolt Range'),
(@KOOSU,0,5,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Koosu - Stop Moving - 15 Yards'),
(@KOOSU,0,6,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Koosu - Start Moving - when not in bolt Range'),
(@KOOSU,0,7,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Koosu - Stop Moving - when in bolt Range');

-- Spirit of Ha-Khalan
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@HA_KHALAN;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@HA_KHALAN;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@HA_KHALAN;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@HA_KHALAN,0,0,0,0,0,100,0,1000,1000,125000,125000,11,50502,0,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Ha-Khalan - IC - Cast Thick Hide'),
(@HA_KHALAN,0,1,0,0,0,100,0,5000,10000,12000,16000,11,34370,0,0,0,0,0,2,0,0,0,0,0,0,0,'Spirit of Ha-Khalan - IC - Cast Jagged Tooth Snap'),
(@HA_KHALAN,0,2,0,0,0,100,0,3000,5000,7000,11000,11,48287,0,0,0,0,0,2,0,0,0,0,0,0,0,'Spirit of Ha-Khalan - IC - Cast Powerful Bite');

-- Spirit of Atha
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ATHA;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ATHA;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ATHA;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ATHA,0,0,0,0,0,100,0,8000,13000,12000,16000,11,21790,0,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Atha - IC - Cast Aqua Jet'),
(@ATHA,0,1,0,0,0,100,0,2000,4000,5000,7000,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Atha - IC - Cast Thrash');

UPDATE `creature_template` SET `unit_flags`=`unit_flags`|8 WHERE `entry`=29018; -- Spirit of Ha-Khalan
-- Addon data for creature 29018 (Spirit of Ha-Khalan)
DELETE FROM `creature_template_addon` WHERE `entry`=29018;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(29018,0,0,1,0,''); -- Spirit of Ha-Khalan
-- Corpulen Horror spawns in area The Fleshwerks
SET @CGUID = 127272;

DELETE FROM `creature_ai_scripts` WHERE `creature_id`=30696;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=30696;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=30696;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(30696,0,0,0,9,0,100,0,8,40,3500,4100,11,50335,0,0,0,0,0,2,0,0,0,0,0,0,0,'Corpulent Horror - Cast Scourge Hook - In Range');

DELETE FROM `creature_template_addon` WHERE `entry`=30696;
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(30696, 0, 0x0, 0x1, ''); -- Corpulent Horror

UPDATE `creature_template` SET `faction_A`=2102, `faction_H`=2102, `speed_walk`=1.142857, `speed_run`=1, `rangeattacktime`=2000, `unit_flags`=32768, `dynamicflags`=0 WHERE `entry`=30696; -- Corpulent Horror
DELETE FROM `creature` WHERE `id` = 30696;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(@CGUID+0, 30696, 571, 1, 1, 0, 0, 6975.386, 3462.006, 710.9403, 6.126106, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+1, 30696, 571, 1, 1, 0, 0, 6982.377, 3478.588, 710.9403, 5.811946, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+2, 30696, 571, 1, 1, 0, 0, 6920.697, 3446.544, 710.2005, 3.097477, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks) 
(@CGUID+3, 30696, 571, 1, 1, 0, 0, 6932.927, 3502.471, 705.0461, 3.281219, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+4, 30696, 571, 1, 1, 0, 0, 6903.668, 3478.428, 700.0414, 3.093731, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+5, 30696, 571, 1, 1, 0, 0, 6895.87, 3460.794, 700.7824, 1.592374, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks) 
(@CGUID+6, 30696, 571, 1, 1, 0, 0, 6868.874, 3435.562, 705.6059, 1.542484, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+7, 30696, 571, 1, 1, 0, 0, 6869.054, 3493.792, 695.7783, 5.440073, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+8, 30696, 571, 1, 1, 0, 0, 6875.154, 3513.065, 698.8162, 3.944444, 120, 0, 0, 0,  0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+9, 30696, 571, 1, 1, 0, 0, 6836.296, 3505.824, 690.3577, 0.5061455, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+10, 30696, 571, 1, 1, 0, 0, 6823.636, 3484.259, 688.4615, 6.278303, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+11, 30696, 571, 1, 1, 0, 0, 6729.185, 3433.822, 682.3103, 2.64319, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+12, 30696, 571, 1, 1, 0, 0, 6676.063, 3349.062, 704.616, 2.582512, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+13, 30696, 571, 1, 1, 0, 0, 6699.958, 3422.957, 679.4948, 3.363122, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+14, 30696, 571, 1, 1, 0, 0, 6548.099, 3309.558, 665.8171, 2.951326, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+15, 30696, 571, 1, 1, 0, 0, 6535.431, 3322.088, 664.9422, 5.877358, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+16, 30696, 571, 1, 1, 0, 0, 6530.748, 3296.081, 664.9409, 3.446935, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+17, 30696, 571, 1, 1, 0, 0, 6534.971, 3260.271, 666.9742, 0.2021571, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+18, 30696, 571, 1, 1, 0, 0, 6477.204, 3257.901, 643.6331, 3.804818, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+19, 30696, 571, 1, 1, 0, 0, 6488.242, 3194.719, 652.9039, 1.48353, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks)
(@CGUID+20, 30696, 571, 1, 1, 0, 0, 6412.273, 3236.912, 640.3326, 0.7460284, 120, 0, 0, 0, 0, 0, 0, 0, 0), -- Corpulent Horror (Area: The Fleshwerks
(@CGUID+21, 30696, 571, 1, 1, 0, 0, 6413.427, 3218.029, 638.4678, 0.122173, 120, 0, 0, 0, 0, 0, 0, 0, 0); -- Corpulent Horror (Area: The Fleshwerks)
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (66548,66549,66550,66551);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (66550,66551);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,66550,0,0,31,0,3,22515,0,0,0,0,'','Isle of Conquest - Teleport Fortress Out'),
(13,1,66550,0,0,35,0,1,10,1,0,0,0,'','Isle of Conquest - Teleport Fortress Out'),
(13,1,66551,0,0,31,0,3,22515,0,0,0,0,'','Isle of Conquest - Teleport Fortress In'),
(13,1,66551,0,0,35,0,1,10,1,0,0,0,'','Isle of Conquest - Teleport Fortress In');

SET @CGUID := 90179;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+13;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 22515, 628, 3, 1, 392.4965, -859.4583, 48.99871, 3.036873, 7200, 0, 0), -- A IN
(@CGUID+1, 22515, 628, 3, 1, 313.2344, -918.0452, 48.85597, 4.869469, 7200, 0, 0), -- A OUT
(@CGUID+2, 22515, 628, 3, 1, 279.8698, -832.8073, 51.55094, 0, 7200, 0, 0), -- A CENTER
(@CGUID+3, 22515, 628, 3, 1, 323.4965, -883.8021, 48.99959, 1.466077, 7200, 0, 0), -- A IN
(@CGUID+4, 22515, 628, 3, 1, 430.6007, -857.0052, 48.31177, 0.1396263, 7200, 0, 0), -- A OUT
(@CGUID+5, 22515, 628, 3, 1, 325.9167, -781.8993, 49.00521, 4.590216, 7200, 0, 0), -- A IN
(@CGUID+6, 22515, 628, 3, 1, 326.2135, -744.0243, 49.43576, 1.308997, 7200, 0, 0), -- A OUT
(@CGUID+7, 22515, 628, 3, 1, 1139.498, -779.4739, 48.73496, 3.001966, 7200, 0, 0), -- H OUT
(@CGUID+8, 22515, 628, 3, 1, 1162.913, -745.908, 48.71506, 0.1396263, 7200, 0, 0), -- H IN
(@CGUID+9, 22515, 628, 3, 1, 1234.304, -688.2986, 49.22296, 4.677482, 7200, 0, 0), -- H IN
(@CGUID+10, 22515, 628, 3, 1, 1232.524, -666.3246, 48.13402, 2.303835, 7200, 0, 0), -- H OUT
(@CGUID+11, 22515, 628, 3, 1, 1233.106, -838.316, 48.99958, 1.466077, 7200, 0, 0), -- H IN
(@CGUID+12, 22515, 628, 3, 1, 1232.387, -861.0243, 48.99959, 3.560472, 7200, 0, 0), -- H OUT
(@CGUID+13, 22515, 628, 3, 1, 1296.526, -766.1823, 50.70293, 3.089233, 7200, 0, 0); -- H CENTER
-- Fix few startup errors
UPDATE `smart_scripts` SET `event_param3`=12555 WHERE `entryorguid`=27727 AND `source_type`=0 AND `id`=2 AND `link`=0;
DELETE FROM `creature_addon` WHERE `guid`=66177;
DELETE FROM `waypoint_data` WHERE `id`=661770;
DELETE FROM `smart_scripts` WHERE `entryorguid`=28481 AND `source_type`=0;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=28481;

DELETE FROM `spell_script_names` WHERE `spell_id` IN (51769,51770,58941);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(51769,'spell_q12619_emblazon_runeblade'),
(51770,'spell_q12619_emblazon_runeblade_effect'),
(58941,'spell_archavon_rock_shards');

DELETE FROM `spelldifficulty_dbc` WHERE `id` IN (58695,58696);
INSERT INTO `spelldifficulty_dbc`(`id`,`spellid0`,`spellid1`) VALUES 
(58695,58695,60883),
(58696,58696,60884);
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=28481;
DELETE FROM `smart_scripts` WHERE `entryorguid`=28481 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(28481, 0, 0, 0, 8, 0, 100, 0, 51769, 0, 0, 0, 11, 51738, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Runeforge (SE) - On Spellhit Emblazon Runeblade - Cast Shadow Storm');
-- Scourge Tactics
UPDATE `smart_scripts` SET `link`=1 WHERE `entryorguid`=30273 AND `id`=0;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=30273 AND `id`=1;
-- Abjurist Belmara & Conjurer Luminrath 
UPDATE `smart_scripts` SET `target_type`=7 WHERE `entryorguid`=19546 AND `id`=2;
UPDATE `smart_scripts` SET `target_type`=7, `target_param1`=0 WHERE `entryorguid`=19580 AND `id`=2;
-- Do not delete query id 0
DELETE FROM `smart_scripts` WHERE `entryorguid` =21797 AND `source_type`=0 AND `id`>0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(21797, 0, 1, 0, 19, 0, 100, 0, 10645, 0, 0, 0, 80, 2179700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Shadowmoon Spirit - On Quest Accept - Run Script');
-- Trapping the Light Fantastic (10674) & Gather the Orbs (10859)
SET @GOB_TRAP           := 185011;	-- Multi-Spectrum Light Trap
SET @NPC_BUNNY          := 21926;   -- Multi-Spectrum Light Trap Bunny
SET @ORB_TOTEM          := 22333;   -- Orb Collecting Totem
SET @NPC_CREDIT         := 21929;   -- Trapping the Light Kill Credit Trigger
SET @NPC_ORB1           := 20635;   -- Razaani Light Orb
SET @NPC_ORB2           := 20771;   -- Razaani Light Orb - Mini
SET @SPELL_PULL         := 28337;   -- Magnetic Pull
SET @ARC_EXPLOSION      := 35426;   -- Arcane Explosion

DELETE FROM `creature_template_addon` WHERE `entry` IN (@NPC_ORB1,@NPC_ORB2);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(20635,0,0,0,4097,0,'32566'),
(20771,0,0,0,4097,0,'32566');

UPDATE `creature_template` SET `AIName`='SmartAI',`unit_flags`=unit_flags|0x02000000,`flags_extra`=130,`ScriptName`='' WHERE `entry` IN (@NPC_ORB1,@NPC_ORB2);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (@NPC_ORB1,@NPC_ORB2);
UPDATE `creature` SET `MovementType`=0 WHERE `id`=@NPC_ORB1;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_ORB1,@NPC_ORB1*100,@NPC_ORB1*101,@NPC_ORB2,@NPC_ORB2*100,@NPC_ORB2*101) AND `source_type` IN (0,9);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Alliance Version
(@NPC_ORB1,0,0,0,8,0,100,0,@SPELL_PULL,0,0,0,80,@NPC_ORB1*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Orb Bunny - On Spellhit - Start Action Script'),
(@NPC_ORB1*100,9,0,0,0,0,100,0,1000,1000,0,0,11,@ARC_EXPLOSION,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Orb Bunny - On Script - Cast Arcane Explosion'),
(@NPC_ORB1*100,9,1,0,0,0,100,0,500,500,0,0,45,1,1,0,0,0,0,19,@NPC_BUNNY,5,0,0,0,0,0, 'Orb Bunny - On Script - Cast Arcane Explosion'),
(@NPC_ORB1*100,9,2,0,0,0,100,0,0,0,0,0,41,100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Orb Bunny - On Script - Despawn'),
-- Horde Version
(@NPC_ORB1,0,1,0,38,0,100,0,0,1,30000,30000,69,1,0,0,0,0,0,19,@ORB_TOTEM,20,0,0,0,0,0, 'Light Orb - On Data Set 0 1 - Move to totem'),
(@NPC_ORB1,0,2,3,34,0,100,1,8,1,0,0,11,@ARC_EXPLOSION,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Light Orb - On point 1 reached - Cast arcane explosion'),
(@NPC_ORB1,0,3,4,61,0,100,0,0,0,0,0,33,@NPC_CREDIT,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Light Orb - On Link - Call kill credit'),
(@NPC_ORB1,0,4,0,61,0,100,0,0,0,0,0,80,@NPC_ORB1*101,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Light Orb - On Link - Start action list to display arcase explosion'),
(@NPC_ORB1*101,9,0,0,0,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Light Orb - Action 0 - Set unseen'),
(@NPC_ORB1*101,9,1,0,0,0,100,0,0,0,0,0,41,100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Light Orb - Action 1 - Despawn in 100 ms'),
-- Alliance Version
(@NPC_ORB2,0,0,0,8,0,100,0,@SPELL_PULL,0,0,0,80,@NPC_ORB2*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Orb Bunny - On Spellhit - Start Action Script'),
(@NPC_ORB2*100,9,0,0,0,0,100,0,1000,1000,0,0,11,@ARC_EXPLOSION,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Orb Bunny - On Script - Cast Arcane Explosion'),
(@NPC_ORB2*100,9,1,0,0,0,100,0,500,500,0,0,45,1,1,0,0,0,0,19,@NPC_BUNNY,5,0,0,0,0,0, 'Orb Bunny - On Script - Cast Arcane Explosion'),
(@NPC_ORB2*100,9,2,0,0,0,100,0,0,0,0,0,41,100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Orb Bunny - On Script - Despawn'),
-- Horde Version
(@NPC_ORB2,0,1,0,38,0,100,0,1,1,30000,30000,69,1,0,0,0,0,0,19,@ORB_TOTEM,20,0,0,0,0,0, 'Light Orb - On Data Set 0 1 - Move to totem'),
(@NPC_ORB2,0,2,3,34,0,100,1,8,1,0,0,11,@ARC_EXPLOSION,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Light Orb - On point 1 reached - Cast arcane explosion'),
(@NPC_ORB2,0,3,4,61,0,100,0,0,0,0,0,33,@NPC_CREDIT,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Light Orb - On Link - Call kill credit'),
(@NPC_ORB2,0,4,0,61,0,100,0,0,0,0,0,80,@NPC_ORB2*101,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Light Orb - On Link - Start action list to display arcase explosion'),
(@NPC_ORB2*101,9,0,0,0,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Light Orb - Action 0 - Set unseen'),
(@NPC_ORB2*101,9,1,0,0,0,100,0,0,0,0,0,41,100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Light Orb - Action 1 - Despawn in 100 ms');

-- Alliance Multi-Spectrum Light Trap
UPDATE `creature_template` SET `AIName`='SmartAI',`flags_extra`=130,`ScriptName`='' WHERE `entry`=@NPC_BUNNY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC_BUNNY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_BUNNY,0,0,0,54,0,100,1,0,0,0,0,50,@GOB_TRAP,30000,0,0,0,0,1,0,0,0,0,0,0,0, 'Multi-Spectrum Light Trap - On spawn - Summon gob'),
(@NPC_BUNNY,0,1,0,1,0,100,1,0,0,0,0,9,0,0,0,0,0,0,15,@GOB_TRAP,0,0,0,0,0,0, 'Multi-Spectrum Light Trap - OOC - Activate gob'),
--
(@NPC_BUNNY,0,2,0,1,0,100,1,3000,3000,3000,3000,11,@SPELL_PULL,0,0,0,0,0,19,@NPC_ORB1,20,0,0,0,0,0, 'Multi-Spectrum Light Trap - OOC 3 sec - Pull Razaani Light Orb'),
(@NPC_BUNNY,0,3,0,1,0,100,1,3000,3000,3000,3000,11,@SPELL_PULL,0,0,0,0,0,19,@NPC_ORB2,20,0,0,0,0,0, 'Multi-Spectrum Light Trap - OOC 3 sec - Pull Razaani Light Orb - Mini'),
(@NPC_BUNNY,0,4,5,38,0,100,1,1,1,0,0,33,@NPC_CREDIT,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Multi-Spectrum Light Trap - On Data Set - Give Quest Credit'),
(@NPC_BUNNY,0,5,0,61,0,100,1,0,0,0,0,9,0,0,0,0,0,0,15,@GOB_TRAP,0,0,0,0,0,0, 'Link - Activate gob - Gob');

-- Horde Totem
UPDATE `creature_template` SET `AIName`='SmartAI',`flags_extra`=0,`ScriptName`='' WHERE `entry`=@ORB_TOTEM;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ORB_TOTEM;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ORB_TOTEM,0,0,1,54,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,@NPC_ORB1,20,0,0,0,0,0, 'Orb collecting totem - On spawned - Set Data 0 1'),
(@ORB_TOTEM,0,1,2,61,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Orb collecting totem - On Link - Store invoker'),
(@ORB_TOTEM,0,2,0,61,0,100,0,0,0,0,0,100,1,0,0,0,0,0,19,@NPC_ORB1,20,0,0,0,0,0, 'Orb collecting totem - On Link - Send stored target list 1'),
--
(@ORB_TOTEM,0,3,4,54,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,@NPC_ORB2,20,0,0,0,0,0, 'Orb collecting totem - On spawned - Set Data 0 1'),
(@ORB_TOTEM,0,4,5,61,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Orb collecting totem - On Link - Store invoker'),
(@ORB_TOTEM,0,5,0,61,0,100,0,0,0,0,0,100,1,0,0,0,0,0,19,@NPC_ORB2,20,0,0,0,0,0, 'Orb collecting totem - On Link - Send stored target list 1');
-- -.- >.> <.< -_- ._. 
UPDATE `creature` SET `spawndist`=0 WHERE`id`=20635;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry` IN (30135,30144,29974);
DELETE FROM `smart_scripts` WHERE entryorguid IN (30135,30144,29974);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
-- Niffelem Forefather
(29974, 0, 0, 0, 0, 0, 100, 0, 1000, 5000, 8000, 13000, 11, 57454, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Niffelem Forefather - IC - Cast Ice Spike'),
(29974, 0, 1, 2, 8, 0, 100, 0, 55983, 0, 0, 0, 33, 30138, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Niffelem Forefather - On Spellhit - Give Kill Credit'),
(29974, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Niffelem Forefather - Linked with Previous Event Despawn'),
-- Restless Frostborn Warrior
(30135, 0, 0, 0, 0, 0, 100, 0, 1000, 5000, 8000, 13000, 11, 57456, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Restless Frostborn Warrior - IC - Cast Frostbite'),
(30135, 0, 1, 2, 8, 0, 100, 0, 55983, 0, 0, 0, 33, 30139, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Restless Frostborn Warrior - On Spellhit - Give Kill Credit'),
(30135, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Restless Frostborn Warrior - Linked with Previous Event Despawn'),
-- Restless Frostborn Ghost
(30144, 0, 0, 0, 0, 0, 100, 0, 1000, 5000, 8000, 13000, 11, 57456, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Restless Frostborn Ghost - IC - Cast Frostbite'),
(30144, 0, 1, 2, 8, 0, 100, 0, 55983, 0, 0, 0, 33, 30139, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Restless Frostborn Ghost - On Spellhit - Give Kill Credit'),
(30144, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Restless Frostborn Ghost - Linked with Previous Event Despawn');
DELETE FROM `conditions` WHERE `SourceEntry` = 55983;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(17, 0, 55983, 0, 0, 31, 1, 3, 29974, 0, 0, 0, 0, '', 'Blow Hodir''s Horn can hit Niffelem Forefather'),
(17, 0, 55983, 0, 0, 36, 1, 0, 0, 0, 1, 0, 0, '', 'Blow Hodir''s Horn can only hit dead Niffelem Forefather'),
(17, 0, 55983, 0, 1, 31, 1, 3, 30144, 0, 0, 0, 0, '', 'Blow Hodir''s Horn can hit Restless Frostborn Ghost'),
(17, 0, 55983, 0, 1, 36, 1, 0, 0, 0, 1, 0, 0, '', 'Blow Hodir''s Horn can only hit dead Restless Frostborn Ghost'),
(17, 0, 55983, 0, 2, 31, 1, 3, 30135, 0, 0, 0, 0, '', 'Blow Hodir''s Horn can hit Restless Frostborn Warrior'),
(17, 0, 55983, 0, 2, 36, 1, 0, 0, 0, 1, 0, 0, '', 'Blow Hodir''s Horn can only hit dead Restless Frostborn Warrior');
/* cs_group.cpp */

SET @id = 472;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0  WHERE `name` = 'group';
UPDATE `command` SET `permission` = @id+1  WHERE `name` = 'group leader';
UPDATE `command` SET `permission` = @id+2  WHERE `name` = 'group disband';
UPDATE `command` SET `permission` = @id+3  WHERE `name` = 'group remove';
UPDATE `command` SET `permission` = @id+4  WHERE `name` = 'group join';
UPDATE `command` SET `permission` = @id+5  WHERE `name` = 'group list';

UPDATE `command` SET `permission` = @id+6, `name` = 'group summon', `help` =
'Syntax: .group summon [$charactername]\r\n\r\nTeleport the given character and his group to you. Teleported only online characters but original selected group member can be offline.'
WHERE `name` = 'groupsummon';
/* cs_pet.cpp */

SET @id = 479;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0  WHERE `name` = 'pet';
UPDATE `command` SET `permission` = @id+1  WHERE `name` = 'pet create';
UPDATE `command` SET `permission` = @id+2  WHERE `name` = 'pet learn';
UPDATE `command` SET `permission` = @id+3  WHERE `name` = 'pet unlearn';
-- Test Flight Quests
-- 10557 - The Zephyrium Capacitorium(part 1)
-- 10710 - The Singing Ridge(part 2)
-- 10711 - Razaan's Landing
-- 10712 - Ruuan Weald
SET @ENTRY              := 21461; -- Rally Zapnabber
SET @ENTRY2             := 21393; -- Cannon Channeler Dummy npc
SET @BEAM               := 36795; -- Cannon Channel(dnd) - Visual cannon beam
SET @MENUID             := 8304;  -- Gossip
SET @A_MENU             := 8454;  -- Action Gossip
SET @A_MENU2            := 8455;  -- Action Gossip 2
SET @OPTION             := 0;
SET @SPEACH             := 10360; -- Text 1
SET @SPEACH2            := 10561; -- Text 2

-- Disable obsolete quest
DELETE FROM `disables` WHERE `entry`=10716;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(1,10716,0,'','','Deprecated quest Test Flight: Raven''s Wood');
-- Make Canon Channeler float & Update position to match cannon
UPDATE `creature_template` SET `InhabitType`=4, `modelid1`= 11686 ,`modelid2`=0 WHERE `entry`=@ENTRY2;
UPDATE `creature` SET `position_x`=1924.6457, `position_y`= 5575.660, `position_z`=272.1429 WHERE  `guid`=74872;-- Gossip & menus  1924.1457, 5575.647, 272.1429

UPDATE `creature_template` SET `gossip_menu_id`=@MENUID, `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY2;
DELETE FROM `gossip_menu` WHERE `entry` IN (@MENUID,@A_MENU);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(@MENUID,@SPEACH),
(@A_MENU,@SPEACH2);

DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (@MENUID,@A_MENU2,@A_MENU);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(@MENUID,@OPTION+0,0,'I''m ready for my test flight!',1,1,0,0,0,0,''), -- Test Flight: The Zephyrium Capacitorium
(@MENUID,@OPTION+1,0,'Take me to Singing Ridge!',1,1,@A_MENU,0,0,0,''), -- Test Flight: The Singing Ridge
(@MENUID,@OPTION+2,0,'Take me to Razaan''s Landing!',1,1,0,0,0,0,''), -- Test Flight: Razaan's Landing
(@MENUID,@OPTION+3,0,'Take me to Ruuan Weald!',1,1,0,0,0,0,''), -- Test Flight: Ruuan Weald
(@MENUID,@OPTION+4,0,'I want to fly to an old location!',1,1,@A_MENU2,0,0,0,''), -- Old locations from completed quests
(@A_MENU2,@OPTION+1,0,'Take me to Singing Ridge.',1,1,0,0,0,0,''),
(@A_MENU2,@OPTION+2,0,'Take me to Razaan''s Landing.',1,1,0,0,0,0,''),
(@A_MENU2,@OPTION+3,0,'Take me to Ruuan Weald.',1,1,0,0,0,0,''),
(@A_MENU,@OPTION+0,0,'I have the signed Waiver! Fire me into The Singing Ridge!',1,1,0,0,0,0,'');

-- Fix teleport spell position
DELETE FROM `spell_target_position` WHERE `Id` IN(37908,24831);
INSERT INTO `spell_target_position` (`id`, `effIndex`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES 
(24831, 0, 530, 1920.07, 5582.04, 269.222, 5.1846);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`= 37908;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
(37908, 24831, 0, 'Aura Visual Teleport - teleport');

-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100,@ENTRY*101,@ENTRY*102,@ENTRY*103,@ENTRY2);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,@MENUID,@OPTION+0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Rally Zapnabber - On gossip option select - Run script'),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Rally Zapnabber - On gossip option select - Close gossip'),
(@ENTRY,0,2,3,62,0,100,0,@A_MENU,@OPTION+0,0,0,80,@ENTRY*101,0,0,0,0,0,1,0,0,0,0,0,0,0,'Rally Zapnabber - On gossip option select - Run script'),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Rally Zapnabber - On gossip option select - Close gossip'),
(@ENTRY,0,4,5,62,0,100,0,@MENUID,@OPTION+2,0,0,80,@ENTRY*102,0,0,0,0,0,1,0,0,0,0,0,0,0,'Rally Zapnabber - On gossip option select - Run script'),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Rally Zapnabber - On gossip option select - Close gossip'),
(@ENTRY,0,6,7,62,0,100,0,@MENUID,@OPTION+3,0,0,80,@ENTRY*103,0,0,0,0,0,1,0,0,0,0,0,0,0,'Rally Zapnabber - On gossip option select - Run script'),
(@ENTRY,0,7,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Rally Zapnabber - On gossip option select - Close gossip'),

(@ENTRY,0,8,9,62,0,100,0,@A_MENU2,@OPTION+1,0,0,80,@ENTRY*101,0,0,0,0,0,1,0,0,0,0,0,0,0,'Rally Zapnabber - On gossip option select - Run script'),
(@ENTRY,0,9,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Rally Zapnabber - On gossip option select - Close gossip'),
(@ENTRY,0,10,11,62,0,100,0,@A_MENU2,@OPTION+2,0,0,80,@ENTRY*102,0,0,0,0,0,1,0,0,0,0,0,0,0,'Rally Zapnabber - On gossip option select - Run script'),
(@ENTRY,0,11,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Rally Zapnabber - On gossip option select - Close gossip'),
(@ENTRY,0,12,13,62,0,100,0,@A_MENU2,@OPTION+3,0,0,80,@ENTRY*103,0,0,0,0,0,1,0,0,0,0,0,0,0,'Rally Zapnabber - On gossip option select - Run script'),
(@ENTRY,0,13,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Rally Zapnabber - On gossip option select - Close gossip'),
--
(@ENTRY*100,9,0,0,1,0,100,0,2000,2000,2000,2000,85,37908,0,0,0,0,0,7,0,0,0,0,0,0,0,'The Zephyrium Capacitorium - After 2 seconds - Port visual'),
(@ENTRY*100,9,1,0,1,0,100,0,2000,2000,2000,2000,45,1,1,0,0,0,0,10,74872,@ENTRY2,0,0,0,0,0,'The Zephyrium Capacitorium - After 2 seconds - Port visual'),
(@ENTRY*100,9,2,0,1,0,100,0,3000,3000,3000,3000,85,36790,0,0,0,0,0,7,0,0,0,0,0,0,0,'The Zephyrium Capacitorium - OOC Update - Invoker,cast charge state 2'),
(@ENTRY*100,9,3,0,1,0,100,0,3000,3000,3000,3000,85,36792,0,0,0,0,0,7,0,0,0,0,0,0,0,'The Zephyrium Capacitorium - OOC Update - Invoker,cast charge state 3'),
(@ENTRY*100,9,4,0,1,0,100,0,3000,3000,3000,3000,85,36800,0,0,0,0,0,7,0,0,0,0,0,0,0,'The Zephyrium Capacitorium - OOC Update - Invoker,cast charge state 4'),
(@ENTRY*100,9,5,0,1,0,100,0,3000,3000,3000,3000,85,37910,0,0,0,0,0,7,0,0,0,0,0,0,0,'The Zephyrium Capacitorium - OOC Update - Invoker,cast Soar&Credit'),
(@ENTRY*100,9,6,0,1,0,100,0,0,0,0,0,85,37108,0,0,0,0,0,7,0,0,0,0,0,0,0,'The Zephyrium Capacitorium - OOC Update - Invoker,cast Debuff'),
--
(@ENTRY*101,9,0,0,1,0,100,0,2000,2000,2000,2000,85,37908,0,0,0,0,0,7,0,0,0,0,0,0,0,'The Singing Ridge - After 2 seconds - Port visual'),
(@ENTRY*101,9,1,0,1,0,100,0,2000,2000,2000,2000,45,1,1,0,0,0,0,10,74872,@ENTRY2,0,0,0,0,0,'The Zephyrium Capacitorium - After 2 seconds - Set Data on Channeler'),
(@ENTRY*101,9,2,0,1,0,100,0,3000,3000,3000,3000,85,36790,0,0,0,0,0,7,0,0,0,0,0,0,0,'The Singing Ridge - OOC Update - Invoker,cast charge state 2'),
(@ENTRY*101,9,3,0,1,0,100,0,3000,3000,3000,3000,85,36792,0,0,0,0,0,7,0,0,0,0,0,0,0,'The Singing Ridge - OOC Update - Invoker,cast charge state 3'),
(@ENTRY*101,9,4,0,1,0,100,0,3000,3000,3000,3000,85,36800,0,0,0,0,0,7,0,0,0,0,0,0,0,'The Singing Ridge - OOC Update - Invoker,cast charge state 4'),
(@ENTRY*101,9,5,0,1,0,100,0,3000,3000,3000,3000,85,37962,0,0,0,0,0,7,0,0,0,0,0,0,0,'The Singing Ridge - OOC Update - Invoker,cast Soar&Credit'),
(@ENTRY*101,9,6,0,1,0,100,0,0,0,0,0,85,37108,0,0,0,0,0,7,0,0,0,0,0,0,0,'The Singing Ridge - OOC Update - Invoker,cast Debuff'),
--
(@ENTRY*102,9,0,0,1,0,100,0,2000,2000,2000,2000,85,37908,0,0,0,0,0,7,0,0,0,0,0,0,0,'Razaan''s Landing - After 2 seconds - Port visual'),
(@ENTRY*102,9,1,0,1,0,100,0,2000,2000,2000,2000,45,1,1,0,0,0,0,10,74872,@ENTRY2,0,0,0,0,0,'The Zephyrium Capacitorium - After 2 seconds - Set Data on Channeler'),
(@ENTRY*102,9,2,0,1,0,100,0,3000,3000,3000,3000,85,36790,0,0,0,0,0,7,0,0,0,0,0,0,0,'Razaan''s Landing - OOC Update - Invoker,cast charge state 2'),
(@ENTRY*102,9,3,0,1,0,100,0,3000,3000,3000,3000,85,36792,0,0,0,0,0,7,0,0,0,0,0,0,0,'Razaan''s Landing - OOC Update - Invoker,cast charge state 3'),
(@ENTRY*102,9,4,0,1,0,100,0,3000,3000,3000,3000,85,36800,0,0,0,0,0,7,0,0,0,0,0,0,0,'Razaan''s Landing - OOC Update - Invoker,cast charge state 4'),
(@ENTRY*102,9,5,0,1,0,100,0,3000,3000,3000,3000,85,36812,0,0,0,0,0,7,0,0,0,0,0,0,0,'Razaan''s Landing - OOC Update - Invoker,cast Soar&Credit'),
(@ENTRY*102,9,6,0,1,0,100,0,0,0,0,0,85,37108,0,0,0,0,0,7,0,0,0,0,0,0,0,'Razaan''s Landing - OOC Update - Invoker,cast Debuff'),
--
(@ENTRY*103,9,0,0,1,0,100,0,2000,2000,2000,2000,85,37908,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ruuan Weald - After 2 seconds - Port visual'),
(@ENTRY*103,9,1,0,1,0,100,0,2000,2000,2000,2000,45,1,1,0,0,0,0,10,74872,@ENTRY2,0,0,0,0,0,'The Zephyrium Capacitorium - After 2 seconds - Set Data on Channeler'),
(@ENTRY*103,9,2,0,1,0,100,0,3000,3000,3000,3000,85,36790,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ruuan Weald - OOC Update - Invoker,cast charge state 2'),
(@ENTRY*103,9,3,0,1,0,100,0,3000,3000,3000,3000,85,36792,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ruuan Weald - OOC Update - Invoker,cast charge state 3'),
(@ENTRY*103,9,4,0,1,0,100,0,3000,3000,3000,3000,85,36800,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ruuan Weald - OOC Update - Invoker,cast charge state 4'),
(@ENTRY*103,9,5,0,1,0,100,0,3000,3000,3000,3000,85,37968,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ruuan Weald - OOC Update - Invoker,cast Soar&Credit'),
(@ENTRY*103,9,6,0,1,0,100,0,0,0,0,0,85,37108,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ruuan Weald - OOC Update - Invoker,cast Debuff'),
--
(@ENTRY2,0,0,0,38,0,100,0,1,1,0,0,11,36795,0,0,0,0,0,1,0,0,0,0,0,0,0,'Beam Channel Bunny - On Data Set - Cast Cannon Beam');

DELETE FROM `conditions` WHERE `SourceEntry`=@BEAM OR `SourceGroup` IN (@MENUID,@A_MENU2,@A_MENU);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, @A_MENU2, 3, 0, 0, 1, 0, 37108, 0, 0, 1, 0, 0, '', 'Show gossip option 3 if player does not have aura Zephyrium Charged'),
(15, @A_MENU2, 3, 0, 0, 8, 0, 10712, 0, 0, 0, 0, 0, '', 'Show gossip option 3 if player has quest Ruuan Weald marked as rewarded'),
(15, @A_MENU2, 2, 0, 0, 8, 0, 10711, 0, 0, 0, 0, 0, '', 'Show gossip option 2 if player has quest Razaan''s Landing marked as rewarded'),
(15, @A_MENU2, 2, 0, 0, 1, 0, 37108, 0, 0, 1, 0, 0, '', 'Show gossip option 2 if player does not have aura Zephyrium Charged'),
(15, @A_MENU2, 1, 0, 0, 1, 0, 37108, 0, 0, 1, 0, 0, '', 'Show gossip option 1 if player does not have aura Zephyrium Charged'),
(15, @A_MENU2, 1, 0, 0, 8, 0, 10710, 0, 0, 0, 0, 0, '', 'Show gossip option 1 if player has quest The Singing Ridge marked as rewarded'),
(15, @A_MENU2, 4, 0, 0, 8, 0, 10557, 0, 0, 0, 0, 0, '', 'Show gossip option 4 if player has quest The Zephyrium Capacitorium marked as rewarded'),
(15, @A_MENU, 0, 0, 0, 2, 0, 30539, 1, 0, 0, 0, 0, '', 'Show gossip option 0 if player has item Tally''s Waiver (Signed)'),
(15, @MENUID, 3, 0, 0, 9, 0, 10712, 0, 0, 0, 0, 0, '', 'Show gossip option 3 if player has quest Ruuan Weald marked as taken'),
(15, @MENUID, 3, 0, 0, 1, 0, 37108, 0, 0, 1, 0, 0, '', 'Show gossip option 3 if player does not have aura Zephyrium Charged'),
(15, @MENUID, 2, 0, 0, 9, 0, 10711, 0, 0, 0, 0, 0, '', 'Show gossip option 2 if player has quest Razaan''s Landing marked as taken'),
(15, @MENUID, 2, 0, 0, 1, 0, 37108, 0, 0, 1, 0, 0, '', 'Show gossip option 2 if player does not have aura Zephyrium Charged'),
(15, @MENUID, 1, 0, 0, 9, 0, 10710, 0, 0, 0, 0, 0, '', 'Show gossip option 1 if player has quest The Singing Ridge marked as taken'),
(15, @MENUID, 1, 0, 0, 1, 0, 37108, 0, 0, 1, 0, 0, '', 'Show gossip option 1 if player does not have aura Zephyrium Charged'),
(15, @MENUID, 0, 0, 0, 9, 0, 10557, 0, 0, 0, 0, 0, '', 'Show gossip option 0 if player has quest The Zephyrium Capacitorium marked as taken'),
(15, @MENUID, 0, 0, 0, 1, 0, 37108, 0, 0, 1, 0, 0, '', 'Show gossip option 0 if player does not have aura Zephyrium Charged'),
--
(13, 1, 36795, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', 'Spell Cannon Channel(dnd) target player');

-- SAI for Rally (Questgiver)
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=21460;
DELETE FROM `smart_scripts` WHERE `entryorguid`=21460;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(21460,0,0,1,62,0,100,0,8303,0,0,0,56,30540,1,0,0,0,0,7,0,0,0,0,0,0,0,'Rally Zapnabber - On gossip option select - Give Item '),
(21460,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Rally Zapnabber - On gossip option select - Close gossip');

DELETE FROM `conditions` WHERE `SourceGroup` = 8303;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 8303, 0, 0, 0, 2, 0, 30540, 1, 1, 1, 0, 0, '', 'Only allow gossip option to be visible if player doesn''t have item'),
(15, 8303, 0, 0, 0, 9, 0, 10710, 0, 0, 0, 0, 0, '', 'Only allow gossip option to be visible if player has quest taken');
/* cs_send.cpp */

SET @id = 483;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0  WHERE `name` = 'send';
UPDATE `command` SET `permission` = @id+1  WHERE `name` = 'send items';
UPDATE `command` SET `permission` = @id+2  WHERE `name` = 'send mail';
UPDATE `command` SET `permission` = @id+3  WHERE `name` = 'send message';
UPDATE `command` SET `permission` = @id+4  WHERE `name` = 'send money';
/* cs_misc.cpp */

SET @id = 488;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'additem';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'additemset';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'appear';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'aura';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'bank';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'bindsight';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'combatstop';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'cometome';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'commands';
UPDATE `command` SET `permission` = @id+9 WHERE `name` = 'cooldown';
UPDATE `command` SET `permission` = @id+10 WHERE `name` = 'damage';
UPDATE `command` SET `permission` = @id+11 WHERE `name` = 'dev';
UPDATE `command` SET `permission` = @id+12 WHERE `name` = 'die';
UPDATE `command` SET `permission` = @id+13 WHERE `name` = 'dismount';
UPDATE `command` SET `permission` = @id+14 WHERE `name` = 'distance';
UPDATE `command` SET `permission` = @id+15 WHERE `name` = 'flusharenapoints';
UPDATE `command` SET `permission` = @id+16 WHERE `name` = 'freeze';
UPDATE `command` SET `permission` = @id+17 WHERE `name` = 'gps';
UPDATE `command` SET `permission` = @id+18 WHERE `name` = 'guid';
UPDATE `command` SET `permission` = @id+19 WHERE `name` = 'help';
UPDATE `command` SET `permission` = @id+20 WHERE `name` = 'hidearea';
UPDATE `command` SET `permission` = @id+21 WHERE `name` = 'itemmove';
UPDATE `command` SET `permission` = @id+22 WHERE `name` = 'kick';
UPDATE `command` SET `permission` = @id+23 WHERE `name` = 'linkgrave';
UPDATE `command` SET `permission` = @id+24 WHERE `name` = 'listfreeze';
UPDATE `command` SET `permission` = @id+25 WHERE `name` = 'maxskill';
UPDATE `command` SET `permission` = @id+26 WHERE `name` = 'movegens';
UPDATE `command` SET `permission` = @id+27 WHERE `name` = 'mute';
UPDATE `command` SET `permission` = @id+28 WHERE `name` = 'neargrave';
UPDATE `command` SET `permission` = @id+29 WHERE `name` = 'pinfo';
UPDATE `command` SET `permission` = @id+30 WHERE `name` = 'playall';
UPDATE `command` SET `permission` = @id+31 WHERE `name` = 'possess';
UPDATE `command` SET `permission` = @id+32 WHERE `name` = 'recall';
UPDATE `command` SET `permission` = @id+33 WHERE `name` = 'repairitems';
UPDATE `command` SET `permission` = @id+34 WHERE `name` = 'respawn';
UPDATE `command` SET `permission` = @id+35 WHERE `name` = 'revive';
UPDATE `command` SET `permission` = @id+36 WHERE `name` = 'saveall';
UPDATE `command` SET `permission` = @id+37 WHERE `name` = 'save';
UPDATE `command` SET `permission` = @id+38 WHERE `name` = 'setskill';
UPDATE `command` SET `permission` = @id+39 WHERE `name` = 'showarea';
UPDATE `command` SET `permission` = @id+40 WHERE `name` = 'summon';
UPDATE `command` SET `permission` = @id+41 WHERE `name` = 'unaura';
UPDATE `command` SET `permission` = @id+42 WHERE `name` = 'unbindsight';
UPDATE `command` SET `permission` = @id+43 WHERE `name` = 'unfreeze';
UPDATE `command` SET `permission` = @id+44 WHERE `name` = 'unmute';
UPDATE `command` SET `permission` = @id+45 WHERE `name` = 'unpossess';
UPDATE `command` SET `permission` = @id+46 WHERE `name` = 'unstuck';
UPDATE `command` SET `permission` = @id+47 WHERE `name` = 'wchange';
/* cs_mmaps.cpp */

SET @id = 536;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'mmap';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'mmap loadedtiles';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'mmap loc';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'mmap path';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'mmap stats';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'mmap testarea';
/* cs_modify.cpp */

SET @id = 542;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'morph';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'demorph';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'modify';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'modify arenapoints';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'modify bit';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'modify drunk';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'modify energy';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'modify faction';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'modify gender';
UPDATE `command` SET `permission` = @id+9 WHERE `name` = 'modify honor';
UPDATE `command` SET `permission` = @id+10 WHERE `name` = 'modify hp';
UPDATE `command` SET `permission` = @id+11 WHERE `name` = 'modify mana';
UPDATE `command` SET `permission` = @id+12 WHERE `name` = 'modify money';
UPDATE `command` SET `permission` = @id+13 WHERE `name` = 'modify mount';
UPDATE `command` SET `permission` = @id+14 WHERE `name` = 'modify phase';
UPDATE `command` SET `permission` = @id+15 WHERE `name` = 'modify rage';
UPDATE `command` SET `permission` = @id+16 WHERE `name` = 'modify reputation';
UPDATE `command` SET `permission` = @id+17 WHERE `name` = 'modify runicpower';
UPDATE `command` SET `permission` = @id+18 WHERE `name` = 'modify scale';
UPDATE `command` SET `permission` = @id+19 WHERE `name` = 'modify speed';
UPDATE `command` SET `permission` = @id+20 WHERE `name` = 'modify speed all';
UPDATE `command` SET `permission` = @id+21 WHERE `name` = 'modify speed backwalk';
UPDATE `command` SET `permission` = @id+22 WHERE `name` = 'modify speed fly';
UPDATE `command` SET `permission` = @id+23 WHERE `name` = 'modify speed walk';
UPDATE `command` SET `permission` = @id+24 WHERE `name` = 'modify speed swim';
UPDATE `command` SET `permission` = @id+25 WHERE `name` = 'modify spell';
UPDATE `command` SET `permission` = @id+26 WHERE `name` = 'modify standstate';
UPDATE `command` SET `permission` = @id+27 WHERE `name` = 'modify talentpoints';
/* cs_npc.cpp */

SET @id = 570;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'npc';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'npc add';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'npc add formation';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'npc add item';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'npc add move';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'npc add temp';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'npc add delete';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'npc add delete item';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'npc add follow';
UPDATE `command` SET `permission` = @id+9 WHERE `name` = 'npc add follow stop';
UPDATE `command` SET `permission` = @id+10 WHERE `name` = 'npc set';
UPDATE `command` SET `permission` = @id+11 WHERE `name` = 'npc set allowmove';
UPDATE `command` SET `permission` = @id+12 WHERE `name` = 'npc set entry';
UPDATE `command` SET `permission` = @id+13 WHERE `name` = 'npc set factionid';
UPDATE `command` SET `permission` = @id+14 WHERE `name` = 'npc set flag';
UPDATE `command` SET `permission` = @id+15 WHERE `name` = 'npc set level';
UPDATE `command` SET `permission` = @id+16 WHERE `name` = 'npc set link';
UPDATE `command` SET `permission` = @id+17 WHERE `name` = 'npc set model';
UPDATE `command` SET `permission` = @id+18 WHERE `name` = 'npc set movetype';
UPDATE `command` SET `permission` = @id+19 WHERE `name` = 'npc set phase';
UPDATE `command` SET `permission` = @id+20 WHERE `name` = 'npc set spawndist';
UPDATE `command` SET `permission` = @id+21 WHERE `name` = 'npc set spawntime';
UPDATE `command` SET `permission` = @id+22 WHERE `name` = 'npc set data';
UPDATE `command` SET `permission` = @id+23 WHERE `name` = 'npc info';
UPDATE `command` SET `permission` = @id+24 WHERE `name` = 'npc near';
UPDATE `command` SET `permission` = @id+25 WHERE `name` = 'npc move';
UPDATE `command` SET `permission` = @id+26 WHERE `name` = 'npc playemote';
UPDATE `command` SET `permission` = @id+27 WHERE `name` = 'npc say';
UPDATE `command` SET `permission` = @id+28 WHERE `name` = 'npc textemote';
UPDATE `command` SET `permission` = @id+29 WHERE `name` = 'npc whisper';
UPDATE `command` SET `permission` = @id+30 WHERE `name` = 'npc yell';
UPDATE `command` SET `permission` = @id+31 WHERE `name` = 'npc tame';
/* cs_quest.cpp */

SET @id = 602;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'quest';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'quest add';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'quest complete';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'quest remove';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'quest reward';
/* cs_reload.cpp */

SET @id = 607;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'reload';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'reload access_requirement';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'reload achievement_criteria_data';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'reload achievement_reward';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'reload all';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'reload all achievement';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'reload all area';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'reload all eventai';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'reload all gossips';
UPDATE `command` SET `permission` = @id+9 WHERE `name` = 'reload all item';
UPDATE `command` SET `permission` = @id+10 WHERE `name` = 'reload all locales';
UPDATE `command` SET `permission` = @id+11 WHERE `name` = 'reload all loot';
UPDATE `command` SET `permission` = @id+12 WHERE `name` = 'reload all npc';
UPDATE `command` SET `permission` = @id+13 WHERE `name` = 'reload all quest';
UPDATE `command` SET `permission` = @id+14 WHERE `name` = 'reload all scripts';
UPDATE `command` SET `permission` = @id+15 WHERE `name` = 'reload all spell';
UPDATE `command` SET `permission` = @id+16 WHERE `name` = 'reload areatrigger_involvedrelation';
UPDATE `command` SET `permission` = @id+17 WHERE `name` = 'reload areatrigger_tavern';
UPDATE `command` SET `permission` = @id+18 WHERE `name` = 'reload areatrigger_teleport';
UPDATE `command` SET `permission` = @id+19 WHERE `name` = 'reload auctions';
UPDATE `command` SET `permission` = @id+20 WHERE `name` = 'reload autobroadcast';
UPDATE `command` SET `permission` = @id+21 WHERE `name` = 'reload command';
UPDATE `command` SET `permission` = @id+22 WHERE `name` = 'reload conditions';
UPDATE `command` SET `permission` = @id+23 WHERE `name` = 'reload config';
UPDATE `command` SET `permission` = @id+24 WHERE `name` = 'reload creature_text';
UPDATE `command` SET `permission` = @id+25 WHERE `name` = 'reload creature_ai_scripts';
UPDATE `command` SET `permission` = @id+26 WHERE `name` = 'reload creature_ai_texts';
UPDATE `command` SET `permission` = @id+27 WHERE `name` = 'reload creature_questender';
UPDATE `command` SET `permission` = @id+28 WHERE `name` = 'reload creature_linked_respawn';
UPDATE `command` SET `permission` = @id+29 WHERE `name` = 'reload creature_loot_template';
UPDATE `command` SET `permission` = @id+30 WHERE `name` = 'reload creature_onkill_reputation';
UPDATE `command` SET `permission` = @id+31 WHERE `name` = 'reload creature_queststarter';
UPDATE `command` SET `permission` = @id+32 WHERE `name` = 'reload creature_summon_groups';
UPDATE `command` SET `permission` = @id+33 WHERE `name` = 'reload creature_template';
UPDATE `command` SET `permission` = @id+34 WHERE `name` = 'reload disables';
UPDATE `command` SET `permission` = @id+35 WHERE `name` = 'reload disenchant_loot_template';
UPDATE `command` SET `permission` = @id+36 WHERE `name` = 'reload event_scripts';
UPDATE `command` SET `permission` = @id+37 WHERE `name` = 'reload fishing_loot_template';
UPDATE `command` SET `permission` = @id+38 WHERE `name` = 'reload game_graveyard_zone';
UPDATE `command` SET `permission` = @id+39 WHERE `name` = 'reload game_tele';
UPDATE `command` SET `permission` = @id+40 WHERE `name` = 'reload gameobject_questender';
UPDATE `command` SET `permission` = @id+41 WHERE `name` = 'reload gameobject_loot_template';
UPDATE `command` SET `permission` = @id+42 WHERE `name` = 'reload gameobject_queststarter';
UPDATE `command` SET `permission` = @id+43 WHERE `name` = 'reload gm_tickets';
UPDATE `command` SET `permission` = @id+44 WHERE `name` = 'reload gossip_menu';
UPDATE `command` SET `permission` = @id+45 WHERE `name` = 'reload gossip_menu_option';
UPDATE `command` SET `permission` = @id+46 WHERE `name` = 'reload item_enchantment_template';
UPDATE `command` SET `permission` = @id+47 WHERE `name` = 'reload item_loot_template';
UPDATE `command` SET `permission` = @id+48 WHERE `name` = 'reload item_set_names';
UPDATE `command` SET `permission` = @id+49 WHERE `name` = 'reload lfg_dungeon_rewards';
UPDATE `command` SET `permission` = @id+50 WHERE `name` = 'reload locales_achievement_reward';
UPDATE `command` SET `permission` = @id+51 WHERE `name` = 'reload locales_creature';
UPDATE `command` SET `permission` = @id+52 WHERE `name` = 'reload locales_creature_text';
UPDATE `command` SET `permission` = @id+53 WHERE `name` = 'reload locales_gameobject';
UPDATE `command` SET `permission` = @id+54 WHERE `name` = 'reload locales_gossip_menu_option';
UPDATE `command` SET `permission` = @id+55 WHERE `name` = 'reload locales_item';
UPDATE `command` SET `permission` = @id+56 WHERE `name` = 'reload locales_item_set_name';
UPDATE `command` SET `permission` = @id+57 WHERE `name` = 'reload locales_npc_text';
UPDATE `command` SET `permission` = @id+58 WHERE `name` = 'reload locales_page_text';
UPDATE `command` SET `permission` = @id+59 WHERE `name` = 'reload locales_points_of_interest';
UPDATE `command` SET `permission` = @id+60 WHERE `name` = 'reload locales_quest';
UPDATE `command` SET `permission` = @id+61 WHERE `name` = 'reload mail_level_reward';
UPDATE `command` SET `permission` = @id+62 WHERE `name` = 'reload mail_loot_template';
UPDATE `command` SET `permission` = @id+63 WHERE `name` = 'reload milling_loot_template';
UPDATE `command` SET `permission` = @id+64 WHERE `name` = 'reload npc_spellclick_spells';
UPDATE `command` SET `permission` = @id+65 WHERE `name` = 'reload npc_trainer';
UPDATE `command` SET `permission` = @id+66 WHERE `name` = 'reload npc_vendor';
UPDATE `command` SET `permission` = @id+67 WHERE `name` = 'reload page_text';
UPDATE `command` SET `permission` = @id+68 WHERE `name` = 'reload pickpocketing_loot_template';
UPDATE `command` SET `permission` = @id+69 WHERE `name` = 'reload points_of_interest';
UPDATE `command` SET `permission` = @id+70 WHERE `name` = 'reload prospecting_loot_template';
UPDATE `command` SET `permission` = @id+71 WHERE `name` = 'reload quest_poi';
UPDATE `command` SET `permission` = @id+72 WHERE `name` = 'reload quest_template';
UPDATE `command` SET `permission` = @id+73 WHERE `name` = 'reload rbac';
UPDATE `command` SET `permission` = @id+74 WHERE `name` = 'reload reference_loot_template';
UPDATE `command` SET `permission` = @id+75 WHERE `name` = 'reload reserved_name';
UPDATE `command` SET `permission` = @id+76 WHERE `name` = 'reload reputation_reward_rate';
UPDATE `command` SET `permission` = @id+77 WHERE `name` = 'reload reputation_spillover_template';
UPDATE `command` SET `permission` = @id+78 WHERE `name` = 'reload skill_discovery_template';
UPDATE `command` SET `permission` = @id+79 WHERE `name` = 'reload skill_extra_item_template';
UPDATE `command` SET `permission` = @id+80 WHERE `name` = 'reload skill_fishing_base_level';
UPDATE `command` SET `permission` = @id+81 WHERE `name` = 'reload skinning_loot_template';
UPDATE `command` SET `permission` = @id+82 WHERE `name` = 'reload smart_scripts';
UPDATE `command` SET `permission` = @id+83 WHERE `name` = 'reload spell_required';
UPDATE `command` SET `permission` = @id+84 WHERE `name` = 'reload spell_area';
UPDATE `command` SET `permission` = @id+85 WHERE `name` = 'reload spell_bonus_data';
UPDATE `command` SET `permission` = @id+86 WHERE `name` = 'reload spell_group';
UPDATE `command` SET `permission` = @id+87 WHERE `name` = 'reload spell_learn_spell';
UPDATE `command` SET `permission` = @id+88 WHERE `name` = 'reload spell_loot_template';
UPDATE `command` SET `permission` = @id+89 WHERE `name` = 'reload spell_linked_spell';
UPDATE `command` SET `permission` = @id+90 WHERE `name` = 'reload spell_pet_auras';
UPDATE `command` SET `permission` = @id+91 WHERE `name` = 'reload spell_proc_event';
UPDATE `command` SET `permission` = @id+92 WHERE `name` = 'reload spell_proc';
UPDATE `command` SET `permission` = @id+93 WHERE `name` = 'reload spell_scripts';
UPDATE `command` SET `permission` = @id+94 WHERE `name` = 'reload spell_target_position';
UPDATE `command` SET `permission` = @id+95 WHERE `name` = 'reload spell_threats';
UPDATE `command` SET `permission` = @id+96 WHERE `name` = 'reload spell_group_stack_rules';
UPDATE `command` SET `permission` = @id+97 WHERE `name` = 'reload trinity_string';
UPDATE `command` SET `permission` = @id+98 WHERE `name` = 'reload warden_action';
UPDATE `command` SET `permission` = @id+99 WHERE `name` = 'reload waypoint_scripts';
UPDATE `command` SET `permission` = @id+100 WHERE `name` = 'reload waypoint_data';
UPDATE `command` SET `permission` = @id+101 WHERE `name` = 'reload vehicle_accessory';
UPDATE `command` SET `permission` = @id+102 WHERE `name` = 'reload vehicle_template_accessory';
/* cs_reset.cpp */

SET @id = 710;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'reset';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'reset achievements';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'reset honor';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'reset level';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'reset spells';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'reset stats';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'reset talents';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'reset all';
/* cs_server.cpp */

SET @id = 718;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'server';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'server corpses';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'server exit';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'server idlerestart';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'server idlerestart cancel';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'server idleshutdown';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'server idleshutdown cancel';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'server info';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'server plimit';
UPDATE `command` SET `permission` = @id+9 WHERE `name` = 'server restart';
UPDATE `command` SET `permission` = @id+10 WHERE `name` = 'server restart cancel';
UPDATE `command` SET `permission` = @id+11 WHERE `name` = 'server set';
UPDATE `command` SET `permission` = @id+12 WHERE `name` = 'server set closed';
UPDATE `command` SET `permission` = @id+13 WHERE `name` = 'server set difftime';
UPDATE `command` SET `permission` = @id+14 WHERE `name` = 'server set loglevel';
UPDATE `command` SET `permission` = @id+15 WHERE `name` = 'server set motd';
UPDATE `command` SET `permission` = @id+16 WHERE `name` = 'server shutdown';
UPDATE `command` SET `permission` = @id+17 WHERE `name` = 'server shutdown cancel';
UPDATE `command` SET `permission` = @id+18 WHERE `name` = 'server motd';
/* cs_tele.cpp */

SET @id = 737;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'tele';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'tele add';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'tele del';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'tele name';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'tele group';
/* cs_ticket.cpp */

SET @id = 742;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'ticket';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'ticket assign';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'ticket close';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'ticket closedlist';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'ticket comment';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'ticket complete';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'ticket delete';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'ticket escalate';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'ticket escalatedlist';
UPDATE `command` SET `permission` = @id+9 WHERE `name` = 'ticket list';
UPDATE `command` SET `permission` = @id+10 WHERE `name` = 'ticket onlinelist';
UPDATE `command` SET `permission` = @id+11 WHERE `name` = 'ticket reset';
UPDATE `command` SET `permission` = @id+12 WHERE `name` = 'ticket response';
UPDATE `command` SET `permission` = @id+13 WHERE `name` = 'ticket response append';
UPDATE `command` SET `permission` = @id+14 WHERE `name` = 'ticket response appendln';
UPDATE `command` SET `permission` = @id+15 WHERE `name` = 'ticket togglesystem';
UPDATE `command` SET `permission` = @id+16 WHERE `name` = 'ticket unassign';
UPDATE `command` SET `permission` = @id+17 WHERE `name` = 'ticket viewid';
UPDATE `command` SET `permission` = @id+18 WHERE `name` = 'ticket viewname';
/* cs_titles.cpp & cs_wp.cpp */

SET @id = 761;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'titles';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'titles add';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'titles current';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'titles remove';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'titles set';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'titles set mask';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'wp';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'wp add';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'wp event';
UPDATE `command` SET `permission` = @id+9 WHERE `name` = 'wp load';
UPDATE `command` SET `permission` = @id+10 WHERE `name` = 'wp modify';
UPDATE `command` SET `permission` = @id+11 WHERE `name` = 'wp unload';
UPDATE `command` SET `permission` = @id+12 WHERE `name` = 'wp reload';
UPDATE `command` SET `permission` = @id+13 WHERE `name` = 'wp show';
-- Update command table and remove obsolete permissions (0 = non existent permission)
UPDATE `command` SET `permission` = 0 WHERE `permission` IN (7, 8, 9, 10, 12);
-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = 201 WHERE `name` = 'rbac account';
UPDATE `command` SET `permission` = 202 WHERE `name` = 'rbac account group';
UPDATE `command` SET `permission` = 203 WHERE `name` = 'rbac account group add';
UPDATE `command` SET `permission` = 204 WHERE `name` = 'rbac account group remove';
UPDATE `command` SET `permission` = 205 WHERE `name` = 'rbac account role';
UPDATE `command` SET `permission` = 206 WHERE `name` = 'rbac account role grant';
UPDATE `command` SET `permission` = 207 WHERE `name` = 'rbac account role deny';
UPDATE `command` SET `permission` = 208 WHERE `name` = 'rbac account role revoke';
UPDATE `command` SET `permission` = 209 WHERE `name` = 'rbac account permission';
UPDATE `command` SET `permission` = 210 WHERE `name` = 'rbac account permission grant';
UPDATE `command` SET `permission` = 211 WHERE `name` = 'rbac account permission deny';
UPDATE `command` SET `permission` = 212 WHERE `name` = 'rbac account permission revoke';
UPDATE `command` SET `permission` = 214 WHERE `name` = 'rbac account list groups';
UPDATE `command` SET `permission` = 215 WHERE `name` = 'rbac account list roles';
UPDATE `command` SET `permission` = 216 WHERE `name` = 'rbac account list permissions';
UPDATE `command` SET `permission`=214 WHERE `name`='rbac list groups';
UPDATE `command` SET `permission`=215 WHERE `name`='rbac list roles';
UPDATE `command` SET `permission`=216 WHERE `name`='rbac list permissions';
UPDATE `command` SET `permission`=262 WHERE `name`='bf enable';
UPDATE `command` SET `permission`=576 WHERE `name`='npc delete';
UPDATE `command` SET `permission`=577 WHERE `name`='npc delete item';
UPDATE `command` SET `permission`=578 WHERE `name`='npc follow';
UPDATE `command` SET `permission`=579 WHERE `name`='npc follow stop';
UPDATE `command` SET `permission`=316 WHERE `name`='debug play cinematic';
DELETE FROM `command` WHERE `name` = 'account email';
DELETE FROM `command` WHERE `name` = 'account set sec email';
DELETE FROM `command` WHERE `name` = 'account set sec regmail';

INSERT INTO `command` (`name`, `permission`, `help`) VALUES
('account email', 263, 'Syntax: .account email $oldemail $currentpassword $newemail $newemailconfirmation\r\n\r\n Change your account email. You may need to check the actual security mode to see if email input is necessary for password change'),
('account set sec email', 265, 'Syntax: .account set sec email $accountname $email $emailconfirmation\r\n\r\nSet the email for entered player account.'),
('account set sec regmail', 266, 'Syntax: .account set sec regmail $account $regmail $regmailconfirmation\r\n\r\nSets the regmail for entered player account.');

/* cs_cast.cpp */

SET @id = 267;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'cast';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'cast back';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'cast dist';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'cast self';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'cast target';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'cast dest';

/* cs_go.cpp */

SET @id = 377;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'go';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'go creature';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'go graveyard';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'go grid';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'go object';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'go taxinode';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'go ticket';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'go trigger';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'go xyz';
UPDATE `command` SET `permission` = @id+9 WHERE `name` = 'go zonexy';

/* cs_gobject.cpp */

SET @id = 387;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'gobject';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'gobject activate';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'gobject add';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'gobject add temp';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'gobject delete';
UPDATE `command` SET `permission` = @id+5 WHERE `name` = 'gobject info';
UPDATE `command` SET `permission` = @id+6 WHERE `name` = 'gobject move';
UPDATE `command` SET `permission` = @id+7 WHERE `name` = 'gobject near';
UPDATE `command` SET `permission` = @id+8 WHERE `name` = 'gobject set';
UPDATE `command` SET `permission` = @id+9 WHERE `name` = 'gobject set phase';
UPDATE `command` SET `permission` = @id+10 WHERE `name` = 'gobject set state';
UPDATE `command` SET `permission` = @id+11 WHERE `name` = 'gobject target';
UPDATE `command` SET `permission` = @id+12 WHERE `name` = 'gobject turn';

/* cs_instance.cpp */

SET @id = 412;

-- Update command table with new RBAC permissions
UPDATE `command` SET `permission` = @id+0 WHERE `name` = 'instance';
UPDATE `command` SET `permission` = @id+1 WHERE `name` = 'instance listbinds';
UPDATE `command` SET `permission` = @id+2 WHERE `name` = 'instance unbind';
UPDATE `command` SET `permission` = @id+3 WHERE `name` = 'instance stats';
UPDATE `command` SET `permission` = @id+4 WHERE `name` = 'instance savedata';
UPDATE `creature_template` SET `modelid1`=1126,`modelid2`=16925 WHERE `entry`=21393;
-- Update for Forgotten npcs to award credit.
UPDATE `smart_scripts` SET `action_type`=85 WHERE  `entryorguid`=27224 AND `source_type`=0 AND `id`=0 AND `link`=1;
UPDATE `smart_scripts` SET `action_type`=85 WHERE  `entryorguid`=27225 AND `source_type`=0 AND `id`=0 AND `link`=1;
UPDATE `smart_scripts` SET `action_type`=85 WHERE  `entryorguid`=27229 AND `source_type`=0 AND `id`=0 AND `link`=1;
UPDATE `smart_scripts` SET `action_type`=85 WHERE  `entryorguid`=27226 AND `source_type`=0 AND `id`=0 AND `link`=1;
-- Forced model for Channel Bunny... should've used that earlier.
UPDATE `creature` SET `modelid`=16925, `position_x`=1924.63, `position_y`=5574.76, `position_z`=273.122 WHERE `guid`=74872;
DELETE FROM `conditions` WHERE  `SourceTypeOrReferenceId`=15 AND `SourceGroup`=8455 AND `SourceEntry`=4;
UPDATE `creature_template` SET`AIName`='SmartAI' WHERE `entry`=26321;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=26321;
DELETE FROM `smart_scripts` WHERE `entryorguid`=26321;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26321,0,0,0,8,0,100,1,47530,0,0,0,33,26321,0,0,0,0,0,7,0,0,0,0,0,0,0,'Lothalor Ancient - On Spellhit - Give Credit to Invoker');
-- [QUEST] War Is Hell
UPDATE `creature` SET `spawntimesecs`=60 WHERE `id` IN (24009,24010);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (24009,24010);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (24009,24010) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
-- Alliance Corpse
(24009, 0, 0, 1, 8, 0, 100, 1, 42793, 0, 0, 0, 11, 43297, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Alliance Corpse - SMART_EVENT_SPELLHIT - SMART_ACTION_CAST'),
(24009, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alliance Corpse - SMART_EVENT_LINK - SMART_ACTION_FORCE_DESPAWN'),
-- Forsaken Corpse
(24010, 0, 0, 1, 8, 0, 100, 1, 42793, 0, 0, 0, 11, 43297, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Corpse - SMART_EVENT_SPELLHIT - SMART_ACTION_CAST'),
(24010, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Corpse - SMART_EVENT_LINK - SMART_ACTION_FORCE_DESPAWN');

DELETE FROM `conditions` WHERE `SourceEntry`=42793 AND `SourceTypeOrReferenceId`=17;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(17, 0, 42793, 0, 0, 31, 1, 3, 24009, 0, 0, 0, 0, '', ''),
(17, 0, 42793, 0, 1, 31, 1, 3, 24010, 0, 0, 0, 0, '', '');
UPDATE `conditions` SET `ElseGroup`=2 WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=75509;
UPDATE `smart_scripts` SET `target_type`=24 WHERE  `entryorguid`=2935200 AND `source_type`=9 AND `id`=0 AND `link`=0;
DELETE FROM `gameobject` WHERE `id`= 15885;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(99849, 15885, 1, 1, 1, 7853.95, -2212.3, 456.397, 0, 0, 0, 0, 0, 0, 0, 1);
-- Fate of the Titans (12986)
-- http://www.youtube.com/watch?v=H6HED6PaxIs

SET @NPC_DISK              := 30313; -- Mobile Databank
SET @NPC_BUNNY_INVENTION   := 30315; -- Temple of Invention Bunny
SET @NPC_BUNNY_LIFE        := 30316; -- Temple of Life Bunny
SET @NPC_BUNNY_WINTER      := 30317; -- Temple of Winter Bunny
SET @NPC_BUNNY_ORDER       := 30318; -- Temple of Order Bunny
SET @NPC_BUNNY_DATASCAN    := 30889; -- Data Scan Target Bunny
SET @SPELL_DATASCAN        := 56523; -- Data Scan
SET @SPELL_INVENTION_KC    := 56532; -- Temple of Invention Kill Credit
SET @SPELL_LIFE_KC         := 56534; -- Temple of Life Kill Credit
SET @SPELL_WINTER_KC       := 56533; -- Temple of Winter Kill Credit
SET @SPELL_ORDER_KC        := 56535; -- Temple of Order Kill Credit
SET @GUID                  := 127294;

UPDATE `creature_template` SET `AIName`='SmartAI',`speed_walk`=3.14286, `InhabitType`=4 WHERE `entry`=@NPC_DISK;
UPDATE `creature_template` SET `AIName`='SmartAI',`unit_flags`=`unit_flags`|33554432,`InhabitType`=7,`flags_extra`=`flags_extra`|128 WHERE `entry` IN (@NPC_BUNNY_INVENTION,@NPC_BUNNY_LIFE,@NPC_BUNNY_WINTER,@NPC_BUNNY_ORDER,@NPC_BUNNY_DATASCAN);

-- Sniffed
DELETE FROM `creature` WHERE `id` IN (@NPC_BUNNY_INVENTION,@NPC_BUNNY_LIFE,@NPC_BUNNY_WINTER,@NPC_BUNNY_ORDER,@NPC_BUNNY_DATASCAN);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
-- Databank should go from one to another and say text
(@GUID+0,@NPC_BUNNY_INVENTION,571,1,1,0,0,7865.214,-1397.313,1534.143,3.752458,300,0,0,1,0,0,0,0,0),
(@GUID+1,@NPC_BUNNY_LIFE,571,1,1,0,0,7994.017,-2734.839,1133.662,0.3316126,300,0,0,1,0,0,0,0,0),
(@GUID+2,@NPC_BUNNY_WINTER,571,1,1,0,0,7498.68,-1899.41,1473.61,0.132902,300,0,0,1,0,0,0,0,0),
(@GUID+3,@NPC_BUNNY_ORDER,571,1,1,0,0,8194.199,-1963.597,1738.56,1.954769,300,0,0,1,0,0,0,0,0),
-- At the Temple of Order:
(@GUID+4,@NPC_BUNNY_DATASCAN,571,1,1,0,0,8130.811,-1995.321,1781.117,0.05235988,300,0,0,1,0,0,0,0,0),
(@GUID+5,@NPC_BUNNY_DATASCAN,571,1,1,0,0,8213.646,-1901.764,1744.02,0.5759587,300,0,0,1,0,0,0,0,0),
(@GUID+6,@NPC_BUNNY_DATASCAN,571,1,1,0,0,8255.328,-1982.391,1742.117,4.031711,300,0,0,1,0,0,0,0,0),
-- At the Temple of Invention:
(@GUID+7,@NPC_BUNNY_DATASCAN,571,1,1,0,0,7868.994,-1375.799,1541.754,4.712389,300,0,0,1,0,0,0,0,0),
(@GUID+8,@NPC_BUNNY_DATASCAN,571,1,1,0,0,7924.429,-1385.165,1534.788,6.038839,300,0,0,1,0,0,0,0,0),
(@GUID+9,@NPC_BUNNY_DATASCAN,571,1,1,0,0,7903.273, -1424.807, 1539.821,2.048841,300,0,0,1,0,0,0,0,0),
(@GUID+10,@NPC_BUNNY_DATASCAN,571,1,1,0,0,7863.330, -1434.625, 1537.565,3.072831,300,0,0,1,0,0,0,0,0),
-- At the Temple of Life:
(@GUID+11,@NPC_BUNNY_DATASCAN,571,1,1,0,0,7924.706,-2748.963,1151.056,4.520403,300,0,0,1,0,0,0,0,0),
(@GUID+12,@NPC_BUNNY_DATASCAN,571,1,1,0,0,8010.217,-2750.608,1151.104,0.418879,300,0,0,1,0,0,0,0,0),
(@GUID+13,@NPC_BUNNY_DATASCAN,571,1,1,0,0,8027.505,-2728.616,1139.939,3.944444,300,0,0,1,0,0,0,0,0),
(@GUID+14,@NPC_BUNNY_DATASCAN,571,1,1,0,0,7978.187,-2714.357,1137.354,2.643541,300,0,0,1,0,0,0,0,0),
-- At the Temple of Winter:
(@GUID+15,@NPC_BUNNY_DATASCAN,571,1,1,0,0,7520.712,-1929.840,1482.500,4.520403,300,0,0,1,0,0,0,0,0),
(@GUID+16,@NPC_BUNNY_DATASCAN,571,1,1,0,0,7478.601, -1917.123, 1473.615,0.418879,300,0,0,1,0,0,0,0,0),
(@GUID+17,@NPC_BUNNY_DATASCAN,571,1,1,0,0,7473.774, -1875.455, 1473.614,3.944444,300,0,0,1,0,0,0,0,0);

-- Databank only executes SAI near Temple Bunnies
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=@NPC_DISK;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,1,@NPC_DISK,0,0,29,0,@NPC_BUNNY_INVENTION,15,0,0,0,'','Execute sai if near dummy npc'),
(22,2,@NPC_DISK,0,0,29,0,@NPC_BUNNY_WINTER,15,0,0,0,'','Execute sai if near dummy npc'),
(22,3,@NPC_DISK,0,0,29,0,@NPC_BUNNY_LIFE,15,0,0,0,'','Execute sai if near dummy npc'),
(22,4,@NPC_DISK,0,0,29,0,@NPC_BUNNY_ORDER,15,0,0,0,'','Execute sai if near dummy npc');

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@NPC_DISK,@NPC_BUNNY_INVENTION);
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@NPC_DISK*100+0,@NPC_DISK*100+1,@NPC_DISK*100+2,@NPC_DISK*100+3);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_DISK,0,0,0,10,0,100,1,500,1000,500,1000,80,@NPC_DISK*100+0,2,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - OOC near npc -  Run script'),
--
(@NPC_DISK,0,1,0,10,0,100,1,500,1000,500,1000,80,@NPC_DISK*100+1,2,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - OOC near npc -  Run script'),
--
(@NPC_DISK,0,2,0,10,0,100,1,500,1000,500,1000,80,@NPC_DISK*100+2,2,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - OOC near npc -  Run script'),
-- 
(@NPC_DISK,0,3,0,10,0,100,1,500,1000,500,1000,80,@NPC_DISK*100+3,2,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - OOC near npc -  Run script'),
--
(@NPC_DISK*100+0,9,0,0,0,0,100,0,5000,5000,5000,5000,69,1,0,0,0,0,0,10,@GUID+7,@NPC_BUNNY_DATASCAN,0,0,0,0,0,'Mobile Databank - On Script - Move to Pos'),
(@NPC_DISK*100+0,9,1,0,0,0,100,0,3000,3000,3000,3000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+0,9,2,0,0,0,100,0,2000,2000,2000,2000,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+0,9,3,0,0,0,100,0,8000,8000,8000,8000,69,1,0,0,0,0,0,10,@GUID+8,@NPC_BUNNY_DATASCAN,0,0,0,0,0,'Mobile Databank - On Script - Move to Pos'),
(@NPC_DISK*100+0,9,4,0,0,0,100,0,7000,7000,7000,7000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+0,9,5,0,0,0,100,0,9000,9000,9000,9000,69,1,0,0,0,0,0,10,@GUID+9,@NPC_BUNNY_DATASCAN,0,0,0,0,0,'Mobile Databank - On Script - Move to Pos'),
(@NPC_DISK*100+0,9,6,0,0,0,100,0,3000,3000,3000,3000,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+0,9,7,0,0,0,100,0,9000,9000,9000,9000,69,1,0,0,0,0,0,10,@GUID+10,@NPC_BUNNY_DATASCAN,0,0,0,0,0,'Mobile Databank - On Script - Move to Pos'),
(@NPC_DISK*100+0,9,8,0,0,0,100,0,3000,3000,3000,3000,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+0,9,9,0,0,0,100,0,0,0,0,0,11,@SPELL_INVENTION_KC,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On script - Cast Credit'),
--
(@NPC_DISK*100+1,9,0,0,0,0,100,0,5000,5000,5000,5000,69,1,0,0,0,0,0,10,@GUID+15,@NPC_BUNNY_DATASCAN,0,0,0,0,0,'Mobile Databank - On Script - Move to Pos'),
(@NPC_DISK*100+1,9,1,0,0,0,100,0,3000,3000,3000,3000,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+1,9,2,0,0,0,100,0,2000,2000,2000,2000,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+1,9,3,0,0,0,100,0,8000,8000,8000,8000,69,1,0,0,0,0,0,10,@GUID+16,@NPC_BUNNY_DATASCAN,0,0,0,0,0,'Mobile Databank - On Script - Move to Pos'),
(@NPC_DISK*100+1,9,4,0,0,0,100,0,7000,7000,7000,7000,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+1,9,5,0,0,0,100,0,9000,9000,9000,9000,69,1,0,0,0,0,0,10,@GUID+17,@NPC_BUNNY_DATASCAN,0,0,0,0,0,'Mobile Databank - On Script - Move to Pos'),
(@NPC_DISK*100+1,9,6,0,0,0,100,0,3000,3000,3000,3000,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+1,9,7,0,0,0,100,0,3000,3000,3000,3000,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+1,9,8,0,0,0,100,0,0,0,0,0,11,@SPELL_WINTER_KC,0,0,0,0,0,7,0,0,0,0,0,0,0,'Mobile Databank - On script - Cast Credit'),
--
(@NPC_DISK*100+2,9,0,0,0,0,100,0,5000,5000,5000,5000,69,1,0,0,0,0,0,10,@GUID+11,@NPC_BUNNY_DATASCAN,0,0,0,0,0,'Mobile Databank - On Script - Move to Pos'),
(@NPC_DISK*100+2,9,1,0,0,0,100,0,3000,3000,3000,3000,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+2,9,2,0,0,0,100,0,2000,2000,2000,2000,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+2,9,3,0,0,0,100,0,8000,8000,8000,8000,69,1,0,0,0,0,0,10,@GUID+12,@NPC_BUNNY_DATASCAN,0,0,0,0,0,'Mobile Databank - On Script - Move to Pos'),
(@NPC_DISK*100+2,9,4,0,0,0,100,0,7000,7000,7000,7000,1,12,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+2,9,5,0,0,0,100,0,9000,9000,9000,9000,69,1,0,0,0,0,0,10,@GUID+13,@NPC_BUNNY_DATASCAN,0,0,0,0,0,'Mobile Databank - On Script - Move to Pos'),
(@NPC_DISK*100+2,9,6,0,0,0,100,0,3000,3000,3000,3000,1,13,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+2,9,7,0,0,0,100,0,9000,9000,9000,9000,69,1,0,0,0,0,0,10,@GUID+14,@NPC_BUNNY_DATASCAN,0,0,0,0,0,'Mobile Databank - On Script - Move to Pos'),
(@NPC_DISK*100+2,9,8,0,0,0,100,0,3000,3000,3000,3000,1,14,0,0,0,0,0,1,0,0,0,0,0,0,0,'MMobile Databank - On Script - Say'),
(@NPC_DISK*100+2,9,9,0,0,0,100,0,0,0,0,0,11,@SPELL_LIFE_KC,0,0,0,0,0,7,0,0,0,0,0,0,0,'Mobile Databank - On script - Cast Credit'),
--
(@NPC_DISK*100+3,9,0,0,0,0,100,0,5000,5000,5000,5000,69,1,0,0,0,0,0,10,@GUID+4,@NPC_BUNNY_DATASCAN,0,0,0,0,0,'Mobile Databank - On Script - Move to Pos'),
(@NPC_DISK*100+3,9,1,0,0,0,100,0,3000,3000,3000,3000,1,15,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+3,9,2,0,0,0,100,0,2000,2000,2000,2000,1,16,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+3,9,3,0,0,0,100,0,8000,8000,8000,8000,69,1,0,0,0,0,0,10,@GUID+5,@NPC_BUNNY_DATASCAN,0,0,0,0,0,'Mobile Databank - On Script - Move to Pos'),
(@NPC_DISK*100+3,9,4,0,0,0,100,0,7000,7000,7000,7000,1,17,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+3,9,5,0,0,0,100,0,9000,9000,9000,9000,69,1,0,0,0,0,0,10,@GUID+6,@NPC_BUNNY_DATASCAN,0,0,0,0,0,'Mobile Databank - On Script - Move to Pos'),
(@NPC_DISK*100+3,9,6,0,0,0,100,0,3000,3000,3000,3000,1,18,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mobile Databank - On Script - Say'),
(@NPC_DISK*100+3,9,7,0,0,0,100,0,0,0,0,0,11,@SPELL_ORDER_KC,0,0,0,0,0,7,0,0,0,0,0,0,0,'Mobile Databank - On script - Cast Credit');


DELETE FROM `creature_text` WHERE `entry`=@NPC_DISK;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
-- At the Temple of Invention:
(@NPC_DISK,0,0,'Temple of Invention analysis commencing.',12,0,100,15,0,0,'Mobile Databank'),
(@NPC_DISK,1,0,'Temple of Invention verified to be in-tact.',12,0,100,15,0,0,'Mobile Databank'),
(@NPC_DISK,2,0,'Mechanical servants appear to have turned against each other. Several attendants have been piled together in an unorganized manner.',12,0,100,15,0,0,'Mobile Databank'),
(@NPC_DISK,3,0,'Remaining mechagnome guardians corrupted by unknown source.',12,0,100,15,0,0,'Mobile Databank'),
(@NPC_DISK,4,0,'Watcher Mimir verified to no longer be present. Analysis complete.',12,0,100,15,0,0,'Mobile Databank'),
-- At the Temple of Winter:
(@NPC_DISK,5,0,'Temple of Winter analysis commencing.',12,0,100,15,0,0,'Mobile Databank'),
(@NPC_DISK,6,0,'Temple of Winter verified to be in-tact.',12,0,100,15,0,0,'Mobile Databank'),
(@NPC_DISK,7,0,'Temple guardians verified to be deceased. Sulfurous odor suggests that death resulted from a fire-base entity.',12,0,100,15,0,0,'Mobile Databank'),
(@NPC_DISK,8,0,'Previously established cold weather patterns at the temple have ceased.',12,0,100,15,0,0,'Mobile Databank'),
(@NPC_DISK,9,0,'Watcher Hodir verified to no longer be present. Analysis complete.',12,0,100,15,0,0,'Mobile Databank'),
-- At the Temple of Life:
(@NPC_DISK,10,0,'Temple of Life analysis commencing.',12,0,100,15,0,0,'Mobile Databank'),
(@NPC_DISK,11,0,'Temple of Life verified to be damaged beyond repair.',12,0,100,15,0,0,'Mobile Databank'),
(@NPC_DISK,12,0,'Evidence indicates a significant battle. The opponent of Watcher Freya estimated to be of similar size and strength to Watcher Freya.',12,0,100,15,0,0,'Mobile Databank'),
(@NPC_DISK,13,0,'Temple guardians are no longer present. Plant forms associated with temple are deceased.',12,0,100,15,0,0,'Mobile Databank'),
(@NPC_DISK,14,0,'Watcher Freya verified to no longer be present. Analysis complete.',12,0,100,15,0,0,'Mobile Databank'),
-- At the Temple of Order:
(@NPC_DISK,15,0,'Temple of Order analysis commencing.',12,0,100,15,0,0,'Mobile Databank'),
(@NPC_DISK,16,0,'Temple of Order verified to be in-tact.',12,0,100,15,0,0,'Mobile Databank'),
(@NPC_DISK,17,0,'No indications of struggle are present. No guardians are present.',12,0,100,15,0,0,'Mobile Databank'),
(@NPC_DISK,18,0,'Watcher Tyr verified to no longer be present. Analysis complete.',12,0,100,15,0,0,'Mobile Databank');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=1 AND `SourceEntry`=28739 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22,1,28739,0,0,1,1,52231,0,0,1,0,0,'','Execute sai only if aura is not presented');
DELETE FROM `disables` WHERE `entry` IN (52227,52228) AND `sourcetype`=0;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(0,52227,64,'','','Disable LOS check for Dilute Blight Cauldron'),
(0,52228,64,'','','Disable LOS check for Kill Credit (quest 12669)');
UPDATE `creature_template` SET `ainame`='SmartAI' WHERE `entry`=28739;
DELETE FROM `smart_scripts` WHERE `entryorguid`=28739 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(28739,0,0,1,8,0,100,0,52227,0,0,0,11,52228,0,0,0,0,0,7,0,0,0,0,0,0,0,'Blight Cauldron Bunny 00 - On Spell Hit - Give Quest Credit'),
(28739,0,1,0,61,0,100,0,0,0,0,0,11,52231,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blight Cauldron Bunny 00 - Link With Previous Event - Cast Cauldron Diluted Effect'),
(28739,0,2,0,1,0,100,0,30000,30000,30000,30000,28,52231,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blight Cauldron Bunny 00 - OOC - Remove Aura From Cauldron Diluted Effect');
-- 10146 - [Mission: The Murketh and Shaadraz Gateways]
-- 10129 - [Mission: Gateways Murketh and Shaadraz] 
DELETE FROM `creature_ai_scripts` WHERE `creature_id` in (19291,19292);
UPDATE `creature_template` SET `AIName`='SmartAI',`flags_extra`=130 WHERE `entry` IN (19291,19292);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (19291,19292) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(19291,0,0,0,8,0,100,0,33655,0,0,0,33,19291,0,0,0,0,0,7,0,0,0,0,0,0,0,'Legion Transporter: Alpha - Quest Credit on Dropping The Nether Modulator Spellhit'),
(19292,0,0,0,8,0,100,0,33655,0,0,0,33,19292,0,0,0,0,0,7,0,0,0,0,0,0,0,'Legion Transporter: Beta - Quest Credit on Dropping The Nether Modulator Spellhit');
DELETE FROM `creature_addon` WHERE  `guid`=105665;
