-- Fix: Professors Schleime visieren beide ein Ziel an.
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (72838, -82833, 1, 'PP Prevent dp');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (82833, -72838, 1, 'PP Prevent dp');