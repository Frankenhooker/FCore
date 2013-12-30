/*
Copyright (C) 2012 DreamCore <https://bitbucket.org/Neket007/dream-core> ???
*/

#include "OutdoorPvPCA.h"
#include "Player.h"
#include "ObjectMgr.h"
#include "OutdoorPvPMgr.h"
#include "WorldPacket.h"
#include "Language.h"
#include "World.h"
#include "ScriptPCH.h"
#include "ScriptedEscortAI.h"

const uint32 CA_LANG_LOOSE_TOWER[CA_TOWER_NUM] = 
{
	LANG_OPVP_CA_LOOSE_TOWER_A_A,
	LANG_OPVP_CA_LOOSE_TOWER_B_A,
	LANG_OPVP_CA_LOOSE_TOWER_C_A,
	LANG_OPVP_CA_LOOSE_TOWER_D_H,
	LANG_OPVP_CA_LOOSE_TOWER_E_H,
	LANG_OPVP_CA_LOOSE_TOWER_F_H
};

const uint32 CA_LANG_KILLED_N_BOSS[CA_BOSSES_NUM] = 
{
	LANG_OPVP_CA_KILLED_N_BOSS_A,
	LANG_OPVP_CA_KILLED_N_BOSS_H
};

OutdoorPvPCA::OutdoorPvPCA()
{
    m_TypeId = OUTDOOR_PVP_CA;
}

bool OutdoorPvPCA::SetupOutdoorPvP()
{
   RegisterZone(CA_OUTDOORPVP_ZONE);
	AddTowersToCA();
	AddCreepsSummonNpcToCA();
	AddNeutrallBossToCA();
	AddNeutrallCreepsToCA();
	AddCreatureTeleporter();
	AddBossesToCA();
	AddObjectBuffs();
	for (CreatureSet::iterator itr = m_creature.begin(); itr != m_creature.end(); itr++)
	{
		UpdateCreatureInfo(*itr);
	};
	return true;
}

void OutdoorPvPCA::AddTowersToCA()
{
	for (int i = 0; i < CA_TOWER_NUM; i++)
	{
		AddCreature(i,creatures[i].entry,creatures[i].teamval,creatures[i].map,creatures[i].x,creatures[i].y,creatures[i].z,creatures[i].o,1000000);
		check_towers[i] = 0;
	}
}

void OutdoorPvPCA::AddObjectBuffs()
{
	for (int i = 0; i < CA_OBJ_NUM; i++)
	{
		AddObject(i,objects[i].entry,objects[i].map,objects[i].x,objects[i].y,objects[i].z,objects[i].o,objects[i].rot0,objects[i].rot1,objects[i].rot2,objects[i].rot3);
	}
}

void OutdoorPvPCA::AddBossesToCA()
{
	for (int i = CA_TOWER_NUM; i < (CA_TOWER_NUM,CA_BOSSES_NUM); i++)
	{
		AddCreature(i,creatures[i].entry,creatures[i].teamval,creatures[i].map,creatures[i].x,creatures[i].y,creatures[i].z,creatures[i].o,1000000);
	}
}

void OutdoorPvPCA::AddCreepsSummonNpcToCA()
{
	for (int i = (CA_TOWER_NUM,CA_BOSSES_NUM); i < (CA_TOWER_NUM,CA_BOSSES_NUM,CA_SUMMON_NPC_NUM); i++)
	{
		AddCreature(i,creatures[i].entry,creatures[i].teamval,creatures[i].map,creatures[i].x,creatures[i].y,creatures[i].z,creatures[i].o,1000000);
	}
}

void OutdoorPvPCA::AddNeutrallBossToCA()
{
	for (int i = (CA_TOWER_NUM,CA_BOSSES_NUM,CA_SUMMON_NPC_NUM); i < (CA_TOWER_NUM,CA_BOSSES_NUM,CA_SUMMON_NPC_NUM,CA_NEUTRALL_BOSS_NUM); i++)
	{
		AddCreature(i,creatures[i].entry,creatures[i].teamval,creatures[i].map,creatures[i].x,creatures[i].y,creatures[i].z,creatures[i].o,1000000);
	}
}

