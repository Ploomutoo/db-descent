function toLineupH()
{
	state = anubisState.lineupH
	facing = choose(1,-1)
	sprite_index = anubisIdle
	image_index  = 0
	alarm[0] = 240
}

switch(state)
{
	
	case anubisState.lineupH:
	switch(irandom(3))
	{
		case 0:
		case 1:
		state = anubisState.punch
		sprite_index = anubisAtk
		image_index  = 0
		soundRand(sndAnubisPunch)
		break;
		case 2:
		state = anubisState.summonFire
		sprite_index = anubisAtk
		image_index  = 0
		break;
		case 3:
		state = anubisState.castBalls
		castOffset = 96
		sprite_index = anubisCast
		image_index  = 0
		break;
	}
	alarm[0] = 60
	break;
	
	case anubisState.punch:
	state = anubisState.lineupH
	facing *= -1
	sprite_index = anubisIdle
	image_index  = 0
	alarm[0] = 240
	break;
	
	case anubisState.stun:
	toLineupH()
	break;
	
	case anubisState.summonFire:
	soundRand(sndCast)
	instance_create_depth(oPlayer.x,oPlayer.y+128,depth,oGhostfire)
	toLineupH()
	break;
	
	case anubisState.castBalls:
	
	
	if(castOffset < -32)
	{
		toLineupH()
	}
	else 
	{
		soundRand(sndCast)
		var ball = instance_create_depth(x,y,depth,oGhostball)
		ball.facing = facing
		sprite_index = anubisBlast
		alarm[0] = 30
	}
	break;
	
}