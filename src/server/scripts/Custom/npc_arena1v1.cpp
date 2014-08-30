#include "ScriptMgr.h"
#include "ArenaTeamMgr.h"
#include "Common.h"
#include "DisableMgr.h"
#include "BattlegroundMgr.h"
#include "Battleground.h"
#include "ArenaTeam.h"
#include "Language.h"
#include "npc_arena1v1.h"


class npc_1v1arena : public CreatureScript
{
public:
    npc_1v1arena() : CreatureScript("npc_1v1arena") {}

	bool JoinQueueArena(Player* player, Creature* me, bool isRated)
	{
		if(!player || !me)
			return false;

		uint32 forbidden_entry = 0;// Spieler, die heilspezifische Spells im Talentbaum geskillt haben, werden geblockt
		const char* message;

		//Priest - Disci
		if(player->HasSpell(47540))
		{
			forbidden_entry = 47540;
			message = "Keine Heiler in der 1vs1 Arena zugelassen !";
		}
		if(player->HasSpell(57470))

		{
			forbidden_entry = 57470;
			message = "Keine Heiler in der 1vs1 Arena zugelassen !";
		}
		//Priest - Holy
		if(player->HasSpell(47562))
		{
			forbidden_entry = 47562;
			message = "Keine Heiler in der 1vs1 Arena zugelassen !";
		}
		if(player->HasSpell(33158))
		{
			forbidden_entry = 33158;
			message = "Keine Heiler in der 1vs1 Arena zugelassen !";
		}
		//Pala - Holy
		if(player->HasSpell(20473))
		{
			forbidden_entry = 20473;
			message = "Keine Heiler in der 1vs1 Arena zugelassen !";
		}
		if(player->HasSpell(31841))
		{
			forbidden_entry = 31841;
			message = "Keine Heiler in der 1vs1 Arena zugelassen !";
		}
		//Druida - Resto
		if(player->HasSpell(48438))
		{
			forbidden_entry = 48438;
			message = "Keine Heiler in der 1vs1 Arena zugelassen !";
		}
		if(player->HasSpell(65139))
		{
			forbidden_entry = 65139;
			message = "Keine Heiler in der 1vs1 Arena zugelassen !";
		}
		if(player->HasSpell(18562))
		{
			forbidden_entry = 18562;
			message = "Keine Heiler in der 1vs1 Arena zugelassen !";
		}
		//Shaman - Resto
		if(player->HasSpell(61295))
		{
			forbidden_entry = 61295;
			message = "Keine Heiler in der 1vs1 Arena zugelassen !";
		}
		if(player->HasSpell(974))
		{
			forbidden_entry = 974;
			message = "Keine Heiler in der 1vs1 Arena zugelassen !";
		}
		if(player->HasSpell(51556))
		{
			forbidden_entry = 51556;
			message = "Keine Heiler in der 1vs1 Arena zugelassen !";
		}

		if(player->HasSpell(forbidden_entry))
		{
			ChatHandler(player->GetSession()).SendSysMessage(message);
			player->CLOSE_GOSSIP_MENU();
			return false;
		}


		uint64 guid = player->GetGUID();
		uint8 arenaslot = ArenaTeam::GetSlotByType(ARENA_TEAM_5v5);
		uint8 arenatype = ARENA_TYPE_5v5;
		uint32 arenaRating = 0;
		uint32 matchmakerRating = 0;

		// ignore if we already in BG or BG queue
		if (player->InBattleground())
			return false;

		//check existance
		Battleground* bg = sBattlegroundMgr->GetBattlegroundTemplate(BATTLEGROUND_AA);
		if (!bg)
		{
			//TC_LOG_ERROR(LOG_FILTER_NETWORKIO, "Battleground: template bg (all arenas) not found");
			return false;
		}

		if (DisableMgr::IsDisabledFor(DISABLE_TYPE_BATTLEGROUND, BATTLEGROUND_AA, NULL))
		{
			ChatHandler(player->GetSession()).PSendSysMessage(LANG_ARENA_DISABLED);
			return false;
		}

		BattlegroundTypeId bgTypeId = bg->GetTypeID();
		BattlegroundQueueTypeId bgQueueTypeId = BattlegroundMgr::BGQueueTypeId(bgTypeId, arenatype);
		PvPDifficultyEntry const* bracketEntry = GetBattlegroundBracketByLevel(bg->GetMapId(), player->getLevel());
		if (!bracketEntry)
			return false;

		GroupJoinBattlegroundResult err = ERR_GROUP_JOIN_BATTLEGROUND_FAIL;

		// check if already in queue
        if (player->GetBattlegroundQueueIndex(bgQueueTypeId) < PLAYER_MAX_BATTLEGROUND_QUEUES)
            //player is already in this queue
            return false;
        // check if has free queue slots
        if (!player->HasFreeBattlegroundQueueId())
            return false;

		uint32 ateamId = 0;

		if(isRated)
		{
			ateamId = player->GetArenaTeamId(arenaslot);
			ArenaTeam* at = sArenaTeamMgr->GetArenaTeamById(ateamId);
			if (!at)
			{
				player->GetSession()->SendNotInArenaTeamPacket(arenatype);
				return false;
			}

			// get the team rating for queueing
			arenaRating = at->GetRating();
			matchmakerRating = arenaRating;
			// the arenateam id must match for everyone in the group

			if (arenaRating <= 0)
				arenaRating = 1;
		}

		BattlegroundQueue &bgQueue = sBattlegroundMgr->GetBattlegroundQueue(bgQueueTypeId);
		bg->SetRated(isRated);

		GroupQueueInfo* ginfo = bgQueue.AddGroup(player, NULL, bgTypeId, bracketEntry, arenatype, isRated, false, arenaRating, matchmakerRating, ateamId);
        uint32 avgTime = bgQueue.GetAverageQueueWaitTime(ginfo, bracketEntry->GetBracketId());
        uint32 queueSlot = player->AddBattlegroundQueueId(bgQueueTypeId);

        WorldPacket data;
        // send status packet (in queue)
        sBattlegroundMgr->BuildBattlegroundStatusPacket(&data, bg, queueSlot, STATUS_WAIT_QUEUE, avgTime, 0, arenatype, 0);
		player->GetSession()->SendPacket(&data);

		sBattlegroundMgr->ScheduleQueueUpdate(matchmakerRating, arenatype, bgQueueTypeId, bgTypeId, bracketEntry->GetBracketId());

		return true;
	}


