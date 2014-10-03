-- Fix: Sindragosa kann nicht fliegen, da das Inhabit-System Buggy ist. Fixt auch den Bug, das die Eisgräber nur an bestimmten Positionen Spawnen..
UPDATE creature_template SET InhabitType=4 WHERE entry=38267;
UPDATE creature_template SET InhabitType=4 WHERE entry=38266;
UPDATE creature_template SET InhabitType=4 WHERE entry=38265;
UPDATE creature_template SET InhabitType=4 WHERE entry=36853;