#include "AnticheatData.h"

AnticheatData::AnticheatData()
{
}

void AnticheatData::SetLastOpcode(uint32 opcode)
{
	lastOpcode = opcode;
}

void AnticheatData::SetPosition(float x, float y, float z, float o)
{
	lastMovementInfo.pos.m_positionX = x;
	lastMovementInfo.pos.m_positionY = y;
	lastMovementInfo.pos.m_positionZ = z;
	lastMovementInfo.pos.m_orientation = o;
}

uint32 AnticheatData::GetLastOpcode() const
{
	return lastOpcode;
}

const MovementInfo& AnticheatData::GetLastMovementInfo() const
{
	return lastMovementInfo;
}

void AnticheatData::SetLastMovementInfo(MovementInfo& moveInfo)
{
	lastMovementInfo = moveInfo;
}