void OutdoorPvPCA::AddNeutrallCreepsToCA()
{
	for (int i = (CA_TOWER_NUM,CA_BOSSES_NUM,CA_SUMMON_NPC_NUM,CA_NEUTRALL_BOSS_NUM); i < (CA_TOWER_NUM,CA_BOSSES_NUM,CA_SUMMON_NPC_NUM,CA_NEUTRALL_BOSS_NUM,CA_NEUTRALL_CREEP_NUM); i++)
	{
		AddCreature(i,creatures[i].entry,creatures[i].teamval,creatures[i].map,creatures[i].x,creatures[i].y,creatures[i].z,creatures[i].o,1000000);
	}
}

void OutdoorPvPCA::AddCreatureTeleporter()
{
	AddCreature(CREATURE_OTHER, 500006, 0, 37, 66.929f, 906.698f, 343.026f, 2.244f, 1000000);
	AddCreature(CREATURE_OTHER, 500006, 0, 37, 1215.098f, 249.887f, 355.152f, 5.710f, 1000000);
}

void OutdoorPvPCA::TeleportPlayersOnCA(TeamId team)
{
	for (PlayerSet::iterator itr = m_players[team].begin(); itr != m_players[team].end(); itr++)
	{
		uint64 playerGuid = *itr;
		++itr;

		if (Player* player = ObjectAccessor::FindPlayer(playerGuid))
	if (player->isDead())
		{
			player->ResurrectPlayer(100,false);
		player->TeleportTo(SPAWN[player->GetTeamId()].map,SPAWN[player->GetTeamId()].x,SPAWN[player->GetTeamId()].y,SPAWN[player->GetTeamId()].z,SPAWN[player->GetTeamId()].o,0);
	}   }
}

OutdoorPvPCACreType OutdoorPvPCA::GetCreatureType(uint32 entry) const
{
    switch(entry)
    {
		case 500100:
		case 500101:
		case 500102:
		case 500110:
		case 500111:
		case 500112:
            return CREATURE_TOWER;
       case 500109:
		case 500119:
            return CREATURE_BOSS;
		case 500107:
		case 500117:
			return CREATURE_CREEPS;
       default:
            return CREATURE_OTHER;
    }
}

void OutdoorPvPCA::OnCreatureCreate(Creature *creature)
{
    uint32 entry = creature->GetEntry();
    switch(GetCreatureType(entry))
    {
		case CREATURE_TOWER:
		case CREATURE_BOSS:
		case CREATURE_OTHER:
		case CREATURE_CREEPS:
		{
			UpdateCreatureInfo(creature);
			m_creature.insert(creature);
			break;
		}
	}
}

void OutdoorPvPCA::OnCreatureRemove(Creature *creature)
{
   uint32 entry = creature->GetEntry();
	switch(GetCreatureType(entry))
    {
		case CREATURE_TOWER:
		case CREATURE_BOSS:
		case CREATURE_OTHER:
		case CREATURE_CREEPS:
		{
			m_creature.erase(creature);
			break;
		}
	}
}

bool OutdoorPvPCA::UpdateCreatureInfo(Creature* creature)
{
    if (!creature)
        return false;
    uint32 entry = creature->GetEntry();

    switch(GetCreatureType(entry))
    {
		case CREATURE_BOSS:
       case CREATURE_TOWER:
		case CREATURE_OTHER:
		case CREATURE_CREEPS:
			if (!creature->IsAlive())
			{
				creature->Respawn(true);
				creature->SetVisible(true);
			}
           return false;
       default:
           return false;
    }
}

void OutdoorPvPCA::RespawnAllCreaturesOnCA()
{
	for (CreatureSet::iterator itr = m_creature.begin(); itr != m_creature.end(); itr++)
		if(((*itr)->GetEntry() == 500107) || ((*itr)->GetEntry() == 500117))
			(*itr)->DespawnOrUnsummon(true);
		else
			(*itr)->Respawn(true);
}