	bool CreateArenateam(Player* player, Creature* me)
	{
		if(!player || !me)
			return false;

		uint8 slot = ArenaTeam::GetSlotByType(ARENA_TEAM_5v5);
		if (slot >= MAX_ARENA_SLOT)
			return false;

		// Check if player is already in an arena team
		if (player->GetArenaTeamId(slot))
		{
			player->GetSession()->SendArenaTeamCommandResult(ERR_ARENA_TEAM_CREATE_S, player->GetName(), "", ERR_ALREADY_IN_ARENA_TEAM);
			return false;
		}


		// Teamname = playername
		// if teamname exist, we have to choose another name (playername + number)
		int i = 1;
		std::stringstream teamName;
		teamName << player->GetName();
		do
		{
			if(sArenaTeamMgr->GetArenaTeamByName(teamName.str()) != NULL) // teamname exist, so choose another name
			{
				teamName.str(std::string());
				teamName << player->GetName() << i;
			}
			else
				break;
		} while (i < 100); // should never happen

		// Create arena team
		ArenaTeam* arenaTeam = new ArenaTeam();

		if (!arenaTeam->Create(player->GetGUID(), ARENA_TEAM_5v5, teamName.str(), 4283124816, 45, 4294242303, 5, 4294705149))
		{
			delete arenaTeam;
			return false;
		}

		// Register arena team
		sArenaTeamMgr->AddArenaTeam(arenaTeam);
		arenaTeam->AddMember(player->GetGUID());

		ChatHandler(player->GetSession()).SendSysMessage("Arenateam erstellt!");

		return true;
	}


