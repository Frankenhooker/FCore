#ifndef SC_ACMGR_H
#define SC_ACMGR_H

#include <ace/Singleton.h>
#include "Common.h"
#include "SharedDefines.h"
#include "ScriptPCH.h"
#include "AnticheatData.h"
#include "Chat.h"
#include "Config.h"

class Player;
class AnticheatData;

enum hackTypes
{
	SPEED_HACK,
	FLY_HACK,
	WALKWATER_HACK,
	WALLCLIMB_HACK,
	JUMP_HACK,
	TELEPORTPLANE_HACK,
};

struct ReportsInfo
{
	uint32 Times;
};
static std::map<uint32, ReportsInfo> reportTimes;

class ClearTimes : public BasicEvent
{
public:
	ClearTimes() {}

	bool Execute(uint64 /*time*/, uint32 /*diff*/)
	{
		reportTimes.clear();
		return true;
	}
};

// GUIDLow is the key.
typedef std::map<uint32, AnticheatData> AnticheatPlayersDataMap;

class AnticheatMgr
{
	friend class ACE_Singleton<AnticheatMgr, ACE_Null_Mutex>;
	AnticheatMgr();

public:
	void StartHackDetection(Player* player, MovementInfo movementInfo, uint32 opcode);

private:
	void SpeedHackDetection(Player* player, MovementInfo movementInfo);
	void FlyHackDetection(Player* player, MovementInfo movementInfo);
	void WalkOnWaterHackDetection(Player* player, MovementInfo movementInfo);
	void JumpHackDetection(Player* player, MovementInfo movementInfo,uint32 opcode);
	void TeleportPlaneHackDetection(Player* player, MovementInfo);
	void ClimbHackDetection(Player* player,MovementInfo movementInfo,uint32 opcode);
	void Alerts(Player* player, uint8 alertType, uint8 hackType);
	void Report(Player* player, uint8 hackType);
	AnticheatPlayersDataMap m_Players;
};
#define sAnticheatMgr ACE_Singleton<AnticheatMgr, ACE_Null_Mutex>::instance()

#endif