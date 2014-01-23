UPDATE gameobject_loot_template SET mincountOrRef=mincountOrRef*2 WHERE item IN (25664, 25665, 25662, 25673);
UPDATE locales_item SET description_loc3 = NULL WHERE entry IN (41288, 41310, 43102, 41599, 44710, 47658, 47659, 47660, 50467, 50468, 50461);
UPDATE locales_item SET description_loc3 = "Unf?hig, die Wahrheit zu schreiben" WHERE entry = 50357;
DELETE FROM `gameobject` WHERE `id`=179697;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(12029, 179697, 0, 1, 1, -13204.4, 276.63, 21.857, 4,12372, 0, 0, 0.881833, -0.471562, 0, 1);
UPDATE skinning_loot_template SET maxcount = 3 WHERE item = 33568 AND maxcount = 1;
DELETE FROM creature_loot_template WHERE entry = 18331 AND item IN (50788, 50792, 50796);
UPDATE `creature_template` SET `faction_A` = 40, `faction_H` = 40 WHERE `entry` = 10161;
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 10161;
UPDATE `creature_template` SET `unit_flags` = 537165888 WHERE `entry` = 26737;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 65, `mincountOrRef` = 1, `maxcount` = 3 WHERE `entry` = 70206 AND `item` = 38561;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 85, `mincountOrRef` = 1, `maxcount` = 3 WHERE `entry` = 70207 AND `item` = 38561;
UPDATE creature_template SET mechanic_immune_mask = 617291740 WHERE entry IN (23953, 30748);
UPDATE creature_template SET mechanic_immune_mask = 617561983 WHERE entry IN (26723, 30540, 26796, 30398, 26731, 30510, 26763, 30529, 26794, 30532, 27654, 31558, 27447, 31559, 27655, 31560, 27656, 31561);
UPDATE creature_template SET mechanic_immune_mask = 604708828 WHERE entry IN (24201, 31656, 24200, 31679, 27978, 31386, 27977, 31381);
UPDATE creature_template SET mechanic_immune_mask = 617299803 WHERE entry IN (29307, 31365, 29305, 30530, 29306, 31368, 29304, 31370);
UPDATE creature_template SET mechanic_immune_mask = 638263263 WHERE entry IN (23954, 31673, 23954, 31673, 26687, 30774, 26693, 30807, 30258, 31463, 28923, 31538, 26632, 31360);
UPDATE creature_template SET mechanic_immune_mask = 638263293 WHERE entry IN (26861, 30788, 28684, 31612, 28921, 31611, 29120, 31610, 29309, 31456, 29308, 31469, 29310, 31465, 29311, 31464);
UPDATE creature_template SET mechanic_immune_mask = 646651903 WHERE entry IN (27975, 31384, 28586, 31533, 28587, 31536, 28546, 31537, 26630, 31362, 26631, 31350, 27483, 31349, 27422);
UPDATE creature_template SET mechanic_immune_mask = 650854271 WHERE entry IN (36627, 38390, 38549, 38550);
UPDATE creature_template SET mechanic_immune_mask = 650854271 WHERE entry IN (36626, 37504, 37505, 37506);
UPDATE creature_template SET mechanic_immune_mask = 33554688 WHERE entry IN (37562, 38602, 38760, 38761);
UPDATE creature_template SET mechanic_immune_mask = 33554688 WHERE entry IN (37697, 38604, 38758, 38759);
UPDATE `quest_template` SET `SourceItemId` = 0 WHERE `Id` = 4743; --Sourceitem vorher: 12339
DELETE FROM `creature_loot_template` WHERE (`entry`=10321) AND (`item`=12324);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (10321, 12324, -100, 1, 0, 1, 1);
DELETE FROM `creature_template` WHERE (`entry`=36254);
insert into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) values
('36254','0','0','0','0','0','1010','0','0','0','Boshafter Furbolg',NULL,NULL,'0','7','8','0','82','82','0','0.666668','0.85714','1','0','10','14','0','38','1','2000','0','1','32768','2048','8','0','0','0','0','0','7','10','100','7','0','17183','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','6','13','','1','3','1','1','1','1','0','23801','0','0','0','0','0','100','1','0','0','','12340');
UPDATE creature SET id = 36254 WHERE guid = 4226154;
DELETE FROM `gameobject_queststarter` WHERE `quest` = 9600;
DELETE FROM `gameobject_questender` WHERE `quest` = 9600;
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 9600;
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 17509;
DELETE FROM `creature_questender` WHERE `quest` = 9600;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (17509, 9600);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=17509;
UPDATE `quest_template` SET `ZoneOrSort` = '-141', `SourceItemId` = 0, `SourceItemCount` = 0, `SpecialFlags` = 0, `RequiredNpcOrGo1` = 36254, `RequiredNpcOrGoCount1` = 1, `ObjectiveText1` = '' WHERE `Id` = 9600;
