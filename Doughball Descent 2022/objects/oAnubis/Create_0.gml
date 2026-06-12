enum anubisState
{
	stun,
	lineupH, //line up horizontally with player
	lineupV,
	punch,
	summonFire,
	castBalls,
	fattening,
	fattened
}
funcHurt = function _hurt(attacker,isStomp)
{	
	if(state = anubisState.stun || state = anubisState.fattening) exit;
	if(isStomp)
	{
		yDesired = y + 64
	}
	else
	{
		xDesired = x - sign(oPlayer.x-x)*96
	}
	state = anubisState.stun
	sprite_index = anubisStun
	soundRand(sndAnubisPain)
	alarm[0] = 30
}

offerings = 0

xDesired = 0
yDesired = 0

state = anubisState.lineupH
facing = 1
alarm[0] = 240

castOffset = 96
fallSpeed  = 3
layer = layer_create(depth-100,"anubis")

function enterFattening()
{
	if(state = anubisState.fattening || state = anubisState.fattened) exit;
	
	offerings++
	
	if(offerings >= 3+loop*2)
	{
		soundRand(sndBurp)
		state = anubisState.fattening
		sprite_index = sAnubisFatten
		image_index = 0
		castOffset = 0
	}
	else
	{
		soundRand(sndFood)	
	}
}

function fattenEnd()
{
	if(!steam_get_achievement("Jackal of All Trades!")) steam_set_achievement("Jackal of All Trades!")
	with(oPlayer) if(y<endHeight) y = endHeight
}