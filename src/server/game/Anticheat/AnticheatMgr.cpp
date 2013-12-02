#include "AnticheatMgr.h"

#define CLIMB_ANGLE 1.9f

AnticheatMgr::AnticheatMgr()
{
}

void AnticheatMgr::JumpHackDetection(Player* player, MovementInfo movementInfo,uint32 opcode)
{
	uint32 key = player->GetGUIDLow();

	if (m_Players[key].GetLastOpcode() == MSG_MOVE_JUMP && opcode == MSG_MOVE_JUMP)
	{
		Report(player, JUMP_HACK);
	}
}

void AnticheatMgr::WalkOnWaterHackDetection(Player* player, MovementInfo movementInfo)
{
	uint32 key = player->GetGUIDLow();
	if (!m_Players[key].GetLastMovementInfo().HasMovementFlag(MOVEMENTFLAG_WATERWALKING))
		return;

	// If we are a ghost we can walk on water
	if (!player->IsAlive())
		return;

	if (player->HasAuraType(SPELL_AURA_FEATHER_FALL) ||
		player->HasAuraType(SPELL_AURA_SAFE_FALL) ||
		player->HasAuraType(SPELL_AURA_WATER_WALK))
		return;
	Report(player, WALKWATER_HACK);
}

void AnticheatMgr::FlyHackDetection(Player* player, MovementInfo movementInfo)
{
	uint32 key = player->GetGUIDLow();
	if (!m_Players[key].GetLastMovementInfo().HasMovementFlag(MOVEMENTFLAG_FLYING))
		return;

	if (player->HasAuraType(SPELL_AURA_FLY) ||
		player->HasAuraType(SPELL_AURA_MOD_INCREASE_MOUNTED_FLIGHT_SPEED) ||
		player->HasAuraType(SPELL_AURA_MOD_INCREASE_FLIGHT_SPEED))
		return;
	Report(player, FLY_HACK);
}

void AnticheatMgr::TeleportPlaneHackDetection(Player* player, MovementInfo movementInfo)
{
	uint32 key = player->GetGUIDLow();

	if (m_Players[key].GetLastMovementInfo().pos.GetPositionZ() != 0 ||
		movementInfo.pos.GetPositionZ() != 0)
		return;

	if (movementInfo.HasMovementFlag(MOVEMENTFLAG_FALLING))
		return;

	//DEAD_FALLING was deprecated
	//if (player->getDeathState() == DEAD_FALLING)
	// return;
	float x, y, z;
	player->GetPosition(x, y, z);
	float ground_Z = player->GetMap()->GetHeight(x, y, z);
	float z_diff = fabs(ground_Z - z);

	// we are not really walking there
	if (z_diff > 1.0f)
	{
		Report(player, TELEPORTPLANE_HACK);
	}
}

// basic detection
void AnticheatMgr::ClimbHackDetection(Player *player, MovementInfo movementInfo, uint32 opcode)
{
	uint32 key = player->GetGUIDLow();

	if (opcode != MSG_MOVE_HEARTBEAT ||
		m_Players[key].GetLastOpcode() != MSG_MOVE_HEARTBEAT)
		return;

	// in this case we don't care if they are "legal" flags, they are handled in another parts of the Anticheat Manager.
	if (player->IsInWater() ||
		player->IsFlying() ||
		player->IsFalling())
		return;

	Position playerPos;
	player->GetPosition(&playerPos);

	float deltaZ = fabs(playerPos.GetPositionZ() - movementInfo.pos.GetPositionZ());
	float deltaXY = movementInfo.pos.GetExactDist2d(&playerPos);

	float angle = Position::NormalizeOrientation(tan(deltaZ/deltaXY));

	if (angle > CLIMB_ANGLE)
	{
		Report(player, WALLCLIMB_HACK);
	}
}

