#include "ScriptPCH.h"

class npc_info : public CreatureScript
{
	public:
		npc_info() : CreatureScript("npc_info")
		{
		}

		bool OnGossipHello(Player * pPlayer, Creature * pCreature)
		{
			pPlayer->ADD_GOSSIP_ITEM(4, "Was erhalte ich als neuer Spieler?", GOSSIP_SENDER_MAIN, 0);
			pPlayer->ADD_GOSSIP_ITEM(4, "Welche Raten habe ich hier?", GOSSIP_SENDER_MAIN, 1);
			pPlayer->ADD_GOSSIP_ITEM(4, "Was sind die Besonderheiten des Servers?", GOSSIP_SENDER_MAIN, 2);
			pPlayer->ADD_GOSSIP_ITEM(0, "Tschüss", GOSSIP_SENDER_MAIN, 3);
			pPlayer->PlayerTalkClass->SendGossipMenu(9425, pCreature->GetGUID());
			return true;
		}

		bool OnGossipSelect(Player * Player, Creature * Creature, uint32 /*uiSender*/, uint32 uiAction)
		{
			if(!Player)
				return true;
			
			switch(uiAction)
			{
				case 0: // Was erhalte ich als neuer Spieler?
					{
						ChatHandler(Player->GetSession()).PSendSysMessage("Bis zum 31.12.2013 erhält jeder neue Spieler einen Charakter auf Level 80, ein komplettes T7 Set, Waffen bis Itemlevel 200 sowie 4000 Gold. Dafür einfach ein Ticket eröffnen oder im Teamspeak melden! ", Player->GetName());
						Player->PlayerTalkClass->SendCloseGossip();
					}break;
				case 1: // Welche Raten habe ich hier?
					{

						ChatHandler(Player->GetSession()).PSendSysMessage("Du hast folgende Raten: x20 XP, x10 Gold, x20 Ruf und x15 für Berufe ", Player->GetName());
						Player->PlayerTalkClass->SendCloseGossip();
					}break;
				case 2: // Was sind die Besonderheiten des Servers?
					{
						ChatHandler(Player->GetSession()).PSendSysMessage("Der Server bietet dir eine einzigartige Community, ein immer hilfsbereites Team und ein aktives Entwicklungs Team das immer an neue Server Funktion und an der Server Stabilität arbeitet! ", Player->GetName());
						Player->PlayerTalkClass->SendCloseGossip();
					}break;
				case 3:
					{
						Player->PlayerTalkClass->SendCloseGossip();
					}break;
			}
			return true;
		}

};

void AddSC_npc_info()
{
	new npc_info();
}