void OutdoorPvPCA::CheckNPC()
{
	for (CreatureSet::iterator itr = m_creature.begin(); itr != m_creature.end(); itr++)
	{
		if((*itr)->isDead())
		{
			for(int i = 0; i < CA_TOWER_NUM; i++)
			{
				if((*itr)->GetEntry() == CA_NPC[i].entry && check_towers[i] == 0)
				{
					check_towers[i] = 1;
					sWorld->SendZoneText(CA_OUTDOORPVP_ZONE,sObjectMgr->GetTrinityStringForDBCLocale(CA_LANG_LOOSE_TOWER[i]));
					break;
				}
			}
			if((*itr)->GetEntry() == CA_NPC[6].entry)
			{
				Rewards(TEAM_HORDE);
				RestartCA();
			}
			if((*itr)->GetEntry() == CA_NPC[7].entry)
			{
				Rewards(TEAM_ALLIANCE);
				RestartCA();
			}
		}
	}
}

void OutdoorPvPCA::RestartCA()
{
	TeleportPlayersOnCA(TEAM_HORDE);
	TeleportPlayersOnCA(TEAM_ALLIANCE);
	for (int i = 0; i < CA_TOWER_NUM; i++)
	{
		check_towers[i] = 0;
	}
	RespawnAllCreaturesOnCA();
}
void OutdoorPvPCA::HandleKill(Player* killer, Unit* killed)
{
	uint32 entry = killed->GetEntry();		
	for (int i = (CA_TOWER_NUM,CA_SUMMON_NPC_NUM,CA_BOSSES_NUM); i < (CA_NEUTRALL_BOSS_NUM,CA_TOWER_NUM,CA_SUMMON_NPC_NUM,CA_BOSSES_NUM); i++)
	{
		if (entry == CA_NPC[i].entry)
		{
			sWorld->SendZoneText(CA_OUTDOORPVP_ZONE,sObjectMgr->GetTrinityStringForDBCLocale(CA_LANG_KILLED_N_BOSS[killer->GetTeamId()]));
			killer->CastSpell(killer,SPELL_KILL_BOSS_NEUTRAL,true);
			TeamCastSpell(killer->GetTeamId(),SPELL_KILL_BOSS_NEUTRAL_ALL);
			break;
		}
	}
	for (int i = (CA_TOWER_NUM,CA_SUMMON_NPC_NUM,CA_BOSSES_NUM,CA_NEUTRALL_BOSS_NUM); i < (CA_NEUTRALL_BOSS_NUM,CA_TOWER_NUM,CA_SUMMON_NPC_NUM,CA_BOSSES_NUM,CA_NEUTRALL_CREEP_NUM); i++)
	{
		if (entry == CA_NPC[i].entry)
		{
			killer->CastSpell(killer,SPELL_KILL_CREEP_NEUTRAL,true);
			break;
		}
	}
}
void OutdoorPvPCA::UpdateTenacityStack()
{
    TeamId team = TEAM_NEUTRAL;
    uint32 allianceNum = 0;
    uint32 hordeNum = 0;
    int32 newStack = 0;

    for (PlayerSet::iterator itr = m_players[TEAM_ALLIANCE].begin(); itr != m_players[TEAM_ALLIANCE].end(); itr++)
	{
		uint64 playerGuid = *itr;
		++itr;

		if (Player* player = ObjectAccessor::FindPlayer(playerGuid))
        if (player->getLevel() > 79)
            allianceNum;
	}
    for (PlayerSet::iterator itr = m_players[TEAM_HORDE].begin(); itr != m_players[TEAM_HORDE].end(); itr++)
	{
		uint64 playerGuid = *itr;
		++itr;

		if (Player* player = ObjectAccessor::FindPlayer(playerGuid))
        if (player->getLevel() > 79)
            hordeNum;
	}
    if (allianceNum && hordeNum)
    {
        if (allianceNum < hordeNum)
            newStack = int32((float(hordeNum) / float(allianceNum) - 1)*4); // positive, should cast on alliance
        else if (allianceNum > hordeNum)
            newStack = int32((1 - float(allianceNum) / float(hordeNum))*4); // negative, should cast on horde
    }

    if (newStack == m_tenacityStack)
        return;

    if (m_tenacityStack > 0 && newStack <= 0) // old buff was on alliance
        team = TEAM_ALLIANCE;
    else if (m_tenacityStack < 0 && newStack >= 0) // old buff was on horde
        team = TEAM_HORDE;

    m_tenacityStack = newStack;

    // Remove old buff
    if (team != TEAM_NEUTRAL)
    {
        for (PlayerSet::const_iterator itr = m_players[team].begin(); itr != m_players[team].end(); itr++)
		{
			uint64 playerGuid = *itr;
			++itr;

			if (Player* player = ObjectAccessor::FindPlayer(playerGuid))
            if (player->getLevel() > 79)
                player->RemoveAurasDueToSpell(SPELL_TENACITY);

        for (CreatureSet::const_iterator itr = m_vehicles[team].begin(); itr != m_vehicles[team].end(); itr++)
            (*itr)->RemoveAurasDueToSpell(SPELL_TENACITY_VEHICLE);
    }
}
    // Apply new buff
    if (newStack)
    {
        team = newStack > 0 ? TEAM_ALLIANCE : TEAM_HORDE;
        if (newStack < 0)
            newStack = -newStack;
        if (newStack > 20)
            newStack = 20;

        for (PlayerSet::const_iterator itr = m_players[team].begin(); itr != m_players[team].end(); itr++)
		{
			uint64 playerGuid = *itr;
			++itr;

			if (Player* player = ObjectAccessor::FindPlayer(playerGuid))
            if (player->getLevel() > 79)
			{
                player->SetAuraStack(SPELL_TENACITY, player , newStack);
			}
		}
        for (CreatureSet::const_iterator itr = m_vehicles[team].begin(); itr != m_vehicles[team].end(); itr++)
            (*itr)->SetAuraStack(SPELL_TENACITY_VEHICLE, (*itr), newStack);
    }
}

