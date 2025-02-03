event_inherited()
turnedCooldown = 0
mobile = true

funcHurt = function _hurt(attacker,isStomp)
{	
	if(isStomp)
	{	
		if(attacker.weight>300 && attacker.crushes>=1)
		{
			attacker.crushes-=1;
			playerKill(self);
			oTally.foesBomped++
			instance_destroy();
		}
		else 
		{
			with(attacker)
			{
				if(iframes>0) exit
				crushes = 0
				vspeed = -6
			}
			alarm[0] = room_speed/2
		}
	}
	else
	{
		alarm[0] = room_speed/3
	}
	
	hspeed = sign(x-attacker.x)
	sprite_index = sBigWormBounce;
	mobile = false;
}