void AnticheatMgr::SpeedHackDetection(Player* player,MovementInfo movementInfo)
{
	uint32 key = player->GetGUIDLow();

	// We also must check the map because the movementFlag can be modified by the client.
	// If we just check the flag, they could always add that flag and always skip the speed hacking detection.
	// 369 == DEEPRUN TRAM
	if (m_Players[key].GetLastMovementInfo().HasMovementFlag(MOVEMENTFLAG_ONTRANSPORT) && player->GetMapId() == 369)
		return;

	uint32 distance2D = (uint32)movementInfo.pos.GetExactDist2d(&m_Players[key].GetLastMovementInfo().pos);
	uint8 moveType = 0;

	// we need to know HOW is the player moving
	// TO-DO: Should we check the incoming movement flags?
	if (player->HasUnitMovementFlag(MOVEMENTFLAG_SWIMMING))
		moveType = MOVE_SWIM;
	else if (player->IsFlying())
		moveType = MOVE_FLIGHT;
	else if (player->HasUnitMovementFlag(MOVEMENTFLAG_WALKING))
		moveType = MOVE_WALK;
	else
		moveType = MOVE_RUN;

	// how many yards the player can do in one sec.
	uint32 speedRate = (uint32)(player->GetSpeed(UnitMoveType(moveType)) + movementInfo.jump.xyspeed);

	// how long the player took to move to here.
	uint32 timeDiff = getMSTimeDiff(m_Players[key].GetLastMovementInfo().time,movementInfo.time);

	if (!timeDiff)
		timeDiff = 1;

	// this is the distance doable by the player in 1 sec, using the time done to move to this point.
	uint32 clientSpeedRate = distance2D * 1000 / timeDiff;

	// we did the (uint32) cast to accept a margin of tolerance
	if (clientSpeedRate > speedRate)
	{
		Report(player, SPEED_HACK);
	}
}

void AnticheatMgr::Alerts(Player* player, uint8 alertType, uint8 hackType)
{
	std::string hType = "";

	switch(hackType)
	{
	case SPEED_HACK:
		hType = "Speed";
		break;

	case FLY_HACK:
		hType = "Fly";
		break;

	case WALKWATER_HACK:
		hType = "WalkOnWater";
		break;

	case WALLCLIMB_HACK:
		hType = "WallClimb";
		break;

	case JUMP_HACK:
		hType = "Jump";
		break;

	case TELEPORTPLANE_HACK:
		hType = "TeleportPlane";
		break;

	default:
		hType = "Unknown";
	}

}

void AnticheatMgr::Report(Player* player, uint8 hackType)
{
	uint32 _times;
	_times = player->GetGUID();

	player->m_Events.AddEvent(new ClearTimes(), player->m_Events.CalculateTime(10000));
	reportTimes[_times].Times++;

	switch(reportTimes[_times].Times)
	{
	case 2:
		Alerts(player, 0, hackType);
		break;
	case 3:
		Alerts(player, 0, hackType);
		break;
	case 4:
		Alerts(player, 1, hackType);
		break;
	case 5:
		reportTimes.clear();
		Alerts(player, 2, hackType);
		player->GetSession()->KickPlayer(); // Here you can change the punishment you want.
		break;
	}
}

void AnticheatMgr::StartHackDetection(Player* player, MovementInfo movementInfo, uint32 opcode)
{
	bool enable = sConfigMgr->GetBoolDefault("Anticheat.Enable", false);

	if (!enable)
		return;

	if (player->GetSession()->GetSecurity() > 0)
		return;

	uint32 key = player->GetGUIDLow();

	if (player->IsInFlight() || player->GetTransport() || player->GetVehicle())
	{
		m_Players[key].SetLastMovementInfo(movementInfo);
		m_Players[key].SetLastOpcode(opcode);
		return;
	}

	SpeedHackDetection(player,movementInfo);
	FlyHackDetection(player,movementInfo);
	WalkOnWaterHackDetection(player,movementInfo);
	JumpHackDetection(player,movementInfo,opcode);
	TeleportPlaneHackDetection(player, movementInfo);
	ClimbHackDetection(player,movementInfo,opcode);

	m_Players[key].SetLastMovementInfo(movementInfo);
	m_Players[key].SetLastOpcode(opcode);
}