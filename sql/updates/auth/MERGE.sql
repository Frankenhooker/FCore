ALTER TABLE `account` ADD COLUMN `token_key` varchar(100) NOT NULL DEFAULT '' AFTER `s`;
-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN 200 AND 216;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(200, 'Command: .rbac'),
(201, 'Command: .rbac account'),
(202, 'Command: .rbac account group'),
(203, 'Command: .rbac account group add'),
(204, 'Command: .rbac account group remove'),
(205, 'Command: .rbac account role'),
(206, 'Command: .rbac account role grant'),
(207, 'Command: .rbac account role deny'),
(208, 'Command: .rbac account role revoke'),
(209, 'Command: .rbac account permission'),
(210, 'Command: .rbac account permission grant'),
(211, 'Command: .rbac account permission deny'),
(212, 'Command: .rbac account permission revoke'),
(213, 'Command: .rbac list'),
(214, 'Command: .rbac list groups'),
(215, 'Command: .rbac list roles'),
(216, 'Command: .rbac list permissions');

-- Add Permissions to "Administrator Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `roleId` = 4 AND `permissionId` BETWEEN 200 AND 216;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, 200),
(4, 201),
(4, 202),
(4, 203),
(4, 204),
(4, 205),
(4, 206),
(4, 207),
(4, 208),
(4, 209),
(4, 210),
(4, 211),
(4, 212),
(4, 213),
(4, 214),
(4, 215),
(4, 216);
-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN 217 AND 229;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(217, 'Command: .account'),
(218, 'Command: .account addon'),
(219, 'Command: .account create'),
(220, 'Command: .account delete'),
(221, 'Command: .account lock'),
(222, 'Command: .account lock country'),
(223, 'Command: .account lock ip'),
(224, 'Command: .account onlinelist'),
(225, 'Command: .account password'),
(226, 'Command: .account set'),
(227, 'Command: .account set addon'),
(228, 'Command: .account set gmlevel'),
(229, 'Command: .account set password');

-- Add Permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN 217 AND 229;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(1, 217),
(2, 218),
(1, 221),
(1, 222),
(1, 223),
(1, 225),
(4, 226),
(4, 227);
-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN 230 AND 238;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(230, 'achievement'),
(231, 'achievement add'),
(232, 'arena'),
(233, 'arena captain'),
(234, 'arena create'),
(235, 'arena disband'),
(236, 'arena info'),
(237, 'arena lookup'),
(238, 'arena rename');

-- Add Permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN 230 AND 238;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, 230),
(4, 231),
(3, 232),
(4, 233),
(4, 234),
(4, 235),
(3, 236),
(3, 237),
(4, 238);
-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN 239 AND 256;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(239, 'ban'),
(240, 'ban account'),
(241, 'ban character'),
(242, 'ban ip'),
(243, 'ban playeraccount'),
(244, 'baninfo'),
(245, 'baninfo account'),
(246, 'baninfo character'),
(247, 'baninfo ip'),
(248, 'banlist'),
(249, 'banlist account'),
(250, 'banlist character'),
(251, 'banlist ip'),
(252, 'unban'),
(253, 'unban account'),
(254, 'unban character'),
(255, 'unban ip'),
(256, 'unban playeraccount');

-- Add Permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN 239 AND 256;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, 239),
(4, 240),
(4, 241),
(4, 242),
(4, 243),
(4, 244),
(4, 245),
(4, 246),
(4, 247),
(4, 248),
(4, 249),
(4, 250),
(4, 251),
(4, 252),
(4, 253),
(4, 254),
(4, 255),
(4, 256);
/* cs_bf.cpp */

SET @id = 257;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+5;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'bf'),
(@id+1, 'bf start'),
(@id+2, 'bf stop'),
(@id+3, 'bf switch'),
(@id+4, 'bf timer'),
(@id+5, 'bf enabled');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+5;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(4, @id+2),
(4, @id+3),
(4, @id+4),
(4, @id+5);

/* account email */
SET @amail = 263;

