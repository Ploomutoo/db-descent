event_inherited();

funcHurt = function _hurt(attacker,isStomp)
{	
	if(isStomp)
	{
		with(attacker)
		{
			if(iframes>0) exit
			motion_add(point_direction(other.x,other.y,x,y),6)
			takeDamage()
		}
	}
}