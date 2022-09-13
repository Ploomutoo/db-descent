if(item = noone) exit;

playerOn = false;
if(abs(y-oPlayer.y)>32) exit;
if(abs(x-oPlayer.x+16)>32) exit;

playerOn = true;

if(cBash) {
	
	addItem(item);
	
	item = noone;
	soundRand(sndAltarUse);
	playerOn = false;
}