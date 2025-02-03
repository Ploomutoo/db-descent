event_inherited()

if(faceDir = 0) faceLeft = irandom(1)
else faceLeft = -faceDir

stompable = false

if(boneLength = 0) boneLength = 1 + irandom(3)

image_xscale = 2 + boneLength
length = 16+image_xscale*16

desSpeed = lerp(3,1,boneLength/4)

if(faceLeft) desSpeed = -desSpeed
else image_xscale = -image_xscale

hspeed = desSpeed

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
		speed = -2
	}
}