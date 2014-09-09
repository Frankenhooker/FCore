-- Volatile Ooze and Gas Cloud Immune Mask fix
UPDATE creature_template SET mechanic_immune_mask='650854399' WHERE entry IN (37697, 38758, 38759, 38604, 37562, 38760, 38761, 38602);
-- Little and Big Ooze Immune Mask fix
UPDATE creature_template SET mechanic_immune_mask='650853375' WHERE entry IN (36899, 38123, 36897, 38138);
-- Big Oize DMG Fix
UPDATE creature_template SET dmg_multiplier='62.49' WHERE entry IN (36899, 38123);
-- Prof Hitbox
REPLACE INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES (30993, 1.207, 7.8, 2, 0);
