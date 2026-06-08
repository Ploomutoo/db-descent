yDesired = round(y/16)*16

passenger = noone;
drawSprite = -1
hFace = 1

function disengage() 
{
	passenger.y += 16
	passenger.mobile = true;
	passenger.sprite_index = sPlayerHitbox;
	passenger.bashActive = 15;
	passenger.crushes = storedCrush;
	instance_destroy();	
}