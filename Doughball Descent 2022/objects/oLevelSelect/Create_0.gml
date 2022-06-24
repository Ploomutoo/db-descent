unpauseGrace = 3;
cursorOn = 0;
paused = false;

zonePreviews = [sBgBread,sBgProduce,sBgCow,sBgMeat,sBgDessert];
zoneWorm = [sGoomba,sDurSlug,sUdder,sGoombaPara,sGummyWorm];

wormFrames = sprite_get_number(zoneWorm[0])
wfOn = 0
for(var i = 0; i<array_length(zoneWorm); i++){
	
	if(wormFrames%sprite_get_number(zoneWorm[i])) wormFrames = wormFrames*sprite_get_number(zoneWorm[i])
}

show_debug_message("Worm Frames "+string(wormFrames))
instance_deactivate_object(self);