-- Add new permissions for account mail
DELETE FROM `rbac_permissions` WHERE `id` = @amail;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@amail, 'account email');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` = @amail;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(1, @amail),
(2, @amail),
(3, @amail),
(4, @amail);


/* account set sec email
   account set sec regmail */
SET @setsec = 264;

-- Add new permissions for account set sec
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @setsec AND @setsec+2;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@setsec+0, 'account set sec'),
(@setsec+1, 'account set sec email'),
(@setsec+2, 'account set sec regmail');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @setsec AND @setsec+2;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @setsec+0),
(4, @setsec+1),
(4, @setsec+2);
ALTER TABLE `account`
	ADD COLUMN `reg_mail` VARCHAR(255) NOT NULL DEFAULT '' AFTER `s`;

UPDATE `account` SET reg_mail = email;

DELETE FROM `rbac_permissions` WHERE `id` = 49;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES (49, 'Forces to enter the email for confirmation on password change');

DELETE FROM `rbac_roles` WHERE `id` = 40;
INSERT INTO `rbac_roles` (`id`, `name`) VALUES (40, 'Forces to enter the email for confirmation on password change');

DELETE FROM `rbac_role_permissions` WHERE `roleId` = 40 AND `permissionId` = 49;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES (40, 49);

DELETE FROM `rbac_group_roles` WHERE `groupId` = 1 AND `roleId` = 40;
INSERT INTO `rbac_group_roles` (`groupId`, `roleId`) VALUES (1, 40);

DELETE FROM `rbac_group_roles` WHERE `groupId` = 2 AND `roleId` = 40;
INSERT INTO `rbac_group_roles` (`groupId`, `roleId`) VALUES (2, 40);

DELETE FROM `rbac_group_roles` WHERE `groupId` = 3 AND `roleId` = 40;
INSERT INTO `rbac_group_roles` (`groupId`, `roleId`) VALUES (3, 40);

DELETE FROM `rbac_group_roles` WHERE `groupId` = 4 AND `roleId` = 40;
INSERT INTO `rbac_group_roles` (`groupId`, `roleId`) VALUES (4, 40);

DELETE FROM `rbac_permissions` WHERE `id` = 50;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES (50, 'Allow user to check his own email with .account');

DELETE FROM `rbac_roles` WHERE `id` = 41;
INSERT INTO `rbac_roles` (`id`, `name`) VALUES (41, 'Allow user to check his own email with .account');

DELETE FROM `rbac_role_permissions` WHERE `roleId` = 41 AND `permissionId` = 50;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES (41, 50);

/* cs_cheat.cpp */

SET @id = 291;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+8;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'cheat'),
(@id+1, 'cheat casttime'),
(@id+2, 'cheat cooldown'),
(@id+3, 'cheat explore'),
(@id+4, 'cheat god'),
(@id+5, 'cheat power'),
(@id+6, 'cheat status'),
(@id+7, 'cheat taxi'),
(@id+8, 'cheat waterwalk');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+8;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(4, @id+2),
(4, @id+3),
(4, @id+4),
(4, @id+5),
(4, @id+6),
(4, @id+7),
(4, @id+8);
/* cs_debug.cpp */

SET @id = 300;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+40;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'debug'),
(@id+1, 'debug anim'),
(@id+2, 'debug areatriggers'),
(@id+3, 'debug arena'),
(@id+4, 'debug bg'),
(@id+5, 'debug entervehicle'),
(@id+6, 'debug getitemstate'),
(@id+7, 'debug getitemvalue'),
(@id+8, 'debug getvalue'),
(@id+9, 'debug hostil'),
(@id+10, 'debug itemexpire'),
(@id+11, 'debug lootrecipient'),
(@id+12, 'debug los'),
(@id+13, 'debug mod32value'),
(@id+14, 'debug moveflags'),
(@id+15, 'debug play'),
(@id+16, 'debug play cinematics'),
(@id+17, 'debug play movie'),
(@id+18, 'debug play sound'),
(@id+19, 'debug send'),
(@id+20, 'debug send buyerror'),
(@id+21, 'debug send channelnotify'),
(@id+22, 'debug send chatmessage'),
(@id+23, 'debug send equiperror'),
(@id+24, 'debug send largepacket'),
(@id+25, 'debug send opcode'),
(@id+26, 'debug send qinvalidmsg'),
(@id+27, 'debug send qpartymsg'),
(@id+28, 'debug send sellerror'),
(@id+29, 'debug send setphaseshift'),
(@id+30, 'debug send spellfail'),
(@id+31, 'debug setaurastate'),
(@id+32, 'debug setbit'),
(@id+33, 'debug setitemvalue'),
(@id+34, 'debug setvalue'),
(@id+35, 'debug setvid'),
(@id+36, 'debug spawnvehicle'),
(@id+37, 'debug threat'),
(@id+38, 'debug update'),
(@id+39, 'debug uws'),
(@id+40, 'wpgps');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+40;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(2, @id+0),
(3, @id+1),
(4, @id+2),
(4, @id+3),
(4, @id+4),
(4, @id+5),
(4, @id+6),
(4, @id+7),
(4, @id+8),
(4, @id+9),
(4, @id+10),
(3, @id+11),
(2, @id+12),
(4, @id+13),
(4, @id+14),
(2, @id+15),
(2, @id+16),
(2, @id+17),
(2, @id+18),
(4, @id+19),
(4, @id+20),
(4, @id+21),
(4, @id+22),
(4, @id+23),
(4, @id+24),
(4, @id+25),
(4, @id+26),
(4, @id+27),
(4, @id+28),
(4, @id+29),
(4, @id+30),
(4, @id+31),
(4, @id+32),
(4, @id+33),
(4, @id+34),
(4, @id+35),
(4, @id+36),
(4, @id+37),
(4, @id+38),
(4, @id+39),
(4, @id+40);
/* cs_deserter.cpp */

SET @id = 341;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+6;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'deserter'),
(@id+1, 'deserter bg'),
(@id+2, 'deserter bg add'),
(@id+3, 'deserter bg remove'),
(@id+4, 'deserter instance'),
(@id+5, 'deserter instance add'),
(@id+6, 'deserter instance remove');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+6;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(4, @id+2),
(4, @id+3),
(4, @id+4),
(4, @id+5),
(4, @id+6);
/* cs_disable.cpp */

SET @id = 348;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+18;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'disable'),
(@id+1, 'disable add'),
(@id+2, 'disable add achievement_criteria'),
(@id+3, 'disable add battleground'),
(@id+4, 'disable add map'),
(@id+5, 'disable add mmap'),
(@id+6, 'disable add outdoorpvp'),
(@id+7, 'disable add quest'),
(@id+8, 'disable add spell'),
(@id+9, 'disable add vmap'),
(@id+10, 'disable remove'),
(@id+11, 'disable remove achievement_criteria'),
(@id+12, 'disable remove battleground'),
(@id+13, 'disable remove map'),
(@id+14, 'disable remove mmap'),
(@id+15, 'disable remove outdoorpvp'),
(@id+16, 'disable remove quest'),
(@id+17, 'disable remove spell'),
(@id+18, 'disable remove vmap');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+18;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(4, @id+2),
(4, @id+3),
(4, @id+4),
(4, @id+5),
(4, @id+6),
(4, @id+7),
(4, @id+8),
(4, @id+9),
(4, @id+10),
(4, @id+11),
(4, @id+12),
(4, @id+13),
(4, @id+14),
(4, @id+15),
(4, @id+16),
(4, @id+17),
(4, @id+18);
/* cs_event.cpp */

SET @id = 367;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+3;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'event'),
(@id+1, 'event activelist'),
(@id+2, 'event start'),
(@id+3, 'event stop');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+3;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(2, @id+0),
(2, @id+1),
(2, @id+2),
(2, @id+3);
/* cs_gm.cpp */

SET @id = 371;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+5;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'gm'),
(@id+1, 'gm chat'),
(@id+2, 'gm fly'),
(@id+3, 'gm ingame'),
(@id+4, 'gm list'),
(@id+5, 'gm visible');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+5;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(2, @id+0),
(2, @id+1),
(4, @id+2),
(2, @id+3),
(4, @id+4),
(2, @id+5);
/* cs_go.cpp */

SET @id = 377;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+9;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'go'),
(@id+1, 'go creature'),
(@id+2, 'go graveyard'),
(@id+3, 'go grid'),
(@id+4, 'go object'),
(@id+5, 'go taxinode'),
(@id+6, 'go ticket'),
(@id+7, 'go trigger'),
(@id+8, 'go xyz'),
(@id+9, 'go zonexy');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+9;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(2, @id+0),
(2, @id+1),
(2, @id+2),
(2, @id+3),
(2, @id+4),
(2, @id+5),
(2, @id+6),
(2, @id+7),
(2, @id+8),
(2, @id+9);
/* cs_gobject.cpp */

SET @id = 387;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+12;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'gobject'),
(@id+1, 'gobject activate'),
(@id+2, 'gobject add'),
(@id+3, 'gobject add temp'),
(@id+4, 'gobject delete'),
(@id+5, 'gobject info'),
(@id+6, 'gobject move'),
(@id+7, 'gobject near'),
(@id+8, 'gobject set'),
(@id+9, 'gobject set phase'),
(@id+10, 'gobject set state'),
(@id+11, 'gobject target'),
(@id+12, 'gobject turn');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+12;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(3, @id+0),
(3, @id+1),
(3, @id+2),
(3, @id+3),
(3, @id+4),
(3, @id+5),
(3, @id+6),
(3, @id+7),
(3, @id+8),
(3, @id+9),
(3, @id+10),
(3, @id+11),
(3, @id+12);
/* cs_guild.cpp */

SET @id = 401;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+6;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'guild'),
(@id+1, 'guild create'),
(@id+2, 'guild delete'),
(@id+3, 'guild invite'),
(@id+4, 'guild uninvite'),
(@id+5, 'guild rank'),
(@id+6, 'guild rename');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+6;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(4, @id+2),
(4, @id+3),
(4, @id+4),
(4, @id+5),
(4, @id+6);
/* cs_honor.cpp */

SET @id = 408;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+3;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'honor'),
(@id+1, 'honor add'),
(@id+2, 'honor add kill'),
(@id+3, 'honor update');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+3;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(2, @id+0),
(2, @id+1),
(2, @id+2),
(2, @id+3);
/* cs_instance.cpp */

SET @id = 412;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+4;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'instance'),
(@id+1, 'instance listbinds'),
(@id+2, 'instance unbind'),
(@id+3, 'instance stats'),
(@id+4, 'instance savedata');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+4;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(2, @id+0),
(2, @id+1),
(2, @id+2),
(2, @id+3),
(2, @id+4);
/* cs_learn.cpp */

SET @id = 417;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+12;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'learn'),
(@id+1, 'learn all'),
(@id+2, 'learn all my'),
(@id+3, 'learn all my class'),
(@id+4, 'learn all my pettalents'),
(@id+5, 'learn all my spells'),
(@id+6, 'learn all my talents'),
(@id+7, 'learn all gm'),
(@id+8, 'learn all crafts'),
(@id+9, 'learn all default'),
(@id+10, 'learn all lang'),
(@id+11, 'learn all recipes'),
(@id+12, 'unlearn');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+12;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(4, @id+2),
(4, @id+3),
(4, @id+4),
(4, @id+5),
(4, @id+6),
(4, @id+7),
(4, @id+8),
(4, @id+9),
(4, @id+10),
(4, @id+11),
(4, @id+12);
/* cs_lfg.cpp */

SET @id = 430;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+5;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'lfg'),
(@id+1, 'lfg player'),
(@id+2, 'lfg group'),
(@id+3, 'lfg queue'),
(@id+4, 'lfg clean'),
(@id+5, 'lfg options');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+5;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(2, @id+0),
(2, @id+1),
(2, @id+2),
(2, @id+3),
(4, @id+4),
(4, @id+5);
/* cs_list.cpp */

SET @id = 436;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+5;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'list'),
(@id+1, 'list creature'),
(@id+2, 'list item'),
(@id+3, 'list object'),
(@id+4, 'list auras'),
(@id+5, 'list mail');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+5;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(4, @id+2),
(4, @id+3),
(4, @id+4),
(4, @id+5);
/* cs_lookup.cpp */

SET @id = 442;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+19;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'lookup'),
(@id+1, 'lookup area'),
(@id+2, 'lookup creature'),
(@id+3, 'lookup event'),
(@id+4, 'lookup faction'),
(@id+5, 'lookup item'),
(@id+6, 'lookup itemset'),
(@id+7, 'lookup object'),
(@id+8, 'lookup quest'),
(@id+9, 'lookup player'),
(@id+10, 'lookup player ip'),
(@id+11, 'lookup player account'),
(@id+12, 'lookup player email'),
(@id+13, 'lookup skill'),
(@id+14, 'lookup spell'),
(@id+15, 'lookup spell id'),
(@id+16, 'lookup taxinode'),
(@id+17, 'lookup tele'),
(@id+18, 'lookup title'),
(@id+19, 'lookup map');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+19;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(4, @id+2),
(4, @id+3),
(4, @id+4),
(4, @id+5),
(4, @id+6),
(4, @id+7),
(4, @id+8),
(4, @id+9),
(4, @id+10),
(4, @id+11),
(4, @id+12),
(4, @id+13),
(4, @id+14),
(4, @id+15),
(4, @id+16),
(4, @id+17),
(4, @id+19);
/* cs_message.cpp */

SET @id = 462;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+9;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'announce'),
(@id+1, 'channel'),
(@id+2, 'channel set'),
(@id+3, 'channel set ownership'),
(@id+4, 'gmannounce'),
(@id+5, 'gmnameannounce'),
(@id+6, 'gmnotify'),
(@id+7, 'nameannounce'),
(@id+8, 'notify'),
(@id+9, 'whispers');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+9;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(2, @id+0),
(4, @id+1),
(4, @id+2),
(4, @id+3),
(2, @id+4),
(2, @id+5),
(2, @id+6),
(2, @id+7),
(2, @id+8),
(2, @id+9);
/* cs_cast.cpp */

SET @id = 263;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+5;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'cast'),
(@id+1, 'cast back'),
(@id+2, 'cast dist'),
(@id+3, 'cast self'),
(@id+4, 'cast target'),
(@id+5, 'cast dest');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+5;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(4, @id+2),
(4, @id+3),
(4, @id+4),
(4, @id+5);
/* cs_character.cpp */

SET @id = 273;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+17;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0 , 'character'),
(@id+1 , 'character customize'),
(@id+2 , 'character changefaction'),
(@id+3 , 'character changerace'),
(@id+4 , 'character deleted'),
-- (@id+5 , 'character deleted delete'),
(@id+6 , 'character deleted list'),
(@id+7 , 'character deleted restore'),
-- (@id+8 , 'character deleted old'),
-- (@id+9 , 'character erase'),
(@id+10, 'character level'),
(@id+11, 'character rename'),
(@id+12, 'character reputation'),
(@id+13, 'character titles'),
(@id+14, 'levelup'),
(@id+15, 'pdump'),
(@id+16, 'pdump load'),
(@id+17, 'pdump write');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+17;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(3, @id+0 ),
(3, @id+1 ),
(3, @id+2 ),
(3, @id+3 ),
(3, @id+4 ),
-- (c, @id+5 ),
(4, @id+6 ),
(4, @id+7 ),
-- (c, @id+8 ),
-- (c, @id+9 ),
(4, @id+10),
(3, @id+11),
(3, @id+12),
(3, @id+13),
(4, @id+14),
(4, @id+15),
(4, @id+16),
(4, @id+17);
/* cs_group.cpp */

SET @id = 472;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+6;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0 , 'group'),
(@id+1 , 'group leader'),
(@id+2 , 'group disband'),
(@id+3 , 'group remove'),
(@id+4 , 'group join'),
(@id+5 , 'group list'),
(@id+6 , 'group summon');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+6;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(4, @id+2),
(4, @id+3),
(4, @id+4),
(4, @id+5),
(4, @id+6);
/* cs_pet.cpp */

SET @id = 479;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+3;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0 , 'pet'),
(@id+1 , 'pet create'),
(@id+2 , 'pet learn'),
(@id+3 , 'pet unlearn');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+3;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(3, @id+0),
(3, @id+1),
(3, @id+2),
(3, @id+3);
/* cs_send.cpp */

SET @id = 483;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+4;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0 , 'send'),
(@id+1 , 'send items'),
(@id+2 , 'send mail'),
(@id+3 , 'send message'),
(@id+4 , 'send money');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+4;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(2, @id+0),
(2, @id+1),
(3, @id+2),
(3, @id+3),
(3, @id+4);
/* cs_misc.cpp */

SET @id = 488;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+47;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'additem'),
(@id+1, 'additemset'),
(@id+2, 'appear'),
(@id+3, 'aura'),
(@id+4, 'bank'),
(@id+5, 'bindsight'),
(@id+6, 'combatstop'),
(@id+7, 'cometome'),
(@id+8, 'commands'),
(@id+9, 'cooldown'),
(@id+10, 'damage'),
(@id+11, 'dev'),
(@id+12, 'die'),
(@id+13, 'dismount'),
(@id+14, 'distance'),
(@id+15, 'flusharenapoints'),
(@id+16, 'freeze'),
(@id+17, 'gps'),
(@id+18, 'guid'),
(@id+19, 'help'),
(@id+20, 'hidearea'),
(@id+21, 'itemmove'),
(@id+22, 'kick'),
(@id+23, 'linkgrave'),
(@id+24, 'listfreeze'),
(@id+25, 'maxskill'),
(@id+26, 'movegens'),
(@id+27, 'mute'),
(@id+28, 'neargrave'),
(@id+29, 'pinfo'),
(@id+30, 'playall'),
(@id+31, 'possess'),
(@id+32, 'recall'),
(@id+33, 'repairitems'),
(@id+34, 'respawn'),
(@id+35, 'revive'),
(@id+36, 'saveall'),
(@id+37, 'save'),
(@id+38, 'setskill'),
(@id+39, 'showarea'),
(@id+40, 'summon'),
(@id+41, 'unaura'),
(@id+42, 'unbindsight'),
(@id+43, 'unfreeze'),
(@id+44, 'unmute'),
(@id+45, 'unpossess'),
(@id+46, 'unstuck'),
(@id+47, 'wchange');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+47;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(2, @id+2),
(4, @id+3),
(4, @id+4),
(4, @id+5),
(3, @id+6),
(4, @id+7),
(1, @id+8),
(4, @id+9),
(4, @id+10),
(4, @id+11),
(4, @id+12),
(1, @id+13),
(4, @id+14),
(4, @id+15),
(2, @id+16),
(4, @id+17),
(3, @id+18),
(1, @id+19),
(4, @id+20),
(3, @id+21),
(3, @id+22),
(4, @id+23),
(2, @id+24),
(4, @id+25),
(4, @id+26),
(2, @id+27),
(4, @id+28),
(3, @id+29),
(3, @id+30),
(4, @id+31),
(2, @id+32),
(3, @id+33),
(4, @id+34),
(4, @id+35),
(2, @id+36),
(1, @id+37),
(4, @id+38),
(4, @id+39),
(2, @id+40),
(4, @id+41),
(4, @id+42),
(2, @id+43),
(2, @id+44),
(4, @id+45),
(1, @id+46),
(4, @id+47);
/* cs_mmaps.cpp */

SET @id = 536;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+5;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'mmap'),
(@id+1, 'mmap loadedtiles'),
(@id+2, 'mmap loc'),
(@id+3, 'mmap path'),
(@id+4, 'mmap stats'),
(@id+5, 'mmap testarea');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+5;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(4, @id+2),
(4, @id+3),
(4, @id+4),
(4, @id+5);
/* cs_modify.cpp */

SET @id = 542;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+27;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'morph'),
(@id+1, 'demorph'),
(@id+2, 'modify'),
(@id+3, 'modify arenapoints'),
(@id+4, 'modify bit'),
(@id+5, 'modify drunk'),
(@id+6, 'modify energy'),
(@id+7, 'modify faction'),
(@id+8, 'modify gender'),
(@id+9, 'modify honor'),
(@id+10, 'modify hp'),
(@id+11, 'modify mana'),
(@id+12, 'modify money'),
(@id+13, 'modify mount'),
(@id+14, 'modify phase'),
(@id+15, 'modify rage'),
(@id+16, 'modify reputation'),
(@id+17, 'modify runicpower'),
(@id+18, 'modify scale'),
(@id+19, 'modify speed'),
(@id+20, 'modify speed all'),
(@id+21, 'modify speed backwalk'),
(@id+22, 'modify speed fly'),
(@id+23, 'modify speed walk'),
(@id+24, 'modify speed swim'),
(@id+25, 'modify spell'),
(@id+26, 'modify standstate'),
(@id+27, 'modify talentpoints');


-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+27;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(3, @id+0),
(3, @id+1),
(2, @id+2),
(2, @id+3),
(2, @id+4),
(2, @id+5),
(2, @id+6),
(2, @id+7),
(3, @id+8),
(2, @id+9),
(2, @id+10),
(2, @id+11),
(2, @id+12),
(2, @id+13),
(4, @id+14),
(2, @id+15),
(3, @id+16),
(2, @id+17),
(2, @id+18),
(2, @id+19),
(2, @id+20),
(2, @id+21),
(2, @id+22),
(2, @id+23),
(2, @id+24),
(2, @id+25),
(3, @id+26),
(2, @id+27);
/* cs_npc.cpp */

SET @id = 570;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+31;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'npc'),
(@id+1, 'npc add'),
(@id+2, 'npc add formation'),
(@id+3, 'npc add item'),
(@id+4, 'npc add move'),
(@id+5, 'npc add temp'),
(@id+6, 'npc add delete'),
(@id+7, 'npc add delete item'),
(@id+8, 'npc add follow'),
(@id+9, 'npc add follow stop'),
(@id+10, 'npc set'),
(@id+11, 'npc set allowmove'),
(@id+12, 'npc set entry'),
(@id+13, 'npc set factionid'),
(@id+14, 'npc set flag'),
(@id+15, 'npc set level'),
(@id+16, 'npc set link'),
(@id+17, 'npc set model'),
(@id+18, 'npc set movetype'),
(@id+19, 'npc set phase'),
(@id+20, 'npc set spawndist'),
(@id+21, 'npc set spawntime'),
(@id+22, 'npc set data'),
(@id+23, 'npc info'),
(@id+24, 'npc near'),
(@id+25, 'npc move'),
(@id+26, 'npc playemote'),
(@id+27, 'npc say'),
(@id+28, 'npc textemote'),
(@id+29, 'npc whisper'),
(@id+30, 'npc yell'),
(@id+31, 'npc tame');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+31;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(2, @id+0),
(3, @id+1),
(3, @id+2),
(3, @id+3),
(3, @id+4),
(3, @id+5),
(3, @id+6),
(3, @id+7),
(3, @id+8),
(3, @id+9),
(3, @id+10),
(4, @id+11),
(4, @id+12),
(3, @id+13),
(3, @id+14),
(3, @id+15),
(3, @id+16),
(3, @id+17),
(3, @id+18),
(3, @id+19),
(3, @id+20),
(3, @id+21),
(4, @id+22),
(4, @id+23),
(3, @id+24),
(3, @id+25),
(4, @id+26),
(2, @id+27),
(2, @id+28),
(2, @id+29),
(2, @id+30),
(3, @id+31);
/* cs_quest.cpp */

SET @id = 602;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+4;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'quest'),
(@id+1, 'quest add'),
(@id+2, 'quest complete'),
(@id+3, 'quest remove'),
(@id+4, 'quest reward');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+4;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(4, @id+2),
(4, @id+3),
(4, @id+4);
/* cs_reload.cpp */

SET @id = 607;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+102;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'reload'),
(@id+1, 'reload access_requirement'),
(@id+2, 'reload achievement_criteria_data'),
(@id+3, 'reload achievement_reward'),
(@id+4, 'reload all'),
(@id+5, 'reload all achievement'),
(@id+6, 'reload all area'),
(@id+7, 'reload all eventai'),
(@id+8, 'reload all gossips'),
(@id+9, 'reload all item'),
(@id+10, 'reload all locales'),
(@id+11, 'reload all loot'),
(@id+12, 'reload all npc'),
(@id+13, 'reload all quest'),
(@id+14, 'reload all scripts'),
(@id+15, 'reload all spell'),
(@id+16, 'reload areatrigger_involvedrelation'),
(@id+17, 'reload areatrigger_tavern'),
(@id+18, 'reload areatrigger_teleport'),
(@id+19, 'reload auctions'),
(@id+20, 'reload autobroadcast'),
(@id+21, 'reload command'),
(@id+22, 'reload conditions'),
(@id+23, 'reload config'),
(@id+24, 'reload creature_text'),
(@id+25, 'reload creature_ai_scripts'),
(@id+26, 'reload creature_ai_texts'),
(@id+27, 'reload creature_questender'),
(@id+28, 'reload creature_linked_respawn'),
(@id+29, 'reload creature_loot_template'),
(@id+30, 'reload creature_onkill_reputation'),
(@id+31, 'reload creature_queststarter'),
(@id+32, 'reload creature_summon_groups'),
(@id+33, 'reload creature_template'),
(@id+34, 'reload disables'),
(@id+35, 'reload disenchant_loot_template'),
(@id+36, 'reload event_scripts'),
(@id+37, 'reload fishing_loot_template'),
(@id+38, 'reload game_graveyard_zone'),
(@id+39, 'reload game_tele'),
(@id+40, 'reload gameobject_questender'),
(@id+41, 'reload gameobject_loot_template'),
(@id+42, 'reload gameobject_queststarter'),
(@id+43, 'reload gm_tickets'),
(@id+44, 'reload gossip_menu'),
(@id+45, 'reload gossip_menu_option'),
(@id+46, 'reload item_enchantment_template'),
(@id+47, 'reload item_loot_template'),
(@id+48, 'reload item_set_names'),
(@id+49, 'reload lfg_dungeon_rewards'),
(@id+50, 'reload locales_achievement_reward'),
(@id+51, 'reload locales_creature'),
(@id+52, 'reload locales_creature_text'),
(@id+53, 'reload locales_gameobject'),
(@id+54, 'reload locales_gossip_menu_option'),
(@id+55, 'reload locales_item'),
(@id+56, 'reload locales_item_set_name'),
(@id+57, 'reload locales_npc_text'),
(@id+58, 'reload locales_page_text'),
(@id+59, 'reload locales_points_of_interest'),
(@id+60, 'reload locales_quest'),
(@id+61, 'reload mail_level_reward'),
(@id+62, 'reload mail_loot_template'),
(@id+63, 'reload milling_loot_template'),
(@id+64, 'reload npc_spellclick_spells'),
(@id+65, 'reload npc_trainer'),
(@id+66, 'reload npc_vendor'),
(@id+67, 'reload page_text'),
(@id+68, 'reload pickpocketing_loot_template'),
(@id+69, 'reload points_of_interest'),
(@id+70, 'reload prospecting_loot_template'),
(@id+71, 'reload quest_poi'),
(@id+72, 'reload quest_template'),
(@id+73, 'reload rbac'),
(@id+74, 'reload reference_loot_template'),
(@id+75, 'reload reserved_name'),
(@id+76, 'reload reputation_reward_rate'),
(@id+77, 'reload reputation_spillover_template'),
(@id+78, 'reload skill_discovery_template'),
(@id+79, 'reload skill_extra_item_template'),
(@id+80, 'reload skill_fishing_base_level'),
(@id+81, 'reload skinning_loot_template'),
(@id+82, 'reload smart_scripts'),
(@id+83, 'reload spell_required'),
(@id+84, 'reload spell_area'),
(@id+85, 'reload spell_bonus_data'),
(@id+86, 'reload spell_group'),
(@id+87, 'reload spell_learn_spell'),
(@id+88, 'reload spell_loot_template'),
(@id+89, 'reload spell_linked_spell'),
(@id+90, 'reload spell_pet_auras'),
(@id+91, 'reload spell_proc_event'),
(@id+92, 'reload spell_proc'),
(@id+93, 'reload spell_scripts'),
(@id+94, 'reload spell_target_position'),
(@id+95, 'reload spell_threats'),
(@id+96, 'reload spell_group_stack_rules'),
(@id+97, 'reload trinity_string'),
(@id+98, 'reload warden_action'),
(@id+99, 'reload waypoint_scripts'),
(@id+100, 'reload waypoint_data'),
(@id+101, 'reload vehicle_accessory'),
(@id+102, 'reload vehicle_template_accessory');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+102;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(4, @id+2),
(4, @id+3),
(4, @id+4),
(4, @id+5),
(4, @id+6),
(4, @id+7),
(4, @id+8),
(4, @id+9),
(4, @id+10),
(4, @id+11),
(4, @id+12),
(4, @id+13),
(4, @id+14),
(4, @id+15),
(4, @id+16),
(4, @id+17),
(4, @id+18),
(4, @id+19),
(4, @id+20),
(4, @id+21),
(4, @id+22),
(4, @id+23),
(4, @id+24),
(4, @id+25),
(4, @id+26),
(4, @id+27),
(4, @id+28),
(4, @id+29),
(4, @id+30),
(4, @id+31),
(4, @id+32),
(4, @id+33),
(4, @id+34),
(4, @id+35),
(4, @id+36),
(4, @id+37),
(4, @id+38),
(4, @id+39),
(4, @id+40),
(4, @id+41),
(4, @id+42),
(4, @id+43),
(4, @id+44),
(4, @id+45),
(4, @id+46),
(4, @id+47),
(4, @id+48),
(4, @id+49),
(4, @id+50),
(4, @id+51),
(4, @id+52),
(4, @id+53),
(4, @id+54),
(4, @id+55),
(4, @id+56),
(4, @id+57),
(4, @id+58),
(4, @id+59),
(4, @id+60),
(4, @id+61),
(4, @id+62),
(4, @id+63),
(4, @id+64),
(4, @id+65),
(4, @id+66),
(4, @id+67),
(4, @id+68),
(4, @id+69),
(4, @id+70),
(4, @id+71),
(4, @id+72),
(4, @id+73),
(4, @id+74),
(4, @id+75),
(4, @id+76),
(4, @id+77),
(4, @id+78),
(4, @id+79),
(4, @id+80),
(4, @id+81),
(4, @id+82),
(4, @id+83),
(4, @id+84),
(4, @id+85),
(4, @id+86),
(4, @id+87),
(4, @id+88),
(4, @id+89),
(4, @id+90),
(4, @id+91),
(4, @id+92),
(4, @id+93),
(4, @id+94),
(4, @id+95),
(4, @id+96),
(4, @id+97),
(4, @id+98),
(4, @id+99),
(4, @id+100),
(4, @id+101),
(4, @id+102);
/* cs_reset.cpp */

SET @id = 710;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+7;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'reset'),
(@id+1, 'reset achievements'),
(@id+2, 'reset honor'),
(@id+3, 'reset level'),
(@id+4, 'reset spells'),
(@id+5, 'reset stats'),
(@id+6, 'reset talents'),
(@id+7, 'reset all');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+7;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(4, @id+2),
(4, @id+3),
(4, @id+4),
(4, @id+5),
(4, @id+6),
(4, @id+7);
/* cs_server.cpp */

SET @id = 718;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+18;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'server'),
(@id+1, 'server corpses'),
(@id+2, 'server exit'),
(@id+3, 'server idlerestart'),
(@id+4, 'server idlerestart cancel'),
(@id+5, 'server idleshutdown'),
(@id+6, 'server idleshutdown cancel'),
(@id+7, 'server info'),
(@id+8, 'server plimit'),
(@id+9, 'server restart'),
(@id+10, 'server restart cancel'),
(@id+11, 'server set'),
(@id+12, 'server set closed'),
(@id+13, 'server set difftime'),
(@id+14, 'server set loglevel'),
(@id+15, 'server set motd'),
(@id+16, 'server shutdown'),
(@id+17, 'server shutdown cancel'),
(@id+18, 'server motd');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+18;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(4, @id+3),
(4, @id+4),
(4, @id+5),
(4, @id+6),
(4, @id+7),
(4, @id+8),
(4, @id+9),
(4, @id+10),
(4, @id+11),
(4, @id+12),
(4, @id+15),
(4, @id+16),
(4, @id+17),
(4, @id+18);
/* cs_tele.cpp */

SET @id = 737;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+4;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'tele'),
(@id+1, 'tele add'),
(@id+2, 'tele del'),
(@id+3, 'tele name'),
(@id+4, 'tele group');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+4;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(2, @id+0),
(4, @id+1),
(4, @id+2),
(2, @id+3),
(2, @id+4);
/* cs_ticket.cpp */

SET @id = 742;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+18;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'ticket'),
(@id+1, 'ticket assign'),
(@id+2, 'ticket close'),
(@id+3, 'ticket closedlist'),
(@id+4, 'ticket comment'),
(@id+5, 'ticket complete'),
(@id+6, 'ticket delete'),
(@id+7, 'ticket escalate'),
(@id+8, 'ticket escalatedlist'),
(@id+9, 'ticket list'),
(@id+10, 'ticket onlinelist'),
(@id+11, 'ticket reset'),
(@id+12, 'ticket response'),
(@id+13, 'ticket response append'),
(@id+14, 'ticket response appendln'),
(@id+15, 'ticket togglesystem'),
(@id+16, 'ticket unassign'),
(@id+17, 'ticket viewid'),
(@id+18, 'ticket viewname');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+18;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(2, @id+0),
(3, @id+1),
(2, @id+2),
(2, @id+3),
(2, @id+4),
(2, @id+5),
(4, @id+6),
(2, @id+7),
(3, @id+8),
(2, @id+9),
(2, @id+10),
(4, @id+11),
(2, @id+12),
(2, @id+13),
(2, @id+14),
(4, @id+15),
(3, @id+16),
(2, @id+17),
(2, @id+18);
/* cs_titles.cpp & cs_wp.cpp */

SET @id = 761;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+13;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'titles'),
(@id+1, 'titles add'),
(@id+2, 'titles current'),
(@id+3, 'titles remove'),
(@id+4, 'titles set'),
(@id+5, 'titles set mask'),
(@id+6, 'wp'),
(@id+7, 'wp add'),
(@id+8, 'wp event'),
(@id+9, 'wp load'),
(@id+10, 'wp modify'),
(@id+11, 'wp unload'),
(@id+12, 'wp reload'),
(@id+13, 'wp show');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+13;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(3, @id+0),
(3, @id+1),
(3, @id+2),
(3, @id+3),
(3, @id+4),
(3, @id+5),
(3, @id+6),
(3, @id+7),
(3, @id+8),
(3, @id+9),
(3, @id+10),
(3, @id+11),
(4, @id+12),
(3, @id+13);
-- Remove obsolete permissions

DELETE FROM `rbac_role_permissions` WHERE `permissionId` IN (7, 8, 9, 10, 12);
DELETE FROM `rbac_permissions` WHERE `id` IN (7, 8, 9, 10, 12);
/* account email */
SET @amail = 263;

-- Add new permissions for account mail
DELETE FROM `rbac_permissions` WHERE `id` = @amail;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@amail, 'account email');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` = @amail;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(1, @amail),
(2, @amail),
(3, @amail),
(4, @amail);


