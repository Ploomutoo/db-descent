if (!paused) instance_deactivate_object(self)
if (unpauseGrace>0) {
	unpauseGrace--;
	exit;
}

if(cBash) {
	
	audio_stop_sound(musLevel0)
	
	instance_activate_all()
	instance_create_layer(-280,0,"instances",oSidebarL)
	level = cursorOn*3
	var player = instance_create_layer(320,-96,"instances",oPlayer)
	with(player) altarInstantiate()
		
	room_goto(rGame)
	window_set_cursor(cr_none)
	instance_destroy()
}

if(cUp) {
	cursorOn--
	if(cursorOn<0) cursorOn = 4
	
	unpauseGrace=5
	soundRand(sndTally)
	
} else if (cDown) {
	cursorOn++
	if(cursorOn>4) cursorOn = 0
	
	unpauseGrace=5
	soundRand(sndTally)
	
}
