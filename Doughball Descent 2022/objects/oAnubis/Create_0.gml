enum anubisState
{
	stun,
	lineupH, //line up horizontally with player
	lineupV,
	punch,
	summonFire,
	castBalls
}
funcHurt = function _hurt(attacker,isStomp)
{	
	if(state = anubisState.stun) exit;
	if(isStomp)
	{
		yDesired = y + 64
	}
	else
	{
		//show_debug_message("bashed")
		xDesired = x - sign(oPlayer.x-x)*96
	}
	state = anubisState.stun
	sprite_index = anubisStun
	alarm[0] = 30
}

xDesired = 0
yDesired = 0

state = anubisState.lineupH
facing = 1
alarm[0] = 240

castOffset = 96