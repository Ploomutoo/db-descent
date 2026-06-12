if(item = noone) exit;

playerOn = false;
with(oPlayer)
{
	var nearest = instance_nearest(x,y,oItemPedestal)	
	with(nearest)
	{
		if(abs(y-oPlayer.y)>32) exit;
		if(abs(x-oPlayer.x+16)>32) exit;
		playerOn = true;
	}
}

if(playerOn && cBash) {
	
	cancelIfLinePresent;
	if(oPlayer.itemPedestalDisallowed > 0) exit;
	
	addItem(item);
	
	item = noone;
	soundRand(sndAltarUse);
	playerOn = false;
	
	instance_destroy();
}