void OutdoorPvPCA::HandlePlayerEnterZone(Player * plr, uint32 zone)
{
 	 const creature_type* creatures = CA_NPC;
    if (plr->GetTeam() == ALLIANCE)
    {	
		int i = 0;
		while (i < (CA_TOWER_NUM/2))
		{
			if (check_towers[i] == 0)
				plr->CastSpell(plr,Buff[i],true);
			i;
		}
    }
    else
    {
		int i = (CA_TOWER_NUM/2);
		while (i < CA_TOWER_NUM)
		{
			if (check_towers[i] == 0)
				plr->CastSpell(plr,Buff[i],true);
			i;
		}
    }

    OutdoorPvP::HandlePlayerEnterZone(plr,zone);
	 UpdateTenacityStack();
}

void OutdoorPvPCA::HandlePlayerLeaveZone(Player * plr, uint32 zone)
{
    if (plr->GetTeam() == ALLIANCE)
    {
		for (int i = 0; i < (CA_TOWER_NUM/2); i++)
			plr->RemoveAurasDueToSpell(Buff[i]);
    }
    else
    {
		for (int i = 0; i < (CA_TOWER_NUM/2); i++)
			plr->RemoveAurasDueToSpell(Buff[i]);
    }
	 plr->RemoveAurasDueToSpell(SPELL_TENACITY);
	 OutdoorPvP::HandlePlayerLeaveZone(plr, zone);
	 UpdateTenacityStack();
}

void OutdoorPvPCA::HandleKillImpl(Player *plr, Unit * killed)
{
    if (killed->GetTypeId() == TYPEID_PLAYER && plr->GetTeam() != killed->ToPlayer()->GetTeam())
		plr->AddItem(KILLREWARD,1);
}