	bool OnGossipHello(Player* player, Creature* me)
	{
		if(!player || !me)
			return true;

		if(player->GetArenaTeamId(ArenaTeam::GetSlotByType(ARENA_TEAM_5v5)) == NULL)
			player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_CHAT, "|TInterface\\icons\\achievement_featsofstrength_gladiator_01:35|t|r Erstelle neues 1vs1 Arenateam", GOSSIP_SENDER_MAIN, 1, "Neues 1vs1 Arenateam erstellen ?", 50, false);
		else
		{
			if(player->InBattlegroundQueueForBattlegroundQueueType(BATTLEGROUND_QUEUE_5v5) == false)
			{
				player->ADD_GOSSIP_ITEM(9, "|TInterface\\icons\\achievement_arena_2v2_7:35|t|r 1vs1 Warteschlange beitreten", GOSSIP_SENDER_MAIN, 2);
			}

			player->ADD_GOSSIP_ITEM(5, "|TInterface\\icons\\inv_misc_note_05:35|t|r Zeige meine 1vs1 Statistiken", GOSSIP_SENDER_MAIN, 4);
		}

		player->SEND_GOSSIP_MENU(68, me->GetGUID());
		return true;
	}



	bool OnGossipSelect(Player* player, Creature* me, uint32 /*uiSender*/, uint32 uiAction)
	{
		if(!player || !me)
			return true;

		player->PlayerTalkClass->ClearMenus();

		switch (uiAction)
        {
		case 1: // Create new Arenateam
			{
				if(80 <= player->getLevel()) // Level 80 required
				{
					if(player->GetMoney() >= 50 && CreateArenateam(player, me))
						player->ModifyMoney(50 * -1);
				}
				else
				{
					ChatHandler(player->GetSession()).PSendSysMessage("Dein Level ist zu niedrig !");
					player->CLOSE_GOSSIP_MENU();
					return true;
				}
			}
			break;

		case 2: // Join Queue Arena (rated)
			{
				if(Arena1v1CheckTalents(player) && JoinQueueArena(player, me, true) == false)
					ChatHandler(player->GetSession()).SendSysMessage("Join Queue Arena (rated)");
				
				player->CLOSE_GOSSIP_MENU();
				return true;
			}
			break;

		case 20: // Join Queue Arena (unrated)
			{
				if(Arena1v1CheckTalents(player) && JoinQueueArena(player, me, false) == false)
					ChatHandler(player->GetSession()).SendSysMessage("Join Queue Arena (unrated)");
				
				player->CLOSE_GOSSIP_MENU();
				return true;
			}
			break;

		case 3: // Leave Queue
			{
				WorldPacket Data;
				Data << (uint8)0x1 << (uint8)0x0 << (uint32)BATTLEGROUND_AA << (uint16)0x0 << (uint8)0x0;
				player->GetSession()->HandleBattleFieldPortOpcode(Data);
				player->CLOSE_GOSSIP_MENU();
				return true;
			}
			break;

		case 4: // get statistics
			{
				ArenaTeam* at = sArenaTeamMgr->GetArenaTeamById(player->GetArenaTeamId(ArenaTeam::GetSlotByType(ARENA_TEAM_5v5)));
				if(at)
				{
					std::stringstream s;
					s << "Rating: " << at->GetStats().Rating;
					s << "\nRank: " << at->GetStats().Rank;
					s << "\nSeason Games: " << at->GetStats().SeasonGames;
					s << "\nSeason Wins: " << at->GetStats().SeasonWins;

					ChatHandler(player->GetSession()).PSendSysMessage(s.str().c_str());
				}
			}
			break;


		case 5: // Disband arenateam
			{
				WorldPacket Data;
				Data << (uint32)player->GetArenaTeamId(ArenaTeam::GetSlotByType(ARENA_TEAM_5v5));
				player->GetSession()->HandleArenaTeamLeaveOpcode(Data);
				ChatHandler(player->GetSession()).SendSysMessage("Disband Arenateam/Arenateam auflösen");
				player->CLOSE_GOSSIP_MENU();
				return true;
			}
			break;
		}

		OnGossipHello(player, me);
		return true;
	}
};


void AddSC_npc_1v1arena()
{
    new npc_1v1arena();
}