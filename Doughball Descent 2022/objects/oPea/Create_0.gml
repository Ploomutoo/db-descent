calories = 0
reflected = false
stompable = true

funcHurt = function _hurt(attacker,isStomp)
{	
	if(isStomp)
	{
		instance_destroy();
	}
	else
	{
		hspeed = 5*oPlayer.hFace
		reflected = true
	}
}