void OutdoorPvPCA::Rewards(TeamId team)
{
	for (PlayerSet::iterator itr = m_players[team].begin(); itr != m_players[team].end(); itr++)
	{
		uint64 playerGuid = *itr;
		++itr;

		if (Player* player = ObjectAccessor::FindPlayer(playerGuid))
		player->AddItem(WINREWARD,10);
	}
}

void OutdoorPvPCA::ResurrectSystem(TeamId team)
{
	for (PlayerSet::iterator itr = m_players[team].begin(); itr != m_players[team].end(); itr++)
	{
		uint64 playerGuid = *itr;
		++itr;

		if (Player* player = ObjectAccessor::FindPlayer(playerGuid))
		if (player->isDead())
		{
			player->TeleportTo(SPAWN[player->GetTeamId()].map,SPAWN[player->GetTeamId()].x,SPAWN[player->GetTeamId()].y,SPAWN[player->GetTeamId()].z,SPAWN[player->GetTeamId()].o,0);
			player->ResurrectPlayer(100, false);
		}
	}
}

void OutdoorPvPCA::AddCre(uint32 type, uint32 guid, uint32 entry)
{
    if (!entry)
    {
        const CreatureData *data = sObjectMgr->GetCreatureData(guid);
        if (!data)
            return;
        entry = data->id;
    }
    m_Creatures[type] = MAKE_NEW_GUID(guid, entry, HIGHGUID_UNIT);
    m_CreatureTypes[m_Creatures[type]] = type;
}

bool OutdoorPvPCA::AddCreature(uint32 type, uint32 entry, uint32 team, uint32 map, float x, float y, float z, float o, uint32 spawntimedelay)
{
    if (uint32 guid = sObjectMgr->AddCreData(entry, team, map, x, y, z, o, spawntimedelay))
    {
        AddCre(type, guid, entry);
        return true;
    }

    return false;
}

bool OutdoorPvPCA::DelCreature(uint32 type)
{
    if (!m_Creatures[type])
    {
        return false;
    }

    Creature *cr = HashMapHolder<Creature>::Find(m_Creatures[type]);
    if (!cr)
    {
        // can happen when closing the core
        m_Creatures[type] = 0;
        return false;
    }
    uint32 guid = cr->GetDBTableGUIDLow();
    // Don't save respawn time
    cr->SetRespawnTime(0);
    cr->RemoveCorpse();
    PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_CREATURE_RESPAWN);
    stmt->setUInt32(0, guid);
    CharacterDatabase.Execute(stmt);

    cr->AddObjectToRemoveList();
    sObjectMgr->DeleteCreatureData(guid);
    m_CreatureTypes[m_Creatures[type]] = 0;
    m_Creatures[type] = 0;
    return true;
}

bool OutdoorPvPCA::AddObject(uint32 type, uint32 entry, uint32 map, float x, float y, float z, float o, float rotation0, float rotation1, float rotation2, float rotation3)
{
    if (uint32 guid = sObjectMgr->AddGOData(entry, map, x, y, z, o, 0, rotation0, rotation1, rotation2, rotation3))
    {
        AddGO(type, guid, entry);
        return true;
    }
    return false;
}

void OutdoorPvPCA::AddGO(uint32 type, uint32 guid, uint32 entry)
{
    if (!entry)
    {
        const GameObjectData *data = sObjectMgr->GetGOData(guid);
        if (!data)
            return;
        entry = data->id;
    }
    m_Objects[type] = MAKE_NEW_GUID(guid, entry, HIGHGUID_GAMEOBJECT);
    m_ObjectTypes[m_Objects[type]]=type;
}

