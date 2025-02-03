if (!paused) instance_deactivate_object(self)
if (unpauseGrace>0) {
	unpauseGrace--;
	exit;
}

if(cBash) {
	
	if(cursorOn>furthestZone) {
		soundRand(sndLocked)
		exit;
	}
	
	audio_stop_sound(musLevel0)
	
	instance_activate_all()
	level = cursorOn*3
	
	makePlayer();
		
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
