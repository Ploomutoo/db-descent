if(cUp) {
	cursorOn--
	if(cursorOn<0) cursorOn = array_length(menu)-1
	
	event_user(0)
} else if (cDown) {
	cursorOn++
	if(cursorOn>=array_length(menu)) cursorOn = 0
	
	event_user(0)
}

if(aPos>=1) exit;

aOutput = animcurve_channel_evaluate(aChannel,aPos)
aPos += 0.05

aOutput = 1 + aOutput/4

image_xscale = 1/aOutput
image_yscale = aOutput