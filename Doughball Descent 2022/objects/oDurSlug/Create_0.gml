event_inherited()
turnedCooldown = 0
stompable = false

funcHurt = function _hurt(attacker,isStomp)
{	
	if(isStomp)
	{
		with(attacker)
		{
			if(iframes>0) exit
			vspeed = -6
			takeDamage()
		}
	}
	else
	{
		playerKill(self);
		oTally.foesBomped++

		instance_destroy();
	}
}