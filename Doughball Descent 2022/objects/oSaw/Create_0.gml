event_inherited()
stompable = false

anchorX = x
anchorY = y

if(chainLength = 0) chainLength = 1+irandom(3)
if(chainAngle = 0) chainAngle = irandom(360)

if(chainSpeed = 0) chainSpeed = 6/chainLength

turnedCooldown = 0;

funcHurt = function _hurt(attacker,isStomp)
{	
	if(turnedCooldown>0) exit;
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
		chainSpeed = -chainSpeed
		turnedCooldown = 10;
	}
}