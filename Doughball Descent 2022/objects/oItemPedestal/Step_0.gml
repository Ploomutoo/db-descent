if(item = noone) exit;

playerOn = false;
if(abs(y-oPlayer.y)>32) exit;
if(abs(x-oPlayer.x+16)>32) exit;

playerOn = true;

if(cBash) {
	
	var tStacks = instance_number(item);
	if(tStacks>0) with(item) { stacks++; event_user(0); }
	else with(instance_create_depth(0,0,0,item)) {
		
		mountItem(oPlayer.items);
		oPlayer.items++;
		stacks = 1;
		persistent=true;
		bought = true;
		event_user(0);
		
	}
	
	item = noone;
	soundRand(sndAltarUse);
	playerOn = false;
}