bool OutdoorPvPCA::DelObject(uint32 type)
{
    if (!m_Objects[type])
        return false;

    GameObject *obj = HashMapHolder<GameObject>::Find(m_Objects[type]);
    if (!obj)
    {
        m_Objects[type] = 0;
        return false;
    }
    uint32 guid = obj->GetDBTableGUIDLow();
    obj->SetRespawnTime(0);                                 // not save respawn time
    obj->Delete();
    sObjectMgr->DeleteGOData(guid);
    m_ObjectTypes[m_Objects[type]] = 0;
    m_Objects[type] = 0;
    return true;
}

bool OutdoorPvPCA::Update(uint32 diff)
{
    bool changed = OutdoorPvP::Update(diff);
    if (!changed) 
	 {
		int i = 0;
		while (i < CA_TOWER_NUM)
		{
			if (i < (CA_TOWER_NUM/2))
				if (check_towers[i] == 0)
				{
					for (PlayerSet::iterator itr = m_players[TEAM_ALLIANCE].begin(); itr != m_players[TEAM_ALLIANCE].end(); itr++)
					{
						uint64 playerGuid = *itr;
						++itr;

						if (Player* player = ObjectAccessor::FindPlayer(playerGuid))
						if(!player->HasAura(Buff[i]))
						{
							player->CastSpell(player, Buff[i], true);
					}   }
				}
				else
				{
					for (PlayerSet::iterator itr = m_players[TEAM_ALLIANCE].begin(); itr != m_players[TEAM_ALLIANCE].end(); itr++)
					{
						uint64 playerGuid = *itr;
						++itr;

						if (Player* player = ObjectAccessor::FindPlayer(playerGuid))
						(player->RemoveAura(Buff[i]));
					}
				}
			else
				if (check_towers[i] == 0)
				{
					for (PlayerSet::iterator itr = m_players[TEAM_HORDE].begin(); itr != m_players[TEAM_HORDE].end(); itr++)
					{
						uint64 playerGuid = *itr;
						++itr;

						if (Player* player = ObjectAccessor::FindPlayer(playerGuid))
						if(!player->HasAura(Buff[i]))
						{
							player->CastSpell(player, Buff[i], true);
					}   }
				}
				else
					for (PlayerSet::iterator itr = m_players[TEAM_HORDE].begin(); itr != m_players[TEAM_HORDE].end(); itr++)
					{
						uint64 playerGuid = *itr;
						++itr;

						if (Player* player = ObjectAccessor::FindPlayer(playerGuid))
						(player->RemoveAura(Buff[i]));
			i;
		}            }
		for(int i = 0; i < (CA_TOWER_NUM/2 - 1); i)
		{
			if(check_towers[i] == 0)
			{
				for (CreatureSet::iterator itr = m_creature.begin(); itr != m_creature.end(); itr++)
				{
					if((*itr)->GetEntry() == CA_NPC[(i)].entry)
						(*itr)->SetFullHealth();
				}
			}
		}
		for(int i = (CA_TOWER_NUM/2); i < (CA_TOWER_NUM - 1); i)
		{
			if(check_towers[i] == 0)
			{
				for (CreatureSet::iterator itr = m_creature.begin(); itr != m_creature.end(); itr++)
				{
					if((*itr)->GetEntry() == CA_NPC[(i)].entry)
						(*itr)->SetFullHealth();
				}
			}
		}
		if(check_towers[2] == 0)
		{
			for (CreatureSet::iterator itr = m_creature.begin(); itr != m_creature.end(); itr++)
			{
				if((*itr)->GetEntry() == CA_NPC[6].entry)
					(*itr)->SetFullHealth();
				if((*itr)->GetEntry() == CA_NPC[8].entry)
					(*itr)->SetFullHealth();
			}
		}
		if(check_towers[5] == 0)
		{
			for (CreatureSet::iterator itr = m_creature.begin(); itr != m_creature.end(); itr++)
			{
				if((*itr)->GetEntry() == CA_NPC[7].entry)
					(*itr)->SetFullHealth();
				if((*itr)->GetEntry() == CA_NPC[9].entry)
					(*itr)->SetFullHealth();
			}
		}
		ResurrectSystem(TEAM_HORDE);
		ResurrectSystem(TEAM_ALLIANCE);
		CheckNPC();
	}
   return changed;
}

