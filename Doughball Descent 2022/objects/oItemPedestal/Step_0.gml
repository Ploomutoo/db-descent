if(contained = noone) exit;

playerOn = false;
if(abs(y-oPlayer.y)>32) exit;
if(abs(x-oPlayer.x+16)>32) exit;

playerOn = true;

if(cBash) {
	
	oPause.deactListRemove(contained);
	with(contained) event_user(0);
	contained = noone;
	
	soundRand(sndAltarUse);
	playerOn = false;
}