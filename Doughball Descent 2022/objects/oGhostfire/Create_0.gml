onDestroy = true

funcHurt = function _hurt(attacker,isStomp)
{	
	if(isStomp)
	{
		with(attacker) takeDamage()	
		targetScale = 0
	}
}

image_xscale = 0
targetScale = 4