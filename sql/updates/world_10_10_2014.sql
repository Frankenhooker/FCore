-- fixing "grip" (32) immunity mask for Sindragosa Trash (Raufang ist in der Flugphase wieder auf den Boden grabbar, z.b. mit Todesgriff):
-- Wirbelpirscher
UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`|32 WHERE `entry`= 37534;
-- Raufang
UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`|32 WHERE `entry`= 37533;
-- Bonespikes at Marrowgar -> removed hard coded part at Deathgrip spell handler
UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`|32 WHERE `entry`= 36619;