//  poo poo pee pee
if(foodTallyOn<foodTypes) exit;

if(calDisplay<oTally.calGot && !audio_is_playing(cdSound)) {
	
	var inc = min(max(ceil((oTally.calGot-calDisplay)/30),7),lvl*xpInc/5)
	calDisplay+=inc;
	if(calDisplay>oTally.calGot) calDisplay = oTally.calGot;
	
	xpCost-=inc;
	if(xpCost<=0) {
		lvl++;
		xpCost += lvl*xpInc;
		
		if(lvl<10) {
			cdSound = audio_play_sound(sndTally3,5,0)
			audio_sound_pitch(cdSound,1+(lvl-2)*0.1)
			
			sinCount = 0
			sinCap = 180
			sinSpeed = 10
			spinTo = image_index+1
			if(spinTo>=image_number) spinTo = 0
			
		} else {
			cdSound = audio_play_sound(sndTally4,5,0)
			if(image_index!=10) {
				sinCount = 0
				sinCap = 180
				sinSpeed = 10
				spinTo = 10
				if(spinTo>=image_number) spinTo = 0
				
			}
		}
	
	} else {
		
		cdSound = audio_play_sound(sndTally2,0,0)
		audio_sound_pitch(cdSound,1+lerp(-0.5,0.5,calDisplay/oTally.calGot));
	}
}

/*if(cRightPressed) {
	sinCount = 0
	sinCap = 180
	sinSpeed = 10
	spinTo = image_index+1
	if(spinTo>=image_number) spinTo = 0
}

if(cLeftPressed) {
	sinCount = 0
	sinCap = 180
	sinSpeed = 10
	spinTo = image_index-1
	if(spinTo<0) spinTo = image_number-1
}*/

if(sinCount<=sinCap) {
	sinCount += sinSpeed
	sinSpeed = max(sinSpeed*0.99,2)
	if(sinCount>sinCap) sinCount = sinCap
	
	spinScale = dcos(sinCount)

	if(image_index!=spinTo) {
		if(sinCount>=sinCap/2) image_index = spinTo;
	} else spinScale = -spinScale
}