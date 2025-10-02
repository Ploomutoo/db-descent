onDestroy = true
hDir = 1

sCount = 90

danger = false

funcHurt = function _hurt(attacker,isBash)
{
	if(!isBash)
	{
		hDir = oPlayer.hFace
	}
	else
	{
		//attacker.vspeed = -6	
	}
}