class OutdoorPvP_crater : public OutdoorPvPScript
{
    public:

        OutdoorPvP_crater ()
            : OutdoorPvPScript("outdoorpvp_ca")
        {
        }

        OutdoorPvP* GetOutdoorPvP() const
        {
            return new OutdoorPvPCA();
        }
};

class npc_control_tower : public CreatureScript
{
public:
    npc_control_tower() : CreatureScript("npc_control_tower") { }

    struct npc_control_towerAI : CasterAI
    {
        npc_control_towerAI(Creature* c) : CasterAI(c) {}

        void InitializeAI()
        {
           CasterAI::InitializeAI();
           std::list<Unit*> targets;
           Trinity::AnyUnfriendlyUnitInObjectRangeCheck u_check(me, me, 55);
           Trinity::UnitListSearcher<Trinity::AnyUnfriendlyUnitInObjectRangeCheck> searcher(me, targets, u_check);
           me->VisitNearbyObject(55, searcher);
			me->m_CombatDistance = 55;
			me->m_SightDistance = 55;
			me->ApplySpellImmune(0, IMMUNITY_ID, SPELL_DMG, true);
			me->CastSpell(me,SPELL_BUFF_TOWER,true);
           for (std::list<Unit*>::const_iterator iter = targets.begin(); iter != targets.end(); iter++)
			{
				//(*iter)->IsAlwaysDetectableFor(me);
				//(*iter)->IsAlwaysVisibleFor(me);
				me->Attack((*iter), false);
				break;
           }
        }

        void UpdateAI(uint32 diff)
        {
            CasterAI::UpdateAI(diff);
        }
    };

    CreatureAI *GetAI(Creature* creature) const
    {
        return new npc_control_towerAI(creature);
    }
};

class npc_summon_npc : public CreatureScript
{
public:
    npc_summon_npc() : CreatureScript("npc_summon_npc") { }

    struct npc_summon_npcAI : CasterAI
    {
       npc_summon_npcAI(Creature* c) : CasterAI(c) {}

		uint32 m_uiTimer;

       void InitializeAI()
       {
       	CasterAI::InitializeAI();
			me->ApplySpellImmune(0, IMMUNITY_ID, SPELL_DMG, true);
			me->setActive(true);
		}

		void Reset()
		{
			m_uiTimer = 60000;
		}

       void UpdateAI(uint32 diff)
       {
			CasterAI::UpdateAI(diff);
			if (m_uiTimer <= diff)
			{
				m_uiTimer = 60000;
				if(me->GetEntry() == 500118)
				{
						me->SummonCreature(500117, me->GetPositionX()+2.0f, me->GetPositionY()+7.0f, me->GetPositionZ(), 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 1000);
						me->SummonCreature(500117, me->GetPositionX()+6.0f, me->GetPositionY()+12.0f, me->GetPositionZ(), 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 1000);
						me->SummonCreature(500117, me->GetPositionX()-2.0f, me->GetPositionY()+2.0f, me->GetPositionZ(), 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 1000);
						me->SummonCreature(500117, me->GetPositionX()-6.0f, me->GetPositionY()-3.0f, me->GetPositionZ(), 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 1000);				
				}
				if(me->GetEntry() == 500108)
				{
						me->SummonCreature(500107, me->GetPositionX()+2.0f, me->GetPositionY(), me->GetPositionZ(), 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 1000);
						me->SummonCreature(500107, me->GetPositionX()+6.0f, me->GetPositionY(), me->GetPositionZ(), 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 1000);
						me->SummonCreature(500107, me->GetPositionX()-2.0f, me->GetPositionY(), me->GetPositionZ(), 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 1000);
						me->SummonCreature(500107, me->GetPositionX()-6.0f, me->GetPositionY(), me->GetPositionZ(), 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 1000);
				}
			}
			else
				m_uiTimer -= diff;
       }
    };

