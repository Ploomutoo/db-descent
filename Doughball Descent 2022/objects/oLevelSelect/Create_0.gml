unpauseGrace = 3;
cursorOn = 0;
paused = false;

zonePreviews = [sBgBread,sBgProduce,sBgCow,sBgMeat,sBgDessert];
zoneWorm = [sGoomba,sDurSlug,sUdder,sGoombaPara,sGummyWorm];

ini_open("config.ini")
furthestZone = ini_read_real("general","zoneUnlock",1)-1

wormFrames = sprite_get_number(zoneWorm[0])
wfOn = 0
for(var i = 0; i<array_length(zoneWorm); i++){
	
	if(i>furthestZone) zoneWorm[i] = sLock32;
	if(wormFrames%sprite_get_number(zoneWorm[i])) wormFrames = wormFrames*sprite_get_number(zoneWorm[i])
}

ini_close()
//show_debug_message("Worm Frames "+string(wormFrames))
instance_deactivate_object(self);
