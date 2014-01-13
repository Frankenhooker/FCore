-- Erhöhung Fischrate in Schwärmen (x2)/ Increase of Fishing rate
-- Einige Beschreibungsfixxes von Items / locales overwork
-- Kiste im Schlingendorntal Fix / fix for the box in northern stranglethorn
-- Borenanisches Leder Fix (x2) / increase of borean leather drop
-- Managruft Entfernung ICC - Gunshiploot / Removing failed gunship loot
-- Welpen für Erfolg Leeeroy sind nun anreifbar (2 Fixxes) / fixing Leeroy achievement
UPDATE gameobject_loot_template SET mincountOrRef=mincountOrRef*2 WHERE item IN (25664, 25665, 25662, 25673);
UPDATE item_locales SET descripton_loc3 = NULL WHERE entry IN (41288, 41310, 43102, 41599, 44710, 47658, 47659, 47660, 50467, 50468, 50461);
UPDATE item_locales SET descripton_loc3 = "Unfähig, die Wahrheit zu schreiben" WHERE entry = 50357;
DELETE FROM `gameobject` WHERE `id`=179697;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(12029, 179697, 0, 1, 1, -13204,4, 276,63, 21,857, 4,12372, 0, 0, 0,881833, -0,471562, 8000, 0, 1);
UPDATE skinning_loot_template SET mincountOrRef=mincountOrRef*2 WHERE item = 33568;
DELETE FROM creature_loot_template WHERE entry = 18331 AND item IN (50788, 50792, 50796);
UPDATE `creature_template` SET `faction_A` = 40, `faction_H` = 40 WHERE `entry` = 10161;
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 10161;