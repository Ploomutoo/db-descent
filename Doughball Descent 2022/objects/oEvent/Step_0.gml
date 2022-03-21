function exitEvent() {
	state = -1
	image_index = 0
	image_speed = 0
	oPlayer.mobile = true;
}

if(cBash) {
	
	switch(state) {
	
	case -1:
	break;
	case 0:		
		if(abs(y-oPlayer.y)>2) exit;
		if(abs(x-oPlayer.x)>48) exit;
		cancelIfLinePresent
		
		oPlayer.mobile = false;
		
		oTextBox.voice = talkEvent
		oTextBox.announce(0,event.txExposition)
		state++
	break;
	case 1:
		cancelIfLinePresent
		choice = 1
		state++
	break;
	case 2:
	
		oTextBox.voice = talkEvent
		if(choice) {
		oTextBox.announce(0,event.txAttempt);
		state++
		} else {
		oTextBox.announce(0,event.txDecline);
		exitEvent();
		}
	break;
	case 3:
		cancelIfLinePresent
		audio_play_sound(sndEvent,10,0)
		instance_create_depth(x+80,y,depth,oItemPedestal)
		exitEvent();
	break;
	
	}
}