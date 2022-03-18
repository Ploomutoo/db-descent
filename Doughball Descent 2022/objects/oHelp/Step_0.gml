if(!paused) exit;

if(unpauseGrace<=0 && cBash){
	
	if(screen = 0) screen = 1
	else event_user(0)
} else unpauseGrace--

if(cLeftPressed) {
	cursorOn--
	if(cursorOn<0) cursorOn = 2
} else if (cRightPressed) {
	cursorOn++
	if(cursorOn>2) cursorOn = 0
}