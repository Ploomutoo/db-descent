onDestroy = true;
tilemap_set_at_pixel(tileMap,4,x,y)

hitFunc = function(isBash,executor)
{
	
	with(executor)
	{
		if(isBash) hspeed = -hFace*5
		else if(vspeed>0)
		{
			if(y>other.y || cDownHeld) return(0)
			vspeed = -vspeed-10
			//y+=vspeed;
			grounded = false;
			loGrav(0.1,0.5)
			crushes  = crushMax
		}
	}
	soundRand(sndGummyLand)
}