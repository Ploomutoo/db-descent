if (!paused) instance_deactivate_object(self)
if (unpauseGrace>0) {
	unpauseGrace--;
	exit;
}

if(cBash) {
	if(state = 0)
	{
		chosenChar = cursorOn
		state = 1
		cursorOn = 0
	}
	else if(state = 1)
	{
			if(cursorOn>furthestZone) {
			soundRand(sndLocked)
			exit;
		}
	
		audio_stop_sound(musLevel0)
	
		instance_activate_all()
		level = cursorOn*3
		//if(keyboard_check(vk_shift)) level = 15
		global.chosenStart = level;
	
		makePlayer();
		instantiateFood();
		
		room_goto(rGame)
		window_set_cursor(cr_none)
		instance_destroy()
	}
}
var cursorLast = 4
if(state = 0) cursorLast = 3

if(cUp || cLeftPressed) {
	cursorOn--
	if(cursorOn<0) cursorOn = cursorLast
	
	unpauseGrace=5
	soundRand(sndTally)
	
} else if (cDown || cRightPressed) {
	cursorOn++
	if(cursorOn>cursorLast) cursorOn = 0
	
	unpauseGrace=5
	soundRand(sndTally)
	
}
