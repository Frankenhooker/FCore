/*
Copyright (C) 2012 DreamCore <https://bitbucket.org/Neket007/dream-core> ???
*/

#ifndef OUTDOOR_PVP_CA_
#define OUTDOOR_PVP_CA_

#include "OutdoorPvP.h"
#include "DBCStructure.h"

const uint32 CA_OUTDOORPVP_ZONE =  268;

enum OutdoorPvPCAMisc
{
	CA_TOWER_NUM = 6,
	CA_SUMMON_NPC_NUM = 2,
	CA_BOSSES_NUM = 2,
	CA_NEUTRALL_BOSS_NUM = 1,
	CA_NEUTRALL_CREEP_NUM = 8,
    CA_CREATURE_TELEPORT = 2,
	CA_OBJ_NUM = 5
};

enum OutdoorPvPCACreType
{
	CREATURE_TOWER,
	CREATURE_BOSS,
	CREATURE_CREEPS,
	CREATURE_OTHER
};

const creature_type CA_NPC[19] =
{
	{500100,469,37,385.971f,123.039f,247.01f,2.27449f},		//towers Alliance
	{500101,469,37,884.624f,53.9453f,300.495f,3.10701f},
	{500102,469,37,1007.17f,299.301f,329.513f,5.29827f},
	{500110,67,37,217.999f,285.239f,265.702f,4.83881f},		//towers Horde
	{500111,67,37,40.6596f,594.728f,270.034f,2.91223f},
	{500112,67,37,111.332f,989.631f,296.663f,0.37932f},
	{500109,469,37,1094.846f,297.789f,338.614f,3.253f},		//boss Alliance
	{500119,67,37,43.672f,1172.592f,367.344f,5.265f},		//boss Horde
	{500108,469,37,1020.697f,268.367f,331.41f,2.1f},		//npc summon Alliance
	{500118,67,37,131.839f,1034.631f,297.041f,4.964f},		//npc summon Horde
	{500120,0,37,-24.903f,-32.703f,267.315f,0.263f},		//neutral_bosses
	{500121,0,37,208.666f,34.061f,236.902f,2.882f},			//neutral_creeps
	{500121,0,37,181.969f,-0.469f,237.440f,2.073f},
	{500121,0,37,113.592f,154.821f,238.062f,4.457f},
	{500121,0,37,157.889f,161.115f,239.206f,5.152f},
	{500121,0,37,313.909f,525.031f,286.610f,1.67f},
	{500121,0,37,331.830f,528.019f,288.615f,2.92f},
	{500121,0,37,736.405f,345.555f,279.597f,6.15f},
	{500121,0,37,739.333f,334.857f,276.275f,0.64f}
};

const go_type CA_OBJ[CA_OBJ_NUM] =
{
	{179905,37,24.1198f,454.163f,325.424f,0,0,0,0,0},
	{179905,37,662.314f,107.142f,298.563f,0,0,0,0,0},
	{179871,37,850.858f,338.06f,269.57f,0,0,0,0,0},
	{179904,37,152.334f,68.736f,230.783f,0,0,0,0,0},
	{179871,37,282.153f,772.27f,263.774f,0,0,0,0,0}
};

const creature_type* creatures = CA_NPC;
const go_type* objects = CA_OBJ;

const uint32 Buff[6] =
{
	41630,//1
	71188,//2
	71193,//3
	41630,//1
	71188,//2
	71193,//3 maybe 71195
};

struct teleporter_type
{
    uint32 map;
    float x;
    float y;
    float z;
    float o;
};

const teleporter_type SPAWN[2] = 
{
	//alliance
	{37,1245.12f,248.638f,355.214f,3.1f},
	//horde
	{37,39.38f,916.849f,339.394f,5.93f}
};

enum OutdoorPvPCASpells
{
   KILLREWARD = 49426,
	WINREWARD = 37829,
	SPELL_TENACITY = 58549,
	SPELL_TENACITY_VEHICLE = 59911,
	SPELL_KILL_BOSS_NEUTRAL = 41924,
	SPELL_KILL_CREEP_NEUTRAL = 57060,
	SPELL_KILL_BOSS_NEUTRAL_ALL = 71463,
	SPELL_DMG = 47253, //47253 59742
	SPELL_BUFF_TOWER = 68652
};

class OutdoorPvPCA;

class OutdoorPvPCA : public OutdoorPvP
{
    public:

		OutdoorPvPCA();
       bool SetupOutdoorPvP();
		bool Update(uint32 diff);
       void HandlePlayerEnterZone(Player * plr, uint32 zone);
       void HandlePlayerLeaveZone(Player * plr, uint32 zone);
		void HandleKillImpl(Player * plr, Unit * killed);
		void HandleKill(Player* killer, Unit* killed);
		void Rewards(TeamId team);
		void CheckNPC();
		void OnCreatureCreate(Creature *creature);
		void OnCreatureRemove(Creature *creature);

	protected:

		void RestartCA();
		void UpdateTenacityStack();
		void ResurrectSystem(TeamId team);
		void TeleportPlayersOnCA(TeamId team);
		void RespawnAllCreaturesOnCA();

		void AddTowersToCA();
		void AddBossesToCA();
		void AddCreepsSummonNpcToCA();
		void AddNeutrallBossToCA();
		void AddNeutrallCreepsToCA();
		void AddCreatureTeleporter();
		void AddCreatureTeleport();
		void AddObjectBuffs();

		OutdoorPvPCACreType GetCreatureType(uint32 entry) const;
		void AddCre(uint32 type, uint32 guid, uint32 entry);
		bool AddCreature(uint32 type, uint32 entry, uint32 team, uint32 map, float x, float y, float z, float o, uint32 spawntimedelay);
		bool DelCreature(uint32 type);
		void AddGO(uint32 type, uint32 guid, uint32 entry);
		bool AddObject(uint32 type, uint32 entry, uint32 map, float x, float y, float z, float o, float rotation0, float rotation1, float rotation2, float rotation3);
		bool DelObject(uint32 type);
		bool UpdateCreatureInfo(Creature *creature);

		typedef std::set<Creature*> CreatureSet;
		CreatureSet m_creature;
		CreatureSet m_vehicles[2];

    private:

		int32 m_tenacityStack;	
		uint32 check_towers[CA_TOWER_NUM];
       std::map<uint32, uint64> m_Objects;
       std::map<uint32, uint64> m_Creatures;
       std::map<uint64, uint32> m_ObjectTypes;
       std::map<uint64, uint32> m_CreatureTypes;
};

#endif