    CreatureAI *GetAI(Creature* creature) const
    {
        return new npc_summon_npcAI(creature);
    }
};

class npc_creeps : public CreatureScript
{
    public:

        npc_creeps()
            : CreatureScript("npc_creeps")
        {
        }

        struct npc_creepsAI : public npc_escortAI
        {
            npc_creepsAI(Creature* creature) : npc_escortAI(creature) { }

            void WaypointReached(uint32 uiWP)
            {
                switch (uiWP)
                {
                    case 1:
                        break;
                }
            }

            void Reset()
            {
				me->setActive(true);
				SetDespawnAtFar(false);
				npc_creepsAI* pEscortAI = CAST_AI(npc_creeps::npc_creepsAI, me->AI());
				if (pEscortAI)
					pEscortAI->Start(true,true);
            }

			void UpdateEscortAI(const uint32 diff)
			{
			}
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_creepsAI(creature);
        }
};

#define GOSSIP_ITEM_1  "Отправится на Поле битвы: Кратер Азшары"
#define SPELL_VISUAL_TELEPORT 35517

class npc_tp_ca : public CreatureScript
{
public:
    npc_tp_ca() : CreatureScript("npc_tp_ca") { }

	void Teleport(Player* const player, const uint16 &map, const float &X, const float &Y, const float &Z, const float &orient)
    {
        player->CastSpell(player, SPELL_VISUAL_TELEPORT, true);
        player->TeleportTo(map, X, Y, Z, orient);
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        player->ADD_GOSSIP_ITEM(0, GOSSIP_ITEM_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        player->SEND_GOSSIP_MENU(3961,creature->GetGUID());
        return true;
    }

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action)
    {
		switch (action)
		{
		case GOSSIP_ACTION_INFO_DEF+1:
			if (player->getLevel() < 80)
			{
				creature->MonsterTextEmote("Для Отправления вы должны быть 80-ого уровня!", player->GetGUID(), true);
			    player->CLOSE_GOSSIP_MENU();
			    return false;
		    }
			
			if (player->GetHonorPoints() < 300)
			{
				creature->MonsterTextEmote("Для Отправления вам потребуется 300 Очков Чести!", player->GetGUID(), true);
			    player->CLOSE_GOSSIP_MENU();
			    return false;
			}
			
			if (player->GetTeamId() == TEAM_ALLIANCE)
			{
				Teleport(player, 37,1245.12f,248.638f,355.214f,3.1f);
				player->ModifyHonorPoints(-300);
			}
			else 
			{
				Teleport(player, 37,39.38f,916.849f,339.394f,5.93f);
				player->ModifyHonorPoints(-300);
			}
			break;
		}
		return true;
	}
};


#define GOSSIP_ITEM_2  "Окончить бой и отправиться в столицу"

class npc_tp_capital : public CreatureScript
{
public:
    npc_tp_capital() : CreatureScript("npc_tp_capital") { }

	void Teleport(Player* const player, const uint16 &map, const float &X, const float &Y, const float &Z, const float &orient)
    {
        player->CastSpell(player, SPELL_VISUAL_TELEPORT, true);
        player->TeleportTo(map, X, Y, Z, orient);
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, GOSSIP_ITEM_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        player->SEND_GOSSIP_MENU(3962,creature->GetGUID());
        return true;
    }

	bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action)
    {
		switch (action)
		{
		case GOSSIP_ACTION_INFO_DEF+1:
			if (player->GetTeamId() == TEAM_ALLIANCE)
				Teleport(player, 0, -8830.62f, 622.80f, 93.85f, 3.9f);
			else
				Teleport(player, 1, 1629.35f, -4373.42f, 31.26f, 3.5f);
			break;
		}
		return true;
	}
};

void AddSC_outdoorpvp_ca()
{
   new OutdoorPvP_crater();
	new npc_control_tower;
	new npc_summon_npc;
	new npc_creeps;
	new npc_tp_ca;
	new npc_tp_capital;
}