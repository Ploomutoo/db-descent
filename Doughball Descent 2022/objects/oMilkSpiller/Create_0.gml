event_inherited();

//#macro milkSpillInterval 32

spillTimer = spillInterval-spillOffset
milkSpillDepth = 1 
milkTick = 4

image_speed = 0
image_index = 0

hitFunc = function()
{
	if(alarm[0]<1)
	{
		alarm[0]=10;
		image_index = 4
		spillTimer = 0
		createParticles(x+16,y+16,5,sPaMilkSpill)
		soundRand(sndTileInvulnerable)	
	}
}