/* account set sec email
   account set sec regmail */
SET @setsec = 264;

-- Add new permissions for account set sec
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @setsec AND @setsec+2;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@setsec+0, 'account set sec'),
(@setsec+1, 'account set sec email'),
(@setsec+2, 'account set sec regmail');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @setsec AND @setsec+2;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @setsec+0),
(4, @setsec+1),
(4, @setsec+2);

/* cs_cast.cpp */

SET @id = 267;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+5;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'cast'),
(@id+1, 'cast back'),
(@id+2, 'cast dist'),
(@id+3, 'cast self'),
(@id+4, 'cast target'),
(@id+5, 'cast dest');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+5;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(4, @id+0),
(4, @id+1),
(4, @id+2),
(4, @id+3),
(4, @id+4),
(4, @id+5);

/* cs_go.cpp */

SET @id = 377;

-- Add new permissions
DELETE FROM `rbac_permissions` WHERE `id` BETWEEN @id AND @id+9;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(@id+0, 'go'),
(@id+1, 'go creature'),
(@id+2, 'go graveyard'),
(@id+3, 'go grid'),
(@id+4, 'go object'),
(@id+5, 'go taxinode'),
(@id+6, 'go ticket'),
(@id+7, 'go trigger'),
(@id+8, 'go xyz'),
(@id+9, 'go zonexy');

-- Add permissions to "corresponding Commands Role"
DELETE FROM `rbac_role_permissions` WHERE `permissionId` BETWEEN @id AND @id+9;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
(2, @id+0),
(2, @id+1),
(2, @id+2),
(2, @id+3),
(2, @id+4),
(2, @id+5),
(2, @id+6),
(2, @id+7),
(2, @id+8),
(2, @id+9);

UPDATE `rbac_permissions` SET `name`='bf enable' WHERE `id`=262;
